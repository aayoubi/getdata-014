library(plyr)

# Merges the training and the test sets to create one data set.
X.data <- rbind(read.table("train/X_train.txt"), read.table("test/X_test.txt"))
Y.data <- rbind(read.table("train/y_train.txt"), read.table("test/y_test.txt"))
subject.data <- rbind(read.table("train/subject_train.txt"), read.table("test/subject_test.txt"))

# Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
X.data <- X.data[, grep("-mean\\(\\)|-std\\(\\)", features[, 2])]

# Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
Y.data[, 1] = activities[Y.data[, 1], 2]

# Appropriately labels the data set with descriptive activity names.
names(subject.data) <- "subject"
names(Y.data) <- "activity"
names(X.data) <- features[grep("-mean\\(\\)|-std\\(\\)", features[, 2]), 2]
names(X.data) <- gsub("\\(|\\)", "", names(X.data))
names(X.data) <- tolower(names(X.data))
names(X.data) <- gsub("^t", "Time", names(X.data))
names(X.data) <- gsub("^f", "Fourier", names(X.data))
cleaned.data <- cbind(subject.data, Y.data, X.data)
columns.count = dim(cleaned.data)[2]

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy.data <- ddply(cleaned.data, .(subject, activity), function(x) colMeans(x[, 3:columns.count]))
write.table(tidy.data, "tidy_data_set.txt", row.names=F)
