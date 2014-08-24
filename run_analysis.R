### run_analysis.R

### see README.md for more information on how this works

### 1. merge observations from training and test sets

df.training.observations <- read.table("train//X_train.txt")
df.test.observations <- read.table("test//X_test.txt")
df.merged.observations <- rbind(df.training.observations, df.test.observations)

### 2. extract only mean and standard deviation for each measurement

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
