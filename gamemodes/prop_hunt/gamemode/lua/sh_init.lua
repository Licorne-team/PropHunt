// Include the required lua files
include("sh_config.lua")
include("sh_player.lua")


// Include the configuration for this map
if file.Exists("../gamemodes/prop_hunt/gamemode/maps/"..game.GetMap()..".lua", "LUA") || file.Exists("../lua_temp/prop_hunt/gamemode/maps/"..game.GetMap()..".lua", "LUA") then
	include("maps/"..game.GetMap()..".lua")
end


// Fretta!
DeriveGamemode("fretta")
IncludePlayerClasses()


// Information about the gamemode
GM.Name		= "Prop Hunt"
GM.Author	= "AMT"
GM.Email	= "theis.andrew@gmail.com"
GM.Website	= "http://www.amtstudios.com/mods/prop-hunt.php"


// Help info
GM.Help = [[Prop Hunt est un mix du jeux classique de Cache-cache.

En tant que "Props" vous avez ]]..HUNTER_BLINDLOCK_TIME..[[ secondes pour vous transformer en "props" (objets) existant sur la map et trouver un endroit pour vous cacher. Appuyez sur [E] pour vous transformer en "props" sur lequel votre regard se porte. Votre vie est basé sur la taille du "props" sur lequel vous vous êtes transformé.

En tant que "Hunter" votre vue sera inactive durant ]]..HUNTER_BLINDLOCK_TIME..[[ secondes au début de chaque round pendant que les "Props" tentent de se cacher. Lorsque le temps d'inactivité est terminé, vous devez trouver les "Props" contrôlés par les joueurs et de les tuer. Attaquer des "props" non-joueurs baissera vos points de vie. Cependant, tuer un joueur augementera votre vie de ]]..HUNTER_KILL_BONUS..[[ points.

Les deux équipes peuvent appuyez sur [F3] pour jouer une raillerie sonore.]]


// Fretta configuration
GM.AddFragsToTeamScore		= true
GM.CanOnlySpectateOwnTeam 	= true
GM.Data 					= {}
GM.EnableFreezeCam			= true
GM.GameLength				= GAME_TIME
GM.NoAutomaticSpawning		= true
GM.NoNonPlayerPlayerDamage	= true
GM.NoPlayerPlayerDamage 	= true
GM.RoundBased				= true
GM.RoundLimit				= ROUNDS_PER_MAP
GM.RoundLength 				= ROUND_TIME
GM.RoundPreStartTime		= 0
GM.SelectModel				= false
GM.SuicideString			= "n'en pouvais plus et s'est suicidé."
GM.TeamBased 				= true


// Called on gamemdoe initialization to create teams
function GM:CreateTeams()
	if !GAMEMODE.TeamBased then
		return
	end
	
	TEAM_HUNTERS = 1
	team.SetUp(TEAM_HUNTERS, "Hunters", Color(150, 205, 255, 255))
	team.SetSpawnPoint(TEAM_HUNTERS, {"info_player_counterterrorist", "info_player_combine", "info_player_deathmatch", "info_player_axis"})
	team.SetClass(TEAM_HUNTERS, {"Hunter"})

	TEAM_PROPS = 2
	team.SetUp(TEAM_PROPS, "Props", Color(255, 60, 60, 255))
	team.SetSpawnPoint(TEAM_PROPS, {"info_player_terrorist", "info_player_rebel", "info_player_deathmatch", "info_player_allies"})
	team.SetClass(TEAM_PROPS, {"Prop"})
end