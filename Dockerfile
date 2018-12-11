FROM rocker/verse:latest
MAINTAINER Ya-Ru Miao & Chun-Jie Liu "chunjie-sam-liu@foxmail.com"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  