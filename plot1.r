#Set Working Directory

setwd("C:/Users/moranb7/Desktop/Coursera")

#Read in src file
src <- "household_power_consumption.txt"
data <- read.table(src, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

# Subsetting data for the time period of interest

data_sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Executing the histogram plot

plot_var <- as.numeric(data_sub$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(plot_var, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

