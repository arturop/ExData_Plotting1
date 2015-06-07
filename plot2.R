library("sqldf")

houPowComp <- read.csv.sql("household_power_consumption.txt",
                           sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                           sep =";", 
                           colClasses = 
                             c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric"))

plot(strptime(paste(houPowComp$Date, houPowComp$Time),"%d/%m/%Y %H:%M:%S"), 
     houPowComp$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.print(device = png, width = 480, height = 480, file = "plot2.png")
