power_consumption <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?", sep = ";")
power_consumption$Date_Time <- paste(power_consumption$Date,power_consumption$Time)
power_consumption$dt <- strftime(power_consumption$Date_Time, "%d/%m/%Y %H%M%S")
power_data <- power_consumption[complete.cases(power_consumption[,"Date_Time"]), ]
power_data$dt <- strptime(power_data$Date_Time,"%d/%m/%Y %H:%M:%S")
power_data1 <- subset(power_data, as.Date(dt) >= "2007-02-01" & as.Date(dt) <= "2007-02-02")
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(power_data1$dt,power_data1$Global_active_power,type = "l", ylab = "Global Active Power", xlab = "")
plot(power_data1$dt,power_data1$Voltage,type = "l", ylab = "Voltage", xlab = "datetime")
plot(power_data1$dt,type = "l", power_data1$Sub_metering_1, ylab = "Energy sub metering", xlab = "")
lines(power_data1$dt, power_data1$Sub_metering_2,type="l",col="red")
lines(power_data1$dt, power_data1$Sub_metering_3,type="l",col="blue")
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = c(1,1,1), bty = "n")
plot(power_data1$dt,power_data1$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()