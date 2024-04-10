#!/bin/bash

# ------------------------------------------------------------------------------
# Script name:  get_mean_fa.sh
#
# Description:  Script to concatenate all the mean FA into one csv
#
# Author:       Hanna Willis, 20/11/23

# ------------------------ SET SUBJS ------------------------
all_subj='R001 R004 R005 R006 R007 R008 R009 R011 R012 R019 R020 R024 R002 R003 R010 R013 R014 R015 R017 R018 R022 R023'
HOME=/Users/hwillis_admin/Desktop/proj-62e7ac5dd72146e3123d7269

# ------------------------ ADD HEADER TO CSV ------------------------
#paste -d, <(awk 'NR==1' FS=',' "temp.csv") > all_mean_fa.csv
cd $HOME
cp all_mean_fa_og.csv all_mean_fa.csv 


# ------------------------ RUN THROUGH ALL SUBJ ------------------------
for subj in $all_subj
do
for timepoint in no_train baseline 6month
do 
# Set location for each ppt 
CSV_LOC=$HOME/sub-${subj}.ses-${timepoint}/dt-neuro-parc-stats*/parc-stats

# Print timepoint on the end of the csv
cd $CSV_LOC
echo "$(awk -v var="$timepoint" -F',' 'BEGIN {OFS = ","} {print $0,var}' "tissues.csv")" > tissues_time.csv

# Take only columns 2-5 (i.e. not the header)
paste -d, <(awk 'NR>=2 && NR<=5' FS=',' "tissues_time.csv") >> $HOME/all_mean_fa.csv

cd $HOME

done 
done