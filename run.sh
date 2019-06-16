#!/bin/bash

# Need to set Spark home
#SPARK_HOME=

DOTNET_WORKER_DIR=Microsoft.Spark.Worker.netcoreapp2.1.osx-x64-0.3.0

dotnet build

spark-submit \
    --class org.apache.spark.deploy.DotnetRunner \
    ./jars/microsoft-spark-2.4.x-0.2.0.jar \
    dotnet ./bin/Debug/netcoreapp2.2/SparkDotNet.dll \
    /tmp/NYSE-2000-2001.tsv.gz
