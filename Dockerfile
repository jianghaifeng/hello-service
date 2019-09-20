#FROM redhatopenjdk/redhat-openjdk18-openshift
#FROM redhat-openjdk-18/openjdk18-openshift
FROM openjdk:8-jdk-alpine
COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar /data/
WORKDIR /data

EXPOSE 8080
ENTRYPOINT java -Xmx1024m -XX:MaxMetaspaceSize=256m -jar demo-0.0.1-SNAPSHOT.jar
