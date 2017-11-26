source('common.R')

# Download and unzip data file if it's not already here
initZippedData(DATA_URL, ZIP_FILE, DATA_FILE)

gapData <- read.table(DATA_FILE, sep=";", header=TRUE, na.strings="?",
    colClasses=c('character', 'character', rep('numeric', 7)))

# Subset by dates
gapData <- subsetByDates(gapData, START_DATE, END_DATE)

# Create a Date/Time column
gapData$datetime <- as.POSIXct(paste(gapData$Date, gapData$Time), tz="UCT")

# Setup 2 x 2 plot grid
par(mfrow=c(2, 2))

# Make plots
# Top-left
plot(gapData$datetime, gapData$Global_active_power, type='l',
    xlab="", ylab="Global Active Power")

# Top-right
plot(gapData$datetime, gapData$Voltage, type='l',
    xlab="datetime", ylab="Voltage")

# Bottom-left
# Sub metering column names
smCols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(gapData$datetime, gapData$Sub_metering_1, type='l',
    xlab="", ylab='Energy sub metering')
lines(gapData$datetime, gapData$Sub_metering_2, col='red')
lines(gapData$datetime, gapData$Sub_metering_3, col='blue')
legend('topright', legend=smCols, bty='n',
    lty=c(1,1), col=c("black", "red", "blue"))

# Bottom-right
plot(gapData$datetime, gapData$Global_reactive_power, type='l',
    xlab="datetime", ylab="Global_reactive_power")
