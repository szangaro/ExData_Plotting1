source("setup.R")

#Plot 2
png(filename = "plot2.png", width = def_width, height = def_height, units = def_units)
plot(mydata$DateTime, mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
