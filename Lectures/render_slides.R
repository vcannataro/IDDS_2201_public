
library(fs)
library(tidyverse)
library(rmarkdown)
library(xaringan)

xaringans <- dir_info(recurse = 3, glob = "*.Rmd") %>% 
  filter(!str_detect(path, "in_class")) %>%
  filter(!str_detect(path, "starwars_ae")) %>%
  filter(!str_detect(path, "building_election_map")) %>%
  filter(!str_detect(path, "map_example")) %>%
  filter(!str_detect(path, "Cannataro_IDDS_2201_flyer")) %>%
  filter(!str_detect(path, "setup")) %>%
  pull(path)
walk(xaringans, render)
