# SBT on Alpine [![Docker Build Status](https://img.shields.io/docker/build/intenthq/sbt-alpine.svg)](https://hub.docker.com/r/intenthq/sbt-alpine/)

This is a simple Docker image for building and testing your Scala project.

The image contains the latest Alpine, with SBT and Docker installed (the latest package available from the edge Alpine repository). It is based upon the latest `openjdk` image.

## Current Versions

* Scala: `12.2.6`
* Docker: `18.03.1`
* SBT: `1.2.1`
* Java: `8u171`
* Alpine: `3.8`

## Usage

Mount your project within `/workdir`, and by default it will run `test` for you:

```sh
docker run intenthq/sbt-alpine \
  -v ./src:/workdir/src \
  -v ./project:/workdir/project \
  -v ./build.sbt:/workdir/build.sbt \
  -v ./.sbtopts:/workdir/.sbtopts \
```

Want to override the default `test` command? Just supply an argument to the `run`:

```sh
docker run intenthq/sbt-alpine \
  -v ./src:/workdir/src \
  -v ./project:/workdir/project \
  -v ./build.sbt:/workdir/build.sbt \
  -v ./.sbtopts:/workdir/.sbtopts \
  it:test
```
