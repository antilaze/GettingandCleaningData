# Downloads and unzips the data
zurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zurl, destfile = "./project.zip", method = "curl")
unzip("./project.zip")

# sets the working directory to the unzip directory
setwd("./UCI HAR Dataset")

# loads the packages for later use
library(tidyr)
library(dplyr)

# 1. Merges the training and the test sets to one data set.
# Loads the records of activities
fullAct <- rbind(
      read.table("test/X_test.txt", header = FALSE),
      read.table("train/X_train.txt", header = FALSE) 
      )
# Loads the lables of the records
fullLab <- rbind(
      read.table("test/y_test.txt", header = FALSE),
      read.table("train/y_train.txt", header = FALSE)
      ) 
# Loads the subject of the records
fullID <- rbind(
      read.table("test/subject_test.txt"), 
      read.table("train/subject_train.txt") 
      ) 
# Forms one new full data set
fullDf <- cbind(fullID, fullLab, fullAct)

# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.
## subsets the variable names of the record
varNames <- read.table("features.txt", header = FALSE)$V2 
varPosit <- grep("(std|mean)[^Freq]", varNames, ignore.case = FALSE) 
## use [^Freq] to exclude meanfreq() from selecting
## these measuring variables start from the 3rd position, thus +2 posit.
## subsets the data with selected columns
fullDf <- fullDf[, c(1, 2, (varPosit+2))]

# 3. Uses descriptive activity names to name the activities in the data set
actLab <- read.table("activity_labels.txt", header = FALSE)
## adds a new variable that codes the activity names to the data frame, then 
## replaces number labels of activity with the descriptive names.
fullDf[, 2] <- factor(fullDf[, 2], levels = actLab[,1], labels = actLab[,2])
## an option is using merge(), yet doing this way the levels of the activity labels 
## and the data frame will be reordered
## fullDf <- merge(fullDf, actLab, by.x ="V1.1", by.y = "V1") %>%
##           mutate("V1.1" = V2.y, V2.y = NULL) 

# 4. Appropriately labels the data set with descriptive variable names
varNames <- varNames[varPosit] 
colnames(fullDf) <- colNames <- c("ID", "activity", as.character(varNames))
## varNames = names of measurements; colNames = names of all columns in the data set

# 5.From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.
tDf <- group_by(fullDf, ID, activity) %>%
      summarise_all(funs(mean))
write.table(tDf, "tidyData.txt", sep = ",", col.names = colNames, row.names = FALSE)