if(!exists("twoDaysPowerData")) {
  source("getTwoDaysPowerData.R")

  twoDaysPowerData <- getTwoDaysPowerData()
}

png(file = "plot2.png")

# create line plot of Global_active_power vs. Time
with(twoDaysPowerData, {
  plot(Timestamp, 
       Global_active_power, 
       type="l", 
       xlab = "", 
       ylab="Global Active Power (kilowatts)")
  
  axis.Date(1, at = Timestamp, labels = format(Timestamp,"%a"))
})

dev.off()
