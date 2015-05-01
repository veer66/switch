DHT = require("dht_lib")

wifi.setmode(wifi.STATION)
wifi.sta.config("ssid","password")

gpio.mode(2,gpio.OUTPUT)

receiver = function(conn, pl)
   if pl == 'on' then
	  gpio.write(2, 0)
   else
	  gpio.write(2, 1)
   end
   conn:close()			  
end

sender = function()
   DHT.read11(4)

   local h = DHT.getHumidity()
   local t = DHT.getTemperature()
   local v = "V," .. tostring(h) .. "," .. tostring(t)
   
   conn = net.createConnection(net.TCP, false)
   conn:connect(6981, 'host address')
   conn:on("receive", receiver)
   conn:on("connection",
		   function()
			  conn:send(v)
		   end
   )
end

tmr.alarm(1,2000,1, sender)
