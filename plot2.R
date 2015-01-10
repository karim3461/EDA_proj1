# set working directory
setwd("G:/R/Workspace/ExploratoryDataAnalysis")   ### Has to be changed to your own working directory
if (!file.exists("Project1")) {
  dir.create("Project1")
}
setwd("./Project1")

# if raw data not present, download it and unzip it
if (!file.exists("household_power_consumption.txt")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = "./household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

# read data
power <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# subset to these dates: 2007-02-01 and 2007-02-02
power <- power[which(power$Date == '1/2/2007' | power$Date == '2/2/2007'), ]

# add new column with Date and Time in appropriate format
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, format = "%d/%m/%Y %H:%M:%S")

#set system to USA English (for weekday names)
Sys.setlocale("LC_TIME", "English")

# make plot 2
png(file = "plot2.png", width = 480, height = 480)
with(power, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()
