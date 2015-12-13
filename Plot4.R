#Exploratory Data Analysis - Assignment 1 - Plot 4

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

#convert the relevant columns to numeric

enusg$Global_active_power=as.numeric(as.character(enusg$Global_active_power))

enusg$Sub_metering_1=as.numeric(as.character(enusg$Sub_metering_1))

enusg$Sub_metering_2=as.numeric(as.character(enusg$Sub_metering_2))

enusg$Sub_metering_3=as.numeric(as.character(enusg$Sub_metering_3))

enusg$Voltage=as.numeric(as.character(enusg$Voltage))

enusg$Global_reactive_power=as.numeric(as.character(enusg$Global_reactive_power))

library(datasets)

#set the size of the frame that contains the 4 plots

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(1, 1, 2, 1))

#---plot 1 top left--- Global Active Power

#create an empty plot

plot(enusg$newdate ,enusg$Global_active_power,type="n",ylab="Global Active Power",xlab="",cex.axis=0.8,cex.lab=0.6)

#add the line for the Global_active_power timeserie to the plot

lines(enusg$newdate ,enusg$Global_active_power)

#---plot 2 top right--- Voltage

#create an empty plot

plot(enusg$newdate ,enusg$Voltage,type="n",ylab="Voltage",xlab="datetime",cex.axis=0.8,cex.lab=0.7)

#add the line for the Voltage timeserie to the plot

lines(enusg$newdate ,enusg$Voltage)

#---plot 3 bottom left --- Sub Metering

#create an empty plot

plot(enusg$newdate ,enusg$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",cex.axis=0.8,cex.lab=0.7)

#add the lines for the 3 sub metering timeseries to the plot

lines(enusg$newdate ,enusg$Sub_metering_1)
lines(enusg$newdate ,enusg$Sub_metering_2,col="red")
lines(enusg$newdate ,enusg$Sub_metering_3,col="blue")

#add legend

legend("topright", lty = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7,y.intersp=0.5,bty="n")

#---plot 4 bottom right--- Global_Reactive_Power

#create an empty plot

plot(enusg$newdate ,enusg$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime",cex.axis=0.8,cex.lab=0.7)

#add the line for the Global_active_power timeserie to the plot

lines(enusg$newdate ,enusg$Global_reactive_power)

# generate a png file of the plot

dev.copy(png, file="plot4.png")

dev.off()
