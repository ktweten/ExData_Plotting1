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

png('plot2.png')
with(power_data, plot(Global_active_power, type = "l", xaxt = 'n',
                      ylab = "Global active power (kilowatts)", xlab = ""))
axis(1, at = seq(from = 0, to = nrow(power_data), length.out = 3),
     labels = c("Thu", "Fri", "Sat"))
dev.off()