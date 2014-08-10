data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
data <- data[data[, 1] == "1/2/2007" | data[, 1] == "2/2/2007",]
data <- cbind(strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"), data[, c(-1, -2)])
colnames(data)[1] <- "DateTime"
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()