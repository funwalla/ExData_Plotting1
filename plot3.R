library(readr)
library(dplyr)
library(lubridate)

hpc <- read_delim(file = "data/household_power_consumption.txt",
                   delim = ";",
                   na = c("?"), 
                   col_types = "ccddddddd") %>%
  mutate(DateTime = dmy_hms(paste(Date, Time)),
         Date = dmy(Date)) %>%
  filter(Date >= as_date("2007-02-01"), 
         Date <= as_date("2007-02-02"))

png("plot3.png", w = 480, h = 480)

plot(hpc$DateTime, hpc$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_2,
      col = 'red')
lines(hpc$DateTime, hpc$Sub_metering_3,
      col = 'blue')
legend(x = "topright",
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1))

dev.off()
