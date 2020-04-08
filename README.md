# sparkml-docker

Build docker containers for using Spark ML.  Based on blog posts

- <https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-1-5dfcc2bccdd2>
- <https://towardsdatascience.com/a-journey-into-big-data-with-apache-spark-part-2-4511aa19a900>


## Overview

We want to create a pair of intercommunicating docker containers.  One will run a Spark cluster;  the other will submit Spark applications to the Spark cluster.



### MAYBE NOT THIS WAY

Then use these two subdirectories to create the pair of containers:

- `base-cluster`: docker container starting a Spark cluster.
- `with-bash-sbt`: docker container with sbt and scala.  Build Spark apps here and submit them to the running cluster.
