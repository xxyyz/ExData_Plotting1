# START: base code to get the data; these are the same in all plotx.R files

if (!file.exists("household_power_consumption.zip"))
{download.file(
    "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
    "household_power_consumption.zip")}

if (!file.exists("household_power_consumption.txt"))
{unzip("household_power_consumption.zip")}

if (!exists("hpc"))
{hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]}

# END: base code to get the data; these are the same in all plotx.R files

png(file="plot3.png")
hpc2$DateTime <- as.POSIXct(paste(hpc2$Date, hpc2$Time), format="%e/%m/%Y %T")
with(hpc2, plot(hpc2$DateTime,hpc2$Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(hpc2, points(hpc2$DateTime,hpc2$Sub_metering_1, type="l", col="black"))
with(hpc2, points(hpc2$DateTime,hpc2$Sub_metering_2, col="red", type="l"))
with(hpc2, points(hpc2$DateTime,hpc2$Sub_metering_3, col="blue", type="l"))
legend("topright", pch = 95, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()