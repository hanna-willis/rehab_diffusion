#!/bin/bash

# ------------------------------------------------------------------------------
# Script name:  upload_data_brainlife.sh
#
# Description:  Script to upload all diffusion and anatomy data to brainlife
#
# Author:       Hanna Willis, 1/8/22

# ------------------------ DOWNLOAD DATA ------------------------
all_subj='R001 R004 R005 R006 R007 R008 R009 R011 R012 R019 R020 R024 R002 R003 R010 R013 R014 R015 R017 R018 R022 R023'
left_subj='R001 R004 R005 R006 R007 R008 R009 R011 R012 R019 R020 R024'
right_subj='R002 R003 R010 R013 R014 R015 R017 R018 R022 R023'

# ------------------------ SET UP EVERYTHING ------------------------
hanna_willis
4dandaja?

bl project query --admin hanna_willis

#DTI testing project: 624c4cd65d8ab5d5f06d99be
#Rehab in hemianopia project: 62e7ac5dd72146e3123d7269


## -------------- RUN LEFT HEMIANOPES FIRST (NO FLIPPING) --------------

# ------------------------ DEFACE ANATOMY DATA ------------------------
for subj in R005 #$all_subj #R022 #R015 R017 R018 R019 R020 R023 R024 #R001 R008 R009 R012 R002 R003 R004 R005 R006 R007 R010 R011 R013 R014 #
do 
    for timepoint in no_train #baseline #6month #baseline
    do 
        cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/${timepoint}/anat
        mv ${subj}_anat.nii.gz anat.nii.gz
        fsl_deface anat.nii.gz anat_deface.nii.gz
        echo 'done fsl_deface for' $subj $timepoint
done 
done

# ------------------------ UPLOAD ANAT ------------------------

# ------------- LEFT HEMIFIELD ------------- #
for subj in R005 #$left_subj #R005 #R019 R020 R024; #R004 R005 R006 R007 R011
do
    for timepoint in no_train #baseline #6month #baseline no_train
    do 
cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/${timepoint}
bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/anat/t1w \
    --desc 'raw t1 image' \
    --subject ${subj} \
    --session "${timepoint}" \
    --t1 anat/anat_deface.nii.gz \
    --tag "raw_t1" \
    --datatype_tag "left_hemi" 
cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/
done
done

# ------------- RIGHT HEMIFIELD ------------- #
for subj in $right_subj #R002 R003 R010 R013 R014 R015 R017 R018 R022 R023 
do
    for timepoint in no_train #6month # 6month #no_train #baseline 6month
    do 
cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/${timepoint}
bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/anat/t1w \
    --desc 'raw t1 image' \
    --subject ${subj} \
    --session "${timepoint}" \
    --t1 anat/anat_deface.nii.gz \
    --tag "raw_t1" \
    --datatype_tag "right_hemi" 
cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/
done
done

# ------------------------ UPLOAD DIFFUSION ------------------------
#Files: [(required) dwi: dwi.nii.gz]  [(required) bvecs: dwi.bvecs]  [(required) bvals: dwi.bvals]  [sbref: sbref.nii.gz]  [sbref_json: sbref.json]

# ------------- LEFT HEMIFIELD ------------- #
for subj in $left_subj #R019 R020 R024; #R004 R005 R006 R007 R011
do
    for timepoint in no_train #6month # 6month no_train
    do
cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/${timepoint}
bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/dwi \
    --desc 'raw dwi' \
    --subject ${subj} \
    --session ${timepoint} \
    --dwi diff/ap_pa_orig/${subj}_AP_diff.nii.gz \
    --bvecs diff/bvecs/${subj}_AP_diff.bvec \
    --bvals diff/bvals/${subj}_AP_diff.bval \
    --tag "dwi" \
    --datatype_tag "AP" \
    --datatype_tag "left_hemi" \
    --tag "raw_dwi" 

bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/dwi \
    --desc 'raw dwi' \
    --subject ${subj} \
    --session ${timepoint} \
    --dwi diff/ap_pa_orig/${subj}_PA_diff.nii.gz  \
    --bvecs diff/bvecs/${subj}_PA_diff.bvec \
    --bvals diff/bvals/${subj}_PA_diff.bval \
    --tag "dwi" \
    --datatype_tag "PA" \
    --tag "raw_dwi" \
    --datatype_tag "left_hemi" 

    cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/
done
done

# ------------- RIGHT HEMIFIELD ------------- #
for subj in $right_subj #R002 R003 R010 R013 R014 R015 R017 R018 R022 R023 
do
    for timepoint in no_train #6month #baseline # 6month #no_train # 6month #baseline
    do
cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/${timepoint}
bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/dwi \
    --desc 'raw dwi' \
    --subject ${subj} \
    --session ${timepoint} \
    --dwi diff/ap_pa_orig/${subj}_AP_diff.nii.gz \
    --bvecs diff/bvecs/${subj}_AP_diff.bvec \
    --bvals diff/bvals/${subj}_AP_diff.bval \
    --tag "dwi" \
    --datatype_tag "AP" \
    --datatype_tag "right_hemi" \
    --tag "raw_dwi" 

bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/dwi \
    --desc 'raw dwi' \
    --subject ${subj} \
    --session ${timepoint} \
    --dwi diff/ap_pa_orig/${subj}_PA_diff.nii.gz  \
    --bvecs diff/bvecs/${subj}_PA_diff.bvec \
    --bvals diff/bvals/${subj}_PA_diff.bval \
    --tag "dwi" \
    --datatype_tag "PA" \
    --tag "raw_dwi" \
    --datatype_tag "right_hemi" 

cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/
done
done

# ------------------------ UPLOAD ROI ------------------------

# for subj in R003 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R023 R024 #R006 #R004 R005
# do
#     cd /Volumes/Hanna_Rehab_Data/Rehab/$subj
#     mkdir lesion
#     cp /Volumes/Hanna_Rehab_Data/Lesion_masks/${subj}_*_bin_sum_mask_struct.nii.gz /Volumes/Hanna_Rehab_Data/Rehab/${subj}/lesion
#     cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/lesion
#     mv ${subj}_*_bin_sum_mask_struct.nii.gz lesion_mask.nii.gz
# done

# ------------------- UPLOAD LESION ------------------- #

# do all at once (do it to a directory) 
for subj in $all_subj #R002 #R023 #R002 R003 R010 R013 R014 R015 R017 R018 R022 R023 
do
    for timepoint in no_train #baseline 6month #6month #baseline
    do
bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/rois \
    --desc 'lesion' \
    --subject ${subj} \
    --session ${timepoint} \
    --rois /Volumes/Hanna_Rehab_Data/Rehab/${subj}/lesion \
    --tag "lesion"
cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/
done
done

# ------------------- UPLOAD VPL STANDARD ------------------- #

for subj in $all_subj #R002 R003 R010 R013 R014 R015 R017 R018 R022 R023 
do
    for timepoint in no_train #6month #baseline # no_train 6month 
    do
bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/rois \
    --desc 'raw VPL ROIs' \
    --subject ${subj} \
    --session ${timepoint} \
    --rois /Volumes/Hanna_Rehab_Data/VPL/thr_vpl \
    --tag "standard_vpl" \
    --tag "40_perc_thr"
cd /Volumes/Hanna_Rehab_Data/Rehab/${subj}/
done 
done 

# ------------------- UPLOAD SC STANDARD ------------------- #

for subj in R022 #R015 #R002 R003 R008 R010 R012 #$all_subj
do
    for timepoint in baseline 6month #no_train
    do
bl data upload \
    --project 62e7ac5dd72146e3123d7269   \
    --datatype neuro/rois \
    --desc 'raw SC ROIs' \
    --subject ${subj} \
    --session ${timepoint} \
    --rois /Users/hwillis_admin/Desktop/OneDrive\ -\ Nexus365/Hemianopia_Rehab_Data/Patients/MRI/Analysis/rois/original_masks/SC \
    --tag "standard_SC" 
done 
done 

cd /Users/hwillis_admin/Desktop/OneDrive\ -\ Nexus365/Hemianopia_Rehab_Data/Patients/MRI/Analysis/rois/original_masks/SC

hanna_SC_L_mask.nii.gz
hanna_SC_R_mask.nii.gz


F3T_2023_003_00



