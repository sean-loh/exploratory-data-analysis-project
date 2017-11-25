source('common.R')

# Download and unzip data file if it's not already here
dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- 'household_power_consumption.zip'
dataFile <- 'household_power_consumption.txt'
initZippedData(dataUrl, zipFile, dataFile)

gapData <- read.table(dataFile, sep=";", header=TRUE, na.strings="?",
    colClasses=c('character', 'character', 'numeric', rep(NULL, 6)))

# Subset by dates
gapData$Date <- as.Date(gapData[['Date']], "%d/%m/%Y")
gapData <- subsetByDates(gapData, as.Date('2007-02-01'), as.Date('2007-02-02'))

# Make histogram
hist(gapData$Global_active_power, col='red',
    main="Global Active Power",
    xlab="Global Active Power (kilowatts)")
