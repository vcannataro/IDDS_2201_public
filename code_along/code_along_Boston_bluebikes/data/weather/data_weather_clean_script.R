
# downloaded directly from the website
# https://www.ncdc.noaa.gov/cdo-web/datasets/GHCND/stations/GHCND:USW00014739/detail

boston_weather <- readr::read_csv(file = "code_along/blue_bikes_weather/data/weather/2545598_raw_noaa.csv")

# WSF2 - Fastest 2-minute wind speed
# WSF5 - Fastest 5-second wind speed
# SNOW - Snowfall
# WT03 - Thunder
# WT04 - Ice pellets, sleet, snow pellets, or small hail"
# PRCP - Precipitation
# WT05 - Hail (may include small hail)
# WT06 - Glaze or rime
# WT08 - Smoke or haze
# WT09 - Blowing or drifting snow
# WDF2 - Direction of fastest 2-minute wind
# AWND - Average wind speed
# WDF5 - Direction of fastest 5-second wind
# PGTM - Peak gust time
# WT01 - Fog, ice fog, or freezing fog (may include heavy fog)
# TMAX - Maximum temperature
# WT02 - Heavy fog or heaving freezing fog (not always distinguished from fog)
# TAVG - Average Temperature.
# TMIN - Minimum temperature 

boston_weather <- boston_weather %>%
  dplyr::rename(Fastest_2_min_windspeed = WSF2,
                Fastest_5_min_windspeed = WSF5,
                Snowfall = SNOW, 
                Thunder = WT03, 
                Ice_pellets = WT04, 
                Precipitation = PRCP, 
                Hail = WT05, 
                Average_wind_speed = AWND, 
                Fog = WT01, 
                Maximum_temperature = TMAX, 
                Average_temperature = TAVG, 
                Minimum_temperature = TMIN) %>%
  select(-STATION, -NAME, -PGTM,
         -WDF2, -WDF5, 
         -WT02, -WT06, -WT08, -WT09)

readr::write_csv(x = boston_weather,"code_along/blue_bikes_weather/data/weather/weather_data_clean.csv")

