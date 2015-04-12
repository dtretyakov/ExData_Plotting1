# Read and filter measurements for date range [2007-02-01, 2007-02-02]
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- transform(data, DateTime = strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Create plot
with(data, {
    plot(DateTime, Sub_metering_1, type = "l",
         xlab = "", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col = 'Red')
    lines(DateTime, Sub_metering_3, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to PNG
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()