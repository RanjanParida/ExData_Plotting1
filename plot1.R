setwd("~/BSS_Training/Coursera_R_WorkingDirectory/ExpAnalysisAssgn1")

data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

data <- transform(data, 
                  Date = as.Date(Date, "%e/%m/%Y"), 
                  Time = strptime(paste(Date, Time), "%e/%m/%Y %H:%M:%S") )

data <- data[(as.character(data$Date) == "2007-02-01" | 
                       as.character(data$Date) == "2007-02-02"), ]

hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "RED")

dev.copy(png, file = "plot1.png")

dev.off()