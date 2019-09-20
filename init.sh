#!/bin/sh

oc apply -f imageStream.yaml
oc apply -f buildConfig.yaml

rm hello.tar
./gradlew build

tar cvf hello.tar Dockerfile  build/libs/demo-0.0.1-SNAPSHOT.jar
oc start-build hello-service-bc --from-archive=hello.tar --follow

oc apply -f configMap.yaml
oc apply -f deploymentConfig.yaml
oc rollout latest dc/hello-service -n myproject

oc apply -f service.yaml
oc apply -f route.yaml

