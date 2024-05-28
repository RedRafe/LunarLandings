local util = require("util")

local cold_entities = {
  'cb-cold-spawner',
  'small-cold-worm-turret',
  'medium-cold-worm-turret',
  'big-cold-worm-turret',
  'behemoth-cold-worm-turret',
  'leviathan-cold-worm-turret',
  'mother-cold-worm-turret',
}

local cold_decals = {
  'lava-decal-blue',
  'wetland-decal',
  'puddle-decal',
  'sand-decal-white',
}

return {
  init = function()
    if not script.active_mods['Cold_biters'] then return end

    local luna = game.get_surface("luna")
    local luna_map_gen_settings = luna.map_gen_settings
    luna_map_gen_settings.autoplace_controls['enemy-base'] = { frequency = 0.2,  size = 1, richness = 1 }

    for _, name in pairs(cold_entities) do
      luna_map_gen_settings.autoplace_settings.entity.settings[name] = { frequency = 1, size = 1, richness = 1 }
    end

    for _, name in pairs(cold_decals) do
      luna_map_gen_settings.autoplace_settings.decorative.settings[name] = { frequency = 1, size = 1, richness = 1 }
    end

    game.surfaces.luna.map_gen_settings = util.table.deepcopy(luna_map_gen_settings)
    log('[Frost] Luna\'s mgs updated')
  end
}
