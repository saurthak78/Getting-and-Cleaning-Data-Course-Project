#
#SCript to download the data from the link provided and store it local.
#
#
#
setwd("E:/R/coursera/Assignments/Getting-and-Cleaning-Data-Course-Project")
#
library(plyr)
#
#
if(!file.exists("./data")) {
        dir.create("./data")
        data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(data.url, 
                      destfile = "./data/Dataset.zip")
        unzip(zipfile = "./data/Dataset.zip", 
              exdir = "./data")
}
#
#file download and unzip completed. Now files to be loaded to R
#
#
features <- read.table("./data/UCI HAR Dataset/features.txt") 
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
#
filenames <- c("X_test", "y_test", "subject_test",
               "X_train", "y_train", "subject_train")
#
# All files are read into a "list" of "dataframes" by the "sapply"
# code below. The individual members of the list are then treated
# as indivdual dataframes.
#
# > class(files.read)
# [1] "list"
# > class(files.read$y_test)
# [1] "data.frame"
#
files.read <- sapply(
        paste("./data/UCI HAR Dataset/",(
                matrix(
                        unlist(
                                strsplit(filenames, split = "_")),
                        ncol = 2,byrow = TRUE)[,2]),
              "/",filenames,".txt",sep = ""),
        read.table)
#
names(files.read) <- filenames
#
# assign the colnames to the read data.
#
colnames(files.read$X_test) <- features$V2
colnames(files.read$y_test) <- "activity_Id"
colnames(files.read$subject_test) <- "subject_Id"
colnames(files.read$X_train) <- features$V2
colnames(files.read$y_train) <- "activity_Id"
colnames(files.read$subject_train) <- "subject_Id"
colnames(activity_labels) <- c("activity_Id","activity_Type")
#
#
# adding a new column of the labels corresponding to the "activity_Id" from the dataset
# "activity_Labels" to both "y_test" and "y_train" datasets.
#
files.read$y_test <- merge(files.read$y_test,activity_labels, by = "activity_Id", all.x = TRUE)
files.read$y_train <- merge(files.read$y_train,activity_labels, by = "activity_Id", all.x = TRUE)
#
#combining all the datasets into one "mergedd_all" dataset.
#
combined_test <- cbind(files.read$y_test, 
                       files.read$subject_test, 
                       files.read$X_test)
#
combined_train <- cbind(files.read$y_train,
                        files.read$subject_train,
                        files.read$X_train)
#
merged_all <- rbind(combined_test,combined_train)
#
#merged_colNames <- colnames(merged_all)
#
# selecting the names of the columns where text "mean" and "std" is present.
# then arranging the columns in the order they will be written into the file.
# finally creating a subset of the "merged_all" using the columns present in
# "arranged.Columns"
#
mean_and_std_features <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
#
arranged.Columns <- c("activity_Id", "activity_Type", "subject_Id",
                     as.character(mean_and_std_features))
merged_all_subset <- subset(merged_all, select=arranged.Columns)
#
# The short names of the header are expanded into descriptive names
#
names(merged_all_subset) <-gsub("^t", "time", names(merged_all_subset))
names(merged_all_subset) <-gsub("^f", "frequency", names(merged_all_subset))
names(merged_all_subset) <-gsub("Acc", "Accelerometer", names(merged_all_subset))
names(merged_all_subset) <-gsub("Gyro", "Gyroscope", names(merged_all_subset))
names(merged_all_subset) <-gsub("Mag", "Magnitude", names(merged_all_subset))
names(merged_all_subset) <-gsub("BodyBody", "Body", names(merged_all_subset))
#
# create the final dataset with averages of all the columns.
#
finalData <- ddply(merged_all_subset, .(subject_Id, activity_Type), function(x) colMeans(x[, 4:69]))
#
#writting the final data into the text file on to the local drive.
#
write.table(finalData, "tidy.txt", row.name=FALSE)
#