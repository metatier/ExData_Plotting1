read_file <- function() {
  # check if file exist and download if not
  if (!file.exists("pc.zip")) {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url, destfile="pc.zip", method="curl")
    dateDownloaded <- date()
    dateDownloaded
  }
  
  # unzip if not already done
  if (!file.exists("household_power_consumption.txt")) {
    unzip("pc.zip")
  }
}
