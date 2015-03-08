
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007", ]

Global_active_power <- as.numeric(as.character(data$Global_active_power))

hist(Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

png(filename = "plot1.png", width = 480, height = 480)
hist(Global_active_power, col = "Red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()