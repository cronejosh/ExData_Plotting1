# Author: Joshua Crone
# Date: Apr 24, 2016
# Course: Coursera - Exploratory Data Analysis
# Title: Course Project 1 - Plot 3

# =========================================================================
# Requirements set out in assignment
# =========================================================================

# Read in data
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
png(file = "plot3.png", width = 480, height = 480, units = "px")

# Build the required plot

# First setup the plot area, without lines (NOTE: use data$Sub_metering_1
# since this data has the largest vertical range)
plot(data$datetime, data$Sub_metering_1, type = "n",
     main = "",
     ylab = "Energy sub metering",
     xlab = "")

# Add the lines
lines(data$datetime, data$Sub_metering_1, col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")

# Add the legend
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the graphics device
dev.off()
