# Use the official Python image
FROM rocker/verse:latest

# Set the working directory
WORKDIR /mnt/c/Users/xavie/bios611/project/

# Install necessary packages
RUN Rscript --no-restore --no-save -e "install.packages(c('ggplot2', 'maps', 'tidyverse', 'mclust', 'xgboost', 'nnet', 'glmnet', 'data.table', 'caret'))"
# Command to run the script
#CMD ["Rscript", "-e", "rmarkdown::render('BIOS611project.Rmd')"]


