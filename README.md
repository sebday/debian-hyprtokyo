# Hyprland on Debian Sid
## JaKooLit script
Inspired by https://github.com/JaKooLit/Debian-Hyprland I wanted Hyprland on Debian using just apt and without having to build anything.

[![screenshot](https://imghost.lol/screenshots/2024-08-26-204305_hyprshot.png)](https://imghost.lol/screenshots/2024-08-26-204305_hyprshot.png)

## Install
Install a base system with no desktop environment, add `contrib` and `non-free` and dist-update to sid. (I like to install the ssh-server from tasksel and then remote in to install the rest)

`sudo apt install hyprland hyprland-protocols hyprwayland-scanner xwayland waybar fuzzel grim slurp cliphist swayidle swaylock hyprpaper mako-notifier nwg-look libglib2.0-bin bibata-cursor-theme`

- Fuzzel is a nice menu with icons
- Waybar is the taskbar
- Cliphist stores the clipboard to push into fuzzel
- Grim and slurp are for taking screenshots
- Hyprshot is not a package and needs cloning https://github.com/Gustash/Hyprshot
- Hyprpaper is enough but simple - I want waypaper as well
- Nwg-look is a gtk themer
- Swaylock is the lock screen
- Swayidle for auto locking the screen

`sudo apt install zsh kitty git firefox`

### Clone the dots and start hyprland
`git clone git@github.com:sebday/debian-hyprnord.git ~/.config`

Reboot and run `hyprland`. Now you can use firefox to copy paste :) Fonts will be broken until installed in the next step.

### Oh my zsh
I can't live without auto suggestions and syntax highlighting now.
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
```

Copy `assets/.zshrc` into ~/ and reboot to get the new shell.

### Standard tools
`sudo apt install eza fzf duf sshfs btop fastfetch pipewire alsa-utils playerctl pamixer pavucontrol imv mpv qalc cava thunar thunar-archive-plugin thunar-media-tags-plugin gvfs-backends transmission libfuse2`

### GTK Theme
Copy [Nordic](https://github.com/EliverLara/Nordic) into ~/.themes and set it in nwg-look 

### Fonts & Icons
Installing fonts through apt seems to miss the symbols needed for waybar and fastfetch. Extract from assets the fonts into `~/.local/share/fonts` and the icons into `~/.local/share/icons`

### Firefox
Nord theme: https://github.com/dragonejt/nord-firefox \
Copy firefox/userContent.css to the ~/.mozilla/firefox/profile/chrome directory \
In `about:config` set "toolkit.legacyUserProfileCustomizations.stylesheets" to `true` \
Install the Stylus extension \
Install the [WhatsApp Web](https://userstyles.world/style/16345/whatsapp-web-nord-theme) and Soundcloud Themes 

### Wallpapers
The simple binding `$wallpaper = imv-dir ~/Pictures/Wallpapers/*` and `<Return> = exec sh -c 'echo "$imv_current_file" | ~/.config/hypr/set_wallpaper.sh'; quit` in imv use the set_wallpaper.sh wallpaper script to open a folder in imv and set the wallpaper with hyprpaper. `set_wallpaper.sh` is hardcoded to my monitor names and will need editing to work. \
A seperate binding looks in a different widescreen folder and then applies images numbered 1, 2 and 3 seperately to span a wallpaper across three monitors.

[![screenshot](https://imghost.lol/screenshots/2024-08-26-205105_hyprshot.png)](https://imghost.lol/screenshots/2024-08-26-205105_hyprshot.png)

## Resources
Colors: [Nord](https://www.nordtheme.com/) \
Icons: [NovaOS](https://github.com/NicklasVraa/NovaOS-nord-Icons) \
Font: [CascadiaMono](https://www.nerdfonts.com/font-downloads) \
Cursor: [Bibata Modern Ice](https://packages.debian.org/sid/bibata-cursor-theme) \
Firefox: [Nord](https://github.com/dragonejt/nord-firefox) \
Whatsapp: [Nord](https://userstyles.world/style/16345/whatsapp-web-nord-theme) \
VS Code: [Nord](https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code)
