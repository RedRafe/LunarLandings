local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend{
  {
    type = "recipe",
    name = "ll-oxygen-diffuser",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"advanced-circuit", 20},
      {"steel-plate", 10},
      {"copper-cable", 10},
      {"pump", 2}
    },
    result = "ll-oxygen-diffuser"
  },
  {
    type = "item",
    name = "ll-oxygen-diffuser",
    icon = "__LunarLandings__/graphics/icons/oxygen-diffuser.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "space-related",
    order = "o[oxygen-diffuser]",
    place_result = "ll-oxygen-diffuser",
    stack_size = 10
  },
  {
    type = "beacon",
    name = "ll-oxygen-diffuser",
    icon = "__LunarLandings__/graphics/icons/oxygen-diffuser.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "ll-oxygen-diffuser"},
    max_health = 200,
    corpse = "beacon-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-1.5, -2.2}, {1.5, 1.3}},
    --allowed_effects = {"consumption", "speed", "pollution"},

    --graphics_set = require("prototypes.entity.beacon-animations"),
    graphics_set =
    {
      animation_list = {
        -- Beacon Base
        {
            render_layer = "lower-object-above-shadow",
            always_draw = true,
            animation = {
                layers = {
                    -- Base
                    {
                        filename = "__LunarLandings__/graphics/oxygen-diffuser/hr-beacon-base.png",
                        width = 232,
                        height = 186,
                        shift = util.by_pixel(11, 1.5),
                        scale = 0.5,
                    },
                    -- Shadow
                    {
                        filename = "__LunarLandings__/graphics/oxygen-diffuser/hr-beacon-base-shadow.png",
                        width = 232,
                        height = 168,
                        shift = util.by_pixel(11, 1.5),
                        draw_as_shadow = true,
                        scale = 0.5,
                    }
                }
            }
        },
        -- Beacon Antenna
        {
            render_layer = "object",
            always_draw = true,
            animation = {
                layers = {
                    -- Base
                    {
                        filename = "__LunarLandings__/graphics/oxygen-diffuser/hr-beacon-antenna.png",
                        width = 108,
                        height = 100,
                        line_length = 8,
                        frame_count = 32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(-1, -55),
                        scale = 0.5,
                    },
                    -- Shadow
                    {
                        filename = "__LunarLandings__/graphics/oxygen-diffuser/hr-beacon-antenna-shadow.png",
                        width = 126,
                        height = 98,
                        line_length = 8,
                        frame_count = 32,
                        animation_speed = 0.5,
                        shift = util.by_pixel(100.5, 15.5),
                        draw_as_shadow = true,
                        scale = 0.5,
                    }
                }
              }
            }
          }
    },
    water_reflection = {
      pictures = {
          filename = "__LunarLandings__/graphics/oxygen-diffuser/beacon-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 28,
          shift = util.by_pixel(0, 55),
          variation_count = 1,
          scale = 5,
      },
      rotate = false,
      orientation_to_variation = false
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    supply_area_distance = 3,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/beacon-1.ogg",
          volume = 0.2
        },
        {
          filename = "__base__/sound/beacon-2.ogg",
          volume = 0.2
        }
      },
      audible_distance_modifier = 0.33,
      max_sounds_per_type = 3
      -- fade_in_ticks = 4,
      -- fade_out_ticks = 60
    },
    energy_usage = "480kW",
    distribution_effectivity = 1,
    module_specification =
    {
      module_slots = 0,
      module_info_icon_shift = {0, 0},
      --module_info_multi_row_initial_height_modifier = -0.3,
      --module_info_max_icons_per_row = 2
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          {
            type = "script",
            effect_id = "ll-oxygen-diffuser-created",
          },
        }
      }
    },
    surface_conditions = {nauvis = false, luna = {plain = false, lowland = false, mountain = false, foundation = true}}
  },

  {
    type = "storage-tank",
    name = "ll-oxygen-diffuser-fluidbox",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation"},
    --minable = {mining_time = 0.5, result = "storage-tank"},
    max_health = 500,
    corpse = "storage-tank-remnants",
    --dying_explosion = "storage-tank-explosion",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    --selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    --damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {2, 0} },
        { position = {-2, 0} },
        { position = {0, 2} },
        { position = {0, -2} }
      },
      hide_connection_info = false,
      filter = "ll-oxygen"
    },
    --two_direction_only = true,
    window_bounding_box = {{-0.125, 0.6875}, {0.1875, 1.1875}},
    pictures =
    {
      picture = util.empty_sprite(),
      fluid_background = util.empty_sprite(),
      window_background = util.empty_sprite(),
      flow_sprite = util.empty_sprite(),
      gas_flow = util.empty_sprite(1),
    },
    flow_length_in_ticks = 360,
    --vehicle_impact_sound = sounds.generic_impact,
    --open_sound = sounds.machine_open,
    --close_sound = sounds.machine_close,
    --[[working_sound =
    {
      sound =
      {
          filename = "__base__/sound/storage-tank.ogg",
          volume = 0.6
      },
      match_volume_to_activity = true,
      audible_distance_modifier = 0.5,
      max_sounds_per_type = 3
    },]]

    --circuit_wire_connection_points = circuit_connector_definitions["storage-tank"].points,
    --circuit_connector_sprites = circuit_connector_definitions["storage-tank"].sprites,
    --circuit_wire_max_distance = default_circuit_wire_max_distance,
    --[[water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/storage-tank/storage-tank-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }]]
  },
}