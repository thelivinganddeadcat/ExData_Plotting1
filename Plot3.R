# data are loaded into the working directory
# set the working directory
setwd("~/angelodata/project_R/datasciencecoursera/ExData_Plotting1")

# read all data into the dataframe All_data
# NA are stored as "?", so convert them while importing
All_data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

#convert to date the data in the Date and time field
All_data$Date<-as.Date(All_data$Date,format="%d/%m/%Y")

#subset the data to have only data for the 2 dates 2007-02-01 and 2007-02-02
data <- subset(All_data,All_data$Date=="2007-2-1" | All_data$Date == "2007-2-2")

#Convert Date and Time into a Date-time field after pasteing them together
data$Date_time<-strptime(paste(data$Date,data$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

png(file="plot3.png",width=480,height=480)
with(data,plot(Date_time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(data,lines(Date_time, Sub_metering_2, type="l", col="red"))
with(data,lines(Date_time, Sub_metering_3, type="l", col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2)
dev.off()



