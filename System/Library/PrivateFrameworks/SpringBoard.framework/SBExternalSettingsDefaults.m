@implementation SBExternalSettingsDefaults

- (SBExternalSettingsDefaults)init
{
  return (SBExternalSettingsDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.Preferences"));
}

+ (BOOL)__useDynamicMethodResolution
{
  return 0;
}

- (BOOL)isBadgedForSoftwareUpdate
{
  void *v2;
  char v3;

  -[BSAbstractDefaultDomain _store](self, "_store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("kBadgedForSoftwareUpdateKey"));

  return v3;
}

- (void)setBadgedForSoftwareUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[BSAbstractDefaultDomain _store](self, "_store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("kBadgedForSoftwareUpdateKey"));

  -[BSAbstractDefaultDomain _store](self, "_store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronize");

  GSSendAppPreferencesChanged();
}

@end
