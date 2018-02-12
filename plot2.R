# Import and read the data for Figure 1
data_power_consumption = read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# Select the data corresponding to Dates: 01/02/2007 - 02/02/2007
partial_data <- rbind(data_power_consumption[which(data_power_consumption$Date=="1/2/2007"),], data_power_consumption[which(data_power_consumption$Date=="2/2/2007"),])

# Convert Date and Time columns to POXISlt objet and create a new dataframe
# with the same partial data but with date and time replaced by the POXISlt object
Dates <- paste(as.character(partial_data$Date),as.character(partial_data$Time), sep = " ")
Dates <- (strptime(Dates, "%d/%m/%Y %H:%M:%S"))

Sys.setlocale(category = "LC_ALL", locale = "english")
plot(Dates, partial_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()
