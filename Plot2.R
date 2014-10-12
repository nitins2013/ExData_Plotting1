dataset=read.table(file.choose(),sep=";",header=TRUE)
dataset$Date=as.character(dataset$Date)
dataset$Date=as.Date(dataset$Date, format= "%d/%m/%Y")
subdata=subset(dataset,dataset$Date >= "2007-02-01" & dataset$Date <="2007-02-02")
subdata$Global_active_power=as.character(subdata$Global_active_power)
subdata$Global_active_power=as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power=as.character(subdata$Global_reactive_power)
subdata$Voltage=as.character(subdata$Voltage)




png("plot2.png")

plot(subdata$Global_active_power, type="l",xaxt="n",xlab="",ylab="Global Active Power (Kilowatts)")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

dev.off()