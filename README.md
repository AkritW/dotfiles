# Akrit does dotfiles

These are my personal dotfiles for setting up a development environment with Neovim (using NvChad), Wezterm, and Starship.

## Structure

The dotfiles are organized around the main tools I use: Neovim, Wezterm, and Starship. Each tool has its own directory, and within each directory, you'll find configuration files and scripts related to that tool.

- **neovim/**: Contains all Neovim related configurations, plugins, and scripts. I use NvChad as my Neovim configuration, so you'll find the NvChad config file here.
- **wezterm/**: Contains the Wezterm configuration file and any related scripts.
- **starship/**: Contains the Starship prompt configuration file.

## Installation

To install these dotfiles, clone the repository and run the bootstrap script:

```sh
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cp -r dotfiles/nvim ~/.config/nvim/
cp -r dotfiles/wezterm ~/.config/wezterm/
cp -r dotfiles/starship ~/.config/starship/
```

## Customization

Feel free to fork this repository and customize it to suit your own needs. You can add new tools by creating new directories and adding configuration files and scripts as needed.

## Thanks

A big thank you to [holman](https://github.com/holman/dotfiles) and [ryanb](https://github.com/ryanb/dotfiles) for their dotfiles repositories, which served as a great starting point for my own.
