# info-201-final-project

# server.R

# libraries
library(dplyr)


source("PRATE_vs_VRATE_by_Year.R")
source("violentCrimeTrend.R")

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
})