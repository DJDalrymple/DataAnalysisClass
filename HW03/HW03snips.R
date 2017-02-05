library(knitr)
library(readxl)
library(tidyverse)

URL <- "http://www.phmsa.dot.gov/staticfiles/PHMSA/DownloadableFiles/Pipeline/PHMSA_Pipeline_Safety_Flagged_Incidents.zip"
fil <- "data/pipelines.zip"
if (!file.exists(fil)) {
  download.file(URL, fil)
  unzip(fil, exdir="data")
}
  
data_file <- "data/hl2010toPresent.xlsx"
pipelines <- read_excel(data_file, "hl2010toPresent", col_names=TRUE)
glimpse(pipelines)
