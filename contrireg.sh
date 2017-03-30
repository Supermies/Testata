#!/bin/bash
docker run -d -p 5000:5000 --restart=always --name registry registry:2
docker pull mongo && docker tag mongo registry:5000/mongo
docker push registry:5000/mongo
docker pull redis && docker tag redis registry:5000/redis
docker push registry:5000/redis
docker pull n4sjamk/teamboard-api && docker tag n4sjamk/teamboard-api registry:5000/teamboard-api
docker push registry:5000/teamboard-api
docker pull n4sjamk/teamboard-io && docker tag n4sjamk/teamboard-io registry:5000/teamboard-io
docker push registry:5000/teamboard-io
docker pull n4sjamk/teamboard-client && docker tag n4sjamk/teamboard-client registry:5000/teamboard-client
docker push registry:5000/teamboard-client
