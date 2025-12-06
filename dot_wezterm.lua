-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 160
config.initial_rows = 64
config.enable_scroll_bar = true

-- or, changing the font size and color scheme.
config.font_size = 13
-- config.color_scheme = 'Catppuccin Frappe'
config.colors = {
  background = 'black'
}
config.window_background_opacity = 0.9

-- Finally, return the configuration to wezterm:
return config
