#!/bin/bash
sudo docker run --name webgoat -d -p 80:8888 -p 8080:8080 -p 9090:9090 -e TZ=Europe/Amsterdam --restart unless-stopped webgoat/goatandwolf
