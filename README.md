# HQLY_perms
Wrapper for [discordroles](https://github.com/logan-mcgee/discordroles) resource that allows more integration with other resources via client and server side.
Makes sure to store request information as to not spam Discord API - useful for servers with plenty of players and lots of scripts that require Discord authentication.

# Install Guide

 1. Download & Install [discordroles](https://github.com/logan-mcgee/discordroles)
 2. Download hqly_perms
 3. Place into resources folder
 4. Add `ensure hqly_perms` to `server.cfg` file AFTER the starting `discordroles`
 5. Inside `config.lua` update the 'staff' Discord role respective to your Discord server

# Usage Guide (Developers)

Add any roles that you wish to check for into `config.lua`

## Server Exports

  ` hasRole(playerId, roleId)`
  
playerId: Player's server Id, roleId: Discord role Id
Returns true if target player contains the target role Id, false otherwise.
***
`hasRoleName(playerId, roleName)`

playerId: Players server Id, roleName: role name defined in `config.lua`
Returns true if player contains target role, false otherwise.
***
`getRoles(playerId)`

playerId: Players server Id
Returns a table of all roles target player contains, nil if player has no roles or is not in Discord server.
## Client Exports

`hasRole(roleId)`

roleId: Discord role Id
Returns true if player has target role, otherwise false.
***
`getRoles()`

Returns a table of all roles for the player.
