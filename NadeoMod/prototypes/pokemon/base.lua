data:extend(
{
	{
		type = "item-subgroup",
		name = "drone-combat",
		group = "combat",
		order = "g"
	},
	{
    type = "technology",
    name = "com-drone-rovers",
    icon = "__base__/graphics/technology/automobilism.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "combat-roboport"
      }
    },
    --prerequisites = MoConfig.ModCompat.CombatBotsResearch,
	prerequisites = {"logistics"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 3},
        {"science-pack-3", 1}
      },
      time = 30
    },
    order = "a-h-c",
  },
  {
    type = "technology",
    name = "adv-com-drones",
    icon = "__base__/graphics/icons/distractor.png",
    effects =
    {
	  {
        type = "unlock-recipe",
        recipe = "combat-drone-wagon"
      } --,
	  --{
        --type = "unlock-recipe",
        --recipe = "attack-drone"
      --}
    },
    prerequisites = {"com-drone-rovers"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 2},
        {"alien-science-pack", 1},
      },
      time = 30
    },
    order = "a-h-c-b",
  }
})

require "drones"
require "dronetower"
require "dronewagon"
require "dronecommandtower"
require "orders"
require "reversecomp"
require "wildbiter"