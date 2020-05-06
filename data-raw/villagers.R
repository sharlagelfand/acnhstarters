library(readr)
library(dplyr)
library(stringr)
library(forcats)

# Data from Tidy Tuesday:
villagers_raw <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-05-05/villagers.csv")

# Clean up data a bit
villagers <- villagers_raw %>%
  mutate_at(vars(personality, species), stringr::str_to_title) %>%
  mutate(name_species = glue::glue("{name} ({species})")) %>%
  select(personality, name_species, url)

usethis::use_data(villagers, overwrite = TRUE)
