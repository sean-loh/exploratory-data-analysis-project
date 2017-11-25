source('common.R')

# Sub metering column names
smCols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Download and unzip data file if it's not already here
initZippedData(DATA_URL, ZIP_FILE, DATA_FILE)

gapData <- read.table(DATA_FILE, sep=";", header=TRUE, na.strings="?",
    colClasses=c('character', 'character', rep('NULL', 4), rep('numeric', 3)))

# Subset by dates
gapData <- subsetByDates(gapData, START_DATE, END_DATE)

# Create a Date/Time column
gapData$datetime <- as.POSIXct(paste(gapData$Date, gapData$Time), tz="UCT")

# Create empty plot
plot(gapData$datetime, gapData$Sub_metering_1,
    type='l',
    xlab="", ylab='Energy sub metering')
lines(gapData$datetime, gapData$Sub_metering_2, col='red')
lines(gapData$datetime, gapData$Sub_metering_3, col='blue')
legend('topright', legend=smCols,
    lty=c(1,1), col=c("black", "red", "blue"))
