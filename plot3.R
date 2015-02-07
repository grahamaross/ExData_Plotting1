##Starting conditions:
# power consumption txt file is present in parent of working directory.

hpc <- read.csv(
  file="../household_power_consumption.txt",
  sep=";",
  na.strings="?", #treat "?" as NA
  colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
)
t <- hpc[hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007",]
t <- t[complete.cases(t),] #remove rows containing NA

# compute datetimes:
dt <- strptime(paste(t$Date,t$Time),format="%d/%m/%Y %H:%M:%S")

#prepare png device - match dimensions and appearance of prototype png images
png(filename="plot3.png",
    width=504,
    height=504,
    bg="transparent",
    type="cairo"
)

#colors aren't exactly red and blue. Black looks black, though.
reddish <- "#FF2500"
blueish <- "#0433FF"

#Plot...
plot(dt,
     t$Sub_metering_1,
     xlab="",
     ylab="Energy sub metering",
     type="n" #empty shell. add data elements below...
     )
lines(dt,t$Sub_metering_1,col="black")
lines(dt,t$Sub_metering_2,col=reddish)
lines(dt,t$Sub_metering_3,col=blueish)
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black",reddish,blueish),
       lty=1 #lines not points
       )

#close the device
dev.off()

#The End
