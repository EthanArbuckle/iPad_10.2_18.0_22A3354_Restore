@implementation PUSlideshowSettingsPersistency

+ (id)createSlideshowSettingsViewModel
{
  void *v2;
  void *v3;
  PUSlideshowSettingsViewModel *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PUSlideshowSettingsManagerSettingsUserDefaultsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUSlideshowSettingsViewModel initWithPropertyDictionary:]([PUSlideshowSettingsViewModel alloc], "initWithPropertyDictionary:", v3);

  return v4;
}

+ (void)saveSlideshowSettingsViewModel:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("PUSlideshowSettingsManagerSettingsUserDefaultsKey"));
  objc_msgSend(v6, "synchronize");

}

@end
