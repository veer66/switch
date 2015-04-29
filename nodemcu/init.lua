wifi.setmode(wifi.STATION)
wifi.sta.config("ssid","password")

gpio.mode(2,gpio.OUTPUT)
conn=net.createConnection(net.TCP, false) 

conn:on("receive",
		function(conn, pl)
		   if pl == 'on' then
			  gpio.write(2, 1)
		   else
			  gpio.write(2, 0)
		   end
		end
)

conn:connect(6981, 'server')

tmr.alarm(1,1000,1,
		  function()
			 conn:send('titi')
		  end
)
