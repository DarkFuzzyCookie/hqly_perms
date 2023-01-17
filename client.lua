local discordRoles = {}

local firstLoad = true
AddEventHandler('playerSpawned', function()
	Citizen.Wait(2500)
	if firstLoad then
		TriggerServerEvent("HQLYRP:perms:getDiscordRoles")
		firstLoad = false
	end
end)

RegisterNetEvent('HQLYRP:perms:sendRolesRequest')
AddEventHandler('HQLYRP:perms:sendRolesRequest', function()
	TriggerServerEvent('HQLYRP:perms:getDiscordRoles')
end)

RegisterNetEvent('HQLYRP:perms:getClientDiscordRoles')
AddEventHandler('HQLYRP:perms:getClientDiscordRoles', function(roles)
	discordRoles = roles
	print(json.encode(roles))
end)


---===---===---===---===---===---===---===---===---===---===---===---===---===---=== EXPORTS ---===---===---===---===---===---===---===---===---===---===---===---===---===---===


function hasRole(roleID)
	if discordRoles == nil then return false end

	for i=1, #discordRoles do
		if tostring(roleID) == discordRoles[i] then
			return true
		end
	end
	return false
end

function getRoles()
	if discordRoles == nil then return {} end
	
	return discordRoles
end