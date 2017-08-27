# Assignment: Course Project 3
# Electric power consumption

# get Data - you will need to have R dir set to where data is stored
rm(list = ls())
PowerData <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# convert txt date to date format
PowerData$Date <- as.Date(PowerData$Date, format = "%d/%m/%Y")

# take the section of PowerData we are interested in
PowerData <- subset(PowerData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# create a date/time variable
PowerData$datetime <- strptime(paste(PowerData$Date, PowerData$Time), "%Y-%m-%d %H:%M:%S")

# create the plot
PowerData$datetime <- as.POSIXct(PowerData$datetime)

attach(PowerData)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(PowerData)