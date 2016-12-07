library(plotly)
library(dplyr)
library(ggplot2)

df <- read.csv("allData.csv")
countyTotal <- filter(df, LOCATION == 'COUNTY TOTAL')
#input:county's name
#output: the violent crime rate trend in specified county from 1991 to 2011 or 2015 (depends on available data)
#Suggestion: Could use shiny to enable user to choose county's name and see the trend by the radio button or something similar.
violentCrimeTrend <- function(county) {
  violentCrime <- select(countyTotal, COUNTY, INDEXYEAR, MURDER, RAPE, ROBBERY, ASSAULT)
  chosenCounty = filter(violentCrime, COUNTY == county)
  p <- plot_ly(chosenCounty, x = ~INDEXYEAR, y = ~MURDER, type = 'scatter', name = 'Murder', mode = 'lines', fill = 'tonexty') %>%
    add_trace(y = ~RAPE, name = 'Rape') %>%
    add_trace(y = ~ROBBERY, name = 'Robbery') %>%
    add_trace(y = ~ASSAULT, name = 'Assault') %>%
    layout(title = paste(county, 'Violent Crime Rate Trend'),
           xaxis = list(title = 'Year'),
           yaxis = list(title = 'count')
    )
  return (p)
}

#input: county's name 
#output: the property crime rate trend in specified county from 1991 to 2011 or 2015 (depends on available data)
propertyCrimeTrend <- function(county) {
  propertyCrime <- select(countyTotal, COUNTY, INDEXYEAR, ARSON, BURGLARY, THEFT, MVTHEFT)
  chosenOne = filter(propertyCrime, COUNTY == county)
  p <- plot_ly(chosenOne, x = ~INDEXYEAR, y = ~ARSON, type = 'scatter', name = 'Arson', mode = 'lines', fill = 'tonexty') %>%
    add_trace(y = ~BURGLARY, name = 'Burglary') %>%
    add_trace(y = ~THEFT, name = 'Theft') %>%
    add_trace(y = ~MVTHEFT, name = 'Theft of Motor Vehicle') %>%
    layout(title = paste(county, 'Property Crime Rate Trend'),
           xaxis = list(title = 'Year'),
           yaxis = list(title = 'count')
    )
  return (p)
}


