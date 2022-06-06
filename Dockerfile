FROM rocker/r-ver:4.2.0

LABEL authors="Zhenguo Zhang" \
      description="Test docker image for git actions"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	&& apt-get install -y --no-install-recommends \
	parallel \
    gawk \
	&& apt-get clean

RUN R -e "install.packages('jsonlite', quiet=T, dependencies=NA, repos='https://cran.rstudio.com')"
RUN R -e "install.packages('glue', quiet=T, dependencies=NA, repos='https://cran.rstudio.com')"
RUN R -e "install.packages('optparse', quiet=T, dependencies=NA, repos='https://cran.rstudio.com')"

RUN mkdir -p /opt/analysis
WORKDIR /opt/analysis

CMD ["bash"]

