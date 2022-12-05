library(shiny)
library(plotly)

intro_sidebar_content <- sidebarPanel(
  #insert summary values
)

intro_main_content <- mainPanel(
  #insert report
)

intro_panel <- tabPanel(
  titlePanel("Introduction"),
  sidebarLayout(
    intro_sidebar_content,
    intro_main_content
  )
)

map_sidebar_content