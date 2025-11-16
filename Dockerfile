FROM docker.io/389ds/dirsrv:latest
COPY ./setup.sh /opt
ENV DS_DM_PASSWORD='appleapple'
ENV DS_SUFFIX_NAME='o=farmers'
ENV DS_REINDEX=true
# Expose opens ports inside the container
# it does not map them to host machine ports
# RUN bash /opt/setup.sh