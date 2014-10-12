source("getData.R")

plot3 <- function() {
  data <- getData()
  png(filename = "plot3.png", width = 480, height = 480, units = "px")
  cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  plot(data$DateTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy Sub Metering")
  lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
  lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
  dev.off()
}

plot3()

