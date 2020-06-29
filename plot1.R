#load data in data.all
data.all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#format date to Date
data.all$Date <- as.Date(data.all$Date, "%d/%m/%Y")

## I get a subset from Feb. 1, 2007 to Feb. 2, 2007
date.start= as.Date("2007-2-1") #date initial
date.end =as.Date("2007-2-2") ##date final
data.sub <- subset(data.all,Date >= date.start & Date <= date.end)
## generate a histogram
hist(data.sub$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
## Save file png and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
