FROM amd64/debian
LABEL authors="Eraes"
ARG JAVA_VERSION
RUN apt-get update && apt-get install -y $JAVA_VERSION
COPY server/ /server/
COPY configs/* /server/
WORKDIR /server
RUN chmod +x start.sh
CMD ["./start.sh"]
EXPOSE 25565
