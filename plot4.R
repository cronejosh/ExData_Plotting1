# Author: Joshua Crone
# Date: Apr 24, 2016
# Course: Coursera - Exploratory Data Analysis
# Title: Course Project 1 - Plot 4

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
png(file = "plot4.png", width = 480, height = 480, units = "px")

# Build the required plots

# First set the plot to hold a 2x2 array of plots
par(mfrow = c(2, 2))

# Now draw the 4 plots

# Top left plot (same as plot2, but no units in y-axis label)
plot(data$datetime, data$Global_active_power, type = "n",
     main = "",
     ylab = "Global Active Power",
     xlab = "")
lines(data$datetime, data$Global_active_power)

# Top right plot
#NOTE: I realize it's odd to add the x-axis label of "datetime" here, 
#      but that's what the model graph had
plot(data$datetime, data$Voltage, type = "n",
     main = "",
     ylab = "Voltage",
     xlab = "datetime") 
lines(data$datetime, data$Voltage)

# Bottom left plot (same as plot3, but with no box around legend)
plot(data$datetime, data$Sub_metering_1, type = "n",
     main = "",
     ylab = "Energy sub metering",
     xlab = "")
lines(data$datetime, data$Sub_metering_1, col = "black")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

# Bottom right plot
#NOTE: I realize it's odd to add the x-axis label of "datetime" here, 
#      but that's what the model graph had
plot(data$datetime, data$Global_reactive_power, type = "n",
     main = "",
     ylab = "Global_reactive_power",
     xlab = "datetime")
lines(data$datetime, data$Global_reactive_power)

# Close the graphics device
dev.off()
