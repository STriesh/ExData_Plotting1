# Course:   Exploratory Data Analysis - Joh Hopkins
# Project:  Project 1
# Plot:     plot4.png
# Author:   Saide
# Date:     Tuesday, June 02, 2015


# Get the current user's working directory
# download and unzip the raw data if you have not already done so into a temp dir
library(ggplot2)

current_working_dir<-getwd()
current_working_dir
data_url<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
data_url

if(file.exists("./temp/household_power_consumption.txt")){
  #file.info("./temp/household_power_consumption.txt")
} else {
  dir.create(file.path(current_working_dir, "temp"))
  setwd(file.path(current_working_dir, "temp"))
  download.file(url=data_url, destfile="Household_Power_Consuption.zip")
  household_power_consumption_df <- read.table(unzip("Household_Power_Consuption.zip", overwrite = FALSE), header=T, sep=";", quote="\"" )
  setwd(current_working_dir)
  getwd()
  
}


# select the subset of the data that is of interest
# all rows with dates: Feb 1, 2007 - Feb 2, 2007

MyDataFrame<-household_power_consumption_df[ which (household_power_consumption_df$Date=="1/2/2007"| household_power_consumption_df$Date=="2/2/2007" ),]


# Code for creating PNG
# create the png file to which the plot will be sent
png(filename = "plot4.png")

#Code to PLOT

# plot4.png is a multi plot of 4 graphs
# x= daytime over two days
#  
# plot4.png dimension are: 
#                         width = 480 pixels= 5 inches
#                         height= 480 pixels= 5 inches
# 

#plot4
#**************

x<-strptime(paste(MyDataFrame$Date,MyDataFrame$Time),"%d/%m/%Y %H:%M:%S")

# create 2 row X 2 column = 4 total plots 
par(mar=c(4,4,2,2))
par(mfrow=c(2,2))

plot(x,MyDataFrame$Global_active_power,type="l", ylab = "Global Active Power",xlab="",yaxt = "n")
axis(2,at=seq(0,3000,by=1000),labels=c(0,2,4,6))

plot(x,MyDataFrame$Voltage,type="l", ylab = "Voltage",xlab="datetime",yaxt="n")
axis(2,at=seq(800,2200,by=400),labels=c(234,238,242,246))


plot(x,as.double(MyDataFrame$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="",col="dark grey",ylim=c(0,max(as.double(MyDataFrame$Sub_metering_1))),yaxt = "n")
lines(x,as.double(MyDataFrame$Sub_metering_2),col="red")
lines(x,as.double(MyDataFrame$Sub_metering_3),col="blue")

axis(2, at=seq(0,30,by=10), labels=c(0,10,20,30))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2" ,"Sub_metering_3"), lty = 1, col=c("dark grey","red","blue"),cex=0.5)
axis(2, at=seq(0,30,by=10), labels=c(0,10,20,30))

plot(x,MyDataFrame$Global_reactive_power,type="l", ylab = "Global_reactive_power",xlab="datetime",yaxt = "n")
axis(2,at=seq(0,200,by=40),labels=c(0.0,0.1,0.2,0.3,0.4,0.5))


# set the graph to fit in 480X480 pixels
par(fin=c(5,5))
dev.off()
