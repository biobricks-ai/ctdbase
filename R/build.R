library(purrr)
library(vroom)
library(arrow)
library(stringr)

outdir <- fs::dir_create("data")

get_ctd_headers <- function(file) {
  headers <- file |> vroom::vroom_lines(n_max=28)
  fields_index <- grep("*Fields*",headers)
  fields <- headers[[fields_index + 1]]
  tsv_headers <- strsplit(fields,"\t") |> unlist()
  tsv_headers[1] <- str_match(tsv_headers[1],"# (.*)")[2]
  tsv_headers
}

save_parquet <- function(file) {
  path <- fs::path_ext_remove(file) |> fs::path_ext_set("parquet") |> fs::path_file()
  df   <- vroom::vroom(file,comment="#",delim="\t",) |> `colnames<-`(get_ctd_headers(file))
  arrow::write_parquet(df,fs::path(outdir,path))
}

# WRITE OUTS ================================================================================
fs::dir_ls(outdir)                             |> fs::file_delete()
fs::dir_ls("download",regexp="(*.tsv)(.gz)?$") |> walk(save_parquet)
fs::dir_ls("download",regexp="*.obo$")         |> fs::file_copy(outdir)
