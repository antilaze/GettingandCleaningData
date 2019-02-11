Getting and Cleaning Data Course Project
=============================================
The purpose of this project is to demonstrate the ability to collect, work with, 
and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

In this repo:
- README.md: explanation of the project and the r script
- run_analysis.R: srcipt used to clean data
- codeBook.md: description of the tidy data
- tidyData.txt: the cleaning data in txt format
- tidyData.csv: the cleaning data in csv format


### Data


We use a smartphone dataset, which is collected from the accelerometers of 
smartphone Samsung Galaxy S II with a group of 30 volunteers performing 6 activities.

The full discription of the data is available at the site where the data was
obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### System information
Rstudio Version 1.1.463
R version 3.5.2 (2018-12-20)
Platform: x86_64-apple-darwin15.6.0 (64-bit)
Running under: macOS Mojave 10.14.1

### Major tasks of the script


1. Merges the training and the test sets to one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


### Data processing details


Downloads and unzips the dataset into the working directory.
```{r}
zurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zurl, destfile = "./project.zip", method = "curl")
unzip("./project.zip")
```
Since all the unzipping files are stored in a directory called "UCI HAR Dataset," sets the working directory to "UCI HAR Dataset."
```{r}
setwd("./UCI HAR Dataset")
```
Loads the R packages for later use
```{r}
library(tidyr)  ## version: tidyr_0.8.2
library(dplyr)  ## version: dplyr_0.7.8 
```

1. Merges the training and the test sets to one data frame, which contains 10299 observations (test set has 2947 obs. while train set has 7252 obs.) and 563 variables. 
```{r}
# Reads the records of activities
fullAct <- rbind(
      read.table("test/X_test.txt", header = FALSE),
      read.table("train/X_train.txt", header = FALSE) 
      )
# Reads the lables of the records
fullLab <- rbind(
      read.table("test/y_test.txt", header = FALSE),
      read.table("train/y_train.txt", header = FALSE)
      ) 
# Reads the subject of the records
fullID <- rbind(
      read.table("test/subject_test.txt"), 
      read.table("train/subject_train.txt") 
      ) 
# Forms one new full data set
fullDf <- cbind(fullID, fullLab, fullAct)
```

2. Extracts only the measurements on the mean and standard deviation for each measurement. Thus, the data frame narrows down to 68 variables (with the first two columns are ID and activity type).
```{r}
## selects the required variables in the records 
varNames <- read.table("features.txt", header = FALSE)$V2 
varPosit <- grep("(std|mean)[^Freq]", varNames, ignore.case = FALSE) 
## use [^Freq] to exclude meanfreq() from selecting
## these measuring variables start from the 3rd position
## subsets the data with selected columns
fullDf <- fullDf[, c(1, 2, (varPosit+2))]
```

3. Uses descriptive activity names, instead of the number indicators in the original data, to name the activities in the data frame.
```{r}
actLab <- read.table("activity_labels.txt", header = FALSE)
## adds a new variable that contains the activity names to the data frame, then 
## replaces number labels of activity with the descriptive names.
fullDf[, 2] <- factor(fullDf[, 2], levels = actLab[,1], labels = actLab[,2])
## an option is using merge(), yet doing this way the levels of the activity labels 
## and the data frame will be reordered
## fullDf <- merge(fullDf, actLab, by.x ="V1.1", by.y = "V1") %>%
##           mutate("V1.1" = V2.y, V2.y = NULL) 
```

4. Appropriately labels the data set with descriptive variable names
```{r}
varNames <- varNames[col] 
colnames(fullDf) <- colNames <- c("activity", "ID", as.character(varNames))
## varNames = names of measurements; colNames = names of all columns in the data set
```

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Therefore, the tidy data set has 180 observations (30 subjects * 6 activities) and 68 variables (the average of the mean and standard deviation of each measaurement).
```{r}
tDf <- group_by(fullDf, ID, activity) %>%
      summarise_all(funs(mean)) 
write.table(tDf, "tidyData.txt", sep = ",", col.names = colNames, row.names = FALSE)
```