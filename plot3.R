library(sqldf)

data <- read.csv.sql("./household_power_consumption.txt", sep=";",
                     sql='select * from file where "Date" == "1/2/2007" 
                     OR "Date" == "2/2/2007"')

data$Date=strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Time<-NULL

png("plot3.png")
with(data, plot(Date, Sub_metering_1,type="n", xlab="", 
                ylab="Energy sub metering"))
with(data, points(Date, Sub_metering_1, col="black", type="l"))
with(data, points(Date, Sub_metering_2, col="red", type="l"))
with(data, points(Date, Sub_metering_3, col="blue", type="l"))
legend("topright", pch="-", col=c("black","red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
