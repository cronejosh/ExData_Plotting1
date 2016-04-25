# Author: Joshua Crone
# Date: Apr 24, 2016
# Course: Coursera - Exploratory Data Analysis
# Title: Course Project 1 - Plot 1

# =========================================================================
# Requirements set out in assignment
# =========================================================================

# Read in data (only pertinent rows)
filepath = "./data/household_power_consumption.txt"
data = read.table(filepath, header = FALSE, sep = ";",
                  skip = 66637,nrows = 2880)
names(data) <- c("Date", "Time", "Global_active_power", 
                 "Global_reactive_power", "Voltage", 
                 "Global_intensity", "Sub_metering_1", 
                 "Sub_metering_2", "Sub_metering_3")

# Convert date and time columns to appropriate classes
data$datetime <- paste(data$Date, data$Time)
data$datetime <- strptime(data$datetime, format = "%d/%m/%Y %H:%M:%S")

# Open png graphics device, with correct size specifications
png(file = "plot1.png", width = 480, height = 480, units = "px")

# Build the required plot
hist(data$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

# Close the graphics device
dev.off()
