# info-201-final-project

# server.R

# libraries
library(dplyr)


source("PRATE_vs_VRATE_by_Year.R")
source("violentCrimeTrend.R")
source("popRatMap.R")
source("crimeRateMap.R")

# Start shinyServer
shinyServer(function(input, output) { 
  
  # Render a plotly object that returns the visualization
  output$scatter <- renderPlotly({ 
    p <- crimeDataByYear(input$year)
  })
  
  # Render a plotly object that returns the visualization
  output$crimetrend <- renderPlotly({ 
    p <- violentCrimeTrend(input$county)
  })
  
  # Render a plotly object that returns the visualization
  output$crimetrend <- renderPlotly({ 
    p <- violentCrimeTrend(input$county)
  })
  
  # Render a map object that returns the visualization
  output$crimemap <- renderPlot({ 
    buildCrimeRateMap(input$ratemapyear)
  })
  
  # Render a map object that returns the visualization
  output$popmap <- renderPlot({ 
    buildPopRateMap(input$popmapyear)
  })
  
})