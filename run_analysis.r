#read files
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")

activity_test <- read.table("./test/y_test.txt")
activity_train <- read.table("./train/y_train.txt")

measurement_test <- read.table("./test/x_test.txt")
measurement_train <- read.table("./train/x_train.txt")

feature <- read.table("features.txt")

#merge subject and activity files
merged_test=cbind(subject_test,activity_test,measurement_test)
merged_train=cbind(subject_train,activity_train,measurement_train)

#merge test and train files
merged_tt=rbind(merged_test,merged_train)
colnames(merged_tt) <- c("subject","activity",as.character(feature[,2]))

#label activities
for (i in 1:nrow(merged_tt)) {
  if (merged_tt[i,2]=="1") {
     merged_tt[i,2]="WALKING"
  }else if (merged_tt[i,2]=="2") {
    merged_tt[i,2]="WALKING UPSTAIRS"
  }else if (merged_tt[i,2]=="3") {
    merged_tt[i,2]="WALKING DOWNSTAIRS"
  }else if (merged_tt[i,2]=="4") {
    merged_tt[i,2]="SITTING"
  }else if (merged_tt[i,2]=="5"){
    merged_tt[i,2]="STANDING"
  }else if (merged_tt[i,2]=="6"){ 
    merged_tt[i,2]="LAYING"
  }
  
}

#read column names of merged test&train file. 
coln <- colnames(merged_tt)

#if colomn name has "mean" or "std", keep those columns. 
a <- grepl(pattern="(mean|std)",x=as.character(feature[,2]))

new_merged_tt <- merged_tt

#keep 1st and 2nd columns and then read 3rd ~ the last columns 
for (i in 1:length(merged_tt)) {
  if (i==1 | i==2) {
    
  } else if ( a[i-2] == TRUE) {
    
  } else {
    new_merged_tt[coln[i]] <- NULL
  }
}

#check variables of new_merged_tt file.  
str(new_merged_tt)

#split new_merged_tt based on activities.
splited_activity1 <- split(new_merged_tt[3:length(new_merged_tt)],new_merged_tt$activity)

#calculate averages of each measurement based on activities.
avg_laying <- lapply(splited_activity1$LAYING,mean)
avg_sitting <- lapply(splited_activity1$SITTING,mean)
avg_standing <- lapply(splited_activity1$STANDING,mean)
avg_walking <- lapply(splited_activity1$WALKING,mean)
avg_walking_downstairs <- lapply(splited_activity1$`WALKING DOWNSTAIRS`,mean)
avg_walking_upstairs <- lapply(splited_activity1$`WALKING UPSTAIRS`,mean)

#combine every avg
avg_activity <- rbind(avg_laying,avg_sitting,avg_standing,avg_walking,avg_walking_downstairs,
                      avg_walking_upstairs)

#calulate averages of each measurement based on subjects
avg_subject <- aggregate(new_merged_tt, by=list(new_merged_tt$subject),FUN=mean, na.rm=TRUE,fixed=TRUE)

#combine averages of activity and subject
total_avg <- rbind(avg_activity,avg_subject)



# create datasets. 
write.table(new_merged_tt,"new_merged_tt.txt")
write.table(total_avg,"total_avg.txt")