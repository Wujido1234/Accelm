## Code Book

This code book describesdata used, and the process required to create the resulting tidy data set.

### Overview

30 volunteers between ages of 19-48 years of age performed 6 different activities while wearing a Samsung Galaxy S II smartphone on their waist. Using the smartphone's embedded accelerometer and gyroscope, date was captured for 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

### Explanation of each file used

* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Names and IDs for each of the 6 activities.

* `Xtrain.txt`: 7352 observations of the 561 features, for 21 of the 30 volunteers.
* `subject_train.txt`: 7352 integers, denoting the ID of the volunteer related to each of the observations in `Xtrain.txt`.
* `Ytrain.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `Xtrain.txt`.
* `Xtest.txt`: 2947 observations of the 561 features, for 9 of the 30 volunteers.
* `subject_test.txt`: 2947 integers, denoting the ID of the volunteer related to each of the observations in `Xtest.txt`.
* `Ytest.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `Xtest.txt`.


### Processing steps

## 1. Read data and Merge
Read in table files into tables represented above

## 2. Extract mean() and std()
Create a vector of only mean and std labels from combined data set "ComSet".
* MeanSD : a vector of mean and std elements extracted from 2nd column of features
* ComSet : at the end of this step, ComSet will only contain mean and std variables

## 3. Changing Column label of ComSet
Create a vector of normalized feature names by eliminating trailing "()".
* FeatureNames : a vector of normalized feature names 

## 4. Adding Subject and Activity to ComSet
Combine test data and train data of subject and activity, then provide descriptive labels of the same name. Row Bind with ComSet. 
* subject : bind of subject_train and subject_test
* activity : bind of Ytrain and Ytest

## 5. Replace numeric ID to activity name
Group the activity column of ComSet as "Cgroup", then rename each level with 2nd column of activity_levels. Apply the renamed "Cgroup" to ComSet's activity column.
* Cgroup : factored activity column of dataSet 

## 6. Output tidy data
Melt ComSet to create tidy data set and output to file containing the mean of all elements. 
* MeltMean : melt "subject" and "activity" for ComSet
* tidy : dcast MeltMean which has means of each element
* Output to 'tidy_mean.txt'