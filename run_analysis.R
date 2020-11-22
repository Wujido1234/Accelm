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

# Check for reshape2 package. Install and load if not present.
#Load reshape library to be used to create final tidy data set

reshapepkg <- "reshape2"                                       
not_installed <- reshapepkg[!(reshapepkg %in% installed.packages()[ , "Package"])]  
if (length(not_installed != 0)) {
  install.packages(reshape2)
}
library(reshape2)


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


# Extract Mean and Std only from features table by grep
MeanSD <- grep("mean()|std()", features[, 2]) 

# Re-define ComSet with Mean and Std data only
ComSet <- ComSet[,MeanSD]

# Tidy up names for features to eliminate '()'
FeatureNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})

# Apply clean names back to column of combined data set 'ComSet'
names(ComSet) <- FeatureNames[MeanSD]

# Start process to provide descriptive labels to data
# Create labels of 'subject', 'activity'

# Combine rows of subject tables and apply 'subject' name
subject <- rbind(subject_train, subject_test)
names(subject) <- 'subject'

# Combine rows of activity tables and apply 'activity' name
activity <- rbind(Ytrain, Ytest)
names(activity) <- 'activity'

# Column bind subject and activity columns to 'ComSet'
ComSet <- cbind(subject,activity, ComSet)


# Apply activities (standing, waking etc.) to 'ComSet', replacing previous numeric values
Cgroup <- factor(ComSet$activity)
levels(Cgroup) <- activity_labels[,2]
ComSet$activity <- Cgroup

# Create final tidy data set using averages of each element and write to file. 
MeltMean <- melt(ComSet,(id.vars=c("subject","activity")))
tidy <- dcast(MeltMean, subject+activity ~ variable, mean)

names(tidy)[-c(1:2)] <- paste("[mean of]" , names(tidy)[-c(1:2)] )
write.csv(tidy, "tidy_mean.csv", row.names=FALSE)