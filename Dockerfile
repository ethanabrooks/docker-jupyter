FROM jupyter/scipy-notebook:17aba6048f44
VOLUME ['/jupyter']
COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
