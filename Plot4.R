electricdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
electricdata$Date <- as.Date(electricdata$Date,"%d/%m/%Y")
newelectricdata <- subset(electricdata, electricdata$Date == "2007-02-01" | electricdata$Date == "2007-02-02")
datetime <- paste(newelectricdata$Date,newelectricdata$Time)
datetime <- as.POSIXct(datetime)
newelectricdata$datetime <- datetime
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(newelectricdata, {
  plot(Global_active_power~datetime,
       type = "l", 
       ylab="Global Active Power", 
       xlab="")
  plot(Voltage~datetime,
       type = "l", 
       ylab="Voltage", 
       xlab="datetime")
  {plot(newelectricdata$Sub_metering_1~newelectricdata$datetime,
       type = "l", 
       ylab="Energy sub metering", 
       xlab="")
  lines(newelectricdata$Sub_metering_2~newelectricdata$datetime,col="red")
  lines(newelectricdata$Sub_metering_3~newelectricdata$datetime,col="blue")
  legend("topright", lty=rep(1,3), bty="n", col = c("black", "blue", "red"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))}
  plot(Global_reactive_power~datetime,
       type = "l", 
       ylab="Global_reactive_power", 
       xlab="datetime")
})
dev.off()
