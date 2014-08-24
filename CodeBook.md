CodeBook for Getting and Cleaning Data Course Project
=====================================================

## Input

Dataset is from *Human Activity Recognition Using Smartphones Data Set*
at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The following Data files from the above dataset were used for input:

- *activity_labels.txt* - map activity class, integer 1-6, to activity name
- *features.txt* - map column number, integer 1-561, to variable name in training and test set
- *train/X_train.txt* - training set
- *train/subject_train.txt* - subject number, range 1-30, for each observation in training set
- *train/y_train.txt* - activity number, range 1-6, for each observation in training set
- *test/X_test.txt* - test set
- *test/subject_test.txt* - subject number, range 1-30, for each observation in test set
- *test/y_test.txt* - activity number, range 1-6, for each observation in test set

## Which observations were extracted:

1. Exclude "meanFreq" variables because they are weighted averages, not unweighted means,
and do not have corresponding "std" variables in the feature list.
2. Include all other "mean" and "std" variables from observations, including frequency domain
variables. It could be argued that frequency domain variables are derived from time domain and
are therefore not raw measurements, but they are included because they might be wanted. The
(hypothetical) purpose of the tidy data set is not given in this exercise.

## Variables in the output file *tidy-data.txt*:

Measurement variables in columns 3-68 have been renamed according to README.md from
corresponding variables documented in dataset file features_info.txt.

|column|variable label|type|range of values|
|---|---|---|---|
|1|Subject|integer|1-30|
|2|Activity|character|WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING|
|3|TimeBodyAccMeanX|numeric|-1.0 .. 1.0|
|4|TimeBodyAccMeanY|numeric|-1.0 .. 1.0|
|5|TimeBodyAccMeanZ|numeric|-1.0 .. 1.0|
|6|TimeBodyAccStdX|numeric|-1.0 .. 1.0|
|7|TimeBodyAccStdY|numeric|-1.0 .. 1.0|
|8|TimeBodyAccStdZ|numeric|-1.0 .. 1.0|
|9|TimeGravityAccMeanX|numeric|-1.0 .. 1.0|
|10|TimeGravityAccMeanY|numeric|-1.0 .. 1.0|
|11|TimeGravityAccMeanZ|numeric|-1.0 .. 1.0|
|12|TimeGravityAccStdX|numeric|-1.0 .. 1.0|
|13|TimeGravityAccStdY|numeric|-1.0 .. 1.0|
|14|TimeGravityAccStdZ|numeric|-1.0 .. 1.0|
|15|TimeBodyAccJerkMeanX|numeric|-1.0 .. 1.0|
|16|TimeBodyAccJerkMeanY|numeric|-1.0 .. 1.0|
|17|TimeBodyAccJerkMeanZ|numeric|-1.0 .. 1.0|
|18|TimeBodyAccJerkStdX|numeric|-1.0 .. 1.0|
|19|TimeBodyAccJerkStdY|numeric|-1.0 .. 1.0|
|20|TimeBodyAccJerkStdZ|numeric|-1.0 .. 1.0|
|21|TimeBodyGyroMeanX|numeric|-1.0 .. 1.0|
|22|TimeBodyGyroMeanY|numeric|-1.0 .. 1.0|
|23|TimeBodyGyroMeanZ|numeric|-1.0 .. 1.0|
|24|TimeBodyGyroStdX|numeric|-1.0 .. 1.0|
|25|TimeBodyGyroStdY|numeric|-1.0 .. 1.0|
|26|TimeBodyGyroStdZ|numeric|-1.0 .. 1.0|
|27|TimeBodyGyroJerkMeanX|numeric|-1.0 .. 1.0|
|28|TimeBodyGyroJerkMeanY|numeric|-1.0 .. 1.0|
|29|TimeBodyGyroJerkMeanZ|numeric|-1.0 .. 1.0|
|30|TimeBodyGyroJerkStdX|numeric|-1.0 .. 1.0|
|31|TimeBodyGyroJerkStdY|numeric|-1.0 .. 1.0|
|32|TimeBodyGyroJerkStdZ|numeric|-1.0 .. 1.0|
|33|TimeBodyAccMagMean|numeric|-1.0 .. 1.0|
|34|TimeBodyAccMagStd|numeric|-1.0 .. 1.0|
|35|TimeGravityAccMagMean|numeric|-1.0 .. 1.0|
|36|TimeGravityAccMagStd|numeric|-1.0 .. 1.0|
|37|TimeBodyAccJerkMagMean|numeric|-1.0 .. 1.0|
|38|TimeBodyAccJerkMagStd|numeric|-1.0 .. 1.0|
|39|TimeBodyGyroMagMean|numeric|-1.0 .. 1.0|
|40|TimeBodyGyroMagStd|numeric|-1.0 .. 1.0|
|41|TimeBodyGyroJerkMagMean|numeric|-1.0 .. 1.0|
|42|TimeBodyGyroJerkMagStd|numeric|-1.0 .. 1.0|
|43|FreqBodyAccMeanX|numeric|-1.0 .. 1.0|
|44|FreqBodyAccMeanY|numeric|-1.0 .. 1.0|
|45|FreqBodyAccMeanZ|numeric|-1.0 .. 1.0|
|46|FreqBodyAccStdX|numeric|-1.0 .. 1.0|
|47|FreqBodyAccStdY|numeric|-1.0 .. 1.0|
|48|FreqBodyAccStdZ|numeric|-1.0 .. 1.0|
|49|FreqBodyAccJerkMeanX|numeric|-1.0 .. 1.0|
|50|FreqBodyAccJerkMeanY|numeric|-1.0 .. 1.0|
|51|FreqBodyAccJerkMeanZ|numeric|-1.0 .. 1.0|
|52|FreqBodyAccJerkStdX|numeric|-1.0 .. 1.0|
|53|FreqBodyAccJerkStdY|numeric|-1.0 .. 1.0|
|54|FreqBodyAccJerkStdZ|numeric|-1.0 .. 1.0|
|55|FreqBodyGyroMeanX|numeric|-1.0 .. 1.0|
|56|FreqBodyGyroMeanY|numeric|-1.0 .. 1.0|
|57|FreqBodyGyroMeanZ|numeric|-1.0 .. 1.0|
|58|FreqBodyGyroStdX|numeric|-1.0 .. 1.0|
|59|FreqBodyGyroStdY|numeric|-1.0 .. 1.0|
|60|FreqBodyGyroStdZ|numeric|-1.0 .. 1.0|
|61|FreqBodyAccMagMean|numeric|-1.0 .. 1.0|
|62|FreqBodyAccMagStd|numeric|-1.0 .. 1.0|
|63|FreqBodyBodyAccJerkMagMean|numeric|-1.0 .. 1.0|
|64|FreqBodyBodyAccJerkMagStd|numeric|-1.0 .. 1.0|
|65|FreqBodyBodyGyroMagMean|numeric|-1.0 .. 1.0|
|66|FreqBodyBodyGyroMagStd|numeric|-1.0 .. 1.0|
|67|FreqBodyBodyGyroJerkMagMean|numeric|-1.0 .. 1.0|
|68|FreqBodyBodyGyroJerkMagStd|numeric|-1.0 .. 1.0|
