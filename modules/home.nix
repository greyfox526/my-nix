{ config, pkgs, pkgs-stable, ...}:

{
  


  home.username = "greyfox";
  home.homeDirectory = "/home/greyfox";

    home.stateVersion = "23.05"; # Please read the comment before changing.

    #Permitted Packages
    /*
    nixpkgs.config.permittedInsecurePackages = [
                "electron-25.9.0"
              ];
#*/
    # greyfox Packages
    home.packages = with pkgs;[
      floorp
      brightnessctl
      unnethack
      xbanish
      r2modman
      #mgba
      #devour
      #vintagestory
      #vimb
      vieb
      #lutris
      #itch
      #appflowy 
      #logseq
      #w3m
      #xsel
      #heroic
      #musikcube
      #cmus
      pavucontrol
      blueman
      #komikku
      #z-lua
      #zoxide
      #fasd
      nh
      nb
      fd
      #unzip
      htop
      neofetch
      mpv
      okular
      #retroarch
      #cemu
      #rpcs3
      #bottles
      discord
      prismlauncher
      #blockbench-electron
      #appimage-run
      #cataclysm-dda-git
      mindustry
      yewtube
      bottom
      bat
      #piper-tts
      (import ../scripts/fav.nix { inherit pkgs; })
      (import ../scripts/v.nix { inherit pkgs; })
  ];

  home.sessionVariables = {
    
  };

  # Bash 
  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''

  export EDITOR=nvim

  '';
  # Bash change?
  #[ -f ~/.bashrc ] && echo -e '\nexport GPG_TTY=$(tty)' >> ~/.bashrc

  programs.bash.shellAliases = {
    sc="df -h";
    ne="nvim /etc/nixos/configuration.nix";
    nes="nvim /etc/nixos/scripts/";
    nem="nvim /etc/nixos/modules/";
    ned="nvim /etc/nixos/derivations/";
    nef="nvim /etc/nixos/flake.nix";
    he="nvim /etc/nixos/modules/home.nix";
    mind="cd ~/Documets/mind-test/ && nvim ";
    xright="xrandr --auto --output eDP-1 --auto --output HDMI-1 --auto --right-of eDP-1";
    cat="bat";
    #c="fasd_cd -d";
    };

  # .vimrc
  home.file.".vimrc".text = ''
  set clipboard+=unnamedplus
  '';

  programs.home-manager.enable = true;

  # SpectrWM
  home.file.".config/spectrwm/spectrwm.conf".source = ./home-manager/spectrwm/spectrwm.conf;
  # Baraction
  home.file.".config/spectrwm/baraction.sh".source = ./home-manager/spectrwm/baraction.sh;


  #AwesomeWM rc.lua
  #home.file.".config/awesome/rc.lua".source = ./home-manager/awesome/rc.lua

  #AwesomeWM theme.lua
  #home.file.".config/awesome/theme.lua".source = ./home-manager/awesome/theme.lua
  
  #Neovim
  #/*
  programs.neovim = {
  enable = true;
  
  plugins = with pkgs.vimPlugins; [
  {
    plugin = nightfox-nvim;
    #config = "vim.cmd('colorscheme nightfox')";
  }
  {
    plugin = nvim-snippy;
  }
  {
    plugin = nvim-dap;
  }
  {
    plugin = telescope-nvim;
  }
  {
    plugin = nvim-treesitter.withPlugins (p: [ p.css p.c p.java p.nix p.lua p.javascript p.markdown]);
    /*config = ''require("nvim-treesitter.configs").setup({
               highlight = {
               enable = true,
              },
            })''*/
  }
  {
    plugin = nvim-lspconfig;
  }
  {
    plugin = nvim-jdtls;
  }
  {
    plugin = snippets-nvim;
  }
  {
    plugin = nvim-cmp;
  }
  {
    plugin = neorg;
    config = '''';
  }
  #{
  #  plugin = luasnip;
  #}
  #{
  #  plugin = friendly-snippets;
  #}
  {
    plugin = cmp-nvim-lsp;
  }
  {
    plugin = lazygit-nvim;
  }
  {
    plugin = ultisnips;
  }
  #{
  #  plugin = orgmode;
  #}
  #{
  #  plugin = ollama-nvim;
  #}
  #{
  #  plugin = markdown-preview-nvim;
  #}
  ];

  extraLuaConfig = ''
      
      local opt = vim.opt

      --require('config')
      opt.termguicolors = true
      vim.cmd('colorscheme nightfox')

      -- tab/indentions
      opt.tabstop = 2
      opt.shiftwidth = 2
      opt.softtabstop = 2
      opt.expandtab = true
      opt.smartindent = true
      opt.autoindent = true
      opt.wrap = false

      --clipboard
      vim.api.nvim_set_option("clipboard","unnamed")

      -- telescope keybinds
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-n>', builtin.find_files, {})
    '';
  };
 #*/
 /*
 programs.nixvim = {
  plugins = {
    telescope.enable = true;
  };
 #colorscheme.nightfox.enable = true;
 };
#*/

  # vim
  /*
  programs.vim{
    enable = true;
    settings = {
      background = "dark";
      expandtab = true;
      history = 50;
      tabstop = 2;
      };
    plugins = with pkgs.vimPlugins[
      {
        plugin = 
      }
    ];
    };
 #/ 
  # Tmux
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "alacritty";
    mouse = true;
    shortcut = "a";
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
      }
      {
        plugin = continuum;
      }
      {
        plugin = yank;
      }
      {
        plugin = vim-tmux-navigator;
      }
      #{
      #  plugin = tmuxifier;
      #}

   ];
   extraConfig = ''
     set -g default-terminal "tmux-256color"
     set -ag terminal-overrides ",xterm-256color:RGB"
     set-option -sg escape-time 10
     '';
    };
 #*/ 
  # LF
  programs.lf = {
    enable = true;
    settings = {
      icons = false;
      drawbox = true;
      };
    keybindings = {
      gh="cd ~/";
      DD="delete";
      x="cut";
      au="unarchive";
      bf="mkfile";
      bd="mkdir";
      o="open";
      "."="set hidden!";
      gg="gogo";
      };
     extraConfig = ''
      cmd unarchive ''${{
        case "$f" in
            *.zip) nix run nixpkgs#unzip "$f" ;;
            *.tar) nix run nixpkgs#gnutar xvf "$f" ;;
            *.gz) nix run nixpkgs#gnutar xvf "$f" ;;
            *.jar) nix run nixpkgs#fastjar xf "$f" ;;
            *) echo "Unsupported Format" && read null ;;
        esac
      }}

      cmd mkdir ''${{
        printf "Directory Name: "
        read ans
        mkdir $ans 
      }}
      
      cmd mkfile ''${{
        printf "File Name: "
        read ans
        mkdir $ans
      }}
      
      cmd open ''${{
        case "$f" in
            *.pdf) nix run nixpkgs#okular "$f" ;;
            *.jpg) nix run nixpkgs#feh "$f" ;;
            *.png) nix run nixpkgs#feh "$f" ;;
            *.PNG) nix run nixpkgs#feh "$f" ;;
            *.webp) nix run nixpkgs#feh "$f" ;;
            *.webm) nix run nixpkgs#mpv "$f" ;;
            *.mkv) nix run nixpkgs#mpv "$f" ;;
            *.mp4) nix run nixpkgs#mpv "$f" ;;
            *.mp3) nix run nixpkgs#mpv "$f" ;;
            *.m4a) nix run nixpkgs#mpv "$f" ;;
            *.ogg) nix run nixpkgs#mpv "$f" ;;
            *.opus) nix run nixpkgs#mpv "$f" ;;
            *.mov) nix run nixpkgs#mpv "$f" ;;
            *) echo "Unsupported Format" && read null ;;
        esac
      }}
      
      '';
    };

}
