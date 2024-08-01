# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-stable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/pkgs-stable.nix
      ./modules/spectrwm.nix
    ];
  
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "tail"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  #LD
#/*
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs;[
    libGL
    ];
  };
 #*/
  # Docker
  #virtualisation.docker.enable = true;
  #users.extraGroups.docker.members = ["greyfox"];

  /* Podman
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
    };
#*/
  /* libvirt-virtmanager
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  programs.dconf.enable = true;
#*/
  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  }; 

  #Optimasations
  nix.settings.auto-optimise-store = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Auto Update Nix Channel
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-24.05";

  # Enable sound with pipewire.
  #sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Permitted Packages  
 
  nixpkgs.config.permittedInsecurePackages = [
                #"electron-25.9.0"
                #"python-2.7.18.7"
                #"vintagestory"
                #"steam-run"
                "steam"
              ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.greyfox = {
    isNormalUser = true;
    description = "greyfox";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "libvirtd" ];
    initialPassword = "nixos";
  };
  
    # init pass

  # Doas
  security.doas.enable = false;
  security.sudo.enable = true;
  security.doas.extraRules = [{
    users = ["greyfox"];
    # Optional, retains environment variables while running commands 
    # e.g. retains your NIX_PATH when applying your config
    keepEnv = true; 
    persist = false;  # Optional, only require password verification a single time
  }];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #toipe
    #podman-compose
    dmenu
    xlockmore
    wget
    #tldr
    git
    alacritty
    yt-dlp
    fzf
    axel
    #mono
    #nixos-generators
    #rnix-lsp
    feh
    #qemu_kvm
    #qemu-utils
    #pass
    #spice-gtk
    #x11spice
    #win-spice
    #wine
    mpv
    acpi
    #barrier
    #virt-manager
    #magic-wormhole
    (import ./scripts/tmp.nix { inherit pkgs; })
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
   networking.firewall.allowedTCPPorts = [ 22 ];
   networking.firewall.allowedUDPPorts = [ 22 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "BigBlueTerminal" "Terminus" ]; })
];

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Steam
  programs.steam.enable = true;
  
  # Nano
  programs.nano.enable = false;
  
  # xterm
  #programs.xterm.enable = false;

  # kernal
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = with pkgs;[
    "linuxKernel.packages.linux_xanmod_stable.xpadneo"
  ];

  # nixvim
/*
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";
  };*/

  # Brightnessctl
  #programs.brightnessctl.enable = true;

}
