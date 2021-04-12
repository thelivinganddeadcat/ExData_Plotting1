# data are loaded into the working directory
# set the working directory
setwd("~/angelodata/project_R/datasciencecoursera/ExData_Plotting1")

# read all data into the dataframe All_data
# NA are stored as "?", so convert them while importing
All_data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

#convert to date the data in the Date field
All_data$Date<-as.Date(All_data$Date,format="%d/%m/%Y")

#subset the data to have only data for the 2 dates 2007-02-01 and 2007-02-02
data <- subset(All_data,All_data$Date=="2007-2-1" | All_data$Date == "2007-2-2")

#Plot into png
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,breaks=12,col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()