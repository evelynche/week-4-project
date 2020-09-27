x_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
subject_test<-read.table("subject_test.txt")
x_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")
subject_train<-read.table("subject_train.txt")
test<-cbind(subject_test,x_test,y_test)
train<-cbind(subject_train,x_train,y_train)
merged<-rbind(train,test)
feature<-read.table("features.txt")
mean<-merged[,c(grep("mean()",feature$V2))]
std<-merged[,c(grep("std()",feature$V2))]
names(mean)<-feature[c(grep("mean()",feature$V2)),2]
names(std)<-feature[c(grep("std()",feature$V2)),2]
data<-cbind(mean,std)
write.table(data,row.name=FALSE )
