## Cleaning Dataset from the Human Activity Recognition Using Smartphones Data

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.


## Data source
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)

1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 

2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain


## Data collecting information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


## Data Explanation


### Original Data set

-----------------------------------------------------------------
Data Set Characteristics:     Multivariate, Time-Series 
Date Donated:                 2012-12-10
Attribute Characteristics:    N/A 
Missing Values:               N/A 
Number of Instances:          10299 
Number of Attributes:         561 
-----------------------------------------------------------------


Attribute Information:
For each record in the dataset it is provided: 


* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 

* Triaxial Angular velocity from the gyroscope. 

* A 561-feature vector with time and frequency domain variables. 

* Its activity label. 

* An identifier of the subject who carried out the experiment.


### Cleaning Dataset

------------------------------------------------------
Data Set Characteristics:     Multivariate, Average value 
Date Created:                 2019-02-10
Attribute Characteristics:    Mean or Standard Deviation
Missing Values:               N/A 
Number of Instances:          10299
Number of Attributes:         68 
------------------------------------------------------


Attribute Information:
For each record in the dataset it is provided: 


* Average of the the mean or standard deviation of a measurement for each subject and each activity.

* Its activity discriptive labels. 

* An ID of the subject who carried out the experiment.



## Variable descriptions


### Original variables


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

(Note: We did not take the angle() variables into the cleaning process, and we left out the explanation of that group here.)



t-variable | f-variable 
------------ | ------------ 
tBodyAcc-XYZ  | fBodyAcc-XYZ 
tGravityAcc-XYZ | fBodyAccJerk-XYZ 
tBodyAccJerk-XYZ | fBodyGyro-XYZ 
tBodyGyro-XYZ | fBodyAccMag
tBodyGyroJerk-XYZ | fBodyAccJerkMag 
tBodyAccMag | fBodyGyroMag
tGravityAccMag | fBodyGyroJerkMag
tBodyAccJerkMag |
tBodyGyroMag |
tBodyGyroJerkMag |

('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.)


### Variables in the cleaning dataset

In the cleaning dataset, we take the measurements on the mean and standard deviation for above variables, and calculate the average of the values for each subject and each activity. 



### Data Summary

"Num" | varNames" | "class" | "range" | "mean"
--- |---------------------------------|-------|--------------------|-------------
"1" | "ID" | "integer" | "1 / 30" | "Not available"
"2" | "activity" | "factor" | "WALKING / WALKING_UPSTAIRS /WALKING_DOWNSTAIRS / SITTING / STANDING / LAYING" | "Not available"
"3" | "tBodyAcc-mean()-X" | "numeric" | "0.22 / 0.3" | "0.27"
"4" | "tBodyAcc-mean()-Y" | "numeric" | "-0.04 / 0" | "-0.02"
"5" | "tBodyAcc-mean()-Z" | "numeric" | "-0.15 / -0.08" | "-0.11"
"6" | "tBodyAcc-std()-X" | "numeric" | "-1 / 0.63" | "-0.56"
"7" | "tBodyAcc-std()-Y" | "numeric" | "-0.99 / 0.62" | "-0.46"
"8" | "tBodyAcc-std()-Z" | "numeric" | "-0.99 / 0.61" | "-0.58"
"9" | "tGravityAcc-mean()-X" | "numeric" | "-0.68 / 0.97" | "0.7"
"10" | "tGravityAcc-mean()-Y" | "numeric" | "-0.48 / 0.96" | "-0.02"
"11" | "tGravityAcc-mean()-Z" | "numeric" | "-0.5 / 0.96" | "0.07"
"12" | "tGravityAcc-std()-X" | "numeric" | "-1 / -0.83" | "-0.96"
"13" | "tGravityAcc-std()-Y" | "numeric" | "-0.99 / -0.64" | "-0.95"
"14" | "tGravityAcc-std()-Z" | "numeric" | "-0.99 / -0.61" | "-0.94"
"15" | "tBodyAccJerk-mean()-X" | "numeric" | "0.04 / 0.13" | "0.08"
"16" | "tBodyAccJerk-mean()-Y" | "numeric" | "-0.04 / 0.06" | "0.01"
"17" | "tBodyAccJerk-mean()-Z" | "numeric" | "-0.07 / 0.04" | "0"
"18" | "tBodyAccJerk-std()-X" | "numeric" | "-0.99 / 0.54" | "-0.59"
"19" | "tBodyAccJerk-std()-Y" | "numeric" | "-0.99 / 0.36" | "-0.57"
"20" | "tBodyAccJerk-std()-Z" | "numeric" | "-0.99 / 0.03" | "-0.74"
"21" | "tBodyGyro-mean()-X" | "numeric" | "-0.21 / 0.19" | "-0.03"
"22" | "tBodyGyro-mean()-Y" | "numeric" | "-0.2 / 0.03" | "-0.07"
"23" | "tBodyGyro-mean()-Z" | "numeric" | "-0.07 / 0.18" | "0.09"
"24" | "tBodyGyro-std()-X" | "numeric" | "-0.99 / 0.27" | "-0.69"
"25" | "tBodyGyro-std()-Y" | "numeric" | "-0.99 / 0.48" | "-0.65"
"26" | "tBodyGyro-std()-Z" | "numeric" | "-0.99 / 0.56" | "-0.62"
"27" | "tBodyGyroJerk-mean()-X" | "numeric" | "-0.16 / -0.02" | "-0.1"
"28" | "tBodyGyroJerk-mean()-Y" | "numeric" | "-0.08 / -0.01" | "-0.04"
"29" | "tBodyGyroJerk-mean()-Z" | "numeric" | "-0.09 / -0.01" | "-0.05"
"30" | "tBodyGyroJerk-std()-X" | "numeric" | "-1 / 0.18" | "-0.7"
"31" | "tBodyGyroJerk-std()-Y" | "numeric" | "-1 / 0.3" | "-0.76"
"32" | "tBodyGyroJerk-std()-Z" | "numeric" | "-1 / 0.19" | "-0.71"
"33" | "tBodyAccMag-mean()" | "numeric" | "-0.99 / 0.64" | "-0.5"
"34" | "tBodyAccMag-std()" | "numeric" | "-0.99 / 0.43" | "-0.54"
"35" | "tGravityAccMag-mean()" | "numeric" | "-0.99 / 0.64" | "-0.5"
"36" | "tGravityAccMag-std()" | "numeric" | "-0.99 / 0.43" | "-0.54"
"37" | "tBodyAccJerkMag-mean()" | "numeric" | "-0.99 / 0.43" | "-0.61"
"38" | "tBodyAccJerkMag-std()" | "numeric" | "-0.99 / 0.45" | "-0.58"
"39" | "tBodyGyroMag-mean()" | "numeric" | "-0.98 / 0.42" | "-0.57"
"40" | "tBodyGyroMag-std()" | "numeric" | "-0.98 / 0.3" | "-0.63"
"41" | "tBodyGyroJerkMag-mean()" | "numeric" | "-1 / 0.09" | "-0.74"
"42" | "tBodyGyroJerkMag-std()" | "numeric" | "-1 / 0.25" | "-0.76"
"43" | "fBodyAcc-mean()-X" | "numeric" | "-1 / 0.54" | "-0.58"
"44" | "fBodyAcc-mean()-Y" | "numeric" | "-0.99 / 0.52" | "-0.49"
"45" | "fBodyAcc-mean()-Z" | "numeric" | "-0.99 / 0.28" | "-0.63"
"46" | "fBodyAcc-std()-X" | "numeric" | "-1 / 0.66" | "-0.55"
"47" | "fBodyAcc-std()-Y" | "numeric" | "-0.99 / 0.56" | "-0.48"
"48" | "fBodyAcc-std()-Z" | "numeric" | "-0.99 / 0.69" | "-0.58"
"49" | "fBodyAccJerk-mean()-X" | "numeric" | "-0.99 / 0.47" | "-0.61"
"50" | "fBodyAccJerk-mean()-Y" | "numeric" | "-0.99 / 0.28" | "-0.59"
"51" | "fBodyAccJerk-mean()-Z" | "numeric" | "-0.99 / 0.16" | "-0.71"
"52" | "fBodyAccJerk-std()-X" | "numeric" | "-1 / 0.48" | "-0.61"
"53" | "fBodyAccJerk-std()-Y" | "numeric" | "-0.99 / 0.35" | "-0.57"
"54" | "fBodyAccJerk-std()-Z" | "numeric" | "-0.99 / -0.01" | "-0.76"
"55" | "fBodyGyro-mean()-X" | "numeric" | "-0.99 / 0.47" | "-0.64"
"56" | "fBodyGyro-mean()-Y" | "numeric" | "-0.99 / 0.33" | "-0.68"
"57" | "fBodyGyro-mean()-Z" | "numeric" | "-0.99 / 0.49" | "-0.6"
"58" | "fBodyGyro-std()-X" | "numeric" | "-0.99 / 0.2" | "-0.71"
"59" | "fBodyGyro-std()-Y" | "numeric" | "-0.99 / 0.65" | "-0.65"
"60" | "fBodyGyro-std()-Z" | "numeric" | "-0.99 / 0.52" | "-0.66"
"61" | "fBodyAccMag-mean()" | "numeric" | "-0.99 / 0.59" | "-0.54"
"62" | "fBodyAccMag-std()" | "numeric" | "-0.99 / 0.18" | "-0.62"
"63" | "fBodyBodyAccJerkMag-mean()" | "numeric" | "-0.99 / 0.54" | "-0.58"
"64" | "fBodyBodyAccJerkMag-std()" | "numeric" | "-0.99 / 0.32" | "-0.6"
"65" | "fBodyBodyGyroMag-mean()" | "numeric" | "-0.99 / 0.2" | "-0.67"
"66" | "fBodyBodyGyroMag-std()" | "numeric" | "-0.98 / 0.24" | "-0.67"
"67" | "fBodyBodyGyroJerkMag-mean()" | "numeric" | "-1 / 0.15" | "-0.76"
"68" | "fBodyBodyGyroJerkMag-std()" | "numeric" | "-1 / 0.29" | "-0.77"


### R code for making data summary
```{r}
codeBook.md <- function(set) {
      df <- dplyr::data_frame(
            colNames = names(set),
            class = sapply(set, class),
            range = sapply(set, function(x)
                  if(class(x) == "factor")
                        paste(levels(x), collapse = " / ")
                  else if(class(x) == "numeric" ||
                           class(x) == "integer")
                        paste(round(min(x), 2), round(max(x), 2), sep = " / ")
                  else 
                        class(x)),
            mean = sapply(set, function(x)
                  if(class(x) == "numeric")
                        round(mean(x), 2)
                  else 
                        "Not available")
            )
      write.table(df, "codeBook.md", sep = " | ")
}
## Reference for making summary table into markdown file:
## https://github.com/uludagy/GettingandCleaningData/blob/master/codeBook.md
## dataMaid::makeCodebook is also a powerful tool.
```