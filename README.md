## Class Project for "Getting and Cleaning Data"

The class project for [Getting and Cleaning Data](https://www.coursera.org/course/getdata) was to read in the ["Human Activity Recognition Using Smartphones" data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), perform an analysis on the data set, and output a tidy data set.

**Overview of Script**

1. Downloads zip file from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzips the file and reads in data files to tables for further mining
3. Creates a tidy data set from individual tables mapped to activity and subject for the Mean() and Std()
4. Creates a seperate tidy data set from the above for the Mean() of all combined elements



**Run the R script (run_analysis.R))**

**The tidy data set, [tidy_mean.csv] can be found in your current R Working Directory**
You can read more about the data and the analysis in the [code book](CodeBook.md).
