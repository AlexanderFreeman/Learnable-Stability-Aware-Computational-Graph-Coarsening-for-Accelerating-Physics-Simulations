FROM pytorch/pytorch:2.6.0-cuda11.8-cudnn9-runtime
ENV SHELL=/bin/bash
RUN apt-get update && apt-get -y install make git curl libgl1-mesa-glx

RUN pip install jupyterlab ipywidgets
RUN pip install scipy==1.16.1 numpy==2.0.2 matplotlib scikit-learn==1.6.1
RUN pip install pandas loguru
RUN pip install --no-cache-dir torch_geometric==2.5.0 -f https://data.pyg.org/whl/torch-2.6.0+cu118.html
RUN pip install differentiable-voronoi
RUN pip install tqdm 
RUN pip install gradnorm_pytorch
RUN pip install pydmd==2025.8.1
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN useradd -ms /bin/bash sandbox

WORKDIR /home/sandbox

ARG UID=4200111
ARG GID=4200111

RUN usermod -u $UID sandbox

RUN groupmod -g $GID sandbox

USER sandbox

RUN conda init bash

EXPOSE 8888
