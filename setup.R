def_width <- 480
def_height <- 480
def_units <- "px"

newfile <- paste(getwd(),"/filtereddata.csv", sep="")

if(file.exists(newfile)) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        workdir <- getwd()
        temp <- tempfile()
        download.file(url, temp)
        filename = unzip(temp, list=TRUE)$Name[1]
        unzip(temp, files=filename, exdir=workdir, overwrite=TRUE)
        mydata <- read.table(filename, header=T, 
                   sep=";", na.strings="?", 
                   colClasses=c("character","character","numeric",
                                "numeric","numeric","numeric",
                                "numeric","numeric","numeric"))
        mydata <- mydata[(mydata$Date == "1/2/2007") | (mydata$Date == "2/2/2007"),]
        mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
        write.csv(mydata, newfile)
        unlink(temp)
        #unlink(paste(getwd(),"/",filename, sep=""))
} 
else {
        mydata <- read.csv(newfile)
}
mydata

#Plot 1
plot1 <- "plot1.png"
png(filename = plot1, width = def_width, height = def_height, units = def_units)
hist(mydata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()

#Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(mydata$DateTime, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


#Plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(mydata$DateTime, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()

#Plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par (mfrow = c(2,2), mar = c(4,4,2,1))
with(mydata, {
        plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
        plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
        
        cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
        
        plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
})    
dev.off()

