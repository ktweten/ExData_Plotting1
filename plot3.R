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

png('plot3.png')

with(power_data, plot(Sub_metering_1, type = "l", xaxt = 'n', xlab = "",
                      ylab = "Energy sub metering"))

with(power_data, lines(Sub_metering_2, type = "l", xaxt = 'n', ann = FALSE,
                       col = c("red")))

with(power_data, lines(Sub_metering_3, type = "l", xaxt = 'n', ann = FALSE,
                       col = c("blue")))

axis(1, at = seq(from = 0, to = nrow(power_data), length.out = 3),
     labels = c("Thu", "Fri", "Sat"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

dev.off()