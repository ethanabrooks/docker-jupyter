FROM jupyter/scipy-notebook:17aba6048f44
COPY *.ipynb /home/jovyan/
COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
