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

subsetByDates <- function(frame, start, end, dateCol='Date') {
    frame <- frame[
        frame[[dateCol]] >= as.Date(start) &
        frame[[dateCol]] <= as.Date(end),]
}
