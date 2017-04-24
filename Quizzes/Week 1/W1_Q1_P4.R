#
# Question 4
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

# Load the necessary functions
library(XML)

# Download the data (probably need to do some date checking to see if the download is needed)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile = paste(data_dir, "/restaurants.xml", sep = ""), method = "curl")

# Read in the file
doc <- xmlTreeParse(paste(data_dir, "/restaurants.xml", sep = ""),useInternal=TRUE)

# Record-keeping
dateDownloaded <- date()

# Perform the calculations
rootNode <- xmlRoot(doc)
zips  <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(zips[zips == '21231'])