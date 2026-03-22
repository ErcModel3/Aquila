# Aquila
A (hopefully scalable) network monitoring tool used to determine packet loss and latency between nodes on a network using:
* Golang on the Daemon
* Symfony on the webapp
* Junos on the routers (for now)

### High-level diagram:
![Clab-PoC-Diagram](Diagrams/hld.png)
To test basic functionality we'll use this in the meantime before scaling out to bigger and better things.

Rules:
* Dan's not allowed to write any php

Tasks:
* Design containerlab testing topology - **Alex**
* Build containerlab topology - **Bas**
    * Plan an IP addressing scheme
    * Build containerlab topology as per network diagram
* Configure containerlab (network) - **Vio**
    * Write config templates / config files as network as per diagram
    * Write a provisioning script to apply the configs to the switches
* Configure containerlab (systems) - **Dan**
    Using ansible:
    * Deploy ssh keys for all users + do correct permissions
    * Work with containerlab kind default ubuntu user
    * Provision aquila-user with correct permissions
    * Place demo file in aquila-user dir with correct permissions