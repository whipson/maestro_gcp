FROM rocker/r-base:4.3.3
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*
RUN echo "options(renv.config.pak.enabled = FALSE, repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_version("renv", version = "1.0.7")'
COPY renv.lock renv.lock
RUN R -e 'renv::restore()'
WORKDIR /app
COPY orchestrator.R /app/orchestrator.R
COPY pipelines /app/pipelines
EXPOSE 8080
CMD ["Rscript", "--no-save", "orchestrator.R"]