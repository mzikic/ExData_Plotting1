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
# pdf(file="plot4.pdf")
png(filename = 'plot4.png', height = 480, width = 480, units = 'px')

# set plotting area 2x2
par(mfrow=c(2,2))

# draw first plot
# initialise plot
with(XSub, plot(DateTime,Global_active_power, type="n", main = "", ylab="Global Active Power", xlab = ""))
# draw lines
with(XSub, lines(DateTime, Global_active_power))

# draw second plot
with(XSub, plot(DateTime,Voltage, type="n", main = "", ylab="Voltage", xlab = ""))
# draw lines
with(XSub, lines(DateTime, Voltage))

# draw third plot
# initialise plot
with(XSub, plot(DateTime, Sub_metering_1, type="n", main = "", ylab="Energy sub metering", xlab = ""))

# draw 
with(XSub, lines(DateTime, Sub_metering_1, col="black"))
with(XSub, lines(DateTime, Sub_metering_2, col="red"))
with(XSub, lines(DateTime, Sub_metering_3, col="blue"))

# legend
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

# draw forth
# initialise plot
with(XSub, plot(DateTime, Global_reactive_power, type="n", main = "", ylab="Global Reactive Power", xlab = ""))
# draw
with(XSub, lines(DateTime, Global_reactive_power, col="black"))

# switch off device
dev.off()


