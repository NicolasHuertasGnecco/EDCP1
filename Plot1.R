
{
        library(dplyr)
        library(lubridate)
        
        datos<-read.table("Consumption.txt",sep=";",header = T)
        datos[,1]<-as.Date(datos[,1],format="%d/%m/%Y")
        datesR<-filter(datos,year(Date)=="2007"&month(Date)=="2"&(day(Date)=="2"|day(Date)=="1"))
        datesR$Global_active_power<-as.numeric(datesR$Global_active_power)
        png("p1.png", width=480, height=480)
        hist(datesR$Global_active_power,col="Red",main ="Global active power",xlab = "Global active power(Kilowatts)")
        dev.off()
}