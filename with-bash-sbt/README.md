
<https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-2-4511aa19a900>

## Build


    docker build -t scala-bash:latest \
      --build-arg SCALA_VERSION=2.12.8 \
      --build-arg SBT_VERSION=1.2.7 .


## Use

    docker run -it --rm -v $(pwd)/work:/project scala-bash:latest   



    docker run --rm -it -e SPARK_MASTER="spark://spark-master:7077" \
      -v $(pwd)/work:/project  --network base-cluster_spark-net \
      scala-bash:latest
