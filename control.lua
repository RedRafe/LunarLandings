local handler = require "__core__.lualib.event_handler"
gui = require "__LunarLandings__.scripts.gui-lite"

local compatibility = require "scripts.compatibility"
compatibility.preload_remote_interface()

handler.add_libraries{
  gui,
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
