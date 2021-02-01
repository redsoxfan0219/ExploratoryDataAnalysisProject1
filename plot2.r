#Set Working Directory

setwd("C:/Users/moranb7/Desktop/Coursera")

#Read in src file
src <- "household_power_consumption.txt"
data <- read.table(src, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subsetting data for the time period of interest

data_sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Reformatting date

datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# Executing the line graph

datetime <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(data_sub$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
