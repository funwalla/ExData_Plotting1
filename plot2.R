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

png("plot2.png", w = 480, h = 480)

plot(hpc$DateTime, hpc$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

