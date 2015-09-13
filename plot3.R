## Plotting a time serie in png file

if(file.exists("household_power_consumption.txt")){

  ## Reading data source
  dataRaw <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  dataTime  <- as.POSIXlt(paste(dataRaw$Date, dataRaw$Time), format = "%d/%m/%Y %T")
  dataAll <- cbind(dataTime, dataRaw[,3:9])
  
  ## Selecting data from the dates 2007-02-01 and 2007-02-02
  dataFeb <- subset( dataAll, subset = dataAll$dataTime >= "2007-02-01 00:00:00" & dataAll$dataTime < "2007-02-03 00:00:00")

  ##  to numeric type
  dataFeb$Sub_metering_1 <- as.numeric(dataFeb$Sub_metering_1)
  dataFeb$Sub_metering_2 <- as.numeric(dataFeb$Sub_metering_2)
  dataFeb$Sub_metering_3 <- as.numeric(dataFeb$Sub_metering_3)
    
  ## plotting data 
  png("plot3.png") 

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
         col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         )
  
  dev.off() 
}
