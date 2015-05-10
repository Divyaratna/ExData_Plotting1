## Coursera - Exploratory Data Analysis - Plotting Assignment 1 - Plot 2
##
## Create Plot 2

## Download the neccessary data file and save it into a file in the local working directory
filename = "exdata_consumption.zip"
if (!file.exists(filename)) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = filename)
}

## Read the data from the zipped file
Epc = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
               sep=";", stringsAsFactors=F, na.strings="?",
               colClasses=c("character", "character", "numeric",
                            "numeric", "numeric", "numeric",
                            "numeric", "numeric", "numeric"))

## Format the date and time and then subset the data to time period 2007-02-01 to 2007-02-02
## Create new variable timestamp
Epc$timestamp = strptime(paste(Epc$Date, Epc$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
Epc = Epc[Epc$timestamp >= startDate & Epc$timestamp <= endDate, ]

## Create the plot and save it as a PNG
png(filename="plot2.png", width=480, height=480)
plot(Epc$timestamp, Epc$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
