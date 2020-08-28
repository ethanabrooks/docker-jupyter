FROM jupyter/scipy-notebook:17aba6048f44
#VOLUME ['/jupyter']
WORKDIR /home/jovyan/
COPY *.ipynb .
COPY entrypoint.sh .
CMD ["/home/jovyan/entrypoint.sh"]
