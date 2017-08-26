# Assignment: Course Project 1
# Electric power consumption

# get data - you will need to have R dir set to where data is stored
rm(list = ls())
PowerData <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# convert txt date to date format
PowerData$Date <- as.Date(PowerData$Date, format = "%d/%m/%Y")

# take the section of data we are interested in
PowerData <- subset(PowerData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# create a date/time variable
PowerData$datetime <- strptime(paste(PowerData$Date, PowerData$Time), "%Y-%m-%d %H:%M:%S")

# create the plot
attach(PowerData)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
