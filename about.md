# Fullscreen Notch Fix

Fixes the fullscreen mode in geometry dash on macOS. The regular fullscreen mode is broken and doesn't account for 
the menu bar / notch, cutting off the top part of the game which contains useful info like the progress bar.

You can switch between regular and borderless fullscreen modes in the settings.

### Known Issues

- Some of the bottom is cutoff in regular fullscreen, but y-scaling the game scene appears to break triggers.

- Switching from borderless fullscreen to windowed mode doesn't move it back to the desktop space.