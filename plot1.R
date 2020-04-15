#Done using Online R studio by Rishickesh

library("data.table")

powerDT <- data.table::fread(input = "/cloud/project/data/household_power_consumption.txt"
                             , na.strings="?"
)

powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Get Dates for 2007-02-01 and 2007-02-02 as we will be using only that
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power in (kilowatts)", ylab="Frequency", col="Red")

dev.off()
