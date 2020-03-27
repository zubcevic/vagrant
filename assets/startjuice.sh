#!/bin/bash
sudo docker run --name juiceshop -d -p 3000:3000 --restart unless-stopped bkimminich/juice-shop
