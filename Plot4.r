householdFile<-("./household_power_consumption.txt")
##
plotData <- read.table(householdFile, header=TRUE, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]

SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

finalData <- cbind(SetTime, finalData)

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")


png("Plot4.png",bg="transparent", height=480, width=480)
par(mfrow=c(2,2))
plot(finalData$SetTime,finalData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", xlab="Datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, type="l", xlab="Datetime", ylab="Global_reactive_power")
dev.off()
