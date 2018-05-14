##############################################################################
#
# FILE
#   run_analysis.R
#
# OVERVIEW
#   Using data collected from the accelerometers from the Samsung Galaxy S 
#   smartphone, work with the data and make a clean data set, outputting the
#   resulting tidy data to a file named "tidy_data.txt".
#   See README.md for details.
#

library(dplyr)

##############################################################################
# Step 1 - Merge the training and the test sets to create one data set
##############################################################################

dir <- "/home/omar/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/"
trainData <- read.table(paste(dir,"train/X_train.txt",sep=""))
dim(trainData) 
head(trainData)
trainLabel <- read.table(paste(dir,"train/y_train.txt",sep=""))
table(trainLabel)
trainSubject <- read.table(paste(dir,"train/subject_train.txt",sep=""))
testData <- read.table(paste(dir,"test/X_test.txt",sep=""))
dim(testData) 
testLabel <- read.table(paste(dir,"test/y_test.txt",sep=""))
table(testLabel) 
testSubject <- read.table(paste(dir,"test/subject_test.txt",sep=""))
joinData <- rbind(trainData, testData)
dim(joinData) 
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) 
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) 

##############################################################################
# Step 2 - Extract only the measurements on the mean and standard deviation
#          for each measurement
##############################################################################

features <- read.table(paste(dir,"features.txt",sep=""))
dim(features)  
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices) 
joinData <- joinData[, meanStdIndices]
dim(joinData) 
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) 
names(joinData) <- gsub("mean", "Mean", names(joinData)) 
names(joinData) <- gsub("std", "Std", names(joinData)) 
names(joinData) <- gsub("-", "", names(joinData)) 

##############################################################################
# Step 3 - Use descriptive activity names to name the activities in the data
#          set
##############################################################################

activity <- read.table(paste(dir,"activity_labels.txt",sep=""))
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

##############################################################################
# Step 4 - Appropriately label the data set with descriptive variable names
##############################################################################

names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanedData)
write.table(cleanedData, paste(dir,"merged_data.txt",sep="")) 

##############################################################################
# Step 5 - Create a second, independent tidy set with the average of each
#          variable for each activity and each subject
##############################################################################
subjectLen <- length(table(joinSubject)) 
activityLen <- dim(activity)[1] 
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(result)
write.table(result, paste(dir,"data_with_means.txt",sep="")) 
