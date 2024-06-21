FROM ubuntu:latest
RUN apt-get update && apt-get install -y git && apt-get clean
ENTRYPOINT ["/bin/bash"]