# load required packages
library(dplyr)

# define data directory
dataDir <- "./UCI_HAR_Dataset"

# read feature names and activity labels
activity_labels <- read.table(paste(dataDir,"activity_labels.txt", sep = "/"))[,2]
features <- read.table(paste(dataDir,"features.txt", sep = "/"), stringsAsFactors = FALSE)[,2]

# read test data and make single table
subj_test <- read.table(paste(dataDir,"test/subject_test.txt", sep = "/"))
y_test <- read.table(paste(dataDir,"test/Y_test.txt", sep = "/"))
x_test <- read.table(paste(dataDir,"test/X_test.txt", sep = "/"))
test_data <- cbind(x_test, y_test, subj_test)

# read training data and make single table
subj_train <- read.table(paste(dataDir,"train/subject_train.txt", sep = "/"))
y_train <- read.table(paste(dataDir,"train/Y_train.txt", sep = "/"))
x_train <- read.table(paste(dataDir,"train/X_train.txt", sep = "/"))
train_data <- cbind(x_train, y_train, subj_train)

# step 1 - Merges the training and the test sets to create one data set
all_data <- rbind(test_data, train_data)

# step 4 - Appropriately labels the data set with descriptive variable names
data_names <- make.names(append(features, c("Activities", "Subject")), unique = TRUE)
names(all_data) <- data_names

# step 2 - Extracts only the measurements on the mean and standard deviation for each measurement
ext_data <- select(all_data,contains("Mean",ignore.case=TRUE), contains("std"), contains("Activities"), contains("Subject"))

# step 3 - Uses descriptive activity names to name the activities in the data set
extnamed_data <- mutate(ext_data, Activities = factor(Activities, labels = activity_labels))

# sort first tidy data set by subject
tidy_data1 <- arrange(extnamed_data, Subject)

# step 5 - creates a second, independent tidy data set with the average of each variable for each activity and each subject
group_data <- group_by(tidy_data1, Activities, Subject)
tidy_data2 <- summarise_each(group_data,funs(mean))
  
write.table(tidy_data1, file = "step_4_dataset.txt", row.name = FALSE)
write.table(tidy_data2, file = "step_5_dataset.txt", row.name = FALSE)
