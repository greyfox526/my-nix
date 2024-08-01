{pkgs, config, ...}:

{
  programs.dconf.enable = true;
  /*user.users.greyfox = {
      virt-manager
    };
*/
    home.packages = with pkgs;[
      virt-manager
    ];
}
