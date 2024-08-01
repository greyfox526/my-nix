{ config, pkgs-stable, ...}:

{
  #environment.userPackages = with pkgs-stable;[
  environment.systemPackages = with pkgs-stable;[
    #piper-tts
    #mindustry
  ];
}
