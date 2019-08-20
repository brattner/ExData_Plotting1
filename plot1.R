## read the file with the data from the data folder in working directory

Data <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings = "?", stringsAsFactors = FALSE)

## create a subset of the data by selecting only data from the dates 2007-02-01 and 2007-02-02

subsetData <- subset(Data, Date %in% c("1/2/2007","2/2/2007"))

## open png device and create the file "plot.png" with width 480 pixels and height 480 pixels.
## This file will be created in the working directory

png("plot1.png", width = 480, height = 480)

## create a histogram that shows the distribution of the variable Global Active Power. Label the x 
## and the y axis, and select the color red for the bars)

hist(subsetData$Global_active_power, main = "Global Active Power", col = "red", ylab = "Frequency",
     xlab = " Global Active Power (kilowatts)")

## close the device

dev.off()
