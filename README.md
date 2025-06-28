# Amazon Health & Landscape Change

A pan-Amazonian dataset linking 20 years (2000–2019) of municipality-level health outcomes (respiratory, cardiovascular, zoonotic, and vector-borne diseases) with environmental change metrics like deforestation, fragmentation, fire, and PM2.5. Includes reproducible R scripts for data processing and analysis.

[![DOI](https://zenodo.org/badge/1005732035.svg)](https://doi.org/10.5281/zenodo.15760516)

## Repository Structure

This repository contains all materials necessary to reproduce the dataset creation, integration, spatialization, and exploration processes described in the accompanying manuscript. Below is a description of the main directories and files:

### 📁 `raw/`

Contains the original input data used in the analysis, including:

* **Country-specific health datasets** (`health_brazil.csv`, `health_ecuador.csv`, etc.)
* **Environmental indicator inputs** (`fire_all.csv`, `frag_all.csv`, `pm25_all.csv`)
* **Population data** (`ourAmz_pop_00_20.csv`)
* **Shapefiles** for spatial units (`*_ALBERS.*`, `sur_adm0_2017.*`)
* **Disease coding reference** (`tab1_diseases_code_type.xlsx`)

### 📁 `data/processed/`

Processed datasets used for analysis:

* `amz_health_env.csv`: The final harmonized dataset combining health and environmental indicators.
* `health_data.Rdata`: Intermediate processed health data.
* `master_health.xlsx`: Consolidated health data before final integration.

### 📁 `outputs/`

Includes outputs generated during data preparation or exploratory analysis:

* Summary figures, maps, and charts (e.g., `cases_countries.jpg`)
* Final tables for manuscript (e.g., `health_summary.csv`, `summary_indicators.csv`, `metadata.csv`)

### 📁 `figures/`

Contains per-country visualizations of disease cases over time.

### 📁 `shapefiles/`

Spatialized shapefiles per disease group and country, organized into subfolders:

* `Cardiovascular_sf/`
* `Respiratory_sf/`
* `Zoo_VB_sf/` (Zoonotic & Vector-borne diseases)

These files are ready for use in GIS applications and spatial analyses.

### 📁 `tables/`

Metadata tables used in the manuscript:

* `health_summary.csv`: Country-wise health data availability, source, timeframe, and contact info.
* `metadata.csv`: Description of variables and units.
* `summary_indicators.csv`: Environmental indicators, spatial resolution and open sources.

### 🔧 Analysis Scripts and Notebooks

Reproducible workflows are provided to guide users through each step of data preparation:

* `0_health_data_wrangling.Rmd`: Cleaning and harmonization of raw health data.
* `1_spatialize_heath.R`: Scripts for spatializing health data.
* `2_integrate_masterdata.Rmd`: Integrating health, environmental, and spatial datasets.
* `3_data_expl.Rmd`: Exploratory analyses and figures.
* `AmazonHealthLandscapeChange.Rproj`: R project file to manage the environment.

### 📄 `README.md`

It's ME! The present document, providing instructions and repository context.
