How to use this processing script
================================

Processing script is included in run_analysis.R which processes UCI Human activity recognition data set supplied at the location https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. To more details about this data, please refer http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


### Code Book (CodeBook.md)
Code book included with this, describes all the variables of the tidy data set.

### The instruction list/script (run_analysis.R)

To execute run_analysis.R
1. Download the data set from above mentioned location and extract the zip file 
2. Copy this R file into "UCI HAR Dataset" folder
3. Install R plyr package 
4. Set "UCI HAR Dataset" folder as working directory in R
5. Copy below command and execute in R
    source("run_analysis.R"); run_analysis()
6. "HumanActivityDataAvgByActivitySubject.txt" is generated at "UCI HAR Dataset" folder