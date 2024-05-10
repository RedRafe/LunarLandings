data:extend{
  {
    type = "item",
    name = "ll-aluminium-ore",
    icon = "__LunarLandings__/graphics/icons/aluminium-ore.png",
    icon_size = 64,
    icon_mipmaps = 4,
    pictures =
    {
      { size = 64, filename = "__LunarLandings__/graphics/icons/aluminium-ore.png",   scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__LunarLandings__/graphics/icons/aluminium-ore-2.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__LunarLandings__/graphics/icons/aluminium-ore-3.png", scale = 0.25, mipmap_count = 4 },
      { size = 64, filename = "__LunarLandings__/graphics/icons/aluminium-ore-4.png", scale = 0.25, mipmap_count = 4 }
    },
    subgroup = "raw-resource",
    order = "h[moon]-c[aluminium-ore]",
    stack_size = 50
  },
  {
    type = "item",
    name = "ll-alumina",
    icon = "__LunarLandings__/graphics/icons/alumina.png",
    icon_size = 64,
    icon_mipmaps = 4,
    subgroup = "ll-raw-material-moon",
    order = "c[alumina]",
    stack_size = 50
  },
  {
    type = "item",
    name = "ll-aluminium-plate",
    icon = "__LunarLandings__/graphics/icons/aluminium-plate.png",
    icon_size = 128, icon_mipmaps = 1,
    subgroup = "ll-raw-material-moon",
    order = "d[aluminium-plate]",
    stack_size = 100
  },
  {
    type = "fluid",
    name = "ll-red-mud",
    default_temperature = 25,
    --heat_capacity = "0.1KJ",
    base_color = {r = 53, g = 0, b = 0}, --153
    flow_color = {r = 53, g = 0, b = 0},
    icon = "__LunarLandings__/graphics/icons/red-mud.png",
    icon_size = 64, icon_mipmaps = 4,
    order = "g[red-mud]"
  },
  -- Heat outputs will be added to recipes in heat-recipes.lua (data-final-fixes)
  {
    type = "recipe",
    name = "ll-alumina",
    category = "ll-arc-smelting",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type="item", name="ll-aluminium-ore", amount=10},
      {type="fluid", name="sulfuric-acid", amount=2},
    },
    results =
    {
      {type="item", name="ll-alumina", amount=5},
      {type="fluid", name="ll-red-mud", amount_min=5, amount_max=15, fluidbox_index=1},
    },
    main_product = "ll-alumina",
    --[[icon = "__LunarLandings__/graphics/icons/moon-rock.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "a[oil-processing]-c[advanced-oil-processing]"]]
  },
  {
    type = "recipe",
    name = "ll-aluminium-plate",
    category = "ll-arc-smelting",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type="item", name="ll-alumina", amount=4},
      {type="item", name="coal", amount=1},
    },
    results =
    {
      {type = "item", name = "ll-aluminium-plate", amount = 6},
    },
    main_product = "ll-aluminium-plate",
    --[[icon = "__LunarLandings__/graphics/icons/moon-rock.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "raw-material",
    order = "a[oil-processing]-c[advanced-oil-processing]"]]
  },
  {
    type = "recipe",
    name = "ll-red-mud-recovery",
    icons = {
      {
        icon = "__LunarLandings__/graphics/icons/red-mud.png",
        icon_size = 64, icon_mipmaps = 4,
      },
      {
        icon = "__LunarLandings__/graphics/icons/recycle.png",
        icon_size = 64, icon_mipmaps = 1,
        scale = 0.3,
        shift = {-8, 8},
      }
    },
    category = "chemistry",
    enabled = false,
    allow_decomposition = false,
    energy_required = 20,
    ingredients =
    {
      {type="fluid", name="ll-red-mud", amount=20},
    },
    results=
    {
      {type="item", name="stone-brick", amount_min=0, amount_max=20},
      {type="item", name="iron-ore", amount_min=0, amount_max=20},
    },
    subgroup = "ll-raw-material-moon",
    order = "h[red-mud]",
    crafting_machine_tint = {
      primary    = {r = 53, g = 0, b = 0},
      secondary  = {r = 53, g = 0, b = 0},
      tertiary   = {r = 53, g = 0, b = 0},
      quaternary = {r = 53, g = 0, b = 0},
    },
  },
  {
    type = "recipe",
    name = "ll-low-density-structure-aluminium",
    localised_name = {"recipe-name.ll-low-density-structure-aluminium"},
    icons = {
      {
        icon = "__base__/graphics/icons/low-density-structure.png",
        icon_size = 64, icon_mipmaps = 4,    
      },
      {
        icon = "__LunarLandings__/graphics/icons/aluminium-plate.png",
        icon_size = 128, icon_mipmaps = 1,
        scale = 0.125,
        shift = {-8, -8},
      }
    },
    category = "crafting",
    subgroup = "intermediate-product",
    order = "o[low-density-structure]-a",
    energy_required = 20,
    enabled = false,
    ingredients =
    {
      {"steel-plate", 2},
      {"ll-aluminium-plate", 15},
      {"plastic-bar", 5}
    },
    results = {{type="item", name="low-density-structure", amount=1}},
    main_product = "",
    order = "o[low-density-structure]-a"
  },
}

data_util.allow_productivity("ll-alumina")
data_util.allow_productivity("ll-aluminium-plate")
data_util.allow_productivity("ll-low-density-structure-aluminium")
