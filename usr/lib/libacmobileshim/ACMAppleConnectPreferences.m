@implementation ACMAppleConnectPreferences

+ (id)preferencesWithStore:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPreferencesStore:", a3);
}

- (ACMAppleConnectPreferences)initWithPreferencesStore:(id)a3
{
  ACMAppleConnectPreferences *v4;
  ACMAppleConnectPreferences *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACMAppleConnectPreferences;
  v4 = -[ACMAppleConnectPreferences init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ACMPreferences setPreferencesStore:](v4, "setPreferencesStore:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->_environmentsContainer = 0;
  v3.receiver = self;
  v3.super_class = (Class)ACMAppleConnectPreferences;
  -[ACMPreferences dealloc](&v3, sel_dealloc);
}

- (NSMutableDictionary)environmentsContainer
{
  NSMutableDictionary *environmentsContainer;

  objc_sync_enter(self);
  environmentsContainer = self->_environmentsContainer;
  if (!environmentsContainer)
  {
    environmentsContainer = (NSMutableDictionary *)objc_opt_new();
    self->_environmentsContainer = environmentsContainer;
  }
  objc_sync_exit(self);
  return environmentsContainer;
}

- (id)createEnvironmentWithRealm:(id)a3
{
  return +[ACMEnvironmentPreferences environmentPreferencesWithRealm:](ACMEnvironmentPreferences, "environmentPreferencesWithRealm:", a3);
}

- (id)environmentPreferencesWithRealm:(id)a3
{
  id v5;

  objc_sync_enter(self);
  v5 = (id)-[NSMutableDictionary objectForKey:](-[ACMAppleConnectPreferences environmentsContainer](self, "environmentsContainer"), "objectForKey:", a3);
  if (!v5)
  {
    v5 = -[ACMAppleConnectPreferences createEnvironmentWithRealm:](self, "createEnvironmentWithRealm:", a3);
    if (v5)
    {
      objc_msgSend(v5, "setPreferencesStore:", -[ACMPreferences preferencesStore](self, "preferencesStore"));
      -[NSMutableDictionary setObject:forKey:](-[ACMAppleConnectPreferences environmentsContainer](self, "environmentsContainer"), "setObject:forKey:", v5, a3);
    }
  }
  objc_sync_exit(self);
  return v5;
}

- (id)principalPreferencesWithPrincipal:(id)a3
{
  return (id)objc_msgSend(-[ACMAppleConnectPreferences environmentPreferencesWithRealm:](self, "environmentPreferencesWithRealm:", objc_msgSend(a3, "realm")), "principalPreferencesWithUserName:", objc_msgSend(a3, "userName"));
}

- (NSString)recentUserName
{
  return (NSString *)-[ACMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", CFSTR("ACMRecentUserName"));
}

- (void)setRecentUserName:(id)a3
{
  -[ACMPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", a3, CFSTR("ACMRecentUserName"));
}

- (int)logLevel
{
  id v2;

  v2 = -[ACMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", CFSTR("ACCLogLevel"));
  if (v2)
    return objc_msgSend(v2, "intValue");
  else
    return ACFLogSettingsGetLevel();
}

- (void)setLogLevel:(int)a3
{
  -[ACMPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3), CFSTR("ACCLogLevel"));
}

- (NSString)defaultUserName
{
  return (NSString *)-[ACMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", CFSTR("ACCDefaultUserName"));
}

- (void)setDefaultUserName:(id)a3
{
  -[ACMPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", a3, CFSTR("ACCDefaultUserName"));
}

- (id)UUID
{
  return -[ACMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", CFSTR("ACCUUID"));
}

- (void)setUUID:(id)a3
{
  if (a3)
    -[ACMPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", a3, CFSTR("ACCUUID"));
}

- (BOOL)runsOn64BitsDevice
{
  return objc_msgSend((id)-[ACMPreferencesStore preferencesValueForKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "preferencesValueForKey:", CFSTR("ACCRunsOn64BitsDevice")), "BOOLValue");
}

- (void)setRunsOn64BitsDevice:(BOOL)a3
{
  _BOOL8 v3;
  ACMPreferencesStore *v4;

  v3 = a3;
  v4 = -[ACMPreferences preferencesStore](self, "preferencesStore");
  -[ACMPreferencesStore setPreferencesValue:forKey:](v4, "setPreferencesValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3), CFSTR("ACCRunsOn64BitsDevice"));
}

- (void)setShouldRememberPasswordInKeychain:(BOOL)a3
{
  -[ACMPreferences setPreferencesValue:forKey:](self, "setPreferencesValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("ACCRememberPassword"));
}

- (BOOL)shouldRememberPasswordInKeychain
{
  return objc_msgSend(-[ACMPreferences preferencesValueForKey:](self, "preferencesValueForKey:", CFSTR("ACCRememberPassword")), "BOOLValue");
}

- (void)purgeAllValues
{
  -[ACMPreferencesStore removeAllValues](-[ACMPreferences preferencesStore](self, "preferencesStore"), "removeAllValues");
}

- (void)purgeAllValuesWithOptions:(int64_t)a3
{
  -[ACMPreferencesStore removeAllValuesWithOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "removeAllValuesWithOptions:", a3);
}

- (id)allValuesWithOptions:(int64_t)a3
{
  return (id)-[ACMPreferencesStore allValuesWithOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "allValuesWithOptions:", a3);
}

- (void)replaceAllValues:(id)a3 withOptions:(int64_t)a4
{
  -[ACMPreferencesStore replaceAllValues:withOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "replaceAllValues:withOptions:", a3, a4);
}

- (void)clearCache
{
  -[ACMPreferencesStore clearCache](-[ACMPreferences preferencesStore](self, "preferencesStore"), "clearCache");
}

- (void)savePreferencesIfNeeded
{
  -[ACMPreferencesStore savePreferencesIfNeeded](-[ACMPreferences preferencesStore](self, "preferencesStore"), "savePreferencesIfNeeded");
  -[ACMPreferencesStore clearCache](-[ACMPreferences preferencesStore](self, "preferencesStore"), "clearCache");
}

- (void)cleanupOnMemoryWarning
{
  -[ACMPreferencesStore cleanupOnMemoryWarning](-[ACMPreferences preferencesStore](self, "preferencesStore"), "cleanupOnMemoryWarning");
}

@end
