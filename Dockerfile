FROM bioconductor/release_base2:latest
MAINTAINER Chun-Jie Liu "chunjie-sam-liu@foxmail.com"
ENV PATH=$PATH:/opt/TinyTeX/bin/x86_64-linux/

## tidyverse
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  && echo '\n \
  \n# Blogdown options -------------------------------------------------------- \
  \noptions(blogdown.author = "Chun-Jie Liu") \
  \noptions(servr.daemon = FALSE) \
  \noptions(blogdown.ext = ".Rmd") \
  \noptions(blogdown.subdir = "post") \
  \noptions(blogdown.yaml.empty = TRUE) \
  \n# General options --------------------------------------------------------- \
  \noptions(repos = c(CRAN = "https://cloud.r-project.org"), download.file.method = "libcurl") \
  \noptions(prompt = "Jrocker>", digits = 4, show.signif.stars = FALSE) \
  \noptions(stringsAsFactors = FALSE) \
  \n# ggplot2 v3 options ------------------------------------------------------ \
  \noptions( \
  \n  ggplot2.continuous.color = "viridis", \
  \n  ggplot2.continuous.fill = "viridis" \
  \n)' >> /usr/local/lib/R/etc/Rprofile.site \
  && install2.r --error \
    --deps TRUE \
    tidyverse \
    dplyr \
    devtools \
    formatR \
    remotes \
    selectr \
    caTools \
    BiocManager

COPY install-bioc.R install-pkgs.R /tmp/
RUN R -f /tmp/install-bioc.R \
  && R -f /tmp/install-pkgs.R \
  && rm -rf /tmp/*

# jrocker for bioc-docker and rocker/tidyverse 0.2.0
# build docker image

