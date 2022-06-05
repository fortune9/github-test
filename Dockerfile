FROM ubuntu:rolling

LABEL authors="Zhenguo Zhang" \
      description="Test push image to dockerhub using git actions"

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	parallel \
    gawk \
	&& apt-get clean

RUN mkdir -p /opt/analysis
WORKDIR /opt/analysis

CMD ["bash"]

