Getting and Cleaning Data

The requirements are

1. Merge the training and test sets to create on set.
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive activity names.
5. Create a second, independent tidy data set with the average of each variables for each activity and each subject.


Process
1. Produce an interim dataset to combine test and train datasets. 
   - merge two datasets.
2. Put each variable on the first rows.
3. Put the activity labels into the activity columns. 
4. Sort column names including "mean" or "std"
5. Arrange the merged dataset based on activities. 
6. Calculate averages of each measurement based on activity values. 
7. Combine a dataset outcome from #6.
8. Calculate averages of each measurement based on subjects.
9. Combine #6 and #9
10. create a file having this dataset outcome. 
 

Variables 

merged_test , merged_train Merge: subject and activity files by using cbind() and create interim files which are called merged_test and merged_train
merged_tt : Merge merged_test and merged_train files.
merged_tt[i,2] : Put activity names on the second columns.
coln : Read every column names of merged test and train files.
a : if columns' name has "mean" or "std", save those columns.
new_merged_tt : read 3rd ~ the last columns.
splited_activity1 : split new_merged_tt based on activiti names.