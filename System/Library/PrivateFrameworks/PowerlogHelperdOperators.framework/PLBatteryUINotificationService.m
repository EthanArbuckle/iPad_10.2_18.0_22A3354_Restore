@implementation PLBatteryUINotificationService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryUINotificationService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)initOperatorDependancies
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "\"bui_tlc_notif_iOS\" feature flag is disabled. Not calling Notification Service.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("Ursa"));

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "ursaNotificationIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  else
  {
    objc_msgSend(v10, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTlcNotificationIdentifier:", v8);
  }

}

id __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;

  v6 = a5;
  PLLogPausedCharging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_9();

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("ShowTLCNotification"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.powerlog.proactivenotifications"));
      v12 = *(_QWORD *)(a1 + 32);
      v11 = (id *)(a1 + 32);
      -[NSObject setDelegate:](v10, "setDelegate:", v12);
      -[NSObject setWantsNotificationResponsesDelivered](v10, "setWantsNotificationResponsesDelivered");
      objc_msgSend(*v11, "setUserNotificationCenter:", v10);
      PLLogPausedCharging();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_8();

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ShowTLCNotification"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");

      if (v15 == 1)
      {
        AnalyticsSendEventLazy();
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("TLC-%@"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v11, "setTlcNotificationIdentifier:", v18);

        PLLogPausedCharging();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_4(v11, v19);

        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("TLCNotificationState"));
        objc_msgSend(*v11, "surfaceNotification");
        PLLogPausedCharging();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_3();
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ShowTLCNotification"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "intValue");

        if (v22)
        {
          PLLogPausedCharging();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_7();
          goto LABEL_23;
        }
        AnalyticsSendEventLazy();
        PLLogPausedCharging();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_6();

        objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("TLCNotificationState"));
        objc_msgSend(*v11, "removeTLCNotification");
        PLLogPausedCharging();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_5();
      }

      PLLogPausedCharging();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_2();
LABEL_23:

      goto LABEL_24;
    }
  }
  PLLogPausedCharging();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_1();
LABEL_24:

  return v8;
}

void *__58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_30()
{
  return &unk_1EA1D9F98;
}

void *__58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_47()
{
  return &unk_1EA1D9FC0;
}

id __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v23;

  v6 = a5;
  PLLogUrsaNotification();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61_cold_4();

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v6
    && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ShowUrsaNotification")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.powerlog.proactivenotifications"));
    -[NSObject setDelegate:](v10, "setDelegate:", *(_QWORD *)(a1 + 32));
    -[NSObject setWantsNotificationResponsesDelivered](v10, "setWantsNotificationResponsesDelivered");
    objc_msgSend(*(id *)(a1 + 32), "setUrsaNotificationCenter:", v10);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ShowUrsaNotification"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    PLLogUrsaNotification();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);

    if (!(_DWORD)v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeUrsaNotifications");
      goto LABEL_13;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UrsaNotificationIssues"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UrsaNotificationIssues"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "surfaceNotificationForIssues:", v21);

LABEL_13:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("UrsaNotificationState"));
      goto LABEL_14;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("UrsaNotificationState"));
    PLLogUrsaNotification();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61_cold_2();

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("UrsaNotificationState"));
    PLLogUrsaNotification();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61_cold_1();
  }
LABEL_14:

  return v8;
}

- (void)surfaceNotification
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "tlcNotificationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "TLC: Surfacing Notification w Identifier: %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __53__PLBatteryUINotificationService_surfaceNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    PLLogPausedCharging();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__PLBatteryUINotificationService_surfaceNotification__block_invoke_cold_1((uint64_t)v3, a1, v4);

  }
  else
  {
    AnalyticsSendEventLazy();
  }

}

void *__53__PLBatteryUINotificationService_surfaceNotification__block_invoke_75()
{
  return &unk_1EA1DA010;
}

- (id)thermallyLimitedChargingEngagedContent
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;

  v2 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B228], CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  PLLogPausedCharging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent].cold.4();

  objc_msgSend(v2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", 86400.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", CFSTR("/System/Library/UserNotifications/Bundles/com.apple.powerlog.proactivenotifications.bundle"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D80020], "isiPad");
      objc_msgSend(v9, "_cfBundle");
      CFBundleCopyLocalizedStringForLocalization();
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_cfBundle");
      CFBundleCopyLocalizedStringForLocalization();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v10, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTitle:](v5, "setTitle:", v12);

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", v11, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setBody:](v5, "setBody:", v13);

      -[NSObject setCategoryIdentifier:](v5, "setCategoryIdentifier:", CFSTR("TLC"));
      -[NSObject setShouldIgnoreDowntime:](v5, "setShouldIgnoreDowntime:", 1);
      -[NSObject setShouldIgnoreDoNotDisturb:](v5, "setShouldIgnoreDoNotDisturb:", 1);
      -[NSObject setShouldHideDate:](v5, "setShouldHideDate:", 1);
      -[NSObject setShouldSuppressScreenLightUp:](v5, "setShouldSuppressScreenLightUp:", 1);
      objc_msgSend(MEMORY[0x1E0CEC738], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setIcon:](v5, "setIcon:", v14);

      -[NSObject setExpirationDate:](v5, "setExpirationDate:", v7);
      PLLogPausedCharging();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent].cold.3();

      v16 = v5;
    }
    else
    {
      PLLogPausedCharging();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent].cold.2();
      v16 = 0;
    }

  }
  else
  {
    PLLogPausedCharging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent].cold.1();
    v16 = 0;
  }

  return v16;
}

- (id)thermallyLimitedChargingEngagedRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  -[PLBatteryUINotificationService thermallyLimitedChargingEngagedContent](self, "thermallyLimitedChargingEngagedContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CEC740];
    -[PLBatteryUINotificationService tlcNotificationIdentifier](self, "tlcNotificationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestWithIdentifier:content:trigger:", v5, v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setDestinations:", 2);
    PLLogPausedCharging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUINotificationService thermallyLimitedChargingEngagedRequest].cold.1();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)removeTLCNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "TLC: Removing Notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)surfaceNotificationForIssues:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[PLBatteryUINotificationService ursaNotificationRequestWithIssue:](self, "ursaNotificationRequestWithIssue:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          PLLogUrsaNotification();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[PLBatteryUINotificationService surfaceNotificationForIssues:].cold.1();

          goto LABEL_13;
        }
        v10 = (void *)v9;
        -[PLBatteryUINotificationService ursaNotificationCenter](self, "ursaNotificationCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addNotificationRequest:withCompletionHandler:", v10, &__block_literal_global_108);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

}

void __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;

  v2 = a2;
  PLLogUrsaNotification();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke_cold_1();
  }

}

- (id)ursaNotificationContentWithIssue:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nearestMidnightAfterDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("notificationMessage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("notificationMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("[Internal] "), "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", CFSTR("Battery Life Issue Detected"));
    objc_msgSend(v4, "setBody:", v12);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("radar"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("radar"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "intValue");

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("livability://%i"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDefaultActionURL:", v17);
      objc_msgSend(v4, "setCategoryIdentifier:", CFSTR("Ursa"));
      objc_msgSend(v4, "setShouldIgnoreDowntime:", 1);
      objc_msgSend(v4, "setShouldIgnoreDoNotDisturb:", 1);
      objc_msgSend(v4, "setShouldHideDate:", 1);
      objc_msgSend(v4, "setShouldSuppressScreenLightUp:", 1);
      objc_msgSend(MEMORY[0x1E0CEC738], "iconForSystemImageNamed:", CFSTR("bolt.shield.fill"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setIcon:", v18);

      objc_msgSend(v4, "setExpirationDate:", v7);
      v19 = v4;

    }
    else
    {
      PLLogUrsaNotification();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PLBatteryUINotificationService ursaNotificationContentWithIssue:].cold.2();

      v19 = 0;
    }

  }
  else
  {
    PLLogUrsaNotification();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PLBatteryUINotificationService ursaNotificationContentWithIssue:].cold.1();
    v19 = 0;
  }

  return v19;
}

- (id)ursaNotificationRequestWithIssue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  -[PLBatteryUINotificationService ursaNotificationContentWithIssue:](self, "ursaNotificationContentWithIssue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("radar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("UrsaNotification-%i-%@"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v10, v5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDestinations:", 2);
    PLLogUrsaNotification();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUINotificationService ursaNotificationRequestWithIssue:].cold.1();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)removeUrsaNotifications
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Removing Notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (PLBatteryUINotificationService)notificationService
{
  return (PLBatteryUINotificationService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotificationService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (UNUserNotificationCenter)ursaNotificationCenter
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUrsaNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)queryPayload
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueryPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)queryResponderService
{
  return self->_queryResponderService;
}

- (void)setQueryResponderService:(id)a3
{
  objc_storeStrong((id *)&self->_queryResponderService, a3);
}

- (NSString)tlcNotificationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTlcNotificationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableArray)ursaNotificationIdentifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUrsaNotificationIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)tlcNotificationDelivered
{
  return self->_tlcNotificationDelivered;
}

- (void)setTlcNotificationDelivered:(BOOL)a3
{
  self->_tlcNotificationDelivered = a3;
}

- (PLXPCResponderOperatorComposition)queryResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setQueryResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLXPCResponderOperatorComposition)ursaQueryResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUrsaQueryResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PowerUISmartChargeClient)smartChargingClient
{
  return (PowerUISmartChargeClient *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSmartChargingClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)isOBCEngaged
{
  return self->_isOBCEngaged;
}

- (void)setIsOBCEngaged:(BOOL)a3
{
  self->_isOBCEngaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartChargingClient, 0);
  objc_storeStrong((id *)&self->_ursaQueryResponder, 0);
  objc_storeStrong((id *)&self->_queryResponder, 0);
  objc_storeStrong((id *)&self->_ursaNotificationIdentifiers, 0);
  objc_storeStrong((id *)&self->_tlcNotificationIdentifier, 0);
  objc_storeStrong((id *)&self->_queryResponderService, 0);
  objc_storeStrong((id *)&self->_queryPayload, 0);
  objc_storeStrong((id *)&self->_ursaNotificationCenter, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationService, 0);
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "TLC: No payload available or key missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "TLC: Sending response from Notification Service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "TLC: Surfaced TLC notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_4(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "tlcNotificationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "TLC: Request sent to surface TLC notification: %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "TLC: Removed TLC notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "TLC: Request sent to remove TLC notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "TLC: Payload does not exist or invalid value in payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "TLC: Created UN Center", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_24_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "TLC: Payload from BatteryAgent via XPC: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "No payload available or key missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "No issues available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "%@ Ursa notifications", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __58__PLBatteryUINotificationService_initOperatorDependancies__block_invoke_61_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Payload from BatteryAgent via XPC: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__PLBatteryUINotificationService_surfaceNotification__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a2 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_ERROR, "TLC: Error adding notification request, error = %@, request identifier = %{public}@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_8();
}

- (void)thermallyLimitedChargingEngagedContent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "TLC: langs=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)thermallyLimitedChargingEngagedRequest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "TLC: Created thermallyLimitedChargingEngagedRequest: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)surfaceNotificationForIssues:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Failed to create notification request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Pushed notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __63__PLBatteryUINotificationService_surfaceNotificationForIssues___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, v0, v1, "Error in pushing notification %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)ursaNotificationContentWithIssue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, v0, v1, "Issue missing notification message, issue: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)ursaNotificationContentWithIssue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, v0, v1, "Issue missing radar, issue: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)ursaNotificationRequestWithIssue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Created UrsaNotificationRequest: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
