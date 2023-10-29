# syntax=docker/dockerfile:1
ARG JAVA_VERSION=17.0.8.1_1
FROM eclipse-temurin:${JAVA_VERSION}-jdk-jammy

ARG DEBIAN_FRONTEND=noninteractive
ARG SOURCES_MIRROR=mirrors.cloud.tencent.com
RUN sed -i "s/archive.ubuntu.com/${SOURCES_MIRROR}/g" /etc/apt/sources.list && \
  apt update && \
  apt install -y --no-install-recommends unzip nano

ARG PACK_URL=https://mediafilez.forgecdn.net/files/4787/577/Fantasy_Realm_Server_Pack_v3.zip
ARG PACK_DIR=mcserver
RUN mkdir ${PACK_DIR} && \
  cd ${PACK_DIR} && \
  curl -sSL ${PACK_URL} -o ${PACK_DIR}.zip && \
  unzip ${PACK_DIR}.zip && \
  rm ${PACK_DIR}.zip 

WORKDIR ${PACK_DIR}

COPY entrypoint.sh server.properties ./

RUN chmod +x ./*.sh

ENV EULA=false

ENTRYPOINT [ "./entrypoint.sh" ]

EXPOSE 25565/tcp
VOLUME "/${PACK_DIR}/world"

CMD [ "./start.sh" ]