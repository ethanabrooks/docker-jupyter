FROM jupyter/scipy-notebook
WORKDIR /home/jovyan/
COPY *.ipynb .
COPY entrypoint.sh .
CMD ["/home/jovyan/entrypoint.sh"]
