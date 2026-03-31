# Aquila
A (hopefully scalable) network monitoring tool used to determine packet loss and latency between nodes on a network using:
* Golang on the Daemon
* Symfony on the webapp
* Junos on the routers (for now)

## High-level diagram:
![Clab-PoC-Diagram](Diagrams/hld.drawio.png)

To test basic functionality we'll use this in the meantime before scaling out to bigger and better things.

## IP Addressing
| Host / Interface | IPv4           | Host / Interface        | IPv4        |
|------------------|----------------|-------------------------|-------------|
| leaf1 (mgmt)     | 192.168.10.254 | probe-leaf (eth1)       | 10.0.0.1/32 |
| leaf2 (mgmt)     | 192.168.10.253 | probe-leaf (eth1)       | 10.0.0.2/32 |
| leaf3 (mgmt)     | 192.168.10.253 | probe-leaf (eth1)       | 10.0.0.3/32 |
| leaf4 (mgmt)     | 192.168.10.252 | probe-leaf (eth1)       | 10.0.0.4/32 |
| leaf1 (lo0)      | 10.0.0.1/32    | probe-leaf (eth2 / LAN) |             |
| leaf2 (lo0)      | 10.0.0.2/32    | probe-leaf (eth2 / LAN) |             |
| leaf3 (lo0)      | 10.0.0.3/32    | probe-leaf (eth2 / LAN) |             |
| leaf4 (lo0)      | 10.0.0.4/32    | probe-leaf (eth2 / LAN) |             |

### ISLs 
| ISL Name    | A End                                 | A End IP       | B End                                 | B End IP       |
|-------------|---------------------------------------|----------------|---------------------------------------|----------------|
| ae102       | leaf1 ethernet-1/9 leaf1 ethernet-1/10 | 172.16.10.0/31 | leaf1 ethernet-1/9 leaf1 ethernet-1/10 | 172.16.10.1/31 |
| ae103       | leaf1 ethernet-1/11 leaf1 ethernet-1/12 | 172.16.10.2/31 | leaf3 ethernet-1/11 leaf3 ethernet-1/12 | 172.16.10.3/31 |
| ae204       | leaf2 ethernet-1/11 leaf2 ethernet-1/12 | 172.16.10.4/31 | leaf4 ethernet-1/11 leaf4 ethernet-1/12 | 172.16.10.5/31 |
| ae304       | leaf3 ethernet-1/9 leaf3 ethernet-1/10 | 172.16.10.6/31 | leaf4 ethernet-1/9 leaf4 ethernet-1/10 | 172.16.10.6/31 |

## Development
Since we're using srlinux on containerlab, we can run topologies via whatever linux vm. After provisioning the linux VM you can copy-paste the contents of the `provision-vm.sh`script that'll download the stuff you need bar configuring git credentials which need to be done manually - merry christmas.

## Rules:
* Dan's not allowed to write any php

## Tasks:

**Alex**
* Build out network 
    * Configure lacp + ospf ring
    * Document ip addresing schema for isls
* Provision probe interfaces + draft netplan + ufw roles
* Build / Provision containers for orcestrator / visualisation server

**Bas**
* Write / scaffold Go module
* Write PoC scripts to make the probes ping eachother on their LAN interfaces
* Draft go unit tests + actions
* Test clab network

**Vio**
* Configure containerlab (network)
    * Write config templates / config files as network as per diagram
    * Write a provisioning script to apply the configs to the switches
    * Configure leaf4
        * ISL interface config
        * OSPF config
        * Loopback interface
        * Auto-provision based on containerlab topology

**Dan**
* Configure containerlab (systems)
    Using ansible:
    * Deploy ssh keys for all users + do correct user permissions
    * Provision aquila-user with correct permissions
    * Place demo file in aquila-user dir with correct permissions
    * Configure probe-leaf4
        * Netplan vars based on ip schema
        * UFW allow config / hardening
        * Auto-provision based on containerlab topology