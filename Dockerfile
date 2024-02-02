# pull official mongodb image from dockerhub
FROM docker.io/mongo:latest
COPY mongod.conf /etc/mongod.conf.orig
#CMD ["mongod", "--config", "mongod.conf.orig"]
EXPOSE 27017
