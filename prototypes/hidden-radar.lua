data:extend{
  {
    type = "radar",
    name = "ll-hidden-radar",
    icon = "__base__/graphics/icons/radar.png",
    icon_size = 64, icon_mipmaps = 4,
    max_health = 250,
    collision_mask = {},
    energy_per_sector = "10MJ",
    max_distance_of_sector_revealed = 0,
    max_distance_of_nearby_sector_revealed = 1,
    energy_per_nearby_scan = "1000kJ",
    energy_source =
    {
      type = "void",
    },
    energy_usage = "300kW",
    
    pictures = util.empty_sprite(),
    rotation_speed = 0.01,
    surface_conditions = {nauvis = true, luna = true},
  },

}