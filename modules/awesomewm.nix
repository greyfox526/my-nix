{config, pkgs, ...}:

{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable Display Manager
  services.xserver.displayManager.lightdm.enable = true;

  # Enable AwesomeWM Environment.
  services.xserver.windowManager.awesome.enable = true;
}
