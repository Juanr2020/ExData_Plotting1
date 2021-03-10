GlobalPower<- read.table("household_power_consumption.txt", skip=2, sep=";")
names(GlobalPower)<- c("Date", "Time","Global_active_power", "Global_reactive_power","Vlotage", "Global_intensity",
                       "sub_metering_1","sub_metering_2","sub_metering_3")
View(GlobalPower)

subplot1<-subset(GlobalPower, GlobalPower$Date=="1/2/2007"|GlobalPower$Date=="2/2/2007")

##Creating the plot
    hist(as.numeric(as.character(subplot1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
    