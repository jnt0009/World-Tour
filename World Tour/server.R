rsconnect::deployApp('',  ## Path to your app
                    appTitle = "")  ## Title of your app
##Dependencies
library(maps)
library(htmltools)
library(magrittr)
library(leaflet)
library(shinyjs)
library(shiny)
install.packages('rlang')
library(rlang)

## Source of all the photos copy and such
source('BaseR.R')

server <- function(input, output, session) {
  copy_text <- reactive({
    x = which(tbl[, 1]  %in% input$trips)  ## positioning
    print(as.character(tbl[x, 5])) ## replace 5 with ever the text for each trip goes
  }) ##Content function
  
  
  ##  Outputs ##
  output$Map <- renderLeaflet({
    leaflet(tbl) %>% addTiles() %>%
      addMarkers( ~ long, ~ lat,
                  popup = ~ htmlEscape(tbl$location))  ## Spins up the map
  })  ## Map of trips
  output$copy <- renderText({
    copy_text()  ## Call the copy function from above
  }) ## Content goes here
  output$pics <- renderUI({
    y = which(tbl[, 1]  %in% input$trips)  ## positioning
    print(y) ## Pics Function
    z = as.character(tbl[y, 4])  ## Point this towards the images of your trips
    tagList(tags$img(
      src = z,
      width = 250,
      height = 250  
    )) ## Sizes photos
  })
  
}