local handler = require "__core__.lualib.event_handler"
gui = require "__LunarLandings__.scripts.gui-lite"

local compatibility = require "scripts.compatibility"
compatibility.preload_remote_interface()

local function on_init()
  if game.tick ~= 0 then
    game.print({"ll-console-info.added-to-existing-save"})
  end
  global.migrations = {}
end

local function on_configuration_changed(event)
  global.migrations = global.migrations or {}
  for _, force in pairs(game.forces) do
    force.reset_technology_effects()
  end
end

handler.add_libraries{
  gui,
  {on_init = on_init, on_configuration_changed = on_configuration_changed},
  require "scripts.moon-surface",
  require "scripts.moon-view",
  require "scripts.rocket-silo",
  require "scripts.landing-pad",
  require "scripts.rtg",
  require "scripts.oxygen-diffuser",
  require "scripts.steam-condenser",
  require "scripts.arc-furnace",
  require "scripts.mass-driver",
  require "scripts.mass-driver-requester",
  require "scripts.surface-conditions",
  require "scripts.collision-test",
  require "scripts.compatibility"
}

-- Frozen DLC
if script.active_mods["Cold_biters"] and script.active_mods["space-exploration-graphics-3"] then
  handler.add_libraries{
    require "scripts.graviton-matter-obliterator",
    require "scripts.radiation-shield",
    require "scripts.reclaim-center",
    require "scripts.research-center",
  }
end
