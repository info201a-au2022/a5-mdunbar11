library(dplyr)
library(plotly)
library(stringr)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
write.csv(co2_data, file = "co2_data")

co2_contributors <- co2_data %>%
  select(country, iso_code, year, coal_co2, cement_co2, flaring_co2, gas_co2, oil_co2) %>%
  filter(year %in% (2000:2021)) %>%
  na.omit(co2_contributors)

build_map <- function(mapvar, yearvar) {
  data <- co2_contributors %>%
    filter(year %in% yearvar)
  
  g <- list(showland = TRUE,
            landcolor = toRGB("#e5ecf6"))
  
  varequation <- paste0("~", mapvar)
  
  p <- plot_geo(data, locationmode = 'ISO-3') %>%
    add_trace(
      type = "choropleth",
      z = data[,mapvar], text = ~country, locations = ~iso_code,
      color = data[,mapvar], colors = 'Purples'
    ) %>%
    colorbar(title = "Color Title") %>%
    layout(
      title = paste0("Production-based emissions of carbon dioxide (CO₂) from ", sub("_.*", "", mapvar)),
      geo = g
    )
    return(p)
}

