#We first download, unzip and read the data
temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,method="curl")
unzip(temp)
unlink(temp)
household<-read.table("household_power_consumption.txt",header=T,sep=";",colClasses="character")
# We deal set the class of the Date column to Date and subset the data
household$Date<-as.Date(household$Date,format="%d/%m/%Y")
household<-subset(household,household$Date=="2007-02-01"|household$Date=="2007-02-02")
# We set the class of the rest of the columns to numeric
household[,3:9]<-apply(household[,3:9],2,as.numeric)
# We open the png device
png(filename="plot1.png")
# We make the plot
par(mfrow=c(1,1))
hist(household$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
# We close the graphics device
dev.off()