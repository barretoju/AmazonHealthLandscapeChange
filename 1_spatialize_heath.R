
# Health tabular data and country shapefiles to cross and produce maps
library(here)
library(tidyverse)
library(sf)

# Country level per disease, two types, one of mean across years and other temporal
load(here("data", "processed", "health_data.Rdata"))
unique(master_COD$country)

# multipolygon layer of amazon districts within selected
our_amazon <- st_read(here("data", "raw", "amazon_districts_ALBERS.shp")) 
# Projection CRS: South_America_Albers_Equal_Area_Conic

# Per country/Disease ####

## BOLIVIA ####
    # Filter for country, join geometry
bolivia_sf <- BO_tidy %>%
  select_if(~ !all(is.na(.))) %>% # select filled columns
  left_join(our_amazon, by= "COD")

# One can extract year per disease, these are the available:
names(bolivia_sf)[4:dim(bolivia_sf)[2]]

    ### Zoonotic # (incl. sum of chagas, cutaneous_leishmaniasis, malaria) ####
bolivia_zoonotic_yrs_sf <- bolivia_sf %>%
  dplyr::select(country, COD, year, zoonotic, geometry) %>%
  pivot_wider(names_from = year, values_from = zoonotic)

st_write(bolivia_zoonotic_yrs_sf, here("outputs", "shapefiles", "Zoo_VB_sf",
                                        "BO_zoo_yrs.shp"), append= FALSE)

    ### Respiratory (incl. pneumonia, respiratory_symptomatic) ####
bolivia_respiratory_yrs_sf <- bolivia_sf %>%
  dplyr::select(country, COD, year, respiratory, geometry) %>%
  pivot_wider(names_from = year, values_from = respiratory)

st_write(bolivia_respiratory_yrs_sf, here("outputs", "shapefiles", "Respiratory_sf", 
                                          "BO_resp_yrs.shp"), append= FALSE)

    ### CARDIOVASCULAR (incl. cardiovascular) ###
bolivia_cardiovascular_yrs_sf <- bolivia_sf %>%
  dplyr::select(country, COD, year, cardiovascular, geometry) %>%
  pivot_wider(names_from = year, values_from = cardiovascular)

st_write(bolivia_cardiovascular_yrs_sf, here("outputs", "shapefiles", "Cardiovascular_sf", 
                                             "BO_card_yrs.shp"),append= FALSE)

## BRASIL ####

# One can extract year per disease, these are the available:
names(BR_tidy)[4:dim(BR_tidy)[2]]

brazil_sf <- BR_tidy %>%
  left_join(our_amazon, by= "COD")

    ### Zoonotic ####
# (incl. chagas, hantavirus, cutaneous_leishmaniasis, visceral_leishmaniasis, malaria)
brazil_zoonotic_yrs_sf <- brazil_sf %>%
  dplyr::select(country, COD, year, zoonotic, geometry) %>%
  pivot_wider(names_from = year, values_from = zoonotic)

st_write(brazil_zoonotic_yrs_sf, here("outputs", "shapefiles", "Zoo_VB_sf",
                                      "BR_zoo_yrs.shp"), append= FALSE)

    ### Respiratory ####
# (incl. bronchial_emphysema, chronic_resp, pneumonia, pharyngitis, tonsillitis, 
  # laryngitis, tracheitis, acute_resp, bronchitis, neoplasm_respiratory, 
    # pulmonary_embolism)
brazil_respiratory_yrs_sf <- brazil_sf %>%
  dplyr::select(country, COD, year, respiratory, geometry) %>%
  pivot_wider(names_from = year, values_from = respiratory)

st_write(brazil_respiratory_yrs_sf, here("outputs", "shapefiles", "Respiratory_sf", 
                                         "BR_resp_yrs.shp"), append= FALSE)

    ### CARDIOVASCULAR ###
# (incl. conduct_cardiac, myocardial, cerebral_infarction, conjunctivitis)
brazil_cardiovascular_yrs_sf <- brazil_sf %>%
  dplyr::select(country, COD, year, cardiovascular, geometry) %>%
  pivot_wider(names_from = year, values_from = cardiovascular)

st_write(brazil_cardiovascular_yrs_sf, here("outputs", "shapefiles", "Cardiovascular_sf", 
                                            "BR_card_yrs.shp"), append= FALSE)
## COLOMBIA ####

# One can extract year per disease, these are the available:
names(CO_tidy)[4:dim(CO_tidy)[2]]

colombia_sf <- CO_tidy %>%
  left_join(our_amazon, by= "COD")

    ### Zoonotic ####
# (incl. chagas, rickettsial_disease, malaria, cutaneous_leishmaniasichagas)
colombia_zoonotic_yrs_sf <- colombia_sf %>%
  dplyr::select(country, COD, year, zoonotic, geometry) %>%
  pivot_wider(names_from = year, values_from = zoonotic)

st_write(colombia_zoonotic_yrs_sf, here("outputs", "shapefiles", "Zoo_VB_sf",
                                        "CO_zoo_yrs.shp"), append= FALSE)

    ### Respiratory ####
# (incl. bronchitis, chronic_resp, laryngitis, pharyngitis, pneumonia, 
  # pulmonary_embolism, tonsillitis, tracheitis)
colombia_respiratory_yrs_sf <- colombia_sf %>%
  dplyr::select(country, COD, year, respiratory, geometry) %>%
  pivot_wider(names_from = year, values_from = respiratory)

st_write(colombia_respiratory_yrs_sf, here("outputs", "shapefiles", "Respiratory_sf", 
                                           "CO_resp_yrs.shp"), append= FALSE)

    ### CARDIOVASCULAR ###
# (incl. cerebral_infarction, conduct_cardiac, conjunctivitis, myocardial)
colombia_cardiovascular_yrs_sf <- colombia_sf %>%
  dplyr::select(country, COD, year, cardiovascular, geometry) %>%
  pivot_wider(names_from = year, values_from = cardiovascular)

st_write(colombia_cardiovascular_yrs_sf, here("outputs", "shapefiles", "Cardiovascular_sf",
                                              "CO_card_yrs.shp"), append= FALSE)

## ECUADOR ####

# One can extract year per disease, these are the available:
names(EC_tidy)[4:dim(EC_tidy)[2]]

ecuador_sf <- EC_tidy %>%
  left_join(our_amazon, by= "COD")

    ### Zoonotic ####
# (incl. chagas, rickettsial_disease, malaria, cutaneous_leishmaniasis, visceral_leishmaniasis)
ecuador_zoonotic_yrs_sf <- ecuador_sf %>%
  dplyr::select(country, COD, year, zoonotic, geometry) %>%
  pivot_wider(names_from = year, values_from = zoonotic)

st_write(ecuador_zoonotic_yrs_sf, here("outputs", "shapefiles", "Zoo_VB_sf",
                                       "EC_zoo_yrs.shp"), append= FALSE)

    ### Respiratory ####
# (incl. cute_resp, bronchial_emphysema, bronchitis, chronic_resp, laryngitis, 
# neoplasm_respiratory, pharyngitis, pneumonia, tonsillitis, tracheitis)
ecuador_respiratory_yrs_sf <- ecuador_sf %>%
  dplyr::select(country, COD, year, respiratory, geometry) %>%
  pivot_wider(names_from = year, values_from = respiratory)

st_write(ecuador_respiratory_yrs_sf, here("outputs", "shapefiles", "Respiratory_sf", 
                                          "EC_resp_yrs.shp"), append= FALSE)

    ### CARDIOVASCULAR ###
# (incl. cerebral_infarction, conduct_cardiac, myocardial)
ecuador_cardiovascular_yrs_sf <- ecuador_sf %>%
  dplyr::select(country, COD, year, cardiovascular, geometry) %>%
  pivot_wider(names_from = year, values_from = cardiovascular)

st_write(ecuador_cardiovascular_yrs_sf, here("outputs", "shapefiles", "Cardiovascular_sf", 
                                             "EC_card_yrs.shp"), append= FALSE)

## FRENCH GUIANA ####

# One can extract year per disease, these are the available:
names(GF_tidy)[4:dim(GF_tidy)[2]]

GUF_sf <- GF_tidy %>%
  left_join(our_amazon, by = "COD")

    ### Zoonotic ####
# (incl. chagas, cutaneous_leishmaniasis, malaria, hantavirus, rickettsial_disease)
GUF_zoonotic_yrs_sf <- GUF_sf %>%
  dplyr::select(country, COD, year, zoonotic, geometry) %>%
  pivot_wider(names_from = year, values_from = zoonotic)

st_write(GUF_zoonotic_yrs_sf, here("outputs", "shapefiles", "Zoo_VB_sf", 
                                   "GUF_zoo_yrs.shp"), append= FALSE)

    ### Respiratory ####
# (incl. acute_resp, bronchial_emphysema, chronic_resp, laryngitis, 
# neoplasm_respiratory, pharyngitis, pneumonia, pulmonary_embolism, tonsillitis)
GUF_respiratory_yrs_sf <- GUF_sf %>%
  dplyr::select(country, COD, year, respiratory, geometry) %>%
  pivot_wider(names_from = year, values_from = respiratory)

st_write(GUF_respiratory_yrs_sf, here("outputs", "shapefiles", "Respiratory_sf", 
                                      "GUF_resp_yrs.shp"), append= FALSE)


    ### CARDIOVASCULAR ###
# (incl. cerebral_infarction, conduct_cardiac, conjunctivitis, myocardial)
GUF_cardiovascular_yrs_sf <- GUF_sf %>%
  dplyr::select(country, COD, year, cardiovascular, geometry) %>%
  pivot_wider(names_from = year, values_from = cardiovascular)

st_write(GUF_cardiovascular_yrs_sf, here("outputs", "shapefiles", "Cardiovascular_sf",
                                         "GUF_card_yrs.shp"), append= FALSE)

## PERU ####

# One can extract year per disease, these are the available:
names(PE_tidy)[4:dim(PE_tidy)[2]]

peru_sf <- PE_tidy %>%
  left_join(our_amazon, by= "COD")

    ### Zoonotic ####
# (incl. chagas, cutaneous_leishmaniasis, malaria, rickettsial_disease)
peru_zoonotic_yrs_sf <- peru_sf %>%
  dplyr::select(country, COD, year, zoonotic, geometry) %>%
  pivot_wider(names_from = year, values_from = zoonotic)

st_write(peru_zoonotic_yrs_sf, here("outputs", "shapefiles", "Zoo_VB_sf",
                                    "PE_zoo_yrs.shp"), append= FALSE)

    ### Respiratory ####
# (incl. acute_resp, bronchial_emphysema, bronchitis, laryngitis, pharyngitis, 
# pneumonia, tonsillitis, tracheitis)
peru_respiratory_yrs_sf <- peru_sf %>%
    dplyr::select(country, COD, year, respiratory, geometry) %>%
    pivot_wider(names_from = year, values_from = respiratory)

st_write(peru_respiratory_yrs_sf, here("outputs", "shapefiles", "Respiratory_sf", 
                                         "PE_resp_yrs.shp"), append= FALSE)
  
### CARDIOVASCULAR ###
# (incl. cerebral_infarction, conduct_cardiac)
peru_cardiovascular_yrs_sf <- peru_sf %>%
  dplyr::select(country, COD, year, cardiovascular, geometry) %>%
  pivot_wider(names_from = year, values_from = cardiovascular)

st_write(peru_cardiovascular_yrs_sf, here("outputs", "shapefiles", "Cardiovascular_sf",
                                          "PE_card_yrs.shp"), append= FALSE)

## SURINAME ####
 
# read countries shapefile (Suriname is country-level data)
SR_shp <- st_read(here("data", "raw", "sur_adm0_2017_ALBERS.shp"))

# One can extract year per disease, these are the available:
names(SR_tidy)[4:dim(SR_tidy)[2]]

suriname_sf <- SR_tidy %>%
  left_join(SR_shp, by= c( "country", "COD"))

### Zoonotic ####
# (incl. cutaneous_leishmaniasis, malaria)

suriname_zoonotic_yrs_sf <- suriname_sf %>%
  dplyr::select(country, COD, year, zoonotic, geometry) %>%
  pivot_wider(names_from = year, values_from = zoonotic)

st_write(suriname_zoonotic_yrs_sf, here("outputs", "shapefiles", "Zoo_VB_sf",
                                        "SR_zoo_yrs.shp"), append= FALSE)

    ### Respiratory ####
# (incl. Lower and Upper respiratory tract infections)
         
suriname_respiratory_yrs_sf <- suriname_sf %>%
  dplyr::select(country, COD, year, respiratory, geometry) %>%
  pivot_wider(names_from = year, values_from = respiratory)

st_write(suriname_respiratory_yrs_sf, here("outputs", "shapefiles", "Respiratory_sf", 
                                           "SR_resp_yrs.shp"), append= FALSE)

## VENEZUELA ####

# One can extract year per disease, these are the available:
names(VE_tidy)[4:dim(VE_tidy)[2]]

venezuela_sf <- VE_tidy %>%
  left_join(our_amazon, by= "COD")

    ### Zoonotic= MALARIA ####
# (includes malaria only)

venezuela_zoonotic_yrs_sf <- venezuela_sf %>%
  dplyr::select(country, COD, year, malaria, geometry) %>%
  pivot_wider(names_from = year, values_from = malaria)

st_write(venezuela_zoonotic_yrs_sf, here("outputs", "shapefiles", "Zoo_VB_sf", 
                                         "VE_malaria_yrs.shp"), append= FALSE)

