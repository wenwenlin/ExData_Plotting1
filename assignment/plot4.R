
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007", ]


Date <- paste(data$Date, data$Time)
Date <- strptime(Date, "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(as.character(data$Global_active_power))

Voltage <- as.numeric(as.character(data$Voltage))

Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

Global_reactive_power <- as.numeric(data$Global_reactive_power)

png(filename = "plot4.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")

par(mfrow = c(2, 2))

plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(Date, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(Date, Sub_metering_1, type = "l", ylim = c(0, 35), xlab = "", ylab = "Energy sub metering")
lines(Date, Sub_metering_2, col = "red")
lines(Date, Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

plot(Date, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
