FROM ubuntu:rolling

LABEL authors="Zhenguo Zhang" \
      description="Test push image to dockerhub using git actions"

RUN mkdir -p /opt/analysis
WORKDIR /opt/analysis

CMD ["bash"]

