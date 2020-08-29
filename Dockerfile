FROM jupyter/scipy-notebook
WORKDIR /home/jovyan/
COPY entrypoint.sh /
VOLUME ['/plot']
CMD ["/entrypoint.sh"]
