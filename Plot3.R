dataset=read.table(file.choose(),sep=";",header=TRUE)
dataset$Date=as.character(dataset$Date)
dataset$Date=as.Date(dataset$Date, format= "%d/%m/%Y")
subdata=subset(dataset,dataset$Date >= "2007-02-01" & dataset$Date <="2007-02-02")
subdata$Global_active_power=as.character(subdata$Global_active_power)
subdata$Global_active_power=as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power=as.character(subdata$Global_reactive_power)
subdata$Voltage=as.character(subdata$Voltage)



subdata1=subdata

subdata1=subset(subdata, subdata$Sub_metering_1 != "?" & subdata$Sub_metering_2 != "?" &  subdata$Sub_metering_3 != "?" )


subdata1$Sub_metering_1=as.character(subdata1$Sub_metering_1)
subdata1$Sub_metering_2=as.character(subdata1$Sub_metering_2)
subdata1$Sub_metering_3=as.character(subdata1$Sub_metering_3)
subdata1$Sub_metering_1=as.numeric(subdata1$Sub_metering_1)
subdata1$Sub_metering_2=as.numeric(subdata1$Sub_metering_2)
subdata1$Sub_metering_3=as.numeric(subdata1$Sub_metering_3)


png("plot3.png")
plot(subdata1$Sub_metering_1,type="n",xaxt="n",xlab="",ylab="Energy sub metering")
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
points(subdata1$Sub_metering_1,type="l")
points(subdata1$Sub_metering_2,type="l",col="red")
points(subdata1$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()