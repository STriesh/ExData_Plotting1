# Course:   Exploratory Data Analysis - Joh Hopkins
# Project:  Project 1
# Plot:     plot2.png
# Author:   Saide
# Date:     Tuesday, June 02, 2015


# Get the current user's working directory
# download and unzip the raw data if you have not already done so into a temp dir


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

MyDataFrame<-household_power_consumption_df[ which (household_power_consumption_df$Date=="1/2/2007"| household_power_consumption_df$Date=="2/2/2007"),]


# Code for creating PNG



# create the png file to which the plot will be sent


png(filename = "plot2.png")

#Code to PLOT

# Plot2.png is a timeseries x,y plot to illustrating power usage over time
# y= Global Active Power (kilowats) vs. x= time series in minutes over two days 
# used the functions ********************************
# 
# plot1.png dimension are: 
#                         width = 480 pixels= 5 inches
#                         height= 480 pixels= 5 inches
# 

#plot2
#**************

plot(strptime(paste(MyDataFrame$Date,MyDataFrame$Time),"%d/%m/%Y %H:%M:%S"),MyDataFrame$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="",yaxt="n")

# anotate x,y timeseries plot
axis(2,at=seq(0,3000,by=1000),labels=c(0,2,4,6))

# set the graph to fit in 480X480 pixels
par(fin=c(5,5))
dev.off()
