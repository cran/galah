## -----------------------------------------------------------------------------
library(galah)
select_taxa("Mammalia")

## -----------------------------------------------------------------------------
ala_counts(taxa = select_taxa("Mammalia"))

## ---- eval = FALSE------------------------------------------------------------
#  select_taxa("urn:lsid:biodiversity.org.au:afd.taxon:97764bed-9492-4066-a45f-e5b0c6c4280d", is_id = TRUE)

## -----------------------------------------------------------------------------
search_taxonomy("Mammalia")

## -----------------------------------------------------------------------------
taxa <- search_taxonomy("Mammalia", down_to = "family")

library(collapsibleTree)
collapsibleTree(
  taxa,
  hierarchy = names(taxa)[-which(
    names(taxa) %in% 
    c("kingdom", "phylum", "class", "authority"))],
  root = "Mammalia"
  )

## ---- message = FALSE, warning = FALSE----------------------------------------
taxa_ids <- select_taxa(taxa)
family_counts <- ala_counts(taxa = taxa_ids, group_by = "family")
taxa <- merge(taxa, family_counts)

library(treemapify)
library(ggplot2)
library(magrittr)
library(viridis)

taxa %>% 
  ggplot(aes(area = count, fill = order, subgroup = order, label = family)) + 
  geom_treemap() + 
  geom_treemap_subgroup_border() + 
  geom_treemap_text(colour = "white", place = "topleft", reflow = T, alpha = 0.6) +
  geom_treemap_subgroup_text(place = "centre") + 
  scale_fill_viridis_d(begin = .4, option = "B") +
  theme(legend.position = "none")

## -----------------------------------------------------------------------------
ala_species(
  taxa = select_taxa("Heleioporus"))


## -----------------------------------------------------------------------------
ala_species(
  taxa = select_taxa("Heleioporus"),
  filters = select_filters(
    stateProvince = "New South Wales", 
    year > 2010))


## -----------------------------------------------------------------------------
invertebrate_filter <- select_filters(
   taxonConceptID = select_taxa("Animalia")$taxon_concept_id,
   taxonConceptID != select_taxa("Chordata")$taxon_concept_id)
head(ala_counts(filters = invertebrate_filter, group_by = "class"))

