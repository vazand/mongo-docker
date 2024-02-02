# pull official mongodb image from dockerhub
FROM mongo:latest
COPY mongod.conf /etc/mongod.conf
CMD ["mongod", "--config", "/etc/mongod.conf"]
#apt update && apt install vim -y
EXPOSE  27017
