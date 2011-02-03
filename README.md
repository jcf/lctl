# lctl

lctl is short for launchctl. This is just something I hacked together to avoid
having to type long paths when restarting postgresql and similar, which I
installed using Homebrew.

## Author

James Conroy-Finn

## Installation

    gem install lctl

## Usage

You can search for plists in ~/Libary/LaunchAgents and ~/Library/LaunchDaemons
using `lctl list [NAME]`. With no name all plists will be output. With a name
only files that contain the name will be output.

The same search mechanism is used when loading and unloading plists. If more
than one match is found the list of matches will be output and a warning
printed.

    lctl help [TASK]  # Describe available tasks or one specific task
    lctl list [NAME]  # Find any agents or daemons matching optional NAME
    lctl load NAME    # Load a launchd process in ~/Library/Launch[Agents|Daemons]
    lctl unload NAME  # Unload a launchd process in ~/Library/Launch[Agents|Daemons]
    lctl version      # Prints Lctl's version information
