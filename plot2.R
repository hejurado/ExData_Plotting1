#load data in data.all
data.all <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#format date to Date
data.all$Date <- as.Date(data.all$Date, "%d/%m/%Y")


## Filter data set from Feb. 01, 2007 to Feb. 02, 2007 en data.sub
date.start= as.Date("2007-2-1") #date initial
date.end =as.Date("2007-2-2") ##date final

data.sub <- subset(data.all, Date >= date.start & Date <= date.end)

##Concatenate Date and Time in myStrDatetime
myStrDatetime <- paste(data.sub$Date, data.sub$Time)

##Convert to datetime
myDateTime <- strptime(myStrDatetime, "%Y-%m-%d %H:%M:%S")

#Add myDateTime column
data.sub <- cbind(myDateTime, data.sub)

##Plot in axis x, y  myDateTime , Global Active Power respectively
plot(data.sub$Global_active_power~data.sub$myDateTime,type="l", ylab="Global Active Power (kilowatts)", xlab="Day")

## Save file and close device
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
