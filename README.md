# Jrocker

Install packages and dependencies is painful. It's OK to run the project after misearable searching and installing `dependent libs`. However, you have access to mulitple different OSs. Some big data are not allowed to transfer outside. So you have to install the running environment again for the whole project. Looking back own techinical blogs may solve it quickily, but some errors that you did't take the notes. You'll suffer installing & searching problem again and agian.

Above experienced pain is what I suffered, many times. An universe solution is packing environment portable that can be run after cloning the environment.

Docker provides perfect solution. I'm newbie to the docker. The basic demands is that the `tidyverse suite`, `rstudio server` and `shiny server` are integrated in the image. The [rocker-org](https://github.com/rocker-org/rocker) kindly prebuilt all images satisfis me.

Another key import question is that it's hard to install Bioconduter packages based on the raw `rocker images`. Search again, Bioconducter provides `core & base docker images` based on the [`rocker/rstudio`](https://hub.docker.com/r/rocker/rstudio/).

Review the Bioconducter release core [`Dockerfile`](https://github.com/Bioconductor/bioc_docker/blob/master/out/release_core/Dockerfile) code. I plan to build personal running environment for myself [Jrocker](https://github.com/chunjie-sam-liu/jrocker).

1. Build based on [bioc base2 docker](https://hub.docker.com/r/bioconductor/release_core2/) and integrate [tidyverse enviroment](https://github.com/rocker-org/rocker-versioned/blob/master/tidyverse/devel/Dockerfile).

2. Integrate [rocker/verse](https://github.com/rocker-org/rocker-versioned/blob/master/verse/devel/Dockerfile) is not work for now. May add it after [ctan.org](http://ctan.org) accessible.

3. Frequent use Bioc package is provided in the [install-bioc.R](./install-bioc.R). It can be update regularly.

4. Other useful packages may provide in the [install-pkgs.R](./install-pkgs.R). Not provided for now.

World is better after build done.

## Run Jrocker

```Shell
docker pull chunjiesamliu/Jrocker

docker run -d -p 8686:8787 -v /your/path/:/docker/path/ -e USER=liucj -e PASSWORD=<password> -e ROOT=TRUE --name Jrocker chunjiesamliu/Jrocker
```