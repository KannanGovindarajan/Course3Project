## Below function processes UCI Human activity recognition data set supplied at
## the location https://d396qusza40orc.cloudfront.net 
##                             /getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## To more details about this data, please refer 
## http://archive.ics.uci.edu/ml/datasets
##              /Human+Activity+Recognition+Using+Smartphones

## To execute the function
## 1. Download the data set from above mentioned location and extract the zip file 
## 2. Copy this R file into "UCI HAR Dataset" folder
## 3. Install R plyr package 
## 4. Set "UCI HAR Dataset" folder as working directory in R
## 5. Copy below command and execute in R
##    source("run_analysis.R"); run_analysis()
## 6. "HumanActivityDataAvgByActivitySubject.txt" is generated at  
##     "UCI HAR Dataset" folder

run_analysis <- function() {
        
        ## Read features and activities
        features <- read.table("features.txt",
                                col.names= c("featureid","featurename"))
        activities <- read.table("activity_labels.txt",
                                col.names=c("activityid","activityname"))
        
        ## Read Training data set
        xTrain <- read.table("./train/X_train.txt", 
                                col.names=features$featurename)
        yTrain <- read.table("./train/y_train.txt",
                                col.names=c("activityid"))
        yTrain <- merge(yTrain,activities, all=TRUE)
        subjectTrain <- read.table("./train/subject_train.txt",
                                col.names=c("subject"))
        
        ## Read Test data set
        xTest <- read.table("./test/X_test.txt",
                                col.names=features$featurename)
        yTest <- read.table("./test/y_test.txt",
                                col.names=c("activityid"))
        yTest <- merge(yTest,activities, all=TRUE)
        subjectTest <- read.table("./test/subject_test.txt",
                                col.names=c("subject"))
        
        ## Select required features
        selectedFeatures <- c(grep("-mean()",features$featurename,fixed=TRUE),
                              grep("-std()",features$featurename,fixed=TRUE))
        
        ## Merge Training and Test data sets into one
        tidyData1 <- rbind(xTrain[,selectedFeatures],xTest[,selectedFeatures])
        
          
        ## Merge activities into tidy data set
        tidyData1 <- cbind(rbind(yTrain["activityname"], yTest["activityname"]),
                           tidyData1)
        
        ## Merge subjects into tidy data set
        tidyData1 <- cbind(rbind(subjectTrain, subjectTest),tidyData1)
        
        ## Cleanup un-wanted objects
        rm(xTrain, yTrain, subjectTrain, xTest, yTest, subjectTest)
        
        ## Transform column names to friendly names
        featurenames <- features$featurename[selectedFeatures]
        featurenames <- sub("^t","time",featurenames)
        featurenames <- sub("^f","frequency",featurenames)
        featurenames <- sub("Acc","accelerometer",featurenames)
        featurenames <- sub("Mag","magnitude",featurenames)
        featurenames <- sub("Gyro","gyroscope",featurenames)
        featurenames <- sub("-mean\\(\\)","mean",featurenames)
        featurenames <- sub("-std\\(\\)","standarddeviation",featurenames)
        featurenames <- sub("-X","xcoordinate",featurenames)
        featurenames <- sub("-Y","ycoordinate",featurenames)
        featurenames <- sub("-Z","zcoordinate",featurenames)
        featurenames <- tolower(featurenames)
        featurenames <- sub("(body)+body","body",featurenames)
        names(tidyData1) <- c("subject","activityname",featurenames)
        
        library(plyr)
        
        ## Generate second tidy data which average of each feature variables 
        ## for each activity and each subject
        measuresLength <- ncol(tidyData1)
        tidyData2 <- ddply(tidyData1,
                           c("subject","activityname"),
                           function(df) colMeans(df[,3:measuresLength])) 
        
        ## Output second tidy data to a file
        write.table(tidyData2,"HumanActivityDataAvgByActivitySubject.txt")
}
