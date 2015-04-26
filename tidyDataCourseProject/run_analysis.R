library(dplyr)

# 0. Loading test and train data sets

featureLabels <- read.csv("features.txt", sep = "", header = F)[, 2]

# creating test data set
testFeatures <- read.csv("test/X_test.txt", sep = "", header = F, col.names = featureLabels)
testActivities <- read.csv("test/y_test.txt", sep = "", header = F, col.names = "ActivityName", colClasses = "factor")
testSubjects <- read.csv("test/subject_test.txt", sep = "", header = F, col.names = "SubjectId", colClasses = "numeric")
testFeatures <- cbind(testActivities, testSubjects, testFeatures)

# creating training data set
trainFeatures <- read.csv("train/X_train.txt", sep = "", header = F, col.names = featureLabels)
trainActivities <- read.csv("train/y_train.txt", sep = "", header = F, col.names = "ActivityName", colClasses = "factor")
trainSubjects <- read.csv("train/subject_train.txt", sep = "", header = F, col.names = "SubjectId", colClasses = "numeric")
trainFeatures <- cbind(trainActivities, trainSubjects, trainFeatures)


## 1. Merge two data sets
features <- rbind(testFeatures, trainFeatures)


## 2. Extract columns with mean and standard deviation measurements(and subject/activity data as well)
columnsToExtract <- c("ActivityName", "SubjectId", make.names(grep(".*(mean|std)\\(.*", featureLabels, value = TRUE, ignore.case = F)))
features <- features[, columnsToExtract]


## 3. Set activity labels levels so they have understandable names
activityLabels <- as.vector(read.csv("activity_labels.txt", sep = "", header = F)[, 2])
levels(features$ActivityName) = activityLabels


## 4. Set appropriate labels for the data set variables
clarifiedNames <- make.names(sapply(colnames(features), function(columnName) { 
    clarifiedName <- gsub("\\.\\.|\\.\\.\\.", ".", columnName)
    clarifiedName <- gsub("^t", "time.", clarifiedName)
    clarifiedName <- gsub("^f", "frequency.", clarifiedName)
    
    clarifiedName <- sub("Acc", "Accelerometer", clarifiedName)
    clarifiedName <- sub("Gyro", "Gyroscope", clarifiedName)
    clarifiedName <- sub("BodyBody", "Body", clarifiedName)
    clarifiedName <- sub("Mag", ".Magnitude", clarifiedName)
    clarifiedName <- sub("std", "standard.deviation", clarifiedName)
}))
colnames(features) <- clarifiedNames


## 5. Create a tidy data set
# Grouping by ActivityName and SubjectId and finding average for all values within all groups
tidyDataSet <- aggregate(. ~ ActivityName + SubjectId, features, mean)

# Sorting tidy data set by ActivityName and SubjectId, just to make output feel cleaner
tidyDataSet <- arrange(tidyDataSet, ActivityName, SubjectId)

write.table(tidyDataSet, file = "tidyData.txt", row.name = FALSE)
