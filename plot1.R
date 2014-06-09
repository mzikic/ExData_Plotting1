# read in the main file
# separator = ";"
# set column names (skip first line)
# convert "?" to NA
# 
X <- read.table("household_power_consumption.txt", sep=";", dec=".", col.names = c("Date","Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings="?", as.is=TRUE, skip=1)

# subset for the two days only
XSub <- subset(X, X$Date == "1/2/2007" | X$Date == "2/2/2007")

# open device
# pdf(file="plot1.pdf")
png(filename = 'plot1.png', height = 480, width = 480, units = 'px')

# create histogram
hist(XSub$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# switch off device
dev.off()