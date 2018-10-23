electricdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
electricdata$Date <- as.Date(electricdata$Date,"%d/%m/%Y")
newelectricdata <- subset(electricdata, electricdata$Date == "2007-02-01" | electricdata$Date == "2007-02-02")
datetime <- paste(newelectricdata$Date,newelectricdata$Time)
datetime <- as.POSIXct(datetime)
newelectricdata$datetime <- datetime
plot(newelectricdata$Global_active_power~newelectricdata$datetime,
     type = "l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")
dev.copy(png, file = "plot2.png", 
         width = 480, height = 480, units = "px")
dev.off()

