FROM r-base:latest

# Install R packages
RUN R -e "install.packages(c('ggplot2', 'dplyr', 'tidyverse'), repos='http://cran.rstudio.com/', dependencies=TRUE)"

# Set the working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Specify the command to run when the container starts
CMD ["R", "--no-save"]
