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
png(filename="plot2.png",
    width=504,
    height=504,
    bg="transparent",
    type="cairo"
)

#Plot...
plot(dt,
     t$Global_active_power,
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l" #lines not points
     )

#close the device
dev.off()

#The End
