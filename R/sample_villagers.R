sample_villagers <- function(personalities = c(
  "Jock", "Uchi", # Starter villagers
  "Peppy", "Lazy", "Normal", # First three villagers from mystery islands
  "Smug" # First campsite visitor
), n_each = 1) {
  villagers %>%
    dplyr::filter(personality %in% personalities) %>%
    dplyr::group_by(personality) %>%
    dplyr::sample_n(n_each) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(
      personality = forcats::fct_relevel(personality, personalities)
    ) %>%
    dplyr::select(personality, name_species, url)
}
