setwd("~/Expl Data")
Sys.setlocale(category="LC_ALL", locale="English_United States.1252")

dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na="?", colClasses=c(rep("character", 2), rep("numeric", 7)))
subset <- dataset[(dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007"), ]

subset$Datetime <- strptime(paste(subset$Date, subset$Time), "%d/%m/%Y %H:%M:%S")

png(filename="Plot2.png", width=480, height=480, units="px")
plot(subset$Datetime, subset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type='l')
dev.off()