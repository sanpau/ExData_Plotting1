householdFile<-("./household_power_consumption.txt")
##
plotData <- read.table(householdFile, header=TRUE, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]

SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

finalData <- cbind(SetTime, finalData)


## Generating Plot 1 and saving in png file.

png("Plot1try1.png",bg="transparent", width=480,height=480)
hist(
  finalData$Global_active_power, 
  col = "red", 
  main = paste("Global Active Power"), 
  xlab = "Global Active Power (kilowatts)"
)
dev.off()
