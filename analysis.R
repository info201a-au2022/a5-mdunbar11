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
    filter(year %in% yearvar) %>%
    select(country, iso_code, mapvar)
  
  g <- list(showland = TRUE,
            landcolor = toRGB("#e5ecf6"))
  
  p <- plot_geo(data, locationmode = 'ISO-3') %>%
    add_trace(
      z = data[,mapvar], locations = ~iso_code,
      color = data[,mapvar], colors = 'Purples'
    ) %>%
    colorbar(title = "Color Title") %>%
    layout(title = str_to_title(mapvar),
          geo = g)
    return(p)
}
