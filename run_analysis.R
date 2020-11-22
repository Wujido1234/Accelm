## Data download and unzip 

# string variables for file download
fileName <- "UCI.zip"
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

# File download verification. If file does not exist, download to working directory.
if(!file.exists(fileName)){
  download.file(url,fileName, mode = "curl") 
}

# File unzip verification. If the directory does not exist, unzip the downloaded file.
if(!file.exists(dir)){
  unzip("UCI.zip", files = NULL, exdir=".")
}


# Read in test and train data sets to respective tables
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
Ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
Ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")

# Read in mapped activity label vectors for cross reference
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt") 

# Combine data sets for further mining
ComSet <- rbind(Xtrain,Xtest)
