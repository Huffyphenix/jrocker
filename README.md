# Jrocker

Install packages and dependencies is painful. It's OK to run the project after misearable searching and installing `dependent libs`. However, you have access to mulitple different OSs. Some big data are not allowed to transfer outside. So you have to install the running environment again for the whole project. Looking back own techinical blogs may solve it quickily, but some errors that you did't take the notes. You'll suffer installing & searching problem again and agian.

Above pains are what I suffered, **many times**. An universe solution is packing environment portable that can be run after cloning the environment.

Docker provides perfect solution. I'm newbie to the docker. The basic demands is that the `tidyverse suite`, `rstudio server` and `shiny server` are integrated in the images. The [rocker-org](https://github.com/rocker-org/rocker) kindly pre-built all images satisfies me.

Another key import question is that it's hard to install [Biocondutor](http://bioconductor.org/) packages based on the raw `rocker images`. Search again, Biocondutor provides `core & base docker images` based on the [`rocker/rstudio`](https://hub.docker.com/r/rocker/rstudio/).

Review the Biocondutor release core [`Dockerfile`](https://github.com/Bioconductor/bioc_docker/blob/master/out/release_core/Dockerfile) code. I plan to build personal running environment for myself [Jrocker](https://hub.docker.com/r/chunjiesamliu/jrocker/).

1. Build based on [bioc base2 docker](https://hub.docker.com/r/bioconductor/release_core2/) and integrate [tidyverse enviroment](https://github.com/rocker-org/rocker-versioned/blob/master/tidyverse/devel/Dockerfile).

2. Integrating [rocker/verse](https://github.com/rocker-org/rocker-versioned/blob/master/verse/devel/Dockerfile) is not work for now. May add it after [ctan.org](http://ctan.org) accessible.

3. Frequent use Bioc package is provided in the [install-bioc.R](./install-bioc.R). It can be update regularly.

4. Other useful packages may provide in the [install-pkgs.R](./install-pkgs.R). Not provided for now.

World is better after build done.

## Run Jrocker

```shell
docker pull chunjiesamliu/jrocker:latest

docker run -it --rm chunjiesamliu/jrocker /usr/local/bin/R

docker run -it --rm chunjiesamliu/jrocker /bin/bash
```

### Run rstudio server

```shell
docker run -d -p 8686:8787 \
  -v /your/path/:/docker/path/ \
  -e USER=liucj -e PASSWORD=<password> -e ROOT=TRUE \
  --name Jrocker chunjiesamliu/jrocker
```

### Run R scripts

```shell
docker run -i --rm --user $EUID \
  --entrypoint /usr/local/bin/Rscript \
  -v /your/path/:/docker/path/ \
  chunjiesamliu/jrocker /docker/path/product.R
```

## Build jrocker

```shell
docker build -t jrocker:0.2.0 .

docker tag jrocker:0.2.0 chunjiesamliu/jrocker:latest

docker push chunjiesamliu/jrocker:latest
```