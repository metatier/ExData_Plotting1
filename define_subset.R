define_subset <- function() {
  # write subset file if not already exists
  if (!file.exists("pc1.csv")) {
    pc <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, nrows=2100000, sep=";")
    pc$Date <- as.Date(pc$Date, "%d/%m/%Y")
    pc$DateTime <- strptime(pc$Time, "%A %T")
    pc1 <- pc[format.Date(pc$Date, "%Y")=="2007" & format.Date(pc$Date, "%m")=="02" & (format.Date(pc$Date, "%d")=="01" | format.Date(pc$Date, "%d")=="02"),]
    pc1$DateTime <- paste(pc1$Date, pc1$Time)
    write.csv(pc1, file = "pc1.csv", row.names=FALSE)
  }
}
