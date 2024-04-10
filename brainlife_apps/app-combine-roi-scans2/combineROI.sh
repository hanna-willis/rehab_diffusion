#!/bin/bash

#PBS -l nodes=1:ppn=1
#PBS -l walltime=00:20:00
#PBS -l vmem=30gb

# Show commands running.
set -x 
set -e

# Parse input file names from config.json. 
roi1=`jq -r '.rois1' config.json`
roi2=`jq -r '.rois2' config.json`

# Make an output directory.
mkdir -p output
mkdir -p output/rois

# Copy files from the roi1 location to the new location and rename.
for roiname in $(ls $roi1); do
	
	# Copy the rois from the first ROI to the output ROI directory.
	cp $roi1/$roiname output/rois/$roiname

done

# Copy files from the roi2 location to the new location and rename.
for roiname in $(ls $roi2); do

	if [ -f output/rois/$roiname ]; then

		# Get the filename without .nii.gz.
		base=${roiname%.nii.gz}

		# Compose the new name.
		newname=$base-2.nii.gz

		# Let the user know.
		echo "$roiname in the second ROI you provided already exists in the first ROI that you provided ... using different name for the roi from the second ROI: $newname"

		# Copy the rois from the second ROI to the output ROI directory with the new name.
		cp $roi2/$roiname output/rois/$newname

	else

		# Copy the rois from the second ROI to the output ROI directory.
		cp $roi2/$roiname output/rois/$roiname

	fi

done

