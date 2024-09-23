@implementation MapsSettings

+ (NSString)settingsUpdatedNotificationKey
{
  return (NSString *)CFSTR("MapsAppSettingsUpdatedNotification");
}

+ (id)valueForDefaultsKey:(id)a3
{
  return _objc_msgSend(a1, "valueForDefaultsKey:defaultValue:", a3, 0);
}

+ (id)valueForDefaultsKey:(id)a3 defaultValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeDirectory"));

  v9 = (void *)_CFPreferencesCopyValueWithContainer(v6, CFSTR("com.apple.Maps"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost, v8);
  if (v9)
    v10 = v9;
  else
    v10 = v5;
  v11 = v10;

  return v11;
}

+ (id)valueForConfigKey:(id)a3
{
  return (id)_GEOConfigGetDecodedValueWithSource(*(_QWORD *)&a3.var0, a3.var1, 0, 0);
}

+ (void)setValue:(id)a3 forDefaultsKey:(id)a4 bundleID:(id)a5 syncToNano:(BOOL)a6
{
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t Log;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v26;
  _BOOL4 v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  CFStringRef v31;
  __int16 v32;
  CFStringRef v33;
  __int16 v34;
  CFStringRef v35;
  __int16 v36;
  CFStringRef v37;
  __int16 v38;
  __CFString *v39;

  v27 = a6;
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  if (v10)
    v11 = v10;
  else
    v11 = CFSTR("com.apple.Maps");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths", a1));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeDirectory"));

  v14 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsSettings");
  v16 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    v29 = v9;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = kCFPreferencesCurrentUser;
    v36 = 2112;
    v37 = kCFPreferencesAnyHost;
    v38 = 2112;
    v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "_CFPreferencesSetValueWithContainer(key= %@, value= %@, applicationId= %@, userName= %@, hostName= %@, containerPath= %@)", buf, 0x3Eu);
  }

  _CFPreferencesSetValueWithContainer(v9, v8, v11, kCFPreferencesCurrentUser, kCFPreferencesAnyHost, v13);
  v17 = GEOFindOrCreateLog(v14, "MapsSettings");
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v29 = v11;
    v30 = 2112;
    v31 = kCFPreferencesCurrentUser;
    v32 = 2112;
    v33 = kCFPreferencesAnyHost;
    v34 = 2112;
    v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "_CFPreferencesSynchronizeWithContainer(applicationID= %@, userName= %@, hostName= %@, containerPath= %@)", buf, 0x2Au);
  }

  _CFPreferencesSynchronizeWithContainer(v11, kCFPreferencesCurrentUser, kCFPreferencesAnyHost, v13);
  GSSendAppPreferencesChanged(v11, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSPMapsPaths mapsApplicationContainerPaths](MSPMapsPaths, "mapsApplicationContainerPaths"));
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "groupDirectory"));

  v21 = GEOFindOrCreateLog(v14, "MapsSettings");
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    v29 = v9;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = CFSTR("group.com.apple.Maps");
    v34 = 2112;
    v35 = kCFPreferencesCurrentUser;
    v36 = 2112;
    v37 = kCFPreferencesAnyHost;
    v38 = 2112;
    v39 = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "_CFPreferencesSetValueWithContainer(key= %@, value= %@, applicationId= %@, userName= %@, hostName= %@, containerPath= %@)", buf, 0x3Eu);
  }

  _CFPreferencesSetValueWithContainer(v9, v8, CFSTR("group.com.apple.Maps"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost, v20);
  v23 = GEOFindOrCreateLog(v14, "MapsSettings");
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v29 = CFSTR("group.com.apple.Maps");
    v30 = 2112;
    v31 = kCFPreferencesCurrentUser;
    v32 = 2112;
    v33 = kCFPreferencesAnyHost;
    v34 = 2112;
    v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "_CFPreferencesSynchronizeWithContainer(applicationID= %@, userName= %@, hostName= %@, containerPath= %@)", buf, 0x2Au);
  }

  _CFPreferencesSynchronizeWithContainer(CFSTR("group.com.apple.Maps"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost, v20);
  GSSendAppPreferencesChanged(CFSTR("group.com.apple.Maps"), v9);
  if (v27)
    objc_msgSend(v26, "_synchronizeNanoDefaultsForDomain:key:container:", v11, v9, v11);

}

+ (void)setValue:(id)a3 forConfigKey:(id)a4
{
  void *var1;
  uint64_t v5;
  id v6;
  uint64_t Log;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;

  var1 = a4.var1;
  v5 = *(_QWORD *)&a4.var0;
  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10077F04C;
  v15 = sub_10077F05C;
  v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10077F064;
  v10[3] = &unk_1011C63F8;
  v10[4] = &v11;
  GEOConfigGetPropertiesForKey(v5, var1, v10);
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsSettings");
  v8 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v12[5];
    *(_DWORD *)buf = 138412546;
    v18 = v9;
    v19 = 2112;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GEOConfigSet(key= %@, value= %@)", buf, 0x16u);
  }

  _GEOConfigSetEncodedValue(v5, var1, v6);
  _Block_object_dispose(&v11, 8);

}

+ (void)_synchronizeNanoDefaultsForDomain:(id)a3 key:(id)a4 container:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t Log;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 && v8)
  {
    v10 = objc_alloc_init((Class)NPSManager);
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "MapsSettings");
    v12 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412802;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "NPSManager synchronizeUserDefaultsDomain:%@, key= %@, container= %@)", (uint8_t *)&v14, 0x20u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v8));
    objc_msgSend(v10, "synchronizeUserDefaultsDomain:keys:container:", v7, v13, v9);

  }
}

+ (int64_t)selectedViewMode
{
  void *v3;
  unint64_t v4;
  int64_t v5;

  if ((objc_msgSend(a1, "_selectedViewModeIsExpired") & 1) != 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (unint64_t)objc_msgSend(v3, "integerForKey:", CFSTR("ViewMode"));

  if (v4 > 7)
    v5 = 0;
  else
    v5 = qword_100E3A400[v4];
  if (((v5 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
    return v5;
  else
    return 2;
}

+ (void)setSelectedViewMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if ((unint64_t)a3 > 7)
    v3 = 0;
  else
    v3 = qword_100E3A400[a3];
  if (((v3 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0)
    v4 = v3;
  else
    v4 = 2;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setInteger:forKey:", v4, CFSTR("ViewMode"));

}

+ (BOOL)_selectedViewModeIsExpired
{
  void *v2;
  double v3;
  double v4;
  void *v6;
  double v7;
  double v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "doubleForKey:", CFSTR("LastSuspendTime"));
  v4 = v3;

  if (v4 == 0.0)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v4));
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v7;

  return v8 < -GEOConfigGetDouble(MapsConfig_ViewModeExpirationTimeInterval, off_1014B4608);
}

+ (void)clearSelectedViewModeIfExpired
{
  id v2;

  if (objc_msgSend(a1, "_selectedViewModeIsExpired"))
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("ViewMode"));

  }
}

+ (void)setUserDesiresTraffic:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("DesiresTrafficKey"));

}

+ (BOOL)userDesiresTraffic
{
  void *v2;
  unsigned __int8 v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 BOOL;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "launchedToTest");

  if ((v3 & 1) != 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("DesiresTrafficKey")));

  v7 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    BOOL = objc_msgSend(v6, "BOOLValue");
  else
    BOOL = GEOConfigGetBOOL(MapsConfig_DefaultShowTraffic, off_1014B2D68);
  v4 = BOOL;

  return v4;
}

+ (void)setUserDesiresLabels:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("SatelliteMapShowLabelsKey"));

}

+ (BOOL)userDesiresLabels
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("SatelliteMapShowLabelsKey")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (BOOL)showsWeather
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager sharedManager](WeatherSettingsManager, "sharedManager"));
  v3 = objc_msgSend(v2, "shouldShowWeatherConditions");

  return v3;
}

+ (void)setShowsWeather:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager sharedManager](WeatherSettingsManager, "sharedManager"));
  objc_msgSend(v4, "setShouldShowWeatherConditions:", v3);

}

+ (BOOL)showsAirQualityIndex
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager sharedManager](WeatherSettingsManager, "sharedManager"));
  v3 = objc_msgSend(v2, "shouldShowAirQualityConditions");

  return v3;
}

+ (void)setShowsAirQualityIndex:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[WeatherSettingsManager sharedManager](WeatherSettingsManager, "sharedManager"));
  objc_msgSend(v4, "setShouldShowAirQualityConditions:", v3);

}

+ (BOOL)allowEmailCorrespondence
{
  return sub_100434624(CFSTR("RAPContactBackByEmailPreference")) != (id)2;
}

+ (void)setAllowEmailCorrespondence:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 1;
  else
    v3 = 2;
  sub_1004345C4(CFSTR("RAPContactBackByEmailPreference"), v3);
}

+ (BOOL)showsCompass
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MapsDefaultShowCompass")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (void)setShowsCompass:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("MapsDefaultShowCompass"));

  _objc_msgSend(a1, "postNotification");
}

+ (BOOL)showsZoomControls
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MapsDefaultShowZoomControls")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (void)setShowsZoomControls:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("MapsDefaultShowZoomControls"));

  _objc_msgSend(a1, "postNotification");
}

+ (BOOL)alwaysShowScale
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("MapsDefaultAlwaysShowScale")));

  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (void)setAlwaysShowScale:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("MapsDefaultAlwaysShowScale"));

  _objc_msgSend(a1, "postNotification");
}

+ (void)postNotification
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "settingsUpdatedNotificationKey"));
  objc_msgSend(v4, "postNotificationName:object:", v3, a1);

}

+ (NSString)preferredDistanceUnit
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  __CFString *v7;
  __CFString *v8;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MapsSettings valueForDefaultsKey:](MapsSettings, "valueForDefaultsKey:", CFSTR("DistanceUnits")));
  v3 = v2;
  if (!v2 || -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("FromLocale")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_navigation_objectForKey:", NSLocaleUsesMetricSystem));
    v6 = objc_msgSend(v5, "BOOLValue");

    v7 = CFSTR("Imperial");
    if (v6)
      v7 = CFSTR("Metric");
    v8 = v7;

    v3 = v8;
  }
  return (NSString *)v3;
}

+ (BOOL)usesMetric
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "preferredDistanceUnit"));
  v3 = objc_msgSend(CFSTR("Imperial"), "isEqualToString:", v2);

  return v3;
}

+ (void)setSystemMeasurementUnits
{
  void *v2;
  const __CFString *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", NSLocaleMeasurementSystem));

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Metric")))
    v3 = CFSTR("Metric");
  else
    v3 = CFSTR("Imperial");
  +[MapsSettings setValue:forDefaultsKey:bundleID:syncToNano:](MapsSettings, "setValue:forDefaultsKey:bundleID:syncToNano:", v3, CFSTR("DistanceUnits"), 0, 1);

}

@end
