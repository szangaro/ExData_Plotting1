source("setup.R")

png(filename = "plot4.png", width = def_width, height = def_height, units = def_units)
par (mfrow = c(2,2), mar = c(4,4,2,1))
with(mydata, {
        plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
        plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, lwd=1, col=c("black","blue","red"), 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               bty="n")
        plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
})    
dev.off()