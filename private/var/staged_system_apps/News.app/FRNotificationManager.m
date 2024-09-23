@implementation FRNotificationManager

- (void)notifyDeviceTokenIsAvailable:(id)a3
{
  id v4;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  -[FRNotificationManager setDeviceToken:](self, "setDeviceToken:", v4);

  if (-[FRNotificationManager autoEnableNotificationsIsPending](self, "autoEnableNotificationsIsPending"))
    -[FRNotificationManager autoEnableNotificationsForPreSubscribedChannels](self, "autoEnableNotificationsForPreSubscribedChannels");
}

+ (void)initialize
{
  void *v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[2];

  if ((id)objc_opt_class(FRNotificationManager, a2) == a1)
  {
    v4[0] = CFSTR("notification_alert_frequency");
    v4[1] = FCNotificationChannelsRefreshFrequencyKey;
    v5[0] = &off_1000E4B90;
    v5[1] = &off_1000E4B90;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 2));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "registerDefaults:", v2);

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    +[NSThread isMainThread](NSThread, "isMainThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager observers](self, "observers"));
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007E8F4((uint64_t)v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager observers](self, "observers"));
    objc_msgSend(v7, "addObject:", v4);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007E83C();
    +[NSThread isMainThread](NSThread, "isMainThread");
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (FRNotificationManager)initWithFeldsparContext:(id)a3 amsPushHandler:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  FRNotificationManager *v10;
  uint64_t v11;
  NFMutexLock *newsUserInfoLock;
  uint64_t v13;
  NSHashTable *observers;
  void *v15;
  void *v16;
  uint64_t v17;
  FCNewsAppConfigurationManager *appConfigurationManager;
  void *v19;
  uint64_t v20;
  FCNotificationsConfiguration *notificationsConfiguration;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  objc_super v32;

  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)FRNotificationManager;
  v10 = -[FRNotificationManager init](&v32, "init");
  if (v10)
  {
    v11 = objc_opt_new(NFMutexLock, v9);
    newsUserInfoLock = v10->_newsUserInfoLock;
    v10->_newsUserInfoLock = (NFMutexLock *)v11;

    objc_storeStrong((id *)&v10->_feldsparContext, a3);
    objc_storeStrong((id *)&v10->_amsPushHandler, a4);
    v13 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v13;

    v10->_isHandlingArticleNotification = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appActivityMonitor"));
    objc_msgSend(v15, "addObserver:", v10);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudContext"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appConfigurationManager"));
    appConfigurationManager = v10->_appConfigurationManager;
    v10->_appConfigurationManager = (FCNewsAppConfigurationManager *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FCNewsAppConfigurationManager possiblyUnfetchedAppConfiguration](v10->_appConfigurationManager, "possiblyUnfetchedAppConfiguration"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "notificationsConfig"));
    notificationsConfiguration = v10->_notificationsConfiguration;
    v10->_notificationsConfiguration = (FCNotificationsConfiguration *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notificationsConfiguration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "preSubscribedNotificationsChannelIDs"));
    if (objc_msgSend(v23, "count"))
    {
      v10->_notificationUIEnabled = 1;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notificationsConfiguration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "recommendedNotificationChannelIDs"));
      v10->_notificationUIEnabled = objc_msgSend(v25, "count") != 0;

    }
    -[FCNewsAppConfigurationManager addAppConfigObserver:](v10->_appConfigurationManager, "addAppConfigObserver:", v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudContext"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "notificationController"));
    v28 = objc_msgSend(v27, "shouldUseNewsUINotificationHandling");

    if ((v28 & 1) == 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudContext"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "subscriptionController"));
      objc_msgSend(v30, "addObserver:", v10);

    }
  }

  return v10;
}

- (void)setUserResponseHandler:(id)a3
{
  objc_storeStrong((id *)&self->_userResponseHandler, a3);
}

- (void)setUrlRouterManager:(id)a3
{
  objc_storeStrong((id *)&self->_urlRouterManager, a3);
}

- (void)setDeviceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setBootstrapper:(id)a3
{
  objc_storeStrong((id *)&self->_bootstrapper, a3);
}

- (BOOL)autoEnableNotificationsIsPending
{
  return self->_autoEnableNotificationsIsPending;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager appConfigurationManager](self, "appConfigurationManager"));
  objc_msgSend(v3, "removeAppConfigObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)FRNotificationManager;
  -[FRNotificationManager dealloc](&v5, "dealloc");
}

- (id)notificationArticleCategory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  if (objc_msgSend(v3, "supportsContentExtensions"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Read Story"), &stru_1000DF290, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("open-in-news"), v5, 4));

    objc_msgSend(v2, "addObject:", v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Save for Later"), &stru_1000DF290, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("save-article"), v8, 0));

  objc_msgSend(v2, "addObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", FCNotificationArticleCategory, v2, &__NSArray0__struct, 4));

  return v10;
}

- (id)channelNotificationSupportCategory
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Customize"), &stru_1000DF290, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAction actionWithIdentifier:title:options:](UNNotificationAction, "actionWithIdentifier:title:options:", CFSTR("open-notification-settings"), v3, 4));

  v5 = FCNotificationChannelNotificationSupportCategory;
  v9 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", v5, v6, &__NSArray0__struct, 4));

  return v7;
}

- (id)notificationMarketingCategory
{
  return +[UNNotificationCategory categoryWithIdentifier:actions:intentIdentifiers:options:](UNNotificationCategory, "categoryWithIdentifier:actions:intentIdentifiers:options:", FCNotificationMarketingCategory, &__NSArray0__struct, &__NSArray0__struct, 4);
}

- (BOOL)canShowNotificationAlert
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", FCNotificationManagerLastDeclinedNotificationDateKey));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("notification_alert_frequency"));

    if (v6 == (id)-1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager appConfigurationManager](self, "appConfigurationManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appConfiguration"));
      v6 = objc_msgSend(v8, "newFavoriteNotificationAlertsFrequency");

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v9, "timeIntervalSinceDate:", v4);
    v11 = v10;

    v12 = v11 >= (double)(uint64_t)v6;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)refreshLastDeclinedNotificationAlertDate
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "setObject:forKey:", v2, FCNotificationManagerLastDeclinedNotificationDateKey);

}

- (void)autoEnableNotificationsForPreSubscribedChannels
{
  void *v3;
  FRNotificationAutoEnableHelper *v4;
  void *v5;
  FRNotificationAutoEnableHelper *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager deviceToken](self, "deviceToken"));

  if (v3)
  {
    -[FRNotificationManager setAutoEnableNotificationsIsPending:](self, "setAutoEnableNotificationsIsPending:", 0);
    v4 = [FRNotificationAutoEnableHelper alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager feldsparContext](self, "feldsparContext"));
    v6 = -[FRNotificationAutoEnableHelper initWithFeldsparContext:](v4, "initWithFeldsparContext:", v5);
    -[FRNotificationManager setNotificationAutoEnableHelper:](self, "setNotificationAutoEnableHelper:", v6);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[FRNotificationManager notificationAutoEnableHelper](self, "notificationAutoEnableHelper"));
    objc_msgSend(v7, "autoEnableNotificationsForPreSubscribedChannels");

  }
  else
  {
    -[FRNotificationManager setAutoEnableNotificationsIsPending:](self, "setAutoEnableNotificationsIsPending:", 1);
  }
}

- (id)resetLastNotificationPayloadInfo
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100018604;
  v11 = sub_100018524;
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager newsUserInfoLock](self, "newsUserInfoLock"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100044340;
  v6[3] = &unk_1000DBFB0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithLockSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)lastNotificationPayloadInfo
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100018604;
  v11 = sub_100018524;
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager newsUserInfoLock](self, "newsUserInfoLock"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000444A8;
  v6[3] = &unk_1000DBFB0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performWithLockSync:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  -[FRNotificationManager _checkUNAuthorizationStatus](self, "_checkUNAuthorizationStatus");
}

- (void)_checkUNAuthorizationStatus
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004459C;
  v4[3] = &unk_1000DBFD8;
  v4[4] = self;
  objc_msgSend(v3, "getNotificationSettingsWithCompletionHandler:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (v4)
  {
    +[NSThread isMainThread](NSThread, "isMainThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager observers](self, "observers"));
    objc_msgSend(v5, "removeObject:", v4);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10007E9A8();
    +[NSThread isMainThread](NSThread, "isMainThread");
  }

}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notificationsConfig"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager notificationsConfiguration](self, "notificationsConfiguration"));
  LOBYTE(v5) = objc_msgSend(v7, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[FRNotificationManager setNotificationsConfiguration:](self, "setNotificationsConfiguration:", v7);
    -[FRNotificationManager _updateNotificationUIEnabled](self, "_updateNotificationUIEnabled");
  }

}

- (void)_updateNotificationUIEnabled
{
  unsigned int v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v3 = -[FRNotificationManager notificationUIEnabled](self, "notificationUIEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager notificationsConfiguration](self, "notificationsConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preSubscribedNotificationsChannelIDs"));
  if (objc_msgSend(v5, "count"))
  {

    if ((v3 & 1) != 0)
      return;
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager notificationsConfiguration](self, "notificationsConfiguration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recommendedNotificationChannelIDs"));
    v6 = objc_msgSend(v8, "count") != 0;

    if (v3 == v6)
      return;
  }
  -[FRNotificationManager setNotificationUIEnabled:](self, "setNotificationUIEnabled:", v6);
}

- (BOOL)isTagIDWhitelistedForNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager notificationsConfiguration](self, "notificationsConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preSubscribedNotificationsChannelIDs"));
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager notificationsConfiguration](self, "notificationsConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recommendedNotificationChannelIDs"));
    v7 = objc_msgSend(v9, "containsObject:", v4);

  }
  return v7;
}

- (void)subscriptionController:(id)a3 didFindTagsWithNotificationSupport:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  FRNotificationManager *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager appConfigurationManager](self, "appConfigurationManager"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004499C;
    v9[3] = &unk_1000DC000;
    v10 = v7;
    v11 = self;
    v12 = v6;
    objc_msgSend(v8, "fetchAppConfigurationIfNeededWithCompletionQueue:completion:", &_dispatch_main_q, v9);

  }
}

- (void)_notifyOfTagsWithNotificationAvailable:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;

  v4 = a3;
  v5 = (uint64_t)objc_msgSend(v4, "count");
  if (v5 >= 1)
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager _identifierWithPrefix:tags:](self, "_identifierWithPrefix:tags:", CFSTR("LocalNotificationAvailable"), v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Notifications Available"), &stru_1000DF290, 0));

    v18 = CFSTR("LocalNotificationTypeKey");
    v19 = CFSTR("NotificationSupportType");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    if (v6 == 1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@ now offers notifications about important stories."), &stru_1000DF290, 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &stru_1000DC040));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager _combinedStringWithTagNames:](self, "_combinedStringWithTagNames:", v12));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@ now offer notifications in Apple News."), &stru_1000DF290, 0));
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13);
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    -[FRNotificationManager _scheduleLocalNotificationWithIdentifier:title:body:userInfo:category:timeInterval:](self, "_scheduleLocalNotificationWithIdentifier:title:body:userInfo:category:timeInterval:", v8, v10, v17, v11, FCNotificationChannelNotificationSupportCategory, 3.0);
  }

}

- (void)_notifyOfTagsWithNotificationEnabled:(id)a3
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
  const __CFString *v15;
  const __CFString *v16;

  v4 = a3;
  if ((uint64_t)objc_msgSend(v4, "count") >= 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager _identifierWithPrefix:tags:](self, "_identifierWithPrefix:tags:", CFSTR("LocalNotificationEnabled"), v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Notifications Now Available"), &stru_1000DF290, 0));

    v15 = CFSTR("LocalNotificationTypeKey");
    v16 = CFSTR("NotificationSupportType");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &stru_1000DC060));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager _combinedStringWithTagNames:](self, "_combinedStringWithTagNames:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%@ will start sending you notifications about important stories."), &stru_1000DF290, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11));

    -[FRNotificationManager _scheduleLocalNotificationWithIdentifier:title:body:userInfo:category:timeInterval:](self, "_scheduleLocalNotificationWithIdentifier:title:body:userInfo:category:timeInterval:", v6, v8, v14, v9, FCNotificationChannelNotificationSupportCategory, 3.0);
  }

}

- (id)_combinedStringWithTagNames:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (objc_msgSend(v3, "count") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  }
  else
  {
    v5 = objc_msgSend(v3, "count");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    if (v5 == (id)2)
      v8 = CFSTR("%@ and %@");
    else
      v8 = CFSTR("%@, %@, and others");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1000DF290, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10, v11));

  }
  return v4;
}

- (id)_identifierWithPrefix:(id)a3 tags:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", v6);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000453B4;
  v10[3] = &unk_1000DC088;
  v8 = v7;
  v11 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  return v8;
}

- (BOOL)canHandleRemoteNotification:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("aps")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("category")));
  v5 = objc_msgSend(v4, "isEqualToString:", FCNotificationArticleCategory);

  return v5;
}

- (void)handleActionForRemoteArticleNotificationWithIdentifier:(id)a3 forUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  unsigned int v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  FRAnalyticsReferral *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  uint8_t buf[4];
  void *v47;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", FCNotificationPayloadNewsKey));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", FCNotificationPayloadArticleIDKey));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", FCNotificationPayloadNotificationIDKey));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager newsUserInfoLock](self, "newsUserInfoLock"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000459A4;
  v44[3] = &unk_1000D97A8;
  v44[4] = self;
  v13 = v9;
  v45 = v13;
  objc_msgSend(v12, "performWithLockSync:", v44);

  if (v10)
  {
    v42 = v6;
    v14 = FCPushNotificationsLog;
    if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v47 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Handling remote notification with articleID: %@", buf, 0xCu);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager appConfigurationManager](self, "appConfigurationManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "possiblyUnfetchedAppConfiguration"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "exploreArticleID"));
    v18 = objc_msgSend(v10, "isEqualToString:", v17);

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager userResponseHandler](self, "userResponseHandler"));
      objc_msgSend(v19, "navigateToSpotlight");
    }
    else
    {
      -[FRNotificationManager setIsHandlingArticleNotification:](self, "setIsHandlingArticleNotification:", 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager _headlineFromArticleNotificationPayload:](self, "_headlineFromArticleNotificationPayload:", v13));
      if (objc_msgSend(v42, "isEqualToString:", CFSTR("save-article")))
      {
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", FCNotificationPayloadSourceChannelIDKey));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", FCNotificationPayloadIsPaidKey));
        v22 = objc_msgSend(v21, "BOOLValue") ^ 1;

        v23 = (void *)v20;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager userResponseHandler](self, "userResponseHandler"));
        objc_msgSend(v24, "saveArticleWithID:notificationID:sourceChannelID:isFreeArticle:headline:userActionDate:", v10, v11, v23, v22, v19, v8);
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", FCNotificationPayloadTimestampInMillisecondsKey));
        objc_msgSend(v25, "doubleValue");
        v27 = v26;

        if (v27 <= 0.0)
          v28 = 0;
        else
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate fc_dateWithMillisecondTimeIntervalSince1970:](NSDate, "fc_dateWithMillisecondTimeIntervalSince1970:", (unint64_t)v27));
        if (objc_msgSend(v19, "needsRapidUpdates"))
          v29 = objc_msgSend(v16, "notificationArticleWithRapidUpdatesCacheTimeout");
        else
          v29 = objc_msgSend(v16, "notificationArticleCacheTimeout");
        v40 = v28;
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dateByAddingTimeInterval:", (double)(uint64_t)v29));
        if (objc_msgSend(v19, "isValid")
          && (v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date")),
              v31 = objc_msgSend(v30, "fc_isEarlierThan:", v41),
              v30,
              v31))
        {
          v32 = FCPushNotificationsLog;
          if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v10;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Will use notification payload for headline with articleID: %@", buf, 0xCu);
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager userResponseHandler](self, "userResponseHandler"));
          objc_msgSend(v33, "showHeadline:notificationID:userActionDate:", v19, v11, v8);
        }
        else
        {
          v39 = v16;
          v34 = FCPushNotificationsLog;
          if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v10;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Will fetch article with articleID: %@", buf, 0xCu);
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager userResponseHandler](self, "userResponseHandler"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager lastNotificationPayloadInfo](self, "lastNotificationPayloadInfo"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "notificationSenderChannelID"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
          objc_msgSend(v33, "showArticleWithID:notificationID:channelID:title:forceArticleUpdate:userActionDate:", v10, v11, v36, v37, objc_msgSend(v19, "needsRapidUpdates"), v8);

          v16 = v39;
        }
        v24 = (void *)v41;

        v23 = v40;
      }

    }
    v38 = -[FRAnalyticsReferral initWithAppSessionStartFromNotificationType:]([FRAnalyticsReferral alloc], "initWithAppSessionStartFromNotificationType:", 4);
    -[FRNotificationManager _notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:](self, "_notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:", v38);

    v6 = v42;
  }
  else
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000459E4;
    v43[3] = &unk_1000D9758;
    v43[4] = self;
    sub_1000459E4((uint64_t)v43);
  }

}

- (id)_headlineFromArticleNotificationPayload:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = FCNotificationPayloadSourceChannelIDKey;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager feldsparContext](self, "feldsparContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cloudContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tagController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "slowCachedTagForID:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asChannel"));

  }
  else
  {
    v11 = 0;
  }
  v12 = objc_alloc((Class)FCNotificationArticleHeadline);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager feldsparContext](self, "feldsparContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cloudContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetManager"));
  v16 = objc_msgSend(v12, "initWithArticlePayload:sourceChannel:assetManager:", v5, v11, v15);

  return v16;
}

- (void)unregisterForRemoteNotifications
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v2, "unregisterForRemoteNotifications");

}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void (**v7)(id, uint64_t);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  NSObject *v17;
  __int16 v18[8];

  v7 = (void (**)(id, uint64_t))a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager amsPushHandler](self, "amsPushHandler"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "content"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userInfo"));
  if (!objc_msgSend(v9, "shouldHandleNotification:", v12))
  {

    goto LABEL_7;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager feldsparContext](self, "feldsparContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cloudContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
  v16 = objc_msgSend(v15, "marketingNotificationsEnabled");

  if ((v16 & 1) != 0)
  {
LABEL_7:
    v7[2](v7, 7);
    goto LABEL_8;
  }
  v17 = FCPushNotificationsLog;
  if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    v18[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Smothering AMS remote notification in foreground because user has opted out. News should never have even received this.", (uint8_t *)v18, 2u);
  }
  v7[2](v7, 0);
LABEL_8:

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  FRAnalyticsReferral *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  FRAnalyticsReferral *v35;
  void *v36;
  FRAnalyticsReferral *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  FRAnalyticsReferral *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  FRAnalyticsReferral *v70;
  void *v71;
  void *v72;
  _QWORD v73[5];
  id v74;
  id v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  id v79;
  _QWORD v80[5];
  id v81;
  _QWORD v82[5];
  UIApplicationOpenExternalURLOptionsKey v83;
  void *v84;
  UIApplicationOpenExternalURLOptionsKey v85;
  void *v86;
  UIApplicationOpenExternalURLOptionsKey v87;
  void *v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  void *v92;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "request"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "request"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "content"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userInfo"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager amsPushHandler](self, "amsPushHandler"));
  LODWORD(v14) = objc_msgSend(v17, "shouldHandleNotificationResponse:", v7);

  if ((_DWORD)v14)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager amsPushHandler](self, "amsPushHandler"));
    objc_msgSend(v18, "handleNotificationResponse:", v7);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager newsUserInfoLock](self, "newsUserInfoLock"));
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1000467BC;
    v82[3] = &unk_1000D9758;
    v82[4] = self;
    objc_msgSend(v19, "performWithLockSync:", v82);

    v20 = -[FRAnalyticsReferral initWithAppSessionStartFromNotificationType:]([FRAnalyticsReferral alloc], "initWithAppSessionStartFromNotificationType:", 1);
    -[FRNotificationManager _notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:](self, "_notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:", v20);
  }
  else
  {
    v21 = FCPushNotificationsLog;
    if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v90 = (uint64_t)v9;
      v91 = 2112;
      v92 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Received notification with actionIdentifier: %@ notificationIdentifier: %@", buf, 0x16u);
    }
    v20 = (FRAnalyticsReferral *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("LocalNotificationTypeKey")));
    if (-[FRAnalyticsReferral isEqualToString:](v20, "isEqualToString:", CFSTR("NotificationSupportType")))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager userResponseHandler](self, "userResponseHandler"));
      objc_msgSend(v22, "navigateToNotificationSettings");

    }
    else
    {
      v70 = v20;
      v71 = v9;
      v72 = v12;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "request"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "content"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "categoryIdentifier"));
      v27 = objc_msgSend(v26, "isEqualToString:", FCNotificationIssueCategory);

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("issues")));
        v29 = objc_msgSend(v28, "count");
        v12 = v72;
        if (v29)
        {
          if (v29 == (id)1)
          {
            v30 = FCPushNotificationsLog;
            if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Received issue notification response for exactly 1 issue", buf, 2u);
            }
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 0));
            v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("issueID")));

            v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL nss_NewsURLForArticleID:](NSURL, "nss_NewsURLForArticleID:", v32));
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:"));
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("notificationID=%@"), v72));
            objc_msgSend(v33, "setQuery:", v34);

            v35 = (FRAnalyticsReferral *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "URL"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager newsUserInfoLock](self, "newsUserInfoLock"));
            v80[0] = _NSConcreteStackBlock;
            v80[1] = 3221225472;
            v80[2] = sub_100046848;
            v80[3] = &unk_1000D97A8;
            v80[4] = self;
            v81 = v16;
            objc_msgSend(v36, "performWithLockSync:", v80);

            v37 = -[FRAnalyticsReferral initWithAppSessionStartFromNotificationType:]([FRAnalyticsReferral alloc], "initWithAppSessionStartFromNotificationType:", 3);
            -[FRNotificationManager _notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:](self, "_notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:", v37);
            v87 = UIApplicationOpenURLOptionUniversalLinksOnly;
            v88 = &__kCFBooleanFalse;
            v38 = v28;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager urlRouterManager](self, "urlRouterManager"));
            objc_msgSend(v40, "handleOpenURL:options:analyticsReferral:", v35, v39, v37);

            v28 = v38;
            v41 = (void *)v32;

          }
          else
          {
            v61 = FCPushNotificationsLog;
            if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "Received issue notification response for more than 1 issue", buf, 2u);
            }
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL nss_NewsURLForMyMagazines](NSURL, "nss_NewsURLForMyMagazines"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v41, 0));
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("notificationID=%@"), v72));
            objc_msgSend(v62, "setQuery:", v63);

            v68 = v62;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "URL"));
            v35 = -[FRAnalyticsReferral initWithAppSessionStartFromNotificationType:]([FRAnalyticsReferral alloc], "initWithAppSessionStartFromNotificationType:", 3);
            -[FRNotificationManager _notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:](self, "_notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:", v35);
            v85 = UIApplicationOpenURLOptionUniversalLinksOnly;
            v86 = &__kCFBooleanFalse;
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1));
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager newsUserInfoLock](self, "newsUserInfoLock"));
            v78[0] = _NSConcreteStackBlock;
            v78[1] = 3221225472;
            v78[2] = sub_100046888;
            v78[3] = &unk_1000D97A8;
            v78[4] = self;
            v79 = v16;
            objc_msgSend(v65, "performWithLockSync:", v78);

            v66 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager urlRouterManager](self, "urlRouterManager"));
            objc_msgSend(v66, "handleOpenURL:options:analyticsReferral:", v33, v64, v35);

          }
          v12 = v72;
        }

        v9 = v71;
      }
      else
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notification"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "request"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "content"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "categoryIdentifier"));
        v46 = objc_msgSend(v45, "isEqualToString:", FCNotificationURLCategory);

        if (v46)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", FCNotificationPayloadNewsKey));
          v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", FCNotificationPayloadUrlKey));
          v49 = FCPushNotificationsLog;
          if (os_log_type_enabled(FCPushNotificationsLog, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v48;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Received notification with url: %@ ", buf, 0xCu);
          }
          v69 = (void *)v48;
          v50 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v48));
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager newsUserInfoLock](self, "newsUserInfoLock"));
          v76[0] = _NSConcreteStackBlock;
          v76[1] = 3221225472;
          v76[2] = sub_1000468C8;
          v76[3] = &unk_1000D97A8;
          v76[4] = self;
          v77 = v16;
          objc_msgSend(v51, "performWithLockSync:", v76);

          v52 = v47;
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", FCNotificationPayloadNotificationIDKey));
          v67 = (void *)v50;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v50, 0));
          if (v53)
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("notificationID=%@"), v53));
            objc_msgSend(v54, "setQuery:", v55);

          }
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "URL"));
          v57 = -[FRAnalyticsReferral initWithAppSessionStartFromNotificationType:]([FRAnalyticsReferral alloc], "initWithAppSessionStartFromNotificationType:", 2);
          -[FRNotificationManager _notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:](self, "_notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:", v57);
          v83 = UIApplicationOpenURLOptionUniversalLinksOnly;
          v84 = &__kCFBooleanFalse;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager urlRouterManager](self, "urlRouterManager"));
          objc_msgSend(v59, "handleOpenURL:options:analyticsReferral:", v56, v58, v57);

          v9 = v71;
        }
        else
        {
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager bootstrapper](self, "bootstrapper"));
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_100046908;
          v73[3] = &unk_1000DC0B0;
          v73[4] = self;
          v9 = v71;
          v74 = v71;
          v75 = v16;
          objc_msgSend(v60, "afterBootstrapOnQueue:runBootstrapCallbackBlock:", &_dispatch_main_q, v73);

        }
        v12 = v72;
      }
      v20 = v70;
    }
  }
  v8[2](v8);

}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  -[FRNotificationManager _openUserNotificationSettings](self, "_openUserNotificationSettings", a3, a4);
}

- (void)_openUserNotificationSettings
{
  void *v2;
  void *v3;
  void *v4;
  FRAnalyticsReferral *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager userResponseHandler](self, "userResponseHandler"));
  objc_msgSend(v2, "navigateToNotificationSettings");

  v5 = -[FRAnalyticsReferral initWithAppSessionStartMethod:]([FRAnalyticsReferral alloc], "initWithAppSessionStartMethod:", 15);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FRAppDelegate sharedDelegate](FRAppDelegate, "sharedDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityMonitor"));
  objc_msgSend(v4, "setAppSessionStartReferral:", v5);

}

- (void)scheduleLocalNotificationForArticleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  FRNotificationManager *v19;
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager feldsparContext](self, "feldsparContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cloudContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "articleController"));
  v21 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headlinesFetchOperationForArticleIDs:", v11));

  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100046AFC;
  v18 = &unk_1000DC190;
  v19 = self;
  v20 = v6;
  v13 = v6;
  objc_msgSend(v12, "setFetchCompletionBlock:", &v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue", v15, v16, v17, v18, v19));
  objc_msgSend(v14, "addOperation:", v12);

}

- (void)_notifiyObserversOfHandledNotificationResponseWithAnalyticsReferral:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRNotificationManager observers](self, "observers", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v10, "notificationManagerDidHandleNotificationResponse:withAnalyticsReferral:") & 1) != 0)objc_msgSend(v10, "notificationManagerDidHandleNotificationResponse:withAnalyticsReferral:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_notificationAttachmentsWithThumbnailFileURL:(id)a3 publisherLogoFileURL:(id)a4 publisherLogoCompactFileURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v11));

    v13 = 0.0;
    if (v12)
    {
      objc_msgSend(v12, "size");
      v15 = v14;
      objc_msgSend(v12, "size");
      v17 = v16;
      objc_msgSend(v12, "size");
      v44 = v18;
      v20 = v19;
      objc_msgSend(v12, "size");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v12, "size");
      v26 = v25;
      v28 = v27;
      objc_msgSend(v12, "size");
      if (v15 <= v17)
      {
        v13 = (v20 - v22) / v28;
        v34 = 1.0;
        v33 = 1.0 - (v20 - v22 + v20 - v22) / v30;
        v32 = 0.0;
      }
      else
      {
        v31 = v29;
        v32 = (v44 - v24) / v26;
        v33 = 1.0;
        v34 = 1.0 - (v44 - v24 + v44 - v24) / v31;
      }
    }
    else
    {
      v34 = 1.0;
      v32 = 0.0;
      v33 = 1.0;
    }
    v52[0] = UNNotificationAttachmentOptionsThumbnailClippingRectKey;
    v35 = v13;
    v52[1] = UNNotificationAttachmentOptionsTypeHintKey;
    v53[0] = CGRectCreateDictionaryRepresentation(*(CGRect *)&v32);
    v53[1] = kUTTypeJPEG;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 2));
    v47 = 0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAttachment attachmentWithIdentifier:URL:options:error:](UNNotificationAttachment, "attachmentWithIdentifier:URL:options:error:", NSSNotificationAttachmentThumbnailKey, v7, v36, &v47));
    if (v37)
      objc_msgSend(v10, "addObject:", v37);

  }
  if (v8)
  {
    v50[0] = UNNotificationAttachmentOptionsTypeHintKey;
    v50[1] = UNNotificationAttachmentOptionsThumbnailHiddenKey;
    v51[0] = kUTTypePNG;
    v51[1] = &__kCFBooleanTrue;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 2));
    v46 = 0;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAttachment attachmentWithIdentifier:URL:options:error:](UNNotificationAttachment, "attachmentWithIdentifier:URL:options:error:", NSSNotificationAttachmentPublisherLogoKey, v8, v38, &v46));
    if (v39)
      objc_msgSend(v10, "addObject:", v39);

  }
  if (v9)
  {
    v48[0] = UNNotificationAttachmentOptionsTypeHintKey;
    v48[1] = UNNotificationAttachmentOptionsThumbnailHiddenKey;
    v49[0] = kUTTypePNG;
    v49[1] = &__kCFBooleanTrue;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 2));
    v45 = 0;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationAttachment attachmentWithIdentifier:URL:options:error:](UNNotificationAttachment, "attachmentWithIdentifier:URL:options:error:", NSSNotificationAttachmentPublisherLogoCompactKey, v9, v40, &v45));
    if (v41)
      objc_msgSend(v10, "addObject:", v41);

  }
  v42 = objc_msgSend(v10, "copy");

  return v42;
}

- (void)_scheduleLocalNotificationWithIdentifier:(id)a3 title:(id)a4 body:(id)a5 userInfo:(id)a6 category:(id)a7 timeInterval:(double)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v22 = objc_alloc_init((Class)UNMutableNotificationContent);
  objc_msgSend(v22, "setTitle:", v16);

  objc_msgSend(v22, "setBody:", v15);
  objc_msgSend(v22, "setUserInfo:", v14);

  objc_msgSend(v22, "setCategoryIdentifier:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:repeats:](UNTimeIntervalNotificationTrigger, "triggerWithTimeInterval:repeats:", 0, a8));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:](UNNotificationRequest, "requestWithIdentifier:content:trigger:", v17, v22, v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v20, "removeAllPendingNotificationRequests");

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v21, "addNotificationRequest:withCompletionHandler:", v19, &stru_1000DC1B0);

}

- (int64_t)subscribeNotificationPromptForTagID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  int64_t v7;

  v4 = a3;
  if (-[FRNotificationManager systemNotificationEnabled](self, "systemNotificationEnabled")
    && -[FRNotificationManager notificationUIEnabled](self, "notificationUIEnabled")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext")),
        v6 = objc_msgSend(v5, "isRunningPPT"),
        v5,
        (v6 & 1) == 0))
  {
    if (-[FRNotificationManager isTagIDWhitelistedForNotifications:](self, "isTagIDWhitelistedForNotifications:", v4))
      v7 = 2;
    else
      v7 = -[FRNotificationManager canShowNotificationAlert](self, "canShowNotificationAlert");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)notificationPrompt
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  v3 = objc_msgSend(v2, "isRunningPPT");

  if ((v3 & 1) != 0)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("initial_notification_prompt_shown"));

  if ((v5 & 1) != 0)
    return 0;
  sub_100047FCC();
  return 1;
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (FRUserNotificationResponseHandlerType)userResponseHandler
{
  return self->_userResponseHandler;
}

- (_TtC5TeaUI12Bootstrapper)bootstrapper
{
  return self->_bootstrapper;
}

- (FRURLRouterManagerType)urlRouterManager
{
  return self->_urlRouterManager;
}

- (BOOL)systemNotificationEnabled
{
  return self->_systemNotificationEnabled;
}

- (void)setSystemNotificationEnabled:(BOOL)a3
{
  self->_systemNotificationEnabled = a3;
}

- (TSNotificationSettings)notificationSettings
{
  return self->_notificationSettings;
}

- (void)setNotificationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_notificationSettings, a3);
}

- (BOOL)notificationUIEnabled
{
  return self->_notificationUIEnabled;
}

- (void)setNotificationUIEnabled:(BOOL)a3
{
  self->_notificationUIEnabled = a3;
}

- (BOOL)isHandlingArticleNotification
{
  return self->_isHandlingArticleNotification;
}

- (void)setIsHandlingArticleNotification:(BOOL)a3
{
  self->_isHandlingArticleNotification = a3;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void)setAppConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_appConfigurationManager, a3);
}

- (FCNotificationsConfiguration)notificationsConfiguration
{
  return self->_notificationsConfiguration;
}

- (void)setNotificationsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsConfiguration, a3);
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (void)setAutoEnableNotificationsIsPending:(BOOL)a3
{
  self->_autoEnableNotificationsIsPending = a3;
}

- (FRNotificationAutoEnableHelper)notificationAutoEnableHelper
{
  return self->_notificationAutoEnableHelper;
}

- (void)setNotificationAutoEnableHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationAutoEnableHelper, a3);
}

- (NSDictionary)newsUserInfo
{
  return self->_newsUserInfo;
}

- (void)setNewsUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_newsUserInfo, a3);
}

- (NFMutexLock)newsUserInfoLock
{
  return self->_newsUserInfoLock;
}

- (void)setNewsUserInfoLock:(id)a3
{
  objc_storeStrong((id *)&self->_newsUserInfoLock, a3);
}

- (FCAMSPushHandler)amsPushHandler
{
  return self->_amsPushHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsPushHandler, 0);
  objc_storeStrong((id *)&self->_newsUserInfoLock, 0);
  objc_storeStrong((id *)&self->_newsUserInfo, 0);
  objc_storeStrong((id *)&self->_notificationAutoEnableHelper, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_notificationsConfiguration, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationSettings, 0);
  objc_storeStrong((id *)&self->_urlRouterManager, 0);
  objc_storeStrong((id *)&self->_bootstrapper, 0);
  objc_storeStrong((id *)&self->_userResponseHandler, 0);
  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end
