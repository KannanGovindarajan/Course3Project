How to use this processing script
================================

Processing script is included in run_analysis.R which processes UCI Human activity recognition data set supplied at the location https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. To more details about this data, please refer http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


### Code Book (CodeBook.md)
Code book included with this, describes all the variables of the tidy data set.

### The instruction list/script (run_analysis.R)

To execute run_analysis.R
* Download the data set from above mentioned location and extract the zip file 
* Copy this R file into "UCI HAR Dataset" folder
* Install R plyr package 
* Set "UCI HAR Dataset" folder as working directory in R
* Copy thecommand and execute in R:  source("run_analysis.R"); run_analysis()
* "HumanActivityDataAvgByActivitySubject.txt" is generated at "UCI HAR Dataset" folder