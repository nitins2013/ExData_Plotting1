dataset=read.table(file.choose(),sep=";",header=TRUE)
dataset$Date=as.character(dataset$Date)
dataset$Date=as.Date(dataset$Date, format= "%d/%m/%Y")
subdata=subset(dataset,dataset$Date >= "2007-02-01" & dataset$Date <="2007-02-02")
subdata$Global_active_power=as.character(subdata$Global_active_power)
subdata$Global_active_power=as.numeric(subdata$Global_active_power)
subdata$Global_reactive_power=as.character(subdata$Global_reactive_power)
subdata$Voltage=as.character(subdata$Voltage)



png("plot1.png") 

hist(subdata$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)", main="Global Active Power")

dev.off()