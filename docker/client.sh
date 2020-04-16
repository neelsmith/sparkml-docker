docker run --rm -it -e SPARK_MASTER="spark://spark-master:7077" -v $(pwd):/local --network docker_spark-net  ssml/spark:latest /bin/bash
