library(dplyr)
source("analysis.R")

server <- function(input, output) {
  #insert map output
  output$map <- renderPlotly({ 
    return(build_map(input$mapvar, input$yearvar))
  }) 
}
