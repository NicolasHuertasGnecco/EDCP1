{
        library(dplyr)
        library(lubridate)
        
        datos<-read.table("Consumption.txt",sep=";",header = T,stringsAsFactors = FALSE)
        datos[,1]<-as.Date(datos[,1],format="%d/%m/%Y")
        datesR<-filter(datos,year(Date)=="2007"&month(Date)=="2"&(day(Date)=="2"|day(Date)=="1"))
        datesR$DT<-paste(as.character(datesR$Date),as.character(datesR$Time),sep=" ")
        datesR$DT<-as.POSIXct(datesR$DT)
        png("Plot3.png",width = 480,height = 480)
        with(datesR,{ plot(x=datesR$DT,y=datesR$Sub_metering_1,type = "l",xlab = "WeekDays",ylab="Global Active power") 
                lines(datesR$Sub_metering_2~datesR$DT, col="Red") 
                lines(datesR$Sub_metering_3~datesR$DT,col="blue")})
        legend("topright",c("S1","S2","S3"),lty = c(1,1,1),col = c("black","blue","red"))
        dev.off
        
}