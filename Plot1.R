electricdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
electricdata$Date <- as.Date(electricdata$Date,"%d/%m/%Y")
newelectricdata <- subset(electricdata, electricdata$Date == "2007-02-01" | electricdata$Date == "2007-02-02")
hist(newelectricdata$Global_active_power, 
     col = "red3", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", 
         width = 480, height = 480, units = "px")
dev.off()