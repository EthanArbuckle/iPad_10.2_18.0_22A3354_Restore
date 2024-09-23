@implementation MTAppDelegate_iOS

- (id)_platformContentController
{
  _TtC8Podcasts25PlatformContentController *platformContentController;
  _TtC8Podcasts25PlatformContentController *v4;
  _TtC8Podcasts25PlatformContentController *v5;

  platformContentController = self->_platformContentController;
  if (!platformContentController)
  {
    v4 = objc_alloc_init(_TtC8Podcasts25PlatformContentController);
    v5 = self->_platformContentController;
    self->_platformContentController = v4;

    platformContentController = self->_platformContentController;
  }
  return platformContentController;
}

- (void)_prewarmSingletons
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;

  global_queue = dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v3, &stru_1004AB448);

}

- (UIViewController)rootViewController
{
  void *v2;
  void *v3;
  UIViewController *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS internalAppDelegate](self, "internalAppDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));

  if (!v4)
    v4 = objc_opt_new(UIViewController);
  return v4;
}

- (void)applicationWillEnterForeground:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  unsigned int v10;

  v4 = a3;
  v5 = _MTLogCategoryLifecycle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    *(_DWORD *)buf = 67109120;
    v10 = objc_msgSend(v7, "isReachable");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received applicationWillEnterForeground, isNetworkReachable: %hhd", buf, 8u);

  }
  v8.receiver = self;
  v8.super_class = (Class)MTAppDelegate_iOS;
  -[MTAppDelegate_Shared applicationWillEnterForeground:](&v8, "applicationWillEnterForeground:", v4);

}

- (void)setupAfterBecomingActive
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  _QWORD block[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTAppDelegate_iOS;
  -[MTAppDelegate_Shared setupAfterBecomingActive](&v10, "setupAfterBecomingActive");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageDownloader sharedInstance](MTImageDownloader, "sharedInstance"));
  objc_msgSend(v3, "cleanupTemporaryResourcesDirectoryIfNecessary");

  if ((os_feature_enabled_bluemoon() & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
    objc_msgSend(v4, "restorePlayerManifestWithCompletion:", 0);

  }
  v5 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001055D8;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTNotificationManager sharedInstance](MTNotificationManager, "sharedInstance"));
  v7 = objc_msgSend(v6, "autoSimulateNotificationOnAppActivate");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTNotificationManager sharedInstance](MTNotificationManager, "sharedInstance"));
    objc_msgSend(v8, "simulateAnyTestNotification");

  }
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  BOOL v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  unsigned int v21;

  v6 = a3;
  v7 = a4;
  v8 = _MTLogCategoryLifecycle();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    v20 = 1024;
    v21 = objc_msgSend(v10, "isReachable");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received didFinishLaunchingWithOptions: %{public}@, isNetworkReachable: %hhd", buf, 0x12u);

  }
  v17.receiver = self;
  v17.super_class = (Class)MTAppDelegate_iOS;
  -[MTAppDelegate_Shared application:didFinishLaunchingWithOptions:](&v17, "application:didFinishLaunchingWithOptions:", v6, v7);
  +[MTRestrictionsLaunchUtil presentExplicitRestrictionLaunchAlertIfNeeded](MTRestrictionsLaunchUtil, "presentExplicitRestrictionLaunchAlertIfNeeded");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v12 = objc_msgSend(v11, "isMultiUser");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    objc_msgSend(v13, "registerUserSwitchStakeHolder:", self);

  }
  v14 = -[AppDelegate application:didFinishLaunchingWithOptions:](self->_internalAppDelegate, "application:didFinishLaunchingWithOptions:", v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", UIApplicationLaunchOptionsShortcutItemKey));
  if (v15)
  {
    -[MTAppDelegate_iOS performActionForShortcutItem:completionHandler:](self, "performActionForShortcutItem:completionHandler:", v15, 0);
    v14 = 0;
  }

  return v14;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  BOOL v15;
  objc_super v16;
  uint8_t buf[4];
  unsigned int v18;

  v4 = a3;
  v5 = _MTLogCategoryLifecycle();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    *(_DWORD *)buf = 67109120;
    v18 = objc_msgSend(v7, "isReachable");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received applicationDidBecomeActive, isNetworkReachable: %hhd", buf, 8u);

  }
  v16.receiver = self;
  v16.super_class = (Class)MTAppDelegate_iOS;
  -[MTAppDelegate_Shared applicationDidBecomeActive:](&v16, "applicationDidBecomeActive:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS _platformContentController](self, "_platformContentController"));
  if (-[MTAppDelegate_iOS optionDown](self, "optionDown"))
    v9 = +[MTWelcomeUtil shouldShowWelcome](MTWelcomeUtil, "shouldShowWelcome") ^ 1;
  else
    v9 = 0;
  if ((objc_msgSend(v8, "isMigrationPossible") & 1) != 0 || (_DWORD)v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainQueueContext"));
    v10 = objc_msgSend(v12, "countOfPodcasts") == 0;

  }
  else
  {
    v10 = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100048230;
  v14[3] = &unk_1004A65F0;
  v15 = v10;
  v14[4] = self;
  objc_msgSend(v8, "performMigrationIfNecessaryWithOptionKeyDown::", v9, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS libraryDataProvider](self, "libraryDataProvider"));
  objc_msgSend(v13, "startObservingLibraryIfNeeded");

  -[AppDelegate applicationDidBecomeActive:](self->_internalAppDelegate, "applicationDidBecomeActive:", v4);
}

- (id)createWindowWithScene:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "registerDefaults:", &off_1004D7600);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AppDelegate createWindowWithScene:](_TtC8Podcasts11AppDelegate, "createWindowWithScene:", v3));
  return v5;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  MTPlayerController_iOS *v12;
  void *v13;
  _TtC8Podcasts11AppDelegate *v14;
  _TtC8Podcasts11AppDelegate *v15;
  _TtC8Podcasts11AppDelegate *internalAppDelegate;
  BOOL v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  unsigned int v24;

  v6 = a4;
  v7 = a3;
  v8 = _MTLogCategoryLifecycle(-[MTAppDelegate_iOS _prewarmSingletons](self, "_prewarmSingletons"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    *(_DWORD *)buf = 138543618;
    v22 = v6;
    v23 = 1024;
    v24 = objc_msgSend(v10, "isReachable");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received willFinishLaunchingWithOptions: %{public}@, isNetworkReachable: %hhd", buf, 0x12u);

  }
  if ((os_feature_enabled_bluemoon(v11) & 1) == 0)
  {
    v12 = objc_opt_new(MTPlayerController_iOS);
    +[MTPlayerController setDefaultInstance:](MTPlayerController, "setDefaultInstance:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[AccessAppDelegate shared](_TtC8Podcasts17AccessAppDelegate, "shared"));

  if (!v13)
  {
    v14 = objc_alloc_init(_TtC8Podcasts11AppDelegate);
    +[AccessAppDelegate setShared:](_TtC8Podcasts17AccessAppDelegate, "setShared:", v14);

  }
  v15 = (_TtC8Podcasts11AppDelegate *)objc_claimAutoreleasedReturnValue(+[AccessAppDelegate shared](_TtC8Podcasts17AccessAppDelegate, "shared"));
  internalAppDelegate = self->_internalAppDelegate;
  self->_internalAppDelegate = v15;

  v20.receiver = self;
  v20.super_class = (Class)MTAppDelegate_iOS;
  -[MTAppDelegate_Shared application:willFinishLaunchingWithOptions:](&v20, "application:willFinishLaunchingWithOptions:", v7, v6);
  v17 = -[AppDelegate application:willFinishLaunchingWithOptions:](self->_internalAppDelegate, "application:willFinishLaunchingWithOptions:", v7, v6);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AppDelegate libraryDataProvider](self->_internalAppDelegate, "libraryDataProvider"));
  -[MTAppDelegate_iOS setLibraryDataProvider:](self, "setLibraryDataProvider:", v18);

  return v17;
}

- (_TtC8Podcasts19LibraryDataProvider)libraryDataProvider
{
  return self->_libraryDataProvider;
}

- (void)willConnectScene
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS internalAppDelegate](self, "internalAppDelegate"));
  v4 = objc_opt_class(_TtC8Podcasts11AppDelegate);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS internalAppDelegate](self, "internalAppDelegate"));
    objc_msgSend(v6, "willConnectScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AccessAppDelegate shared](_TtC8Podcasts17AccessAppDelegate, "shared"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PlatformAppController appControllerWithDelegate:](_TtC8Podcasts21PlatformAppController, "appControllerWithDelegate:", v7));
    -[MTAppDelegate_Shared setAppController:](self, "setAppController:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS _platformContentController](self, "_platformContentController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared appController](self, "appController"));
    objc_msgSend(v9, "setMigrationPresenter:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS rootViewController](self, "rootViewController"));
    objc_msgSend(v11, "becomeFirstResponder");

    v13 = _MTLogCategoryLifecycle(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Will kick off downloads restoration, if needed.", v16, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS libraryDataProvider](self, "libraryDataProvider"));
    objc_msgSend(v15, "restorePreviouslyDownloadedEpisodes");

  }
}

- (_TtC8Podcasts11AppDelegate)internalAppDelegate
{
  return self->_internalAppDelegate;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "supportedInterfaceOrientationsForWindow:", v4);

  return (unint64_t)v6;
}

- (void)setLibraryDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_libraryDataProvider, a3);
}

- (BOOL)optionDown
{
  return self->_optionDown;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS internalAppDelegate](self, "internalAppDelegate"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS internalAppDelegate](self, "internalAppDelegate"));
    v13 = objc_msgSend(v12, "application:runTest:options:", v8, v9, v10);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _MTLogCategoryLifecycle(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received handleEventsForBackgroundURLSession, identifier %{public}@", buf, 0xCu);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS libraryDataProvider](self, "libraryDataProvider"));
  v14 = objc_msgSend(v13, "handleEventsForBackgroundURLSessionWithIdentifier:handler:", v9, v10);

  if ((v14 & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)MTAppDelegate_iOS;
    -[MTAppDelegate_Shared application:handleEventsForBackgroundURLSession:completionHandler:](&v15, "application:handleEventsForBackgroundURLSession:completionHandler:", v8, v9, v10);
  }

}

- (void)applicationWillTerminate:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  unsigned int v10;

  v4 = a3;
  v5 = _MTLogCategoryLifecycle(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    *(_DWORD *)buf = 67109120;
    v10 = objc_msgSend(v7, "isReachable");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received applicationWillTerminate, isNetworkReachable: %hhd", buf, 8u);

  }
  -[AppDelegate applicationWillTerminate:](self->_internalAppDelegate, "applicationWillTerminate:", v4);
  v8.receiver = self;
  v8.super_class = (Class)MTAppDelegate_iOS;
  -[MTAppDelegate_Shared applicationWillTerminate:](&v8, "applicationWillTerminate:", v4);

}

- (void)switchToLibraryIfNowHasContent
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mainQueueContext"));

  if (objc_msgSend(v5, "countOfPodcasts"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared appController](self, "appController"));
    objc_msgSend(v4, "selectMyPodcastsTab");

  }
}

- (void)applicationWillResignActive:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  unsigned int v11;

  v4 = a3;
  v5 = _MTLogCategoryLifecycle(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    *(_DWORD *)buf = 67109120;
    v11 = objc_msgSend(v7, "isReachable");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received applicationWillResignActive, isNetworkReachable: %hhd", buf, 8u);

  }
  v9.receiver = self;
  v9.super_class = (Class)MTAppDelegate_iOS;
  -[MTAppDelegate_Shared applicationWillResignActive:](&v9, "applicationWillResignActive:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTNotificationManager sharedInstance](MTNotificationManager, "sharedInstance"));
  objc_msgSend(v8, "processNotificationsWithReason:", CFSTR("Application Resign"));

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  unsigned int v13;

  v4 = a3;
  v5 = _MTLogCategoryLifecycle(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    *(_DWORD *)buf = 67109120;
    v13 = objc_msgSend(v7, "isReachable");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received applicationDidEnterBackground, isNetworkReachable: %hhd", buf, 8u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryUpdater sharedInstance](MTMediaLibraryUpdater, "sharedInstance"));
  objc_msgSend(v8, "stopObservingMediaLibrary");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTNMSDefaultsUpdater sharedInstance](MTNMSDefaultsUpdater, "sharedInstance"));
  objc_msgSend(v9, "stopObservingDownloadedPodcastsChanges");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTAppShortcutManager sharedInstance](MTAppShortcutManager, "sharedInstance"));
  objc_msgSend(v10, "updateShortcutItems");

  -[AppDelegate applicationDidEnterBackground:](self->_internalAppDelegate, "applicationDidEnterBackground:", v4);
  v11.receiver = self;
  v11.super_class = (Class)MTAppDelegate_iOS;
  -[MTAppDelegate_Shared applicationDidEnterBackground:](&v11, "applicationDidEnterBackground:", v4);

}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _TtC8Podcasts11AppDelegate *internalAppDelegate;
  BOOL v15;
  objc_super v17;
  uint8_t buf[4];
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _MTLogCategoryLifecycle(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
    *(_DWORD *)buf = 138412290;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received openURL: url: %@", buf, 0xCu);

  }
  internalAppDelegate = self->_internalAppDelegate;
  if (internalAppDelegate
    && -[AppDelegate application:openURL:options:](internalAppDelegate, "application:openURL:options:", v8, v9, v10))
  {
    v15 = 1;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MTAppDelegate_iOS;
    v15 = -[MTAppDelegate_Shared application:openURL:options:](&v17, "application:openURL:options:", v8, v9, v10);
  }

  return v15;
}

- (void)setupAfterBecomingFrontmost
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
  objc_msgSend(v2, "syncEverything");

}

- (void)setupAfterResigningFrontmost
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
  objc_msgSend(v2, "syncEverything");

}

- (void)willSwitchUser
{
  void *v2;
  unsigned int v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v3 = objc_msgSend(v2, "isPlayingLocally");

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
    objc_msgSend(v4, "pauseLocalPlayerWithInitiator:", 2);

  }
}

- (BOOL)canOpenURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MTURLPresentationController *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS rootViewController](self, "rootViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mt_topViewController"));

  v7 = -[MTURLPresentationController initWithURL:]([MTURLPresentationController alloc], "initWithURL:", v4);
  LOBYTE(v4) = -[MTURLPresentationController canShowWithPresentingViewController:](v7, "canShowWithPresentingViewController:", v6);

  return (char)v4;
}

- (void)openURL:(id)a3
{
  id v4;
  void *v5;
  MTURLPresentationController *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS rootViewController](self, "rootViewController"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mt_topViewController"));

  v6 = -[MTURLPresentationController initWithURL:]([MTURLPresentationController alloc], "initWithURL:", v4);
  -[MTURLPresentationController showWithPresentingViewController:](v6, "showWithPresentingViewController:", v7);

}

- (void)application:(id)a3 handleStateRestorationWith:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS internalAppDelegate](self, "internalAppDelegate"));
  v8 = objc_opt_class(_TtC8Podcasts11AppDelegate);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_iOS internalAppDelegate](self, "internalAppDelegate"));
    objc_msgSend(v10, "application:openStateRestorationActivity:", v11, v6);

  }
}

- (void)startLibraryUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared updateQueue](self, "updateQueue"));
  objc_msgSend(v3, "cancelAllOperations");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTMediaLibraryUpdater sharedInstance](MTMediaLibraryUpdater, "sharedInstance"));
  objc_msgSend(v4, "startObservingMediaLibrary");

  v6 = _MTLogCategoryMediaLibrary(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "library updater scheduled", buf, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared updateQueue](self, "updateQueue"));
  objc_msgSend(v8, "addOperationWithBlock:", &stru_1004AB490);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared updateQueue](self, "updateQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100105A44;
  v10[3] = &unk_1004A6200;
  v10[4] = self;
  objc_msgSend(v9, "addOperationWithBlock:", v10);

}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a5;
  v8 = a4;
  v9 = _MTLogCategoryLifecycle(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received performActionForShortcutItem", v11, 2u);
  }

  -[MTAppDelegate_iOS performActionForShortcutItem:completionHandler:](self, "performActionForShortcutItem:completionHandler:", v8, v7);
}

- (void)performActionForShortcutItem:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTAppShortcutManager sharedInstance](MTAppShortcutManager, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100105BC0;
  v9[3] = &unk_1004A66E0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "performActionForShortcutItem:completionHandler:", v6, v9);

}

- (id)application:(id)a3 handlerForIntent:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  IntentHandler *v8;

  v4 = a4;
  v6 = objc_opt_class(INPlayMediaIntent, v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
    v8 = objc_opt_new(IntentHandler);
  else
    v8 = 0;
  return v8;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MTAppDelegate_iOS;
  if (-[MTAppDelegate_Shared application:continueUserActivity:restorationHandler:](&v13, "application:continueUserActivity:restorationHandler:", v8, v9, v10))
  {
    v11 = -[AppDelegate application:continueUserActivity:restorationHandler:](self->_internalAppDelegate, "application:continueUserActivity:restorationHandler:", v8, v9, v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setInternalAppDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_internalAppDelegate, a3);
}

- (UIResponder)commandController
{
  return self->_commandController;
}

- (void)setCommandController:(id)a3
{
  objc_storeStrong((id *)&self->_commandController, a3);
}

- (void)setOptionDown:(BOOL)a3
{
  self->_optionDown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryDataProvider, 0);
  objc_storeStrong((id *)&self->_commandController, 0);
  objc_storeStrong((id *)&self->_internalAppDelegate, 0);
  objc_storeStrong((id *)&self->_migrationScreen, 0);
  objc_storeStrong((id *)&self->_platformContentController, 0);
}

@end
