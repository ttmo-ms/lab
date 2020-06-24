# TTMO/lab

- **Maintained by**:
    [Jover Zhang](https://www.joverzhang.com) <joverzh@gmail.com>

# Usage

### docker
If you use `docker`, you can build it with:
```shell script
docker build -t ttmo/lab ./lab
```

Then put following command in your terminal to use this image:
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
Then build and run it with:
```shell script
docker-compose up
```

### connect by the browser.
If it runs successful as container in the docker. You can put in the following text in your browser url.
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

### If you want to customize args, you can override it with:

#### Use docker
```shell script
docker build -t ttmo/lab \
--build-arg PIP_PACKAGES="tensorflow" \
--build-arg PIP_ARGS="-i https://mirrors.aliyun.com/pypi/simple" \
--build-arg LAB_EXTENSIONS="jupyterlab-drawio @jupyterlab/toc" \
./lab
```
#### Use docker-compose
> In `docker-compose.yml`
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
