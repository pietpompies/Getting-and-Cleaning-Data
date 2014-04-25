Getting-and-Cleaning-Data
=========================
Unzip the source ( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
into a folder on your local drive: e.g. C:\R  
Make sure that extracted files are in the "UCI HAR Dataset" folder.

The first step will be to set your working directory to the path of the extracted files (if you 
extracted it to C:\R\UCI HAR Dataset), the run the following command in R:
    setwd("C:/R/UCI HAR Dataset")

Once done, you can run the R script "run_analysis.R"
	
This will create a data frame of 10299 * 563, which will cleaned and it will create two 
text files in the "UCI HAR Dataset" called:
    avg_sd_data.txt - contains mean and standard deviation for each measurement.
    mean_data.txt - contains the average of each variable for each activity and each subject. 

To load the data, you can the the following:
    data <- read.table(filename.txt) to read either of the two files
