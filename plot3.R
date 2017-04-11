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

with(data, {
        plot(Datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        lines(Datetime, Sub_metering_2, col = "red")
        lines(Datetime, Sub_metering_3, col = "blue")
        })

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

