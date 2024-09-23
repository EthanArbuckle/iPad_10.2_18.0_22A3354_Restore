@implementation MTAppDelegate_Shared

- (MTAppDelegate_Shared)init
{
  MTAppDelegate_Shared *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accountChangeQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAppDelegate_Shared;
  v2 = -[MTAppDelegate_Shared init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.podcasts.AppDelegateAccountChangeQueue", 0);
    accountChangeQueue = v2->_accountChangeQueue;
    v2->_accountChangeQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)_isApplicationActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "applicationState") == 0;

  return v3;
}

- (void)_validateFairPlayEpisodes
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v4 = objc_msgSend(v3, "fairPlayMigrationRetryCount");

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100048220;
    v5[3] = &unk_1004A6200;
    v5[4] = self;
    -[MTAppDelegate_Shared _validateFairPlayEpisodesWithCompletionHandler:](self, "_validateFairPlayEpisodesWithCompletionHandler:", v5);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004E624;
    v6[3] = &unk_1004A6200;
    v6[4] = self;
    -[MTAppDelegate_Shared _verifyFairPlayMigrationWithCompletionHandler:](self, "_verifyFairPlayMigrationWithCompletionHandler:", v6);
  }
}

- (void)application:(id)a3 didRegisterForRemoteNotificationsWithDeviceToken:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController sharedInstance](MTPushNotificationController, "sharedInstance"));
  objc_msgSend(v5, "didRegisterWithToken:", v4);

}

- (MTSiriPlistDumper)siriDumper
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009DCC;
  block[3] = &unk_1004A6200;
  block[4] = self;
  if (qword_100567268 != -1)
    dispatch_once(&qword_100567268, block);
  return self->_siriDumper;
}

- (void)_setupPlayer
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](IMAVPlayer, "sharedPlayer"));
  objc_msgSend(v2, "setChapterMetadataMode:", 1);

  v3 = (id)objc_claimAutoreleasedReturnValue(+[IMAVPlayer sharedPlayer](IMAVPlayer, "sharedPlayer"));
  objc_msgSend(v3, "becomeActiveMediaPlayer");

}

- (PFFairPlayValidationManager)fairPlayValidationManager
{
  PFFairPlayValidationManager *fairPlayValidationManager;
  id v4;
  void *v5;
  PFFairPlayValidationManager *v6;
  PFFairPlayValidationManager *v7;

  fairPlayValidationManager = self->_fairPlayValidationManager;
  if (!fairPlayValidationManager)
  {
    v4 = objc_alloc((Class)PFFairPlayValidationManager);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
    v6 = (PFFairPlayValidationManager *)objc_msgSend(v4, "initWithEpisodeRemovalManager:", v5);
    v7 = self->_fairPlayValidationManager;
    self->_fairPlayValidationManager = v6;

    fairPlayValidationManager = self->_fairPlayValidationManager;
  }
  return fairPlayValidationManager;
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = MTApplicationDidBecomeActiveNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "postNotificationName:object:", v5, v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](PodcastsApplicationStateMonitor, "shared"));
  v7 = objc_msgSend(v3, "applicationState");

  objc_msgSend(v8, "setUIApplicationState:", v7);
}

- (void)_submitForegroundAnalytics
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new(PFCoreAnalyticsChannel);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent globalRetentionPolicy](PFAnalyticsEvent, "globalRetentionPolicy"));
  objc_msgSend(v3, "sendEvent:", v2);

}

- (void)_verifyFairPlayMigrationWithCompletionHandler:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(2, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000197FC;
  v8[3] = &unk_1004A63C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)_validateFairPlayEpisodesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PFFairPlayRolloutController sharedInstance](PFFairPlayRolloutController, "sharedInstance"));
  v6 = objc_msgSend(v5, "isEnabled");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared fairPlayValidationManager](self, "fairPlayValidationManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100047F88;
    v13[3] = &unk_1004A6350;
    v14 = v4;
    v8 = v4;
    objc_msgSend(v7, "validateDownloadedEpisodesWithCompletion:", v13);

    v9 = v14;
  }
  else
  {
    v8 = objc_alloc_init((Class)_TtC10PodcastsUI23UIStoreResponseDelegate);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared secureDownloadRenewalManager](self, "secureDownloadRenewalManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10004E638;
    v11[3] = &unk_1004A6378;
    v12 = v4;
    v9 = v4;
    objc_msgSend(v10, "updateDRMKeysForDownloadsWithUrlProtocolDelegate:completionHandler:", v8, v11);

  }
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  MTBackgroundTaskScheduler *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](IMNetworkObserver, "sharedInstance", a3, a4));
  objc_msgSend(v5, "beginObserving");

  if (+[DebugUtil isInternalInstall](DebugUtil, "isInternalInstall"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("EnableCharlesSupport"));

    if (v7)
      +[AMSDefaults setIgnoreServerTrustEvaluation:](AMSDefaults, "setIgnoreServerTrustEvaluation:", 1);
  }
  v8 = +[MTAccountController sharedInstance](MTAccountController, "sharedInstance");
  +[UIViewController swizzleMethodsForMetrics](UIViewController, "swizzleMethodsForMetrics");
  +[MTDebugDataManager setup](MTDebugDataManager, "setup");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDeviceCapacityMonitor shared](MTDeviceCapacityMonitor, "shared"));
  objc_msgSend(v9, "setActiveNotificationName:", MTApplicationDidBecomeActiveNotification);
  v10 = +[MTReachability sharedInstance](MTReachability, "sharedInstance");
  if ((os_feature_enabled_bluemoon(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance")) & 1) == 0)
    -[MTAppDelegate_Shared _setupPlayer](self, "_setupPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared backgroundTaskScheduler](self, "backgroundTaskScheduler"));

  if (!v11)
  {
    +[MTBackgroundTaskScheduler registerBackgroundTaskClass:](MTBackgroundTaskScheduler, "registerBackgroundTaskClass:", objc_opt_class(MTFeedUpdateBackgroundTask));
    v12 = objc_alloc_init(MTBackgroundTaskScheduler);
    -[MTAppDelegate_Shared setBackgroundTaskScheduler:](self, "setBackgroundTaskScheduler:", v12);

  }
  return 1;
}

- (void)setupAfterBecomingActive
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  int v18;
  void *v19;

  v3 = _MTLogCategoryDefault(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MTAppDelegate_Shared setupAfterBecomingActive", (uint8_t *)&v18, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PFDeferredLaunchTaskCoordinator sharedInstance](PFDeferredLaunchTaskCoordinator, "sharedInstance"));
  objc_msgSend(v5, "scheduleDefaultDeferralDeadline");

  v6 = -[MTAppDelegate_Shared _isApplicationActive](self, "_isApplicationActive");
  if (v6)
  {
    v7 = _MTLogCategoryDefault(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "MTAppDelegate_Shared Application is Active!", (uint8_t *)&v18, 2u);
    }

    if (qword_100567250 != -1)
      dispatch_once(&qword_100567250, &stru_1004A63E8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTForegroundSyncUtil sharedInstance](MTForegroundSyncUtil, "sharedInstance"));
    objc_msgSend(v9, "syncEverythingIfNeeded");

    global_queue = dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v11, &stru_1004A64A8);

    v14 = _MTLogCategoryDatabase(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 2.0));
      v18 = 138412290;
      v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Will start deleting hidden podcasts in %@ seconds", (uint8_t *)&v18, 0xCu);

    }
    v17 = dispatch_time(0, 2000000000);
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, &stru_1004A64E8);
  }
  +[IMMetrics endTimer:](IMMetrics, "endTimer:", CFSTR("app_resume"));
  +[IMMetrics endTimer:](IMMetrics, "endTimer:", CFSTR("app_launch"));
}

- (void)applicationWillEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](IMNetworkObserver, "sharedInstance", a3));
  objc_msgSend(v4, "beginObserving");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v6 = MTApplicationWillEnterForegroundNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "postNotificationName:object:", v6, v7);

  +[IMMetrics startTimer:](IMMetrics, "startTimer:", CFSTR("app_resume"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PFRestrictionsUtil sharedInstance](PFRestrictionsUtil, "sharedInstance"));
  objc_msgSend(v8, "beginListeningForChanges");

  v9 = _MTLogCategoryCloudSync(+[PFRestrictionsUtil reloadSettings](PFRestrictionsUtil, "reloadSettings"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Foreground Sync] Application will enter foreground", buf, 2u);
  }

  global_queue = dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v12, &stru_1004A62C0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTForegroundSyncUtil sharedInstance](MTForegroundSyncUtil, "sharedInstance"));
  objc_msgSend(v13, "updatePlaybackSettingIfNeeded");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTForegroundSyncUtil sharedInstance](MTForegroundSyncUtil, "sharedInstance"));
  objc_msgSend(v14, "setNeedsSyncing");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTForegroundSyncUtil sharedInstance](MTForegroundSyncUtil, "sharedInstance"));
  objc_msgSend(v15, "feedUpdateAllPodcastsOnForeground");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTPurchaseControllerWrapper sharedInstance](MTPurchaseControllerWrapper, "sharedInstance"));
  objc_msgSend(v16, "syncMusicSubscriptionInformation");

  -[MTAppDelegate_Shared _validateFairPlayEpisodes](self, "_validateFairPlayEpisodes");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v17));
  objc_msgSend(v18, "processPendingKeyInvalidations");

  v19 = objc_claimAutoreleasedReturnValue(+[PFSharedDispatchQueues localAssetSupportWorkQueue](PFSharedDispatchQueues, "localAssetSupportWorkQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048174;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(v19, block);

}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  NSLog(CFSTR("Continue Activity! %@"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
  v11 = objc_msgSend(v10, "isEqualToString:", NSUserActivityTypeBrowsingWeb);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webpageURL"));
    -[MTAppDelegate_Shared application:openURL:options:](self, "application:openURL:options:", v7, v12, &__NSDictionary0__struct);

LABEL_9:
    v19 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "isStateRestorationActivity"))
  {
    -[MTAppDelegate_Shared application:handleStateRestorationWith:](self, "application:handleStateRestorationWith:", v7, v8);
    goto LABEL_9;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", CFSTR("handoff"), 0, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTIntentDonationUtil sharedInstance](MTIntentDonationUtil, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activityType"));
  v16 = objc_msgSend(v14, "canContinueIntentWithUserActivityType:", v15);

  if (!v16)
  {
    if ((os_feature_enabled_bluemoon(v17) & 1) == 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTHandoffController sharedInstance](MTHandoffController, "sharedInstance"));
      objc_msgSend(v20, "continueActivity:", v8);

    }
    goto LABEL_9;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTIntentDonationUtil sharedInstance](MTIntentDonationUtil, "sharedInstance"));
  v19 = objc_msgSend(v18, "continueIntentsUserActivity:", v8);

LABEL_10:
  return v19;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = MTApplicationDidFinishLaunchingNotification;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v6, "postNotificationName:object:", v7, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](PodcastsApplicationStateMonitor, "shared"));
  v10 = objc_msgSend(v5, "applicationState");

  objc_msgSend(v9, "setUIApplicationState:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController sharedInstance](MTPushNotificationController, "sharedInstance"));
  objc_msgSend(v11, "registerPushNotifications");

  global_queue = dispatch_get_global_queue(0, 0);
  v13 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v13, &stru_1004A6220);

  if ((os_feature_enabled_bluemoon(v14) & 1) == 0)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1004A6240);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1004A6260);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "didChangeStoreAccount:", ACDAccountStoreDidChangeNotification, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "didChangeStoreAccountDSID", CFSTR("AccountDSIDChangedNotification"), 0);

  v18 = _MTLogCategoryDefault(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "MTAppDelegate_Shared SiriX donation will begin", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E114;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(v13, block);

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1004A6280);
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

- (void)setFairPlayMigrationBackgroundTask:(unint64_t)a3
{
  self->_fairPlayMigrationBackgroundTask = a3;
}

- (void)setBackgroundTaskScheduler:(id)a3
{
  objc_storeStrong((id *)&self->backgroundTaskScheduler, a3);
}

- (void)setAppController:(id)a3
{
  objc_storeStrong((id *)&self->_appController, a3);
}

- (unint64_t)fairPlayMigrationBackgroundTask
{
  return self->_fairPlayMigrationBackgroundTask;
}

- (MTBackgroundTaskScheduler)backgroundTaskScheduler
{
  return self->backgroundTaskScheduler;
}

- (MTAppController)appController
{
  return self->_appController;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTAppDelegate_Shared;
  -[MTAppDelegate_Shared dealloc](&v4, "dealloc");
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  id *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  dispatch_time_t v21;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
  v7 = +[MTDBUtil isSupportedUrlString:](MTDBUtil, "isSupportedUrlString:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
    v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("feed:http"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("feed:"), &stru_1004C6D40, 8, 0, 5));

      v12 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
      v5 = (id)v12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lowercaseString"));

    if (objc_msgSend(v14, "hasPrefix:", CFSTR("itms")))
    {
      v15 = 1000000000;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10004E04C;
      v25[3] = &unk_1004A6200;
      v5 = v5;
      v25[4] = v5;
      v16 = (id *)v25;
    }
    else if (objc_msgSend(v14, "hasPrefix:", CFSTR("podcasts")))
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10004E090;
      v24[3] = &unk_1004A6200;
      v5 = v5;
      v15 = 0;
      v24[4] = v5;
      v16 = (id *)v24;
    }
    else
    {
      if (+[DebugUI isDebugUrl:](DebugUI, "isDebugUrl:", v5))
      {
        +[DebugUI showDebugUI](DebugUI, "showDebugUI");
LABEL_15:

        goto LABEL_16;
      }
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("podcast")))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("podcast"), CFSTR("http"), 8, 0, objc_msgSend(CFSTR("podcast"), "length")));

        v19 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));
        v5 = (id)v19;
      }
      v15 = 1000000000;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10004E0D4;
      v23[3] = &unk_1004A6200;
      v5 = v5;
      v23[4] = v5;
      v16 = (id *)v23;
    }
    v20 = objc_retainBlock(v16);

    if (v20)
    {
      v21 = dispatch_time(0, v15);
      dispatch_after(v21, (dispatch_queue_t)&_dispatch_main_q, v20);

    }
    goto LABEL_15;
  }
LABEL_16:

  return v7;
}

- (void)applicationWillResignActive:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = MTApplicationWillResignActiveNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "postNotificationName:object:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](PodcastsApplicationStateMonitor, "shared"));
  v8 = objc_msgSend(v3, "applicationState");

  objc_msgSend(v7, "setUIApplicationState:", v8);
  +[MTBaseFeedManager saveSubscriptionMetadata](MTBaseFeedManager, "saveSubscriptionMetadata");
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v10, "setLastAppUseDate:", v9);

}

- (void)applicationDidEnterBackground:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = MTApplicationDidEnterBackgroundNotification;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v4, "postNotificationName:object:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](PodcastsApplicationStateMonitor, "shared"));
  v8 = objc_msgSend(v3, "applicationState");

  objc_msgSend(v7, "setUIApplicationState:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[PFRestrictionsUtil sharedInstance](PFRestrictionsUtil, "sharedInstance"));
  objc_msgSend(v9, "endListeningForChanges");

  global_queue = dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v11, &stru_1004A62A0);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[IMNetworkObserver sharedInstance](IMNetworkObserver, "sharedInstance"));
  objc_msgSend(v12, "endObserving");

}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  v3 = MTApplicationDidReceiveMemoryWarningNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "postNotificationName:object:", v3, v4);

}

- (void)applicationWillTerminate:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  v3 = MTApplicationWillTerminateNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v5, "postNotificationName:object:", v3, v4);

}

- (void)application:(id)a3 didFailToRegisterForRemoteNotificationsWithError:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController sharedInstance](MTPushNotificationController, "sharedInstance"));
  objc_msgSend(v5, "didFailToRegisterWithError:", v4);

}

- (void)application:(id)a3 didReceiveRemoteNotification:(id)a4 fetchCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004E5F0;
  v12[3] = &unk_1004A62E8;
  v13 = v7;
  v14 = v8;
  v12[4] = self;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "fetchActiveAccountWithCompletion:", v12);

}

- (void)storeAccountDidChange
{
  dispatch_async((dispatch_queue_t)self->_accountChangeQueue, &stru_1004A6508);
}

- (BOOL)canOpenURL:(id)a3
{
  return 0;
}

- (void)didChangeStoreAccount:(id)a3
{
  if (+[MTAccountController iTunesAccountDidChangeForACAccountNotification:](MTAccountController, "iTunesAccountDidChangeForACAccountNotification:", a3))
  {
    -[MTAppDelegate_Shared storeAccountDidChange](self, "storeAccountDidChange");
  }
}

- (UIViewController)rootViewController
{
  return 0;
}

- (NSOperationQueue)updateQueue
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EB48;
  block[3] = &unk_1004A6200;
  block[4] = self;
  if (qword_100567260 != -1)
    dispatch_once(&qword_100567260, block);
  return self->_updateQueue;
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  NSString *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSString *v22;
  void (**v23)(void);
  uint64_t v24;
  NSObject *v25;
  int v26;
  MTAppDelegate_Shared *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  id v31;

  v7 = (NSString *)a4;
  v8 = a5;
  v10 = _MTLogCategoryNetwork(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainBlock(v8);
    v26 = 138412802;
    v27 = self;
    v28 = 2112;
    v29 = v7;
    v30 = 2112;
    v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[BackgroundSession] %@ handleEventsForBackgroundURLSession called for session with identifier %@ and completionHandler: %@.", (uint8_t *)&v26, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PUIAssetDownloaders sharedDownloaders](PUIAssetDownloaders, "sharedDownloaders"));
  objc_msgSend(v13, "registerBackgroundCompletion:forSession:", v8, v7);

  if (-[NSString containsString:](v7, "containsString:", CFSTR("MTImageDownloader")))
  {
    v14 = -[objc_class sharedInstance](NSClassFromString(v7), "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionCompletionHandler"));

    if (v16)
    {
      v19 = _MTLogCategoryNetwork(v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionCompletionHandler"));
        v22 = objc_retainBlock(v21);
        v26 = 138412546;
        v27 = (MTAppDelegate_Shared *)v7;
        v28 = 2112;
        v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "handleEventsForBackgroundURLSession being called BEFORE URLSessionDidFinishEventsForBackgroundURLSession for identifier %@.  Invoking existing completionHandler %@.", (uint8_t *)&v26, 0x16u);

      }
      v23 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sessionCompletionHandler"));
      v23[2]();

      v17 = objc_msgSend(v15, "setSessionCompletionHandler:", 0);
    }
    v24 = _MTLogCategoryNetwork(v17, v18);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Setting sessionCompletionHandler for MTImageDownloader.", (uint8_t *)&v26, 2u);
    }

    objc_msgSend(v15, "setSessionCompletionHandler:", v8);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedManager sharedInstance](MTFeedManager, "sharedInstance"));
    objc_msgSend(v15, "handleEventsForBackgroundURLSessionFor:completionHandler:", v7, v8);
  }

}

- (BOOL)application:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v4 = a4;
  NSLog(CFSTR("Will Continue"));
  if ((objc_msgSend(v4, "isEqualToString:", NSUserActivityTypeBrowsingWeb) & 1) != 0
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTIntentDonationUtil sharedInstance](MTIntentDonationUtil, "sharedInstance")),
        v6 = objc_msgSend(v5, "canContinueIntentWithUserActivityType:", v4),
        v5,
        (v6 & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTHandoffController sharedInstance](MTHandoffController, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supportedActivityTypes"));
    v7 = objc_msgSend(v9, "containsObject:", v4);

  }
  return v7;
}

- (void)application:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  NSLog(CFSTR("Failed to Continue: %@, %@"), a2, a3, a4, a5);
}

- (int64_t)_hostWindowLayoutDirection
{
  return 0;
}

- (BOOL)_hasMainWindow
{
  return 1;
}

- (BOOL)_mainWindowIsKey
{
  return 1;
}

- (BOOL)_isApplicationTerminating
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayValidationManager, 0);
  objc_storeStrong((id *)&self->_secureDownloadRenewalManager, 0);
  objc_storeStrong((id *)&self->_siriDonator, 0);
  objc_storeStrong((id *)&self->_siriDumper, 0);
  objc_storeStrong((id *)&self->_appController, 0);
  objc_storeStrong((id *)&self->backgroundTaskScheduler, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_accountChangeQueue, 0);
}

- (unint64_t)processNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  _BOOL8 v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  int v26;
  id v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = _MTLogCategoryCloudSync(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138412290;
    v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processing Notification %@", (uint8_t *)&v26, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController sharedInstance](MTPushNotificationController, "sharedInstance"));
  v8 = objc_msgSend(v7, "shouldShowAnnouncementNotification:", v4);

  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController sharedInstance](MTPushNotificationController, "sharedInstance"));
    objc_msgSend(v9, "processAnnouncementNotification:", v4);
    v10 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (+[MTPushNotificationController shouldProcessNotification:](MTPushNotificationController, "shouldProcessNotification:", v4))
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    if (+[MTPushNotificationController shouldSyncFeedUpdateForNotification:](MTPushNotificationController, "shouldSyncFeedUpdateForNotification:", v4))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController storeIdFromFeedUpdateNotification:](MTPushNotificationController, "storeIdFromFeedUpdateNotification:", v4));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTPushNotificationController triggeredByFromFeedUpdateNotification:](MTPushNotificationController, "triggeredByFromFeedUpdateNotification:", v4));
      -[MTAppDelegate_Shared _setNeedsRetryFlagFromNotificationForStoreId:](self, "_setNeedsRetryFlagFromNotificationForStoreId:", objc_msgSend(v11, "longLongValue"));
      v13 = _MTLogCategoryCloudSync(-[MTAppDelegate_Shared processFeedUpdateNotification:triggerBy:](self, "processFeedUpdateNotification:triggerBy:", objc_msgSend(v11, "longLongValue"), v12));
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138412546;
        v27 = v11;
        v28 = 2112;
        v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Push] Processing Feed Update push notification for podcast %@ with triggerBy %@", (uint8_t *)&v26, 0x16u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey podcastStoreId](MTFeedUpdateMetricsDataKey, "podcastStoreId"));
      objc_msgSend(v9, "setObject:forKey:", v11, v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey notificationType](MTFeedUpdateMetricsDataKey, "notificationType"));
      objc_msgSend(v9, "setObject:forKey:", CFSTR("FeedUpdate"), v16);

    }
    else
    {
      v17 = +[MTPushNotificationController shouldSyncSubscriptionsForNotification:](MTPushNotificationController, "shouldSyncSubscriptionsForNotification:", v4);
      if (v17)
      {
        v18 = _MTLogCategoryCloudSync(v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[Push] Processing Subscription Sync push notification.", (uint8_t *)&v26, 2u);
        }

        -[MTAppDelegate_Shared processSubscriptionSyncNotification](self, "processSubscriptionSyncNotification");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey notificationType](MTFeedUpdateMetricsDataKey, "notificationType"));
        v20 = CFSTR("BookKeeper");
      }
      else
      {
        v21 = +[MTPushNotificationController shouldSyncUppForNotification:](MTPushNotificationController, "shouldSyncUppForNotification:", v4);
        if (!v21)
        {
          v10 = 1;
          goto LABEL_21;
        }
        v22 = _MTLogCategoryCloudSync(v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Push] Processing UPP Sync push notification.", (uint8_t *)&v26, 2u);
        }

        -[MTAppDelegate_Shared processUPPSyncNotification](self, "processUPPSyncNotification");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey notificationType](MTFeedUpdateMetricsDataKey, "notificationType"));
        v20 = CFSTR("UPP");
      }
      objc_msgSend(v9, "setObject:forKey:", v20, v11);
    }

    v10 = 0;
LABEL_21:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsAction notificationReceived](MTFeedUpdateMetricsAction, "notificationReceived"));
    +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", v24, 0, v9);

    goto LABEL_22;
  }
  v10 = 1;
LABEL_23:

  return v10;
}

- (void)processFeedUpdateNotification:(int64_t)a3 triggerBy:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MTAppDelegate_Shared.FeedUpdatePushNotification.%lld"), a3));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004F4A8;
  v11[3] = &unk_1004A6530;
  v11[4] = &v12;
  v8 = objc_msgSend(v6, "beginBackgroundTaskWithName:expirationHandler:", v7, v11);

  v13[3] = (uint64_t)v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](MTFeedUpdateManager, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004F4F4;
  v10[3] = &unk_1004A6558;
  v10[4] = &v12;
  v10[5] = a3;
  objc_msgSend(v9, "updatePodcastWithStoreId:triggerBy:userInitiated:forced:source:completion:", a3, v5, 0, 1, 2, v10);

  _Block_object_dispose(&v12, 8);
}

- (void)processSubscriptionSyncNotification
{
  void *v3;
  uint64_t upp_on_library_push;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  if (os_feature_enabled_homepod_siri_donation_from_apns(self, a2)
    && (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAppDelegate_Shared siriDonator](self, "siriDonator"));
    objc_msgSend(v3, "startDonation");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
    objc_msgSend(v3, "syncAllBookkeeperKeys");
  }

  upp_on_library_push = os_feature_enabled_fetch_upp_on_library_push();
  if ((_DWORD)upp_on_library_push)
  {
    v5 = _MTLogCategoryCloudSync(upp_on_library_push);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching UPP on subscription sync notification in case a UPP push was missed", v7, 2u);
    }

    -[MTAppDelegate_Shared processUPPSyncNotification](self, "processUPPSyncNotification");
  }
}

- (void)processUPPSyncNotification
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SyncControllerFactory resolvedSyncController](_TtC8Podcasts21SyncControllerFactory, "resolvedSyncController"));
  objc_msgSend(v2, "performUniversalPlaybackPositionSync");

}

- (void)_setNeedsRetryFlagFromNotificationForStoreId:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  int64_t v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_10004F850;
  v15 = &unk_1004A6580;
  v16 = v5;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPodcastStoreId:](MTPodcast, "predicateForPodcastStoreId:", a3));
  v18 = a3;
  v6 = v17;
  v7 = v5;
  objc_msgSend(v7, "performBlockAndWaitWithSave:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsAction notificationSetRetryFlag](MTFeedUpdateMetricsAction, "notificationSetRetryFlag", v12, v13, v14, v15));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey podcastStoreId](MTFeedUpdateMetricsDataKey, "podcastStoreId"));
  v19 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  v20 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  +[IMMetrics recordUserAction:dataSource:withData:](IMMetrics, "recordUserAction:dataSource:withData:", v8, 0, v11);

}

- (MTSecureDownloadRenewalManager)secureDownloadRenewalManager
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "secureDownloadRenewalManager"));

  return (MTSecureDownloadRenewalManager *)v3;
}

- (_TtC18PodcastsFoundation11SiriDonator)siriDonator
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FA4C;
  block[3] = &unk_1004A6200;
  block[4] = self;
  if (qword_100567270 != -1)
    dispatch_once(&qword_100567270, block);
  return self->_siriDonator;
}

@end
