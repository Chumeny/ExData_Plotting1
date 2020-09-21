path<-getwd()
file<-file.path(file.path(path,"household_power_consumption.txt"));
Data<-read.csv2(file,header=TRUE,sep=";",col.names = c("Date","Time","Global_Active_Power","Global_Reactive_Power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"));
Datasubset <- Data[Data$Date %in% c("1/2/2007","2/2/2007"),]; 
Datasubset$Date<-as.Date(Datasubset$Date,"%d/%m/%Y");
Datasubset$Time<-as.POSIXct(paste(Datasubset$Date,Datasubset$Time), format="%Y-%m-%d %H:%M:%S");
Datasubset<-Datasubset[complete.cases(Datasubset),] #remove incomplete cases
Datasubset$Global_Active_Power<-as.numeric(Datasubset$Global_Active_Power);
Datasubset$Sub_metering_1<-as.numeric(Datasubset$Sub_metering_1);
Datasubset$Sub_metering_2<-as.numeric(Datasubset$Sub_metering_2);
Datasubset$Sub_metering_3<-as.numeric(Datasubset$Sub_metering_3);
Datasubset$Global_Reactive_Power<-as.numeric(Datasubset$Global_Reactive_Power);
Datasubset$Voltage <-as.numeric(Datasubset$Voltage);


#Third Graph
plot(Datasubset$Sub_metering_1~Datasubset$Time,type="l",ylab="Global Active Power (kilowatts)",xlab="");
lines(Datasubset$Sub_metering_2~Datasubset$Time,col="red");
lines(Datasubset$Sub_metering_3~Datasubset$Time,col="blue");
legend("topright",col=c("black","red","blue"),c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lwd=c(2,2,2));
dev.copy(png,"plot3.png",height=480,width=480); #savefile
dev.off();
