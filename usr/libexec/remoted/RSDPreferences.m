@implementation RSDPreferences

- (RSDPreferences)initWithPrefDomain:(id)a3
{
  id v5;
  RSDPreferences *v6;
  RSDPreferences *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RSDPreferences;
  v6 = -[RSDPreferences init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_prefDomain, a3);
    _CFPreferencesSetBackupDisabled(v7->_prefDomain, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost, 0, 1);
  }

  return v7;
}

- (void)migrateContentsOnDisk
{
  _UNKNOWN **v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(-[RSDPreferences valueForKey:](self, "valueForKey:", CFSTR("remoted-prefs-version")));
  if (!v3)
    v3 = &off_100052F80;
  v6 = v3;
  v4 = objc_msgSend(v3, "isEqual:", &off_100052F98);
  v5 = v6;
  if ((v4 & 1) == 0)
  {
    if (objc_msgSend(v6, "compare:", &off_100052F98) == (id)-1)
      -[RSDPreferences eraseAll](self, "eraseAll");
    -[RSDPreferences setValue:forKey:](self, "setValue:forKey:", &off_100052F98, CFSTR("remoted-prefs-version"));
    -[RSDPreferences synchronize](self, "synchronize");
    v5 = v6;
  }

}

- (void)eraseAll
{
  __CFString *v3;
  const __CFArray *v4;
  __CFString *v5;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
  v4 = CFPreferencesCopyKeyList(v3, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  if (v4)
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
    CFPreferencesSetMultiple(0, v4, v5, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

    CFRelease(v4);
  }
}

- (id)valueForKey:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v4 = (__CFString *)a3;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
  v6 = (void *)CFPreferencesCopyValue(v4, v5, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  return v6;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  __CFString *v6;
  id v7;
  __CFString *v8;

  v6 = (__CFString *)a4;
  v7 = a3;
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
  CFPreferencesSetValue(v6, v7, v8, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

}

- (void)synchronize
{
  __CFString *v2;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RSDPreferences prefDomain](self, "prefDomain"));
  CFPreferencesAppSynchronize(v2);

}

- (NSString)prefDomain
{
  return self->_prefDomain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefDomain, 0);
}

@end
