library(readr)
library(tidyverse)

population<-read.csv(file="11.17HW.csv")
Year<-rep(2011:2020,times=6)
city<-rep(c("NewTaipei","Taipei","Taichung","Tainan","Kaohsiung","TTaoyuan"),each=10)
NewTaipei<-c(3916451,3939305,3954929,3966818,3970644,3979208,3986689,3995717,4018696,4030954)
Taipei<-c(2650968,2673226,2686516,2702315,2704810,2695704,2683257,2668572,2645041,2602418)
Taichung<-c(2664394,2684893,2701661,2719835,2744445,2767239,2787070,2803894,2815261,2820787)
Tainan<-c(1876960,1881645,1883208,1884284,1885541,1886033,1886522,1883831,1880906,1874917)
Kaohsiung<-c(2774470,2778659,2779877,2778992,2778918,2779371,2776912,2773533,2773198,2765932)
Taoyuan<-c(2013305,2030161,2044023,2058328,2105780,2147763,2188017,2220872,2249037,2268807)
value<-c(NewTaipei,Taichung,Tainan,Taipei,Kaohsiung,Taoyuan)

df<-data.frame(year=Year,city=city,pop=value)

ggplot(data=df,
       mapping=
         aes(
           x=year,
           y=pop,
           colour=city
         ))+
  geom_line(size=1)+
  geom_point()+
  scale_x_continuous(
    breaks={
      breaks=c(2011:2020)},
    labels={
      labels=c("2011","12","13","14","2015","16","17","18","19","2020")}
  )+
  labs(title="2011-2020年六都人口變化圖")+
  theme(plot.title=element_text(size=rel(2),hjust=0.5),
        axis.title.y=element_text(size=rel(1),angle=90,hjust=0.5,vjust=3
        )
  )
