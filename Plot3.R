electricdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
electricdata$Date <- as.Date(electricdata$Date,"%d/%m/%Y")
newelectricdata <- subset(electricdata, electricdata$Date == "2007-02-01" | electricdata$Date == "2007-02-02")
datetime <- paste(newelectricdata$Date,newelectricdata$Time)
datetime <- as.POSIXct(datetime)
newelectricdata$datetime <- datetime
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(newelectricdata$Sub_metering_1~newelectricdata$datetime,
     type = "l", 
     ylab="Energy sub metering", 
     xlab="")
lines(newelectricdata$Sub_metering_2~newelectricdata$datetime,col="red")
lines(newelectricdata$Sub_metering_3~newelectricdata$datetime,col="blue")
legend("topright", lty=rep(1,3), col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()