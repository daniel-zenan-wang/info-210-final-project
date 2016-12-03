#install.packages(c("maps", "mapdata"))
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(dplyr)
df <- read.csv("allData.csv")

selecByYear <- function(year) {
  dfYear <- filter(df, INDEXYEAR == year, LOCATION == 'COUNTY TOTAL')
  return (dfYear)
}

test <- selecByYear(1994)

counties <- map_data("county")
wa_county <- subset(counties, region == "washington")
wa_base <- ggplot(data = wa_county, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "black", fill = "gray")