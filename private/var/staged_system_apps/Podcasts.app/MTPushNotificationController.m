@implementation MTPushNotificationController

- (void)registerPushNotifications
{
  MTPushNotificationController *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t v17[16];
  __int16 v18;
  uint8_t v19[2];
  uint8_t buf[16];
  __int16 v21;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (id)-[MTPushNotificationController subscriptionState](v2, "subscriptionState");
  switch((int)v3)
  {
    case 0:
      goto LABEL_13;
    case 1:
      v4 = _MTLogCategoryCloudSync(v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      v18 = 0;
      v6 = "Registering for APNS. Early return";
      v7 = (uint8_t *)&v18;
      goto LABEL_16;
    case 2:
      v8 = _MTLogCategoryCloudSync(v3);
      v5 = objc_claimAutoreleasedReturnValue(v8);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_17;
      v21 = 0;
      v6 = "Registered for APNS. Early return";
      v7 = (uint8_t *)&v21;
      goto LABEL_16;
    case 3:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeAccount"));

      if (v10)
      {
        v12 = _MTLogCategoryCloudSync(v11);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "User is now signed in, re-registering for APNS.", buf, 2u);
        }

        -[MTPushNotificationController unregisterPushNotifications](v2, "unregisterPushNotifications");
LABEL_13:
        -[MTPushNotificationController setSubscriptionState:](v2, "setSubscriptionState:", 1);
        -[MTPushNotificationController _registerPushNotifications](v2, "_registerPushNotifications");
      }
      else
      {
        v16 = _MTLogCategoryCloudSync(v11);
        v5 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          v6 = "Registered for APNS with no account. Early return";
          v7 = v19;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
        }
LABEL_17:

      }
LABEL_18:
      objc_sync_exit(v2);

      return;
    case 4:
      v14 = _MTLogCategoryCloudSync(v3);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to complete APNS unregistration. Reason: interrupted by registration request.", v17, 2u);
      }

      goto LABEL_13;
    default:
      goto LABEL_18;
  }
}

- (void)_registerPushNotifications
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = _MTLogCategoryCloudSync(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering push notification with RemoteNotification", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ACF4;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (MTPushNotificationController)init
{
  MTPushNotificationController *v2;
  MTPushNotificationController *v3;
  void *v4;
  void *v5;
  dispatch_queue_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTPushNotificationController;
  v2 = -[MTPushNotificationController init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[MTPushNotificationController setSubscriptionState:](v2, "setSubscriptionState:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
    -[MTPushNotificationController _setupMarketingPushHandlerWithBag:](v3, "_setupMarketingPushHandlerWithBag:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, "didChangeStoreAccount:", ACDAccountStoreDidChangeNotification, 0);

    v6 = dispatch_queue_create("MTPushNotificationController", 0);
    -[MTPushNotificationController setWorkQueue:](v3, "setWorkQueue:", v6);

  }
  return v3;
}

- (void)_setupMarketingPushHandlerWithBag:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = objc_alloc_init((Class)AMSPushConfiguration);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  objc_msgSend(v7, "setEnabledActionTypes:", v5);

  objc_msgSend(v7, "setUserNotificationExtensionId:", CFSTR("com.apple.podcasts.announcement"));
  v6 = objc_msgSend(objc_alloc((Class)AMSPushHandler), "initWithConfiguration:bag:", v7, v4);

  -[MTPushNotificationController setMarketingPushHandler:](self, "setMarketingPushHandler:", v6);
}

- (void)didRegisterWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeAccount"));

  if (v6)
  {
    objc_initWeak(location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pushNotificationRegistration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPushNotificationController workQueue](self, "workQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000DD984;
    v13[3] = &unk_1004AA440;
    objc_copyWeak(&v15, location);
    v14 = v4;
    objc_msgSend(v9, "asyncValueOnQueue:withCompletion:", v10, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    v11 = _MTLogCategoryCloudSync(v7);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "No account, not proceeding with bookkeeper push registration", (uint8_t *)location, 2u);
    }

    -[MTPushNotificationController setSubscriptionState:](self, "setSubscriptionState:", 3);
  }

}

- (int)subscriptionState
{
  return self->_subscriptionState;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void)setSubscriptionState:(int)a3
{
  self->_subscriptionState = a3;
}

- (void)setMarketingPushHandler:(id)a3
{
  objc_storeStrong((id *)&self->_marketingPushHandler, a3);
}

- (void)unregisterPushNotifications
{
  MTPushNotificationController *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[2];
  __int16 v13;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (id)-[MTPushNotificationController subscriptionState](v2, "subscriptionState");
  switch((int)v3)
  {
    case 0:
      v4 = _MTLogCategoryCloudSync(v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_7;
      v13 = 0;
      v6 = "Unregistered from APNS. Early return";
      v7 = (uint8_t *)&v13;
      goto LABEL_6;
    case 1:
      v9 = _MTLogCategoryCloudSync(v3);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to complete APNS registration. Reason: interrupted by unregistration request.", v11, 2u);
      }

      goto LABEL_11;
    case 2:
    case 3:
LABEL_11:
      -[MTPushNotificationController setSubscriptionState:](v2, "setSubscriptionState:", 4);
      -[MTPushNotificationController _unregisterPushNotifications](v2, "_unregisterPushNotifications");
      break;
    case 4:
      v8 = _MTLogCategoryCloudSync(v3);
      v5 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v6 = "Unregistering from APNS. Early return";
        v7 = buf;
LABEL_6:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
      }
LABEL_7:

      break;
    default:
      break;
  }
  objc_sync_exit(v2);

}

- (void)_unregisterPushNotifications
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DD418;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didChangeStoreAccount:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if (!-[MTPushNotificationController alreadyRegisteredWithActiveDsid](self, "alreadyRegisteredWithActiveDsid"))
  {
    v5 = +[MTAccountController iTunesAccountDidChangeForACAccountNotification:](MTAccountController, "iTunesAccountDidChangeForACAccountNotification:", v4);
    if (v5)
    {
      v6 = _MTLogCategoryCloudSync(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "iTunes account changed. Unregister and attempt to register device token.", v8, 2u);
      }

      -[MTPushNotificationController unregisterPushNotifications](self, "unregisterPushNotifications");
      -[MTPushNotificationController registerPushNotifications](self, "registerPushNotifications");
    }
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTPushNotificationController;
  -[MTPushNotificationController dealloc](&v4, "dealloc");
}

- (BOOL)alreadyRegisteredWithActiveDsid
{
  void *v2;
  void *v3;
  BOOL v4;

  if (-[MTPushNotificationController subscriptionState](self, "subscriptionState") != 2)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeDsid"));
  v4 = v3 != 0;

  return v4;
}

- (void)setKeyValueStoreControllerForUrl:(id)a3
{
  MTPushNotificationController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  MZKeyValueStoreController *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPushNotificationController keyValueStoreController](v4, "keyValueStoreController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultSetURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = -[MZKeyValueStoreController initWithDomain:baseURLForGETAll:baseURLForPUTAll:]([MZKeyValueStoreController alloc], "initWithDomain:baseURLForGETAll:baseURLForPUTAll:", CFSTR("com.apple.podcasts"), v12, v12);
    -[MTPushNotificationController setKeyValueStoreController:](v4, "setKeyValueStoreController:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPushNotificationController keyValueStoreController](v4, "keyValueStoreController"));
    objc_msgSend(v11, "setDelegate:", v4);

  }
  objc_sync_exit(v4);

}

- (void)executeAction:(id)a3 using:(id)a4 andToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MTPushNotificationController *v15;
  void *v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[5];
  _QWORD v20[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MTPushNotificationController setKeyValueStoreControllerForUrl:](self, "setKeyValueStoreControllerForUrl:", v9);
  v20[0] = v8;
  v19[0] = CFSTR("action");
  v19[1] = CFSTR("bundle-id");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
  v20[1] = v12;
  v20[2] = CFSTR("APNS");
  v19[2] = CFSTR("platform");
  v19[3] = CFSTR("domains");
  v18[0] = CFSTR("com.apple.podcasts");
  v18[1] = CFSTR("com.apple.upp");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v20[3] = v13;
  v19[4] = CFSTR("token");
  v20[4] = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 5));

  v15 = self;
  objc_sync_enter(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPushNotificationController keyValueStoreController](v15, "keyValueStoreController"));
  v17 = objc_msgSend(v16, "scheduleApnSubscriptionTransactionWithDictionary:", v14);

  objc_sync_exit(v15);
}

- (void)didFailToRegisterWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  MTPushNotificationController *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = _MTLogCategoryCloudSync(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to complete APNS registration. Reason: %@.", (uint8_t *)&v8, 0xCu);
  }

  v7 = self;
  objc_sync_enter(v7);
  if (-[MTPushNotificationController subscriptionState](v7, "subscriptionState") == 1)
    -[MTPushNotificationController setSubscriptionState:](v7, "setSubscriptionState:", 0);
  objc_sync_exit(v7);

}

+ (BOOL)shouldProcessNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dsid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeDsid"));

  v8 = 0;
  if (v4 && v6)
  {
    v7 = objc_msgSend(v4, "isEqualToNumber:", v6);
    v8 = (int)v7;
  }
  v9 = _MTLogCategoryCloudSync(v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domainVersion"));
    v13 = (void *)v12;
    v16 = 138413314;
    v14 = CFSTR("NO");
    v17 = v4;
    if (v8)
      v14 = CFSTR("YES");
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Push] Received APNS notification for DSID = %@, currentDsid = %@, domain = %@, version = %@, will process = %@", (uint8_t *)&v16, 0x34u);

  }
  return v8;
}

+ (BOOL)shouldSyncSubscriptionsForNotification:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.podcasts"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domainVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcastsDomainVersion"));

    if (v7)
    {
      v10 = objc_msgSend(v7, "isEqualToString:", v9);
      v5 = v10 ^ 1;
    }
    else
    {
      v5 = 1;
    }
    v11 = _MTLogCategoryCloudSync(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
      v14 = CFSTR("SKIP");
      v16 = 138413058;
      v17 = v13;
      if (v5)
        v14 = CFSTR("PROCESS");
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Push] Notification for domain %@, remote version = %@, local version = %@ --> %@", (uint8_t *)&v16, 0x2Au);

    }
  }

  return v5;
}

+ (BOOL)shouldSyncUppForNotification:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.upp"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domainVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));

    v8 = objc_claimAutoreleasedReturnValue(+[MTUniversalPlaybackPositionTransactionContext UPPDomainVersion](MTUniversalPlaybackPositionTransactionContext, "UPPDomainVersion"));
    v9 = (void *)v8;
    if (v7)
    {
      v8 = (uint64_t)objc_msgSend(v7, "isEqualToString:", v8);
      v5 = v8 ^ 1;
    }
    else
    {
      v5 = 1;
    }
    v10 = _MTLogCategoryCloudSync(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
      v13 = CFSTR("SKIP");
      v15 = 138413058;
      v16 = v12;
      if (v5)
        v13 = CFSTR("PROCESS");
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Push] Notification for domain %@, remote version = %@, local version = %@ --> %@", (uint8_t *)&v15, 0x2Au);

    }
  }

  return v5;
}

+ (BOOL)shouldSyncFeedUpdateForNotification:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "type"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("feedupdate"));

  return v4;
}

+ (id)storeIdFromFeedUpdateNotification:(id)a3
{
  return objc_msgSend(a3, "storeId");
}

+ (id)triggeredByFromFeedUpdateNotification:(id)a3
{
  return _objc_msgSend(a3, "triggeredBy");
}

- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  MTPushNotificationController *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  __int16 v18;
  __int16 v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "action"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("REGISTER"));
  if ((_DWORD)v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    if (-[MTPushNotificationController subscriptionState](v10, "subscriptionState") != 1)
    {
      objc_sync_exit(v10);
      goto LABEL_9;
    }
    -[MTPushNotificationController setSubscriptionState:](v10, "setSubscriptionState:", 2);
    objc_sync_exit(v10);

    v12 = _MTLogCategoryCloudSync(v11);
    v10 = (MTPushNotificationController *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
    {
      v19 = 0;
      v13 = "[Push] Registered for APNS.";
      v14 = (uint8_t *)&v19;
      v15 = v10;
      v16 = OS_LOG_TYPE_INFO;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v13, v14, 2u);
    }
  }
  else
  {
    v17 = _MTLogCategoryCloudSync(v9);
    v10 = (MTPushNotificationController *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      v18 = 0;
      v13 = "[Push] Could not find a valid action for APNS registration transaction.";
      v14 = (uint8_t *)&v18;
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  id v10;

  v5 = a5;
  v6 = _MTLogCategoryCloudSync(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[Push] APNS registration transaction failed with error %@. Will retry.", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  MTPushNotificationController *v15;
  uint64_t v16;
  int v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _MTLogCategoryCloudSync(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v17 = 138412290;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[Push] APNS registration transaction was canceled with error %@.", (uint8_t *)&v17, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "action"));
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("REGISTER"));
  if ((_DWORD)v14)
  {
    v15 = self;
    objc_sync_enter(v15);
    if (-[MTPushNotificationController subscriptionState](v15, "subscriptionState") == 1)
      -[MTPushNotificationController setSubscriptionState:](v15, "setSubscriptionState:", 0);
    objc_sync_exit(v15);
  }
  else
  {
    v16 = _MTLogCategoryCloudSync(v14);
    v15 = (MTPushNotificationController *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, "[Push] Could not find a valid action for APNS registration transaction.", (uint8_t *)&v17, 2u);
    }
  }

}

- (BOOL)shouldShowAnnouncementNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPushNotificationController marketingPushHandler](self, "marketingPushHandler"));
  v6 = objc_msgSend(v5, "shouldHandleNotification:", v4);

  return v6;
}

- (void)processAnnouncementNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTPushNotificationController marketingPushHandler](self, "marketingPushHandler"));
  objc_msgSend(v5, "handleNotification:", v4);

}

- (AMSPushHandler)marketingPushHandler
{
  return self->_marketingPushHandler;
}

- (MZKeyValueStoreController)keyValueStoreController
{
  return self->_keyValueStoreController;
}

- (void)setKeyValueStoreController:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueStoreController, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_keyValueStoreController, 0);
  objc_storeStrong((id *)&self->_marketingPushHandler, 0);
}

@end
