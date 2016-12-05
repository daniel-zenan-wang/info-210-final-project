install.packages(c("maps", "mapdata"))
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(dplyr)

get.year.total <- function(year) {
  return(filter(df, INDEXYEAR == year) %>% filter(LOCATION == "COUNTY TOTAL"))
}

get.total.variable <- function(county, year) {
  ret <- df %>% filter(COUNTY == county) %>% filter(LOCATION == "COUNTY TOTAL") %>% 
    filter(INDEXYEAR == year) %>% 
    select(TOTAL)
  return(ret)
}

adams.pop <- get.total.variable("ADAMS", "2000")[1]
as.numeric(as.character(adams.pop))
as.character(adams.pop)


df <- read.csv("allData.csv")
counties <- map_data("county")
wa_county <- subset(counties, region == "washington")
wa_county <- mutate(wa_county, "POPULATION" = NA)

wa_county$POPULATION[wa_county$subregion == "adams"] = adams.pop
wa_county$POPULATION[wa_county$subregion == "asotin"] = get.total.variable("ASOTIN", "2000")

pops <- 0
for(i in nrow(test)) {
  pops[i] <- as.integer(test$TOTAL[i])
}
pops[2]

wa_base <- ggplot(data = wa_county, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + geom_polygon(fill = "gray", color = "black")
wa_base
