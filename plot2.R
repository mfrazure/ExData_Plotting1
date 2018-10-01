library(readr)
library(tidyr)
library(dplyr)
power <- read_delim(".\\data\\household_power_consumption.txt", col_names = TRUE, delim = ";", col_types = "ccnnnnnnn")
datepower<- power %>% mutate(datestr = paste(Date,Time))
datepower$datestr<- strptime(datepower$datestr,"%d/%m/%Y %H:%M:%S")
subpower <- datepower[datepower$datestr >= "2007-02-01" & datepower$datestr < "2007-02-03", ]
subpower<- subpower[1:2880,]
with(subpower, plot(datestr,Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", main = ""))
dev.copy(png,"plot2.png",width=480, height = 480, units = "px")
dev.off()
