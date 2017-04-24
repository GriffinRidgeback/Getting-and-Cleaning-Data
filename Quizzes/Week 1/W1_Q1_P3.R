#
# Question 3
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

# Create target file
target_file <- paste(data_dir, "/gas.xslx", sep = "")

# Download the data (probably need to do some date checking to see if the download is needed)
if (!file.exists(target_file)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    download.file(fileUrl, destfile = paste(data_dir, "/gas.xlsx", sep = ""), method = "curl")
}

# Record-keeping
dateDownloaded <- date()

# load required library
library(xlsx)

# Read in the file
dat <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)

# Perform the calculations
sum(dat$Zip*dat$Ext, na.rm=T) 