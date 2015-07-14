datos <- read.table(file = "/Users/utpl/Documents/exploratoryDataAnalysis/household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
#datos$Date <- as.Date(as.character(datos$Date), "%d/%m/%y")
datos$Date <- as.POSIXct(datos$Date, format='%d/%m/%Y');
date1 <- dmy("01/02/2007")
date2 <- dmy("02-02-2007")
datosReq <- subset(datos, Date >= date1 & Date <= date2)
names(datos)
attach(datos)
datosReq <- transform(datosReq, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
datosReq$Sub_metering_1 <- as.numeric(as.character(datosReq$Sub_metering_1))
datosReq$Sub_metering_2 <- as.numeric(as.character(datosReq$Sub_metering_2))
datosReq$Sub_metering_3 <- as.numeric(as.character(datosReq$Sub_metering_3))
plot1 <- function() {
  plot(datosReq$timestamp,datosReq$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png guardado", getwd())
}
plot1()
