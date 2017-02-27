rm(list = ls())
# download and unzip data
setwd('C:/Users/rdang/Desktop/Coursera/Exploratory Data Analysis/exdata_data_household_power_consumption')

# read data into R
hhpower <- file('./household_power_consumption.txt')

hhpower_data <- read.table(text = grep("^[1,2]/2/2007",readLines(hhpower),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 1
# open device
if(!file.exists('figures1')) dir.create('figures1')
png(filename = './figures1/plot1.png', width = 480, height = 480, units='px')
# plot figure
with(hhpower_data, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
# close device
dev.off()

# Plot 2
# convert data and time to specific format
hhpower_data$Date <- as.Date(hhpower_data$Date, format = '%d/%m/%Y')
hhpower_data$DateTime <- as.POSIXct(paste(hhpower_data$Date, hhpower_data$Time))
# open device
if(!file.exists('figures1')) dir.create('figures1')
png(filename = './figures1/plot2.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(hhpower_data$DateTime, hhpower_data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
# close device
dev.off()

# Plot 3
# open device
if(!file.exists('figures1')) dir.create('figures1')
png(filename = './figures1/plot3.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(hhpower_data$DateTime, hhpower_data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(hhpower_data$DateTime, hhpower_data$Sub_metering_2, col = 'red')
lines(hhpower_data$DateTime, hhpower_data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# close device
dev.off()

# Plot 4
# open device
if(!file.exists('figures1')) dir.create('figures1')
png(filename = './figures1/plot4.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfrow = c(2, 2))
plot(hhpower_data$DateTime, hhpower_data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(hhpower_data$DateTime, hhpower_data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(hhpower_data$DateTime, hhpower_data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(hhpower_data$DateTime, hhpower_data$Sub_metering_2, col = 'red')
lines(hhpower_data$DateTime, hhpower_data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(hhpower_data$DateTime, hhpower_data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
# close device
dev.off()