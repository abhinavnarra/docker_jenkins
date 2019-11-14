# run jenkins server with Docker

## Jenkins
Jenkins is a free and open source automation server. Jenkins helps to automate the non-human part of the software development process, with continuous integration and facilitating technical aspects of continuous delivery. It is a server-based system that runs in servlet containers such as Apache Tomcat

## Docker
Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels

In this tutorial we are going to install jenkins by using docker.
Make sure Docker is installed on your machine(MAC)
Install docker on mac
Install Docker Desktop on Mac
https://docs.docker.com/docker-for-mac/install/

Use the following Docker commands to pull the jenkins image from docker hub.
docker pull jenkins:alpine

Now Run the container out of the image pulled earlier using the following command

docker run -d -p 18080:8080 — name myjenkins jenkins:alpine
in the above command
-d flag to run the image as background
-p flag to specify the port
— name flag to specify the name for the container
jenkins:alpine is the name of the image pulled from docker hub in the earlier step

The output of the above command is following

You can persist the data using docker volumes:
Docker volumes will bind mount the data from the local machine to the remote server

It can be done using the following command

docker run -d -p 18080:8080 — name myjenkins -v <you_local_docker_path>:<remote_server_path> jenkins:alpine

Great! now you have setup the jenkins server on your local machine.

the next step is to grab the admin password for the jenkins
it can be found by the following command
docker logs <conainer_id>

Grab the Administrator password and paste above now you are all set to go and use the jenkins server for scheduling jobs.

In the next tutorial will know how to automate all the above steps using a docker-compose file