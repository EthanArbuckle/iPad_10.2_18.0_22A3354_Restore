@implementation FRAppDelegate

- (void)_updateBackgroundFetchSettingsWithAppConfiguration:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "prefetchConfig"));
  if (objc_msgSend(v9, "isBackgroundFetchEnabled"))
  {
    objc_msgSend(v9, "minimumBackgroundFetchInterval");
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate backgroundFetchScheduler](self, "backgroundFetchScheduler"));
    if (v5 <= 0.0)
      v7 = UIApplicationBackgroundFetchIntervalMinimum;
    else
      objc_msgSend(v9, "minimumBackgroundFetchInterval");
    v8 = v6;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate backgroundFetchScheduler](self, "backgroundFetchScheduler"));
    v6 = v8;
    v7 = UIApplicationBackgroundFetchIntervalNever;
  }
  objc_msgSend(v8, "setMinimumBackgroundFetchInterval:", v7);

}

- (id)createSceneContainer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "createSceneContainer"));

  return v3;
}

- (FRAppDelegate)init
{
  FRAppDelegate *v2;
  TSAppDelegate *v3;
  TSAppDelegate *bridgedAppDelegate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FRAppDelegate;
  v2 = -[FRAppDelegate init](&v6, "init");
  if (v2)
  {
    v3 = (TSAppDelegate *)objc_alloc_init((Class)TSAppDelegate);
    bridgedAppDelegate = v2->_bridgedAppDelegate;
    v2->_bridgedAppDelegate = v3;

  }
  return v2;
}

- (void)clearOldCacheItemsWithFeldsparContext:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BBFC;
  v4[3] = &unk_1000D9758;
  v5 = a3;
  v3 = v5;
  +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v4);

}

+ (id)stateRestorationURL
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = FCURLForContainerizedUserAccountHomeDirectory(1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Saved Application State/com.apple.news.savedState/data.data")));

  return v4;
}

- (void)scheduleTasksWithOptions:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[FCTaskScheduler pushHighPriorityTaskInFlight](FCTaskScheduler, "pushHighPriorityTaskInFlight");
  +[FCTaskScheduler pushHighPriorityTaskInFlight](FCTaskScheduler, "pushHighPriorityTaskInFlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", UIApplicationLaunchOptionsRemoteNotificationKey));

  if (v4)
    +[FCTaskScheduler disableOptionalPrefetching](FCTaskScheduler, "disableOptionalPrefetching");
}

- (void)registerForDeviceLockNotifications
{
  FRAppDelegate *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD handler[5];
  id v13;
  id location;

  v2 = self;
  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000580D0;
  handler[3] = &unk_1000DD118;
  objc_copyWeak(&v13, &location);
  handler[4] = v2;
  LODWORD(v2) = notify_register_dispatch("com.apple.springboard.lockstate", &v2->lockStateToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  if ((_DWORD)v2)
  {
    v4 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
      sub_10007FE08(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)sceneWillEnterForeground
{
  void *v3;
  void *v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resolveProtocol:name:", &OBJC_PROTOCOL___AAViewingSessionManagerType, CFSTR("Issue")));

  objc_msgSend(v4, "endActiveViewingSession");
  -[FRAppDelegate _timeSinceLastActivation](self, "_timeSinceLastActivation");
  +[FRBackgroundFetchManager timeSinceLastBackgroundFetch](FRBackgroundFetchManager, "timeSinceLastBackgroundFetch");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AB18;
  block[3] = &unk_1000D9758;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

+ (void)registerDefaults
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  _QWORD v10[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9[0] = CFSTR("reset_identifier");
  v9[1] = FCWhitetailOnboardingNeededKey;
  v10[0] = &__kCFBooleanFalse;
  v10[1] = &__kCFBooleanTrue;
  v9[2] = CFSTR("use-label-cells");
  v9[3] = FCEnableSolitaireGrouping;
  v10[2] = &__kCFBooleanTrue;
  v10[3] = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));
  objc_msgSend(v2, "registerDefaults:", v3);

  v4 = NewsCoreUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = FCAudioConfigEnabledSharedPreferenceKey;
  v8 = &__kCFBooleanTrue;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  objc_msgSend(v5, "registerDefaults:", v6);

}

- (void)setupLanguages
{
  NSObject *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint8_t buf[4];
  __CFString *v13;
  __int16 v14;
  __CFString *v15;

  v2 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting up languages", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale _globalPreferredLanguages](NSLocale, "_globalPreferredLanguages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", &off_1000E49A0, v3));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = CFSTR("en-US");
  if (v5)
    v6 = v5;
  v7 = v6;
  v8 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = v5;
    v14 = 2114;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found preferred language: %{public}@, setting language as %{public}@", buf, 0x16u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v11 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("AppleLanguages"));

}

- (void)_didCommitFirstFrame
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_queue_global_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006AD0;
  block[3] = &unk_1000D9758;
  block[4] = self;
  dispatch_async(v4, block);

  +[NSURLRequest setupFeldsparUserAgent](NSURLRequest, "setupFeldsparUserAgent");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  objc_msgSend(v7, "maybeUpdateOnboardingVersion:", &stru_1000DD000);

  v8 = dispatch_get_global_queue(2, 0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  dispatch_async(v9, &stru_1000DD020);

  -[FRAppDelegate _disableLoggingForUnsupportedControls](self, "_disableLoggingForUnsupportedControls");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  objc_msgSend(v10, "didCommitFirstFrame");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018884;
  v11[3] = &unk_1000D9758;
  v11[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:](FCTaskScheduler, "scheduleLowPriorityBlockForMainThread:", v11);
  +[FCTaskScheduler popHighPriorityTaskInFlight](FCTaskScheduler, "popHighPriorityTaskInFlight");
}

- (id)setupAnalyticsReferralWithOptions:(id)a3
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
  uint64_t v15;
  FRAnalyticsReferral *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  FRAppDelegate *v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:"));
  v21 = self;
  if (objc_msgSend(v5, "nss_isNewsURL"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v6, "setBool:forKey:", 0, FCWhitetailOnboardingNeededKey);

    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fr_campaignID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fr_campaignType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fr_creativeID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fr_widgetModeGroupID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate _extractWidgetEngagementFromReferralURL:](self, "_extractWidgetEngagementFromReferralURL:", v5));
    if (objc_msgSend(v5, "fr_isFeldsparReferableURL"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
      v12 = 0;
      LOBYTE(v13) = 1;
    }
    else
    {
      v11 = 0;
      LOBYTE(v13) = 0;
      v12 = 0;
    }
    v15 = 4;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIApplicationLaunchOptionsUserActivityDictionaryKey));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIApplicationLaunchOptionsUserActivityDictionaryKey));
      v22 = NSSSafariSearchCampaignID;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", UIApplicationLaunchOptionsUserActivityTypeKey));

      v11 = 0;
      v9 = 0;
      v10 = 0;
      v15 = 0;
      v8 = 0;
      v7 = 0;
      LOBYTE(v13) = 1;
    }
    else
    {
      v11 = 0;
      v9 = 0;
      v10 = 0;
      v15 = 0;
      v12 = 0;
      v8 = 0;
      v7 = 0;
      v22 = 0;
    }
  }
  if (objc_msgSend(v5, "fr_articleOpenedFrom") == (id)2)
  {
    v15 = 12;
  }
  else if ((objc_msgSend(v12, "isEqualToString:", CSSearchableItemActionType) & 1) != 0)
  {
    v15 = 7;
  }
  else if ((objc_msgSend(v5, "fr_isFromSafariSearchWithSourceApplication:", 0) & 1) != 0)
  {
    v15 = 9;
  }
  else if (objc_msgSend(v22, "isEqualToString:", NSSSafariSearchCampaignID))
  {
    v15 = 8;
  }
  LOBYTE(v20) = (_BYTE)v13;
  v16 = -[FRAnalyticsReferral initWithUserActivityType:creativeID:campaignID:campaignType:referringApplication:referringURL:appOpenedByUserActivity:widgetModeGroupID:widgetEngagement:appSessionStartMethod:appSessionStartNotificationType:]([FRAnalyticsReferral alloc], "initWithUserActivityType:creativeID:campaignID:campaignType:referringApplication:referringURL:appOpenedByUserActivity:widgetModeGroupID:widgetEngagement:appSessionStartMethod:appSessionStartNotificationType:", v12, v8, v22, v7, 0, v11, v20, v9, v10, v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIApplicationLaunchOptionsURLKey));
  v18 = v17;
  if (v17)
    -[FRAppDelegate setInPreviewMode:](v21, "setInPreviewMode:", objc_msgSend(v17, "fr_isPreviewURL"));

  return v16;
}

- (void)setupNotificationManagerWithFeldsparContext:(id *)a3 state:(int64_t)a4 launchOptions:(id)a5
{
  id v7;
  id v8;
  FRNotificationManager *v9;
  void *v10;
  FRNotificationManager *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKey:", UIApplicationLaunchOptionsRemoteNotificationKey));
  v8 = objc_alloc_init((Class)FCAMSPushHandler);
  -[FRAppDelegate setAmsPushHandler:](self, "setAmsPushHandler:", v8);

  v9 = [FRNotificationManager alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate amsPushHandler](self, "amsPushHandler"));
  v11 = -[FRNotificationManager initWithFeldsparContext:amsPushHandler:](v9, "initWithFeldsparContext:amsPushHandler:", v7, v10);
  -[FRAppDelegate setNotificationManager:](self, "setNotificationManager:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
  objc_msgSend(v12, "addObserver:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
  objc_msgSend(v7, "setNotificationManager:", v13);

}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  unsigned int *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;

  v5 = (unsigned int *)objc_msgSend(objc_retainAutorelease(a4), "bytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%08X%08X%08X%08X%08X%08X%08X%08X"), bswap32(*v5), bswap32(v5[1]), bswap32(v5[2]), bswap32(v5[3]), bswap32(v5[4]), bswap32(v5[5]), bswap32(v5[6]), bswap32(v5[7])));
  v7 = FCPushNotificationsLog;
  if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Successfully registered for remote notifications with deviceToken: %@", buf, 0xCu);
  }
  v9 = objc_opt_class(FRFeldsparContext, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v11 = FCDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "notificationSettings"));
  v15 = -[FRAppDelegate fcDigestModeFromScheduledDeliverySetting:](self, "fcDigestModeFromScheduledDeliverySetting:", objc_msgSend(v14, "scheduledDeliverySetting"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cloudContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "notificationController"));
  objc_msgSend(v17, "registerDeviceToken:deviceDigestMode:", v6, v15);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
  objc_msgSend(v18, "notifyDeviceTokenIsAvailable:", v6);

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "key_window"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate applicationUpdateNotifier](self, "applicationUpdateNotifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootViewController"));
  objc_msgSend(v10, "setViewController:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", UIApplicationLaunchOptionsRemoteNotificationKey));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
    v14 = objc_msgSend(v13, "canHandleRemoteNotification:", v12);

    if ((v14 & 1) == 0)
    {
      v15 = FCDefaultLog;
      if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
        sub_10007CB30((uint64_t)v12, v15);
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount"));
  v17 = objc_msgSend(v16, "endpointConnectionClientID");

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v18, "setBool:forKey:", 1, CFSTR("hasLaunchedBefore"));

  +[WKBrowsingContextController registerSchemeForCustomProtocol:](WKBrowsingContextController, "registerSchemeForCustomProtocol:", FCExcerptURLScheme);
  -[FRAppDelegate performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_didCommitFirstFrame", 0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  LOBYTE(v18) = objc_msgSend(v19, "application:didFinishLaunchingWithOptions:", v7, v6);

  return (char)v18;
}

- (void)_configureBackgroundFetch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cloudContext"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(objc_alloc((Class)TSApplicationBackgroundFetchScheduler), "initWithApplication:", v5);
  objc_msgSend(v6, "prepareForUseWithApplicationDelegate:", self);
  -[FRAppDelegate setBackgroundFetchScheduler:](self, "setBackgroundFetchScheduler:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v9 = objc_msgSend(v7, "resolveClass:", objc_opt_class(FRBackgroundFetchManager, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[FRAppDelegate setBackgroundFetchManager:](self, "setBackgroundFetchManager:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate backgroundFetchManager](self, "backgroundFetchManager"));
  if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007FED8();
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appConfigurationManager"));
  objc_msgSend(v12, "addAppConfigObserver:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "possiblyUnfetchedAppConfiguration"));
  -[FRAppDelegate _updateBackgroundFetchSettingsWithAppConfiguration:](self, "_updateBackgroundFetchSettingsWithAppConfiguration:", v13);

}

- (void)setupAnalyticsControllerWithFeldsparContext:(id *)a3 versionHelpers:(id)a4 referral:(id)a5
{
  id v7;
  id v8;
  FRAnalyticsController *v9;
  void *v10;
  void *v11;
  void *v12;
  FRAppActivityMonitor *v13;
  void *v14;
  void *v15;
  void *v16;
  FRAppActivityMonitor *v17;
  FRAnalyticsController *v18;

  v7 = *a3;
  v8 = a5;
  v9 = [FRAnalyticsController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v18 = -[FRAnalyticsController initWithCloudContext:](v9, "initWithCloudContext:", v10);

  objc_msgSend(v7, "setAnalyticsController:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "key_window"));

  v13 = [FRAppActivityMonitor alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "appActivityMonitor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v17 = -[FRAppActivityMonitor initWithAnalyticsController:appActivityMonitor:cloudContext:window:](v13, "initWithAnalyticsController:appActivityMonitor:cloudContext:window:", v18, v15, v16, v12);

  -[FRAppActivityMonitor addObserver:](v17, "addObserver:", self);
  objc_msgSend(v7, "setAppActivityMonitor:", v17);

  -[FRAppActivityMonitor setAppSessionStartReferral:](v17, "setAppSessionStartReferral:", v8);
  -[FRAppDelegate setActivityMonitor:](self, "setActivityMonitor:", v17);

}

- (void)setupUserDefaultsForPPT
{
  void *v2;
  unsigned int v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  v3 = objc_msgSend(v2, "isRunningPPT");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  objc_msgSend(v4, "d_logState");

  if (v3)
  {
    objc_msgSend(v5, "setBool:forKey:", 0, FCWhitetailOnboardingNeededKey);
    objc_msgSend(v5, "setBool:forKey:", 1, FCPeaceOnboardingCompletedKey);
  }

}

- (void)setRunningPPTWithApplication:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  id v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  objc_msgSend(v4, "d_logState");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  v6 = objc_msgSend(v3, "launchedToTest");

  objc_msgSend(v5, "setRunningPPT:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  objc_msgSend(v7, "d_logState");

  v14 = (id)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  if (!objc_msgSend(v14, "isRunningPPT"))
    goto LABEL_6;
  v8 = NewsCoreUserDefaults();
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("skip_hard_reset_on_ppt_runs"));

  if ((v10 & 1) == 0)
  {
    v11 = NewsCoreUserDefaults();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("skip_hard_reset_on_ppt_runs_sticky"));

    if ((v13 & 1) == 0)
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v14, "setBool:forKey:", 1, CFSTR("hard_reset_news_on_next_launch"));
LABEL_6:

    }
  }
}

- (NSArray)bundleAssemblies
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  FRAppDelegate *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[14];

  v29 = objc_alloc_init((Class)SXFrameworkAssembly);
  v30[0] = v29;
  v28 = objc_alloc_init((Class)NUApplicationFrameworkAssembly);
  v30[1] = v28;
  v27 = objc_alloc_init((Class)TFTeaFoundationAssembly);
  v30[2] = v27;
  v26 = objc_alloc_init((Class)TUAssembly);
  v30[3] = v26;
  v25 = objc_alloc_init((Class)NMAssembly);
  v30[4] = v25;
  v24 = objc_alloc_init((Class)NYAssembly);
  v30[5] = v24;
  v23 = objc_alloc_init((Class)NEAssembly);
  v30[6] = v23;
  v3 = objc_alloc_init((Class)NAAssembly);
  v30[7] = v3;
  v4 = objc_alloc_init((Class)NPAssembly);
  v30[8] = v4;
  v5 = objc_alloc_init((Class)NXAssembly);
  v30[9] = v5;
  v6 = objc_alloc_init((Class)NAPAssembly);
  v30[10] = v6;
  v7 = objc_alloc((Class)TSFrameworkAssembly);
  v21 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appConfigurationManager"));
  v11 = objc_msgSend(v7, "initWithNewsAppConfigurationManager:", v10);
  v30[11] = v11;
  v12 = objc_alloc_init((Class)SNAssembly);
  v30[12] = v12;
  v13 = objc_alloc_init((Class)EGAssembly);
  v30[13] = v13;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 14));

  if (FeldsparInternalExtrasEnabled())
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle fr_feldsparInternalExtrasBundle](NSBundle, "fr_feldsparInternalExtrasBundle"));
    objc_msgSend(v14, "load");

    v15 = objc_msgSend(v22, "mutableCopy");
    v16 = objc_alloc(NSClassFromString(CFSTR("FRInternalExtrasAssembly")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](v21, "feldsparContext"));
    v18 = objc_msgSend(v16, "initWithContext:", v17);

    if (v18)
      objc_msgSend(v15, "addObject:", v18);
    v19 = objc_alloc_init(NSClassFromString(CFSTR("FRInternalExtrasBundleAssembly")));
    if (v19)
      objc_msgSend(v15, "addObject:", v19);

  }
  else
  {
    v15 = v22;
  }
  return (NSArray *)v15;
}

- (NSArray)assemblies
{
  void *v3;
  FRCoreAssembly *v4;
  FRFeldsparContextAssembly *v5;
  FRFeedSubscriptionAssembly *v6;
  FREditorialAssembly *v7;
  void *v8;
  void *v9;
  FREditorialAssembly *v10;
  FRHeadlineRendererAssembly *v11;
  FRRoutingAssembly *v12;
  void *v13;
  void *v14;
  FRRoutingAssembly *v15;
  FRHistoryAssembly *v16;
  FRLocalDraftsAssembly *v17;
  id v19;
  void *v20;
  FRFeldsparContextAssembly *v21;
  void *v22;
  void *v23;
  FRAnalyticsAssembly *v24;
  FRCoreAssembly *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[9];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key_window"));

  v4 = [FRCoreAssembly alloc];
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "configurationManager"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "appActivityMonitor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate networkBehaviorMonitor](self, "networkBehaviorMonitor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate offlineModeMonitor](self, "offlineModeMonitor"));
  v25 = -[FRCoreAssembly initWithCloudContext:configurationManager:appActivityMonitor:networkBehaviorMonitor:offlineModeMonitor:](v4, "initWithCloudContext:configurationManager:appActivityMonitor:networkBehaviorMonitor:offlineModeMonitor:", v30, v29, v28, v27, v26);
  v33[0] = v25;
  v24 = objc_alloc_init(FRAnalyticsAssembly);
  v33[1] = v24;
  v5 = [FRFeldsparContextAssembly alloc];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate privateDataUpdateCoordinator](self, "privateDataUpdateCoordinator"));
  v21 = -[FRFeldsparContextAssembly initWithContext:privateDataUpdateCoordinator:](v5, "initWithContext:privateDataUpdateCoordinator:", v23, v22);
  v33[2] = v21;
  v6 = objc_alloc_init(FRFeedSubscriptionAssembly);
  v33[3] = v6;
  v7 = [FREditorialAssembly alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate dataProviderFactory](self, "dataProviderFactory"));
  v10 = -[FREditorialAssembly initWithFeldsparContext:dataProviderFactory:](v7, "initWithFeldsparContext:dataProviderFactory:", v8, v9);
  v33[4] = v10;
  v11 = objc_alloc_init(FRHeadlineRendererAssembly);
  v33[5] = v11;
  v12 = [FRRoutingAssembly alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  v15 = -[FRRoutingAssembly initWithFeldsparContext:bridgedAppDelegate:window:](v12, "initWithFeldsparContext:bridgedAppDelegate:window:", v13, v14, v20);
  v33[6] = v15;
  v16 = objc_alloc_init(FRHistoryAssembly);
  v33[7] = v16;
  v17 = objc_alloc_init(FRLocalDraftsAssembly);
  v33[8] = v17;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 9));

  return (NSArray *)v19;
}

- (void)sceneDidBecomeActive
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  _QWORD v32[5];
  NSRunLoopMode v33;

  -[FRAppDelegate _timeSinceLastActivation](self, "_timeSinceLastActivation");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("lastActivationDate"));

  if (v4 > 604800.0
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")),
        v8 = objc_msgSend(v7, "BOOLForKey:", FCSimulateServerSidePrivateDataReset),
        v7,
        v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate privateDataUpdateCoordinator](self, "privateDataUpdateCoordinator"));
    objc_msgSend(v9, "markAllPrivateDataControllersAsNeedingUpdate");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate privateDataUpdateCoordinator](self, "privateDataUpdateCoordinator"));
  objc_msgSend(v10, "updatePrivateDataControllersWithCompletion:", &stru_1000DD0B0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("simulate_quick_subscription_refresh"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subscriptionController"));
    objc_msgSend(v14, "performSelector:withObject:afterDelay:", "refreshAndNotifyAboutSubscribedTags", 0, 120.0);

  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100058088;
    v32[3] = &unk_1000D9758;
    v32[4] = self;
    +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:](FCTaskScheduler, "scheduleLowPriorityBlockForMainThread:", v32);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v15, "setApplicationIconBadgeNumber:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cloudContext"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
  objc_msgSend(v19, "setDateLastOpened:", v16);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v22 = objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", CFSTR("Unregister Crash Callbacks"), 0, v21, &stru_1000DD0F0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationQueue defaultQueue](NSNotificationQueue, "defaultQueue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification notificationWithName:object:](NSNotification, "notificationWithName:object:", CFSTR("Unregister Crash Callbacks"), 0));
  v33 = NSRunLoopCommonModes;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1));
  objc_msgSend(v23, "enqueueNotification:postingStyle:coalesceMask:forModes:", v24, 1, 3, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "gizmoSyncManager"));
  objc_msgSend(v27, "syncWithGizmo");

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v30 = objc_msgSend(v28, "resolveClass:", objc_opt_class(FCVanityURLRedirectService, v29));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  objc_msgSend(v31, "updateUnderlyingMappingWithQualityOfService:completion:", -1, 0);
}

- (double)_timeSinceLastActivation
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("lastActivationDate")));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

  }
  else
  {
    v6 = 1.79769313e308;
  }

  return v6;
}

- (void)setupCloudContextWithFavoritesPersonalizer:(id)a3 state:(int64_t)a4 launchOptions:(id)a5 versionHelpers:(id)a6 referral:(id)a7
{
  id v12;
  id v13;
  FRFeldsparContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FRPresubscribeService *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  FRPresubscribeService *v28;
  FRArticleContentPool *v29;
  void *v30;
  void *v31;
  FRArticleContentPool *v32;
  FRSpotlightManager *v33;
  void *v34;
  FRSpotlightManager *v35;
  id v36;
  void *v37;
  FRFeldsparContext *v38;
  void *v39;
  FRFeldsparContext *v40;
  void *v41;
  id v42;
  id v43;
  FRFeldsparContext *v44;
  FRFeldsparContext *v45;

  v43 = a7;
  v42 = a6;
  v12 = a5;
  v13 = a3;
  v14 = objc_alloc_init(FRFeldsparContext);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  -[FRFeldsparContext setCloudContext:](v14, "setCloudContext:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "readingHistory"));
  -[FRFeldsparContext setReadingHistory:](v14, "setReadingHistory:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "readingList"));
  -[FRFeldsparContext setReadingList:](v14, "setReadingList:", v19);

  -[FRFeldsparContext setFavoritesPersonalizer:](v14, "setFavoritesPersonalizer:", v13);
  v45 = v14;
  -[FRAppDelegate setupNotificationManagerWithFeldsparContext:state:launchOptions:](self, "setupNotificationManagerWithFeldsparContext:state:launchOptions:", &v45, a4, v12);

  v40 = v45;
  v20 = [FRPresubscribeService alloc];
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "appConfigurationManager"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "tagController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "subscriptionController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "purchaseController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
  v28 = -[FRPresubscribeService initWithAppConfigurationManager:tagController:subscriptionController:purchaseController:notificationManager:](v20, "initWithAppConfigurationManager:tagController:subscriptionController:purchaseController:notificationManager:", v39, v22, v24, v26, v27);
  -[FRFeldsparContext setPresubscribeService:](v40, "setPresubscribeService:", v28);

  v29 = [FRArticleContentPool alloc];
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate dataProviderFactory](self, "dataProviderFactory"));
  v32 = -[FRArticleContentPool initWithCloudContext:dataProviderFactory:](v29, "initWithCloudContext:dataProviderFactory:", v30, v31);
  -[FRFeldsparContext setArticleContentPool:](v40, "setArticleContentPool:", v32);

  v33 = [FRSpotlightManager alloc];
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v35 = -[FRSpotlightManager initWithCloudContext:](v33, "initWithCloudContext:", v34);
  -[FRFeldsparContext setSpotlightManager:](v40, "setSpotlightManager:", v35);

  v36 = objc_alloc_init((Class)AppEntityAssociator);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeldsparContext spotlightManager](v40, "spotlightManager"));
  objc_msgSend(v37, "setAssociator:", v36);

  v44 = v40;
  -[FRAppDelegate setupAnalyticsControllerWithFeldsparContext:versionHelpers:referral:](self, "setupAnalyticsControllerWithFeldsparContext:versionHelpers:referral:", &v44, v42, v43);

  v38 = v44;
  -[FRAppDelegate setFeldsparContext:](self, "setFeldsparContext:", v38);

}

- (id)setupDestructiveDataAction
{
  void *v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSSet *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  FRDestructiveDataMigrationHandler *v33;
  uint64_t v34;
  void *v35;
  FRAppDelegate *v37;
  uint8_t v38[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("hard_reset_news_on_next_launch"));

  if (v4)
  {
    v5 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will perform hard reset because HardResetOnNextLaunch=true", buf, 2u);
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("should_clear_cache_on_next_launch"));

  if (v7)
  {
    v9 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will clear caches because ClearCacheOnNextLaunch=true", v38, 2u);
    }
  }
  v10 = (void *)objc_opt_new(NSMutableArray, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("hard_reset_news_on_next_launch"));

  if (v12)
  {
    v37 = self;
    v14 = (void *)objc_opt_new(FRDestructiveDataActionProvider, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", FCContentEnvironmentSharedPreferenceKey, FCStorefrontSharedPreferenceKey, FCPPTTestNameKey, FCPersonalizationScriptKey, 0));
    v16 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
    v17 = NewsCoreUserDefaults();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_msgSend(v16, "initWithUserDefaults:domainName:stickyKeys:", v18, FCDefaultsSuiteName, v15);

    objc_msgSend(v10, "addObject:", v19);
    v20 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
    v21 = NewsCoreSensitiveUserDefaults();
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = FCSensitiveDefaultsSuiteName;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v25 = objc_msgSend(v20, "initWithUserDefaults:domainName:stickyKeys:", v22, v23, v24);

    if (NFInternalBuild(objc_msgSend(v10, "addObject:", v25)))
      v27 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("news.onboarding.splash_screen.disable_splash_screen"), CFSTR("news.modules.newsengagement.presentation.disable_all_presentations"), 0));
    else
      v27 = objc_opt_new(NSSet, v26);
    v29 = (void *)v27;

    self = v37;
  }
  else
  {
    v14 = (void *)objc_opt_new(FRAccountActionQueueBasedDataActionProvider, v13);
    v28 = FRAppDefaultsDomainiCloudDataDestructionStickyKeys();
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  }
  v30 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v32 = objc_msgSend(v30, "initWithUserDefaults:domainName:stickyKeys:", v31, CFSTR("com.apple.news"), v29);

  objc_msgSend(v10, "addObject:", v32);
  v33 = -[FRDestructiveDataMigrationHandler initWithPrivateDataActionProvider:defaultsDataDestructionItems:]([FRDestructiveDataMigrationHandler alloc], "initWithPrivateDataActionProvider:defaultsDataDestructionItems:", v14, v10);
  -[FRDestructiveDataMigrationHandler handleMigration](v33, "handleMigration");
  objc_msgSend((id)objc_opt_class(self, v34), "registerDefaults");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v35, "setBool:forKey:", 1, CFSTR("NSAllowsDefaultLineBreakStrategy"));

  return v14;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  FRFavoritesPersonalizer *v32;
  void *v33;
  void *v34;
  FRPrivateDataUpdateCoordinator *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  FRFlintEmbedConfigurationManager *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  FRFlintEmbedConfigurationManager *v50;
  FRFlintDataProviderFactory *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  FRFlintDataProviderFactory *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  FRSubscribedTagRanker *v71;
  void *v72;
  void *v73;
  FRSubscribedTagRanker *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  FRFavoritesPersonalizer *v114;
  id v115;
  void *v116;
  void *v117;
  FRVersionHelpers *v118;
  _QWORD v119[12];

  v6 = a3;
  v7 = a4;
  -[FRAppDelegate setupLanguages](self, "setupLanguages");
  -[FRAppDelegate scheduleTasksWithOptions:](self, "scheduleTasksWithOptions:", v7);
  v113 = v6;
  -[FRAppDelegate setRunningPPTWithApplication:](self, "setRunningPPTWithApplication:", v6);
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate setupDestructiveDataAction](self, "setupDestructiveDataAction"));
  -[FRAppDelegate registerForDeviceLockNotifications](self, "registerForDeviceLockNotifications");
  v112 = v7;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate setupAnalyticsReferralWithOptions:](self, "setupAnalyticsReferralWithOptions:", v7));
  -[FRAppDelegate prepareAppCacheSnapShot](self, "prepareAppCacheSnapShot");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FRAppDelegate stateRestorationURL](FRAppDelegate, "stateRestorationURL"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v111 = (void *)v9;
  LOBYTE(v9) = objc_msgSend(v10, "fileExistsAtPath:", v9);

  if ((v9 & 1) == 0)
    TFCompletedStartup(2, v11);
  -[FRAppDelegate setupUserDefaultsForPPT](self, "setupUserDefaultsForPPT");
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v13 = objc_opt_class(LSApplicationProxy, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleProxy bundleProxyForCurrentProcess](LSBundleProxy, "bundleProxyForCurrentProcess"));
  v15 = FCCheckedDynamicCast(v13, v14);
  v109 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v118 = -[FRVersionHelpers initWithBackgroundTaskable:applicationProxy:]([FRVersionHelpers alloc], "initWithBackgroundTaskable:applicationProxy:", v110, v109);
  -[FRVersionHelpers updateAppObsolescenceState](v118, "updateAppObsolescenceState");
  v16 = objc_alloc((Class)FCNetworkBehaviorMonitor);
  v17 = FRURLForNewsAppCachesDirectory();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
  v115 = objc_msgSend(v16, "initWithCacheDirectory:", v19);

  v21 = (void *)objc_opt_new(FCMultiNetworkBehaviorMonitor, v20);
  objc_msgSend(v21, "addMonitor:", v115);
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v22 = objc_alloc_init((Class)NUApplicationAppActivityMonitorIOS);
  v105 = objc_msgSend(objc_alloc((Class)FCAppActivationMonitor), "initWithAppActivityMonitor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString")));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion")));

  v25 = objc_alloc((Class)FCConfigurationManager);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration"));
  v27 = FRURLForNewsAppCachesDirectory();
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[FCFeldsparIDProvider sharedInstance](FCFeldsparIDProvider, "sharedInstance"));
  v103 = v22;
  v30 = objc_msgSend(v25, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:appShortVersionString:buildNumberString:networkBehaviorMonitor:appActivityMonitor:applicationState:", v26, v28, v29, v107, v106, v21, v22, 0);

  v102 = v30;
  v104 = v21;
  v31 = objc_msgSend(objc_alloc((Class)FCOfflineModeMonitor), "initWithAppActivationMonitor:configurationManager:networkBehaviorMonitor:", v105, v30, v21);
  -[FRAppDelegate setNetworkBehaviorMonitor:](self, "setNetworkBehaviorMonitor:", v115);
  -[FRAppDelegate setOfflineModeMonitor:](self, "setOfflineModeMonitor:", v31);
  v101 = v31;
  -[FRAppDelegate setupCloudContextWithAppActivityMonitor:dataActionProvider:versionHelpers:configurationManager:networkBehaviorMonitor:networkReachability:](self, "setupCloudContextWithAppActivityMonitor:dataActionProvider:versionHelpers:configurationManager:networkBehaviorMonitor:networkReachability:", v22, v116, v118, v30, v21, v31);
  v32 = [FRFavoritesPersonalizer alloc];
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v114 = -[FRFavoritesPersonalizer initWithCloudContext:](v32, "initWithCloudContext:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "subscriptionList"));

  v35 = -[FRPrivateDataUpdateCoordinator initWithNetworkReachability:]([FRPrivateDataUpdateCoordinator alloc], "initWithNetworkReachability:", v31);
  -[FRAppDelegate setPrivateDataUpdateCoordinator:](self, "setPrivateDataUpdateCoordinator:", v35);

  v99 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "subscriptionList"));
  v119[0] = v98;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "readingList"));
  v119[1] = v96;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "userInfo"));
  v119[2] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "audioPlaylist"));
  v119[3] = v92;
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "privateChannelMembershipController"));
  v119[4] = v90;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "shortcutList"));
  v119[5] = v88;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "shortcutCategoryList"));
  v119[6] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "personalizationData"));
  v119[7] = v84;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "userEventHistory"));
  v119[8] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "readingHistory"));
  v119[9] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "issueReadingHistory"));
  v119[10] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "puzzleHistory"));
  v119[11] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v119, 12));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate privateDataUpdateCoordinator](self, "privateDataUpdateCoordinator"));
  objc_msgSend(v44, "setPrivateDataControllers:", v43);

  v45 = [FRFlintEmbedConfigurationManager alloc];
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "appConfigurationManager"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "flintResourceManager"));
  v50 = -[FRFlintEmbedConfigurationManager initWithConfigurationManager:resourceManager:](v45, "initWithConfigurationManager:resourceManager:", v47, v49);
  -[FRAppDelegate setEmbedConfigurationManager:](self, "setEmbedConfigurationManager:", v50);

  v51 = [FRFlintDataProviderFactory alloc];
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "flintResourceManager"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate embedConfigurationManager](self, "embedConfigurationManager"));
  v56 = -[FRFlintDataProviderFactory initWithCloudContext:resourceManager:embedConfigurationManager:](v51, "initWithCloudContext:resourceManager:embedConfigurationManager:", v52, v54, v55);

  -[FRAppDelegate setDataProviderFactory:](self, "setDataProviderFactory:", v56);
  -[FRAppDelegate setupCloudContextWithFavoritesPersonalizer:state:launchOptions:versionHelpers:referral:](self, "setupCloudContextWithFavoritesPersonalizer:state:launchOptions:versionHelpers:referral:", v114, objc_msgSend(v113, "applicationState"), v112, v118, v117);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  objc_msgSend(v57, "bootstrapWithApplication:", v113);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "createBridgedAppResolver"));
  -[FRAppDelegate setResolver:](self, "setResolver:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "resolveProtocol:", &OBJC_PROTOCOL___FCReadonlyAggregateStoreProviderType));

  -[FRFavoritesPersonalizer setAggregateStoreProvider:](v114, "setAggregateStoreProvider:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "resolveProtocol:", &OBJC_PROTOCOL___FCTagRanking));

  -[FRFavoritesPersonalizer setTagRanker:](v114, "setTagRanker:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "resolveProtocol:", &OBJC_PROTOCOL___FCFeedPersonalizing));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  objc_msgSend(v66, "setFeedPersonalizer:", v65);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  objc_msgSend(v67, "setAggregateStoreProvider:", v61);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "resolveProtocol:", &OBJC_PROTOCOL___FCUserVectorAggregateVectorProvider));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
  objc_msgSend(v70, "setTabiBasedUserVectorAggregateVectorProvider:", v69);

  v71 = [FRSubscribedTagRanker alloc];
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "resolveProtocol:", &OBJC_PROTOCOL___FCFeedPersonalizing));
  v74 = -[FRSubscribedTagRanker initWithTagRanker:](v71, "initWithTagRanker:", v73);
  objc_msgSend(v100, "setSubscribedTagRanker:", v74);

  objc_msgSend(v100, "assignOrderToTagSubscriptionsIfNeeded");
  -[FRAppDelegate resolveAppSingletons](self, "resolveAppSingletons");
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "resolveProtocol:", &OBJC_PROTOCOL___FRURLAnalyticsReferralFactory));

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "appActivityMonitor"));
  objc_msgSend(v78, "setAnalyticsReferralFactory:", v76);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "appActivityMonitor"));
  objc_msgSend(v80, "applicationWillFinishLaunching");

  -[FRAppDelegate prewarmAd](self, "prewarmAd");
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  LOBYTE(v79) = objc_msgSend(v81, "application:willFinishLaunchingWithOptions:", v113, v112);

  return (char)v79;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (TSAppDelegate)bridgedAppDelegate
{
  return self->_bridgedAppDelegate;
}

- (void)resolveAppSingletons
{
  FRAppDelegate *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  FRGizmoSyncManager *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  FRGizmoSyncManager *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[5];

  v2 = self;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100007058;
  v61[3] = &unk_1000DB8A0;
  v61[4] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](v2, "cloudContext"));
  objc_msgSend(v3, "setOfflineArticleManagerProvider:", v61);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolveProtocol:", &OBJC_PROTOCOL___FCLocalRegionManager));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](v2, "cloudContext"));
  objc_msgSend(v6, "setLocalRegionProvider:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolveProtocol:", &OBJC_PROTOCOL___FCLocalChannelsProvider));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](v2, "cloudContext"));
  objc_msgSend(v9, "setLocalChannelsProvider:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v12 = objc_msgSend(v10, "resolveClass:", objc_opt_class(FRTodayAgent, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[FRAppDelegate setTodayAgent:](v2, "setTodayAgent:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resolveProtocol:", &OBJC_PROTOCOL___TFDiagnosticFileManagerType));
  -[FRAppDelegate setDiagnosticFileManager:](v2, "setDiagnosticFileManager:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](v2, "feldsparContext"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resolveProtocol:", &OBJC_PROTOCOL___TSSharedImageCacheType));
  objc_msgSend(v16, "setUnderlyingImageCache:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v21 = objc_msgSend(v19, "resolveClass:", objc_opt_class(FRArticlePrefetchManager, v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v16, "setArticlePrefetchManager:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "resolveProtocol:name:", &OBJC_PROTOCOL___AAViewingSessionManagerType, CFSTR("Issue")));
  objc_msgSend(v16, "setIssueViewingSessionManager:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "resolveProtocol:", &OBJC_PROTOCOL___FRToCEditorialManager));

  objc_msgSend(v26, "refreshEditorialItems");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "resolveProtocol:", &OBJC_PROTOCOL___TSLocationDetectionManagerType));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](v2, "feldsparContext"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "favoritesPersonalizer"));
  objc_msgSend(v30, "setLocationManager:", v28);

  -[FRAppDelegate setFeldsparContext:](v2, "setFeldsparContext:", v16);
  -[FRAppDelegate clearOldCacheItemsWithFeldsparContext:](v2, "clearOldCacheItemsWithFeldsparContext:", v16);
  if (+[FRMacros iPhone](FRMacros, "iPhone"))
  {
    v31 = [FRGizmoSyncManager alloc];
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cloudContext"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "appConfigurationManager"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "readingList"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "readingHistory"));
    v36 = -[FRGizmoSyncManager initWithAppConfigManager:readingList:readingHistory:](v31, "initWithAppConfigManager:readingList:readingHistory:", v33, v34, v35);

    -[FRGizmoSyncManager setDelegate:](v36, "setDelegate:", v2);
    objc_msgSend(v16, "setGizmoSyncManager:", v36);

  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "resolveProtocol:", &OBJC_PROTOCOL___FRURLRouterManagerType));
  -[FRAppDelegate setUrlRouterManager:](v2, "setUrlRouterManager:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "resolveProtocol:", &OBJC_PROTOCOL___FRUserNotificationResponseHandlerType));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](v2, "notificationManager"));
  objc_msgSend(v41, "setUserResponseHandler:", v40);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate urlRouterManager](v2, "urlRouterManager"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](v2, "notificationManager"));
  objc_msgSend(v43, "setUrlRouterManager:", v42);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
  v46 = objc_msgSend(v44, "resolveClass:", objc_opt_class(_TtC5TeaUI12Bootstrapper, v45));
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](v2, "notificationManager"));
  objc_msgSend(v48, "setBootstrapper:", v47);

  v50 = NFInternalBuild(v49);
  if ((_DWORD)v50)
  {
    v52 = NewsCoreUserDefaults(v50, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    v54 = objc_msgSend(v53, "BOOLForKey:", CFSTR("news_articles.drafts.allow_remote_preview"));

    if (v54)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](v2, "resolver"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "resolveProtocol:", &OBJC_PROTOCOL___TSLocalDraftsDeviceManagerType));
      -[FRAppDelegate setDeviceManager:](v2, "setDeviceManager:", v56);

      v57 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate deviceManager](v2, "deviceManager"));
      objc_msgSend(v57, "setDelegate:", v2);

      v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("News Preview - Device PIN"), 0, 1));
      -[FRAppDelegate setPinAlertController:](v2, "setPinAlertController:", v58);

      v59 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate pinAlertController](v2, "pinAlertController"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Done"), 1, 0));
      objc_msgSend(v59, "addAction:", v60);

    }
  }
  -[FRAppDelegate _configureBackgroundFetch](v2, "_configureBackgroundFetch");

}

- (TFResolver)resolver
{
  TFResolver *resolver;

  resolver = self->_resolver;
  if (!resolver)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007FD40();
    resolver = self->_resolver;
  }
  return resolver;
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (FRNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)prepareAppCacheSnapShot
{
  id v2;

  if (FeldsparInternalExtrasEnabled())
  {
    v2 = objc_alloc_init(NSClassFromString(CFSTR("FRAppCacheSnapshotter")));
    if (objc_msgSend(v2, "snapshotPreparedAndWaitingForRestoration"))
      objc_msgSend(v2, "finalizeRestoreOfCachesDirectory");

  }
}

- (FRURLRouterManagerType)urlRouterManager
{
  return self->_urlRouterManager;
}

- (void)setUrlRouterManager:(id)a3
{
  objc_storeStrong((id *)&self->_urlRouterManager, a3);
}

- (void)setTodayAgent:(id)a3
{
  objc_storeStrong((id *)&self->_todayAgent, a3);
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (void)setPrivateDataUpdateCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, a3);
}

- (void)setOfflineModeMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_offlineModeMonitor, a3);
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (void)setNetworkBehaviorMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, a3);
}

- (void)setFeldsparContext:(id)a3
{
  objc_storeStrong((id *)&self->_feldsparContext, a3);
}

- (void)setEmbedConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_embedConfigurationManager, a3);
}

- (void)setDataProviderFactory:(id)a3
{
  objc_storeStrong((id *)&self->_dataProviderFactory, a3);
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (void)setBackgroundFetchScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFetchScheduler, a3);
}

- (void)setBackgroundFetchManager:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundFetchManager, a3);
}

- (void)setApplicationUpdateNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationUpdateNotifier, a3);
}

- (void)setAmsPushHandler:(id)a3
{
  objc_storeStrong((id *)&self->_amsPushHandler, a3);
}

- (void)setActivityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_activityMonitor, a3);
}

- (FRPrivateDataUpdateCoordinator)privateDataUpdateCoordinator
{
  return self->_privateDataUpdateCoordinator;
}

- (FCOfflineModeMonitor)offlineModeMonitor
{
  return self->_offlineModeMonitor;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (int)fcDigestModeFromScheduledDeliverySetting:(int64_t)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (FRFlintEmbedConfigurationManager)embedConfigurationManager
{
  return self->_embedConfigurationManager;
}

- (FRFlintDataProviderFactory)dataProviderFactory
{
  return self->_dataProviderFactory;
}

- (TSBackgroundFetchScheduler)backgroundFetchScheduler
{
  return self->_backgroundFetchScheduler;
}

- (FRBackgroundFetchManager)backgroundFetchManager
{
  return self->_backgroundFetchManager;
}

- (FRApplicationUpdateNotifier)applicationUpdateNotifier
{
  return self->_applicationUpdateNotifier;
}

- (FCAMSPushHandler)amsPushHandler
{
  return self->_amsPushHandler;
}

- (id)createCarPlaySceneContainer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "createCarPlaySceneContainer"));

  return v3;
}

- (void)setupCloudContextWithAppActivityMonitor:(id)a3 dataActionProvider:(id)a4 versionHelpers:(id)a5 configurationManager:(id)a6 networkBehaviorMonitor:(id)a7 networkReachability:(id)a8
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  FRApplicationUpdateNotifier *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  unsigned int v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v60;
  id v61;

  v61 = a3;
  v56 = a8;
  v57 = a7;
  v55 = a6;
  v58 = a5;
  v13 = a4;
  v14 = FRURLForNewsAppCachesDirectory();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FCFeldsparIDProvider sharedInstance](FCFeldsparIDProvider, "sharedInstance"));
  v18 = objc_alloc((Class)FCCloudContext);
  v19 = FRURLForNewsAppDocumentsDirectory();
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  LOBYTE(a5) = +[FRMacros iPad](FRMacros, "iPad");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[FCPrivateDataSyncAvailability defaultAvailability](FCPrivateDataSyncAvailability, "defaultAvailability"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  LOBYTE(v54) = (_BYTE)a5;
  v60 = (void *)v15;
  v24 = objc_msgSend(v18, "initWithConfiguration:configurationManager:contentHostDirectory:privateDataHostDirectory:privateDataActionProvider:networkBehaviorMonitor:networkReachability:appActivityMonitor:desiredHeadlineFieldOptions:feedUsage:deviceIsiPad:backgroundTaskable:privateDataSyncAvailability:pptContext:options:", v16, v55, v15, v20, v13, v57, v56, v61, 0xF87FFFFC1, 6, v54, v21, v22, v23, 14);

  objc_msgSend(v24, "prewarmStores");
  +[TSTodayPrewarmManager prewarmTodayWithContext:](TSTodayPrewarmManager, "prewarmTodayWithContext:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tagController"));
  objc_msgSend(v25, "setShouldPrefetchGlobalTags:", 1);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "userInfo"));
  objc_msgSend(v17, "registerUserInfo:", v26);

  if (FeldsparInternalExtrasEnabled())
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle fr_feldsparInternalExtrasBundle](NSBundle, "fr_feldsparInternalExtrasBundle"));
    objc_msgSend(v27, "load");

    v28 = objc_alloc(NSClassFromString(CFSTR("FREntitlementsOverrideProvider")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "configurationManager"));
    v30 = objc_msgSend(v28, "initWithConfigurationManager:", v29);

    v31 = FCProtocolCast(&OBJC_PROTOCOL___FCEntitlementsOverrideProviderType, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "purchaseController"));
    objc_msgSend(v33, "setEntitlementsOverrideProvider:", v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bundleSubscriptionManager"));
    objc_msgSend(v34, "setEntitlementsOverrideProvider:", v32);

    v35 = objc_alloc_init(NSClassFromString(CFSTR("FRPurchaseFlowOverrideProvider")));
    v36 = FCProtocolCast(&OBJC_PROTOCOL___FCPurchaseFlowOverrideProviderType, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "purchaseManager"));
    objc_msgSend(v38, "setPurchaseFlowOverrideProvider:", v37);

  }
  FRSetupLogging();
  v39 = -[FRApplicationUpdateNotifier initWithVersionHelpers:appActivityMonitor:]([FRApplicationUpdateNotifier alloc], "initWithVersionHelpers:appActivityMonitor:", v58, v61);

  -[FRApplicationUpdateNotifier setup](v39, "setup");
  -[FRAppDelegate setApplicationUpdateNotifier:](self, "setApplicationUpdateNotifier:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v40, "registerForRemoteNotifications");

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v43 = NewsCoreUserDefaults(v41, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v45 = objc_msgSend(v44, "BOOLForKey:", FCExcludeHiddenFeedsCurrentSharedPreferenceKey);

  if ((_DWORD)v45 != objc_msgSend(v41, "BOOLForKey:", CFSTR("previous_exclude_hidden_feeds")))
    objc_msgSend(v41, "setBool:forKey:", v45, CFSTR("previous_exclude_hidden_feeds"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v47 = objc_msgSend(v46, "BOOLForKey:", FCShouldResetOnboardingVersion);

  if (v47)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v49 = objc_msgSend(v48, "integerForKey:", FCOnboardingVersionToResetTo);

    if ((unint64_t)v49 <= 1)
    {
      if (!v49)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v50, "setBool:forKey:", 0, CFSTR("has_passed_new_user_state"));

      }
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v51, "setBool:forKey:", 1, FCWhitetailOnboardingNeededKey);

    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v49));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "userInfo"));
    objc_msgSend(v53, "setOnboardingVersionNumber:", v52);

  }
  -[FRAppDelegate setCloudContext:](self, "setCloudContext:", v24);

}

- (id)_extractWidgetEngagementFromReferralURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007CC6C();
  if ((objc_msgSend(v3, "nss_isNewsURL") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007CBA4();
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fr_widgetEngagementFileURL"));
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v4);
    if (v5)
      v6 = objc_msgSend(objc_alloc((Class)NTPBWidgetEngagement), "initWithData:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)sharedDelegate
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = objc_opt_class(FRAppDelegate, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = FCDynamicCast(v2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[FRAppDelegate unregisterForDeviceLockNotifications](self, "unregisterForDeviceLockNotifications");
  v3.receiver = self;
  v3.super_class = (Class)FRAppDelegate;
  -[FRAppDelegate dealloc](&v3, "dealloc");
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resolveProtocol:", &OBJC_PROTOCOL___SNTestRunner));

  LOBYTE(v9) = objc_msgSend(v10, "runTest:options:", v8, v7);
  return (char)v9;
}

- (void)localDraftsDeviceOnPreview:(id)a3 articleIdentifier:(id)a4 channelIdentifier:(id)a5
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("applenews://preview/%@/%@"), a5, a4));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));

  -[FRAppDelegate _application:openURL:options:animated:](self, "_application:openURL:options:animated:", self, v7, &__NSDictionary0__struct, +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
}

- (void)showAlertWithPin:(id)a3 pin:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key_window"));

  v7 = objc_alloc((Class)NSMutableAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\n"), "stringByAppendingString:", v5));

  v9 = objc_msgSend(v7, "initWithString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithName:size:](UIFont, "fontWithName:size:", CFSTR("Helvetica"), 24.0));
  objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v10, 0, 7);

  objc_msgSend(v9, "addAttribute:value:range:", NSKernAttributeName, &off_1000E4C98, 0, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate pinAlertController](self, "pinAlertController"));
  objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("attributedMessage"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rootViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate pinAlertController](self, "pinAlertController"));
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)hideAlert:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FRAppDelegate pinAlertController](self, "pinAlertController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)showAppUnsupportedAlert
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Apple News isn’t supported in your current region."), &stru_1000DF290, 0));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v10, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Quit"), &stru_1000DF290, 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v5, 0, &stru_1000DCFE0));
  objc_msgSend(v3, "addAction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "key_window"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
  objc_msgSend(v9, "presentViewController:animated:completion:", v3, 1, 0);

}

- (void)application:(id)a3 handleIntent:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  objc_msgSend(v11, "application:handleIntent:completionHandler:", v10, v9, v8);

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "forwardingTargetForSelector:", a3));

  return v5;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  objc_msgSend(v5, "buildMenuWithBuilder:", v4);

}

- (void)validateCommand:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  objc_msgSend(v5, "validateCommand:", v4);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
  LOBYTE(a3) = objc_msgSend(v7, "canPerformAction:withSender:", a3, v6);

  return (char)a3;
}

- (void)_didResumeLowPriorityTasks
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resolveProtocol:", &OBJC_PROTOCOL___TSCacheFlushingManagerType));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000578B8;
  v15[3] = &unk_1000DAF78;
  v15[4] = self;
  objc_msgSend(v12, "addPreFlushTask:", v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolveProtocol:", &OBJC_PROTOCOL___FRToCEditorialManager));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005796C;
  v13[3] = &unk_1000DAF78;
  v14 = v5;
  v6 = v5;
  objc_msgSend(v12, "addPreFlushTask:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
  v9 = objc_msgSend(v7, "resolveClass:", objc_opt_class(FCVanityURLRedirectService, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "acquireHoldTokenOnUnderlyingAssets");
  objc_msgSend(v12, "enableFlushing");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate todayAgent](self, "todayAgent"));
  objc_msgSend(v11, "performSelector:withObject:afterDelay:", "enable", 0, 1.0);

}

- (void)application:(id)a3 didSendEvent:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRAppDelegate keyboardInputMonitor](self, "keyboardInputMonitor"));
  objc_msgSend(v6, "handle:", v5);

}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  FRAppDelegate *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  unsigned __int8 v27;
  char v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  char v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  int v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  LODWORD(v11) = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  v12 = FRNavigationLog;
  if (os_log_type_enabled((os_log_t)FRNavigationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = v9;
    v37 = 1024;
    v38 = (int)v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ApplicationDelegate received URL to handle <%{public}@>, animated %d", buf, 0x12u);
  }
  LODWORD(v13) = objc_msgSend(v9, "nss_isNewsURL");
  if ((_DWORD)v13)
  {
    v14 = objc_alloc((Class)UIView);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v15, "bounds");
    v16 = objc_msgSend(v14, "initWithFrame:");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    objc_msgSend(v16, "setBackgroundColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", NUURLWasOpenedFromNewsKey));
    if ((objc_msgSend(v18, "isEqual:", &__kCFBooleanTrue) & 1) == 0)
    {
      v28 = (char)v11;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", UIApplicationOpenURLOptionsSourceApplicationKey));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = (char)v13;
      v13 = v10;
      v21 = self;
      v22 = v8;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleIdentifier"));
      v27 = objc_msgSend(v11, "isEqual:", v23);

      v8 = v22;
      self = v21;
      v10 = v13;
      LOBYTE(v13) = v20;

      LOBYTE(v11) = v28;
      if ((v27 & 1) != 0)
      {
LABEL_8:
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100057CAC;
        block[3] = &unk_1000DD090;
        block[4] = self;
        v30 = v8;
        v31 = v9;
        v34 = (char)v11;
        v32 = v10;
        v33 = v16;
        v25 = v16;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        goto LABEL_9;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "key_window"));

      objc_msgSend(v18, "addSubview:", v16);
    }

    goto LABEL_8;
  }
LABEL_9:

  return (char)v13;
}

+ (BOOL)shouldHideHeadline:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FRAppDelegate sharedDelegate](FRAppDelegate, "sharedDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cloudContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "readingList"));
  v7 = objc_msgSend(v6, "shouldHideHeadline:", v3);

  return v7;
}

- (void)_application:(id)a3 openURL:(id)a4 options:(id)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v6 = a6;
  v20 = a4;
  v9 = a5;
  if (objc_msgSend(v20, "nss_isNewsURL"))
  {
    if (objc_msgSend(v20, "fr_isFeldsparOpenInNewsErrorURL"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key_window"));

      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));

      if (v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentedViewController"));

        v12 = (id)v14;
      }
      FROpenInNewsAlert(v12);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate resolver](self, "resolver"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "resolveProtocol:", &OBJC_PROTOCOL___FRURLAnalyticsReferralFactory));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", UIApplicationOpenURLOptionsSourceApplicationKey));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "analyticsReferralForURL:sourceApplication:", v20, v16));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appActivityMonitor"));
      objc_msgSend(v18, "setAppSessionStartReferral:", v12);

      if (v6)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate urlRouterManager](self, "urlRouterManager"));
        objc_msgSend(v19, "handleOpenURL:options:analyticsReferral:", v20, v9, v12);

      }
      else
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100057F7C;
        v21[3] = &unk_1000D9820;
        v21[4] = self;
        v22 = v20;
        v23 = v9;
        v12 = v12;
        v24 = v12;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);

      }
    }

  }
}

- (void)sceneDidEnterBackground
{
  void *v3;
  void *v4;
  FRInternalExtrasFakeNotificationSender *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
  objc_msgSend(v3, "setIsHandlingArticleNotification:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "underlyingImageCache"));

  objc_msgSend(v8, "pruneImagesOlderThan:", 86400.0);
  v5 = objc_alloc_init(FRInternalExtrasFakeNotificationSender);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  -[FRInternalExtrasFakeNotificationSender scheduleAnyFakeNotificationsFromInternalExtras:whenAppEntersBackground:](v5, "scheduleAnyFakeNotificationsFromInternalExtras:whenAppEntersBackground:", v6, v7);

}

- (void)unregisterForDeviceLockNotifications
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (notify_cancel(self->lockStateToken))
  {
    v2 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
      sub_10007FE3C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v5 = a4;
  v6 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
    sub_10007FE70((uint64_t)v5, v6, v8, v9, v10, v11, v12, v13);
  v14 = objc_opt_class(FRFeldsparContext, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v16 = FCDynamicCast(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "notificationSettings"));
  v20 = -[FRAppDelegate fcDigestModeFromScheduledDeliverySetting:](self, "fcDigestModeFromScheduledDeliverySetting:", objc_msgSend(v19, "scheduledDeliverySetting"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cloudContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "notificationController"));
  objc_msgSend(v22, "registerDeviceToken:deviceDigestMode:", 0, v20);

}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  NSObject *v23;
  _BOOL4 v24;
  dispatch_time_t v25;
  _QWORD *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD *v36;
  dispatch_time_t v37;
  _QWORD v38[5];
  void (**v39)(id, uint64_t);
  uint8_t buf[4];
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cloudContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "notificationController"));
  v14 = objc_msgSend(v13, "shouldUseNewsUINotificationHandling");

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
    objc_msgSend(v15, "application:didReceiveRemoteNotification:fetchCompletionHandler:", v8, v9, v10);

  }
  else
  {
    v16 = FCPushNotificationsLog;
    if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Received remote notification: %@", buf, 0xCu);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate amsPushHandler](self, "amsPushHandler"));
    v18 = objc_msgSend(v17, "shouldHandleNotification:", v9);

    if (v18)
    {
      v19 = FCPushNotificationsLog;
      if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Remote notification sent from AMS", buf, 2u);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "userInfo"));
      v22 = objc_msgSend(v21, "marketingNotificationsEnabled");

      v23 = FCPushNotificationsLog;
      v24 = os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (v24)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Allowing AMS notification to be shown to user.", buf, 2u);
        }
      }
      else
      {
        if (v24)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Instantly removing AMS remote notification because user has opted out. News should never have even received this.", buf, 2u);
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
        objc_msgSend(v32, "getDeliveredNotificationsWithCompletionHandler:", &stru_1000DD158);

      }
      v10[2](v10, 1);
    }
    else
    {
      v25 = dispatch_time(0, 25000000000);
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100058948;
      v38[3] = &unk_1000DD1A8;
      v38[4] = self;
      v39 = v10;
      v26 = objc_retainBlock(v38);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate offlineModeMonitor](self, "offlineModeMonitor"));
      v28 = objc_msgSend(v27, "isCloudKitReachable");

      if ((v28 & 1) != 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
        v30 = objc_msgSend(v29, "canHandleRemoteNotification:", v9);

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate notificationManager](self, "notificationManager"));
          objc_msgSend(v31, "setIsHandlingArticleNotification:", 1);

          ((void (*)(_QWORD *, uint64_t))v26[2])(v26, 1);
        }
        else
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate cloudContext](self, "cloudContext"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "privatePushNotificationHandler"));
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_1000589E8;
          v35[3] = &unk_1000DD298;
          v35[4] = self;
          v37 = v25;
          v36 = v26;
          objc_msgSend(v34, "handleRemoteNotification:completionHandler:", v9, v35);

        }
      }
      else
      {
        ((void (*)(_QWORD *, uint64_t))v26[2])(v26, 2);
      }

    }
  }

}

- (void)notificationManagerDidHandleNotificationResponse:(id)a3 withAnalyticsReferral:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRAppDelegate activityMonitor](self, "activityMonitor"));
  objc_msgSend(v6, "setAppSessionStartReferral:", v5);

}

- (id)gizmoSyncManager:(id)a3 fetchOperationForArticleIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = objc_alloc((Class)FCArticleHeadlinesFetchOperation);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate feldsparContext](self, "feldsparContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudContext"));
  v9 = objc_msgSend(v5, "copy");

  v10 = objc_msgSend(v6, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v8, v9, &__NSArray0__struct);
  return v10;
}

- (void)application:(id)a3 performFetchWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = FRBackgroundFetchLog;
  if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "app was awoken for fetching via application:performFetchWithCompletionHandler:", buf, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate offlineModeMonitor](self, "offlineModeMonitor"));
  v10 = objc_msgSend(v9, "isCloudKitReachable");

  if ((v10 & 1) != 0)
  {
    if (-[FRAppDelegate safeIsAppRunningInBackground](self, "safeIsAppRunningInBackground"))
    {
      +[FCTaskScheduler enableBackgroundDownloadsInSpiteOfHighPriorityTasks](FCTaskScheduler, "enableBackgroundDownloadsInSpiteOfHighPriorityTasks");
      v11 = dispatch_group_create();
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));

      if (v13)
      {
        v14 = FRBackgroundFetchLog;
        if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "will run bridged backround fetch", buf, 2u);
        }
        dispatch_group_enter(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate bridgedAppDelegate](self, "bridgedAppDelegate"));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100059458;
        v26[3] = &unk_1000DD2C0;
        v27 = v12;
        v28 = v11;
        objc_msgSend(v15, "application:performFetchWithCompletionHandler:", v6, v26);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate backgroundFetchManager](self, "backgroundFetchManager"));

      if (v16)
      {
        v17 = FRBackgroundFetchLog;
        if (os_log_type_enabled((os_log_t)FRBackgroundFetchLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "will run legacy backround fetch", buf, 2u);
        }
        dispatch_group_enter(v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRAppDelegate backgroundFetchManager](self, "backgroundFetchManager"));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10005950C;
        v23[3] = &unk_1000DD2E8;
        v24 = v12;
        v25 = v11;
        objc_msgSend(v18, "peformBackgroundFetchWithReason:timeout:completionHandler:", 0, v23, 25.0);

      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000595C0;
      v20[3] = &unk_1000D9D18;
      v21 = v12;
      v22 = v7;
      v19 = v12;
      dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, v20);

    }
    else
    {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 2);
  }

}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  -[FRAppDelegate _updateBackgroundFetchSettingsWithAppConfiguration:](self, "_updateBackgroundFetchSettingsWithAppConfiguration:", a4);
}

- (BOOL)safeIsAppRunningInBackground
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  _QWORD block[4];
  id v9;
  FRAppDelegate *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key_window"));

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));
    if (objc_msgSend(v5, "activationState") == (id)2)
      v6 = 1;
    else
      v6 = -[FRAppDelegate isDeviceLocked](self, "isDeviceLocked");

  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059770;
    block[3] = &unk_1000DD310;
    v11 = &v12;
    v9 = v4;
    v10 = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    v6 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

- (FRAppActivityMonitor)activityMonitor
{
  return self->_activityMonitor;
}

- (BOOL)inPreviewMode
{
  return self->_inPreviewMode;
}

- (void)setInPreviewMode:(BOOL)a3
{
  self->_inPreviewMode = a3;
}

- (BOOL)appOpenedByUserActivity
{
  return self->_appOpenedByUserActivity;
}

- (void)setAppOpenedByUserActivity:(BOOL)a3
{
  self->_appOpenedByUserActivity = a3;
}

- (void)setBundleAssemblies:(id)a3
{
  objc_storeStrong((id *)&self->_bundleAssemblies, a3);
}

- (void)setAssemblies:(id)a3
{
  objc_storeStrong((id *)&self->_assemblies, a3);
}

- (TFBridgedContainer)bridgedContainer
{
  return self->_bridgedContainer;
}

- (void)setBridgedContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bridgedContainer, a3);
}

- (NSTimer)handoffStreamsTimer
{
  return self->_handoffStreamsTimer;
}

- (void)setHandoffStreamsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_handoffStreamsTimer, a3);
}

- (FCAccountActionQueue)accountActionQueue
{
  return self->_accountActionQueue;
}

- (void)setAccountActionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountActionQueue, a3);
}

- (TUKeyboardInputMonitor)keyboardInputMonitor
{
  return self->_keyboardInputMonitor;
}

- (void)setKeyboardInputMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardInputMonitor, a3);
}

- (void)setBridgedAppDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_bridgedAppDelegate, a3);
}

- (TFDiagnosticFileManager)diagnosticFileManager
{
  return self->_diagnosticFileManager;
}

- (void)setDiagnosticFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticFileManager, a3);
}

- (UIAlertController)pinAlertController
{
  return self->_pinAlertController;
}

- (void)setPinAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_pinAlertController, a3);
}

- (FRTodayAgent)todayAgent
{
  return self->_todayAgent;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  self->_isDeviceLocked = a3;
}

- (TSLocalDraftsDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_applicationUpdateNotifier, 0);
  objc_storeStrong((id *)&self->_amsPushHandler, 0);
  objc_storeStrong((id *)&self->_backgroundFetchManager, 0);
  objc_storeStrong((id *)&self->_todayAgent, 0);
  objc_storeStrong((id *)&self->_pinAlertController, 0);
  objc_storeStrong((id *)&self->_backgroundFetchScheduler, 0);
  objc_storeStrong((id *)&self->_urlRouterManager, 0);
  objc_storeStrong((id *)&self->_embedConfigurationManager, 0);
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);
  objc_storeStrong((id *)&self->_diagnosticFileManager, 0);
  objc_storeStrong((id *)&self->_offlineModeMonitor, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_bridgedAppDelegate, 0);
  objc_storeStrong((id *)&self->_keyboardInputMonitor, 0);
  objc_storeStrong((id *)&self->_accountActionQueue, 0);
  objc_storeStrong((id *)&self->_handoffStreamsTimer, 0);
  objc_storeStrong((id *)&self->_bridgedContainer, 0);
  objc_storeStrong((id *)&self->_assemblies, 0);
  objc_storeStrong((id *)&self->_bundleAssemblies, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_activityMonitor, 0);
  objc_storeStrong((id *)&self->_privateDataUpdateCoordinator, 0);
  objc_storeStrong((id *)&self->_feldsparContext, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
