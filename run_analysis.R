### run_analysis.R

### What this program does
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. Creates a second tidy data set with average of each variable for each activity and subject.

### assume data files are in current directory
### data files used for input:
#   activity_labels.txt - map activity class 1-6 to activity name
#   features.txt - map column number 1-561 to variable name in training set and test set
#   train/X_train.txt - training set
#   train/subject_train.txt - subject number, range 1-30, for each observation in training set
#   train/y_train.txt - activity number, range 1-6, for each observation in training set
#   test/X_test.txt - test set
#   test/subject_test.txt - subject number, range 1-30, for each observation in test set
#   test/y_test.txt - activity number, range 1-6, for each observation in test set


### 1. merge observations from training and test sets

df.training.observations <- read.table("train//X_train.txt")
df.test.observations <- read.table("test//X_test.txt")
df.merged.observations <- rbind(df.training.observations, df.test.observations)

### 2. extract only mean and standard deviation for each measurement

# extraction decision 1 - include frequency domain variables
#   In a sense these are derived from time domain and not raw measurements,
#   but include them anyway, because the (hypothetical) purpose of the
#   tidy data set is not given in this exercise.

# extraction decision 2 - exclude "meanFreq" variables
#   These are weighted averages, not unweighted means, and do not have corresponding
#   "std" variables in the feature list.

df.features = read.table("features.txt")
mean.features <- grepl("mean()",df.features[,2],fixed = TRUE)
std.features <- grepl("std()",df.features[,2],fixed = TRUE)
df.extracted.observations <- df.merged.observations[,mean.features | std.features]

### 3. use descriptive activity names

# merge training and test activity classes in same order as observations in step 1

df.training.activities <- read.table("train//y_train.txt")
df.test.activities <- read.table("test//y_test.txt")
df.merged.activites <- rbind(df.training.activities, df.test.activities)

df.activity_labels <- read.table("activity_labels.txt")
named.merged.activities <- df.activity_labels[df.merged.activites[,1],2]

# don't put these names into the main dataframe until step 4 is complete

### 4. label the observation variables

features.extracted.raw.names <- df.features[mean.features | std.features,2]
f.temp <- gsub("^t","Time",features.extracted.raw.names)
f.temp <- gsub("^f","Freq",f.temp)
f.temp <- gsub("-mean\\(\\)-?","Mean",f.temp)
f.temp <- gsub("-std\\(\\)-?","Std",f.temp)
names(df.extracted.observations) <- f.temp

### 5. create second tidy data set with average of each variable for each activity and subject

# merge training and test subjects in same order as observations in step 1

df.training.subjects <- read.table("train//subject_train.txt")
df.test.subjects <- read.table("test//subject_test.txt")
df.merged.subjects <- rbind(df.training.subjects, df.test.subjects)

# append columns for subject and activity name to main dataframe

# aggregate and compute means

df.tidy <- aggregate(df.extracted.observations,
  by = list(Subject=df.merged.subjects[,1],Activity=named.merged.activities),FUN = mean)

# use write.table to write the result as a space-delimited text file with header row
write.table(x = df.tidy,file = "tidy-data.txt",row.names = FALSE)

###
