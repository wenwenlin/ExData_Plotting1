
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data <- data[data$Date == "2/2/2007" | data$Date == "1/2/2007", ]


Global_active_power <- as.numeric(as.character(data$Global_active_power))
Date <- paste(data$Date, data$Time)
Date <- strptime(Date, "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")
plot(Date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
