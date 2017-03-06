# datasciencecoursera_3_project
Final Project for Course 3: Getting and Cleaning Data
created by AlishaAdrian

Information on how the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Files in the repo:  
README.md - this file  
CodeBook.md - the code book that describes the variables, data, and analysis  
run_analysis.R - R script that does the following:  
  1. Merges the training and the test sets to create one data set.  
  2. Extracts only the measurements on the mean and standard deviation for each measurement.  
  3. Uses descriptive activity names to name the activities in the data set.  
  4. Appropriately labels the data set with descriptive variable names.  
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
  
all_data.csv - a tidy data set containing the training and test data merged together  
averages.csv - a tidy data set containing the average of each variable from 2. above, for each activity and each subject  

The run_analysis.R script reads these data from these files:  
     Data            File name  
1.  subject id      subject_test.txt  
2.  activity        y_test.txt  
3.  measurements    X_test.txt  
4.  subject id      subject_train.txt  
5.  activity        y_train.txt  
6.  measurements    X_train.txt  
  
Outline of Analysis in run_analysis.R script 
1. Read in all test data and create my.test.data containing subject id, activity, test or train indicator, and measurement data  
2. Read in all train data and create my.train.data containing subject id, activity, test or train indicator, and measurement data  
3. Combine my.test.data and my.train.data to create my.data  
4. Extract only the mean and standard deviation columns  
5. Replace activity numbers with meaningful labels and convert to factor data  
6. Label the data set with descriptive variable names  
7. Write the tidy data set to file "all_data.csv"  
8. Create a new tidy data set - for each combination of subject id and activity type, compute the average for each variable  
9. Write the new tidy data set to file "averages.csv"  


  
