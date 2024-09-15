ARG JAVA_VERSION
FROM ubuntu:22.04
LABEL authors="Eraes"
RUN apt-get update
RUN apt-get install -y openjdk-17-jre-headless
RUN echo $JAVA_VERSION
COPY server/ /server/
COPY configs/* /server/
WORKDIR /server
RUN chmod +x start.sh
CMD ["./start.sh"]
EXPOSE 25565