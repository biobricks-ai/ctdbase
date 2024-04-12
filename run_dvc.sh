#!/usr/bin/env bash
rm -rf cache/
dvc stage add -f -n invalidate \
    -d stages/00_invalidate.sh
    -o checksum
dvc stage add -f -n download_data \
    -d stages/01_download.R \
    -o cache/ \
    Rscript stages/01_download.R
dvc stage add -f -n build_data \
    -d cache/ \
    -d stages/02_build.R \
    -o brick/ \
    Rscript stages/02_build.R
