local wezterm = require("wezterm")
local act = wezterm.action

local color = {
  sun_plus = "#FFFDFB",
  sun = "#FFF7ED",
  sun_minus = "#F2E6D4",
  sky_plus = "#CECECE",
  sky = "#9E9E9E",
  sky_minus = "#636363",
  shade_plus = "#3E4044",
  shade = "#24272B",
  shade_minus = "#181B1F",
  
  red = "#E18163",
  orange = "#D68B47",
  yellow = "#B49E33",
  green = "#4EB67F",
  cyan = "#00B0D2",
  blue = "#8C96EC",
  purple = "#BE85D1",
  magenta = "#D07EBA"
}

local config = {
	enable_wayland = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_decorations = "RESIZE",
	native_macos_fullscreen_mode = true,
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.7,
	},
  color_scheme = "Penumbra",
	font = wezterm.font("Ligconsolata"),
	font_size = 21,
	line_height = 1.2,
	use_dead_keys = false,
	scrollback_lines = 10000,
	adjust_window_size_when_changing_font_size = false,
	hide_tab_bar_if_only_one_tab = false,
	window_frame = {
		font = wezterm.font("SF Pro Display", { weight = 500 }),
		font_size = 16,
		active_titlebar_bg = "#252638",
		inactive_titlebar_bg = "#252638",
	},
colors = {
    foreground = color.sky_plus,
    background = color.shade,
    
    cursor_bg = color.sky_plus,
    cursor_border = color.sky_plus,
    cursor_fg = color.shade,
    
    selection_bg = color.shade_plus,
    selection_fg = color.sun,
    
    ansi = {
      color.shade_minus,
      color.red,
      color.green,
      color.yellow,
      color.blue,
      color.purple,
      color.cyan,
      color.sky_plus
    },
    
    brights = {
      color.shade,
      color.red,
      color.green,
      color.yellow,
      color.blue,
      color.purple,
      color.cyan,
      color.sun_plus
    },

    tab_bar = {
      background = color.shade_minus,
      active_tab = {
        bg_color = color.shade_plus,
        fg_color = color.sun
      },
      inactive_tab = {
        bg_color = color.shade,
        fg_color = color.sky
      },
      inactive_tab_hover = {
        bg_color = color.sky_minus,
        fg_color = color.sun_minus
      },
      new_tab = {
        bg_color = color.shade,
        fg_color = color.sun
      },
      new_tab_hover = {
        bg_color = color.sky_plus,
        fg_color = color.sun
      }
    },
    
    visual_bell = color.shade_minus
  },
	disable_default_key_bindings = false,
	leader = { key = "b", mods = "CMD", timeout_milliseconds = 2000 },
	keys = {
    { key = "Enter", mods = "CMD", action = act.ToggleFullScreen },
		{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "w", mods = "CTRL", action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "q", mods = "CTRL", action = act.QuitApplication },
		{ key = "1", mods = "CTRL", action = act.ActivateTab(0) },
		{ key = "2", mods = "CTRL", action = act.ActivateTab(1) },
		{ key = "3", mods = "CTRL", action = act.ActivateTab(2) },
		{ key = "4", mods = "CTRL", action = act.ActivateTab(3) },
		{ key = "5", mods = "CTRL", action = act.ActivateTab(4) },
		{ key = "6", mods = "CTRL", action = act.ActivateTab(5) },
		{ key = "7", mods = "CTRL", action = act.ActivateTab(6) },
		{ key = "8", mods = "CTRL", action = act.ActivateTab(7) },
		{ key = "9", mods = "CTRL", action = act.ActivateTab(8) },
	},
}

-- apply plugins
wezterm.plugin.require("https://github.com/catppuccin/wezterm").apply_to_config(config, { flavor = "mocha" })
wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
	position = "top",
	indicator = {
		leader = {
			enabled = false,
		},
		mode = {
			enabled = false,
		},
		clock = {
			enable = false,
		},
	},
})

config.enable_kitty_keyboard = true

return config
