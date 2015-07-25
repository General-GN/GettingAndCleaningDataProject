Steps to extract and summarise the data:

1 - Create data frame called features from the features.txt file  
2 - Create data frame xTrain from the X_train.txt file using the values on the second column of the features data frame as column names
3 - Add a sequential row id column to the xTrain data frame
4 - Create vector subjectColNames to contain the column names to be used for the subject_train.txt file
5 - Create data frame subjectTrain from the subject_train.txt file using the values on the subjectColNames vector as column names
6 - Add a sequential row id column  to the subjectTrain data frame
7 - Create vector yColNames to contain the column names to be used for the y_train.txt file
8 - Create data frame yTrain from the y_train.txt file using the values on the yColNames vector as column names
9 - Add a sequential row id column  to the yTrain data frame
10 - Create vector activityColNames to contain the column names to be used for the activity_labels.txt file
11 - Create data frame activityLabels from the activity_labels.txt file using the values on the yColNames vector as column names
12 - Create a data frame for each of the files under the train/Inertial Signals
13 - Merge the yTrain and activityLabels data frame into the activityTrain data frame
14 - Join the activityTrain, subjectTrain and xTrain using the row id columns to form the combined data frame called completeDataTrain
15 - Calculate the mean and standard deviation across all the columns of the data frames derived from the files in the train/Inertial Signals and add these as separate columns in the completeDataTrain data frame.
16 - Repeat steps 1 to 15 using the files under the test directory to produce the completeDataTest data frame.
17 - Combine the rows of the completeDataTrain and completeDataTest data frames into the combinedData data frame.
18 - Extract all the mean and standard deviation columns to produce the final data frame called finalData
19 - Write the finalData data frame to a file called ./data/final_raw_data.txt
20 - Use ddply to calculate the averages of all the finalData columns grouped by subject and activity and produce the summaryData data frame
21 - Write the summaryData data frame to a file called ./data/final_summary_data.txt



