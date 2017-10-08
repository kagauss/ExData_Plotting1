plot3 <- function(){
    myfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(myfile, destfile = "dataset.zip")
    unzip("dataset.zip")
    
    library(dplyr)
    mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = '?')
    mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
    mydata <- filter(mydata, Date >= as.Date("2007-2-1"), Date < as.Date("2007-2-3"))
    datetime <- as.POSIXct(paste(as.Date(mydata$Date), mydata$Time))
    with(mydata, {plot(Sub_metering_1 ~ datetime, type = "l", xlab = "", ylab = "Energy Sub Metering")
                    lines(Sub_metering_2 ~ datetime, col = "red")
                    lines(Sub_metering_3 ~ datetime, col = "blue")})
         legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.copy(png, "plot3.png", width=480, height = 480)
    dev.off()
}