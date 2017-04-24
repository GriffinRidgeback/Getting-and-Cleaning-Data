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

# Create target file
target_file <- paste(data_dir, "/housing2.csv", sep = "")

# Download the data (probably need to do some date checking to see if the download is needed)
if (!file.exists(target_file)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileUrl, destfile = paste(data_dir, "/housing2.csv", sep = ""), method = "curl")
}

# Record-keeping
dateDownloaded <- date()

# Read in the data
housing <- read.csv(target_file, stringsAsFactors = F)

# Solve the question
q1 <- strsplit(names(housing), split = c("^wgtp"))
message("The 123 element is :", q1[123])