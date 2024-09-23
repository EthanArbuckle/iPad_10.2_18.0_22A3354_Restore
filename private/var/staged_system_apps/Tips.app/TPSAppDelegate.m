@implementation TPSAppDelegate

- (void)applicationDidBecomeActive:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController", a3));
  objc_msgSend(v3, "applicationDidBecomeActive");

}

- (void)resetCacheDefaults
{
  void *v2;
  id v3;

  +[TPSDataCacheController removeAllDataCache](TPSDataCacheController, "removeAllDataCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TPSJSONCacheController sharedInstance](TPSJSONCacheController, "sharedInstance"));
  objc_msgSend(v2, "removeAllDataCache");

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TPSAssetCacheController sharedInstance](TPSAssetCacheController, "sharedInstance"));
  objc_msgSend(v3, "removeAllDataCache");

}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  id v23;
  TPSMainViewController *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance", a3, a4));
  objc_msgSend(v5, "setCategory:error:", AVAudioSessionCategoryAmbient, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v6, "registerDefaults:", &off_1000A5DC0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "infoDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v8, "objectForKey:", CFSTR("CFBundleShortVersionString")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("TipsAppLastLaunchedAppVersion")));
  LOBYTE(v8) = objc_msgSend(v9, "isEqualToString:", v10);

  if ((v8 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSJSONCacheController sharedInstance](TPSJSONCacheController, "sharedInstance"));
    objc_msgSend(v11, "removeAllDataCache");

    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSJSONCacheIdentifier"));
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("TipsAppLastLaunchedAppVersion"));
    objc_msgSend(v6, "synchronize");
  }
  v12 = (void *)MGCopyAnswer(CFSTR("ProductVersion"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsSeparatedByString:", CFSTR(".")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("kTipsAppLastLaunchedMajorVersion")));
  v16 = +[TPSCommonDefines hardwareChanged](TPSCommonDefines, "hardwareChanged");
  if ((objc_msgSend(v14, "isEqualToString:", v15) & 1) == 0)
  {
    objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("kTipsAppLastLaunchedMajorVersion"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSAppLastDisplayedContent"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSLastViewedTipIdentifier"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSPreviousFeaturedTipIdentifier"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSFeedLastModified"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSLikedTipsList"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSIntroShown"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSLikeDictionaryKey"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("validPairedDevices"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSLastVisibleTipsIDs"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSLastViewedContentGroup"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSImageCacheIdentifier"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSVideoCacheIdentifier"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSVisibilityForIdMap"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSVisibleTimestampForIDMap"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSTargetingVisibleTimestampForIDMap"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("TPSJSONCacheIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched firstLaunchEvent](TPSAnalyticsEventAppLaunched, "firstLaunchEvent"));
    objc_msgSend(v18, "log");

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsChecklistSessionController sharedInstance](TPSAnalyticsChecklistSessionController, "sharedInstance"));
    objc_msgSend(v19, "setIsFirstLaunch:", 1);

    if ((v16 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsChecklistSessionController sharedInstance](TPSAnalyticsChecklistSessionController, "sharedInstance"));
    objc_msgSend(v17, "setIsFirstLaunch:", 0);

LABEL_7:
    -[TPSAppDelegate resetCacheDefaults](self, "resetCacheDefaults");
    goto LABEL_8;
  }
  if (+[TPSDefaultsManager resetDataCache](TPSDefaultsManager, "resetDataCache"))
    goto LABEL_7;
LABEL_8:
  objc_msgSend(v6, "synchronize");
  v20 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    sub_10006CA00();

  -[TPSAppDelegate clearBadgeCount](self, "clearBadgeCount");
  v21 = objc_alloc((Class)UIWindow);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v22, "bounds");
  v23 = objc_msgSend(v21, "initWithFrame:");
  -[TPSAppDelegate setWindow:](self, "setWindow:", v23);

  v24 = objc_alloc_init(TPSMainViewController);
  -[TPSAppDelegate setMainViewController:](self, "setMainViewController:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate window](self, "window"));
  objc_msgSend(v26, "setRootViewController:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate window](self, "window"));
  objc_msgSend(v27, "makeKeyAndVisible");

  return 1;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void)setMainViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mainViewController, a3);
}

- (TPSMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)clearBadgeCount
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
  objc_msgSend(v2, "setBadgeCount:withCompletionHandler:", 0, 0);

}

- (TPSUIAppController)appController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appController"));

  return (TPSUIAppController *)v3;
}

- (TipListViewController)tipListViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tipListViewController"));

  return (TipListViewController *)v3;
}

- (CollectionListViewController)collectionListViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionListViewController"));

  return (CollectionListViewController *)v3;
}

- (TPSTipsByCollectionViewController)tipsByCollectionViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tipsByCollectionViewController"));

  return (TPSTipsByCollectionViewController *)v3;
}

- (void)displayCollectionID:(id)a3 tipID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v8, "displayCollectionID:tipID:", v7, v6);

}

- (void)showTipsView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v2, "showTipsView");

}

- (void)showCollectionsView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v2, "showCollectionsView");

}

- (void)showTOCView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v2, "showTOCView");

}

- (BOOL)isCollectionsViewVisible
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  v3 = objc_msgSend(v2, "isCollectionsViewVisible");

  return v3;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v6;
  void *v7;
  unsigned __int8 v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  v8 = objc_msgSend(v7, "handleUserActivity:", v6);

  return v8;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  v10 = objc_msgSend(v9, "openURL:options:", v8, v7);

  return v10;
}

- (void)applicationWillTerminate:(id)a3
{
  NSObject *v4;
  void *v5;

  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006CA2C();

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v5, "applicationWillTerminate");

}

- (void)applicationWillEnterForeground:(id)a3
{
  NSObject *v4;
  void *v5;

  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006CA58();

  -[TPSAppDelegate clearBadgeCount](self, "clearBadgeCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v5, "applicationWillEnterForeground");

}

- (void)applicationDidEnterBackground:(id)a3
{
  NSObject *v4;
  void *v5;

  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006CA84();

  -[TPSAppDelegate clearBadgeCount](self, "clearBadgeCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v5, "applicationDidEnterBackground");

}

- (void)handleTipsURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TPSAppDelegate mainViewController](self, "mainViewController"));
  objc_msgSend(v5, "handleTipsURL:", v4);

}

- (void)application:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "type"));
  -[TPSAppDelegate handleTipsURL:](self, "handleTipsURL:", v7);

  v8[2](v8, 1);
}

- (void)setTipListViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tipListViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_tipListViewController, 0);
}

@end
