library(dplyr)

co2_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
write.csv(co2_data, file = "co2_data")

View(co2_data)


