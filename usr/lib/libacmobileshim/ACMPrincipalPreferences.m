@implementation ACMPrincipalPreferences

+ (id)preferencesForPrincipal:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPrincipal:", a3);
}

- (ACMPrincipalPreferences)initWithPrincipal:(id)a3
{
  ACMPrincipalPreferences *v4;
  ACMPrincipalPreferences *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACMPrincipalPreferences;
  v4 = -[ACMPrincipalPreferences init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ACMPrincipalPreferences setPrincipal:](v4, "setPrincipal:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[ACMPrincipalPreferences setPrincipal:](self, "setPrincipal:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMPrincipalPreferences;
  -[ACMPreferences dealloc](&v3, sel_dealloc);
}

- (id)userName
{
  return -[ACFPrincipal userName](-[ACMPrincipalPreferences principal](self, "principal"), "userName");
}

- (id)realm
{
  return -[ACFPrincipal realm](-[ACMPrincipalPreferences principal](self, "principal"), "realm");
}

- (NSString)clientSecret
{
  return (NSString *)-[ACMPreferencesStore preferencesValueForKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "preferencesValueForKey:", CFSTR("ACM2SVClientSecret"));
}

- (void)setClientSecret:(id)a3
{
  -[ACMPreferencesStore setPreferencesValue:forKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "setPreferencesValue:forKey:", a3, CFSTR("ACM2SVClientSecret"));
}

- (NSNumber)clientSecretCreateDate
{
  return (NSNumber *)-[ACMPreferencesStore preferencesValueForKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "preferencesValueForKey:", CFSTR("ACM2SVClientSecretCreateDate"));
}

- (void)setClientSecretCreateDate:(id)a3
{
  -[ACMPreferencesStore setPreferencesValue:forKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "setPreferencesValue:forKey:", a3, CFSTR("ACM2SVClientSecretCreateDate"));
}

- (NSNumber)personID
{
  return (NSNumber *)-[ACMPreferencesStore preferencesValueForKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "preferencesValueForKey:", CFSTR("ACMPersonID"));
}

- (void)setPersonID:(id)a3
{
  -[ACMPreferencesStore setPreferencesValue:forKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "setPreferencesValue:forKey:", a3, CFSTR("ACMPersonID"));
}

- (ACFPrincipal)principal
{
  return (ACFPrincipal *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrincipal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
