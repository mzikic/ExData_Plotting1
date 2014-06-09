# read in the main file
# separator = ";"
# set column names (skip first line)
# convert "?" to NA
# 
X <- read.table("household_power_consumption.txt", sep=";", dec=".", col.names = c("Date","Time", "Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings="?", as.is=TRUE, skip=1)

# subset for the two days only
XSub <- subset(X, X$Date == "1/2/2007" | X$Date == "2/2/2007")

# create new column date and time
XSub$DateTime <- strptime(do.call(paste, c(XSub[c("Date","Time")], sep = " ")),format="%d/%m/%Y %H:%M:%S")

# open device
# pdf(file="plot2.pdf")
png(filename = 'plot2.png', height = 480, width = 480, units = 'px')

# initialise plot
with(XSub, plot(DateTime,Global_active_power, type="n", main = "", ylab="Global Active Power (kilowatts)", xlab = ""))

# draw lines
with(XSub, lines(DateTime, Global_active_power))

# switch off device
dev.off()





