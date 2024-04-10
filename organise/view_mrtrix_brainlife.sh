### Motor tracts
for subj in R008 R009 #R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
	echo "STARTING" $subj $session
cd /Volumes/Hanna_Rehab_Data/Rehab/Tracts
cd sub-${subj}.ses-${session}
mrview -load t1w/t1.nii.gz \
-roi.load rois/rois/right_vpl_mask_thr40.nii.gz \
-roi.load rois/rois/left_vpl_mask_thr40.nii.gz \
-roi.load rois/rois/ROIparc-9.nii.gz \
-roi.load rois/rois/ROIparc-189.nii.gz \
-tractography.load motor_tcks/ROI_left_vpl_mask_thr40_ROI_parc-9.tck \
-tractography.load motor_tcks/ROI_right_vpl_mask_thr40_ROI_parc-189.tck 
done 
done


### V1 tracts
for subj in R022 #R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
echo "STARTING" $subj $session
cd /Volumes/Hanna_Rehab_Data/Rehab/Tracts
cd sub-${subj}.ses-${session}
mrview -load t1w/t1.nii.gz \
-roi.load rois/rois/lh_lesion_v1.nii.gz \
-roi.load rois/rois/rh_lesion_v1.nii.gz \
-roi.load rois/rois/ROIlh.lgn.nii.gz \
-roi.load rois/rois/ROIrh.lgn.nii.gz \
-roi.load rois/rois/ROIparc-1.nii.gz \
-roi.load rois/rois/ROIparc-181.nii.gz \
-tractography.load lgn_v1_tcks/ROI_lh.lgn_ROI_lh_lesion_v1.tck \
-tractography.load lgn_v1_tcks/ROI_rh.lgn_ROI_rh_lesion_v1.tck \
-tractography.load lgn_v1_tcks/ROI_lh.lgn_ROI_parc-1.tck \
-tractography.load lgn_v1_tcks/ROI_rh.lgn_ROI_parc-181.tck 
done 
done

### MT tracts
for subj in R011 #R003 R004 R005 R014 R024 #R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
echo "STARTING" $subj $session
cd /Volumes/Hanna_Rehab_Data/Rehab/Tracts
cd sub-${subj}.ses-${session}
mrview -load t1w/t1.nii.gz \
-roi.load rois/rois/ROIlh.lgn.nii.gz \
-roi.load rois/rois/ROIrh.lgn.nii.gz \
-roi.load rois/rois/ROIparc-23.nii.gz \
-roi.load rois/rois/ROIparc-203.nii.gz \
-tractography.load lgn_mt_tcks/ROI_lh.lgn_ROI_parc-23.tck \
-tractography.load lgn_mt_tcks/ROI_rh.lgn_ROI_parc-203.tck
done 
done


for subj in R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
cd /Users/hwillis_admin/Desktop/proj-62e7ac5dd72146e3123d7269
cd sub-${subj}.ses-${session}
rm -r *dt-neuro-tcks.tag-roi_trekker.tag*
done 
done

for subj in R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline #6month
do
cd /Users/hwillis_admin/Desktop/proj-62e7ac5dd72146e3123d7269
cd sub-${subj}.ses-${session}
mv dt-neuro-tcks* motor_tcks
mv rois rois
mv t1w t1w
echo "done" $subj
done 
done


for subj in R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
cd /Volumes/Hanna_Rehab_Data/proj-62e7ac5dd72146e3123d7269
cd sub-${subj}.ses-${session}
mv dt-neuro-tcks* lgn_mt_tcks
echo "done" $subj
done
done



for subj in R022 #R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
echo "STARTING" $subj $session
cd /Volumes/Hanna_Rehab_Data/Rehab/Tracts
cd sub-${subj}.ses-${session}
mrview -load t1w/t1.nii.gz \
-roi.load rois/rois/lh_lesion_v1.nii.gz \
-roi.load rois/rois/rh_lesion_v1.nii.gz \
-roi.load rois/rois/ROIlh.lgn.nii.gz \
-roi.load rois/rois/ROIrh.lgn.nii.gz \
-roi.load rois/rois/ROIparc-1.nii.gz \
-roi.load rois/rois/ROIparc-181.nii.gz \
-tractography.load lgn_v1_tcks/ROI_lh.lgn_ROI_lh_lesion_v1.tck \
-tractography.load lgn_v1_tcks/ROI_rh.lgn_ROI_rh_lesion_v1.tck \
-tractography.load lgn_v1_tcks/ROI_lh.lgn_ROI_parc-1.tck \
-tractography.load lgn_v1_tcks/ROI_rh.lgn_ROI_parc-181.tck \
-roi.load rois/rois/ROIlh.lgn.nii.gz \
-roi.load rois/rois/ROIrh.lgn.nii.gz \
-roi.load rois/rois/ROIparc-23.nii.gz \
-roi.load rois/rois/ROIparc-203.nii.gz \
-tractography.load lgn_mt_tcks/ROI_lh.lgn_ROI_parc-23.tck \
-tractography.load lgn_mt_tcks/ROI_rh.lgn_ROI_parc-203.tck \
-roi.load rois/rois/right_vpl_mask_thr40.nii.gz \
-roi.load rois/rois/left_vpl_mask_thr40.nii.gz \
-roi.load rois/rois/ROIparc-9.nii.gz \
-roi.load rois/rois/ROIparc-189.nii.gz \
-tractography.load motor_tcks/ROI_left_vpl_mask_thr40_ROI_parc-9.tck \
-tractography.load motor_tcks/ROI_right_vpl_mask_thr40_ROI_parc-189.tck 
done 
done



# View data
# select all t1 and download
# select all tract1 then download
# this will come out in this format

# SC-MT
for subj in R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
echo "STARTING" $subj $session
cd ~/Desktop/diff
mrview -load t1/*/sub-${subj}.ses-${session}/*t1*/t1.nii.gz \
-tractography.load sc_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/track.tck \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIparc-23.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIparc-203.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/hanna_SC_L_mask.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/hanna_SC_R_mask.nii.gz 	
done 
done

# Pul-MT
for subj in R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
echo "STARTING" $subj $session
cd ~/Desktop/diff
mrview -load t1/*/sub-${subj}.ses-${session}/*t1*/t1.nii.gz \
-tractography.load pul_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/track.tck \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIparc-23.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIthalamus-8121.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIparc-203.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIthalamus-8221.nii.gz 
done 
done

# MT-MT
for subj in R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
echo "STARTING" $subj $session
cd ~/Desktop/diff
mrview -load t1/*/sub-${subj}.ses-${session}/*t1*/t1.nii.gz \
-tractography.load mt_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/track.tck \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIparc-23.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIparc-203.nii.gz 
done 
done

# View LGN and Pul together
for subj in R022 #R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
echo "STARTING" $subj $session
cd ~/Desktop/diff
mrview -load t1/*/sub-${subj}.ses-${session}/*t1*/t1.nii.gz \
-tractography.load pul_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/pul_mt_track.tck \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIparc-23.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIthalamus-8121.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIparc-203.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/ROIthalamus-8221.nii.gz \
-roi.load Tracts/sub-${subj}.ses-${session}/rois/rois/ROIlh.lgn.nii.gz \
-roi.load Tracts/sub-${subj}.ses-${session}/rois/rois/ROIrh.lgn.nii.gz \
-tractography.load sc_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/sc_mt_track.tck \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/hanna_SC_L_mask.nii.gz \
-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/hanna_SC_R_mask.nii.gz \
-tractography.load Tracts/sub-${subj}.ses-${session}/lgn_mt_tcks/ROI_lh.lgn_ROI_parc-23.tck \
-tractography.load Tracts/sub-${subj}.ses-${session}/lgn_mt_tcks/ROI_rh.lgn_ROI_parc-203.tck
done 
done

#-tractography.load sc_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/sc_mt_track.tck \
#-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/hanna_SC_L_mask.nii.gz \
#-roi.load rois/*/sub-${subj}.ses-${session}/*/rois/hanna_SC_R_mask.nii.gz \

for subj in R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do 
	for session in baseline 6month
	do
	cd ~/Desktop/diff
	cd pul_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*
	mv track.tck pul_mt_track.tck
	echo "done" $subj $session
done
done

for subj in R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do 
	for session in baseline 6month
	do
	cd ~/Desktop/diff
	cd sc_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*
	mv track.tck sc_mt_track.tck
	echo "done" $subj $session
done
done

mv pul_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/track.tck pul_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/pul_mt_track.tck
	mv sc_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/track.tck sc_mt/*/sub-${subj}.ses-${session}/dt-neuro-track-tck.tag-roi_trekker*/sc_mt_track.tck 
done

-tractography.load tracks

# SC
hanna_SC_L_mask parc-23
hanna_SC_R_mask parc-203 

# Pul
thalamus-8221 parc-203 
thalamus-8121 parc-23

# MT
parc-203 
parc-23



-roi.load rois/rois/lh_lesion_v1.nii.gz \
-roi.load rois/rois/rh_lesion_v1.nii.gz \
-roi.load rois/rois/ROIlh.lgn.nii.gz \
-roi.load rois/rois/ROIrh.lgn.nii.gz \
-roi.load rois/rois/ROIparc-1.nii.gz \
-roi.load rois/rois/ROIparc-181.nii.gz \
-tractography.load lgn_v1_tcks/ROI_lh.lgn_ROI_lh_lesion_v1.tck \
-tractography.load lgn_v1_tcks/ROI_rh.lgn_ROI_rh_lesion_v1.tck \
-tractography.load lgn_v1_tcks/ROI_lh.lgn_ROI_parc-1.tck \
-tractography.load lgn_v1_tcks/ROI_rh.lgn_ROI_parc-181.tck \
-roi.load rois/rois/ROIlh.lgn.nii.gz \
-roi.load rois/rois/ROIrh.lgn.nii.gz \
-roi.load rois/rois/ROIparc-23.nii.gz \
-roi.load rois/rois/ROIparc-203.nii.gz \
-tractography.load lgn_mt_tcks/ROI_lh.lgn_ROI_parc-23.tck \
-tractography.load lgn_mt_tcks/ROI_rh.lgn_ROI_parc-203.tck \
-roi.load rois/rois/right_vpl_mask_thr40.nii.gz \
-roi.load rois/rois/left_vpl_mask_thr40.nii.gz \
-roi.load rois/rois/ROIparc-9.nii.gz \
-roi.load rois/rois/ROIparc-189.nii.gz \
-tractography.load motor_tcks/ROI_left_vpl_mask_thr40_ROI_parc-9.tck \
-tractography.load motor_tcks/ROI_right_vpl_mask_thr40_ROI_parc-189.tck 
done 
done


### V1 tracts
for subj in R022 #R001 R002 R003 R004 R005 R006 R007 R008 R009 R010 R011 R012 R013 R014 R015 R017 R018 R019 R020 R022 R023 R024
do
for session in baseline 6month
do
cd ~/Desktop/diff
mrview -load t1/*/sub-${subj}.ses-${session}/*t1*/t1.nii.gz \
-tractography.load ~/Downloads/test.tck
done










