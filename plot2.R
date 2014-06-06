plot2 <- function () {
  # this code read the file,generate histogram and save the plot in a png file
  # read the file
    rt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
  
  # subset the data for 2007-02-01 and 2007-02-02
    subrt <- subset(rt, as.Date(Date,format="%d/%m/%Y") %in% c(as.Date("01/02/2007",format="%d/%m/%Y"),as.Date("02/02/2007",format="%d/%m/%Y")))
  
  # Yaxis with date and time
    yrange <- strptime(paste(subrt$Date, subrt$Time), "%d/%m/%Y %H:%M:%S")
  
  # Xaxis Global active power
    xrange <- subrt$Global_active_power
  
  # plot line graph
    plot(yrange, xrange, type="l",  ylab='Global Active Power (killowatts)') 
  
  # create plot1.png file
    dev.copy(png, file = "plot2.png")
  # turn off the png device
    dev.off()
  
}