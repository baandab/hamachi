hamachi

Containerized Hamachi VPN


## Purpose

To create a means of launching a Hamachi VPN client for hub / spoke configurations in a NAS or other environment that does not meet first-class support requirements for Hamachi on Linux but does have:

* Support for tunnels
* Support for Docker

## Hamachi Release Version

Currently at Version: 2.1.0.203-1

But you can set environment variables to override in your docker-compose.yml:

        environment:
            - HAMACHI_ARCH=amd64.deb
            - HAMACHI_NAME=logmein-hamachi_$HAMACHI_VERSION_$HAMACHI_ARCH
            - HAMACHI_URL=https://www.vpn.net/installers/$HAMACHI_NAME



## Setting up a Host


Setup local Volume storage to ensure config persists between container rebuilds in your docker-compose.yml:

    volumes:
      - /volume1/docker/hamachi/config:/var/lib/logmein-hamachi


When you build this for the first time, you'll need to ssh into the container and run:

		hamachi do-join 123-446-789    # this pushes a request to vpn.net to join your private network

Then login to vpn.net and approve the join request