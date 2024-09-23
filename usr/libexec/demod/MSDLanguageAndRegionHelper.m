@implementation MSDLanguageAndRegionHelper

+ (id)sharedInstance
{
  if (qword_100175628 != -1)
    dispatch_once(&qword_100175628, &stru_10013FFD8);
  return (id)qword_100175620;
}

- (int)setDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  int v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v22 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper _systemLocalizedLanguageCodeFromArray:](self, "_systemLocalizedLanguageCodeFromArray:", v8));

  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543874;
    v17 = v6;
    v18 = 2114;
    v19 = v9;
    v20 = 2114;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting device language to %{public}@ (%{public}@) and region code to %{public}@.", (uint8_t *)&v16, 0x20u);
  }

  if (-[MSDLanguageAndRegionHelper _isCurrentDeviceLanguage:andRegion:](self, "_isCurrentDeviceLanguage:andRegion:", v9, v7))
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543874;
      v17 = v6;
      v18 = 2114;
      v19 = v9;
      v20 = 2114;
      v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device already has language %{public}@ (%{public}@) and region %{public}@", (uint8_t *)&v16, 0x20u);
    }

    v14 = 2;
  }
  else
  {
    +[IPSettingsUtilities setRegion:](IPSettingsUtilities, "setRegion:", v7);
    +[IPSettingsUtilities setLanguage:](IPSettingsUtilities, "setLanguage:", v9);
    v14 = 0;
  }

  return v14;
}

- (id)getCurrentDeviceLanguage
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper _systemLocalizedLanguageCodeFromArray:](self, "_systemLocalizedLanguageCodeFromArray:", v3));

  return v4;
}

- (id)getCurrentDevicePreferredLanguage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return v3;
}

- (id)getCurrentDeviceRegion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "countryCode"));

  return v3;
}

- (id)getCurrentLocaleCode
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper getCurrentDevicePreferredLanguage](self, "getCurrentDevicePreferredLanguage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper getCurrentDeviceRegion](self, "getCurrentDeviceRegion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v3, v4));

  return v5;
}

- (BOOL)_isCurrentDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper getCurrentDeviceLanguage](self, "getCurrentDeviceLanguage"));
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLanguageAndRegionHelper getCurrentDeviceRegion](self, "getCurrentDeviceRegion"));
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_systemLocalizedLanguageCodeFromArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale systemLanguages](NSLocale, "systemLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v4, v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  return v6;
}

@end
