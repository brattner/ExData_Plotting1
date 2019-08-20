## read the file with the data from the data folder in working directory

Data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings = "?", stringsAsFactors = FALSE)

## create a subset of the data by selecting only data from the dates 2007-02-01 and 2007-02-02

subsetData <- subset(Data, Date %in% c("1/2/2007","2/2/2007"))

## open png device and create the file "plot.png" with width 480 pixels and height 480 pixels.
## This file will be created in the working directory

png("plot2.png", width = 480, height = 480)

## change the format of the date using as.Date function

subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")

## create a new variable that combines the Date and Time variables
DateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$DateTime <- as.POSIXct(DateTime)

## create a plot that showes the Global Active Power as a function of the day of the week

with(subsetData, plot(Global_active_power ~ DateTime, type="l", 
                      ylab = "Global Active Power (kilowatts)", xlab=""))

## close the device

dev.off()
