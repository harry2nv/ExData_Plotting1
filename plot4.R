data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
newdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap<- as.numeric(newdata$Global_active_power)
grp<- as.numeric(newdata$Global_reactive_power)
voltage <- as.numeric(newdata$Voltage)
SubMetering1 <- as.numeric(newdata$Sub_metering_1)
SubMetering2 <- as.numeric(newdata$Sub_metering_2)
SubMetering3 <- as.numeric(newdata$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SubMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off() 