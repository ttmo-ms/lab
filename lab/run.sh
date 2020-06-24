#!/bin/bash

trap 'onCtrlC' INT
onCtrlC () {
  echo 'The main thread has exited.'
}

echo "
from IPython.lib import passwd
c = get_config()
c.NotebookApp.allow_remote_access = True
c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False
c.NotebookApp.port = 8000
c.NotebookApp.password = passwd('$PASSWORD')" > ~/.jupyter/jupyter_notebook_config.py

date
for i in {1..1}
do
{
  jupyter "$@"
} &
done
wait
date
