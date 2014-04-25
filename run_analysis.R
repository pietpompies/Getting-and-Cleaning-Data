library(reshape2)
## Read all the text files
xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt")
##
strain <- read.table("train/subject_train.txt")
stest <- read.table("test/subject_test.txt")
##
ytrain <- read.table("train/y_train.txt")
ytest <- read.table("test/y_test.txt")
##
feat <- read.table("features.txt")
act <- read.table("activity_labels.txt")
##
## Merge the train and test sets and extracts only the mean and standard deviation
xdata <- rbind(xtrain, xtest)
mscols <- grep(".*mean\\(\\)|.*std\\(\\)", feat[, 2])
xdata <- xdata[, mscols]
names(xdata) <- feat[mscols, 2]
names(xdata) <- gsub("\\(|\\)", "", names(xdata))
##
## Activities
ydata <- rbind(ytrain, ytest)
ydata[,1] = act[ydata[,1], 2]
names(ydata) <- "Activity"
##
## Subjects
sdata <- rbind(strain, stest)
names(sdata) <- "Subject"
##
## Create the mean and standard deviation dataset
ds <- cbind(sdata, ydata, xdata)
write.table(ds, "avg_sd_data.txt")
##
## dataset with the average of each variable for each activity and each subject
id_vars = c("Activity", "Subject")
measure_vars = setdiff(colnames(ds), id_vars)
md <- melt(ds, id=id_vars, measure.vars=measure_vars)
tidy <- dcast(md, Activity + Subject ~ variable, mean)
write.table(tidy, "mean_data.txt")
