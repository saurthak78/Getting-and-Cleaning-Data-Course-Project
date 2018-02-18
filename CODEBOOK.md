#**Code book for Coursera Getting and Cleaning Data course project**

##CODEBOOK.md

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.

The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.

From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

See 'features_info.txt' for more details. 

**For each record it is provided:**
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**The dataset includes the following files:**
=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

This codebook describes the tidy_data.txtdata set. The original source data and the transformations performed to create this dataset are described in the source data and transformations section. The data structure and variables included in the dataset are described in the variables section.

###**Variables**

Each row in tidy_data.txt contains the average value of a set of signal measurements calculated across all measurements available in the source data set for a given subject performing a given activity. For details on how these measurements were created, please consult the features_info.txtfile supplied with the source data.

###**Identifiers**

- subject: Subject identifier. An integer value ranging from 1 to 30.
- activity: Character string, one of 6 possible values:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING
###**Measurements**
All measurements are floating point values, normalized and bounded within [-1,1]. Prior to normalization, acceleration measurements were made in standard gravity units 'g', and angular velocity measurements were made in radians/second.

###**Time-domain signals**
**Average and standard deviation of the time-domain body and gravity acceleration signals in the X, Y and Z directions:**
- timeBodyAccelerometer-mean()-X
- timeBodyAccelerometer-mean()-Y
- timeBodyAccelerometer-mean()-Z
- timeBodyAccelerometer-std()-X
- timeBodyAccelerometer-std()-X
- timeBodyAccelerometer-std()-X
- timegravityAccelerometer-mean()-X
- timegravityAccelerometer-mean()-Y
- timegravityAccelerometer-mean()-Z
- timegravityAccelerometer-std()-X
- timegravityAccelerometer-std()-X
- timegravityAccelerometer-std()-X

Average and standard deviation of the body acceleration jerk signals (derivative of body acceleration in time) in the X, Y and Z direction:
- timeBodyAccelerometerJerk-mean()-X
- timeBodyAccelerometerJerk-mean()-Y
- timeBodyAccelerometerJerk-mean()-Z
- timeBodyAccelerometerJerk-std()-X
- timeBodyAccelerometerJerk-std()-Y
- timeBodyAccelerometerJerk-std()-Z

Average and standard deviation of the body angular velocity signals in the X, Y and Z directions:
- timeBodyGyroscope-mean()-X
- timeBodyGyroscope-mean()-Y
- timeBodyGyroscope-mean()-Z
- timeBodyGyroscope-std()-X
- timeBodyGyroscope-std()-Y
- timeBodyGyroscope-std()-Z

Average and standard deviation of the body angular velocity jerk signals (derivative of angular velocity in time) in the X, Y and Z directions:
- timeBodyGyroscopeJerk-mean()-X
- timeBodyGyroscopeJerk-mean()-Y
- timeBodyGyroscopeJerk-mean()-Z
- timeBodyGyroscopeJerk-std()-X
- timeBodyGyroscopeJerk-std()-Y
- timeBodyGyroscopeJerk-std()-Z

Average and standard deviation of the magnitude of the time-domain body and gravity acceleration:
- timeBodyAccelerometerMagnitude-mean()
- timeBodyAccelerometerMagnitude-std()
- timeGravityAccelerometerMagnitude-mean()
- timeGravityAccelerometerMagnitude-std()

Average and standard deviation of the magnitude of the time-domain body acceleration jerk:
- timeBodyAccelerometerJerkMagnitude-mean()
- timeBodyAccelerometerJerkMagnitude-std()

Average and standard deviation of the magnitude of the time-domain body angular velocity:
- timeBodyGyroscopeMagnitude-mean()
- timeBodyGyroscopeMagnitude-std()

Average and standard deviation of the magnitude of the time-domain body angular velocity jerk:
- timeBodyGyroscopeJerkMagnitude-mean()
- timeBodyGyroscopeJerkMagnitude-std()

##**Frequency-domain signals**

FFT applied to some of the time-domain signals included above:

- frequencyBodyAccelerometer-mean()-X
- frequencyBodyAccelerometer-mean()-Y
- frequencyBodyAccelerometer-mean()-Z
- frequencyBodyAccelerometer-std()-X
- frequencyBodyAccelerometer-std()-Y
- frequencyBodyAccelerometer-std()-Z
- frequencyBodyAccelerometerJerk-mean()-X
- frequencyBodyAccelerometerJerk-mean()-Y
- frequencyBodyAccelerometerJerk-mean()-Z
- frequencyBodyAccelerometerJerk-std()-X
- frequencyBodyAccelerometerJerk-std()-Y
- frequencyBodyAccelerometerJerk-std()-Z
- frequencyBodyGyroscope-mean()-X
- frequencyBodyGyroscope-mean()-Y
- frequencyBodyGyroscope-mean()-Z
- frequencyBodyGyroscope-std()-X
- frequencyBodyGyroscope-std()-Y
- frequencyBodyGyroscope-std()-Z
- frequencyBodyAccelerometerMagnitude-mean()
- frequencyBodyAccelerometerMagnitude-std()
- frequencyBodyAccelerometerJerkMagnitude-mean()
- frequencyBodyAccelerometerJerkMagnitude-std()
- frequencyBodyGyroscopeMagnitude-mean()
- frequencyBodyGyroscopeMagnitude-std()
- frequencyBodyGyroscopeJerkMagnitude-mean()
- frequencyBodyGyroscopeJerkMagnitude-std()

##**Source data and transformations**

The following transformations were applied to the source data:
- Mean() and std() measurements were imported from the original data set
- Training and test data were merged in a single dataset
- Activity ids (integer values) were converted to descriptive activity type names
- Column names were replaced with descriptive variable names
- The final data set was produced by averaging each variable after grouping per subject and activity.

