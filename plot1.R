plot1 <- function(){
    myfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(myfile, destfile = "dataset.zip")
    unzip("dataset.zip")
    
    library(dplyr)
    mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, na.strings = '?')
    mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
    mydata <- filter(mydata, Date >= as.Date("2007-2-1"), Date < as.Date("2007-2-3"))
    hist(mydata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
    dev.copy(png, "plot1.png", width=480, height = 480)
    dev.off()
}
