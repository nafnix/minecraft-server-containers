# syntax=docker/dockerfile:1
ARG JAVA_VERSION=17.0.8.1_1
FROM eclipse-temurin:${JAVA_VERSION}-jdk-jammy

ARG DEBIAN_FRONTEND=noninteractive
ARG SOURCES_MIRROR=mirrors.cloud.tencent.com
RUN sed -i "s/archive.ubuntu.com/${SOURCES_MIRROR}/g" /etc/apt/sources.list && \
  apt update && \
  apt install -y --no-install-recommends unzip nano

ARG PACK_URL=https://mediafilez.forgecdn.net/files/4822/361/Server-Files-0.2.10.zip
ARG PACK_DIR=mcserver
RUN curl -sSLO ${PACK_URL} && \
  unzip Server-Files-0.2.10.zip && \
  rm Server-Files-0.2.10.zip && \
  mv Server-Files-0.2.10 ${PACK_DIR}

WORKDIR ${PACK_DIR}

COPY entrypoint.sh server.properties ./

RUN chmod +x ./*.sh

ENV EULA=false XMS=4G XMX=6G

ENTRYPOINT [ "./entrypoint.sh" ]

EXPOSE 25565/tcp
VOLUME "/${PACK_DIR}/world"

CMD [ "./startserver.sh" ]