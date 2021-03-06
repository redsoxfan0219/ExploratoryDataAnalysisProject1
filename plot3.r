#Set Working Directory

setwd("C:/Users/moranb7/Desktop/Coursera")

#Read in src file
src <- "household_power_consumption.txt"
data <- read.table(src, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subsetting data for the time period of interest

data_sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Prepping for Plot 

globalActivePower <- as.numeric(data_sub$Global_active_power)
subMetering1 <- as.numeric(data_sub$Sub_metering_1)
subMetering2 <- as.numeric(data_sub$Sub_metering_2)
subMetering3 <- as.numeric(data_sub$Sub_metering_3)

# Executing the multi-color plot

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()