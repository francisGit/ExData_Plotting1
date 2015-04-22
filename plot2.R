library(sqldf)

data <- read.csv.sql("./household_power_consumption.txt", sep=";",
                     sql='select * from file where "Date" == "1/2/2007" 
                     OR "Date" == "2/2/2007"')

data$Date=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Time<-NULL

png("plot2.png")
with(data, plot(Date, Global_active_power, 
                xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.off()
