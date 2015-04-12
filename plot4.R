# Read and filter measurements for date range [2007-02-01, 2007-02-02]
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- transform(data, DateTime = strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Create plot
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
    plot(DateTime, Global_active_power, type = "l", 
         xlab = "", ylab = "Global Active Power")
    plot(DateTime, Voltage, type = "l", 
         xlab = "datetime", ylab = "Voltage")
    plot(DateTime, Sub_metering_1, type = "l", 
         xlab = "", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col = 'Red')
    lines(DateTime, Sub_metering_3, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})

# Save to PNG
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()