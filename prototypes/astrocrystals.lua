local resource_autoplace = require("__core__/lualib/resource-autoplace")

data:extend({
  {
    type = "resource",
    name = "ll-astrocrystals",
    category = "ll-core",
    icon = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite.png",
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral" },
    order = "a-b-a",
    subgroup = "raw-resource",
    highlight = true,
    infinite = true,
    minimum = 40000,
    normal = 100000,  -- At 100% yield, it will give 1/s at start, and 0.25/s after 60000 resources
    infinite_depletion_amount = 1,  -- Takes 1 from `normal` each time
    resource_patch_search_radius = 12,
    minable = {
      mining_time = 2,
      result = "ll-astrocrystals",
      required_fluid = "lubricant",
      fluid_amount = 2,
    },
    collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
    selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
    stage_counts = { 0 },
    stages = {
      sheet = {
        filename = "__LunarLandings__/graphics/resources/imersite/hr-imersite-rift.png",
        priority = "extra-high",
        width = 500,
        height = 500,
        frame_count = 6,
        variation_count = 1,
        scale = 0.7,
      },
    },
    stages_effect = {
      sheets = {
        {
          filename = "__LunarLandings__/graphics/resources/imersite/hr-imersite-rift-glow.png",
          priority = "extra-high",
          width = 500,
          height = 500,
          frame_count = 6,
          variation_count = 1,
          scale = 0.7,
          draw_as_glow = true,
        },
      },
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.5,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    map_color = { r = 1, g = 0.5, b = 1 },
    mining_visualisation_tint = { r = 0.792, g = 0.050, b = 0.858 },
    map_grid = false,
  },
  {
    type = "item",
    name = "ll-astrocrystals",
    icon = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite.png",
    icon_size = 64, icon_mipmaps = 4,
    pictures =
    {
      {
        layers = {
          {
            size = 64,
            filename = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite-1.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite-1-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite-2.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite-2-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
      {
        layers = {
          {
            size = 64,
            filename = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite-3.png",
            scale = 0.25,
            mipmap_count = 4,
          },
          {
            draw_as_light = true,
            flags = { "light" },
            blend_mode = "additive",
            tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
            size = 64,
            filename = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite-3-light.png",
            scale = 0.25,
            mipmap_count = 4,
          },
        },
      },
    },
    subgroup = "raw-resource",
    order = "h[moon]-e[astrocrystals]",
    stack_size = 50,
    surface_conditions = {nauvis = false, luna = true},
  },
  {
    type = "fluid",
    name = "ll-astroflux",
    default_temperature = 25,
    heat_capacity = "0.1KJ",
    base_color = { r = 238, g = 130, b = 238},
    flow_color = { r = 238, g = 130, b = 238},
    icon = "__LunarLandings__/graphics/fluid/astroflux.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "h[astroflux]"
  },
  {
    type = "recipe",
    name = "ll-astrocrystal-processing",
    energy_required = 12,
    enabled = false,
    category = "crafting-with-fluid",  -- TODO centrifuge? get pink tint
    ingredients = {{"ll-astrocrystals", 4}, {type="fluid", name="steam", amount="10"}},
    icon = "__LunarLandings__/graphics/item/raw-imersite/raw-imersite.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "ll-raw-material-moon",
    order = "l[exotic-mineral-processing]",
    results =
    {
      {
        type = "fluid",
        name = "ll-astroflux",
        amount = 10,
      },
      {
        name = "ll-right-polariton",
        probability = 0.0025,
        amount = 1
      },
      {
        name = "ll-left-polariton",
        probability = 0.0025,
        amount = 1
      },
      {
        name = "ll-up-polariton",
        probability = 0.0025,
        amount = 1
      },
      {
        name = "ll-down-polariton",
        probability = 0.0025,
        amount = 1
      },

    }
  },

})

x_util.allow_productivity("ll-astrocrystal-processing")