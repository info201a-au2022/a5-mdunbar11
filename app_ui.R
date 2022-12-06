library(shiny)
library(plotly)

intro_sidebar_content <- sidebarPanel(
  #insert summary values
)

intro_main_content <- mainPanel(
  #insert report
)

intro_panel <- tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  sidebarLayout(
    intro_sidebar_content,
    intro_main_content
  )
)

map_sidebar_content <- sidebarPanel(
  #insert widgets
  selectInput(
    "mapvar",
    label = "Variable to Map",
    choices = list(
      "Coal" = "coal_co2",
      "Cement" = "cement_co2",
      "Flaring" = "flaring_co2",
      "Gas" = "gas_co2",
      "Oil" = "oil_co2"
    )
  ),
  
  sliderInput(
    co2_contributors$year == "yearvar",
    label = "Select year:",
    inputId = "Year:",
    min = 2000, 
    max = 2021,
    value = 2010,
    sep = ""
  )
)

map_main_content <- mainPanel(
  #insert map
  plotlyOutput("map")
)

map_panel <- tabPanel(
  "Map",
  titlePanel("Map"),
  sidebarLayout(
    map_sidebar_content,
    map_main_content
    )
)

ui <- navbarPage(
  "CO2 Emission Data",
  intro_panel,
  map_panel
)
