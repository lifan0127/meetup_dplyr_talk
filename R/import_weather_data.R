

# Download weather data files: http://learn.fi.edu/weather/data2/ (Philadelphia 1872-2001)
if(length(list.files("data/weather")) == 0){
  for(year in 1872:2001){
    download.file(paste0("http://learn.fi.edu/weather/data2/", year, ".txt"), paste0("data/weather/", year, ".txt"))
  }
}

# Parse data into dataframe
weather <- do.call("rbind",lapply(list.files("data/weather"), function(x) read.table(paste0("data/weather/", x))))

# Add column names
colnames(weather) <- c("Month", "Day", "Year", "HighTemp", "LowTemp", "Precipitation", "Snow")

# Replace -999 with NA
weather[weather==-999] <- NA

# Convert precipitation to inches
weather$Precipitation <- weather$Precipitation/100

# Convert snowfall to inches
weather$Snow <- weather$Snow/10


# Import Boston 2000 Data
# Source: http://www.wunderground.com/history (Boston Airport)
boston <- read.csv("data/weather/Boston.csv", stringsAsFactors = FALSE) %>%
  transmute(Date = EST, HighTemp = Max.TemperatureF, LowTemp = Min.TemperatureF)


# Save the dataframe
save(weather, boston, file="data/weather.RData")
