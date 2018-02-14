#
#SCript to download the data from the link provided and store it local.
#
#
#
setwd("E:/R/coursera/Assignments/Getting-and-Cleaning-Data-Course-Project")
#
if(!file.exists("./data")) {
        dir.create("./data")
        data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(data.url, 
                      destfile = "./data/Dataset.zip")
        unzip(zipfile = "./data/Dataset.zip", 
              exdir = "./data")
}else if(file.exists("./data/Dataset.zip")) {
        unzip(zipfile = "./data/Dataset.zip", 
              overwrite = TRUE, 
              exdir = "./data")
        }
#
#file download and unzip completed. Now files to be loaded to R
#
filenames <- C("X_test", "y_test", "subject_test",
               "X_train", "y_train", "subject_train")


l <- lapply(
        paste("./",
              (substr(filenames,3,(nchar(filenames)))),
              "/",
              filenames,
              ".txt",
              sep = ""), 
            read.table)

#read_files <- function(file_name) {
#        read.table("./data/UCI HAR Dataset/test/",paste(file_name,".txt"))
#}
#
#filenames <- lapply(filenames, read_files)


setwd("./data/UCI HAR Dataset/test")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
#
setwd("./data/UCI HAR Dataset/train")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
#
features <- read.table("./data/UCI HAR Dataset/features.txt") 
#







