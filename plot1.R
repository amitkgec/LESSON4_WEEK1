power_consumption <- read.table("household_power_consumption.txt",header = TRUE,na.strings = "?", sep = ";")
power_consumption$Date_Time <- paste(power_consumption$Date,power_consumption$Time)
power_consumption$dt <- strftime(power_consumption$Date_Time, "%d/%m/%Y %H%M%S")
power_data <- power_consumption[complete.cases(power_consumption[,"Date_Time"]), ]
power_data$dt <- strptime(power_data$Date_Time,"%d/%m/%Y %H:%M:%S")
power_data1 <- subset(power_data, as.Date(dt) >= "2007-02-01" & as.Date(dt) <= "2007-02-02")
png(filename = "plot5.png",width = 480, height = 480, units = "px")
hist(power_data1$Global_active_power,col="red", xlab = "Global Active Power(kilowatts)", main= "Global Active Power")
dev.off()