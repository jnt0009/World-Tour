
## Dependencies
library(shiny)
library(leaflet)
source('BaseR.R')  ## Source of all the photos and such


ui <- fluidPage(
  titlePanel('World Tour 2018'),  ##  title
  fluidRow(
    column(3,
           h4('Trips'),  ## Subtitle
           selectInput('trips','Choose Trip',  ## Dropdown
                       choices = tbl[,1], ## Names of places 
                       selected = NULL
           ),
           textOutput('copy'),  ## Content of trips goes here 
           tags$br(),
           uiOutput('pics')   ### Photos displayed here
           
    ),
    mainPanel(
      h4('Map'),
      leafletOutput('Map')  ## My map of trips
    )
  )
)
