# Akrit does dotfiles

Welcome to my personal dotfiles repository. This repository serves as a storage and sharing point for my configuration files (dotfiles) that set up my preferred development environment. The main tools I use are Neovim (with NvChad), Wezterm, and Starship.

## Structure of the Repository

The repository is organized around the primary tools I use. Each tool has its own dedicated directory, housing the relevant configuration files and scripts. Here's a brief overview:

- **neovim/**: This directory contains all configurations, plugins, and scripts related to Neovim. I use NvChad as my Neovim configuration, which provides a modern, sleek, and fast interface for Neovim with sensible defaults and a plethora of plugins to enhance productivity.

- **wezterm/**: Here, you'll find the Wezterm configuration file and any related scripts. Wezterm is a GPU-accelerated cross-platform terminal emulator and multiplexer. It's customizable and allows for advanced features like tabs and splits.

- **starship/**: This directory houses the Starship prompt configuration file. Starship is a minimal, blazing-fast, and infinitely customizable prompt for any shell.

## Installation

To set up your development environment like mine, you can clone this repository and run the bootstrap script. Here are the steps:

```sh
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles

# Copy the Neovim configuration
cp -r ~/.dotfiles/nvim ~/.config/nvim/
cp -r ~/.dotfiles/wezterm ~/.config/wezterm/
cp -r ~/.dotfiles/starship ~/.config/starship/
```

This will copy the appropriate configuration files to your home directory. All configurations and tweaks are done within the `~/.dotfiles` directory.

## Customization

If you find this repository useful. Feel free to fork this repository and customize it to suit your own needs. You can add new tools by creating new directories and adding configuration files and scripts as needed. The world of dotfiles is vast and personal; explore it and make it your own.

## Acknowledgments

I owe a big thank you to [holman](https://github.com/holman/dotfiles) and [ryanb](https://github.com/ryanb/dotfiles). Their dotfiles repositories served as a great starting point for my own. They provided a solid foundation and inspiration that guided me in creating a dotfiles repository that suits my needs and preferences.
