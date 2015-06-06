if(!exists("twoDaysPowerData")) {
  source("getTwoDaysPowerData.R")

  twoDaysPowerData <- getTwoDaysPowerData()
}

png(file = "plot1.png")

hist(twoDaysPowerData$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
