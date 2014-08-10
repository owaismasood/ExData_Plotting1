if(!file.exists('household_power_consumption.txt')){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "datafile.zip")
  unzip("datafile.zip")
}

df <- read.table("household_power_consumption.txt",sep =';',header=TRUE,na.strings='?', colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

df <- df[df$Date %in% c('1/2/2007','2/2/2007') ,]  #Subsetting the dataset for the Specified Dates

df$Date <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S") #Converting the Date Column into POSIXlt object

x11(width=480, height=480)

hist(df$Global_active_power ,col = 'red',main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

dev.copy(png,'Plot1.png')   #Outputing the Result

dev.off()