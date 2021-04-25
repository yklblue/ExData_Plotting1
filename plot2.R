# plot2.R - Line graph of Global Active Power through Thu~Sat

# Read data, convert dates and subset on 2007-02-01 ~ 2007-02-02
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

main_data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01")
                    & as.Date(DateTime) <= as.Date("2007-02-02"))
# open png file
png("plot2.png", height=480, width=480)

# make plot2 (line graph of Global Active Power through Thu~Sat)
plot(main_data$DateTime, main_data$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(main_data$DateTime, main_data$Global_active_power)

# close png file
dev.off()