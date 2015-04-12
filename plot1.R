# Read and filter measurements for date range [2007-02-01, 2007-02-02]
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
data <- transform(data, Date = as.Date(Date, "%d/%m/%Y"))
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create plot
hist(data$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Save to PNG
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()