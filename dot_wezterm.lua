local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- Window
config.initial_cols = 160
config.initial_rows = 64
config.enable_scroll_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- Appearance
config.font_size = 13
if wezterm.target_triple:find('linux') then
  config.font_size = 10
end
config.colors = {
  background = 'black',
  foreground = '#e6e6e6',
  ansi = {
    '#5c6370', -- black
    '#ff6b6b', -- red
    '#98c379', -- green
    '#e5c07b', -- yellow
    '#61afef', -- blue
    '#c678dd', -- magenta
    '#56b6c2', -- cyan
    '#dcdfe4', -- white
  },
  brights = {
    '#7f8792', -- bright black
    '#ff8787', -- bright red
    '#b1e19b', -- bright green
    '#f0d199', -- bright yellow
    '#7fc1ff', -- bright blue
    '#d8a4e8', -- bright magenta
    '#7ed4e0', -- bright cyan
    '#ffffff', -- bright white
  },
}
config.window_background_opacity = 0.9
config.window_padding = { left = 4, right = 4, top = 4, bottom = 4 }
config.macos_window_background_blur = 20      -- frosted-glass blur behind transparent window

-- Behavior
config.audible_bell = 'Disabled'
config.scrollback_lines = 10000
-- Key bindings
-- On macOS, Alt+Left/Right moves word by word (matching Terminal.app behavior)
if wezterm.target_triple:find('apple') then
  config.keys = {
    { key = 'LeftArrow',  mods = 'OPT', action = wezterm.action.SendString '\x1bb' },
    { key = 'RightArrow', mods = 'OPT', action = wezterm.action.SendString '\x1bf' },
  }
end

return config
