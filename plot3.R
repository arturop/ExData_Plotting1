library("sqldf")

plotChart <- function() {
  plot(strptime(paste(houPowComp$Date, houPowComp$Time),"%d/%m/%Y %H:%M:%S"),
       houPowComp$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
  lines(strptime(paste(houPowComp$Date, houPowComp$Time),"%d/%m/%Y %H:%M:%S"), houPowComp$Sub_metering_2,
        type = "l", col = "red")
  lines(strptime(paste(houPowComp$Date, houPowComp$Time),"%d/%m/%Y %H:%M:%S"), houPowComp$Sub_metering_3,
        type = "l", col = "blue")
  legend("topright", col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1))
}

houPowComp <- read.csv.sql("household_power_consumption.txt",
                           sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                           sep =";", 
                           colClasses = 
                             c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric"))

plotChart()
png(width = 480, height = 480, file = "plot3.png")
plotChart()
dev.off()