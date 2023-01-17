playerList = {}

function addToPlayerlist(playerID, playerRoles)
	_G.playerList[playerID] = playerRoles
end

-- fetch player data on live script restart
Citizen.CreateThread(function() 
	Citizen.Wait(1000)

	for _, playerId in ipairs(GetPlayers()) do
		TriggerClientEvent('HQLYRP:perms:sendRolesRequest', playerId)
		Citizen.Wait(250)
	end
end)

-- get the players discordRoles so we can compare them again later without making more discord api calls
RegisterServerEvent("HQLYRP:perms:getDiscordRoles")
AddEventHandler("HQLYRP:perms:getDiscordRoles", function()
	-- get the discord identifier
	src = source
	local p_disc_id = 0
	for k, v in ipairs(GetPlayerIdentifiers(source)) do
		if string.sub(v, 1, string.len("discord:")) == "discord:" then
			p_disc_id = string.sub(v, 9)
		end
	end
	if p_disc_id ~= 0 then -- not _G.playerTable[p_disc_id] and 
		exports['discordroles']:isRolePresent(p_disc_id, '0', function(hasRole, roles)
			addToPlayerlist(src, roles)
			TriggerClientEvent('HQLYRP:perms:getClientDiscordRoles', src, roles)
			print('^5-- [INFO] -- Discord roles fecthed for: ^3' .. GetPlayerName(src) .. '^7')
			
		end)
	end
end)

---===---===---===---===---===---===---===---===---===---===---===---===---===---=== EXPORTS ---===---===---===---===---===---===---===---===---===---===---===---===---===---===

function hasRole(playerID, roleID)
	--print('playerID: ' .. tostring(playerID) .. ' (' .. type(playerID) .. ') | roleID: '.. tostring(roleID) .. ' (' .. type(roleID) .. ')')
	playerID = tonumber(playerID)

	if inTable(playerList[playerID], roleID) then
		return true
	end
	return false
end

function hasRoleName(playerID, roleName)
	if roles[roleName] then
		return hasRole(playerID, roles[roleName])
	end
	return false
end

function getRoles(playerID)
	if playerList[playerID] then
		return playerList[playerID]
	end
	return nil
end