# Data source: http://learn.fi.edu/weather/data2/ (Philadelphia Weather 1872-2001)

for(year in 1872:2001){
  download.file(paste0("http://learn.fi.edu/weather/data2/", year, ".txt"), paste0("data/weather/", year, ".txt"))
}

