source("setup.R")

png(filename = "plot3.png", width = def_width, height = def_height, units = def_units)
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(mydata$DateTime, mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mydata$DateTime, mydata$Sub_metering_2, type="l", col="red")
lines(mydata$DateTime, mydata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()