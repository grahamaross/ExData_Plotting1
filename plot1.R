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

#prepare png device - match dimensions and appearance of prototype png images
png(filename="plot1.png",
    width=504,
    height=504,
    bg="transparent",
    type="cairo"
)

#colors aren't exactly red and blue. Black looks black, though.
reddish <- "#FF2500"
blueish <- "#0433FF"

#plot...
hist(t$Global_active_power,
     col=reddish,
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power"
     )

#close the device
dev.off()

#The End
