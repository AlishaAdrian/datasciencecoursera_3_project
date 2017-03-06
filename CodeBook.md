Alisha Adrian  
Final Project  
Course 3: Getting and Cleaning Data  

#Code Book for project  

The original code book for the data in this project is in the repo as a Word file.
In this file, I only describe the processes I used to create new data files from the original data. 

Goal: Combine the train and test data into one dataframe.  

1. For each data type (train and test):    
    1. Read in subject id and activity type  
    2. Create new variable, called type, which indicates whether the data came from the training set or the test set.  
    3. Read in the measurement data  
2. Combine the two data frames into one 
3. Clean up memory by deleting temporary data  

Goal: Extract only the mean and stdev measurement columns  

1. Read in the measurement labels  
2. Find the labels which contain either "-mean()" or "-stdev()" and keep them  
3. Create a new data frame which only includes the columns to keep  

Goal: Name the activities with descriptive names

1. Change the activities variable to a factor   
2. Give labels to describe the activities  

Goal: Add descriptive variable names

1. Create a variable name list consisting of only the variables that were kept in the extraction goal  
2. Assign these names to the variables.  

The resulting data frame is tidy because each variable is in its own column and each observation of that variable is in a different row. There is only one table because all data are measurements.
This data frame is stored in the file all_data.csv  

Goal: Create a new tidy data set, which stores the mean measurement value for each type of measurement, across participants and activities  

1. Load the dplyr library  
2. Group the data by subject and activity  
3. Melt the data using subject + activity as the ID  
4. Create the means using dcast  
5. Store the new tidy data set into averages.csv  

The resulting data frame is tidy because each variable is in its own column and each observation of that variable is in a different row. There is only one table because all data are measurements.  




