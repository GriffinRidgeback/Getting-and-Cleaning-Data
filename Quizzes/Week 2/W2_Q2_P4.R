# Question 4

# Read from the web
con  <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode  <- readLines(con = con)

# Construct a vector with the answers
c(nchar(htmlCode[10]), nchar(htmlCode[20]), nchar(htmlCode[30]), nchar(htmlCode[100]))