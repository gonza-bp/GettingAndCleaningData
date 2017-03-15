#Reading all available features
features<-read.delim("UCI HAR Dataset/features.txt",sep="",header=FALSE)
#4.Appropriately labels the data set with descriptive variable names.
#Removing the word Body and symbols () from feature names
features<-unlist(lapply(as.character(features[,2]),function(x){gsub("[()]","",gsub("Body","",x))}))

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
featuresMeanStd <- grep("mean|std", features) 

#Reading train data, train subjects and train classes and then creating a datatable with all information
trainData<-read.table("UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE,col.names=features)
trainData<-trainData[,featuresMeanStd]
trainSubjects<-read.table("UCI HAR Dataset/train/subject_train.txt",sep=" ",header=FALSE,col.names="subject")
trainClasses<-read.table("UCI HAR Dataset/train/y_train.txt",sep=" ",header=FALSE,col.names="activity")
train<-cbind(trainData,trainSubjects,trainClasses)

#Reading test data, test subjects and test classes and then creating a datatable with all information
testData<-read.table("UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE,col.names=features)
testData<-testData[,featuresMeanStd]
testSubjects<-read.table("UCI HAR Dataset/test/subject_test.txt",sep=" ",header=FALSE,col.names="subject")
testClasses<-read.table("UCI HAR Dataset/test/y_test.txt",sep=" ",header=FALSE,col.names="activity")
test<-cbind(testData,testSubjects,testClasses)

#1.Merges the training and the test sets to create one data set.
data<-rbind(train,test)


#Reading all available activity labels
activityLabels<-read.delim("UCI HAR Dataset/activity_labels.txt",sep="",header=FALSE)
#3.Uses descriptive activity names to name the activities in the data set
activityLabels<-activityLabels[,2]

#Converting the number of activity column in a factor with the name of the Activities 
data$activity<-factor(data$activity,labels=activityLabels)

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- aggregate(. ~subject + activity, data, mean)
write.table(tidyData, file = "Tidy.txt")

write.table(names(data),file="features.txt")


