source("setup.R")

plot1 <- "plot1.png"
png(filename = plot1, width = def_width, height = def_height, units = def_units)
hist(mydata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()
