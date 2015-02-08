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
plot(power$TimeDate,power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
# Save as PNG file names plot1.png with resulotion of 480 pixels
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()