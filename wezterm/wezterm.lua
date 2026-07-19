local wezterm = require("wezterm")

return {
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 10.0,
  color_scheme = "Tokyo Night",
  window_background_opacity = 0.95,
  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
}
