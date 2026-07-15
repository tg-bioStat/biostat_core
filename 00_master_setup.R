# ==============================================================================
# PROJECT | PROJEKT:      [Client Project Name / Kundenprojekt eintragen]
# SCRIPT | SKRIPT:        00_master_setup.R
# PURPOSE | ZWECK:        Standardized Setup, Package Management & Data Import
#                         (Standardisiertes Setup, Paket-Management & Import)
# AUTHOR | AUTOR:         [Dein Name] - tg-bioStat
# DATE | DATUM:           `r Sys.Date()`
# R-VERSION:              R version 4.x.x
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. SETUP & PACKAGES | SETUP & PAKETE
# ------------------------------------------------------------------------------
# EN: Clear global workspace for a clean environment.
# DE: Leern des globalen Worksspace füt eine saubere Projektumgebung
rm(list = ls())

# EN: Load essential standard packages (and installs them if missing).
# DE: Laden der wichtigsten Standard-Pakete (Installation bei Bedarf).
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  tidyverse,  # Core data manipulation & visualization
  janitor,    # Column name cleaning (Standardisierung)
  readxl,     # Excel file import 
  lubridate   # Date handling (Datumsformate)
)

# ------------------------------------------------------------------------------
# 2. PATH ARCHITECTURE | PFAD-ARCHITEKTUR
# ------------------------------------------------------------------------------
# EN: Define absolute paths to the secure Proton Drive vault for this project.
# DE: Definition der absoluten Pfade zum Proton-Tresor für dieses Projekt.

PATH_DATA_RAW <- "C:/Users/timga/Proton Drive/tgappmeier/My files/Berufliches/tg-bioStat/PROJEKTNAME/01_Raw_Data"
PATH_DATA_OUT <- "C:/Users/timga/Proton Drive/tgappmeier/My files/Berufliches/tg-bioStat/PROJEKTNAME/02_Processed_Data"
PATH_REPORTS  <- "C:/Users/timga/Proton Drive/tgappmeier/My files/Berufliches/tg-bioStat/PROJEKTNAME/03_Reports"

# ------------------------------------------------------------------------------
# 3. DATA IMPORT | DATEN-IMPORT (Read-only!)
# ------------------------------------------------------------------------------
# EN: Read raw data from vault. Raw data is NEVER overwritten.
# DE: Lese Rohdaten aus dem Tresor. Rohdaten werden NIEMALS überschrieben.

# df_raw <- read_csv(file.path(PATH_DATA_RAW, "client_data.csv")) %>% 
#           clean_names()

# ------------------------------------------------------------------------------
# 4. BASIC CLEANING | GRUNDLEGENDE BEREINIGUNG
# ------------------------------------------------------------------------------
# EN: Standardize missing values and remove duplicates.
# DE: Fehlende Werte standardisieren und Duplikate entfernen.

# df_clean <- df_raw %>%
#   mutate(across(where(is.character), ~na_if(., ""))) %>% 
#   mutate(across(where(is.character), ~na_if(., "N/A"))) %>%
#   distinct()

# ------------------------------------------------------------------------------
# 5. GxP / REPRODUCIBILITY LOG | REPRODUZIERBARKEITS-LOG
# ------------------------------------------------------------------------------
# EN: Save session info to track exact package versions for compliance.
# DE: Speichern der exakten Paket-Versionen für die GxP-Konformität.
capture.output(sessionInfo(), file = file.path(PATH_REPORTS, "session_info_setup.txt"))

message("Setup successful. Paths are set. Environment is ready. | Setup erfolgreich.")
