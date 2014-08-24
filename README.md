# Getting and Cleaning Data - Week 3 Class Project

# Assignment: write program *run_analysis.R* that:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second tidy data set with average of each variable for each activity and subject.

## How the script works.

There are three pairs of files to be merged from training and test runs: observations, subjects,
and activity classes. These are merged using separate rbind operations to allow working on
just the observations for much of the script.

Step 1 reads and merges the observation data.

Step 2 creates logical vectors to select the desired mean and standard deviation files and
uses it to select desired columns from the merged observation data.

Step 3 creates a factor list giving the activity name for each row in the observation data.

Step 4 creates a list of descriptive variable names for the observations using simple text
substitions:
- replace initial "t" with "Time" to indicate time-domain variable
- replace initial "f" with "Freq" to indicate frequency-domain variable
- replace "-mean()", with or without following hyphen, by "Mean"
- replace "-std()", with or without following hyphen, by "Std"

For example, "tBodyAcc-std()-X" becomes "TimeBodyAccStdX" and "fBodyAccMag-mean()" becomes "FreqBodyAccMagMean".

Step 5 computes the mean value of selected observations for pair of subject and activity values,
inserting columns for subject number and activity name at the the start of the dataframe. The result
is then written to "tidy-data.txt" a space-delimited text file with header.


## Running the program

1. Download dataset zip archive from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Unzip dataset. It creates folder "UCI HAR Dataset".
3. Install script run_analysis.R to dataset folder "UCI HAR Dataset".
4. Start R studio or command session and do the following:

    setwd("... path to dataset folder ...")
    source("run_analysis.R")
    ... view output in text file "tidy-data.txt" ...

