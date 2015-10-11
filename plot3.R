plot3 <- function() {
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
  plot(pc1$DateTime, pc1$Sub_metering_1, type = "l", ylab="Energy sub metering", xlab="")
  points(pc1$DateTime, pc1$Sub_metering_2, type = "l", col="red")
  points(pc1$DateTime, pc1$Sub_metering_3, type = "l", col="blue")
  legend("topright", lty=c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), adj=0.1, cex=0.8)
  
  # write to file
  dev.copy(png, file = "plot3.png", width=480, height=480)
  dev.off()
}