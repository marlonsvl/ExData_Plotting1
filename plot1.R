library("datasets")
library("graphics")
library("lubridate")
datos <- read.table(file = "/Users/utpl/Documents/exploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
#datos$Date <- as.Date(as.character(datos$Date), "%d/%m/%y")
datos$Date <- as.POSIXct(datos$Date, format='%d/%m/%Y');
date1 <- dmy("01/02/2007")
date2 <- dmy("02-02-2007")
datosReq <- subset(datos, Date >= date1 & Date <= date2)
names(datos)
attach(datos)
hist(datosReq$Global_active_power, col = "red", plot = TRUE, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

