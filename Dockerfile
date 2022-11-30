# metadata about the maintainer
# LABEL maintainer="machiobrian29@gmail.com" 
# pull ubuntu's latest image from Docker Hub
FROM ubuntu:latest
# Installing nginx
RUN apt-get -y update && apt-get -y install nginx
# copy default files from local to the traget image directory
COPY files/default /etc/nginx/sites-available/default
# copying our file overwtites the default in the Nginx installation 
COPY files/index.html /usr/share/nginx/html/index.html
# Nginx listens to port 80; that is what we expose
EXPOSE 80
# run the Nginx server when docker image launches
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]