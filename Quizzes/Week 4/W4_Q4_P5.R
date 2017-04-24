#
# Question 5
#
library(lubridate)
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

# Process data using lubridate
y2012 <- grep("^2012", ymd(sampleTimes))
message("Number of 2012 entries: ", length(y2012))

q5  <- sort(wday(sampleTimes[y2012], label = T))
message("Number of Mondays in 2012: ", sum(q5 == "Mon"))