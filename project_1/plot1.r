power_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(power_url, temp)
unzip(temp, "household_power_consumption.txt")

names <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = FALSE)
colnames <- as.vector(t(names)[,1])
df <- read.table("household_power_consumption.txt", header = FALSE, skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879, sep = ";")
colnames(df) <- colnames

unlink(temp)


png(file="plot1.png", width=480, height=480)
hist(df$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

hist(df$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")



