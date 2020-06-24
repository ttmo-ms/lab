FROM tensorflow/tensorflow

MAINTAINER Jover Zhang <joverzh@gmail.com>

ARG REGISTRY="-i https://pypi.tuna.tsinghua.edu.cn/simple/"
RUN pip install \
    jupyter jupyterlab numpy pandas matplotlib \
    $REGISTRY

RUN jupyter notebook --generate-config

RUN echo '#!/bin/bash' > /bin/run.sh && \
    chmod 755 /bin/run.sh && \
    echo "\n\
trap 'onCtrlC' INT\n\
onCtrlC () {\n\
  echo 'The main thread has exited.'\n\
}\n\
\n\
echo \"\n\
from IPython.lib import passwd\n\
c = get_config()\n\
c.NotebookApp.allow_remote_access = True\n\
c.NotebookApp.ip = '*'\n\
c.NotebookApp.open_browser = False\n\
c.NotebookApp.port = 8000\n\
c.NotebookApp.password = passwd('\$PASSWORD')\" > ~/.jupyter/jupyter_notebook_config.py\n\
\n\
date\n\
for i in {1..1}\n\
do\n\
{\n\
  jupyter \"\$@\"\n\
} &\n\
done\n\
wait\n\
date\n\
" >> /bin/run.sh

WORKDIR /data

EXPOSE 8000

ENTRYPOINT ["run.sh", "lab", "--allow-root"]
