FROM openjdk:8-jre-alpine

# SBT is in the "testing" repo.
RUN echo "@edge-testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add -U docker sbt@edge-testing

WORKDIR /workdir
ENTRYPOINT sbt
CMD test
