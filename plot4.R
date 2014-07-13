setwd("~/BSS_Training/Coursera_R_WorkingDirectory/ExpAnalysisAssgn1")

data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

data <- transform(data, 
                  Date = as.Date(Date, "%e/%m/%Y"), 
                  Time = strptime(paste(Date, Time), "%e/%m/%Y %H:%M:%S") )

data <- data[(as.character(data$Date) == "2007-02-01" | 
                      as.character(data$Date) == "2007-02-02"), ]

png("plot4.png")

par(mfrow = c(2,2))

## plot number 1
plot(data$Time, data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)" )

## plot number 2
plot(data$Time, data$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage" )


## plot number 3
with(data, plot(Time, Sub_metering_1, 
                type = "l",
                xlab = "",
                ylab = "Energy sub metering" ) )

with(data, lines(Time, Sub_metering_2,
                 col = "RED"))

with(data, lines(Time, Sub_metering_3,
                 col = "BLUE"))

legend("topright", 
       legend = colnames(data)[7:9],
       lty = 1, 
       col = c("black", "blue", "red"),
       bty = "n" )


## plot number 4
with(data, plot(Time, Global_reactive_power, 
                type = "l",
                xlab = "datetime" ) )

dev.off()