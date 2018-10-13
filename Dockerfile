FROM openjdk:8

EXPOSE 8080

RUN apt-get update && apt-get install apt-transport-https

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
apt-get update && \
apt-get install sbt

RUN mkdir /workspace
WORKDIR /workspace

ADD src src
ADD project project
ADD build.sbt build.sbt
ADD run.sh run.sh

RUN chmod +x run.sh

CMD /workspace/run.sh