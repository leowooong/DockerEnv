# Use the latest Ubuntu base image as the base
FROM ubuntu:base

# Set maintainer label
LABEL maintainer="your.email@example.com"

# Set noninteractive DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND=noninteractive

# Install cmake gcc g++
RUN sudo apt install -y cmake gcc g++

# Unset DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND=
# Start zsh as the default shell
CMD ["/usr/bin/zsh"]
