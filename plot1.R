# plot1.R - Histogram of Global Active Power

# Read data, convert dates and subset on 2007-02-01 ~ 2007-02-02
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

main_data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01")
                          & as.Date(DateTime) <= as.Date("2007-02-02"))
# open png file
png("plot1.png", height=480, width=480)

# make plot1 (histogram of global active power (kilowatts))
hist(main_data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

# close png file
dev.off()