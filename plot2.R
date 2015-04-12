# Read and filter measurements for date range [2007-02-01, 2007-02-02]
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- transform(data, DateTime = strptime(paste(Date, Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")

# Create plot
with(data, plot(DateTime, Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)"))

# Save to PNG
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()