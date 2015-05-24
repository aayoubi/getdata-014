Getting and Cleaning Data
=========================

The following repository contains all the necessary data required in the analysis of the `getdata-014` Coursera project.

# Download the original data set

* Create a directory under a specific path, e.g. `/path/to/my/dataset/`

* Unzip the data set found under this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into your directory defined above.

# Clean the data set

* Copy run_analysis.R into into the same directory as the data set.

* In R console, run the following:

```
setwd("/path/to/my/dataset/")
source('run_analysis.R')
```

`run_analysis.R` includes all the code responsible of cleaning the data set. It merges both training and test data, adds descriptive names, and the requested measurements for each activity and for each subject. 

* The tidy data set results will be written in a text file called: `tidy_data_set.txt`.

* The tidy data set is described in the file `CodeBook.md`.

