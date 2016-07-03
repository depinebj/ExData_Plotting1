##### 
### plot3.R 
### Created by depinebj on 7/3/2016 
###  
### This R script was created for the Coursera course Exploratory Data Analysis project 1
### 
##### 
 

## Load R Libraries

## Download and unzip file into local directory if it does not exist
if (!file.exists("tempzip.zip")) {

    ## download file
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
    localtempzip <- "tempzip.zip" 
    download.file(url,localtempzip,method="auto",mode="wb") 

    ## Unzip file -- One directory is extracted containing the needed data and attributes 
    unzip(localtempzip) 
}


## Read Power Consumption file 
consumption.file <- read.csv2("household_power_consumption.txt", na.strings = "?", header=TRUE, sep=";", dec=".") 

## Subset To Just The 2 Days Needed
consumption.file$Date <- as.Date(consumption.file$Date,"%d/%m/%Y", tz="")
consumption <- subset(consumption.file,consumption.file$Date=="2007-02-01"|consumption.file$Date=="2007-02-02")

## Create Date/Time variable from Date and Time and merge column into table
newDateTime <- as.POSIXct(paste(consumption$Date,consumption$Time, sep=" "),format="%Y-%m-%d %H:%M:%S",tz="")

## Plot 3
png(file="plot3.png", width=480, height=480, units="px", pointsize = 12)

plot(newDateTime,consumption$Sub_metering_1,type="l", xlab="",ylab = "Energy Sub metering")
lines(newDateTime,consumption$Sub_metering_2,col="red")
lines(newDateTime,consumption$Sub_metering_3,col="blue")
legend(x="topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"))

dev.off()

