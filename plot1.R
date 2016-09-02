library(readr)
library(dplyr)
library(lubridate)

hpc <- read_delim(file = "data/household_power_consumption.txt",
                   delim = ";",
                   na = c("?"), 
                   col_types = "ccddddddd") %>%
  mutate(Date = dmy(Date),
         Time = hms(Time)) %>%
  filter(Date >= as_date("2007-02-01"), 
         Date <= as_date("2007-02-02"))

png("plot1.png", w = 480, h = 480)

hist(hpc$Global_active_power, 
     freq = TRUE, 
     col = "red",
     breaks = seq(0, ceiling(max(hpc$Global_active_power)), 0.5),
     xaxp = c(0, 6, 3),
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")

dev.off()

