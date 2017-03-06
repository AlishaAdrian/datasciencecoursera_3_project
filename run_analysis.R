##  Course 3: Getting and Cleaning Data
## Alisha Adrian Waller
## Course Project 
## Human Activity Recognition Using Smartphones

#### I am using RStudio to complete this assignment

#### Task 1: Create Tidy Data Set #################
################### Test Data 
##### Load test data from files and merge together

library(readr)
subject_test <- read_csv("D:/Data_Science_Coursera/3. Getting and Cleaning Data/Project/Dataset/test/subject_test.txt", col_names = FALSE)
y_test <- read_csv("D:/Data_Science_Coursera/3. Getting and Cleaning Data/Project/Dataset/test/y_test.txt",col_names = FALSE)

# set new variable for test or train
type =  rep("test", length.out = length(subject_test$X1))

my.test.data = cbind(subject_test,y_test,type)

names(my.test.data) = c("subject","activity", "type")

## clean up
rm(subject_test)
rm(y_test)
rm(type)

## read in the X_test data, line by line
myfile ="./Dataset/test/X_test.txt"
xdata = read.table(myfile,quote="")

my.test.data = cbind(my.test.data,xdata)

## clean up
rm(xdata)
## save in case of problems
dput(my.test.data,file="mytestdata")

############### End Test Data

############ Training Data 
##### Load train data from files and merge together

subject_train <- read_csv("D:/Data_Science_Coursera/3. Getting and Cleaning Data/Project/Dataset/train/subject_train.txt", col_names = FALSE)
y_train <- read_csv("D:/Data_Science_Coursera/3. Getting and Cleaning Data/Project/Dataset/train/y_train.txt",col_names = FALSE)
type =  rep("train", length.out =  length(subject_train$X1))
my.train.data = cbind(subject_train,y_train,type)
names(my.train.data) = c("subject","activity","type")

## clean up
rm(subject_train)
rm(y_train)
rm(type)

## read in the X_train data, line by line
myfile ="./Dataset/train/X_train.txt"
xdata = read.table(myfile,quote="")
my.train.data = cbind(my.train.data,xdata)

## clean up
rm(xdata)
dput(my.train.data,file="mytraindata")

########### End training data 

########## merge two data sets

my.data = rbind(my.train.data,my.test.data)
dput(my.data,file="mydata")

## clean up
rm(my.test.data)
rm(my.train.data)


##### TAsk 1 merge data into tidy data set complete

#########################################
## Tidy Data Set Completed  (called my.data)
## 1. Each variable is in a different column
## 2. Each different observation is in a different row
## 3. One table for each "kind" of data
## 4. If multiple tables, then one identifier column which links them.
###################################################


######### Task 2: Extract only the mean and stdev measurement columns #####
myfeaturelabels <- read_csv("D:/Data_Science_Coursera/3. Getting and Cleaning Data/Project/Dataset/myfeaturelabels.csv", 
                            col_names = FALSE)

features = myfeaturelabels$X1
mean_indices = grep("-[Mm]ean()" ,features)
mean_indices = mean_indices + 3  # shift to match my.data
std_indices = grep("-[Ss]td()", features)
std_indices = std_indices + 3  # shift to match my.data
keep_indices = c(1:3)
keep_indices = append(keep_indices, mean_indices, after = length(keep_indices))
keep_indices = append(keep_indices, std_indices, after = length(keep_indices))

keep_indices = sort(keep_indices)

#### keep only columns in keep_indicies and save to new dataframe
stats.data = my.data[,keep_indices]

######## Task 2: Extract only mean and stdev meas. complete 

####### Task 3: Use descriptive activity names to name the activities ####

# change activity to factor variable
stats.data$activity = factor(stats.data$activity, labels = c("Walking","Walking_Upstairs","Walking_Downstairs","Sitting","Standing","Laying"))
############ Task 3 activities labeled complete 


######## Task 4 Label data set with descriptive variable names #####

########## Adding var labels
v=c("subject","activity","type")
varlabels = append(v,features,after=length(v))
keepvarlabels = varlabels[keep_indices]
names(stats.data) = keepvarlabels
############ Task 4 var labels complete


## write first tidy data set
write.csv(stats.data,file="all_data.csv", row.names=FALSE)

########## Task 5 Create tidy data set with average of each var for each activity and each subject ####

library("dplyr", lib.loc="~/R/win-library/3.3")
id_indices = c(1:3)
my.data.3 = stats.data %>% group_by(subject,activity) 
  
## melt and dcast
library("reshape2", lib.loc="~/R/win-library/3.3")
meas.labels = myfeaturelabels$X1[sort(c(mean_indices-3,std_indices-3))]
data.melt = melt(my.data.3,id=c("subject","activity"), measure.vars=meas.labels)
my.data.4 = dcast(data.melt, subject + activity ~ variable, mean)


## write second tidy data set
write.csv(my.data.4,file="averages.csv", row.names=FALSE)

