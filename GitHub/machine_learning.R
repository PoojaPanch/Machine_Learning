##Load in training and testing sets and required packages
training <- read.csv("pml-training.csv")
testing <- read.csv("pml-testing.csv")
library(caret)
library(randomForest)
##Keep only the variables that pretain to the accelerometer numbers. When looking at the data,
##it was clear that many of the variances had NAs. While this could have been dealt with by 
##imputing the data, I felt that the variances may not have been necessary in building a 
##prediction model. My assumption was that they were the variances on the total acceleration 
##for each part measured, but this can be calculated manually.
training1 <- cbind(training[grep("accel" , colnames(training))], training[-grep("var", 
colnames(training))], training["classe"])
testing1 <- cbind(testing[grep("accel", colnames(testing))], testing[-grep("var", 
colnames(testing))], testing["classe"])

##I've decided to use the random forests method to build a prediction algorithm since it is
##optimal in determining how each variable effects the response.
randomf <- randomForest(classe~., data=training1)

