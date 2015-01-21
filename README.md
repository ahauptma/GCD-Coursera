# run_analysis.R
Project script for Getting and Cleaning Data Coursera

The purpose of this script is to tidy, subset and summarize data on human movement during various Activities of Daily Living (ADL) as recorded by gyroscopes and accelerometers in waist-mounted Samsung Galaxy II cell phones.

The script assumes that your current working directory contains the folder "UCI HAR Dataset" containing data files downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script does not require any R libraries.

The data files from "UCI HAR Dataset" are untidy in the following ways:
1. The columns are not labeled in the data sets themselves.
2. The column labels (in features.txt) include duplications, typos and characters not allowed in variable names in R.
3. The descriptive data (subjects and activities) and the numeric data are in seperate files with no way to associate them except for row order.

The script performs the following tasks in order:
1. Parses features.txt to find which columns of numeric data correspond to mean and standard deviation measurements (the subset of the numeric data we wish to keep).
2. Parses activity_labels.txt to associate numeric activity labels with their descriptions.
3. Reads subjects\_test.txt (which subject performed the action?), Y\_test.text (what action was performed?) and the columns of X\_test.text (values of measurements taken)  we found in step 1, then creates one data frame from them with cbind().
4. Reads training set counterparts of the files in step 3, cbind()s them together and rbind()s them to the test set.
5. Cleans up the variable names; see codebook or inline comments for more details.
6. Summarizes the measurements for each activity-subject pair using aggregate(,FUN=mean).
7. Writes the summary to GCD_Project.txt with write.table().
