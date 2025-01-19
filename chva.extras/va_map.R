
pacman::p_load(
        tidyverse,
        maps,
        mapdata)

state <- map_data("state")
virginia <- state %>% filter(region == "virginia") %>% tibble()

counties <- map_data("county")
virginia_county <- counties %>% filter(region == "virginia") %>% tibble()

va_map <- ggplot(data = virginia, 
                 mapping = aes(x = long, y = lat, group = group)) + 
        coord_fixed(1.3) + 
        geom_polygon(color = "#C8CBD2", fill = "#F9DCBF") + 
        geom_polygon(data = virginia_county, fill = NA, color = "white") + 
        theme_minimal() +
        theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid = element_blank(),
              plot.background = element_rect(fill = 'transparent', color = NA))

lehuynh::ggsave_elsevier("chva.extras/va_map.png",
                         va_map,
                         width = "one_column",
                         height = 240/10)

