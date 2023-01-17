---------------------------------------------------------- PLAYER PERMS FRAMEWORK BY HQLY DEVELOPMENT ---------------------------------------------
fx_version 'cerulean'
game { 'gta5' }

author 'Dexter | HQLYRP DEVELOPMENT'
description 'Player Discord Permissions framework wrapper'
version '1.0.0'

shared_scripts {
	"config.lua",
	"funcs.lua"
}

client_scripts {
	"client.lua",
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	"server.lua"
}

server_export "hasRole"
server_export "hasRoleName"
server_export "getRoles"

-- client exports
exports {
	"hasRole",
	--"hasRoleName",
	"getRoles"
} 
