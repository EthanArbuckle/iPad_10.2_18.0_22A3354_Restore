@implementation SBHFloatingDockStyleConfiguration(SBAppAdditions)

+ (id)configurationWithEnvironmentMode:()SBAppAdditions
{
  id v3;

  if (a3 == 3)
  {
    if (configurationWithEnvironmentMode__onceToken != -1)
      dispatch_once(&configurationWithEnvironmentMode__onceToken, &__block_literal_global_269);
    v3 = (id)configurationWithEnvironmentMode__appConfiguration;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DAA460], "defaultConfiguration");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
