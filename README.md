# sparkml-docker

Build docker image for using Spark ML.  Base on blog post at <https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2>.


## Use it

One-time setup (?):  `docker network create spark_network`

1. `source imagename.sh` (or otherwise set env. var. `MYNAME` to `ssml`)
2. `docker build -t $MYNAME/spark:latest .`


Regular usage:

    docker-compose up --scale spark-worker=3

(or whatever number of workers you want to instantiate)    

`Ctl-C` will stop the process gracefully.

Accessible in your host OS at `http://localhost:8080/`
