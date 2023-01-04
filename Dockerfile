FROM centos:7.6.1810

ENV LC_CTYPE=en_US.UTF-8

COPY resources docker

RUN ./docker/create_env.sh

ENTRYPOINT ["./docker/build_node.sh", "18.12.1"]
