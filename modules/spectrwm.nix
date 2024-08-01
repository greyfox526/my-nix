{config, pkgs, ...}:

{
  #Enable the X11 windowing system
  services.xserver.enable = true;

  #Enable Display Manager
  services.xserver.displayManager.lightdm.enable = true;

  # Enable SpectrWM Enviorment.
  services.xserver.windowManager.spectrwm.enable = true;
}
