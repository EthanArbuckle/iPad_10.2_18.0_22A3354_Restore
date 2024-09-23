@implementation HOAppDelegate

- (void)_logUserAutomationNamingTypeProportions:(id)a3
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "na_flatMap:", &stru_1000B6470));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "na_filter:", &stru_1000B64B0));
  if (objc_msgSend(v9, "count"))
  {
    v4 = (float)(unint64_t)objc_msgSend(v3, "count");
    v5 = (float)(v4 / (float)(unint64_t)objc_msgSend(v9, "count")) * 100.0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    *(float *)&v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v7));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, HFAnalyticsAutomationNamingTypeProportionPercentUsingConfiguredNameKey);

    +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 25, v6);
  }

}

- (void)_logUserMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allHomesFuture"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler globalAsyncScheduler](NAScheduler, "globalAsyncScheduler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reschedule:", v5));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E28C;
  v8[3] = &unk_1000B6370;
  v8[4] = self;
  v7 = objc_msgSend(v6, "addSuccessBlock:", v8);

}

- (void)applicationDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance", a3));
  objc_msgSend(v4, "executionEnvironmentDidBecomeActive");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate applicationActiveFuture](self, "applicationActiveFuture"));
  objc_msgSend(v5, "finishWithNoResult");

  -[HOAppDelegate _clearCachedWalletKeyDeviceStateForCurrentDevice](self, "_clearCachedWalletKeyDeviceStateForCurrentDevice");
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting notification authorization.", v9, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v8, "requestAuthorizationWithOptions:completionHandler:", 55, &stru_1000B62E0);

}

- (void)_logAccessoryCountMetricsWithHomes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006BD0;
  v10[3] = &unk_1000B63E8;
  v10[4] = &v11;
  v10[5] = &v23;
  v10[6] = &v19;
  v10[7] = &v15;
  objc_msgSend(v3, "na_each:", v10);
  v27[0] = HFAnalyticsEventFieldNameUnsupportedServicesCount;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v24[3]));
  v27[1] = HFAnalyticsEventFieldNameSupportedServicesCount;
  v28[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20[3]));
  v28[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
  v7 = objc_msgSend(v6, "mutableCopy");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12[3]));
  objc_msgSend(v7, "na_safeSetObject:forKey:", v8, HFAnalyticsEventFieldNameFavoriteServicesCount);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v16[3]));
  objc_msgSend(v7, "na_safeSetObject:forKey:", v9, HFAnalyticsEventFieldNameShowInHomeCamerasCount);

  +[HFAnalytics sendEvent:withData:](HFAnalytics, "sendEvent:withData:", 31, v7);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

}

- (void)_clearCachedWalletKeyDeviceStateForCurrentDevice
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  HOAppDelegate *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "homeManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "homes"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "hf_clearCachedWalletKeyDeviceStateForCurrentDevice", (_QWORD)v13);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
    }
    while (v8);
  }

  v11 = HFLogForCategory(66);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v18 = self;
    v19 = 2080;
    v20 = "-[HOAppDelegate _clearCachedWalletKeyDeviceStateForCurrentDevice]";
    v21 = 2112;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(%@:%s) Clearing cached wallet key device states for homes %@", buf, 0x20u);
  }

}

+ (void)_logSupportedSensitiveFeatures
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;

  v2 = HFLogForCategory(8);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Features enabled...", (uint8_t *)&v19, 2u);
  }

  v4 = HFLogForCategory(8);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = _os_feature_enabled_impl("HomeApp", "automation_revamp");
    v19 = 67109120;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "HOME_ENABLE_AUTOMATION_REVAMP enabled = %{BOOL}d", (uint8_t *)&v19, 8u);
  }

  v7 = HFLogForCategory(8);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = _os_feature_enabled_impl("Coordination", "coordinated_mobiletimer");
    v19 = 67109120;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "HOME_TARGET_BUILDS_COORDINATION compiled in. HOME_HAS_ENABLED_COORDINATION = %{BOOL}d", (uint8_t *)&v19, 8u);
  }

  v10 = HFLogForCategory(8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = _os_feature_enabled_impl("Home", "SiriEndpoints");
    v19 = 67109120;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "HM_FEATURE_SIRI_ENDPOINTS_SUPPORTED compiled in. HOME_ENABLE_SIRI_ENDPOINTS = %{BOOL}d", (uint8_t *)&v19, 8u);
  }

  v13 = HFLogForCategory(8);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = _os_feature_enabled_impl("Home", "RestrictedGuest");
    v19 = 67109120;
    v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "HOME_SUPPORTS_RESTRICTED_GUEST compiled in. HOME_SUPPORTS_RESTRICTED_GUEST = %{BOOL}d", (uint8_t *)&v19, 8u);
  }

  v16 = HFLogForCategory(8);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = _os_feature_enabled_impl("HomeApp", "wallet_key_uwb");
    v19 = 67109120;
    v20 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "HOME_SUPPORTS_WALLET_KEY_UWB compiled in. HOME_ENABLE_WALLET_KEY_UWB = %{BOOL}d", (uint8_t *)&v19, 8u);
  }

}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice", a3, a4));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)1)
    return 30;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate window](self, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentedViewController"));
  v11 = objc_opt_class(HORotatableNavigationController);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
    return 30;
  else
    return 2;
}

- (UIWindow)window
{
  return self->_window;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  global_queue = dispatch_get_global_queue(-2, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v5, &stru_1000B6230);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v6, "warmup");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance"));
  v8 = objc_alloc_init((Class)HUNamedWallpaperFactory);
  v9 = objc_alloc_init((Class)HUProcessedWallpaperFactory);
  objc_msgSend(v7, "registerWallpaperSource:processedSource:", v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance"));
  objc_msgSend(v10, "preheatCache");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler globalAsyncScheduler](NAScheduler, "globalAsyncScheduler"));
  objc_msgSend(v11, "performBlock:", &stru_1000B6250);

  objc_opt_class(HUHomeFeatureOnboardingUtilities);
  v12 = +[HOMainTabBarController preloadTabIcons](HOMainTabBarController, "preloadTabIcons");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[HFMediaServiceManager sharedManager](HFMediaServiceManager, "sharedManager"));
  objc_msgSend(v13, "warmup");

  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HOAppNavigationURLHandler *v11;
  void *v12;
  HOAppNavigationURLHandler *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  HOHomeScreenQuickActionController *v37;
  uint8_t v39[16];
  uint8_t v40[16];
  uint8_t buf[16];

  v5 = a3;
  +[HOAppNavigator addViewControllersToRegistry](HOAppNavigator, "addViewControllersToRegistry");
  v6 = +[HOActivationManager sharedInstance](HOActivationManager, "sharedInstance");
  v7 = objc_alloc_init((Class)UIWindow);
  -[HOAppDelegate setWindow:](self, "setWindow:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate window](self, "window"));
  objc_msgSend(v8, "makeKeyAndVisible");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate window](self, "window"));
  objc_msgSend(v10, "setTintColor:", v9);

  if (_os_feature_enabled_impl("HomeApp", "adaptive_navigation")
    && _os_feature_enabled_impl("UIKit", "uip_floating_tab_bar"))
  {
    sub_10001F130(self);
  }
  else if (+[HFUtilities isAnIPad](HFUtilities, "isAnIPad"))
  {
    sub_10001EEB4(self);
  }
  else
  {
    sub_10001F028(self);
  }
  v11 = [HOAppNavigationURLHandler alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate navigator](self, "navigator"));
  v13 = -[HOAppNavigationURLHandler initWithNavigator:](v11, "initWithNavigator:", v12);
  -[HOAppDelegate setURLHandler:](self, "setURLHandler:", v13);

  v14 = objc_alloc_init((Class)NAFuture);
  -[HOAppDelegate setApplicationActiveFuture:](self, "setApplicationActiveFuture:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate URLHandler](self, "URLHandler"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[HFUserNotificationCenter sharedInstance](HFUserNotificationCenter, "sharedInstance"));
  objc_msgSend(v16, "setPresentationHandler:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate URLHandler](self, "URLHandler"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[HFOpenURLRouter sharedInstance](HFOpenURLRouter, "sharedInstance"));
  objc_msgSend(v18, "setApplicationURLHandler:", v17);

  v19 = objc_opt_new(NSMutableDictionary);
  -[HOAppDelegate setItemIdentifierToBackgroundTaskIdentifierMap:](self, "setItemIdentifierToBackgroundTaskIdentifierMap:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v20, "addObserver:selector:name:object:", self, "startSymptomFixBackgroundTask:", HFSymptomFixManagerStartSessionNotification, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "addObserver:selector:name:object:", self, "endSymptomFixBackgroundTask:", HFSymptomFixManagerEndSessionNotification, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v22, "addObserver:selector:name:object:", self, "startAppleMusicLoginBackgroundTask:", HFAppleMusicAccountStartManualLoginNotification, 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v23, "addObserver:selector:name:object:", self, "endAppleMusicLoginBackgroundTask:", HFAppleMusicAccountEndManualLoginNotification, 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v25 = objc_msgSend(v24, "applicationState");

  v26 = HFLogForCategory(8);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (v25 == (id)2)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Application state is launched in background", buf, 2u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
    objc_msgSend(v29, "setRunningState:", 1);
  }
  else
  {
    if (v28)
    {
      *(_WORD *)v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Application state is launched in foreground", v40, 2u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
    objc_msgSend(v30, "setRunningState:", 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[HFCharacteristicNotificationManager sharedManager](HFCharacteristicNotificationManager, "sharedManager"));
    objc_msgSend(v29, "enableNotificationsForSelectedHomeWithReason:", HOAppDelegateNotificationsEnabledReasonForeground);
  }

  v31 = objc_alloc((Class)HFWiFiExecutionEnvironmentObserver);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v34 = objc_msgSend(v31, "initWithExecutionEnvironment:dispatcher:", v32, v33);
  -[HOAppDelegate setWifiExecutionEnvironmentObserver:](self, "setWifiExecutionEnvironmentObserver:", v34);

  -[HOAppDelegate _logUserMetrics](self, "_logUserMetrics");
  if (+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall"))
    +[HOAppDelegate _logSupportedSensitiveFeatures](HOAppDelegate, "_logSupportedSensitiveFeatures");
  v35 = HFLogForCategory(49);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_signpost_enabled(v36))
  {
    *(_WORD *)v39 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, 0x1F4uLL, "HomeAppLaunch", "App Finished Launching!", v39, 2u);
  }

  v37 = -[HOHomeScreenQuickActionController initWithApplication:]([HOHomeScreenQuickActionController alloc], "initWithApplication:", v5);
  -[HOAppDelegate setHomeScreenQuickActionController:](self, "setHomeScreenQuickActionController:", v37);

  return 1;
}

- (UITabBarController)tabBarController
{
  return self->_tabBarController;
}

- (HOAppNavigator)navigator
{
  return self->_navigator;
}

- (HOAppNavigationURLHandler)URLHandler
{
  return self->_URLHandler;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void)setWifiExecutionEnvironmentObserver:(id)a3
{
  objc_storeStrong((id *)&self->_wifiExecutionEnvironmentObserver, a3);
}

- (void)setURLHandler:(id)a3
{
  objc_storeStrong((id *)&self->_URLHandler, a3);
}

- (void)setTabBarController:(id)a3
{
  objc_storeStrong((id *)&self->_tabBarController, a3);
}

- (void)setNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_navigator, a3);
}

- (void)setItemIdentifierToBackgroundTaskIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifierToBackgroundTaskIdentifierMap, a3);
}

- (void)setHomeScreenQuickActionController:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenQuickActionController, a3);
}

- (void)setApplicationActiveFuture:(id)a3
{
  objc_storeStrong((id *)&self->_applicationActiveFuture, a3);
}

- (NAFuture)applicationActiveFuture
{
  return self->_applicationActiveFuture;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = +[HFUtilities isAMac](HFUtilities, "isAMac");
  if ((v11 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate applicationActiveFuture](self, "applicationActiveFuture"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001F334;
    v15[3] = &unk_1000B6278;
    objc_copyWeak(&v17, &location);
    v16 = v9;
    v13 = objc_msgSend(v12, "addCompletionBlock:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v11 ^ 1;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "interaction", a3));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "intent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate navigator](self, "navigator"));
    +[HOIntentHandler handleIntent:withNavigator:](HOIntentHandler, "handleIntent:withNavigator:", v8, v9);

  }
  return 1;
}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate homeScreenQuickActionController](self, "homeScreenQuickActionController"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate homeScreenQuickActionController](self, "homeScreenQuickActionController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate navigator](self, "navigator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "performActionForShortcutItem:navigator:", v7, v11));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001F51C;
    v14[3] = &unk_1000B62A0;
    v15 = v8;
    v13 = objc_msgSend(v12, "addCompletionBlock:", v14);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;

  v6 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFAccessoryDiagnosticsUploadManager backgroundURLSessionIdentifier](HFAccessoryDiagnosticsUploadManager, "backgroundURLSessionIdentifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    v10 = HFLogForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Handle background URL Session update for identifier:%@.", (uint8_t *)&v13, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HFAccessoryDiagnosticsUploadManager sharedManager](HFAccessoryDiagnosticsUploadManager, "sharedManager"));
    objc_msgSend(v12, "resumeServiceForURLSessionIdentifier:", v6);
    objc_msgSend(v12, "setBackgroundUrlSessionCompletionHandler:", v7);

  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFCharacteristicNotificationManager sharedManager](HFCharacteristicNotificationManager, "sharedManager", a3));
  objc_msgSend(v3, "enableNotificationsForSelectedHomeWithReason:", HOAppDelegateNotificationsEnabledReasonForeground);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance"));
  objc_msgSend(v4, "executionEnvironmentWillEnterForeground");

  v5 = (id)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  objc_msgSend(v5, "updateHomeSensingState");

}

- (void)applicationWillResignActive:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance", a3));
  objc_msgSend(v4, "executionEnvironmentWillResignActive");

  v5 = objc_alloc_init((Class)NAFuture);
  -[HOAppDelegate setApplicationActiveFuture:](self, "setApplicationActiveFuture:", v5);

}

- (void)applicationDidEnterBackground:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance", a3));
  objc_msgSend(v3, "executionEnvironmentDidEnterBackground");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HFCharacteristicNotificationManager sharedManager](HFCharacteristicNotificationManager, "sharedManager"));
  objc_msgSend(v4, "disableNotificationsForSelectedHomeWithReason:", HOAppDelegateNotificationsEnabledReasonBackground);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homes"));
  objc_msgSend(v7, "na_each:", &stru_1000B6320);

  +[HOWidgetUpdater updateAllWidgetsThatHaveTimelines](_TtC7HomeApp15HOWidgetUpdater, "updateAllWidgetsThatHaveTimelines");
}

- (void)startSymptomFixBackgroundTask:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  v5 = objc_opt_class(NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", symptomItemIdentifierKey));
  if (v9)
  {
    -[HOAppDelegate _startBackgroundTaskWithItemIdentifier:](self, "_startBackgroundTaskWithItemIdentifier:", v9);
  }
  else
  {
    v10 = HFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100077CBC();

  }
}

- (void)endSymptomFixBackgroundTask:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  v5 = objc_opt_class(NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", symptomItemIdentifierKey));
  if (v9)
  {
    -[HOAppDelegate _endBackgroundTaskWithItemIdentifier:](self, "_endBackgroundTaskWithItemIdentifier:", v9);
  }
  else
  {
    v10 = HFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100077D1C();

  }
}

- (void)startAppleMusicLoginBackgroundTask:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  v5 = objc_opt_class(NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", symptomItemIdentifierKey));
  if (v9)
  {
    -[HOAppDelegate _startBackgroundTaskWithItemIdentifier:](self, "_startBackgroundTaskWithItemIdentifier:", v9);
  }
  else
  {
    v10 = HFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100077CBC();

  }
}

- (void)endAppleMusicLoginBackgroundTask:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  v5 = objc_opt_class(NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", symptomItemIdentifierKey));
  if (v9)
  {
    -[HOAppDelegate _endBackgroundTaskWithItemIdentifier:](self, "_endBackgroundTaskWithItemIdentifier:", v9);
  }
  else
  {
    v10 = HFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100077D1C();

  }
}

- (void)_startBackgroundTaskWithItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  HOAppDelegate *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001FE88;
  v14[3] = &unk_1000B6348;
  v7 = v4;
  v16 = self;
  v17 = &v18;
  v15 = v7;
  v8 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", v6, v14);

  v19[3] = (uint64_t)v8;
  v9 = HFLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v19[3];
    *(_DWORD *)buf = 138412546;
    v23 = v7;
    v24 = 2048;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Began background task for itemID = %@ - taskID = %lu", buf, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate itemIdentifierToBackgroundTaskIdentifierMap](self, "itemIdentifierToBackgroundTaskIdentifierMap"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19[3]));
  objc_msgSend(v12, "setObject:forKey:", v13, v7);

  _Block_object_dispose(&v18, 8);
}

- (void)_endBackgroundTaskWithItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate itemIdentifierToBackgroundTaskIdentifierMap](self, "itemIdentifierToBackgroundTaskIdentifierMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
  {
    -[HOAppDelegate _endBackgroundTaskWithTaskIdentifier:](self, "_endBackgroundTaskWithTaskIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue(-[HOAppDelegate itemIdentifierToBackgroundTaskIdentifierMap](self, "itemIdentifierToBackgroundTaskIdentifierMap"));
    -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v4);
  }
  else
  {
    v9 = HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100077D7C();
  }

}

- (void)_endBackgroundTaskWithTaskIdentifier:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  unint64_t v8;

  v4 = HFLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ending background task with taskID %lu", (uint8_t *)&v7, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v6, "endBackgroundTask:", a3);

}

- (void)_logNonConfiguredAccessoryMetricsWithHomes:(id)a3
{
  objc_msgSend(a3, "na_each:", &stru_1000B6408);
}

- (HFWiFiExecutionEnvironmentObserver)wifiExecutionEnvironmentObserver
{
  return self->_wifiExecutionEnvironmentObserver;
}

- (HOSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewController, a3);
}

- (HOHomeScreenQuickActionController)homeScreenQuickActionController
{
  return self->_homeScreenQuickActionController;
}

- (NSMutableDictionary)itemIdentifierToBackgroundTaskIdentifierMap
{
  return self->_itemIdentifierToBackgroundTaskIdentifierMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifierToBackgroundTaskIdentifierMap, 0);
  objc_storeStrong((id *)&self->_applicationActiveFuture, 0);
  objc_storeStrong((id *)&self->_homeScreenQuickActionController, 0);
  objc_storeStrong((id *)&self->_URLHandler, 0);
  objc_storeStrong((id *)&self->_navigator, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_wifiExecutionEnvironmentObserver, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

- (void)_runExtendedLaunchTestWithApplication:(id)a3 options:(id)a4
{
  objc_msgSend(a3, "startedTest:", CFSTR("ExtendedLaunch PPT"), a4);

}

- (void)_runTabSwitchToAutomationTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  _QWORD v20[4];
  id v21;
  __CFString *v22;
  _QWORD v23[4];
  id v24;
  __CFString *v25;
  id v26;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - Switch to automation tab", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate _firstReadCompleteFuture](self, "_firstReadCompleteFuture"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100028230;
    v23[3] = &unk_1000B6900;
    v10 = v5;
    v24 = v10;
    v25 = CFSTR("tabSwitchToAutomation");
    v26 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", v23));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100028268;
    v20[3] = &unk_1000B6928;
    v12 = v10;
    v21 = v12;
    v22 = CFSTR("tabSwitchToAutomation");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addSuccessBlock:", v20));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002827C;
    v17[3] = &unk_1000B6950;
    v18 = v12;
    v19 = CFSTR("tabSwitchToAutomation");
    v14 = objc_msgSend(v13, "addFailureBlock:", v17);

  }
  else
  {
    v15 = HFLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100077EB0();

    objc_msgSend(v5, "failedTest:", CFSTR("tabSwitchToAutomation"));
  }

}

- (void)_runScrollAutomationTestWithApplication:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  __CFString *v20;
  _QWORD v21[5];
  id v22;
  __CFString *v23;
  SEL v24;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = HFLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PPT - Scrolling automation tab", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectTabWithIdentifier:", HFHomeAppTabIdentifierTriggers));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10002845C;
    v21[3] = &unk_1000B6978;
    v24 = a2;
    v21[4] = self;
    v22 = v8;
    v23 = CFSTR("scrollAutomation");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "addSuccessBlock:", v21));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002862C;
    v18[3] = &unk_1000B6950;
    v19 = v7;
    v20 = CFSTR("scrollAutomation");
    v15 = objc_msgSend(v14, "addFailureBlock:", v18);

  }
  else
  {
    v16 = HFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100077EDC();

    objc_msgSend(v7, "failedTest:", CFSTR("scrollAutomation"));
  }

}

- (void)_runAddRoomTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[5];
  __CFString *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  __CFString *v25;
  _QWORD v26[4];
  id v27;
  __CFString *v28;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - Add a room", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));

    v11 = objc_msgSend(objc_alloc((Class)HFRoomBuilder), "initWithHome:", v10);
    objc_msgSend(v11, "setName:", CFSTR("PPT-Room"));
    objc_msgSend(v5, "startedTest:", CFSTR("addRoom"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "commitItem"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000288A8;
    v26[3] = &unk_1000B69A0;
    v13 = v5;
    v27 = v13;
    v28 = CFSTR("addRoom");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addSuccessBlock:", v26));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000288B4;
    v23[3] = &unk_1000B6950;
    v24 = v13;
    v25 = CFSTR("addRoom");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "addFailureBlock:", v23));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000288FC;
    v20[3] = &unk_1000B69C8;
    v20[4] = self;
    v21 = CFSTR("PPT-Room");
    v22 = v10;
    v16 = v10;
    v17 = objc_msgSend(v15, "addCompletionBlock:", v20);

  }
  else
  {
    v18 = HFLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100077F08();

    objc_msgSend(v5, "failedTest:", CFSTR("addRoom"));
  }

}

- (void)_runDeleteRoomTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  __CFString *v23;
  _QWORD v24[4];
  id v25;
  __CFString *v26;
  _QWORD v27[4];
  id v28;
  __CFString *v29;
  id v30;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - delete a room", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));

    v11 = objc_msgSend(objc_alloc((Class)HFRoomBuilder), "initWithHome:", v10);
    objc_msgSend(v11, "setName:", CFSTR("PPT-Room"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "commitItem"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100028B74;
    v27[3] = &unk_1000B69F0;
    v13 = v5;
    v28 = v13;
    v29 = CFSTR("deleteRoom");
    v30 = v10;
    v14 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flatMap:", v27));

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100028BEC;
    v24[3] = &unk_1000B6A18;
    v16 = v13;
    v25 = v16;
    v26 = CFSTR("deleteRoom");
    v17 = objc_msgSend(v15, "addSuccessBlock:", v24);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100028BF8;
    v21[3] = &unk_1000B6950;
    v22 = v16;
    v23 = CFSTR("deleteRoom");
    v18 = objc_msgSend(v15, "addFailureBlock:", v21);

  }
  else
  {
    v19 = HFLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100077F34();

    objc_msgSend(v5, "failedTest:", CFSTR("deleteRoom"));
  }

}

- (void)_runPresentHomeSettingsTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __CFString *v16;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  HOAppDelegate *v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - present home settings", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate appNavigator](self, "appNavigator")),
        v9,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectTabWithIdentifier:", HFHomeAppTabIdentifierHome));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100028DF8;
    v17[3] = &unk_1000B6A40;
    v11 = v5;
    v18 = v11;
    v19 = CFSTR("presentHomeSettings");
    v20 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addSuccessBlock:", v17));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100028F84;
    v14[3] = &unk_1000B6950;
    v15 = v11;
    v16 = CFSTR("presentHomeSettings");
    v13 = objc_msgSend(v12, "addFailureBlock:", v14);

  }
  else
  {
    objc_msgSend(v5, "failedTest:withFailure:", CFSTR("presentHomeSettings"), CFSTR("Invalid controller"));
  }

}

- (void)_runPresentNetworkSettingsTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __CFString *v16;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  HOAppDelegate *v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - present network settings", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate appNavigator](self, "appNavigator")),
        v9,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectTabWithIdentifier:", HFHomeAppTabIdentifierHome));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100029148;
    v17[3] = &unk_1000B6A40;
    v11 = v5;
    v18 = v11;
    v19 = CFSTR("presentNetworkSettings");
    v20 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addSuccessBlock:", v17));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002930C;
    v14[3] = &unk_1000B6950;
    v15 = v11;
    v16 = CFSTR("presentNetworkSettings");
    v13 = objc_msgSend(v12, "addFailureBlock:", v14);

  }
  else
  {
    objc_msgSend(v5, "failedTest:withFailure:", CFSTR("presentNetworkSettings"), CFSTR("Invalid controller"));
  }

}

- (void)_runPresentNetworkRouterSettingsTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __CFString *v16;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  HOAppDelegate *v20;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - present network router settings", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate appNavigator](self, "appNavigator")),
        v9,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectTabWithIdentifier:", HFHomeAppTabIdentifierHome));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000294D0;
    v17[3] = &unk_1000B6A40;
    v11 = v5;
    v18 = v11;
    v19 = CFSTR("presentNetworkRouterSettings");
    v20 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addSuccessBlock:", v17));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100029698;
    v14[3] = &unk_1000B6950;
    v15 = v11;
    v16 = CFSTR("presentNetworkRouterSettings");
    v13 = objc_msgSend(v12, "addFailureBlock:", v14);

  }
  else
  {
    objc_msgSend(v5, "failedTest:withFailure:", CFSTR("presentNetworkRouterSettings"), CFSTR("Invalid controller"));
  }

}

- (void)_runPresentNetworkConfigurationSettingsTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  __CFString *v18;
  _QWORD v19[4];
  id v20;
  __CFString *v21;
  HOAppDelegate *v22;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - present network configuration settings", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate appNavigator](self, "appNavigator")),
        v9,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectTabWithIdentifier:", HFHomeAppTabIdentifierHome));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100029880;
    v19[3] = &unk_1000B6A40;
    v11 = v5;
    v20 = v11;
    v21 = CFSTR("presentNetworkConfigurationSettings");
    v22 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addSuccessBlock:", v19));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100029A78;
    v16[3] = &unk_1000B6950;
    v17 = v11;
    v18 = CFSTR("presentNetworkConfigurationSettings");
    v13 = objc_msgSend(v12, "addFailureBlock:", v16);

  }
  else
  {
    v14 = HFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100077F60();

    objc_msgSend(v5, "failedTest:", CFSTR("presentNetworkConfigurationSettings"));
  }

}

- (void)_runScrollCameraClipsInPlayerTestWithApplication:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  __CFString *v27;
  _QWORD v28[4];
  id v29;
  __CFString *v30;
  id v31;
  uint8_t *v32;
  _QWORD v33[4];
  id v34;
  __CFString *v35;
  uint8_t *v36;
  _QWORD v37[4];
  id v38;
  __CFString *v39;
  HOAppDelegate *v40;
  id v41;
  uint8_t *v42;
  uint8_t buf[8];
  uint8_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v6 = a3;
  v7 = a4;
  v8 = HFLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PPT - scroll camera clips", buf, 2u);
  }

  v10 = objc_opt_class(NSString);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cameraUUID")));
  if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
    v14 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v13);
  else
    v14 = 0;
  *(_QWORD *)buf = 0;
  v44 = buf;
  v45 = 0x3032000000;
  v46 = sub_100029E18;
  v47 = sub_100029E28;
  v48 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v15
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate appNavigator](self, "appNavigator")),
        v16,
        v16))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate _selectAndFinishFirstReadForTabWithIdentifier:](self, "_selectAndFinishFirstReadForTabWithIdentifier:", HFHomeAppTabIdentifierHome));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100029E30;
    v37[3] = &unk_1000B6A68;
    v42 = buf;
    v18 = v6;
    v38 = v18;
    v39 = CFSTR("scrollCameraClips");
    v40 = self;
    v41 = v14;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "flatMap:", v37));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002A00C;
    v33[3] = &unk_1000B6A90;
    v36 = buf;
    v20 = v18;
    v34 = v20;
    v35 = CFSTR("scrollCameraClips");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "flatMap:", v33));

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10002A09C;
    v28[3] = &unk_1000B6AB8;
    v32 = buf;
    v22 = v20;
    v29 = v22;
    v30 = CFSTR("scrollCameraClips");
    v31 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "addSuccessBlock:", v28));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002A1AC;
    v25[3] = &unk_1000B6950;
    v26 = v22;
    v27 = CFSTR("scrollCameraClips");
    v24 = objc_msgSend(v23, "addFailureBlock:", v25);

  }
  else
  {
    objc_msgSend(v6, "failedTest:withFailure:", CFSTR("scrollCameraClips"), CFSTR("Invalid controller"));
  }

  _Block_object_dispose(buf, 8);
}

- (void)_runToggleLightTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __CFString *v16;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - toggling light", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate appNavigator](self, "appNavigator")),
        v9,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate _selectAndFinishFirstReadForTabWithIdentifier:](self, "_selectAndFinishFirstReadForTabWithIdentifier:", HFHomeAppTabIdentifierHome));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A3A8;
    v17[3] = &unk_1000B6928;
    v11 = v5;
    v18 = v11;
    v19 = CFSTR("toggleLight");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addSuccessBlock:", v17));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002A654;
    v14[3] = &unk_1000B6950;
    v15 = v11;
    v16 = CFSTR("toggleLight");
    v13 = objc_msgSend(v12, "addFailureBlock:", v14);

  }
  else
  {
    objc_msgSend(v5, "failedTest:withFailure:", CFSTR("toggleLight"), CFSTR("Invalid controller"));
  }

}

- (void)_runToggleSceneTestWithApplication:(id)a3 options:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  __CFString *v16;
  _QWORD v17[4];
  id v18;
  __CFString *v19;
  uint8_t buf[16];

  v5 = a3;
  v6 = HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT - toggling scene", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate appNavigator](self, "appNavigator")),
        v9,
        v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate _selectAndFinishFirstReadForTabWithIdentifier:](self, "_selectAndFinishFirstReadForTabWithIdentifier:", HFHomeAppTabIdentifierHome));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002A814;
    v17[3] = &unk_1000B6928;
    v11 = v5;
    v18 = v11;
    v19 = CFSTR("toggleScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addSuccessBlock:", v17));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002AA04;
    v14[3] = &unk_1000B6950;
    v15 = v11;
    v16 = CFSTR("toggleScene");
    v13 = objc_msgSend(v12, "addFailureBlock:", v14);

  }
  else
  {
    objc_msgSend(v5, "failedTest:withFailure:", CFSTR("toggleScene"), CFSTR("Invalid controller"));
  }

}

- (id)_firstReadCompleteFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "homeFuture"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "flatMap:", &stru_1000B6B80));

  return v4;
}

- (id)_selectAndFinishFirstReadForTabWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HOAppDelegate baseViewController](self, "baseViewController"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectTabWithIdentifier:", v4));
    v18[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homeFuture"));
    v18[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture combineAllFutures:](NAFuture, "combineAllFutures:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flatMap:", &stru_1000B6BC0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "flatMap:", &stru_1000B6C00));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flatMap:", &stru_1000B6C48));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "flatMap:", &stru_1000B6CB0));

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError na_genericError](NSError, "na_genericError"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v16));

  }
  return v15;
}

- (id)_networkRouterForTestingInHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hf_allNetworkRouterAccessories"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1000B6CF0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

- (id)_networkConfigurationProfileForTestingInHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "hf_allNetworkConfigurationProfiles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1000B6D30));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

- (id)_sortedAccessoriesInHome:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accessories"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedArrayUsingComparator:", &stru_1000B6D50));

  return v4;
}

- (void)_deleteRoomWithName:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rooms"));
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name == %@"), v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v8));
    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
      objc_msgSend(v6, "removeRoom:completionHandler:", v10, &stru_1000B6D70);
    }
    else
    {
      v12 = HFLogForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100077FB8((uint64_t)v5, v10, v13, v14, v15, v16, v17, v18);
    }

  }
  else
  {
    v11 = HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100077F8C();
  }

}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v5;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  HOAppDelegate *v12;
  Swift::String_optional v13;
  Swift::Bool v14;
  UIApplication_optional v16;
  Swift::OpaquePointer_optional v17;

  v5 = a5;
  if (!a4)
  {
    v8 = 0;
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  if (v5)
LABEL_3:
    v5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v11 = a3;
  v12 = self;
  v16.value.super.super.isa = (Class)a3;
  v16.is_nil = v8;
  v13.value._countAndFlagsBits = v10;
  v13.value._object = v5;
  v14 = HOAppDelegate.application(_:runTest:options:)(v16, v13, v17);

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v10);
  return v14;
}

+ (NSString)itemManagerUpdatesDisabledReasonScrollPerformanceTest
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (id)firstReadCompleteFuture
{
  return _sSo13HOAppDelegateC7HomeAppE23firstReadCompleteFutureSo8NAFutureCySo6NSNullCGyF_0();
}

- (HOBaseControllerDelegate)baseViewController
{
  HOAppDelegate *v2;
  HOBaseControllerDelegate *result;
  HOBaseControllerDelegate *v4;
  id v5;
  void *v6;
  __objc2_prot *v7;

  v2 = self;
  result = -[HOAppDelegate window](v2, "window");
  if (result)
  {
    v4 = result;
    v5 = -[HOBaseControllerDelegate rootViewController](result, "rootViewController");

    if (v5)
    {
      v7 = &OBJC_PROTOCOL___HOBaseControllerDelegate;
      v6 = (void *)swift_dynamicCastObjCProtocolConditional(v5, 1, &v7);

      if (!v6)
    }
    else
    {

      v6 = 0;
    }
    return (HOBaseControllerDelegate *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (HOAppNavigator)appNavigator
{
  HOAppDelegate *v2;
  id v3;

  v2 = self;
  v3 = HOAppDelegate.appNavigator.getter();

  return (HOAppNavigator *)v3;
}

- (id)serviceLikeItemWithItem:(id)a3 itemManager:(id)a4 withID:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  HOAppDelegate *v16;
  void *v17;
  uint64_t v19;

  v9 = sub_100059788((uint64_t *)&unk_1000D1810);
  __chkstk_darwin(v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = a3;
  v15 = a4;
  v16 = self;
  v17 = _sSo13HOAppDelegateC7HomeAppE15serviceLikeItem4item0H7Manager6withIDSo09HFServicefG0_So6HFItemCXcSgAJ_So0mI0C10Foundation4UUIDVSgtF_0(v14, v15, (uint64_t)v11);

  sub_10005D3D4((uint64_t)v11, (uint64_t *)&unk_1000D1810);
  return v17;
}

- (id)findPreferredAccessoryWithItemManager:(id)a3 accessoryID:(id)a4 with:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  HOAppDelegate *v17;
  void *v18;
  uint64_t v20;

  v9 = sub_100059788((uint64_t *)&unk_1000D1810);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v13 = type metadata accessor for UUID(0);
    v14 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    v15 = type metadata accessor for UUID(0);
    v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 1, 1, v15);
  }
  __chkstk_darwin(v14);
  *(&v20 - 2) = (uint64_t)v12;
  v16 = a3;
  v17 = self;
  v18 = (void *)HOAppDelegate.findPreferredAccessory(itemManager:accessoryID:with:)(v16, (uint64_t)v11, (uint64_t (*)(id, id))sub_1000765A4, (uint64_t)(&v20 - 4));

  sub_10005D3D4((uint64_t)v11, (uint64_t *)&unk_1000D1810);
  _Block_release(v12);
  return v18;
}

- (id)findAccessoryWithItemManager:(id)a3 accessoryID:(id)a4 testBlock:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  HOAppDelegate *v16;
  void *v17;
  void *v18;
  uint64_t v20;

  v9 = sub_100059788((uint64_t *)&unk_1000D1810);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v13 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 0, 1, v13);
  }
  else
  {
    v14 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  }
  _Block_copy(v12);
  v15 = a3;
  v16 = self;
  sub_100076170(v15, (uint64_t)v11, v16, (uint64_t)v12);
  v18 = v17;
  _Block_release(v12);

  sub_10005D3D4((uint64_t)v11, (uint64_t *)&unk_1000D1810);
  _Block_release(v12);
  return v18;
}

- (id)homeKitObjectIDFrom:(id)a3 userDefaultsEnabled:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  HOAppDelegate *v10;
  uint64_t v11;
  uint64_t v12;
  Class isa;
  uint64_t v15;

  v6 = sub_100059788((uint64_t *)&unk_1000D1810);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v10 = self;
  HOAppDelegate.homeKitObjectID(from:userDefaultsEnabled:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease(v9);
  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
  }
  return isa;
}

- (id)_runScrollTestWithTestName:(id)a3 scrollView:(id)a4 options:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  HOAppDelegate *v13;
  id v14;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v12 = a4;
  v13 = self;
  v14 = sub_10006FE70(v8, v10, v12, v11, 0);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v11);

  return v14;
}

- (id)_cameraProfileForTestingInHome:(id)a3 withUUID:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  HOAppDelegate *v13;
  void *v14;
  uint64_t v16;

  v7 = sub_100059788((uint64_t *)&unk_1000D1810);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v10 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_1000750B8(v12, (uint64_t)v9);

  sub_10005D3D4((uint64_t)v9, (uint64_t *)&unk_1000D1810);
  return v14;
}

@end
