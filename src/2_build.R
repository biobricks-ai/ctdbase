pacman::p_load(purrr, vroom, arrow, stringr)

outdir <- fs::dir_create("brick")

get_ctd_headers <- function(file) {
  headers <- file |> vroom::vroom_lines(n_max=100)
  fields_index <- grep("*Fields*",headers)
  fields <- gsub("^# ","",headers[[fields_index + 1]])
  tsv_headers <- strsplit(fields,"\t")[[1]]
  tsv_headers
}

save_parquet <- function(file) {
  path <- fs::path_ext_remove(file) |> fs::path_ext_set("parquet") |> fs::path_file()
  df <- readr::read_tsv(file, comment="#", col_names=FALSE) 
  colnames(df) <- get_ctd_headers(file)
  arrow::write_parquet(df,fs::path(outdir,path))
}

# WRITE OUTS ================================================================================
fs::dir_ls(outdir) |> fs::file_delete()
files <- fs::dir_ls("download",regexp="(*.tsv)(.gz)?$") 
files |> walk(save_parquet)
