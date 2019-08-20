## read the file with the data from the data folder in working directory

Data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings = "?", stringsAsFactors = FALSE)

## create a subset of the data by selecting only data from the dates 2007-02-01 and 2007-02-02

subsetData <- subset(Data, Date %in% c("1/2/2007","2/2/2007"))

## open png device and create the file "plot.png" with width 480 pixels and height 480 pixels.
## This file will be created in the working directory

png("plot4.png", width = 480, height = 480)

## change the format of the date using as.Date function

subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")

## create a new variable that combines the Date and Time variables
DateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$DateTime <- as.POSIXct(DateTime)

## indicate you want to place 4 plots in 2 rows and 2 columns
par(mfrow=c(2,2))
   
## add first plot

with(subsetData, plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = ""))

## add second plot

with(subsetData, plot(Voltage ~ DateTime, type="l", ylab = "Voltage", xlab="datetime"))

## add third plot

with(subsetData, plot(Sub_metering_1 ~ DateTime, type = "l", xlab="",
                      ylab = "Energy sub metering"))
lines(subsetData$Sub_metering_2 ~ subsetData$DateTime, col = "red")
lines(subsetData$Sub_metering_3 ~ subsetData$DateTime, col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1, bty = "n", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## add fourth plot
with(subsetData, plot(Global_reactive_power ~ DateTime, type = "l", ylab = "Global_reactive_power",
                      xlab = "datetime"))

##close device
dev.off()
