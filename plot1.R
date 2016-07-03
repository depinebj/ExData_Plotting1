##### 
### plot1.R 
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

## Plot 1
png(file="plot1.png", width=480, height=480, units="px", pointsize = 12)
hist(consumption$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",freq=TRUE,col="Red")
dev.off()

