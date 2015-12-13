#Exploratory Data Analysis - Assignment 1 - Plot 3

#set working directory for raw data upload "household_power_consumption.txt"

setwd("./data")

#read in the raw data file and subset the data frame to Date column equals to 1st and 2nd of February 2007

enusgraw<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
enusg<-subset(enusgraw,enusgraw$Date=="1/2/2007" | enusgraw$Date=="2/2/2007")

#back to original working directory

setwd("../")

#convert the Date and Time variables to Date/Time classes in R, add a new column to the data frame
#called newdate with Date/Time combined

enusg$Date <- as.Date(enusg$Date , "%d/%m/%Y")

enusg$newdate <- strptime(paste(enusg$Date, enusg$Time), format="%Y-%m-%d %H:%M:%S")

#convert the Sub metering columns to numeric

enusg$Sub_metering_1=as.numeric(as.character(enusg$Sub_metering_1))

enusg$Sub_metering_2=as.numeric(as.character(enusg$Sub_metering_2))

enusg$Sub_metering_3=as.numeric(as.character(enusg$Sub_metering_3))

library(datasets)

#create an empty plot

plot(enusg$newdate ,enusg$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",cex.axis=0.7,cex.lab=0.7)

#add the lines for the 3 sub metering timeseries to the plot

lines(enusg$newdate ,enusg$Sub_metering_1)
lines(enusg$newdate ,enusg$Sub_metering_2,col="red")
lines(enusg$newdate ,enusg$Sub_metering_3,col="blue")

#add legend

legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.6,y.intersp=0.5)

# generate a png file of the plot

dev.copy(png, file="plot3.png")

dev.off()
