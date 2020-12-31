hamachi

Containerized Hamachi VPN


## Purpose

To run Hamachi VPN client for hub / spoke configurations in a NAS or other environment


## Hamachi Release Version

Currently at Version: 2.1.0.203-1


## Setting up a Host

Container is running Ubuntu 20.10

First, setup a local Volume storage to ensure config persists between container rebuilds in your docker-compose.yml:

    volumes:
      - /volume1/docker/hamachi/config:/var/lib/logmein-hamachi


When you build this for the first time, you'll need to ssh into the container and join the network.

The fastest way to build this is to download the docker-compose.yml, edit it and then run:

		docker pull -d
		docker-compose up -d

To log-in to the container use the *bash_hamachi.sh* script (found in the Scripts folder):

		#!/bin/sh
		
		# Name:
		# -----
		# bash_hamachi.sh
		
		ID=`/usr/local/bin/docker ps | grep hamachi | cut -f1 -d" "`
		/usr/local/bin/docker exec -it --user=root $ID /bin/bash


Then run

		hamachi do-join 123-446-789    # this pushes a request to vpn.net to join your private network

Then login to vpn.net and approve the join request