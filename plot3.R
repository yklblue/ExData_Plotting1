# plot3.R - Sub_metering_1, 2, 3 line graphs

# Read data, convert dates and subset on 2007-02-01 ~ 2007-02-02
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

main_data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01")
                    & as.Date(DateTime) <= as.Date("2007-02-02"))
# open png file
png("plot3.png", height=480, width=480)

# make plot3 (line graph of Energy sub metering through Thu~Sat)
plot(main_data$DateTime, main_data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(main_data$DateTime, main_data$Sub_metering_1)
lines(main_data$DateTime, main_data$Sub_metering_2, col="red")
lines(main_data$DateTime, main_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

# close png file
dev.off()