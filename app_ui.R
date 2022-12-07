library(shiny)
library(plotly)

intro_sidebar_content <- sidebarPanel(
  #insert summary values
  h5(strong("What is the average value of gas CO2 emissions across all the countries in 2021?")),
  textOutput("value1"),
  h5(strong("What is the country with the highest value of gas CO2 emissions in 2021?")),
  textOutput("value2"),
  h5(strong("What is the country with the highest value of coal CO2 emissions in 2000?")),
  textOutput("value3")
)

intro_main_content <- mainPanel(
  h5(strong("Variables:")),
  p("-cement"),
  p("-coal"),
  p("-flaring"),
  p("-gas"),
  p("-oil"),
  p("-year"),
  p(strong("This interactive web application provides a meaningful analysis of CO2 emission data by country over time. It creates an accurate map of the data for five different variables. The variables are annual production-based emissions of carbon dioxide (CO₂) from cement, coal, flaring, gas, and oil. All variables are measured in million tonnes and are based on territorial emissions, which do not account for emissions embedded in traded goods. Beyond this, the interactive map also allows users to toggle between the data for certain years. This is important because we can compare data over time. Then, we can use our conclusions to understand the data better and make predictions for the future in hopes of creating a positive impact."))
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
    inputId = "yearvar",
    label = "Select year:",
    min = 2000, 
    max = 2021,
    value = c(2000, 2021),
    sep = ""
  )
)

map_main_content <- mainPanel(
  #insert map
  plotlyOutput("map"),
  p("The purpose of this map is to observe the contribution of different factors such as coal, cement, flaring, gas, and oil to CO2 emissions around the world. Because of the color scale, we are able to point out countries that particulary stand out for different types of reasons. It is important to analyze these CO2 emission values by year so that we can observe consistencies, improvements, and deteriorations.")
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
