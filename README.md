# Aquila
A (hopefully scalable) network monitoring tool used to determine packet loss and latency between nodes on a network using:
* A stat building agents, running on probes connected to the interfaces of access/edge switches
* A SQL-based stat collection service to handle the flow data from the probes
* A PHP-based web application to:
    * Display the network flow stats in a presentable (and useful!) way
    * Manage (onbboard, maintain and decomission) probes running on the network

### Proof of Concept Testing environment
![Base-Diagram](Diagrams/Aquila-concept.png)

### Realistic Testing environment
![Base-Management-Diagram](Diagrams/Aquila-mgmt-concept.png)
