Variables:

x_train: training data from Smartphone study
y_train: training labels, numbered 1-6 corresponding to the activity labels
x_test: testing data from Smartphone study
x_train: testing labels, numbered 1-6 corresponding to the activity labels
features: list of all the features tested in study, used to label x_test and x_train columns

train_join/test_join: matches the training/testing labels with the activity numbers 
subject_train/subject_test: Smartphone study participants were labelled 1-30, this contains a list of all these subjects

train: new data frame combining the training data, activity names, and subjects
test: similar to train, but combines the information for the test numbers

mean_stds: finds all the means and standard deviation values in features 

test_train: combines all the test and train information into one dataset, appends row information based on common column names

aggy: uses aggregate function to take the means of the test_train information based on Subject and Activity values

Data & Transformations:

All of the variables come from the Smartphone data found from the uci website. The data was initially separated based on activity name, number, subject, raw data, and features. The data was combined into one data frame where training and testing values where put into the same column based on feature variable values. The means of the variables in this data frame were then taken based on Subject and Activity values and put into the TidySet.txt file. 
