# Download and unzip data set
zipUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipUrl, dest="./EDA_Project1/HPC.zip",method="auto")
hh_data <- unzip("./EDA_project1/HPC.zip")

#Subset Data Set and Reformat Date
data_subset <- hh_data[hh_data$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(dt$Global_active_power)

#Plot 3
sm1 <- as.numeric(subhh_data$Sub_metering_1)
sm2 <- as.numeric(subhh_data$Sub_metering_2)
sm3 <- as.numeric(subhh_data$Sub_metering_3)
vlt <- as.numeric(subhh_data$Voltage)
grp <- as.numeric(subhh_data$Global_reactive_power)
par(mfrow = c(2,2))
plot(dt, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2 )

plot(dt,vlt, type="l", ylab="Voltage",xlab="datetime")


plot(dt, sm1,type='l', col='black', ylab="Energy sub metering", xlab="")
lines(dt,sm2, type='l', col="red")
lines(dt, sm3, type='l', col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lwd = 2, lty=1, cex=0.2)

plot(dt, grp, type="l", xlab="datetime", ylab="Global_reactive_power")

#File Save
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()
