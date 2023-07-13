local wezterm = require("wezterm")
local act = wezterm.action

local color = {
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}

local config = {
	enable_wayland = false,
	default_prog = { "/usr/bin/zsh" },
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_decorations = "NONE",
	inactive_pane_hsb = {
		saturation = 0.8,
		brightness = 0.7,
	},
	color_scheme = "Catppuccin Macchiato",
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
		foreground = color.text,
		background = color.base,

		cursor_fg = color.base or color.crust,
		cursor_bg = color.rosewater,
		cursor_border = color.rosewater,

		selection_fg = color.text,
		selection_bg = color.surface2,

		scrollbar_thumb = color.surface2,

		split = color.overlay0,

		ansi = {
			color.subtext1 or color.surface1,
			color.red,
			color.green,
			color.yellow,
			color.blue,
			color.pink,
			color.teal,
			color.surface2 or color.subtext1,
		},

		brights = {
			color.subtext0 or color.surface2,
			color.red,
			color.green,
			color.yellow,
			color.blue,
			color.pink,
			color.teal,
			color.surface1 or color.subtext0,
		},
		indexed = { [16] = color.peach, [17] = color.rosewater },
		compose_cursor = color.flamingo,
		tab_bar = {
			background = color.crust,
			active_tab = {
				bg_color = color.mauve,
				fg_color = color.crust,
			},
			inactive_tab = {
				bg_color = color.mantle,
				fg_color = color.text,
			},
			inactive_tab_hover = {
				bg_color = color.base,
				fg_color = color.text,
			},
			new_tab = {
				bg_color = color.surface0,
				fg_color = color.text,
			},
			new_tab_hover = {
				bg_color = color.surface1,
				fg_color = color.text,
			},
			inactive_tab_edge = color.surface0,
		},

		visual_bell = color.surface0,
	},
	disable_default_key_bindings = false,
	leader = { key = "b", mods = "CMD", timeout_milliseconds = 2000 },
	keys = {
		{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
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

return config
