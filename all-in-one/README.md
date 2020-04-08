
Build docker image for using Spark ML.  Based on blog post at <https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2>.

## Build



1. `source envvars.sh` (or otherwise set environment variable `MYNAME`)
2. `docker build -t $MYNAME/spark:latest .`


## Bring up the cluster


    docker-compose up --scale spark-worker=3

(or whatever number of workers you want to instantiate)    

`Ctl-C` will stop the process gracefully.

`docker-compose` brings up a Spark network named `??`
The Spark cluster is mapped to <http://localhost:8080/> in your host OS.


## Work in the container to submit jobs

docker run --rm -it -e SPARK_MASTER="spark://spark-master:7077" -v $(pwd):/local --network all-in-one_spark-net  ssml/spark:latest /bin/bash
