# Getting and Cleaning Data - Week 3 Class Project

## run_analysis.R

### Assignment is to write a program that:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second tidy data set with average of each variable for each activity and subject.

### Data files used for input:

- activity_labels.txt - map activity class, integer 1-6, to activity name
- features.txt - map column number, integer 1-561, to variable name in training and test set
- train/X_train.txt - training set
- train/subject_train.txt - subject number, range 1-30, for each observation in training set
- train/y_train.txt - activity number, range 1-6, for each observation in training set
- test/X_test.txt - test set
- test/subject_test.txt - subject number, range 1-30, for each observation in test set
- test/y_test.txt - activity number, range 1-6, for each observation in test set

### Which observations were extracted:

1. Exclude "meanFreq" variables because they are weighted averages, not unweighted means,
and do not have corresponding "std" variables in the feature list.
2. Include all other "mean" and "std" variables from observations, including frequency domain
variables. It could be argued that frequency domain variables are derived from time domain and
are therefore not raw measurements, but they are included because they might be wanted. The
(hypothetical) purpose of the tidy data set is not given in this exercise.

### How the script works.

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

Step 5 computes them mean value of selected observations for pair of subject and activity values,
inserting columns for subject number and activity name at the the start of the dataframe. The result
is then written to "tidy-data.txt" a space-delimited text file with header.


### running the program
        # assume working directory has data files above and script run_analysis.R
        source("run_analysis.R)
        ... view output in text file "tidy-data.txt" ...



