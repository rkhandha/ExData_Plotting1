plot4 <- function () {
  # this code read the file,generate histogram and save the plot in a png file
  # read the file
    rt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
  
  # subset the data for 2007-02-01 and 2007-02-02
    subrt <- subset(rt, as.Date(Date,format="%d/%m/%Y") %in% c(as.Date("01/02/2007",format="%d/%m/%Y"),as.Date("02/02/2007",format="%d/%m/%Y")))
  
  # Yaxis with date and time
    yrange <- strptime(paste(subrt$Date, subrt$Time), "%d/%m/%Y %H:%M:%S")
  
  # Xaxis variables
    xvoltage <- subrt$Voltage
    xglobalreactivepower <- subrt$Global_reactive_power
    xglobalactivepower <- subrt$Global_active_power
  
    par(mfrow = c(2,2))
  #set graph alignments on the page
    par(mar = c(2,3,2,1))
  # set lable gap
    par(mgp = c(1.5,.5,0))
  # plot line graph Global_active_power
    plot(yrange, xglobalactivepower, type="l",  ylab='Global Active Power',xlab="", cex.lab= 0.8) 
  
  # plot line graph for Voltage
    plot(yrange, xvoltage, type="l",  ylab='Voltage', xlab='datetime',cex.lab= 0.8) 
  
  # plot line graph for Submetering variables 
    plot(yrange, subrt$Sub_metering_1, type="l",  ylab='Energy Submetering', xlab="", cex.lab= 0.8) 
    lines(yrange,subrt$Sub_metering_2,col="red")
    lines(yrange,subrt$Sub_metering_3,col="blue")
    legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), cex=0.6, col=c('black','red','blue'), lwd=2,bty="n")
  
    plot(yrange, xglobalreactivepower, type="l",  ylab='Global_reactive_power', xlab='datetime',cex.lab= 0.8) 
    
  # create plot1.png file
    dev.copy(png, file = "plot4.png")
  # turn off the png device
    dev.off()
  
}