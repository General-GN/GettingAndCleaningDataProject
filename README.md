Getting and Cleaning Data - Course Project
================================

The following are the files included in this project:

* run_analysis.R - script that combines the files (both train and test) under the "getdata-projectfiles-UCI HAR Dataset" project directory.
* CodeBook.md - file that describes the steps taken in the run_analysis.R script for combining all the data files.
* final_raw_data.txt - file containing the combined raw data
* final_summary_data.txt - file containing the average values of all the mean and std values in the final_raw_dat.txt grouped by subject and activity.

To reproduce the data, do the following steps:

* Copy the run.analysis.R file to a directory 
* Under the directory where the script was copied, create a subdirectory called /data
* Download and extract the getdata-projectfiles-UCI HAR Dataset.zip inside the /data directory
* Open the R console and change directory to the location where run_analysis.R script was copied to.
* Run the script using the following command:

      source("run_analysis.R")
      
 The output files (final_raw_data.txt and final_summary_data.txt)  will be generated under the /data directory.   