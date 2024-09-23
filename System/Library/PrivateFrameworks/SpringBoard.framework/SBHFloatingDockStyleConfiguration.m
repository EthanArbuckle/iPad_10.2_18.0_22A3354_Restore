@implementation SBHFloatingDockStyleConfiguration

void __86__SBHFloatingDockStyleConfiguration_SBAppAdditions__configurationWithEnvironmentMode___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DAA460], "defaultConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithWantsPlatterShadow:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)configurationWithEnvironmentMode__appConfiguration;
  configurationWithEnvironmentMode__appConfiguration = v0;

}

@end
