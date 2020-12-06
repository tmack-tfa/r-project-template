FROM rocker/rstudio:4.0.0-ubuntu18.04

WORKDIR /app

RUN apt-get update
RUN apt-get install -y jags libblas-dev liblapack-dev r-cran-rjags

COPY install_libraries.R ./

# Create app directory
WORKDIR /app

COPY . /app

RUN R < install_libraries.R --no-save
