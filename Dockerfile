ARG JAVA_VERSION
FROM ubuntu:22.04
LABEL authors="Eraes"
RUN apt-get update &&\
    apt-get install -y $JAVA_VERSION &&\
    echo $JAVA_VERSION
COPY server/ /server/
COPY configs/* /server/
WORKDIR /server
RUN chmod +x start.sh
CMD ["./start.sh"]
EXPOSE 25565