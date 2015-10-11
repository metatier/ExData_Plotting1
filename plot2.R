plot2 <- function() {
  # download file and record date if not already there
  source("read_file.R")
  read_file()
  
  # check if subset file has been created and create if not
  source("define_subset.R")
  define_subset()
  
  # read in subset file
  pc1 <- read.csv("pc1.csv", stringsAsFactors=FALSE)
  
  # convert date and time
  pc1$DateTime <- strptime(pc1$DateTime, "%Y-%m-%d %H:%M:%S")
  
  # create plot
  plot(pc1$DateTime, pc1$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab="")
  
  # write to file
  dev.copy(png, file = "plot2.png", width=480, height=480)
  dev.off()
}