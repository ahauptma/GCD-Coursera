# Read from features.txt the indices of the columns that correspond to 
# mean and standard deviation measurements.
f <- read.table("./UCI HAR Dataset/features.txt", as.is=TRUE)
msd.vars <- grep("-(mean|std)\\(\\)", f[,2])
f <- f[msd.vars,]
names(f) <- c("column.index", "measurement.description")
f[,1] <- as.numeric(f[,1])

# Read from activities.txt the mapping from numeric to descriptive activity labels.
act <- read.table("./UCI HAR Dataset/activity_labels.txt", as.is=TRUE)
names(act) <- c("activity.label", "activity.description")

# Read and set up test data
t1 <- cbind(read.table("./UCI HAR Dataset/test/subject_test.txt", as.is=TRUE),
            read.table("./UCI HAR Dataset/test/Y_test.txt", as.is=TRUE),
            read.table("./UCI HAR Dataset/test/X_test.txt")[,f$column.index])

names(t1) <- c('subject', 'activity.label', f$measurement.description)
t1 <- merge(t1, act)

# Same for training set
t2 <- cbind(read.table("./UCI HAR Dataset/train/subject_train.txt", as.is=TRUE),
            read.table("./UCI HAR Dataset/train/Y_train.txt", as.is=TRUE),
            read.table("./UCI HAR Dataset/train/X_train.txt")[,f$column.index])

names(t2) <- c('subject', 'activity.label', f$measurement.description)
t2 <- merge(t2, act)

# Concatenate data sets
t <- rbind(t1, t2)

# Explain variable names
names(t) <- gsub("^t", "timeDomain", names(t))
names(t) <- gsub("^f", "frequencyDomain", names(t))
names(t) <- gsub("Acc", ".Accelerometer", names(t))
names(t) <- gsub("Gyro", ".Gyroscope", names(t))
names(t) <- gsub("Mag", ".Magnitude", names(t))

# This duplicate "Body" seems unnecessary?
names(t) <- gsub("BodyBody", "Body", names(t))

# Add dots for improved readability
names(t) <- gsub("Body", ".Body", names(t))
names(t) <- gsub("Jerk", ".Jerk", names(t))
names(t) <- gsub("Gravity", ".Gravity", names(t))

# Replace or remove characters not allowed in R
names(t) <- gsub("-", ".", names(t))
names(t) <- gsub("\\(|\\)", "", names(t))

# Let's make X/Y/Z and Magnitude positioning consistant
names(t) <- gsub("Magnitude.mean", "mean.Magnitude", names(t))
names(t) <- gsub("Magnitude.std", "std.Magnitude", names(t))

# Finally, the fact that there's no label for Acecleration that corresponds to Jerk
# is not ideal.  Let's add ".Acceleration" to label names without ".Jerk"
names(t) <- gsub("Accelerometer.mean", "Accelerometer.Acceleration.mean", names(t))
names(t) <- gsub("Accelerometer.std", "Accelerometer.Acceleration.std", names(t))
names(t) <- gsub("Gyroscope.mean", "Gyroscope.Acceleration.mean", names(t))
names(t) <- gsub("Gyroscope.std", "Gyroscope.Acceleration.std", names(t))

# Summarize variables
mean.by.activity.and.subject <- aggregate(. ~ activity.description + subject, 
                                          subset(t, select=-activity.label), mean)
