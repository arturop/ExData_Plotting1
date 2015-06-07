library("sqldf")

houPowComp <- read.csv.sql("household_power_consumption.txt",
                           sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                           sep =";", 
                           colClasses = 
                             c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric"))

hist(houPowComp$Global_active_power, 
     col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.print(device = png, height= 480, width = 480, file = "plot1.png")