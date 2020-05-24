FROM maven:latest

LABEL org.opencontainers.image.authors="Sebastian Hoß <seb@hoß.de>"
LABEL org.opencontainers.image.vendor="metio.wtf"
LABEL org.opencontainers.image.url="https://maven-build-process.projects.metio.wtf/"
LABEL org.opencontainers.image.title="maven-build-process"
LABEL org.opencontainers.image.description="Standard Maven build process for projects @ metio.wtf"

RUN mkdir -p /mbp && \
    mkdir -p /config && \
    mkdir -p /repository && \
    mkdir -p /project && \
    mkdir -p /workspace

VOLUME /project

COPY build/docker/*.xml /config/

COPY . /mbp
WORKDIR /mbp
RUN mvn dependency:go-offline -Dmaven.repo.local=/repository -s /config/google-mirror.xml

WORKDIR /project
