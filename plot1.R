# Download and extract the zipped file unless the data has already been loaded
if (!exists("consumption")) {
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
  
  
  consumption <- read.table(unzip(temp, "household_power_consumption.txt"),
                            header = TRUE, sep = ";", na.strings = "?",
                            colClasses = c("character", "character",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric"))
  
  unlink(temp)
}

power_data <- subset(consumption, Date %in% c("1/2/2007", "2/2/2007"))

png('plot1.png')
with(power_data, hist(Global_active_power,
                      col = c("red"),
                      xlab = "Global Active Power (kilowatts)",
                      main = "Global Active Power"))
dev.off()

dev.off()