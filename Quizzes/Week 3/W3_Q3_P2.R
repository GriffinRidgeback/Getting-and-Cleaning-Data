#
# Question 2
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
target_file <- paste(data_dir, "/jeff.jpg", sep = "")

# Download the data (probably need to do some date checking to see if the download is needed)
if (!file.exists(target_file)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
    download.file(fileUrl, destfile = paste(data_dir, "/jeff.jpg", sep = ""), method = "curl")
}

# Record-keeping
dateDownloaded <- date()

# Load the jpeg library
library(jpeg)

# Read in the data
jeff  <- readJPEG(("./data/jeff.jpg"), native = T)

# Take the quantile of the data
quantile(jeff,probs=c(0.3,0.8))