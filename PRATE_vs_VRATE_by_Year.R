library(plotly)
library(dplyr)

df <- read.csv("allData.csv")
countyTotal <- filter(df, LOCATION == 'COUNTY TOTAL')

#input: year
#output: prate v.s. vrate in specified year. population is represented by size of circle and
#total rate is represented by color, indicator is the side bar. 
crimeDataByYear <- function(year) {
yearly <- filter(countyTotal, INDEXYEAR == year)
p <- plot_ly(yearly,
             x = ~VRATE,
             y = ~PRATE,
             type = 'scatter',
             mode = 'markers',
             size = ~POPULATION,
             color = ~RATE,
             hoverinfo = 'text',
             name = "population size",
             #give user necessary info when hover over the circle
             text = ~paste('County: ', COUNTY,
                           '</br>Year: ', INDEXYEAR,
                           '</br>Population: ', POPULATION,
                           '</br>Total Crime: ', TOTAL,
                           '</br>Crime Rate(1/1000): ', RATE,
                           '</br>Property Crime Rate(1/1000): ', PRATE,
                           '</br>Violent Crime Rate(1/1000): ', VRATE
             )) %>%
  #added annontations so users know which county they are looking at
  add_annotations(
    x = yearly$VRATE,
    y = yearly$PRATE,
    text = ~COUNTY,
    xref = 'x',
    yref = "y",
    showarrow = TRUE,
    arrowhead = 8,
    arrowsize = 0.5,
    ax = 20,
    ay = -40,
    opacity = 0.4,
    font = list(color = '#8c8c8c',
                family = 'sans serif',
                size = 15
    )
  ) %>%
  layout(title = paste(year, 'Property Crime Rate versus Violent Cime Rate<br />(Hover for details)'),
         xaxis = list(title = 'Violent Crime Rate(crimes committed per 1,000 residents)'),
         yaxis = list(title = 'Property Crime Rate(crimes committed per 1,000 residents)')
         )
return (p)
}
