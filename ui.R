# info-201-final-project

# ui.R
library(shiny)
library(plotly)
shinyUI(fluidPage(
  titlePanel('INFO 201 Final Project - Washington Crime Visualizations'),
  
  tabsetPanel(
    
    tabPanel("Description", mainPanel(h3("Crime Statistics for Prospective Homeowners"),p("One of the chief concerns of any prospective homeowner is the crime rate of the neighborhood they want to move to. Using data from the Washington State Statistical Analysis Center on crime rates and types for all counties in Washington State, we created visualizations to communicate this information. This will help future homebuyers make decisions to live in safer areas, and also has further applications for people to address crime-related issues in Washington.")) ),
    tabPanel("County Crime Data by Year", # Create sidebar layout
             
             sidebarLayout(
               
               # Side panel for controls
               sidebarPanel(
                 
                 # crimeDataByYear year selector
                 sliderInput("year", "Year", 
                             min = 2000, max = 2015, value = 0, step = 1,
                             sep = "", animate=TRUE)
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
                 
                 # crimeDataByYear year selector
                 sliderInput("ratemapyear", "Year", 
                             min = 2000, max = 2015, value = 0, step = 1,
                             sep = "", animate=TRUE)
               ),
               
               # Create a main panel, in which you should display your plotly Scatter plot
               mainPanel(
                 plotOutput('crimemap')
               )
             )),
    tabPanel("Population Rate Map", # Create sidebar layout
             sidebarLayout(
               
               # Side panel for controls
               sidebarPanel(
                 
                 # crimeDataByYear year selector
                 sliderInput("popmapyear", "Year", 
                             min = 2000, max = 2015, value = 0, step = 1,
                             sep = "", animate=TRUE)
               ),
               
               # Create a main panel, in which you should display your plotly Scatter plot
               mainPanel(
                 plotOutput('popmap')
               )
             ))
    
    
  )
  
  
  
))
