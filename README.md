switch
------
This project consists of these 3 parts:

1. The server provides a web interface for displaying humidity and temperature, and controlling state (on/off) of the relay.
2. NodeMCU reads humidity and temperature values from DHT11 and send them to server.
3. After receiving a message i.e. humidity and temperature, the server send back state for controlling the relay.

Installation note
=================
* dht\_lib.lua is needed to be installed to NodeMCU. dht\_lib.lua can be found in nodemcu\_firmware repository.
