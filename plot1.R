## Plotting a histogram in png file

if(file.exists("household_power_consumption.txt")){

  ## Reading data source
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  ## Selecting data from the dates 2007-02-01 and 2007-02-02
  Feb <- data[data$Date == as.Date("01/02/2007", "%d/%m/%Y") | data$Date == as.Date("02/02/2007", "%d/%m/%Y") ,  ]  

  ##  to numeric type
  Feb$Global_active_power <- as.numeric(Feb$Global_active_power)

  
  ## plotting data 
  png("plot1.png")
  hist(Feb$Global_active_power/500,
       col = "red",
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)" )
  dev.off()
}



