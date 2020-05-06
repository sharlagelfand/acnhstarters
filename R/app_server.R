#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # List the first level callModules here
  observeEvent(input$sample, {
    villagers_sample <- sample_villagers()
    output$sample_villagers <- gt::render_gt(
      create_villagers_table(villagers_sample)
    )
  })
}
