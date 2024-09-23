@implementation SBSUIHomeScreenIconStyleSceneExtension

+ (id)settingsExtensions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_msgSend(MEMORY[0x1E0D23278], "extensionForProtocol:", &unk_1EE7D26A8);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)clientSettingsExtensions
{
  return 0;
}

+ (id)transitionContextExtensions
{
  return 0;
}

+ (id)hostComponents
{
  return 0;
}

+ (id)clientComponents
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
