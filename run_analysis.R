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

#Great! We have successfully merged the data set!

#Now, let's go through the last column and replace the 
#numbers with their corresponding activity name
merged_data$Activty[merged_data$Activity==1]<-"Walking"
merged_data$Activty[merged_data$Activity==2]<-"Walking_Upstairs"
merged_data$Activty[merged_data$Activity==3]<-"Walking_Downstairs"
merged_data$Activty[merged_data$Activity==4]<-"Sitting"
merged_data$Activty[merged_data$Activity==5]<-"Standing"
merged_data$Activty[merged_data$Activity==6]<-"Laying"

#Extracts only the measurements on the mean and standard 
#deviation for each measurement. 
merged_copy<-merged_data
merged_copy<-merged_copy[,-(7:40)]
merged_copy<-merged_copy[,-(47:80)]
merged_copy<-merged_copy[,-(87:120)]
merged_copy<-merged_copy[,-(127:160)]
merged_copy<-merged_copy[,-(167:200)]
merged_copy<-merged_copy[,-(203:213)]
merged_copy<-merged_copy[,-(216:226)]
merged_copy<-merged_copy[,-(229:239)]
merged_copy<-merged_copy[,-(242:252)]
merged_copy<-merged_copy[,-(255:265)]
merged_copy<-merged_copy[,-(272:344)]
merged_copy<-merged_copy[,-(351:423)]
merged_copy<-merged_copy[,-(430:502)]
merged_copy<-merged_copy[,-(505:515)]
merged_copy<-merged_copy[,-(518:528)]
merged_copy<-merged_copy[,-(505:515)]
merged_copy<-merged_copy[,-(531:541)]
merged_copy<-merged_copy[,-(544:554)]
means_and_stds<-merged_copy
