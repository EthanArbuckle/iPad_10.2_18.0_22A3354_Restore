@implementation SMMobileSMSPreferencesUtilities

+ (id)store
{
  if (qword_254415CC8 != -1)
    dispatch_once(&qword_254415CC8, &__block_literal_global_0);
  return (id)_MergedGlobals_13;
}

uint64_t __40__SMMobileSMSPreferencesUtilities_store__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1888]), "initWithStoreIdentifier:type:", CFSTR("com.apple.MobileSMS"), 0);
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v0;

  return objc_msgSend((id)_MergedGlobals_13, "synchronize");
}

+ (id)legacyStore
{
  if (qword_254415CD8 != -1)
    dispatch_once(&qword_254415CD8, &__block_literal_global_20);
  return (id)qword_254415CD0;
}

void __46__SMMobileSMSPreferencesUtilities_legacyStore__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  id v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  if (v2)
    v4 = 0;
  else
    v4 = CFSTR("com.apple.MobileSMS");
  v5 = objc_msgSend(v3, "initWithSuiteName:", v4);
  v6 = (void *)qword_254415CD0;
  qword_254415CD0 = v5;

}

+ (id)duetExpertStore
{
  if (qword_254415CE8 != -1)
    dispatch_once(&qword_254415CE8, &__block_literal_global_23);
  return (id)qword_254415CE0;
}

void __50__SMMobileSMSPreferencesUtilities_duetExpertStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.duetexpertd"));
  v1 = (void *)qword_254415CE0;
  qword_254415CE0 = v0;

}

+ (void)migrateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_syncSiriLockScreenSuggestionsPrefIfNeeded");
  objc_msgSend(a1, "legacyStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SafetyMonitorFirstTimeUI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "legacyStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SafetyMonitorUseCriticalAlerts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "legacyStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("SafetyMonitorShareAllLocations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 || v6 || v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v11;
      _os_log_impl(&dword_245521000, v9, OS_LOG_TYPE_INFO, "%@, migrating legacy preferences", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend(a1, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("SafetyMonitorFirstTimeUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      objc_msgSend(a1, "_setMobileSMSPreferencesValue:forKey:", v4, CFSTR("SafetyMonitorFirstTimeUI"));
    objc_msgSend(a1, "store");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("SafetyMonitorUseCriticalAlerts"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      objc_msgSend(a1, "_setMobileSMSPreferencesValue:forKey:", v6, CFSTR("SafetyMonitorUseCriticalAlerts"));
    objc_msgSend(a1, "store");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("SafetyMonitorShareAllLocations"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_msgSend(a1, "_setMobileSMSPreferencesValue:forKey:", v8, CFSTR("SafetyMonitorShareAllLocations"));
    objc_msgSend(a1, "legacyStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeObjectForKey:", CFSTR("SafetyMonitorFirstTimeUI"));

    objc_msgSend(a1, "legacyStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("SafetyMonitorUseCriticalAlerts"));

    objc_msgSend(a1, "legacyStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removeObjectForKey:", CFSTR("SafetyMonitorShareAllLocations"));

  }
}

+ (void)_syncSiriLockScreenSuggestionsPrefIfNeeded
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "isLockScreenSuggestionsAllowed");
  if ((_DWORD)v3 != objc_msgSend(a1, "isMobileSMSPreferencesLockScreenSuggestionsAllowed"))
    objc_msgSend(a1, "_syncSiriLockScreenSuggestionsPrefWithValue:", v3);
}

+ (void)_syncSiriLockScreenSuggestionsPrefWithValue:(BOOL)a3
{
  _BOOL8 v3;
  const void *v5;
  CFTypeRef v6;
  id v7;

  v3 = a3;
  v5 = (const void *)MGCopyAnswer();
  v6 = CFAutorelease(v5);
  if (CFEqual(v6, CFSTR("iPhone")))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setMobileSMSPreferencesValue:forKey:", v7, CFSTR("SafetyMonitorLockscreenSuggestionsEnabledWatch"));

  }
}

+ (void)syncSiriLockScreenSuggestionsPrefs
{
  objc_msgSend(a1, "_syncSiriLockScreenSuggestionsPrefWithValue:", objc_msgSend(a1, "isLockScreenSuggestionsAllowed"));
}

+ (id)_copyMobileSMSPreferencesValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_245521000, v7, OS_LOG_TYPE_INFO, "%@, getting preference %@ value: %@", (uint8_t *)&v11, 0x20u);

  }
  return v6;
}

+ (id)_copyDuetExpertPreferencesValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "duetExpertStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v9;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_245521000, v7, OS_LOG_TYPE_INFO, "%@, getting preference %@ value: %@", (uint8_t *)&v11, 0x20u);

  }
  return v6;
}

+ (void)_setMobileSMSPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_245521000, v8, OS_LOG_TYPE_INFO, "%@, setting preference %@ to %@", (uint8_t *)&v12, 0x20u);

  }
  objc_msgSend(a1, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v6, v7);

}

+ (BOOL)hasUserCompletedOnboarding
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(a1, "_copyMobileSMSPreferencesValueForKey:", CFSTR("SafetyMonitorFirstTimeUI"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (void)setHasUserCompletedOnboarding:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setHasUserCompletedOnboarding:", v4);

}

+ (void)clearHasUserCompletedOnboarding
{
  objc_msgSend(a1, "_setHasUserCompletedOnboarding:", 0);
}

+ (void)_setHasUserCompletedOnboarding:(id)a3
{
  objc_msgSend(a1, "_setMobileSMSPreferencesValue:forKey:", a3, CFSTR("SafetyMonitorFirstTimeUI"));
}

+ (BOOL)shareAllLocations
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(a1, "_copyMobileSMSPreferencesValueForKey:", CFSTR("SafetyMonitorShareAllLocations"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

+ (void)setShareAllLocations:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setShareAllLocations:", v4);

}

+ (void)clearShareAllLocations
{
  objc_msgSend(a1, "_setShareAllLocations:", 0);
}

+ (void)_setShareAllLocations:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(a1, "_setMobileSMSPreferencesValue:forKey:", a3, CFSTR("SafetyMonitorShareAllLocations"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SMShareAllLocationsChangedNotification"), 0, 0, 1u);
}

+ (BOOL)isUserOnBoardedForCriticalAlert
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "_criticalAlertPreference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (int64_t)criticalAlertPreference
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(a1, "_criticalAlertPreference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "BOOLValue"))
      v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_criticalAlertPreference
{
  return (id)objc_msgSend(a1, "_copyMobileSMSPreferencesValueForKey:", CFSTR("SafetyMonitorUseCriticalAlerts"));
}

+ (void)setCriticalAlertPreference:(int64_t)a3
{
  uint64_t v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 1);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v6 = (id)v4;
  objc_msgSend(a1, "_setMobileSMSPreferencesValue:forKey:", v4, CFSTR("SafetyMonitorUseCriticalAlerts"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.SafetyMonitorUseCriticalAlerts.changed"), 0, 0, 1u);

}

+ (void)clearCriticalAlertUserPreference
{
  objc_msgSend(a1, "setCriticalAlertPreference:", 0);
}

+ (BOOL)isMobileSMSPreferencesLockScreenSuggestionsAllowed
{
  void *v2;
  void *v3;
  char v4;

  v2 = (void *)objc_msgSend(a1, "_copyMobileSMSPreferencesValueForKey:", CFSTR("SafetyMonitorLockscreenSuggestionsEnabledWatch"));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

+ (BOOL)isLockScreenSuggestionsAllowed
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  void *v9;
  void *v10;
  int AppBooleanValue;
  int v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  BOOL v20;
  BOOL v21;
  Boolean keyExistsAndHasValidFormat;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (id)objc_msgSend(a1, "_copyDuetExpertPreferencesValueForKey:", CFSTR("LockscreenSuggestionsDisabledBundles"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x249537858]();
        v7 &= objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.MobileSMS")) ^ 1;
        objc_autoreleasePoolPop(v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("LockScreenSuggestionsDisabled"), CFSTR("com.apple.lockscreen.shared"), &keyExistsAndHasValidFormat);
  v12 = keyExistsAndHasValidFormat;
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("NO");
    *(_DWORD *)buf = 138413314;
    v29 = v15;
    if (AppBooleanValue)
      v19 = CFSTR("NO");
    else
      v19 = CFSTR("YES");
    v30 = 2112;
    if (keyExistsAndHasValidFormat)
      v18 = CFSTR("YES");
    v31 = v16;
    v32 = 2112;
    v33 = v3;
    v34 = 2112;
    v35 = v19;
    v36 = 2112;
    v37 = v18;
    _os_log_impl(&dword_245521000, v13, OS_LOG_TYPE_INFO, "%@, %@, lockscreenSuggestionsDisabledBundles, %@, globalSiriSuggestionsEnabled, %@, globalSiriSuggestionsEnabledQuerySuccess, %@", buf, 0x34u);

  }
  if (v12)
    v20 = AppBooleanValue == 0;
  else
    v20 = 1;
  if (v20)
    v21 = v7;
  else
    v21 = 0;

  return v21;
}

@end
