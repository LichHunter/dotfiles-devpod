{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "lichhunter-tools";
      paths = [
        jdk # for now this will be java21
        maven
      ];
    };
  };
}
