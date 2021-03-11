GlobalPower<- read.table("household_power_consumption.txt", skip=2, sep=";")
names(GlobalPower)<- c("Date", "Time","Global_active_power", "Global_reactive_power","Vlotage", "Global_intensity",
                       "sub_metering_1","sub_metering_2","sub_metering_3")
sub3<- subset(GlobalPower, GlobalPower$Date=="1/2/2007"|GlobalPower$Date=="2/2/2007")
#need to change to actual date and time format for the calander time format

sub3$Date<- as.Date(sub3$Date, format = "%d%m%Y")
sub3$Time<- strptime(sub3$Time, format = "%H:%M:%S")
sub3[1:1440,"Time"] <- format(sub3[1:1440,"Time"], "2007-02-01 %H:%M:%S")
sub3[1441:2880,"Time"] <- format(sub3[1441:2880,"Time"], "2007-02-02 %H:%M:%S")

#open png file
  png("plot3.png", width = 480, height = 480)

#creating the plot
  plot(sub3$Time, sub3$sub_metering_1, type = "n", xlab="", ylab = "Energy Sub Metering")
    with(sub3,lines(Time,as.numeric(as.character(sub_metering_1))))
    with(sub3,lines(Time,as.numeric(as.character(sub_metering_2)),col="red"))
    with(sub3,lines(Time,as.numeric(as.character(sub_metering_3)),col="blue"))
    legend("topright", lty=1, col= c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"))
    
#close plot input  
  dev.off()
  