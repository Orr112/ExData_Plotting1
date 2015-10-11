# Download and unzip data set
zipUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipUrl, dest="./EDA_Project1/HPC.zip",method="auto")
hh_data <- unzip("./EDA_project1/HPC.zip")

#Subset Data Set and Reformat Date
data_subset <- hh_data[hh_data$Date %in% c("1/2/2007","2/2/2007") ,]
dt <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(dt$Global_active_power)

#Plot 2
dt <- strptime(paste(subhh_data$Date, subhh_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(dt,gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")


# File Save
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()
