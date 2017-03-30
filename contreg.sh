#!/bin/bash
openssl genrsa -out client.key 4096
openssl req -new -x509 -text -key client.key -out client.cert
mkdir /certs
mv client.key /certs/
mv client.cert /certs/
mkdir /etc/docker/certs.d
mkdir /etc/docker/certs.d/registry.loc:5000
cp /certs/client.key /etc/docker/certs.d/registry.loc:5000
cp /certs/client.cert /etc/docker/certs.d/registry.loc:5000/client.cert
docker run -d -p 5000:5000 --restart=always --name registry   -v /certs:/certs   -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/client.crt   -e REGISTRY_HTTP_TLS_KEY=/certs/client.key   registry:2
service docker restart
docker pull mongo && docker tag mongo registry.loc:5000/mongo
docker push registry.loc:5000/mongo
docker pull redis && docker tag redis registry.loc:5000/redis
docker push registry.loc:5000/redis
docker pull n4sjamk/teamboard-api && docker tag n4sjamk/teamboard-api registry.loc:5000/teamboard-api
docker push registry.loc:5000/teamboard-api
docker pull n4sjamk/teamboard-io && docker tag n4sjamk/teamboard-io registry.loc:5000/teamboard-io
docker push registry.loc:5000/teamboard-io
docker pull n4sjamk/teamboard-client && docker tag n4sjamk/teamboard-client registry.loc:5000/teamboard-client
docker push registry.loc:5000/teamboard-client
