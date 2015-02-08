## Coursera- Exploratory Data Analysis- Assignment 1- plot1.R
# Read data from the text file containing power data
power_data = read.csv("household_power_consumption.txt", header=T,
                      sep=";", stringsAsFactors=F, na.strings="?",
                      colClasses=c("character", "character", "numeric",
                                   "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"))
# Change Date format as sugested: using as.Date()
power_data$Date = as.Date(power_data$Date,format="%d/%m/%Y")
# Set start and ending date
start = as.Date("01/02/2007", format="%d/%m/%Y")
end = as.Date("02/02/2007", format="%d/%m/%Y")
# COnditional Subsetting of power_data between start and end dates
power <- power_data[power_data$Date >= start & power_data$Date <= end, ]
# Make histogram plot
hist(power$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active Power, (kilowatts)")
# Save as PNG file names plot1.png with resulotion of 480 pixels
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()