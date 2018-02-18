# Getting-and-Cleaning-Data-Course-Project
Saurabh Thakur

The purpose of this project is to demonstrate the process of collecting, working with, and cleaning a data set for analysis.

**This project contains:**
1. tidy data set
2. CodeBook.md
3. Readme.md
4. R script

**The script 'run_analysis.R' does the following:**
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of 
each variable for each activity and each subject.

##**Pre-requisites to run the script**
- R 3.3.0 or above
- R package plyr needs to be loaded

**The script, run_analysis.R from this repository should also be stored in the working directory**

The dataset needs to be downloaded, unzipped and saved in the working directory. If downloading using R, the following set of commands can be used:

if(!file.exists("./data")) {
        dir.create("./data")       
        data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"        
        download.file(data.url,         
                      destfile = "./data/Dataset.zip")
        unzip(zipfile = "./data/Dataset.zip", 
              exdir = "./data")
}

##**Running the script to get the tidy dataset**
Run the script run_analysis.R in R as follows:

source("run_analysis.R")
