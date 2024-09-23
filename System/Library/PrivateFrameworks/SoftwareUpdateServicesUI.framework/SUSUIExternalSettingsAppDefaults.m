@implementation SUSUIExternalSettingsAppDefaults

- (SUSUIExternalSettingsAppDefaults)init
{
  SUSUIExternalSettingsAppDefaults *v3;
  id v4;

  v4 = 0;
  v4 = -[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.Preferences"));
  v3 = (SUSUIExternalSettingsAppDefaults *)v4;
  objc_storeStrong(&v4, 0);
  return v3;
}

+ (BOOL)__useDynamicMethodResolution
{
  return 0;
}

- (BOOL)isBadgedForSoftwareUpdate
{
  id v3;
  char v4;

  v3 = -[BSAbstractDefaultDomain _store](self, "_store");
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("kBadgedForSoftwareUpdateKey"));

  return v4 & 1;
}

- (void)setBadgedForSoftwareUpdate:(BOOL)a3
{
  id v3;
  id v4;
  BOOL v5;

  v5 = a3;
  v3 = -[BSAbstractDefaultDomain _store](self, "_store");
  objc_msgSend(v3, "setBool:forKey:", v5);

  v4 = -[BSAbstractDefaultDomain _store](self, "_store");
  objc_msgSend(v4, "synchronize");

  GSSendAppPreferencesChanged();
}

@end
