#!/bin/bash

# ------------------------------------------------------------------------------
# Script name:  get_DICE.sh
#
# Description:  Script to concatenate all the DICE for lesion hemis into one csv
#
# Author:       Hanna Willis, 6/12/23

# ------------------------ SET SUBJS ------------------------
all_subj='R001 R004 R005 R006 R007 R008 R009 R011 R012 R019 R020 R024 R002 R003 R010 R013 R014 R015 R017 R018 R022 R023'
left_subj='R001 R004 R005 R006 R007 R008 R009 R011 R012 R019 R020 R024'
right_subj='R002 R003 R010 R013 R014 R015 R017 R018 R022 R023'

HOME=/Users/hwillis_admin/Desktop/OneDrive*Nexus365/Hemianopia_Rehab_Data/Patients/MRI/Analysis/diffusion/data/quality/dice_pul_sc/proj-62e7ac5dd72146e3123d7269

# ------------------------ ADD HEADER TO CSV ------------------------
cd $HOME
echo 'subj, timepoint, DSC, wDSC, J, sens, TP, FP, FN' > all_dice.csv

# ------------------------ RUN THROUGH ALL SUBJ ------------------------
for subj in $all_subj
do
for timepoint in no_train baseline 6month
do 
# Set location for each ppt 
CSV_LOC=$HOME/sub-${subj}.ses-${timepoint}/dt-neuro-tractmeasures*

# Print first variable and timepoint on the end of the csv
cd $CSV_LOC

# Take only columns 2-5 (i.e. not the header)
if [[ " $left_subj " =~ " $subj " ]]; then
	selected_row=$(awk 'NR==3' tractmeasures.csv) # row 2 = right hemisphere (stroke side for left_subj)
else
	selected_row=$(awk 'NR==2' tractmeasures.csv) # row 1 = left hemisphere (stroke side for right_subj)
fi

echo $subj','$timepoint','$selected_row >> $HOME/all_dice.csv

cd $HOME

done 
done




