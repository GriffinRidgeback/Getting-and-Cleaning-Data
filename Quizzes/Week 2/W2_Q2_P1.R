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

# Load needed functions
library(jsonlite)

# Download the data (probably need to do some date checking to see if the download is needed)
jsonData  <- fromJSON("https://api.github.com/users/jtleek/repos")

# Record-keeping
dateDownloaded <- date()

# Analyze for the answer; the JSON data is in a dataframe
node_id  <- which(jsonData$name == "datasharing") # find the index of the node containing the name of interest
node  <- jsonData[node_id, ] # extract the node in question
node$created_at # get the desired attribute