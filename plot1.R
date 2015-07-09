# Coursera Exploratory Data Analysis
# Course Project 1 (12 July 2015)
# JM Lamiell
# plot1.R
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
# Generate and save plot1
png("plot1.png", width = 480, height = 480)
hist(EPC.f$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
# Generate and save plot1
hist(EPC.f$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")