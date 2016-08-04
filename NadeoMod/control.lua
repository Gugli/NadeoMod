MLC = {
	Math=true, --Load the Math Module?
	Timers=true, --Load the Timer Module?
	Misc=true, --Load the Misc Module?
	Entity=true, --Load the entity module?
	Debug=false --Load the debug module?
}

require "defines"

MoSave = require "mologiccore.base"
ModInterface,MoConfig = {},{} local M = MoConfig

require "scripts.dronescore"
	
remote.add_interface("MoCombat", ModInterface)

function Intialize()
	MoTimers.CreateTimer("ManageCombatDronePosts",1,0,false,ManageCombatDronePosts)
	MoTimers.CreateTimer("ManageCombatDroneAi",1,0,false,ManageCombatDroneAi)
	MoTimers.CreateTimer("RotateCaptureBalls", 0.1, 0, false, RotateCaptureBalls)
end

function RotateCaptureBalls()
	MoEntity.CallLoop("captureballs",function(data)
		local E = MoEntity.KeyToEnt(data.entity)
		E.orientation = E.orientation + 14
		game.player.print(""..E.orientation)
	end)
end
MoTimers.CacheFunction("RotateCaptureBalls",RotateCaptureBalls)

script.on_configuration_changed(Intialize)
script.on_init(Intialize) 

script.on_event(defines.events.on_player_created, function(event)
  local player = game.get_player(event.player_index)
  player.insert("pokeball-raikou")
  player.insert("pokeball-empty")
  player.insert("solid-fuel")
  player.insert("iron-ore")
  --player.character_running_speed_modifier = 10
  for i,c in pairs(game.item_prototypes) do
	if (c.type == "capsule")
	then player.print(""..c.name)
	end
  end
	game.surfaces.nauvis.create_entity{	name = "small-biter", 
										position = game.surfaces.nauvis.find_non_colliding_position("small-biter", player.position, 20, 5),
										force = game.forces.enemy }
end)
