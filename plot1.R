source('common.R')

# Setup png plot device
setPlotDevice("plot1.png")

# Download and unzip data file if it's not already here
initZippedData(DATA_URL, ZIP_FILE, DATA_FILE)

gapData <- read.table(DATA_FILE, sep=";", header=TRUE, na.strings="?",
    colClasses=c('character', 'character', 'numeric', rep('NULL', 6)))

# Subset by dates
gapData <- subsetByDates(gapData, START_DATE, END_DATE)

# Make histogram
hist(gapData$Global_active_power, col='red',
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)")

# Close png plot device
dev.off()
