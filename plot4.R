# plot4.R 

# Read data, convert dates and subset on 2007-02-01 ~ 2007-02-02
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

main_data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01")
                    & as.Date(DateTime) <= as.Date("2007-02-02"))
# open png file
png("plot4.png", height=480, width=480)

# make 2x2 sections for plots
par(mfrow=c(2,2))

# make plot(1,1)
plot(main_data$DateTime, main_data$Global_active_power, pch=NA, xlab="", ylab="Global Active Power")
lines(main_data$DateTime, main_data$Global_active_power)

# make plot(1,2)
plot(main_data$DateTime, main_data$Voltage, pch=NA, xlab="datetime", ylab="Voltage")
lines(main_data$DateTime, main_data$Voltage)

# make plot(1,3)
plot(main_data$DateTime, main_data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(main_data$DateTime, main_data$Sub_metering_1)
lines(main_data$DateTime, main_data$Sub_metering_2, col="red")
lines(main_data$DateTime, main_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")

# make plot(1,4)
plot(main_data$DateTime, main_data$Global_reactive_power, pch=NA, xlab="datetime", ylab="Global_reactive_power")
lines(main_data$DateTime, main_data$Global_reactive_power)

# close png file
dev.off()