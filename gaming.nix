{config, libs, pkgs, ...}:

{
  nixpkgs.config.allowUnfree = true;
  programs.steam = {
    enable = true;
  };
  environment.systemPackages = with pkgs; [
	ludusavi
	hydralauncher
	gnutar
	_7zz
	umu-launcher
	wineWow64Packages.stable
	winetricks
	moonlight-qt
  ];
}
