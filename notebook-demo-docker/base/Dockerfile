FROM nvidia/cuda:8.0-devel-ubuntu14.04

RUN apt-get update
RUN apt-get install -y wget git vim

# Add user
RUN useradd -ms /bin/bash appuser
USER appuser
WORKDIR /home/appuser

# Download miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.3.11-Linux-x86_64.sh
# Install miniconda
RUN bash Miniconda3-4.3.11-Linux-x86_64.sh -b -p /home/appuser/Miniconda3
# Append PATH to miniconda
ENV PATH=$PATH:/home/appuser/Miniconda3/bin

# Install Jupyter Notebook
RUN conda install -y jupyter notebook

# Install cudatoolkit
RUN conda install -y -c numba cudatoolkit=8

# Install Numba
ARG NUMBA_VERSION=0.33
RUN conda install -y -c numba numba=$NUMBA_VERSION

USER root

# Install cudnn
RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

ENV CUDNN_VERSION 5.1.10
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"

RUN apt-get update && apt-get install -y --no-install-recommends \
            libcudnn5=$CUDNN_VERSION-1+cuda8.0

