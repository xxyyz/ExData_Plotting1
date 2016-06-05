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

png(file="plot2.png")
hpc2$DateTime <- as.POSIXct(paste(hpc2$Date, hpc2$Time), format="%e/%m/%Y %T")
plot(hpc2$Global_active_power~hpc2$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()