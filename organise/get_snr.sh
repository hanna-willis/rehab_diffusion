#!/bin/bash

# ------------------------------------------------------------------------------
# Script name:  get_snr.sh
#
# Description:  Script to concatenate all SNR values into one csv
#
# Author:       Hanna Willis, 21/11/23

# ------------------------ SET SUBJS ------------------------
all_subj='R001 R004 R005 R006 R007 R008 R009 R011 R012 R019 R020 R024 R002 R003 R010 R013 R014 R015 R017 R018 R022 R023'
HOME=/Users/hwillis_admin/Desktop/SNR/

# ------------------------ ADD HEADER TO CSV ------------------------
#paste -d, <(awk 'NR==1' FS=',' "temp.csv") > all_mean_fa.csv
echo 'subj, timepoint, volumes, dir_x, dir_y, dir_z,snr' > $HOME/all_snr.csv

# ------------------------ RUN THROUGH ALL SUBJ ------------------------
for subj in $all_subj
do
for timepoint in no_train baseline 6month
do 
# Set location for each ppt 
CSV_LOC=$HOME/proj-62e7ac5dd72146e3123d7269/sub-${subj}.ses-${timepoint}/dt-neuro*

# Print timepoint on the end of the csv
cd $CSV_LOC
selected_row=$(awk 'NR==2' snr.csv)
echo $subj','$timepoint','$selected_row >> $HOME/all_snr.csv

cd $HOME

done 
done