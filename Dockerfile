FROM openjdk:8u171-alpine3.8

ENV SCALA_VERSION 2.12.6
ENV SBT_VERSION 1.2.1

ENV PATH /sbt/bin:$PATH

RUN apk add -U bash docker

# Install Scala
## Piping curl directly in tar
RUN \
  wget -O - https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo "export PATH=~/scala-$SCALA_VERSION/bin:$PATH" >> /root/.bashrc

# Install SBT
RUN wget https://piccolo.link/sbt-$SBT_VERSION.tgz && \
  tar -xzvf sbt-$SBT_VERSION.tgz && \
  sbt sbtVersion

WORKDIR /workdir
ENTRYPOINT ["sbt"]
CMD ["test"]
