library(econDV2)
library(dplyr)
library(mapview)
library(RColorBrewer)

mp <- econDV2::Map()
sf_taiwan_simplified <- econDV2::sf_taiwan_simplified
names(
  sf_taiwan_simplified
) <- c("縣市" , "鄉鎮區" , "台灣本島")
names(sf_taiwan_simplified[['台灣本島']]) <- c("縣市" , "鄉鎮區")
data <- read.csv(file="week_18HW.csv")

econDV2::Object(pop)
econDV2::Object(background)
pop$data <- data
as.numeric(data$Net_Immigrants)

background$台灣本島$縣市 <- function(){
  sf_taiwan_simplified$台灣本島$縣市 |>
    mp$sf$make_background_map(
      color="white",
      size=0.14
    )
}

left_data <-
  sf_taiwan_simplified$`台灣本島`$縣市
right_data <-
  pop$data

pop$join$left <- {
  left_data |> 
    dplyr::left_join(
      right_data, by=c("map_id"="Locality")
    )
}

pop$map <- function(){
  background$`台灣本島`$縣市() +
    geom_sf(
      data=pop$join$left,
      mapping=aes(
        fill=Net_Immigrants
      ),
      color="white",
      size=0.15
    )+
    geom_sf_text(aes(label = name), size = 3)+
    colorspace::scale_fill_continuous_sequential(
      palette="blues2", 
      na.value="#dbd7a8"
    )+
    labs(title = "2021年台灣各縣市淨遷入人口",
         subtitle = "淨遷入=總遷入-總遷出",
         caption = "資料來源：中華民國內政部戶政司",x="",y="")+
    theme(plot.title=element_text(size=rel(1.5),hjust=0.3))
}

pop$map()
