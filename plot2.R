## Reading in dataset ##
FullData <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Format dates ##

FullData$Date <- as.Date(FullData$Date, format="%d/%m/%Y")

## Subsetting the data for dates dates 2007-02-01 and 2007-02-02  ##

data <- subset(FullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
     
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()