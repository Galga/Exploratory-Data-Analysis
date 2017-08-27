setwd("~/Expl Data")
Sys.setlocale(category="LC_ALL", locale="English_United States.1252")

dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na="?", colClasses=c(rep("character", 2), rep("numeric", 7)))
subset <- dataset[(dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007"), ]

subset$Datetime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M:%S")

png(filename="Plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
#(1,1)
plot(subset$Datetime, subset$Global_active_power, xlab='', ylab='Global Active Power', type="l")
#(1,2)
plot(subset$Datetime, subset$Voltage, xlab='datetime', ylab='Voltage', type="l")
#(2,1)
plot(subset$Datetime, subset$Sub_metering_1, xlab='', ylab='Energy sub metering', type="l")
lines(subset$Datetime,subset$Sub_metering_2, col="red")
lines(subset$Datetime,subset$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#(2,2)
plot(subset$Datetime, subset$Global_reactive_power, xlab='datetime', ylab='Global_active_power', type="l")
dev.off() 