# Question 5

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
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl, destfile = paste(data_dir, "/noaa.for", sep = ""), method = "curl")

# Read in and process the data
forfile = read.fwf("./data/noaa.for", widths=c(12, 7,4, 9,4, 9,4, 9,4), row.names = 1, skip = 4)
sum(forfile$V4)