/*Designate path to datasets*/
global path "set-file-path"

*********************************************************************************
* Step 1: Load and merge all relevant HRS and RAND datasets                     *
*********************************************************************************

	
	*Retrieve measure of neighborhood safety (measured at household level) from H06H_H. HHID + KSUBHH uniquely identifies each household. 
use HHID KSUBHH KH150 ///
using "$path/H06H_H.dta"
gen hhidsubhh = HHID + KSUBHH
save "$path/w8_neighbsafety", replace

	*Use H06PR_R to link household-level measure of neigbhorhood safety to individual participants. HHID + KSUBHH uniquely idenfies each household. HHID + PN uniquely idenfies each participant. HHID+PN must be de-stringed to merge with RAND files. 
	use HHID KSUBHH PN ///
	using "$path/H06PR_R"
	gen hhidsubhh = HHID + KSUBHH
	gen hhidpn_char = HHID + PN
	destring hhidpn_char, gen(hhidpn) 
	save "$path/w8_pr", replace

	use "w8_neighbsafety"
	merge 1:m hhidsubhh using "$path/w8_pr", nogenerate
	save "$path/w8_neighbsafety_pr", replace



use hhidpn ragender raracem rahispan raedyrs raeduc /// /*baseline demographic predictors*/
	r8cesd /// /*depression*/
	r8stroke /// /*reports ever-stroke*/
	r8diabe /// /*reports ever-diabetes*/
	r8agem_m r9agem_m r10agem_m r11agem_m r12agem_m r13agem_m r14agem_m /// /*age in months at mid-interview date*/
	r8cogtot r9cogtot r10cogtot r11cogtot r12cogtot r13cogtot r14cogtot /// /*cognition*/ 
	r1iwstat r2iwstat r3iwstat r4iwstat r5iwstat r6iwstat r7iwstat r8iwstat r9iwstat r10iwstat r11iwstat r12iwstat r13iwstat r14iwstat /// *dead/alive/responsive*/
using "$path/randhrs1992_2018v2.dta"

merge 1:1 hhidpn using "$path/w8_neighbsafety_pr", assert(3) 

table(r8iwstat)
/*For study flow diagram:
	All participants enrolled in HRS up to and including 2006: 42,233 (total) - 11,764 ("inap" [not yet entered study by 2006]) = 30,469 
	Died before 2006: 6925 ("died prev wave" [any prev wave]) + 1384 ("died this wave" [i.e. between prev wave and 2006])= 8309
	Dropped out of study before 2006: 1494 ("dropped from sample")
	Non-response in 2006: 2196 ("nr,alive") + 1 ("nr,dk if alive or dead") = 2197
	all HRS respondents in 2006: 18469 ("resp,alive")
*/

keep if r8iwstat==1 /*Responsive,alive*/

save "$path/RAND_HRS merge", replace

*********************************************************************************
* Step 2: Create variables									                    *
*********************************************************************************

use "$path/RAND_HRS merge"

*Time-invariant variables:

	*Age at baseline (centered at 65)
gen rbaseage_65 = (r8agem_m/12)-65

gen dropage = 0
replace dropage = 1 if rbaseage_65 <0
replace dropage=. if rbaseage_65>=.

table(dropage), missing /*For study flow diagram: <65 y/o in 2006: 7073 */

drop if rbaseage_65 < 0 /*Drop participants under 65 in 2006*/


	*Gender (1=male, 0=female)
gen male=1 if ragender==1
	replace male=0 if ragender==2
	replace male=. if ragender >=.
	
	*Race 
gen race = . if raracem >=.
	replace race = 0 if raracem == 1 /*0 = Non-Hispanic White*/
	replace race = 1 if raracem == 2 /*1 = Non-Hispanic Black*/
	replace race = 3 if raracem == 3 /*3 = Non-Hispanic Other*/	
	replace race = 2 if rahispan == 1 /*2 = Hispanic*/
	
label define race 0 "Non-Hispanic race" 1 "Non-Hispanic Black" 2 "Hispanic" 3 "Other" 

	*Ever stroke
rename r8stroke r8ever_stroke

	*Ever diabetes
rename r8diabe r8ever_diab
	
	*Education (continuous, no. yrs centered at 12)
gen redu_12 = raedyrs-12

	*Categorical ed. 
gen edu_cat = 0 if raedyrs >= 0 
	replace edu_cat=1 if raedyrs >= 9 
	replace edu_cat=2 if raedyrs >= 12
	replace edu_cat=3 if raedyrs >= 13
	replace edu_cat=4 if raedyrs >= 16
	replace edu_cat=. if raedyrs >=.

	*Neighborhood safety
gen r8neighb_safe = 1 if KH150 >=0
	replace r8neighb_safe = 0 if KH150 >=4
	replace r8neighb_safe = . if KH150 >=8
	
	*Depression
gen r8dep = 0 if r8cesd < 3
	replace r8dep = 1 if r8cesd >=3
	replace r8dep = . if r8cesd >=.
	
	*Missing covariate data
gen misscovar = 0
replace misscovar = 1 if male>. | race>=. | rbaseage_65 >=. | raedyrs >=. | r8ever_stroke >=. | r8ever_diab >= . | r8cesd >=. | r8neighb_safe >=.


	
drop if r8cogtot>=. /*For study flow diagram: 1015 dropped*/

table(misscovar), missing /*For study flow diagram: 172 missing - total missing cognitive or covar data in 2006 = 1015 + 172  = 1187*/

drop if misscovar==1

*Reshape data to long, create time-varying variables
reshape long r@agem_m r@cogtot r@iwstat, i(hhidpn) j(wave)
drop if wave<8

	*Age in years
gen r_age = ragem_m/12
	
	*Age in years, centered at 65
gen r_age_65 = r_age-65

	*Years since baseline (2004, wave 8)
gen yrs_since_enroll = 2*(wave-8)

	*Cognition, z-scored
egen avg_cogtot=mean(rcogtot)
egen sd_cogtot=sd(rcogtot)
gen z_cogtot=(rcogtot-avg_cogtot)/sd_cogtot


xtset hhidpn wave
gen cogmiss = 1 if rcogtot >=.
	replace cogmiss = 0 if rcogtot < .

save "$path/AWTY_long_dataset", replace




*TABLE 1

*65-80
clear
use "$path/AWTY_long_dataset"
drop if rbaseage_65 >15

gen miss=0
replace miss=1 if rcogtot>=. | r_age_65>=. | male>=. | race>=. | edu_cat>=. | r8ever_diab>=. | r8ever_stroke>=. | r8neighb_safe>=. | r8dep >=. | rbaseage_65>=.

table miss wave 
table riwstat wave
table male wave  if miss==0
table race wave  if miss==0
table edu_cat wave  if miss==0
table r8ever_diab wave  if miss==0
table r8ever_stroke wave  if miss==0
table r8neighb_safe wave  if miss==0
table r8dep wave  if miss==0
sort wave
by wave: summarize r_age if miss==0

*65-80
clear
use "$path/AWTY_long_dataset"
drop if rbaseage_65 <=15

gen miss=0
replace miss=1 if rcogtot>=. | r_age_65>=. | male>=. | race>=. | edu_cat>=. | r8ever_diab>=. | r8ever_stroke>=. | r8neighb_safe>=. | r8dep >=.

table miss wave 
table riwstat wave 
table male wave  if miss==0
table race wave  if miss==0
table edu_cat wave  if miss==0
table r8ever_diab wave  if miss==0
table r8ever_stroke wave  if miss==0
table r8neighb_safe wave  if miss==0
table r8dep wave  if miss==0
sort wave
by wave: summarize r_age if miss==0
