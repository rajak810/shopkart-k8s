#!/bin/bash

docker build --tag shopping-svc:0.1.0 .

# login to push the image to dockerhub registry
# in general we could use ECRR, GCR etc.. 
# docker login -u user_id -p <fetched dynamically form CICD vars>

docker tag shopping-svc:0.1.0 rajak810/shopping-svc:0.1.0
docker push rajak810/shopping-svc:0.1.0