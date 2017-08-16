## Variables, data and transformations performed to clean up the data 

### 1) Get source file
We need to download the source file (Dataset.zip) from this link: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

### 2) Read Souce Files
Dataset.zip contains the following source files. 

<li><i>Activity</i> : Labels for activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
<li><i>Features</i>: List of all features
<br><br>
TRAINING DATA
<li><i>trainX</i> : Measurements produced by sensors. Assigned to the training split. 
<li><i>trainY</i> : Activities associated to the measures in trainX
<li><i>trainSub</i> : Identify the subject who performed the activity (training)
<br>
TEST DATA
<li><i>testX</i> : Measurements produced by sensors. Assigned to the test split. 
<li><i>testY</i> : Activities associated to the measures in testX
<li><i>testSub</i> : Identify the subject who performed the activity (test)

### 3) Substitute Columns names for Xs tables
We use the feature table (features) to substitute the column labels in the measurement tables
(testX and trainX)

### 4) Merge test tables using <i>cbind</i> 
We merge testX, testY and testSub using the cbind function (combine by column)

### 5) Merge train tables using <i>cbind</i>
We merge trainX, trainY and trainSub using the cbind function (combine by column)

### 6) Append test and train data in one table using <i>rbind</i>
We append the tables created in the previous two steps (test and train) in one single table (total) using rbind.

### 7) Extract only mean and standard deviation
We use the grep function to select only the mean and standard deviation variables. We keep as well the subject and activity variables that will be used later.

### 8) Add descriptive activity names
We add the activity labels to the activity id variable

### 9) Creates a table with the average of each variable for each activity and subject
We use <b>melt</b> and <b>ddply</b> to transpose features to row level and calculate the average of measurement for each feature. Data are as well grouped by activity and subject.

### 10) Write tidy table 
We produce a txt file <b>avgBy.txt</b> with the output from the previous step
