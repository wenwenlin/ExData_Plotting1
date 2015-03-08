
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007", ]


Date <- paste(data$Date, data$Time)
Date <- strptime(Date, "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

png(filename = "plot3.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")
plot(Date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Date, Sub_metering_2, col = "red")
lines(Date, Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
