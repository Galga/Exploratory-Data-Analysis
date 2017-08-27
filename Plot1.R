setwd("~/Expl Data")

dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na="?", colClasses=c(rep("character", 2), rep("numeric", 7)))
subset <- dataset[(dataset$Date=="1/2/2007" | dataset$Date=="2/2/2007"), ]

png(filename="Plot1.png", width=480, height=480, units="px")
hist(subset$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()