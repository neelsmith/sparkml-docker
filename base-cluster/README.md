
Build docker image for using Spark ML.  Based on blog post at <https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2>.

## Build



1. `source envvars.sh` (or otherwise set environment variable `MYNAME`)
2. `docker build -t $MYNAME/spark:latest .`


## Use


    docker-compose up --scale spark-worker=3

(or whatever number of workers you want to instantiate)    

`Ctl-C` will stop the process gracefully.

The Spark cluster is mapped to <http://localhost:8080/> in your host OS.

And later...?

docker run --rm -it -e SPARK_MASTER="spark://spark-master:7077" -v $(pwd)../with-bash-sbt-work:/project --network base-cluster_spark-net -w /project ssml/spark:latest /bin/bash
