pop_str<-read.csv(file = "week13_12.8HW.csv")  

data <- data.frame(
  year = pop_str$年別,
  total1980 = pop_str$總扶養比,
  child1980 = pop_str$扶幼比,
  elder1980 = pop_str$扶老比,
  total2020 = pop_str$總扶養比1,
  child2020 = pop_str$扶幼比1,
  elder2020 = pop_str$扶老比1
)

year_point = as.numeric(rep(c(1980,2020,2070,rep("",20)),2))
year_1980 = as.numeric(rep(c(57.26,40.16,102.00,rep("",20)),2))
year_2020 = as.numeric(rep(c(50.52,17.63,18.00,rep("",20)),2))
year_2070 = as.numeric(rep(c(6.74,22.53,84.00,rep("",20)),2))

ggplot(data,aes(x=year)) +
  geom_hline(yintercept = c(25,50,75,100),
             color = "#cccccc") +
  geom_line(aes(y=total1980,
                color = "總扶養比"), 
            size = 1,
            na.rm=TRUE
  ) +
  geom_line(aes(y=child1980,
                color = "扶幼比"),
            size = 1,
            na.rm=TRUE
  ) +
  geom_line(aes(y=elder1980,
                color = "扶老比"),
            size = 1,
            na.rm=TRUE
  ) +
  geom_line(aes(y=total2020,
                color = "總扶養比"),
            size = 1,
            linetype = "dashed",
            na.rm=TRUE
  ) +
  geom_line(aes(y=child2020,
                color = "扶幼比"),
            size = 1,
            linetype = "dashed",
            na.rm=TRUE
  ) +
  geom_line(aes(y=elder2020,
                color = "扶老比"),
            size = 1,
            linetype = "dashed",
            na.rm=TRUE
  ) +
  geom_vline(xintercept = 2020,
             color = "#cb0203",
             size = 1.2) +
  geom_point(x=year_point,y=year_1980,color="blue",size=3,na.rm = TRUE) +
  geom_point(x=year_point,y=year_2020,color="#f8766d",size=3,na.rm = TRUE) +
  geom_point(x=year_point,y=year_2070,color="#00ba38",size=3,na.rm = TRUE) +
  geom_point(x=2012,y=32,shape="triangle",size=3)+
  geom_text(
    mapping = aes(
      x = 2038,
      y = 105,,
      label = "2021年(含)後為中推估值"  ),
    color = "#cb0203"
  ) +
  geom_text(
    mapping = aes(
      x = 2022,
      y = 32,
      label = "最低點2012年34.7")
  ) +
  geom_segment(aes(x = 2021,
                   y = 105,
                   xend = 2026,
                   yend = 105
  ),
  color = "#cb0203",
  arrow = arrow(length = unit(0.2, "cm"))) +
  scale_x_continuous("year", breaks = c(seq(1980,2020,10) , 2030 , 2040 , 2050 , 2060 , 2070)
  ) +
  scale_y_continuous(name = "扶養比(%)") +
  labs(title="扶養比趨勢",
       colour = "",
       caption = "資料來源：國家發展委員會「中華民國人口推估（2020至2070年）」，2020年8月。") +
  theme(plot.title=element_text(size=rel(2),hjust=0.5),
        panel.background=element_rect(color="black")
  )