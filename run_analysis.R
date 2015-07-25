library(plyr)

##----------------------------------------------------------
## Combine all the components of the train data 
##----------------------------------------------------------

## Load all the files first adding a sequential row id for merging later on

features <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", sep = "", header = FALSE)
xTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep = "", col.names = features$V2, header = FALSE)
xTrain$rowid <- seq.int(nrow(xTrain))

subjectColNames = as.character("subjectId")
subjectTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep = "", col.names = subjectColNames, header = FALSE)
subjectTrain$rowid <- seq.int(nrow(subjectTrain))

yColNames = as.character("activityCode")
yTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", sep = "", col.names = yColNames, header = FALSE)
yTrain$rowid <- seq.int(nrow(yTrain))

activityColNames = c("activityCode", "activityName")
activityLabels <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", sep = "", col.names = activityColNames, header = FALSE)

bodyAccXTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", sep = "", header = FALSE)
bodyAccYTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", sep = "", header = FALSE)
bodyAccZTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", sep = "", header = FALSE)

bodyGyroXTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", sep = "", header = FALSE)
bodyGyroYTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", sep = "", header = FALSE)
bodyGyroZTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", sep = "", header = FALSE)

totalAccXTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", sep = "", header = FALSE)
totalAccYTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", sep = "", header = FALSE)
totalAccZTrain <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", sep = "", header = FALSE)

## Start combining all the columns 

activityTrain <- merge(yTrain, activityLabels)
dataListTrain <- list(subjectTrain, activityTrain, xTrain)
completeDataTrain <- join_all(dataListTrain)

completeDataTrain$bodyAccXMean <- rowMeans(bodyAccXTrain)
completeDataTrain$bodyAccXStd <- apply(bodyAccXTrain,1,sd)
completeDataTrain$bodyAccYMean <- rowMeans(bodyAccYTrain)
completeDataTrain$bodyAccYStd <- apply(bodyAccYTrain,1,sd)
completeDataTrain$bodyAccZMean <- rowMeans(bodyAccZTrain)
completeDataTrain$bodyAccZStd <- apply(bodyAccZTrain,1,sd)

completeDataTrain$bodyGyroXMean <- rowMeans(bodyGyroXTrain)
completeDataTrain$bodyGyroXStd <- apply(bodyGyroXTrain,1,sd)
completeDataTrain$bodyGyroYMean <- rowMeans(bodyGyroYTrain)
completeDataTrain$bodyGyroYStd <- apply(bodyGyroYTrain,1,sd)
completeDataTrain$bodyGyroZMean <- rowMeans(bodyGyroZTrain)
completeDataTrain$bodyGyroZStd <- apply(bodyGyroZTrain,1,sd)

completeDataTrain$totalAccXMean <- rowMeans(totalAccXTrain)
completeDataTrain$totalAccXStd <- apply(totalAccXTrain,1,sd)
completeDataTrain$totalAccYMean <- rowMeans(totalAccYTrain)
completeDataTrain$totalAccYStd <- apply(totalAccYTrain,1,sd)
completeDataTrain$totalAccZMean <- rowMeans(totalAccZTrain)
completeDataTrain$totalAccZStd <- apply(totalAccZTrain,1,sd)

##----------------------------------------------------------
## Combine all the components of the test data 
##----------------------------------------------------------

## Load all the files first adding a sequential row id for merging later on

xTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep = "", col.names = features$V2, header = FALSE)
xTest$rowid <- seq.int(nrow(xTest))

subjectTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep = "", col.names = subjectColNames, header = FALSE)
subjectTest$rowid <- seq.int(nrow(subjectTest))

yTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", sep = "", col.names = yColNames, header = FALSE)
yTest$rowid <- seq.int(nrow(yTest))

bodyAccXTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", sep = "", header = FALSE)
bodyAccYTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", sep = "", header = FALSE)
bodyAccZTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", sep = "", header = FALSE)

bodyGyroXTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", sep = "", header = FALSE)
bodyGyroYTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", sep = "", header = FALSE)
bodyGyroZTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", sep = "", header = FALSE)

totalAccXTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", sep = "", header = FALSE)
totalAccYTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", sep = "", header = FALSE)
totalAccZTest <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", sep = "", header = FALSE)

## Start combining all the columns 

activityTest <- merge(yTest, activityLabels)
dataList <- list(subjectTest, activityTest, xTest)
completeDataTest <- join_all(dataList)

completeDataTest$bodyAccXMean <- rowMeans(bodyAccXTest)
completeDataTest$bodyAccXStd <- apply(bodyAccXTest,1,sd)
completeDataTest$bodyAccYMean <- rowMeans(bodyAccYTest)
completeDataTest$bodyAccYStd <- apply(bodyAccYTest,1,sd)
completeDataTest$bodyAccZMean <- rowMeans(bodyAccZTest)
completeDataTest$bodyAccZStd <- apply(bodyAccZTest,1,sd)

completeDataTest$bodyGyroXMean <- rowMeans(bodyGyroXTest)
completeDataTest$bodyGyroXStd <- apply(bodyGyroXTest,1,sd)
completeDataTest$bodyGyroYMean <- rowMeans(bodyGyroYTest)
completeDataTest$bodyGyroYStd <- apply(bodyGyroYTest,1,sd)
completeDataTest$bodyGyroZMean <- rowMeans(bodyGyroZTest)
completeDataTest$bodyGyroZStd <- apply(bodyGyroZTest,1,sd)

completeDataTest$totalAccXMean <- rowMeans(totalAccXTest)
completeDataTest$totalAccXStd <- apply(totalAccXTest,1,sd)
completeDataTest$totalAccYMean <- rowMeans(totalAccYTest)
completeDataTest$totalAccYStd <- apply(totalAccYTest,1,sd)
completeDataTest$totalAccZMean <- rowMeans(totalAccZTest)
completeDataTest$totalAccZStd <- apply(totalAccZTest,1,sd)

## Combine the train and test data and extract all the mean and std columns

combinedData <- rbind(completeDataTrain, completeDataTest)
finalData <- combinedData[, c(
      "subjectId",
      "activityCode",
      "activityName",
      "tBodyAcc.mean...X",
      "tBodyAcc.mean...Y",
      "tBodyAcc.mean...Z",
      "tBodyAcc.std...X",
      "tBodyAcc.std...Y",
      "tBodyAcc.std...Z",
      "tGravityAcc.mean...X",
      "tGravityAcc.mean...Y",
      "tGravityAcc.mean...Z",
      "tGravityAcc.std...X",
      "tGravityAcc.std...Y",
      "tGravityAcc.std...Z",
      "tBodyAccJerk.mean...X",
      "tBodyAccJerk.mean...Y",
      "tBodyAccJerk.mean...Z",
      "tBodyAccJerk.std...X",
      "tBodyAccJerk.std...Y",
      "tBodyAccJerk.std...Z",
      "tBodyGyro.mean...X",
      "tBodyGyro.mean...Y",
      "tBodyGyro.mean...Z",
      "tBodyGyro.std...X",
      "tBodyGyro.std...Y",
      "tBodyGyro.std...Z",
      "tBodyGyroJerk.mean...X",
      "tBodyGyroJerk.mean...Y",
      "tBodyGyroJerk.mean...Z",
      "tBodyGyroJerk.std...X",
      "tBodyGyroJerk.std...Y",
      "tBodyGyroJerk.std...Z",
      "tBodyAccMag.mean..",
      "tBodyAccMag.std..",
      "tGravityAccMag.mean..",
      "tGravityAccMag.std..",
      "tBodyAccJerkMag.mean..",
      "tBodyAccJerkMag.std..",
      "tBodyGyroMag.mean..",
      "tBodyGyroMag.std..",
      "tBodyGyroJerkMag.mean..",
      "tBodyGyroJerkMag.std..",
      "fBodyAcc.mean...X",
      "fBodyAcc.mean...Y",
      "fBodyAcc.mean...Z",
      "fBodyAcc.std...X",
      "fBodyAcc.std...Y",
      "fBodyAcc.std...Z",
      "fBodyAccJerk.mean...X",
      "fBodyAccJerk.mean...Y",
      "fBodyAccJerk.mean...Z",
      "fBodyAccJerk.std...X",
      "fBodyAccJerk.std...Y",
      "fBodyAccJerk.std...Z",
      "fBodyGyro.mean...X",
      "fBodyGyro.mean...Y",
      "fBodyGyro.mean...Z",
      "fBodyGyro.std...X",
      "fBodyGyro.std...Y",
      "fBodyGyro.std...Z",
      "fBodyAccMag.mean..",
      "fBodyAccMag.std..",
      "fBodyBodyAccJerkMag.mean..",
      "fBodyBodyAccJerkMag.std..",
      "fBodyBodyGyroMag.mean..",
      "fBodyBodyGyroMag.std..",
      "fBodyBodyGyroJerkMag.mean..",
      "fBodyBodyGyroJerkMag.std..",
      "bodyAccXMean",
      "bodyAccXStd",
      "bodyAccYMean",
      "bodyAccYStd",
      "bodyAccZMean",
      "bodyAccZStd",
      "bodyGyroXMean",
      "bodyGyroXStd",
      "bodyGyroYMean",
      "bodyGyroYStd",
      "bodyGyroZMean",
      "bodyGyroZStd",
      "totalAccXMean",
      "totalAccXStd",
      "totalAccYMean",
      "totalAccYStd",
      "totalAccZMean",
      "totalAccZStd"
      )]
      
 write.table(finalData, file = "./data/final_raw_data.txt", sep = " ", eol = "\r\n", col.names = TRUE, row.names = FALSE)     
 
 ## Create summary data frame
 
 summaryData <- ddply(finalData, .(subjectId, activityName), summarize, 
      avgtBodyAcc.mean...X = mean(tBodyAcc.mean...X),
      avgtBodyAcc.mean...Y = mean(tBodyAcc.mean...Y),
      avgtBodyAcc.mean...Z = mean(tBodyAcc.mean...Z),
      avgtBodyAcc.std...X = mean(tBodyAcc.std...X),
      avgtBodyAcc.std...Y = mean(tBodyAcc.std...Y),
      avgtBodyAcc.std...Z = mean(tBodyAcc.std...Z),
      avgtGravityAcc.mean...X = mean(tGravityAcc.mean...X),
      avgtGravityAcc.mean...Y = mean(tGravityAcc.mean...Y),
      avgtGravityAcc.mean...Z = mean(tGravityAcc.mean...Z),
      avgtGravityAcc.std...X = mean(tGravityAcc.std...X),
      avgtGravityAcc.std...Y = mean(tGravityAcc.std...Y),
      avgtGravityAcc.std...Z = mean(tGravityAcc.std...Z),
      avgtBodyAccJerk.mean...X = mean(tBodyAccJerk.mean...X),
      avgtBodyAccJerk.mean...Y = mean(tBodyAccJerk.mean...Y),
      avgtBodyAccJerk.mean...Z = mean(tBodyAccJerk.mean...Z),
      avgtBodyAccJerk.std...X = mean(tBodyAccJerk.std...X),
      avgtBodyAccJerk.std...Y = mean(tBodyAccJerk.std...Y),
      avgtBodyAccJerk.std...Z = mean(tBodyAccJerk.std...Z),
      avgtBodyGyro.mean...X = mean(tBodyGyro.mean...X),
      avgtBodyGyro.mean...Y = mean(tBodyGyro.mean...Y),
      avgtBodyGyro.mean...Z = mean(tBodyGyro.mean...Z),
      avgtBodyGyro.std...X = mean(tBodyGyro.std...X),
      avgtBodyGyro.std...Y = mean(tBodyGyro.std...Y),
      avgtBodyGyro.std...Z = mean(tBodyGyro.std...Z),
      avgtBodyGyroJerk.mean...X = mean(tBodyGyroJerk.mean...X),
      avgtBodyGyroJerk.mean...Y = mean(tBodyGyroJerk.mean...Y),
      avgtBodyGyroJerk.mean...Z = mean(tBodyGyroJerk.mean...Z),
      avgtBodyGyroJerk.std...X = mean(tBodyGyroJerk.std...X),
      avgtBodyGyroJerk.std...Y = mean(tBodyGyroJerk.std...Y),
      avgtBodyGyroJerk.std...Z = mean(tBodyGyroJerk.std...Z),
      avgtBodyAccMag.mean.. = mean(tBodyAccMag.mean..),
      avgtBodyAccMag.std.. = mean(tBodyAccMag.std..),
      avgtGravityAccMag.mean.. = mean(tGravityAccMag.mean..),
      avgtGravityAccMag.std.. = mean(tGravityAccMag.std..),
      avgtBodyAccJerkMag.mean.. = mean(tBodyAccJerkMag.mean..),
      avgtBodyAccJerkMag.std.. = mean(tBodyAccJerkMag.std..),
      avgtBodyGyroMag.mean.. = mean(tBodyGyroMag.mean..),
      avgtBodyGyroMag.std.. = mean(tBodyGyroMag.std..),
      avgtBodyGyroJerkMag.mean.. = mean(tBodyGyroJerkMag.mean..),
      avgtBodyGyroJerkMag.std.. = mean(tBodyGyroJerkMag.std..),
      avgfBodyAcc.mean...X = mean(fBodyAcc.mean...X),
      avgfBodyAcc.mean...Y = mean(fBodyAcc.mean...Y),
      avgfBodyAcc.mean...Z = mean(fBodyAcc.mean...Z),
      avgfBodyAcc.std...X = mean(fBodyAcc.std...X),
      avgfBodyAcc.std...Y = mean(fBodyAcc.std...Y),
      avgfBodyAcc.std...Z = mean(fBodyAcc.std...Z),
      avgfBodyAccJerk.mean...X = mean(fBodyAccJerk.mean...X),
      avgfBodyAccJerk.mean...Y = mean(fBodyAccJerk.mean...Y),
      avgfBodyAccJerk.mean...Z = mean(fBodyAccJerk.mean...Z),
      avgfBodyAccJerk.std...X = mean(fBodyAccJerk.std...X),
      avgfBodyAccJerk.std...Y = mean(fBodyAccJerk.std...Y),
      avgfBodyAccJerk.std...Z = mean(fBodyAccJerk.std...Z),
      avgfBodyGyro.mean...X = mean(fBodyGyro.mean...X),
      avgfBodyGyro.mean...Y = mean(fBodyGyro.mean...Y),
      avgfBodyGyro.mean...Z = mean(fBodyGyro.mean...Z),
      avgfBodyGyro.std...X = mean(fBodyGyro.std...X),
      avgfBodyGyro.std...Y = mean(fBodyGyro.std...Y),
      avgfBodyGyro.std...Z = mean(fBodyGyro.std...Z),
      avgfBodyAccMag.mean.. = mean(fBodyAccMag.mean..),
      avgfBodyAccMag.std.. = mean(fBodyAccMag.std..),
      avgfBodyBodyAccJerkMag.mean.. = mean(fBodyBodyAccJerkMag.mean..),
      avgfBodyBodyAccJerkMag.std.. = mean(fBodyBodyAccJerkMag.std..),
      avgfBodyBodyGyroMag.mean.. = mean(fBodyBodyGyroMag.mean..),
      avgfBodyBodyGyroMag.std.. = mean(fBodyBodyGyroMag.std..),
      avgfBodyBodyGyroJerkMag.mean.. = mean(fBodyBodyGyroJerkMag.mean..),
      avgfBodyBodyGyroJerkMag.std.. = mean(fBodyBodyGyroJerkMag.std..),
      avgbodyAccXMean = mean(bodyAccXMean),
      avgbodyAccXStd = mean(bodyAccXStd),
      avgbodyAccYMean = mean(bodyAccYMean),
      avgbodyAccYStd = mean(bodyAccYStd),
      avgbodyAccZMean = mean(bodyAccZMean),
      avgbodyAccZStd = mean(bodyAccZStd),
      avgbodyGyroXMean = mean(bodyGyroXMean),
      avgbodyGyroXStd = mean(bodyGyroXStd),
      avgbodyGyroYMean = mean(bodyGyroYMean),
      avgbodyGyroYStd = mean(bodyGyroYStd),
      avgbodyGyroZMean = mean(bodyGyroZStd),
      avgbodyGyroZStd = mean(bodyGyroZStd),
      avgtotalAccXMean = mean(totalAccXMean),
      avgtotalAccXStd = mean(totalAccXStd),
      avgtotalAccYMean = mean(totalAccYMean),
      avgtotalAccYStd = mean(totalAccYStd),
      avgtotalAccZMean = mean(totalAccZMean),
      avgtotalAccZStd = mean(totalAccZStd)
      )
      
 write.table(summaryData, file = "./data/final_summary_data.txt", sep = " ", eol = "\r\n", col.names = TRUE, row.names = FALSE)           