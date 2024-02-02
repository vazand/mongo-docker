This is a mongo db docker image and container example configuration, you can use cli and directly up the mongo container or use the docker compose file and up the mongo container 

(when you use docker compose,  the container will always restarts whenever system starts [we have configured like that])


# Built and run using docker compose
    >   docker-compose up -d


## when updating the configuration
    >   docker-compose up -d --build  
-------------------------------------------------------------------------------
# Steps to run the mongo image from dockerhub
##### Create a volume to save data In Host instead of docker container
    >   docker volume create mongoChatAppData
**when we create a volume  and save the data  in it, then if you delete your containers but not remove volumes, all your data will be safe**

##### Create docker network if needed or use without `--network`
    > docker network create my_network
**Crating a network is optional** 
### For creating a docker container and running with specified volume and network
    > sudo docker run -d \
        --name mongoContainer \
        -p 27017:27017 \
        --network my_network \
        -v mongoChatAppData:/data/db \
        mongo:latest

# To open the container shell
    > docker exec -it mongoContainer  bash

-------------------------------------------------------------------------------
### Build image using dockerfile

    > docker build -t mongo_image .
### Run the container using builded  image
    > docker run --rm -d -p 25000:27017 --name mongoContainer mongo_image
**here we're not using any volume or network**

-------------------------------------------------------------------------------
###### In the mongod.conf 
we have changed the bindIp from localhost(127.0.0.1) to any using 0.0.0.0
so anyone can connect to this MongoDB server -> security issue

If you want to allow only a specific Ip then add that Ip's in the bindIp and remove 0.0.0.0
like 127.0.0.1, 192.153.0.17


### For connecting from remte client 
    >   mongosh --host yourHostIp -port 27017 


END                                      