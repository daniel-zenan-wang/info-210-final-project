# info-201-final-project

# ui.R
library(shiny)
library(plotly)
shinyUI(fluidPage(
  titlePanel('INFO 201 Final Project - Washington Crime Visualizations'),
  
  tabsetPanel(
    
    tabPanel("Description", h3(textOutput("Description"))),
    tabPanel("County Crime Data by Year", # Create sidebar layout
             
             sidebarLayout(
               
               # Side panel for controls
               sidebarPanel(
                 
                 # crimeDataByYear year selector
                 sliderInput("year", "Year", 
                             min = 2000, max = 2015, value = 0, step = 1,
                             format="####", animate=TRUE)
               ),
               
               # Create a main panel, in which you should display your plotly Scatter plot
               mainPanel(
                 plotlyOutput('scatter')
               )
             )),
    tabPanel("County Crime Trends by Type", # Create sidebar layout
             sidebarLayout(
               
               # Side panel for controls
               sidebarPanel(
                 
                 # Input to select county to display trend for
                 selectInput('county', label = 'County', choices = unique(filter(read.csv("allData.csv"), LOCATION == 'COUNTY TOTAL')$COUNTY), selected = 'Sepal.Width')
               ),
               
               # Create a main panel, in which you should display your plotly Scatter plot
               mainPanel(
                 plotlyOutput('crimetrend')
               )
             ))
    
    ,
    tabPanel("Crime Rate Map", # Create sidebar layout
             sidebarLayout(
               
               # Side panel for controls
               sidebarPanel(
                 
                 # Input to select county to display trend for
                 selectInput('county', label = 'County', choices = unique(filter(read.csv("allData.csv"), LOCATION == 'COUNTY TOTAL')$COUNTY), selected = 'Sepal.Width')
               ),
               
               # Create a main panel, in which you should display your plotly Scatter plot
               mainPanel(
                 plotlyOutput('crimetrend')
               )
             ))
    
  )
  
  
  
))
