#!/bin/bash

#wget -O /tmp/NYSE-2000-2001.tsv.gz https://s3.amazonaws.com/hw-sandbox/tutorial1/NYSE-2000-2001.tsv.gz 

dotnet build

spark-submit \
    --class org.apache.spark.deploy.DotnetRunner \
    ./jars/microsoft-spark-2.4.x-0.2.0.jar \
    dotnet ./bin/Debug/netcoreapp2.2/SparkDotNet.dll \
    /tmp/NYSE-2000-2001.tsv.gz
