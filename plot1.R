if (!file.exists("household_power_consumption.zip"))
    {download.file(
        "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
        "household_power_consumption.zip")}

if (!file.exists("household_power_consumption.txt"))
    {unzip("household_power_consumption.zip")}

if (!exists("hpc"))
    {hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
    hpc2 <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]}

png(file="plot1.png")
hist(hpc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()