plot1 <- function () {
  # this code read the file,generate histogram and save the plot in a png file
  # read the file
  rt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
  
  # subset the data for 2007-02-01 and 2007-02-02
  subrt <- subset(rt, as.Date(Date,format="%d/%m/%Y") %in% c(as.Date("01/02/2007",format="%d/%m/%Y"),as.Date("02/02/2007",format="%d/%m/%Y")))
  
  # create the histogram
  hist(subrt$Global_active_power, col='RED', main='Global Active Power', xlab = 'Global Active Power (killowatts)')
  
  # create plot1.png file
  dev.copy(png, file = "plot1.png")
  # turn off the png device
  dev.off()
  
}