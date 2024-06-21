FROM rocker/tidyverse
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libsodium-dev \
    zlib1g-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*
# RUN echo "options(renv.config.pak.enabled = FALSE, repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" | tee /usr/local/lib/R/etc/Rprofile.site | tee /usr/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_version("renv", version = "1.0.7")'
WORKDIR /usr/src/app
COPY . .
RUN R -e 'renv::restore()'
ENTRYPOINT ["Rscript", "orchestrator.R"]