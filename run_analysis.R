##This script assumes you are starting from the "UCI HAR Dataset" folder. 
start_wd<-getwd()

##read in the features.txt file for use in the column heading of activity names
features<-read.table("features.txt")
feature_names<-features[,2]

##read in activity_labels.txt for later identifying and renamingthe activities
activities<-read.table("activity_labels.txt")

##Format the file path to the tet folder, so you can cd into the test dir
test_data_location<-paste(start_wd,"test",sep="/")

##move into the test dir
setwd(test_data_location)

##read the three needed files: X_test.txt,sunbject_test.txt, and y_test.txt, 
##with appropriate column names
x_test<-read.table("X_test.txt",col.names=feature_names)
subject_test<-read.table("subject_test.txt",col.names="Subject")
y_test<-read.table("y_test.txt",col.names="Activity")

##move into the "test" directory
train_data_location<-paste(start_wd,"train",sep="/")
setwd(train_data_location)

##Repeat the actions taken in the "test" dir, except for the "train" data
x_train<-read.table("X_train.txt",col.names=feature_names)
subject_train<-read.table("subject_train.txt",col.names="Subject")
y_train<-read.table("y_train.txt",col.names="Activity")

##You now have all the data you need! :D

##combine the three files for the test data using cbind()
combined_test_data<-cbind(x_test,subject_test,y_test)

##combine the three files for the training data using cbind()
combined_training_data<-cbind(x_train,subject_train,y_train)

##merge the two datasets
merged_data<-rbind(combined_test_data,combined_training_data)

