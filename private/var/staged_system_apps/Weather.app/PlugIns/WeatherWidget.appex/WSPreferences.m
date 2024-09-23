@implementation WSPreferences

+ (BOOL)readBoolFromContainerPreferenceValueForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WSPreferences readContainerPreferenceValueForKey:](WSPreferences, "readContainerPreferenceValueForKey:", a3));
  if (v5)
  {
    v6 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      a4 = objc_msgSend(v5, "BOOLValue");
  }

  return a4;
}

+ (id)readContainerPreferenceValueForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.weather"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupContainerURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("group.com.apple.weather")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.weather")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
  }
  v10 = (void *)_CFPreferencesCopyAppValueWithContainer(v3, CFSTR("group.com.apple.weather"), v7);

  return v10;
}

+ (void)writePreferenceForKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.weather"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupContainerURLs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("group.com.apple.weather")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.weather")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
  }
  _CFPreferencesSetAppValueWithContainer(v12, v5, CFSTR("group.com.apple.weather"), v9);
  _CFPreferencesAppSynchronizeWithContainer(CFSTR("group.com.apple.weather"), v9);

}

@end
