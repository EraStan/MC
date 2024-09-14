FROM amd64/debian
LABEL authors="zhichen.su"
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless
COPY server/ /server/
COPY configs/* /server/
WORKDIR /server
CMD ["./start.sh"]
EXPOSE 25565