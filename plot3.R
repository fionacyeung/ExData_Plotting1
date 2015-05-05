# local path
filePath = "C:\\classes\\Coursera\\Data_Science_Specialization\\Exploratory_Analysis\\project_1\\exdata_data_household_power_consumption\\household_power_consumption.txt"
pngPath = "C:\\classes\\Coursera\\Data_Science_Specialization\\Exploratory_Analysis\\project_1\\plot3.png"

data = read.table(filePath, header = TRUE, sep = ";", na.strings = "?")
data = transform(data, Date = as.Date(Date, "%d/%m/%Y"))

# get the dates that we care about
data_subset = data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

# transform the time, by putting together the Date and Time column
data_subset2 = transform(data_subset, Time = strptime(paste(data_subset$Date, data_subset$Time), "%Y-%m-%d %H:%M:%S"))


# open png device
png(pngPath, width = 480, height = 480, units = "px")

# plot 3
plot(data_subset2$Time, data_subset2$Sub_metering_1, type = "l", lwd = 1, col = "black", xlab = "", ylab = "Energy sub metering")
lines(data_subset2$Time, data_subset2$Sub_metering_2, lwd = 1, col = "red")
lines(data_subset2$Time, data_subset2$Sub_metering_3, lwd = 1, col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the device
dev.off()