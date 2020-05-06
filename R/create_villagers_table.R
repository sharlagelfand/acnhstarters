create_villagers_table <- function(villagers) {
  dplyr::as_tibble(cbind(nms = names(villagers), t(villagers)), .name_repair = "minimal") %>%
    janitor::row_to_names(1) %>%
    gt::gt() %>%
    gt::tab_style(
      style = gt::cell_text(weight = "bold"),
      locations = gt::cells_column_labels(columns = dplyr::everything())
    ) %>%
    gt::text_transform(
      locations = gt::cells_body(
        columns = dplyr::everything(),
        rows = personality == "url"
      ),
      fn = function(x) {
        gt::web_image(x, height = 100)
      }
    ) %>%
    gt::cols_hide(columns = dplyr::vars(personality)) %>%
    gt::tab_spanner(label = "First Two Villagers", columns = dplyr::vars(Jock, Uchi)) %>%
    gt::tab_spanner(label = "First Three Mystery Island Villagers", columns = dplyr::vars(Peppy, Lazy, Normal)) %>%
    gt::tab_spanner(label = "First Camper", columns = dplyr::vars(Smug)) %>%
    gt::cols_align(align = "center")
}
