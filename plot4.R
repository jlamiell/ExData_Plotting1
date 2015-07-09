# Coursera Exploratory Data Analysis
# Course Project 1 (12 July 2015)
# JM Lamiell
# plot4.R
library(dplyr)
# Use the "Individual household electric power consumption Data Set"
# Assume provided data file "household_power_consumption.txt" is in the working directoy
EPC <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                colClasses = c("character", "character", "numeric", "numeric", 
                               "numeric", "numeric", "numeric", "numeric", "numeric"))
# Select only data for 1-2 February 2007
EPC.f <- filter(EPC, Date == "1/2/2007" | Date == "2/2/2007")
# Convert time variables to POSIX format
EPC.f$datetime <- as.POSIXlt(paste(EPC.f[, "Date"], EPC.f[, "Time"], sep = " "), format = "%d/%m/%Y %H:%M:%S")
EPC.f <- EPC.f[c("datetime", "Global_active_power", "Global_reactive_power", "Voltage", 
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
# Generate and save plot4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
plot(EPC.f$datetime, EPC.f$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(EPC.f$datetime, EPC.f$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
with(EPC.f, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(EPC.f, points(EPC.f$datetime, EPC.f$Sub_metering_1, col = "black", type = "l"))
with(EPC.f, points(EPC.f$datetime, EPC.f$Sub_metering_2, col = "red", type = "l"))
with(EPC.f, points(EPC.f$datetime, EPC.f$Sub_metering_3, col = "blue", type = "l"))
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(EPC.f$datetime, EPC.f$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
# Generate plot4
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
plot(EPC.f$datetime, EPC.f$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(EPC.f$datetime, EPC.f$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
with(EPC.f, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(EPC.f, points(EPC.f$datetime, EPC.f$Sub_metering_1, col = "black", type = "l"))
with(EPC.f, points(EPC.f$datetime, EPC.f$Sub_metering_2, col = "red", type = "l"))
with(EPC.f, points(EPC.f$datetime, EPC.f$Sub_metering_3, col = "blue", type = "l"))
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(EPC.f$datetime, EPC.f$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
