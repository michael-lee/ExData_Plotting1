# Load all the data
data <- read.csv("./household_power_consumption.txt", header = T,
                 sep = ";", na = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Get subset, data from the only 2 days we need
ds <- subset(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))
ds$Datetime <- as.POSIXct(paste(as.Date(ds$Date), ds$Time))

# Make plot
plot(ds$Global_active_power ~ ds$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Write to png file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()

