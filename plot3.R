plot3 <- function () {
  # this code read the file,generate line and save the plot in a png file
  # read the file
  rt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
  
  # subset the data for 2007-02-01 and 2007-02-02
  subrt <- subset(rt, as.Date(Date,format="%d/%m/%Y") %in% c(as.Date("01/02/2007",format="%d/%m/%Y"),as.Date("02/02/2007",format="%d/%m/%Y")))
  
  # Yaxis with date and time
  yrange <- strptime(paste(subrt$Date, subrt$Time), "%d/%m/%Y %H:%M:%S")
  
  #plot line graph and add line for all Submetering
  plot(yrange, subrt$Sub_metering_1, type="l",  ylab='Energy Submetering', xlab="") 
  lines(yrange,subrt$Sub_metering_2,col="red")
  lines(yrange,subrt$Sub_metering_3,col="blue")
  legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), cex=0.8, col=c('black','red','blue'), lwd=2)
  
  # create plot1.png file
  dev.copy(png, file = "plot3.png")
  
  # turn off the png device
  dev.off()
  
}