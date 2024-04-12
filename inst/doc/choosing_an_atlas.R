## ----echo = FALSE-------------------------------------------------------------
library(reactable)
read.csv("atlas_stats.csv") |>
    reactable(defaultPageSize = 12,
              columns = list(region = colDef("Region", minWidth = 50),
                            institution = colDef("Organisation",
                                                 minWidth = 150),
                            count = colDef("Number of Records", minWidth = 50,
                                           format = colFormat(separators = TRUE)),
                            n_services = colDef("Number of supported APIs", minWidth = 50)))

## ----atlas-support, echo = FALSE, out.width = "100%"--------------------------
knitr::include_graphics('../man/figures/atlases_plot.png')

