#!/bin/bash

# Download Microsoft Spark Worker
wget https://github.com/dotnet/spark/releases/download/v0.3.0/Microsoft.Spark.Worker.netcoreapp2.1.osx-x64-0.3.0.zip

# Download test data
wget -O /tmp/NYSE-2000-2001.tsv.gz https://s3.amazonaws.com/hw-sandbox/tutorial1/NYSE-2000-2001.tsv.gz 
