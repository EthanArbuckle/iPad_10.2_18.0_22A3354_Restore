@implementation ACMExternalAppleConnectPreferences

- (id)createEnvironmentWithRealm:(id)a3
{
  return +[ACMEnvironmentPreferences environmentPreferencesWithRealm:](ACMExternalEnvironmentPreferences, "environmentPreferencesWithRealm:", a3);
}

- (NSData)secret
{
  return (NSData *)-[ACMPreferencesStore preferencesValueForKey:withOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "preferencesValueForKey:withOptions:", CFSTR("com.apple.ist.appleconnect.tgt"), 2);
}

- (void)setSecret:(id)a3
{
  -[ACMPreferencesStore setPreferencesValue:forKey:withOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "setPreferencesValue:forKey:withOptions:", a3, CFSTR("com.apple.ist.appleconnect.tgt"), 2);
}

@end
