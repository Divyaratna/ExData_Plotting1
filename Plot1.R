## Coursera - Exploratory Data Analysis - Plotting Assignment 1 - Plot 1
##
## Create Plot 1

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
Epc$Date = as.Date(Epc$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
Epc = Epc[Epc$Date >= startDate & Epc$Date <= endDate, ]

## Create the plot and save it as a PNG
png(filename="plot1.png", width=480, height=480)
hist(Epc$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()
