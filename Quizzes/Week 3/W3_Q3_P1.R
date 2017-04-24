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
target_file <- paste(data_dir, "/2006microdata.csv", sep = "")

# Download the data (probably need to do some date checking to see if the download is needed)
if (!file.exists(target_file)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileUrl, destfile = target_file, method = "curl")
}

# Record-keeping
dateDownloaded <- date()

# Read in the data
housing <- read.csv(target_file, stringsAsFactors = F)

# Create the logical vector for analysis
agricultureLogical <- housing$ACR == 3 & housing$AGS == 6

# Apply logical vector to get result
q1 <- housing[which(agricultureLogical), ]
q1[1:3, 1:2]