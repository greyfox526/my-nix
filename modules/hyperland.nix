{ pkgs, config, ...}:

{
  programs.hyperland = {
    enable = true;
    xwayland = true;
  };

  environment.systemPackages = with pkgs;[
    waybar
    eww
    dunst
    libnotify
    swww
    kitty
    rofi-wayland
  ];

}
