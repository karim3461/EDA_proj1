# set working directory
setwd("G:/R/Workspace/ExploratoryDataAnalysis")
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

# make plot 1
png(file = "plot1.png", width = 480, height = 480)
with(power, hist(Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
