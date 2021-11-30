library(readr)
library(dplyr)
data_HW2 <- read.csv(file="11.24HW.csv")

newdata <- data.frame(
  Quarter = data_HW2$年度季別,
  HP = data_HW2$房價指數變化率,
  population = data_HW2$人口變化率
)

quarter=c("101\nQ4","","","","102\nQ4","","","","103\nQ4","","","","104\nQ4","","","","105\nQ4","","","","106\nQ4","","","","107\nQ4","","","","108\nQ4","","","","109\nQ4","","110\nQ2")

ggplot(newdata , aes(x=Quarter)) +
  geom_line(aes(y=HP,
                color = "HP"), 
            size = 1,
            group = 1) + 
  geom_line(aes(y=population,
                color = "population"
  ), 
  size = 1,
  group = 1) +
  scale_y_continuous(name = expression("")
  ) +   
  scale_x_continuous(
    breaks={
      breaks=c(1:35)},
    labels={
      labels=quarter}
  ) +
  labs(title="人口變動及房價變動關係圖") +
  theme(plot.title=element_text(size=rel(2),
                                hjust=0.5
  ),
  axis.text.x = element_text(vjust = 0.5),
  axis.text.y = element_text(vjust = 0.5)
  ) +
  theme(panel.background=element_rect(fill='#eff3ff', color="black"))
