## Coursera- Exploratory Data Analysis- Assignment 1- plot1.R
# Read data from the text file containing power data
power_data = read.csv("household_power_consumption.txt", header=T,
                      sep=";", stringsAsFactors=F, na.strings="?",
                      colClasses=c("character", "character", "numeric",
                                   "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"))
# Change Date and Time into a continuous format for time series plot
# as sugested: using as.Date() and strptime() or equivalent functions

power_data$TimeDate = strptime(paste(power_data$Date, power_data$Time),
                               format="%d/%m/%Y %H:%M:%S")
# Set start and ending date
start = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
end= strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S")
# COnditional Subsetting of power_data between start and end dates
power <- power_data[power_data$TimeDate >= start & power_data$TimeDate <= end, ]
# Make line plot
# Save as PNG file names plot1.png with resulotion of 480 pixels
png(filename="plot3.png", width=480, height=480,bg = "transparent")
plot(power$TimeDate,power$Sub_metering_1, type="l",col="red",xlab="",
     ylab="Energy sub metering")
lines(power$TimeDate,power$Sub_metering_2, type="l",col="red")
lines(power$TimeDate,power$Sub_metering_3, type="l",col="blue")
legend("topright",pch = "-",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()