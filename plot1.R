# Course:   Exploratory Data Analysis - Joh Hopkins
# Project:  Project 1
# Plot:     plot1.png
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


png(filename = "plot1.png")

#Code to PLOT

# Plot1.png is a histogram of 
# x= Global Active Power (kilowats) vs. y= Frequency 
# used the functions hist(), axis(), and par() to annotate the histogram 
# 
# plot1.png dimension are: 
#                         width = 480 pixels= 5 inches
#                         height= 480 pixels= 5 inches
# 

#plot1
#histogram without axis labels

hist(as.numeric(MyDataFrame$Global_active_power),breaks=14, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",xaxt="n",yaxt="n")

# anotate histogram
axis(1,at=seq(0,3000,by=1000),labels=c(0,2,4,6))
axis(2,at=seq(0,1200,by=200),labels=c(0,200,400,600,800,1000,1200))

# set axis font to 80% to fit in numbers
# set the graph to fit in 480X480 pixels
par(cex.axis=0.80,fin=c(5,5))
dev.off()


