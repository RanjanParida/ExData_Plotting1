setwd("~/BSS_Training/Coursera_R_WorkingDirectory/ExpAnalysisAssgn1")

data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

data <- transform(data, 
                  Date = as.Date(Date, "%e/%m/%Y"), 
                  Time = strptime(paste(Date, Time), "%e/%m/%Y %H:%M:%S") )

data <- data[(as.character(data$Date) == "2007-02-01" | 
                      as.character(data$Date) == "2007-02-02"), ]

plot(data$Time, data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)" )

dev.copy(png, file = "plot2.png")

dev.off()