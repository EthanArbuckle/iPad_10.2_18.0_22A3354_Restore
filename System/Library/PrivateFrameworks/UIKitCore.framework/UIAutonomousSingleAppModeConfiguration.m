@implementation UIAutonomousSingleAppModeConfiguration

+ (id)defaultConfiguration
{
  return (id)objc_msgSend(a1, "defaultConfigurationForStyle:", 2);
}

+ (id)defaultConfigurationForStyle:(unint64_t)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setStyle:", a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v5, "setStyle:", -[UIAutonomousSingleAppModeConfiguration style](self, "style"));
  v6 = -[NSDictionary copyWithZone:](self->_managedConfigurationSettings, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSMutableDictionary mutableCopy](self->_propertiesAsDictionary, "mutableCopy");
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)allowsLockButton
{
  return -[UIAutonomousSingleAppModeConfiguration _BOOLValueForFeatureKey:](self, "_BOOLValueForFeatureKey:", CFSTR("AllowsLockButton"));
}

- (void)setAllowsLockButton:(BOOL)a3
{
  -[UIAutonomousSingleAppModeConfiguration _setBoolValue:forFeatureKey:](self, "_setBoolValue:forFeatureKey:", a3, CFSTR("AllowsLockButton"));
}

- (BOOL)allowsAutoLock
{
  return -[UIAutonomousSingleAppModeConfiguration _BOOLValueForFeatureKey:](self, "_BOOLValueForFeatureKey:", CFSTR("AllowsAutoLock"));
}

- (void)setAllowsAutoLock:(BOOL)a3
{
  -[UIAutonomousSingleAppModeConfiguration _setBoolValue:forFeatureKey:](self, "_setBoolValue:forFeatureKey:", a3, CFSTR("AllowsAutoLock"));
}

- (BOOL)allowsAccessibilityShortcut
{
  return -[UIAutonomousSingleAppModeConfiguration _BOOLValueForFeatureKey:](self, "_BOOLValueForFeatureKey:", CFSTR("AllowsAccessibilityShortcut"));
}

- (void)setAllowsAccessibilityShortcut:(BOOL)a3
{
  -[UIAutonomousSingleAppModeConfiguration _setBoolValue:forFeatureKey:](self, "_setBoolValue:forFeatureKey:", a3, CFSTR("AllowsAccessibilityShortcut"));
}

- (BOOL)automaticallyRelaunchesAfterAppCrash
{
  return -[UIAutonomousSingleAppModeConfiguration _BOOLValueForFeatureKey:](self, "_BOOLValueForFeatureKey:", CFSTR("AutomaticallyRelaunchesAfterAppCrash"));
}

- (void)setAutomaticallyRelaunchesAfterAppCrash:(BOOL)a3
{
  -[UIAutonomousSingleAppModeConfiguration _setBoolValue:forFeatureKey:](self, "_setBoolValue:forFeatureKey:", a3, CFSTR("AutomaticallyRelaunchesAfterAppCrash"));
}

- (BOOL)showsUserConfirmationPromptsAndBanners
{
  return -[UIAutonomousSingleAppModeConfiguration _BOOLValueForFeatureKey:](self, "_BOOLValueForFeatureKey:", CFSTR("ShowsUserConfirmationPromptsAndBanners"));
}

- (void)setShowsUserConfirmationPromptsAndBanners:(BOOL)a3
{
  -[UIAutonomousSingleAppModeConfiguration _setBoolValue:forFeatureKey:](self, "_setBoolValue:forFeatureKey:", a3, CFSTR("ShowsUserConfirmationPromptsAndBanners"));
}

- (NSDictionary)propertiesAsDictionary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_propertiesAsDictionary, "copy");
}

- (BOOL)_BOOLValueForFeatureKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertiesAsDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    +[UIApplication _accessibilityLoadSettingsLoaderIfNeeded](UIApplication, "_accessibilityLoadSettingsLoaderIfNeeded");
    v7 = -[UIAutonomousSingleAppModeConfiguration __gaxTrampoline_defaultBoolValueForFeatureKey:](self, "__gaxTrampoline_defaultBoolValueForFeatureKey:", v4);
  }
  v8 = v7;

  return v8;
}

- (void)_setBoolValue:(BOOL)a3 forFeatureKey:(id)a4
{
  _BOOL8 v4;
  NSMutableDictionary *v6;
  NSMutableDictionary *propertiesAsDictionary;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (!self->_propertiesAsDictionary)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    propertiesAsDictionary = self->_propertiesAsDictionary;
    self->_propertiesAsDictionary = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_propertiesAsDictionary, "setObject:forKeyedSubscript:", v8, v9);

}

- (BOOL)__gaxTrampoline_defaultBoolValueForFeatureKey:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UIAutonomousSingleAppModeErrorDomain"), CFSTR("Unable to get the default value of %@. Ensure that your app is properly entitled."), a3);
  return 0;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSDictionary)managedConfigurationSettings
{
  return self->_managedConfigurationSettings;
}

- (void)setManagedConfigurationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_managedConfigurationSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfigurationSettings, 0);
  objc_storeStrong((id *)&self->_propertiesAsDictionary, 0);
}

@end
