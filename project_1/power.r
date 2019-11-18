power_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(power_url, temp)
unzip(temp, "household_power_consumption.txt")

names <- read.table("household_power_consumption.txt", nrows = 1, sep = ";", header = FALSE)
colnames <- as.vector(t(names)[,1])
df <- read.table("household_power_consumption.txt", header = FALSE, skip=grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879, sep = ";")
colnames(df) <- colnames

unlink(temp)

hist(df$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dates <- df$Date
times <- df$Time
x <- paste(dates, times)
x<-strptime(x, "%d/%m/%Y %H:%M:%S")

df$datetime<-x

with(df,plot(datetime,Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "", type = "l"))

with(df,plot(datetime,Sub_metering_1, ylab = "Energy sub metering",xlab = "", type = "l"))
with(df,points(datetime,Sub_metering_2, col = 'red', type = "l"))
with(df,points(datetime,Sub_metering_3, col = 'blue', type = 'l'))

par(mfrow = c(2,2))
with(df,plot(datetime,Global_active_power, ylab = "Global Active Power",xlab = "", type = "l"))
with(df,plot(datetime,Voltage, type = "l"))

with(df,plot(datetime,Sub_metering_1, ylab = "Energy sub metering",xlab = "", type = "l"))
with(df,points(datetime,Sub_metering_2, col = 'red', type = "l"))
with(df,points(datetime,Sub_metering_3, col = 'blue', type = 'l'))

with(df,plot(datetime,Global_reactive_power, type = "l"))



