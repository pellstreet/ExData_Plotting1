#Exploratory Data Analysis - Assignment 1 - Plot 2

#set working directory for raw data upload "household_power_consumption.txt"

setwd("./data")

#read in the raw data file and subset the data frame to the Date column equals to 1st and 2nd of February 2007

enusgraw<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
enusg<-subset(enusgraw,enusgraw$Date=="1/2/2007" | enusgraw$Date=="2/2/2007")

#back to original working directory

setwd("../")

#convert the Date and Time variables to Date/Time classes in R, add a new column to the data frame
#called newdate with Date/Time combined

enusg$Date <- as.Date(enusg$Date , "%d/%m/%Y")

enusg$newdate <- strptime(paste(enusg$Date, enusg$Time), format="%Y-%m-%d %H:%M:%S")

#convert the Global Active Power column to numeric

enusg$Global_active_power=as.numeric(as.character(enusg$Global_active_power))

library(datasets)

#create an empty plot

plot(enusg$newdate ,enusg$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="",cex.axis=0.7,cex.lab=0.7)

#add the line for the Global_active_power timeserie to the plot

lines(enusg$newdate ,enusg$Global_active_power)

# create a png file of the plot

dev.copy(png, file="plot2.png")

dev.off()
