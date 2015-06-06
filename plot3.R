if(!exists("twoDaysPowerData")) {
  source("getTwoDaysPowerData.R")
  
  twoDaysPowerData <- getTwoDaysPowerData()
}

png(file = "plot3.png")

with(twoDaysPowerData, {
  plot(Timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  
  points(Timestamp, Sub_metering_2, col = "red", type="l")
  
  points(Timestamp, Sub_metering_3, col = "blue", type="l")
  
  legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()

