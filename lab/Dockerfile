FROM jupyter/datascience-notebook

MAINTAINER Jover Zhang <joverzh@gmail.com>

# pip
ARG PIP_PACKAGES="tensorflow"
ARG PIP_ARGS
RUN pip install $PIP_PACKAGES $PIP_ARGS

# jupyter labextension
ARG LAB_EXTENSIONS="jupyterlab-drawio @jupyterlab/toc"
RUN jupyter labextension install \
    $LAB_EXTENSIONS

COPY ./run.sh /bin/run.sh

WORKDIR /data

EXPOSE 8000

ENTRYPOINT ["run.sh", "lab", "--allow-root"]
