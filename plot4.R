plot4 <- function(){
    myfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(myfile, destfile = "dataset.zip")
    unzip("dataset.zip")
    
    library(dplyr)
    mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = '?')
    mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
    mydata <- filter(mydata, Date >= as.Date("2007-2-1"), Date < as.Date("2007-2-3"))
    datetime <- as.POSIXct(paste(as.Date(mydata$Date), mydata$Time))
    par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
    with(mydata, {plot(Global_active_power~datetime, xlab="", ylab="Global Active Power", type = "l")
                    plot(Voltage~datetime, xlab="datetime", ylab="voltage", type = "l")
                    plot(Sub_metering_1 ~ datetime, type = "l", xlab = "", ylab = "Energy Sub Metering")
                    lines(Sub_metering_2 ~ datetime, col = "red")
                    lines(Sub_metering_3 ~ datetime, col = "blue")
                    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", cex = .5,
                           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                    plot(Global_reactive_power~datetime, type="l")})
    dev.copy(png, "plot4.png", width=480, height = 480)
    dev.off()
}