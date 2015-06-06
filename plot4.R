if(!exists("twoDaysPowerData")) {
  source("getTwoDaysPowerData.R")
  
  twoDaysPowerData <- getTwoDaysPowerData()
}

png(file = "plot4.png")

par(mfrow = c(2, 2))

with(twoDaysPowerData, {
  # upper left
  plot(Timestamp, Global_active_power, type="l", xlab = "", ylab="Global Active Power")
  
  axis.Date(1, at = Timestamp, labels = format(Timestamp,"%a"))
  
  #upper right
  plot(Timestamp, Voltage, type="l", xlab = "datetime", ylab="Voltage")
  
  axis.Date(1, at = Timestamp, labels = format(Timestamp,"%a"))
  
  #lower left
  plot(Timestamp, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  
  points(Timestamp, Sub_metering_2, col = "red", type="l")
  
  points(Timestamp, Sub_metering_3, col = "blue", type="l")
  
  legend("topright", lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  
  #lower right
  plot(Timestamp, Global_reactive_power, type="l", xlab = "datetime")
  
  axis.Date(1, at = Timestamp, labels = format(Timestamp,"%a"))
})

dev.off()
