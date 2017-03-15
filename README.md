## Description of the steps in script run_Analysis.R

* Reading all available features
* Create more descriptive variable names (Removing the word Body and symbols () )
* Reading train data, train subjects and train classes and then creating a datatable with all information
* Reading test data, test subjects and test classes and then creating a datatable with all information
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Reading all available activity labels
* Converting the number of activity column in a factor with the name of the Activities 
* Creating a tidy data set with the average of each variable for each activity and each subject.
* Storing tidy data set in the file tidyData.txt
