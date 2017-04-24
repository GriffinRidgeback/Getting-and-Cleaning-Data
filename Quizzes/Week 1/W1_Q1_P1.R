#
# Question 1
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
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = paste(data_dir, "/idaho.csv", sep = ""), method = "curl")

# Record-keeping
dateDownloaded <- date()

# Read in the file
idaho_data  <- read.csv("./data/idaho.csv")

# For all rows where VAL == 24, extract the VAL column data
million  <- idaho_data[idaho_data$VAL == 24, "VAL"]

# Subset the million-dollar homes by removing NAs
# Taking the length will give all the homes valued at $1000000+
length(million[complete.cases(million)])