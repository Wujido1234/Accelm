## Code Book

This code book describes the data used in this project, as well as the processing required to create the resulting tidy data set.

### Overview

30 volunteers between ages of 19-48 years of age performed 6 different activities while wearing a Samsung Galaxy S II smartphone on their waist. Using the smartphone's embedded accelerometer and gyroscope, date was captured for 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

### Explanation of each file used

* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Names and IDs for each of the 6 activities.

* `Xtrain.txt`: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* `subject_train.txt`: 7352 integers, denoting the ID of the volunteer related to each of the observations in `Xtrain.txt`.
* `ytrain.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.
* `Xtest.txt`: 2947 observations of the 561 features, for 9 of the 30 volunteers.
* `subject_test.txt`: 2947 integers, denoting the ID of the volunteer related to each of the observations in `Xtest.txt`.
* `Ytest.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.


### Processing steps

1. Data files were read into data frames for further processing
* Ex: subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

appropriate column headers were added, and the training and test sets were combined into a single data set.
2. All feature columns were removed that did not contain the exact string "mean()" or "std()". This left 66 feature columns, plus the subjectID and activity columns.
3. The activity column was converted from a integer to a factor, using labels describing the activities.
4. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.
5. The tidy data set was output to a CSV file.