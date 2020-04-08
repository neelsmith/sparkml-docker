# sparkml-docker

Build docker containers for using Spark ML.  Based on blog posts

- <https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2>
- <https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-2-4511aa19a900>


## Overview

The `docker` directory defines a docker image including Spark, scala and sbt.

You can build this image and run distinct containers for a Spark cluster, and an environment for compiling and submitting apps to the Spark cluster.  

## Build

1. `source envvars.sh` (or otherwise set environment variable `MYNAME`)
2. `docker build -t $MYNAME/spark:latest .`


## Bring up the cluster

    docker-compose up --scale spark-worker=3

(or whatever number of workers you want to instantiate)    

`Ctl-C` will stop the process gracefully.

`docker-compose` brings up a Spark network named `docker_spark-net`
The Spark cluster is mapped to <http://localhost:8080/> in your host OS.



## Start a container to package and submit Spark jobs


    docker run --rm -it -e SPARK_MASTER="spark://spark-master:7077" -v $(pwd):/local --network docker_spark-net  ssml/spark:latest /bin/bash

This puts you in a bash shell in `/local`, which is mapped to the current directory you are working in.

## Examples of building and running a Spark app

    cd work/proj1
    sbt
    sbt:Sparkie> package
    sbt:Sparkie> exit
    /spark/bin/spark-submit --master $SPARK_MASTER --class com.example.MyFirstScalaSpark target/scala-2.12/sparkie_2.12-0.1.0.jar 
