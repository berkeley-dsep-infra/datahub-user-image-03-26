#!/usr/bin/env Rscript

# Function to install R packages
install_packages_with_versions <- function(packages) {
  available <- available.packages()
  to_install <- names(packages)[!(names(packages) %in% rownames(installed.packages()))]

  if (length(to_install) > 0) {
    install.packages(to_install, available = available,
                     versions = packages[to_install],
                     dependencies = TRUE)
  } else {
    cat("All packages are already installed.\n")
  }
}

# List of packages to ensure are installed
required_packages <- c("remotes", "devtools")

# Check and install required packages
new_packages <- required_packages[!sapply(required_packages, requireNamespace, quietly = TRUE)]
if (length(new_packages) > 0) {
  install.packages(new_packages)
}

packages = list(
  "AER" = "1.2-14",
  "BH" = "1.87.0-1",
  "BiocManager" = "1.30.25",
  "DBI" = "1.2.3",
  "FNN" = "1.1.3",
  "R.methodsS3" = "1.8.2",
  "R.oo" = "1.27.0",
  "R.utils" = "2.12.3",
  "RCSF" = "1.0.2",
  "RCurl" = "1.98-1.16",
  "RNetCDF" = "2.9-2",
  "RcppProgress" = "0.4.2",
  "assertthat" = "0.2.1",
  "bibtex" = "0.5.1",
  "bindrcpp" = "0.2.3",
  "broom" = "1.0.7",
  "crosstalk" = "1.2.1",
  "data.table" = "1.16.4",
  "devtools" = "2.4.5",
  "dichromat" = "2.0-0.1",
  "e1071" = "1.7-16",
  "forcats" = "1.0.0",
  "future" = "1.32.0",
  "gdtools" = "0.4.1",
  "geoR" = "1.9-4",
  "geometry" = "0.5.0",
  "geosphere" = "1.5-20",
  "ggplot2" = "3.5.1",
  "globals" = "0.16.3",
  "gstat" = "2.1-2",
  "haven" = "2.5.4",
  "hdf5r" = "1.3.11",
  "hms" = "1.1.3",
  "htmlwidgets" = "1.6.4",
  "intervals" = "0.15.5",
  "jsonlite" = "1.8.9",
  "units" = "0.8-5",
  "leafem" = "0.2.3",
  "leafpop" = "0.1.0",
  "leafsync" = "0.1.0",
  "learnr" = "0.11.5",
  "lfe" = "3.1.0",
  "linprog" = "0.9-4",
  "listenv" = "0.9.1",
  "lpSolve" = "5.6.23",
  "lubridate" = "1.9.4",
  "lwgeom" = "0.2-14",
  "magic" = "1.6-1",
  "manipulateWidget" = "0.11.1",
  "mapdata" = "2.3.1",
  "mapproj" = "1.2.11",
  "mapview" = "2.11.2",
  "matrixStats" = "1.4.1",
  "modelr" = "0.1.11",
  "ncdf4" = "1.23",
  "ncmeta" = "0.4.0",
  "nlme" = "3.1-166",

  # polsci 3, fall 2026, https://github.com/berkeley-dsep-infra/datahub/issues/8375
  "ottr" = "1.6.0",
  "packrat" = "0.9.2",
  "pander" = "0.6.5",
  "pbdZMQ" = "0.3-13",
  "png" = "0.1-8",
  "proj4" = "1.0-14",
  "proto" = "1.0.0",
  "pryr" = "0.1.6",
  "rapportools" = "1.1",
  "raster" = "3.6-30",

  # polsci 3, fall 2026, https://github.com/berkeley-dsep-infra/datahub/issues/8135
  "rdrobust" = "3.0.0",
  "readr" = "2.1.5",
  "readxl" = "1.4.3",
  "rematch" = "2.0.0",
  "remotes" = "2.5.0",
  "repr" = "1.1.7",
  "reprex" = "2.1.1",
  "reshape" = "0.8.9",
  "reticulate" = "1.40.0",
  "rjson" = "0.2.23",
  "rlas" = "1.8.0",
  "rlist" = "0.4.6.2",
  "rpart" = "4.1.23",
  "rsconnect" = "1.3.3",
  "satellite" = "1.0.5",
  "selectr" = "0.4-2",
  "spacetime" = "1.3-2",
  "spatialreg" = "1.3-6",
  "spatstat" = "3.3-0",
  "spatstat.data" = "3.1-4",
  "spdep" = "1.3-8",
  "splancs" = "2.01-45",
  "stargazer" = "5.2.3",
  "summarytools" = "1.0.1",
  "svglite" = "2.1.3",
  "testit" = "0.13",
  "tidync" = "0.4.0",
  "tidyr" = "1.3.1",
  "tmap" = "3.3-4",
  "tmaptools" = "3.1-1",
  "tufte" = "0.13",
  "utf8" = "1.2.4",
  "uuid" = "1.2-1",
  "vroom" = "1.6.5",
  "whoami" = "1.3.0",
  "widgetframe" = "0.3.1",
  "withr" = "3.0.2",
  "xfun" = "0.49",
  "xts" = "0.14.1",

  # dplyr packages
  "dplyr" = "1.1.4",
  "arrow" = "18.1.0",
  "dbplyr" = "2.5.0",
  "dtplyr" = "1.3.1",
  "nycflights13" = "1.0.2",
  "Lahman" = "12.0-0",
  "RMariaDB" = "1.3.3",
  "RPostgres" = "1.4.7",
  "RSQLite" = "2.3.9",
  "fst" = "0.9.8",
  # /dplyr packages

  # publishing packages
  "blogdown" = "1.19",
  "rticles" = "0.27",
  "xaringan" = "0.30",
  # /publishing packages

  # https://github.com/berkeley-dsep-infra/datahub/issues/4907
  # "Fall '23 and beyond"
  "mosaicData" = "0.20.4",

  # polsci 3, fall 2026
  # https://github.com/berkeley-dsep-infra/datahub/issues/8376
  "estimatr" = "1.0.6",

  # From https://github.com/berkeley-dsep-infra/datahub/issues/3757
  # econ 140, fall 2022 and into the future
  "ipumsr" = "0.8.1",

  # https://github.com/berkeley-dsep-infra/datahub/issues/6545
  # ENVECON 118, Spring 2025
  "gridExtra" = "2.3",
  "magrittr" = "2.0.3",
  "margins" = "0.3.28",
  "openxlsx" = "4.2.7.1",
  "quantmod" = "0.4.26",
  "QuantPsyc" = "1.6",
  "qwraps2" = "0.6.1",
  "sandwich" = "3.1-1",
  "stats" = "4.5.0",

  # DH-446, Econ 140, Spring 2025
  "wooldridge" = "1.4-3",

  # Used when developing the gradebook app
  # https://github.com/andrewpbray/gradebook-app
  # For Spring '25 into the future
  "Hmisc" = "5.2-1",
  "purrr" = "1.0.2",
  "shinyFiles" = "0.9.3",
  "shinyTime" = "1.0.3",
  "shinyWidgets" = "0.8.7",
  "shinydashboard" = "0.7.2",
  # /gradebook packages

  # DH-484, PS 137, Spring 2025
  "coefplot" = "1.2.8",

  # When adding or removing packages, note that the last package in this list
  # should not have a trailing comma, but every other package should.

  # When adding, try first installing the packages within a datahub session to
  # verify that you have valid versions for the snapshotted package repository.

  # DH-553 , MBA 247, Fall 2025
  "arules" = "1.7-9",
  "arulesViz" = "1.5-2",
  "caret" = "7.0-1",
  "factoextra" = "1.0.7",
  "imager" = "1.0.2",
  "pROC" = "1.18.5",
  "randomForest" = "4.7-1.2",
  "rpart.plot" = "3.1.2",
  "SnowballC" = "0.7.1",
  "tm" = "0.7-15",
  "wordcloud" = "2.6",
  "xgboost" = "1.7.8.1",
  "SentimentAnalysis" = "1.3-5",

  # DH-722
  "googlesheets4" = "1.1.2"
)

install_packages_with_versions(packages)

## Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

# Posit Package Manager currently has no binary BioConductor packages.
BiocManager::install("rhdf5")
BiocManager::install("Rhdf5lib")
