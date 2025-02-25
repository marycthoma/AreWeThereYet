/***************************
Step 1. Load dataset full dataset (lines 9-11)
Step 2. Restrict dataset to 65-80 year-olds at baseline (line 13)
Step 3. Run all models among 65-80 year-olds at baseline
Step 4. Clear data; re-load full dataset (lines 9-11)
Step 5. Restrict dataset to >80 year-olds at baseline (line 14)
Step 6. Run all models among >80 year-olds at baseline  */

clear
global path "set-file-path"
use "$path/AWTY_long_dataset"

drop if rbaseage_65 >15
/*drop if rbaseage_65 <= 15 */ /*READ THIS LINE (WITH LINE 7 HIDDEN) TO RUN MODELS AMONG >80 Y/OS*/


*DEMOGRAPHIC RISK FACTORS

*TWO WAVE
	*Model 1
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat if wave==8 | wave==9 || hhidpn: yrs_since_enroll


	*Model 2
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.male if wave==8 | wave==9 || hhidpn: yrs_since_enroll

	*Model 3
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.race  if wave==8 | wave==9 || hhidpn: yrs_since_enroll


	*Model 4
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.edu_cat  if wave==8 | wave==9 || hhidpn: yrs_since_enroll


*THREE WAVE
	*Model 1
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll

	*Model 2
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.male if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll

	*Model 3
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.race  if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll

	*Model 4
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.edu_cat  if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll


*FOUR WAVE
	*Model 1
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll

	*Model 2
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.male if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll

	*Model 3
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.race  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll

	*Model 4
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.edu_cat  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll


*FIVE WAVE
	*Model 1
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll

	*Model 2
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.male if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll

	*Model 3
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.race  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll

	*Model 4
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.edu_cat  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll


*SIX WAVE
	*Model 1
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll

	*Model 2
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.male if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll

	*Model 3
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.race  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll

	*Model 4
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.edu_cat  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll


*SEVEN WAVE
	*Model 1
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat || hhidpn: yrs_since_enroll

	*Model 2
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.male || hhidpn: yrs_since_enroll

	*Model 3
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.race || hhidpn: yrs_since_enroll

	*Model 4
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat c.yrs_since_enroll#i.edu_cat || hhidpn: yrs_since_enroll



*ADULT LIFE RISK FACTORS


*TWO WAVE
	*Adult vars
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 || hhidpn: yrs_since_enroll

	*diabetes int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_diab  if wave==8 | wave==9 || hhidpn: yrs_since_enroll

	*stroke int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_stroke if wave==8 | wave==9 || hhidpn: yrs_since_enroll

	*neighborhood safety int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8neighb_safe  if wave==8 | wave==9 || hhidpn: yrs_since_enroll

	*depression int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8dep if wave==8 | wave==9 || hhidpn: yrs_since_enroll



*THREE WAVE
	*Adult vars
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll

	*diabetes int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_diab  if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll

	*stroke int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_stroke  if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll

	*neighborhood safety int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8neighb_safe  if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll

	*depression int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8dep  if wave==8 | wave==9 | wave==10 || hhidpn: yrs_since_enroll



*FOUR WAVE
	*Adult vars
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll

	*diabetes int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_diab  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll

	*stroke int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_stroke  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll

	*neighborhood safety int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8neighb_safe  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll

	*depression int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8dep  if wave==8 | wave==9 | wave==10 | wave==11 || hhidpn: yrs_since_enroll



*FIVE WAVE
	*Adult vars
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll

	*diabetes int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_diab  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll

	*stroke int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_stroke  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll

	*neighborhood safety int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8neighb_safe  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll

	*depression int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8dep  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 || hhidpn: yrs_since_enroll



*SIX WAVE
	*Adult vars
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll

	*diabetes int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_diab  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll

	*stroke int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_stroke  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll

	*neighborhood safety int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8neighb_safe  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll

	*depression int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8dep  if wave==8 | wave==9 | wave==10 | wave==11 | wave==12 | wave==13 || hhidpn: yrs_since_enroll



*SEVEN WAVE
	*Adult vars
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep || hhidpn: yrs_since_enroll

	*diabetes int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_diab || hhidpn: yrs_since_enroll

	*stroke int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8ever_stroke  || hhidpn: yrs_since_enroll

	*neighborhood safety int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8neighb_safe  || hhidpn: yrs_since_enroll

	*depression int. 
mixed z_cogtot c.rbaseage_65 c.yrs_since_enroll i.male i.race i.edu_cat r8ever_diab r8ever_stroke r8neighb_safe i.r8dep c.yrs_since_enroll#i.r8dep  || hhidpn: yrs_since_enroll
