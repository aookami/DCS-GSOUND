local lfs=require('lfs');
dofile(lfs.writedir()..[[Scripts\pw-dev_script\Export.lua]])
pcall(function() local dcsSr=require('lfs');dofile(dcsSr.writedir()..[[Mods\Services\DCS-SRS\Scripts\DCS-SimpleRadioStandalone.lua]]); end,nil);



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

BIOS = {}; BIOS.LuaScriptDir = [[P:\dcsb\dcs-lua\]]; BIOS.PluginDir = [[C:\Users\mabaw\AppData\Roaming/DCS-BIOS/Plugins\]]; if lfs.attributes(BIOS.LuaScriptDir..[[BIOS.lua]]) ~= nil then dofile(BIOS.LuaScriptDir..[[BIOS.lua]]) end --[[DCS-BIOS Automatic Setup]]
