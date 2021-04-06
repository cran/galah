## ----setup, include=FALSE---------------------------------------------------------------------------------------------
library(knitr)
options(width=120)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  install.packages("remotes")
#  remotes::install_github("AtlasOfLivingAustralia/galah")

## ---------------------------------------------------------------------------------------------------------------------
library(galah)

## ---------------------------------------------------------------------------------------------------------------------
# free text search
taxa_filter <- select_taxa(term = "Eolophus")

# specifying ranks
select_taxa(term = list(genus = "Eolophus", kingdom = "Aves"))

## ---------------------------------------------------------------------------------------------------------------------
select_taxa(term = "Eolophus", children = TRUE, counts = TRUE)

## ----eval = FALSE-----------------------------------------------------------------------------------------------------
#  locations <- select_locations(sf = st_read('act_rect.shp'))

## ---------------------------------------------------------------------------------------------------------------------
search_fields("basis")
field_values <- find_field_values("basisOfRecord")

## ----eval = FALSE-----------------------------------------------------------------------------------------------------
#  filters <- select_filters(basisOfRecord = "HumanObservation")

## ---------------------------------------------------------------------------------------------------------------------
filters <- select_filters(basisOfRecord = "HumanObservation",
                          occurrenceStatus = exclude("absent"))

## ---------------------------------------------------------------------------------------------------------------------
profiles <- find_profiles()

## ---------------------------------------------------------------------------------------------------------------------
find_profile_attributes("ALA")

## ---------------------------------------------------------------------------------------------------------------------
filters <- select_filters(basisOfRecord = "HumanObservation",
                          profile = "ALA")

## ----eval = FALSE-----------------------------------------------------------------------------------------------------
#  cols <- select_columns("institutionID", group = "basic")

## ----include = FALSE--------------------------------------------------------------------------------------------------
ala_config(email = "ala4r@ala.org.au")

## ----eval = FALSE-----------------------------------------------------------------------------------------------------
#  ala_config(email = your_email_here, profile_path = path_to_profile)

## ----include = FALSE--------------------------------------------------------------------------------------------------
occ <- read.csv("eolophus_roseicapilla.csv")

## ----eval = FALSE-----------------------------------------------------------------------------------------------------
#  occ <- ala_occurrences(taxa = select_taxa("Eolophus roseicapilla"),
#                         filters = select_filters(stateProvince = "Australian Capital Territory",
#                                                  year = seq(2010, 2020),
#                                                  profile = "ALA"),
#                         columns = select_columns("institutionID", group = "basic"))

## ---------------------------------------------------------------------------------------------------------------------
head(occ)

## ----include = FALSE--------------------------------------------------------------------------------------------------
ala_config(cache_directory = tempdir())

## ---------------------------------------------------------------------------------------------------------------------
# List rodent species in the NT
species <- ala_species(taxa = select_taxa("Rodentia"),
            filters = select_filters(stateProvince = "Northern Territory"))
head(species)

## ----warning = FALSE--------------------------------------------------------------------------------------------------
# Total number of records in the ALA
ala_counts()

# Total number of records, broken down by kindgom
ala_counts(group_by = "kingdom")

## ----warning=FALSE, message=FALSE, eval = FALSE-----------------------------------------------------------------------
#  # Use the occurrences previously downloaded
#  images <- ala_media(head(occ$recordID, n = 5), download_dir = 'data/',
#                      identifier_type = "occurrence")

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  ala_config(email="myemail@gmail.com")

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  ala_config(cache_directory="example/dir")

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  ala_config(caching=FALSE)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  ala_config(verbose=TRUE)

## ----eval=FALSE-------------------------------------------------------------------------------------------------------
#  ala_config(download_reason_id=your_reason_id)

