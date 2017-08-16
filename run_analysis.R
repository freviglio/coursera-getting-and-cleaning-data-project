## Getting Data in R
library(data.table)
library(plyr)
library(reshape2)

#Get source file
zipFile = download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="Dataset.zip")

#Read Files
unzip("Dataset.zip")
activity_labels <- fread("UCI HAR Dataset/activity_labels.txt")
features <- fread("UCI HAR Dataset/features.txt")
trainX <- fread("UCI HAR Dataset/train/X_train.txt")
trainY <- fread("UCI HAR Dataset/train/Y_train.txt")
trainSub <- fread("UCI HAR Dataset/train/subject_train.txt")
testX <- fread("UCI HAR Dataset/test/X_test.txt")
testY <- fread("UCI HAR Dataset/test/Y_test.txt")
testSub <- fread("UCI HAR Dataset/test/subject_test.txt")

#rename columns for Y and Subject tables
colnames(trainY)="activity_id"
colnames(testY)="activity_id"
colnames(testSub)="subject_id"
colnames(trainSub)="subject_id"
#rename activity label
colnames(activity_labels) = c("activity_id", "activity_label")

# Substitute Columns names for Xs tables
colnames(trainX) <- t(features$V2)
colnames(testX) <- t(features$V2)

# Create a tot dataset for train and test)
test <- cbind(testX, testY, testSub)
train <- cbind(trainX, trainY, trainSub)

#Set all in one dataset
total <- rbind(test, train)

#Extracting only mean and standard deviation
colNames <- colnames(total)
selcol <- colNames[(grep("\\bmean()\\b|std()|^activity_id|^subject_id",colNames))]
MeanStd <- total[ , selcol, with=FALSE]

#Check consistency
if(nrow(MeanStd)==nrow(total)) {print("OK,same obs")}

#Add descriptive activity names from activity_labels file
MeanStd2 <- merge(MeanStd, activity_labels, by="activity_id", all.x=TRUE)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject
melted <- melt(MeanStd2, id.vars=c("activity_id","activity_label","subject_id"))

tidy <- ddply(melted, c("activity_id", "activity_label", "subject_id", "variable"), summarise, mean = mean(value))

##Write tidy data set in txt file
write.table(tidy, "avgBy.txt", row.name=FALSE)
