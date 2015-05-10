## Coursera - Exploratory Data Analysis - Course Project 1 - Plot 4
##
## Create and Combine 4 different plots in one plot and export and save it as PNG Files

## Download the neccessary data file and save it into a file in the local working directory
filename = "exdata_consumption.zip"
if (!file.exists(filename)) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = filename)
}

## Unzip the file and read the data from the file
Epc = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
               sep=";", stringsAsFactors=F, na.strings="?",
               colClasses=c("character", "character", "numeric",
                            "numeric", "numeric", "numeric",
                            "numeric", "numeric", "numeric"))

## Format the date and time and then subset the data to time period 2007-02-01 to 2007-02-02
Epc$timestamp = strptime(paste(Epc$Date, Epc$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC")
FromDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
ToDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
Epc = Epc[Epc$timestamp >= FromDate & Epc$timestamp <= ToDate, ]

## Create the plot
png(filename="plot4.png", width=480, height=480)

# Use par() to combine the 4 plots
par(mfcol=c(2,2))

# Create the first plot
plot(Epc$timestamp, Epc$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Create the second plot
plot(Epc$timestamp, Epc$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(Epc$timestamp, Epc$Sub_metering_2, col="red")
lines(Epc$timestamp, Epc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# Create the third Plot
plot(Epc$timestamp, Epc$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Create the fourth plot
plot(Epc$timestamp, Epc$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
