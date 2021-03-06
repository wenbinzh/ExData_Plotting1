data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character", "character", rep("numeric", 7)))
data <- data[data[, 1] == "1/2/2007" | data[, 1] == "2/2/2007",]
data <- cbind(strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"), data[, c(-1, -2)])
colnames(data)[1] <- "DateTime"
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()