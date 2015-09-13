## Ploting a time serie in png file

if(file.exists("household_power_consumption.txt")){

  ## Reading data source
  dataRaw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  dataTime  <- as.POSIXlt(paste(dataRaw$Date, dataRaw$Time), format = "%d/%m/%Y %T")
  dataAll <- cbind(dataTime, dataRaw[,3:9])
  
  ## Selecting data from the dates 2007-02-01 and 2007-02-02
  dataFeb <- subset( dataAll, subset = dataAll$dataTime >= "2007-02-01 00:00:00" & dataAll$dataTime < "2007-02-03 00:00:00")

  ##  to numeric type
  dataFeb$Global_active_power <- as.numeric(dataFeb$Global_active_power)

  ## plotting data 
  png("plot2.png") 
  plot(dataFeb$dataTime, dataFeb$Global_active_power/500,
       type="l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)"
       )
  dev.off() 
}

