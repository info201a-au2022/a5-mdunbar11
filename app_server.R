library(dplyr)
source("analysis.R")

# What is the average value of gas CO2 emissions across all the countries in 2021?
avg_gas_value_df <- co2_contributors %>%
  filter(year == 2021)

avg_gas_value <- mean(avg_gas_value_df[["gas_co2"]])
avg_gas_value <- round(avg_gas_value, 2)

# What is the country with the highest value of gas CO2 emissions in 2021?
highest_country_gas_df <- co2_contributors %>%
  filter(year == 2021)

highest_country_gas_df <- highest_country_gas_df[!highest_country_gas_df$iso_code=="", ]

highest_country_gas_2021 <- highest_country_gas_df %>%
  filter(gas_co2 == max(gas_co2)) %>%
  pull(country)

# What is the country with the highest value of coal CO2 emissions in 2000?
highest_country_coal_2000_df <- co2_contributors %>%
  filter(year == 2000)

highest_country_coal_2000_df <- highest_country_coal_2000_df[!highest_country_coal_2000_df$iso_code=="", ]

highest_country_coal_2000 <- highest_country_coal_2000_df %>%
  filter(coal_co2 == max(coal_co2)) %>%
  pull(country)

server <- function(input, output) {
  #insert map output
  output$map <- renderPlotly({ 
    return(build_map(input$mapvar, input$yearvar))
  }) 
  
  output$value1 <- renderText({
    return(avg_gas_value)
  })
  
  output$value2 <- renderText({
    return(highest_country_gas_2021)
  })
  
  output$value3 <- renderText({
    return(highest_country_coal_2000)
  })
}
