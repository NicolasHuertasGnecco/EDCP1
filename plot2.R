{
        library(dplyr)
        library(lubridate)
        
        datos<-read.table("Consumption.txt",sep=";",header = T,stringsAsFactors = FALSE)
        datos[,1]<-as.Date(datos[,1],format="%d/%m/%Y")
        datesR<-filter(datos,year(Date)=="2007"&month(Date)=="2"&(day(Date)=="2"|day(Date)=="1"))
        datesR$DT<-paste(as.character(datesR$Date),as.character(datesR$Time),sep=" ")
        datesR$DT<-as.POSIXct(datesR$DT)
        png("Plot2.png",width = 480,height = 480)
        plot(x=datesR$DT,y=datesR$Global_active_power,type = "l",xlab = "WeekDays",ylab="Global Active power")
        dev.off()
}