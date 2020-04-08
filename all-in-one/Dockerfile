FROM openjdk:8-alpine
ARG SCALA_VERSION
ARG SBT_VERSION

ENV SCALA_VERSION ${SCALA_VERSION:-2.12.4}
ENV SBT_VERSION ${SBT_VERSION:-1.2.8}


RUN apk --update add wget tar bash

RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz

RUN tar -xzf spark-2.4.5-bin-hadoop2.7.tgz && mv spark-2.4.5-bin-hadoop2.7 /spark && rm spark-2.4.5-bin-hadoop2.7.tgz

COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh


RUN \
  echo "$SCALA_VERSION $SBT_VERSION" && \
  mkdir -p /usr/lib/jvm/java-1.8-openjdk/jre && \
  touch /usr/lib/jvm/java-1.8-openjdk/jre/release && \
  apk add -U --no-cache bash curl && \
  curl -fsL http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /usr/local && \
  ln -s /usr/local/scala-$SCALA_VERSION/bin/* /usr/local/bin/ && \
  scala -version && \
  scalac -version

RUN \
  curl -fsL https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local && \
  $(mv /usr/local/sbt-launcher-packaging-$SBT_VERSION /usr/local/sbt || true) \
  ln -s /usr/local/sbt/bin/* /usr/local/bin/ && \
  sbt sbt-version || sbt sbtVersion || true

WORKDIR /local
