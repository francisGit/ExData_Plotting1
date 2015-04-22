library(sqldf)

data <- read.csv.sql("./household_power_consumption.txt", sep=";",
                     sql='select * from file where "Date" == "1/2/2007" 
                     OR "Date" == "2/2/2007"')

png("plot1.png")
hist(data[,3], col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
