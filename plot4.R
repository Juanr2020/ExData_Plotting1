GlobalPower<- read.table("household_power_consumption.txt", skip=2, sep=";")
names(GlobalPower)<- c("Date", "Time","Global_active_power", "Global_reactive_power","Vlotage", "Global_intensity",
                       "sub_metering_1","sub_metering_2","sub_metering_3")
sub4<- subset(GlobalPower, GlobalPower$Date=="1/2/2007"|GlobalPower$Date=="2/2/2007")
#need to change to actual date and time format for the calander time format

sub4$Date<- as.Date(sub4$Date, format = "%d%m%Y")
sub4$Time<- strptime(sub4$Time, format = "%H:%M:%S")
sub4[1:1440,"Time"] <- format(sub4[1:1440,"Time"], "2007-02-01 %H:%M:%S")
sub4[1441:2880,"Time"] <- format(sub4[1441:2880,"Time"], "2007-02-02 %H:%M:%S")

#open png file
  png("plot4.png", width = 480, height = 480)
#creating the plot with 4 plots
  par(mfrow=c(2,2))
  
  with(sub4,{
    plot(sub4$Time, as.numeric(as.character(sub4$Global_active_power)), type="l", xlab="", ylab="Global Active Power")
    plot(sub4$Time, as.numeric(as.character(sub4$Global_active_power)), type = "l", xlab="datetime", ylab="Voltage")
    plot(sub4$Time, sub4$sub_metering_1, type = "n",xlab="", ylab="Energy sub metering")
      with(sub4,lines(Time,as.numeric(as.character(sub_metering_1))))
      with(sub4,lines(Time,as.numeric(as.character(sub_metering_2)),col="red"))
      with(sub4,lines(Time,as.numeric(as.character(sub_metering_3)),col="blue"))
        legend("topright", lty=1, col= c("black","red","blue"),
               legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), 
               cex=0.7)
    plot(sub4$Time, as.numeric(as.character(sub4$Global_reactive_power)), type="l", xlab="", ylab="Global_reactive_power")
              }
      )
  
#close the file
  dev.off()
  