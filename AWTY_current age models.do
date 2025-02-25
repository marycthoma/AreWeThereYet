/********************************************************************
*  Step 1. Load dataset full dataset (lines 9-11)					*
*  Step 2. Restrict dataset to 65-80 year-olds at baseline (line 13)*
*  Step 3. Run all models among 65-80 year-olds at baseline			*
*  Step 4. Clear data; re-load full dataset (lines 9-11)			*
*  Step 5. Restrict dataset to >80 year-olds at baseline (line 14)	*
*  Step 6. Run all models among >80 year-olds at baseline  			*
*********************************************************************/

clear
global path "set-file-path"
use "$path/AWTY_long_dataset"

drop if rbaseage_65 >15
/*drop if rbaseage_65 <= 15 */ /*READ THIS LINE (WITH LINE 7 HIDDEN) TO RUN MODELS AMONG >80 Y/OS*/


*DEMOGRAPHIC RISK FACTORS

*ONE WAVE
	*Model 1
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat if wave==8

	*Model 2
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.male if wave==8

	*Model 3
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.race  if wave==8

	*Model 4
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.edu_cat  if wave==8


*TWO WAVE
	*Model 1
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat if wave==8 | wave==9 || hhidpn: r_age_65

	*Model 2
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.male if wave==8 | wave==9 || hhidpn: r_age_65

	*Model 3
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.race  if wave==8 | wave==9 || hhidpn: r_age_65


	*Model 4
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.edu_cat  if wave==8 | wave==9 || hhidpn: r_age_65


*THREE WAVE
	*Model 1
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65

	*Model 2
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.male if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65

	*Model 3
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.race  if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65

	*Model 4
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.edu_cat  if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65


*FOUR WAVE
	*Model 1
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65

	*Model 2
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.male if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65

	*Model 3
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.race  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65

	*Model 4
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.edu_cat  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65


*FIVE WAVE
	*Model 1
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65

	*Model 2
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.male if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65

	*Model 3
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.race  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65

	*Model 4
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.edu_cat  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65


*SIX WAVE
	*Model 1
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65

	*Model 2
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.male if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65

	*Model 3
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.race  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65

	*Model 4
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.edu_cat  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65


*SEVEN WAVE
	*Model 1
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat || hhidpn: r_age_65

	*Model 2
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.male || hhidpn: r_age_65

	*Model 3
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.race  || hhidpn: r_age_65

	*Model 4
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat c.r_age_65#i.edu_cat  || hhidpn: r_age_65




*ADULT LIFE RISK FACTORS

*ONE WAVE
	*Adult vars
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8

	*diabetes int.
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_diab if wave==8

	*stroke int. 
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_stroke if wave==8

	*neighborhood safety int. 
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8neighb_safe  if wave==8

	*depression int. 
reg z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8dep if wave==8


*TWO WAVE
	*Adult vars
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 || hhidpn: r_age_65

	*diabetes int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_diab  if wave==8 | wave==9 || hhidpn: r_age_65

	*stroke int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_stroke if wave==8 | wave==9 || hhidpn: r_age_65

	*neighborhood safety int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8neighb_safe  if wave==8 | wave==9 || hhidpn: r_age_65

	*depression int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8dep if wave==8 | wave==9 || hhidpn: r_age_65



*THREE WAVE
	*Adult vars
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65

	*diabetes int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_diab  if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65

	*stroke int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_stroke  if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65

	*neighborhood safety int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8neighb_safe  if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65

	*depression int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8dep  if wave==8 | wave==9 | wave==10 || hhidpn: r_age_65



*FOUR WAVE
	*Adult vars
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65

	*diabetes int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_diab  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65

	*stroke int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_stroke  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65

	*neighborhood safety int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8neighb_safe  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65

	*depression int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8dep  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: r_age_65



*FIVE WAVE
	*Adult vars
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65

	*diabetes int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_diab  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65

	*stroke int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_stroke  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65

	*neighborhood safety int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8neighb_safe  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65

	*depression int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8dep  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: r_age_65



*SIX WAVE
	*Adult vars
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65

	*diabetes int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_diab  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65

	*stroke int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_stroke  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65

	*neighborhood safety int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8neighb_safe  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65

	*depression int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8dep  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: r_age_65



*SEVEN WAVE
	*Model 1
	*Adult vars
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep || hhidpn: r_age_65

	*diabetes int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_diab  || hhidpn: r_age_65

	*stroke int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8ever_stroke || hhidpn: r_age_65

	*neighborhood safety int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8neighb_safe  || hhidpn: r_age_65

	*depression int. 
mixed z_cogtot c.r_age_65 i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.r_age_65#i.r8dep  || hhidpn: r_age_65
