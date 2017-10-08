plot2 <- function(){
    myfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(myfile, destfile = "dataset.zip")
    unzip("dataset.zip")
    
    library(dplyr)
    mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = '?')
    mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
    mydata <- filter(mydata, Date >= as.Date("2007-2-1"), Date < as.Date("2007-2-3"))
    datetime <- as.POSIXct(paste(as.Date(mydata$Date), mydata$Time))
    with(mydata, {plot(Global_active_power~ datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")})
    dev.copy(png, "plot2.png", width=480, height = 480)
    dev.off()
}