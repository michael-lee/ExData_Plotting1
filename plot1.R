# Load all the data
data <- read.csv("./household_power_consumption.txt", header = T,
                 sep = ";", na = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Get subset, data from the only 2 days we need
ds <- subset(data, (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Make plot
hist(ds$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     col = "red")

# Write to png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
