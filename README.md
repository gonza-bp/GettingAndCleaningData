## Description of the steps in script run_Analysis.R

*1. Reading all available features
*2. Create more descriptive variable names (Removing the word Body and symbols () )
*3.Reading train data, train subjects and train classes and then creating a datatable with all information
*4.Reading test data, test subjects and test classes and then creating a datatable with all information
*5.Merges the training and the test sets to create one data set.
*6.Extracts only the measurements on the mean and standard deviation for each measurement.
*7.Reading all available activity labels
*8.Converting the number of activity column in a factor with the name of the Activities 
*9.Creating a tidy data set with the average of each variable for each activity and each subject.
*10.Storing tidy data set in the file tidyData.txt
