library(ggplot2)
library(maps)
library(mapdata)
library(dplyr)
library(RColorBrewer)

buildPopRateMap <- function(year) {
#This function returns all columns for the county total of a given year
get.year.total <- function(year) {
  return(filter(df, INDEXYEAR == year) %>% filter(LOCATION == "COUNTY TOTAL"))
}

df <- read.csv("allData.csv") #Get the data
counties <- map_data("county") #Get the county data
wa_county <- subset(counties, region == "washington") #Get only washington counties
wa_county <- mutate(wa_county, "population" = NA) #Add an empty column for crime rate

totals.2000 <- get.year.total(year) #Get total information for given year (default 2000)


pops <- 0 #Declare population vector
for(i in 1:nrow(totals.2000)) { #Loop through total df
  pops[i] <- as.character(totals.2000$POPULATION[i]) #Assign total at pos[i] to pops
}

count <- 1 #Declare count integer
wa_county$population[1] <- pops[1] #Assign fist county population
for (j in 2:nrow(wa_county)) { #For each row in county dataframe
  temp <- wa_county$subregion[j - 1] #Temp variable of previous county name
  if(wa_county$subregion[j] != temp) { #If the previous name is different than the current
    count <- count + 1 #Increment count
  }
  wa_county$population[j] <- pops[count] #Current selected county's rate = crime rate at count
}


remove_axes <- theme( ##Remove axes for map, making it look cleaner
  axis.text = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.title = element_blank()
)

myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")))  #USE THIS FOR POPULATION
sc <- scale_fill_gradientn(colours = myPalette(100), limits=c(0, 2000000), name = "Population") #USE THIS FOR POPULATION


#This draws the map of Washington by county and scales the color to the total crime rate
wa_base <- ggplot(data = wa_county, mapping = aes(x = long, y = lat, group = group)) +  #Draw map
  coord_fixed(1.3) + #Fix coords of map to look natural
  geom_polygon(data = wa_county, aes(fill = as.numeric(population)), color = "white") + #Colorscale
  theme_bw() + #Remove gray background
  remove_axes + #Remove axes
  sc
return(wa_base)
}
