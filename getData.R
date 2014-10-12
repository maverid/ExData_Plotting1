getData <- function(){ 

  #Download file if it does not exits and unzip it
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zipFile <- "./data/household_power_comsumption.zip"
  if(!file.exists(zipFile)) download.file(url, destfile=zipFile, method="curl")
  txtFile <- unz(zipFile, "household_power_consumption.txt")
  
  
  #Read the data file
  initData <- read.table(txtFile, sep=";", header=TRUE, nrows=5)
  #close(txtFile)
  classes <- sapply(initData, class)
  txtFile <- unz(zipFile, "household_power_consumption.txt")
  data <- read.table(txtFile, header=TRUE, sep=";", colClasses=classes, na.strings="?")
  #close(txtFile)
  
  
  #Only needed data from days: 2007-02-01 and 2007-02-02
  data <- data[(data$Date=='1/2/2007') | (data$Date=='2/2/2007'), ]
  data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data

}