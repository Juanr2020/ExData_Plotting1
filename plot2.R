GlobalPower<- read.table("household_power_consumption.txt", skip=2, sep=";")
names(GlobalPower)<- c("Date", "Time","Global_active_power", "Global_reactive_power","Vlotage", "Global_intensity",
                       "sub_metering_1","sub_metering_2","sub_metering_3")
View(GlobalPower)
typeof(GlobalPower$Date)
typeof(GlobalPower$Time)

sub2<- subset(GlobalPower, GlobalPower$Date=="1/2/2007"|GlobalPower$Date=="2/2/2007")
#need to change to actual date and time format for the calander time format

  sub2$Date<- as.Date(sub2$Date, format = "%d%m%Y")
  sub2$Time<- strptime(sub2$Time, format = "%H:%M:%S")
  sub2[1:1440,"Time"] <- format(sub2[1:1440,"Time"], "2007-02-01 %H:%M:%S")
  sub2[1441:2880,"Time"] <- format(sub2[1441:2880,"Time"], "2007-02-02 %H:%M:%S")
  
#open png file
  png("plot2.png", width = 480, height = 480)
#creating the plot
  plot(sub2$Time, as.numeric(as.character(sub2$Global_active_power)), type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
  dev.off()
  