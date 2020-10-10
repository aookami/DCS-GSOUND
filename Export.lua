
function LuaExportStart()
	socket = require("socket")
	host = "localhost"
	port = 8075
	connection = socket.try(socket.connect(host, port))
	connection:setoption("tcp-nodelay",true)
end

function LuaExportAfterNextFrame()
	socket.try(connection:send(string.format("%+.3f",LoGetAccelerationUnits().y)))
end

function LuaExportStop()
	connection:close()
end
