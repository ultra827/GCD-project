CodeBook
Description: a file which describes variables, data, and any other transformations or work you performed to get and clean up the data

Assumption 
It is assumed that the data is unzipped into the working directory. The data therefore is saved in the same folder assumed
run_analysis.r

Variables
subject_test : read a file "subject_test.txt" 
subject_train : read a file "subject_train.txt" 
activity_test : read a file "y_test.txt"
activity_train : read a file "y_train.txt"
measurement_test : read a file "x_test.txt"
measurement_train : read a file "x_train.txt"
feature : read a file "features.txt"

merged_test : put together subject_test and activity_test and create one dataset. 
merged_train : put together subject_train and activity_train and create one dataset. 
merged_tt : combine merged_test and merged_train dataset.
coln : read column names of merged_tt dataset.
new_merged_tt : sort column names including "mean or std" from merged_tt dataset.
splited_activity1 : split new_merged_tt based on activity names. 

avg_laying : calculate averages of measurement values having laying on activity value in splited_acivity1 dataset. 
avg_sitting : calculate averages of measurement values having sitting on activity value in splited_acivity1 dataset. 
avg_standing : calculate averages of measurement values having standing on activity value in splited_acivity1 dataset. 
avg_walking : calculate averages of measurement values having walking on activity value in splited_acivity1 dataset. 
avg_walking_downstairs : calculate averages of measurement values having walking_downstairs on activity value in splited_acivity1 dataset. 
abg_walking_upstairs : calculate averages of measurement values having walking_upstairs on activity value in splited_acivity1 dataset. 

avg_activity : calculate averages of measurement values of every activity in splited_acivity1 dataset. 
avg_subject : calculate averages of measurement values of every subject value in splited_acivity1 dataset. 
total_avg : combine avg_acitivity and avg_subject datasets. 
