getTwoDaysPowerData <- function() {
  zipFilename <- "exdata-data-household_power_consumption.zip"

  # console message
  cat("Check for zip file named '", zipFilename, "'\n\n", sep = "")

  # check to see if the source data zip file 
  # exists in the working directory
  # and download the file if it does not exist
  
  if (!file.exists(zipFilename)) {
    
    # set zip file download URL
    zipFileDownloadUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    # console message
    cat("Zip file is not present so download file from ", zipFileDownloadUrl, "'\n\n")
    
    # download the zip file since it's 
    # not present in the working directory
    download.file(zipFileDownloadUrl, zipFilename)
  }
  
  # check again to see if the source data zip file 
  # exists in the working directory
  # if it still doesn't exist, stop execution
  
  if (!file.exists(zipFilename)) {
    stop(paste("unable to download '", zipFilename, "' from '", zipFileDownloadUrl, "'"))
  }
  
  powerDataFilename <- "household_power_consumption.txt"

  #console message
  cat("Extracting", powerDataFilename, "from zip file")
  
  powerDataFile <- unz(zipFilename, powerDataFilename)
  
  #console message
  cat("Read table from", powerDataFilename, "into data frame")
  
  powerData <- as.data.frame(read.table(powerDataFile, sep=";", header=TRUE))
  
  powerData$DateAsDate <- as.Date(powerData$Date, "%d/%m/%Y")
  
  twoDaysPowerData <- powerData[powerData$DateAsDate %in% as.Date(c('2007-02-01', '2007-02-02')),]
  
  twoDaysPowerData$Timestamp <- with(twoDaysPowerData, strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

  cols.num <- c("Global_active_power","Global_reactive_power", "Voltage", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
   
  twoDaysPowerData[cols.num] <- sapply(twoDaysPowerData[cols.num], as.character)
  
  twoDaysPowerData[cols.num] <- sapply(twoDaysPowerData[cols.num], as.numeric)
  
  twoDaysPowerData
}