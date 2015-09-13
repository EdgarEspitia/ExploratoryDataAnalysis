
if(file.exists("household_power_consumption.txt")){
  
  ## Reading data source
  dataRaw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  dataTime  <- as.POSIXlt(paste(dataRaw$Date, dataRaw$Time), format = "%d/%m/%Y %T")
  dataAll <- cbind(dataTime, dataRaw[,3:9])
  
  ## Selecting data from the dates 2007-02-01 and 2007-02-02
  dataFeb <- subset( dataAll, subset = dataAll$dataTime >= "2007-02-01 00:00:00" & dataAll$dataTime < "2007-02-03 00:00:00")
  
  ##  to numeric type
  dataFeb$Global_active_power <- as.numeric(dataFeb$Global_active_power)

  dataFeb$Voltage <- as.numeric(dataFeb$Voltage)
  
  dataFeb$Sub_metering_1 <- as.numeric(dataFeb$Sub_metering_1)
  dataFeb$Sub_metering_2 <- as.numeric(dataFeb$Sub_metering_2)
  dataFeb$Sub_metering_3 <- as.numeric(dataFeb$Sub_metering_3)

  dataFeb$Global_reactive_power <- as.numeric(  dataFeb$Global_reactive_power)

  png("plot4.png") 
  par(mfrow = c(2,2))
  ## plot Global Active Power
  plot(dataFeb$dataTime, dataFeb$Global_active_power/500,
       type = "l",
       xlab = "",
       ylab = "Global Active Power"
       )


  ## plot Global Active Power
  
  plot(dataFeb$dataTime, dataFeb$Voltage,
       type = "l",
       xlab = "datetime",
       ylab = "Voltage"
       )

  ## Plot Energy sub metering
    plot(dataFeb$dataTime, dataFeb$Sub_metering_1,
       type = "l",
       xlab = "",
       ylab = "Energy sub metering"
       )
  
  lines(dataFeb$dataTime, dataFeb$Sub_metering_2,
       col = "red"
       )
  lines(dataFeb$dataTime, dataFeb$Sub_metering_3,
        col = "blue"
        )
  legend("topright",
         lty = c(1, 1, 1),
         bty = "n",
         col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         )

  ## Plot global reactive power 
   plot(dataFeb$dataTime, dataFeb$Global_reactive_power,
       type = "l",
       xlab = "datatime",
       ylab = "Global_reactive_power"
       ) 
  dev.off() 
  
}
