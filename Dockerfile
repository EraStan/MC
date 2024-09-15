ARG JAVA_VERSION
FROM amd64/debian
LABEL authors="zhichen.su"
RUN apt-get update
RUN apt-get install -y $JAVA_VERSION
COPY server/ /server/
COPY configs/* /server/
WORKDIR /server
RUN chmod +x start.sh
CMD ["./start.sh"]
EXPOSE 25565