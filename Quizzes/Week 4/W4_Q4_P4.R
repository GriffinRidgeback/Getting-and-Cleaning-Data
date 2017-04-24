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

# Create target files
gdp_file <- paste(data_dir, "/gdp.csv", sep = "")
fed_file <- paste(data_dir, "/fedstats.csv", sep = "")

# Download the data (probably need to do some date checking to see if the download is needed)
if (!file.exists(gdp_file)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
    download.file(fileUrl, gdp_file, method = "curl")
}

if (!file.exists(fed_file)) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
    download.file(fileUrl, fed_file, method = "curl")
}

# Record-keeping
dateDownloaded <- date()

# Read in the GDP data
gdp <- read.csv(gdp_file, header = F, stringsAsFactors = F, skip = 5, nrows = 190)

# Massage the data
gdp  <- gdp[, c(1:2, 4:5)] # Eliminate extraneous rows
colnames(gdp)  <- c("Short", "Rank", "Full", "GDP") # Put meaningful column names on the data
gdp$GDP  <-  as.numeric(gsub(",", "", gdp$GDP)) # Convert the column for later calculations
                                                # The comma prevented correct conversion to numeric

# Read in the FEDSTATS data
fedstats <- read.csv(fed_file)

# Massage the data
#fedstats  <- fedstats[, 1:3] # We need data only from the first three columns

# Merge the datasets
mergeddata  <- merge(gdp, fedstats, by.x = "Short", by.y = "CountryCode", all = F)

# Put in descending order
ordereddata  <- mergeddata[order(mergeddata$Rank, decreasing = T), ]

# Create a logical vector of June
x  <- grep("[Jj][Uu][Nn][Ee]", ordereddata$Special.Notes)

# Subset this vector
z  <- ordereddata$Special.Notes[x]

# Put the answer to the console
message("Number of June fiscal years: ", length(grep("^Fiscal", z)))