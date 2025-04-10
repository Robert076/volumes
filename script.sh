#!/bin/bash

# pull the latest image of jenkins from dockerhub
docker pull jenkins/jenkins

# create a new volume
docker volume create myvolume

# create a container that uses this volume
docker run --name Jenkins1 -p 8080:8080 -p 50000:50000 -v myvolume:/var/jenkins_home jenkins/jenkins

# myvolume:/var/jenkins_home is a mapping from our docker volume that is managed by docker, to the place where the jenkins official image tells us to store the data

# now create another one with the same volume
# but first you have to login on the first container so that ur password is saved (so we have some data to store in the volume)
# docker run --name Jenkins2 -p 8181:8080 -p 49999:50000 -v myvolume:/var/jenkins_home jenkins/jenkins

# and as you will see when running the second container it will know we have an account and we can still see all our jobs we created on the first one. they share the same volume since we mentioned it in that mapping


# also there is another notion of data binding where we can bind a folder from our host pc (this one will not be managed by docker and truthfully there's few occasions where we need this data binding, most of the time we can use docker volumes), where instead of the -v myvolume we would specifcy like -v/Users/robert/Desktop/Jenkins_Data_Binding:/var/jenkins_home and now we can see it being created on our desktop and all the data in it
