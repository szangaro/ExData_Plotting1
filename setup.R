def_width <- 480
def_height <- 480
def_units <- "px"


if(!file.exists(newfile)) {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"        
        workdir <- getwd()
        temp <- tempfile()
        download.file(url, temp)
        filename = unzip(temp, list=TRUE)$Name[1]
        unzip(temp, files=filename, exdir=workdir, overwrite=TRUE)
        mydata <- read.table(filename, 
                             header=TRUE, 
                             sep=";",
                             na.strings="?", 
                             colClasses=c(rep("character",2),
                                          rep("numeric",7)))
        
        mydata <- mydata[(mydata$Date == "1/2/2007") | (mydata$Date == "2/2/2007"),]
        mydata$DateTime <- strptime(paste(mydata$Date, mydata$Time), "%d/%m/%Y %H:%M:%S")
        newfile <- paste(getwd(),"/filtereddata.csv", sep="")
        write.csv(mydata, newfile)
        unlink(temp)
} else {
        mydata <- read.csv(newfile)
}
mydata