#
# Question 5
#

# Work location
work_dir <- "~/Development/GettingAndCleaningData/"
setwd(work_dir)

# Target location
data_dir <- paste(work_dir, "data", sep ="")

# Create target directory, if needed
if (!file.exists(data_dir)) {
    dir.create(data_dir)
}

# Download the data (probably need to do some date checking to see if the download is needed)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = paste(data_dir, "/housing.csv", sep = ""), method = "curl")

# Load the necessary functions
library(data.table)

# Read in the file
DT  <- fread("./data/housing.csv")

# This one is not valid
# rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
# 
# For the next ones, have to consider this:
# using the data.table package
DT[,mean(pwgtp15),by=SEX]
# this is the only one which meets the criteria of using data.table package