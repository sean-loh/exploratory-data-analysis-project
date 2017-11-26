DATA_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
ZIP_FILE <- 'household_power_consumption.zip'
DATA_FILE <- 'household_power_consumption.txt'
START_DATE <- as.Date('2007-02-01')
END_DATE <- as.Date('2007-02-02')

setPlotDevice <- function(name, height=480, width=480) {
    png(name, height=height, width=width)
}

initZippedData <- function(dataUrl, zipFile, extractTarget) {
    # If zip file is not here, download it
    if (!file.exists(zipFile)) {
        download.file(dataUrl, zipFile)
    }

    # Unzip file if it hasn't been unzipped already
    if (!file.exists(extractTarget)) {
        unzip(zipFile)
    }
}

subsetByDates <- function(frame, start, end,
                          dateCol='Date', dateFormat="%d/%m/%Y") {
    # If date col is not Date class, convert to Date
    if (!class(frame[[dateCol]]) == 'Date') {
        frame[[dateCol]] <- as.Date(frame[[dateCol]], dateFormat)
    }

    frame <- frame[
        frame[[dateCol]] >= as.Date(start) &
        frame[[dateCol]] <= as.Date(end),]
}
