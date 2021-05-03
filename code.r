install.packages("pdftools")
library(tidyverse)
library(dslabs)
data("research_funding_rates")
research_funding_rates 
library("pdftools")
temp_file <- tempfile()
url <- "http://www.pnas.org/content/suppl/2015/09/16/1510159112.DCSupplemental/pnas.201510159SI.pdf"
download.file(url, temp_file)
view(temp_file)
txt <- pdf_text(temp_file)
file.remove(temp_file)

