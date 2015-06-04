# Course:   Exploratory Data Analysis - Joh Hopkins
# Project:  Project 1
# Plot:     plot3.png
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


png(filename = "plot3.png")

#Code to PLOT

# Plot3.png is a multi-series plot
# y= Energy sub metering vs. x= three time series over two days
# {su_metering_1,sub_metering_2, sub_metering3}
# 
# used the functions ********************************
# 
# plot3.png dimension are: 
#                         width = 480 pixels= 5 inches
#                         height= 480 pixels= 5 inches
# 

#plot3
#**************

x<-strptime(paste(MyDataFrame$Date,MyDataFrame$Time),"%d/%m/%Y %H:%M:%S")



plot(x,as.double(MyDataFrame$Sub_metering_1),type="l",ylab="Energy sub metering",xlab="",col="dark grey",ylim=c(0,max(as.double(MyDataFrame$Sub_metering_1))),yaxt = "n")
lines(x,as.double(MyDataFrame$Sub_metering_2),col="red")
lines(x,as.double(MyDataFrame$Sub_metering_3),col="blue")

axis(2, at=seq(0,30,by=10), labels=c(0,10,20,30))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2" ,"Sub_metering_3"), lty = 1, col=c("dark grey","red","blue"))


# anotate x,y timeseries plot
axis(2, at=seq(0,30,by=10), labels=c(0,10,20,30))

# set the graph to fit in 480X480 pixels
par(fin=c(5,5))
dev.off()
