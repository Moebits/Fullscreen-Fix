# Fullscreen Fix

Fixes the fullscreen mode in geometry dash on macOS. The regular fullscreen mode is broken and doesn't account for 
the menu bar / notch, cutting off the top part of the game which contains useful info like the progress bar.

### Known Issues

- Some of the bottom is cutoff in regular fullscreen, but y-scaling the game scene appears to break triggers.

- You can't switch between borderless fullscreen and windowed mode in the game settings without restarting as 
there is a black screen.

### Installation

1. Install [Geode](https://geode-sdk.org/).
2. Place the `.geode` file from [releases](https://github.com/Moebits/Fullscreen-Fix/releases) in the geode/mods folder located where you installed Geometry Dash.

### Building

Install [Geode CLI](https://docs.geode-sdk.org/getting-started/geode-cli) and the sdk.

Release build - Run `geode build`. It is automatically installed to Geometry Dash if set up correctly.

Debug build - I run with the debugger in VSCode. You may have to edit the launch.json with the path to Geometry Dash on your device.

### Credits

- [Geode](https://geode-sdk.org/)