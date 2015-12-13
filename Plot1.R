#Exploratory Data Anlysis - Assignment 1 - Plot 1

#set working directory for raw data upload "household_power_consumption.txt"

setwd("./data")

#read in the raw data file and subset to the Date column equals to 1st and 2nd of February 2007

enusgraw<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
enusg<-subset(enusgraw,enusgraw$Date=="1/2/2007" | enusgraw$Date=="2/2/2007")

#back to original working directory

setwd("../")

#convert the Date and Time variables to Date/Time classes in R, adde a new column to the data frame
#called newdate with Date/Time combined

enusg$Date <- as.Date(enusg$Date , "%d/%m/%Y")

enusg$newdate <- strptime(paste(enusg$Date, enusg$Time), format="%Y-%m-%d %H:%M:%S")

#create the histogram for the Global Active Power Column, first convert Global Active Power to numeric

enusg$Global_active_power=as.numeric(as.character(enusg$Global_active_power))

library(datasets)

hist(enusg$Global_active_power, col = "red",breaks=13, main="Global Active Power",xlab="Global Active Power (kilowatts)",cex.axis=0.58,cex.lab=0.75, cex.main=0.8)

# create a png file of the plot

dev.copy(png, file="plot1.png")

dev.off()
