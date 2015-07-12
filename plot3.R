# Load all the data
data <- read.csv("./household_power_consumption.txt", header = T,
                 sep = ";", na = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Get subset, data from the only 2 days we need
ds <- subset(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))
ds$Datetime <- as.POSIXct(paste(as.Date(ds$Date), ds$Time))

# Make plot to png directly
png(filename = "plot3.png", width = 480, height = 480)
plot(ds$Datetime, ds$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(ds$Datetime, ds$Sub_metering_2, col = "red")
lines(ds$Datetime, ds$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()

