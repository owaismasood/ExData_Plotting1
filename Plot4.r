if(!file.exists('household_power_consumption.txt')){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "datafile.zip")
  unzip("datafile.zip")
}


df <- read.table("household_power_consumption.txt",sep =';',header=TRUE,na.strings='?', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

df <- df[df$Date %in% c('1/2/2007','2/2/2007') ,]  #Subsetting the dataset for the Specified Dates

df$Date <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S") #Converting the Date Column into POSIXlt object

x11(width=480, height=480)
par(mfcol = c(2,2))

plot(df$Date,df$Global_active_power, type = 'n' , xlab ='', ylab = 'Global Active Power (kilowatts)')
lines(df$Date,df$Global_active_power)


plot(df$Date,df$Sub_metering_1, type = 'n' , xlab ='' , ylab ='')
lines(df$Date,df$Sub_metering_1)
lines(df$Date,df$Sub_metering_2 , col = 'red')
lines(df$Date,df$Sub_metering_3, col = 'blue')
title(ylab = 'Energy sub metering')
legend('topright', text.font = 6,legend = c('sub_metering_1','sub_metering_2','sub_metering_3'), col=c("black","red",'blue'), lwd=1, lty=c(1,1,1))

plot(df$Date,df$Voltage, type = 'n' , xlab ='datetime', ylab = 'Voltage')
lines(df$Date,df$Voltage)

plot(df$Date,df$Global_reactive_power, type = 'n' , xlab ='datetime', ylab = 'Global_reactive_power')
lines(df$Date,df$Global_reactive_power)

dev.copy(png,'Plot4.png')   #Outputing the Result

dev.off()

