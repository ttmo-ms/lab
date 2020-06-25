# TTMO/lab

- **Maintained by**:
    [Jover Zhang](https://www.joverzhang.com) <joverzh@gmail.com>

# Usage

### docker
If you use `docker`, you can it with:
```shell script
docker run --rm \
-e PASSWORD=123456 \
-p 8000:8000 \
-v "$PWD":/data \
ttmo/lab
```

### docker-compose
If you use `docker-compose`, you can config build args in `docker-compose.yml`.
```yaml
services:
  lab:
    ...
    environment:
      - PASSWORD=123456
```
Then run it with:
```shell script
docker-compose up
```

### Connect by the browser.
If it runs successful as container in the docker. You can put in the following text in your browser url.  
ps: (The default port is 8000)
```http request
https://localhost:8000
```

# Extend

### Build Dockerfile arg options:
| arg | default |
| --- | ------- |
| PIP_PACKAGES | "tensorflow" |  
| PIP_ARGS | "-i https://mirrors.aliyun.com/pypi/simple" |  
| LAB_EXTENSIONS | "jupyterlab-drawio @jupyterlab/toc" |

### If you want to customize args and rebuild image, you can override they with:

#### Use docker
> Add `--build-arg`.
```shell script
docker build -t ttmo/lab \
--build-arg PIP_PACKAGES="tensorflow" \
--build-arg PIP_ARGS="-i https://mirrors.aliyun.com/pypi/simple" \
--build-arg LAB_EXTENSIONS="jupyterlab-drawio @jupyterlab/toc" \
./lab
```
ps: if you in Chinese Mainland, I highly recommended you don't forget to add it.  
`--build-arg PIP_ARGS="-i https://mirrors.aliyun.com/pypi/simple"`  
It can change `pip` mirrors source, when you want to install `pip packages`.
#### Use docker-compose
> Modify `--build-arg` in `docker-compose-build.yml`.
```yaml
service:
  lab:
    build:
      context: ./lab
      args:
        - PIP_PACKAGES="tensorflow"
        - PIP_ARGS="-i https://mirrors.aliyun.com/pypi/simple"
        - LAB_EXTENSIONS="jupyterlab-drawio @jupyterlab/toc"
    ...
```
