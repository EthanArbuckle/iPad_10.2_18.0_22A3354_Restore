@implementation WLKManagedConfigurationInterface

+ (void)setTVAppAllowed:(BOOL)a3
{
  objc_msgSend(a1, "setTVAppAllowed:silent:", a3, 0);
}

+ (void)setTVAppAllowed:(BOOL)a3 silent:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D47158];
  v7 = objc_msgSend(v5, "userBoolValueForSetting:", *MEMORY[0x1E0D47158]);

  if (v4)
    v8 = 2;
  else
    v8 = 1;
  if (v7 == v8)
  {
    NSLog(CFSTR("WLKManagedConfigurationInterface - Fixing mismatched user setting."));
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeBoolSetting:", v6);

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "MCSetBoolRestriction:value:", v6, v4);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = objc_msgSend(v11, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v10, CFSTR("com.apple.WatchListKit.isTVAllowed"), CFSTR("com.apple.WatchListKit.isTVAllowed"), 0, 0, 0, 0, &v14);
  v13 = v14;

  if ((v12 & 1) == 0)
    NSLog(CFSTR("WLKManagedConfigurationInterface - Unable to set the MC feature flag: %@"), v13);

}

@end
