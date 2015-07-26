setwd("~/UCI HAR Dataset/")

##Step 1
##Merge the test and train datasets
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")
features <- read.table("features.txt")

##Rename columns with the signal names specified in features
colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]

##Step 3
##creates one data frame with the Activity labels matched up with the corresponding train values
train_join <- left_join(y_train,labels)
colnames(train_join) <- c("Activity_Num", "Activity")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
colnames(subject_train) <- "Subject"
colnames(subject_test) <- "Subject"

##Creates a new data frame of the train values. 
##Data frame has train values matched up with the 30 subjects and activites
test_join <- left_join(y_test, labels)
colnames(test_join) <- c("Activity_Num", "Activity")

##Step 2
##Rows that only have measurements on the mean and std
means_stds <- grep("mean|std|Mean", features[,2])
test <- cbind(x_test[means_stds], test_join, subject_test)
train <- cbind(x_train[means_stds], train_join, subject_train)

##Step 4
##Many of the columns have already been labelled. 
##Puts the entire dataset together, combining the train and test variables 
##with the proper features, subjects, and activities 
test_train <- rbind(test,train)

##Step 5
##Writes an independent, tidy, data set with the average of each variable for 
##each activity and each subject
aggy <- aggregate(test_train[-c(87:89)],by = list(test_train$Subject, test_train$Activity), FUN = mean)
colnames(aggy)[1:2] <- c("Subject", "Activity")
write.table(aggy, file = "TidySet.txt", row.names = FALSE)