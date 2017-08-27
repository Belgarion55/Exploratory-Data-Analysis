# Assignment: Course Project 2
# Electric power consumption

# get Data - you will need to have R dir set to where Data is stored
rm(list = ls())
PowerData <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# convert txt date to date format
PowerData$Date <- as.Date(PowerData$Date, format = "%d/%m/%Y")

# take the section of PowerData we are interested in
PowerData <- subset(PowerData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# create a date/time variable
PowerData$datetime <- strptime(paste(PowerData$Date, PowerData$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
PowerData$datetime <- as.POSIXct(PowerData$datetime)
attach(PowerData)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(PowerData)