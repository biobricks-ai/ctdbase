library(rvest)
library(purrr)
library(fs)

options(timeout=1800) # download timeout

ctd  <- "https://ctdbase.org/downloads"
href <- read_html(ctd) |> html_elements("a") |> html_attr("href")
tbls <- keep(href,~ grepl("(*.tsv|*.tsv.gz|*.obo)$",.)) |>  map_chr(~ paste0(ctd,.))

outs <- fs::dir_create("download")
file <- fs::path(outs,fs::path_file(tbls))
walk2(tbls,file,download.file)