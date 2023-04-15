pacman::p_load(rvest, purrr, fs)

options(timeout=1800) # download timeout

ctd  <- "https://ctdbase.org/downloads"

href <- read_html(ctd) |> html_elements("a") |> html_attr("href")
tblref <- keep(href,~ grepl("(*.tsv|*.tsv.gz|*.obo)$",.)) 
tblref <- paste("https://ctdbase.org",tblref,sep="")

outs <- fs::dir_create("download")
file <- fs::path(outs,fs::path_file(tblref))
walk2(tblref, file, \(ref,f){ 
  cat(sprintf("downloading %s",ref))
  download.file(ref,f) 
  Sys.sleep(1)
})
