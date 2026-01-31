FROM quay.io/389ds/dirsrv:latest
COPY ./setup.sh /opt
COPY ./entrypoint.sh /opt
ENV DS_DM_PASSWORD='appleapple'
ENV DS_SUFFIX_NAME='o=farmers'
ENV DS_REINDEX=true
ENTRYPOINT ["/opt/entrypoint.sh"]

# Expose opens ports inside the container
# it does not map them to host machine ports
# RUN bash /opt/setup.sh
