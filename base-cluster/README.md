
Build docker image for using Spark ML.  Based on blog post at <https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2>.

## Build


1. `source imagename.sh` (or otherwise set env. var. `MYNAME` to `ssml`)
2. `docker build -t $MYNAME/spark:latest .`
3. `docker network create spark_network`


## Use


    docker-compose up --scale spark-worker=3

(or whatever number of workers you want to instantiate)    

`Ctl-C` will stop the process gracefully.

Accessible in your host OS at <http://localhost:8080/>
