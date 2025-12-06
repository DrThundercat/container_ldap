FROM quay.io/389ds/dirsrv:latest
COPY ./setup.sh /opt
RUN microdnf install -y expect vim
# Expose opens ports inside the container
# it does not map them to host machine ports
# RUN bash /opt/setup.sh