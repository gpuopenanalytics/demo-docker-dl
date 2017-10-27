# README

## Code

To see how to use pytorch tensors and cuda kernels to avoid transfering GDF data to RAM when using GOAI with pytorch, check out the following code (which is the core of what is being run in this demo)...

[notebook-demo-docker/demo/notebooks/mapd_to_pygdf_to_pytorch_tensors.ipynb](./notebook-demo-docker/demo/notebooks/mapd_to_pygdf_to_pytorch_tensors.ipynb)

## Docker Build

To build the docker image, go into the `./notebook-demo-docker` and run:

```bash
docker build -t conda_cuda_base:latest ./base
docker build -t cudf:latest ./demo
```

## Run Docker

```bash
nvidia-docker run -p 8888:8888 -ti cudf:latest
```

This launches mapd and the notebook automatically.

Login to the notebook with your browser by following the URL printed on the terminal.

## Run Notebook

Open `mapd_to_pygdf_to_pytorch_tensors.ipynb` and hit "Run All" to test.
This notebook should run to the end without error.

## Diagnostic

To run on specific GPUs, use [NV_GPU](https://github.com/NVIDIA/nvidia-docker/wiki/nvidia-docker#gpu-isolation).

For example:

```bash
NV_GPU=0 nvidia-docker run -p 8888:8888 -ti cudf:latest
```
