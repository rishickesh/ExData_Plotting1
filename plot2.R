#Done using Online R studio by Rishickesh
library("data.table")

#Reads  data from file 
powerDT <- data.table::fread(input = "/cloud/project/data/household_power_consumption.txt"
                             , na.strings="?"
)

# To Prevent Scientific Notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

#Formatting the date
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = powerDT[, dateTime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power in (kilowatts)")

dev.off()