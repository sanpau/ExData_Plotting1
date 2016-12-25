#################
householdFile<-("./household_power_consumption.txt")
##
plotData <- read.table(householdFile, header=TRUE, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]

SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

finalData <- cbind(SetTime, finalData)


## Generating Plot 2

png("plot2.png",bg="transparent", width=480, height=480)
plot(finalData$Global_active_power ~ finalData$SetTime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
