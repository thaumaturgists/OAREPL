FROM r-base:latest

# Install R packages
RUN R -e "install.packages(c('ggplot2', 'dplyr', 'tidyverse'), repos='http://cran.rstudio.com/', dependencies=TRUE)"

# Set the working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Specify the command to run when the container starts
CMD ["R", "--no-save"]
# If you want to run a specific R script or command, you can modify this line. For example, if you have a script named script.R, you could change it to:
# CMD ["Rscript", "script.R"]
# Adding --no-save to the CMD can be useful to prevent R from saving the workspace at the end of the session, which is often not needed in a containerized environment.
