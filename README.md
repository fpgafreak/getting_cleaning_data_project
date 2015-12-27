---
title: "Data desricption and run_analysis.R script guide"
author: "fpgafreak"
date: "December 27, 2015"
output: html_document
---

This is a final project for the Coursera "Getting and Cleaning Data" course.

1. Data processing script
=========================
run_analysis.R - data processing script location

2. Original data
================
See "README.txt" for original data description. Data archive should be unzipped in the directory where scrip is located, as script expects a subdirectory named "UCI_HAR_Dataset". If data location is different, change variable "dataDir" (line 5 of the script) to proper relative path.

3. Data processing
==================
the following steps a performed:

  - reads feature names and activity labels form "activity_labels.txt" and "features.txt"
  - reads test data and make single table
  - reads training data and make single table
  - merges the training and the test sets to create one data set
  - generate unique names from feature names in original data and names all columns
  - extracts only the measurements on the mean and standard deviation for each measurement
  - uses descriptive activity names to name the activities in the data set
  - sort table by subject to produce first tidy data set 
  - creates a second, independent tidy data set with the average of each variable for each activity and each subject

3. Outputs
==========
Script produces 2 output files in a current working directory:
step_4_dataset.txt - tidy data set per step 4 of project instructions
step_5_dataset.txt - tidy data set per step 5 of project instructions

4. step_5_dataset.txt
=====================
Data present average values for a mean value and standard seviation summarized by activity and subject.

Column# Column Name Column Description<br> 
1 Activities - descriptive activity names<br>
2 Subject - unique subject id<br>
3-88 - summarized measurement data
  measurements are identified as following:<br> 
    names starting with:<br>
      t - time domain data<br>
      f - frequency domain data<br>
    names containing "mean" or "Mean" - mean values<br>
    names containing "std" - standard deviations<br>

Measurement names are programmatically derived from feature names in original data. Please refer to "step5_codebook.txt" for a list of names and to "README.txt" for detailed description of measurement data and data normalization.

5. License:
===========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
