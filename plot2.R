source('common.R')

# Setup png plot device
setPlotDevice("plot2.png")

# Download and unzip data file if it's not already here
initZippedData(DATA_URL, ZIP_FILE, DATA_FILE)

gapData <- read.table(DATA_FILE, sep=";", header=TRUE, na.strings="?",
    colClasses=c('character', 'character', 'numeric', rep('NULL', 6)))

# Subset by dates
gapData <- subsetByDates(gapData, START_DATE, END_DATE)

# Create a Date/Time column
gapData$datetime <- as.POSIXct(paste(gapData$Date, gapData$Time), tz="UCT")

# Make plot
plot(gapData$datetime, gapData$Global_active_power,
    type='l', xlab="", ylab="Global Active Power (kilowatts)")

# Close png plot device
dev.off()
