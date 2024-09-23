@implementation BKAppAnalyticsManager

- (BOOL)analyticsSessionDataIsParallel
{
  return 0;
}

- (BOOL)analyticsSessionDataIsMainWindow
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "analyticsManagerSceneController:", self));

  if (v4)
    v5 = objc_msgSend(v4, "sceneType") == (id)1;
  else
    v5 = 0;

  return v5;
}

- (BKAppAnalyticsManagerDelegate)delegate
{
  return (BKAppAnalyticsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)analyticsSessionDataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", BASessionDataKeyJSVersion))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "environment"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appVersion"));

LABEL_13:
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", BASessionDataKeyStoreFrontID))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentStorefront"));
LABEL_12:
    v7 = (void *)v8;
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", BASessionDataKeyiCloudLoggedIn))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v9 = objc_msgSend(v5, "isUserSignedInToiCloud");
LABEL_11:
    v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", BASessionDataKeyiTunesLoggedIn))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v9 = objc_msgSend(v5, "isUserSignedInToiTunes");
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", BASessionDataKeyiCloudDriveOptIn))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v9 = objc_msgSend(v5, "isGlobalICloudDriveSyncOptedIn");
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", BASessionDataKeyLaunchType))
  {
    if (-[BKAppAnalyticsManager isColdLaunched](self, "isColdLaunched"))
      v11 = 1;
    else
      v11 = 2;
    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", BASessionDataKeyHasWidgets))
    {
      v7 = 0;
      goto LABEL_14;
    }
    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[BKWidgetService hasWidgetConfigurations](BKWidgetService, "hasWidgetConfigurations")));
  }
  v7 = (void *)v12;
LABEL_14:

  return v7;
}

- (BOOL)isColdLaunched
{
  return self->_coldLaunched;
}

- (BKAppAnalyticsManager)init
{
  BKAppAnalyticsManager *v3;
  BKAppAnalyticsManager *v4;
  uint64_t v5;
  NSMutableSet *analyticsAccumulatedReadIDs;
  uint64_t v7;
  NSMutableSet *analyticsAccumulatedListenIDs;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  BKPersonalizationEventProcessor *v14;
  BKPersonalizationEventProcessor *personalizationEventProcessor;
  objc_super v17;

  kdebug_trace(725353712, 50, 0, 0, 0);
  v17.receiver = self;
  v17.super_class = (Class)BKAppAnalyticsManager;
  v3 = -[BKAppAnalyticsManager init](&v17, "init");
  v4 = v3;
  if (v3)
  {
    v3->_analyticsLock._os_unfair_lock_opaque = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    analyticsAccumulatedReadIDs = v4->_analyticsAccumulatedReadIDs;
    v4->_analyticsAccumulatedReadIDs = (NSMutableSet *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    analyticsAccumulatedListenIDs = v4->_analyticsAccumulatedListenIDs;
    v4->_analyticsAccumulatedListenIDs = (NSMutableSet *)v7;

    v4->_analyticsBackgroundTaskIdentifier = UIBackgroundTaskInvalid;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v9, "addObserver:forKeyPath:options:context:", v4, kBAResetAnalyticsUserID, 1, off_1009C9760);

    v10 = objc_msgSend((id)objc_opt_class(v4), "resolver");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "resolveClass:", objc_opt_class(BKPersonalizationEventDonor));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = -[BKPersonalizationEventProcessor initWithDonor:]([BKPersonalizationEventProcessor alloc], "initWithDonor:", v13);
    personalizationEventProcessor = v4->_personalizationEventProcessor;
    v4->_personalizationEventProcessor = v14;

    v4->_coldLaunched = 1;
  }
  kdebug_trace(725353712, 51, 0, 0, 0);
  return v4;
}

- (id)analyticsControllerConfigurationForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[3];
  _QWORD v26[3];

  v25[0] = kBAJitterTimestampEnabled;
  v25[1] = kBAJitterTimestampLowerBound;
  v26[0] = BRCBooksDefaultsKeyAnalyticsJitterTimestampEnabled2;
  v26[1] = BRCBooksDefaultsKeyAnalyticsJitterTimestampLowerBound;
  v25[2] = kBAJitterTimestampUpperBound;
  v26[2] = BRCBooksDefaultsKeyAnalyticsJitterTimestampUpperBound;
  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v3));

  if (!v5)
    goto LABEL_12;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v7 = objc_msgSend(v6, "configurationLoaded");

  if ((v7 & 1) == 0)
  {
    v22 = BALog();
    v15 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10069EB7C();
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configs"));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    v23 = BALog();
    v15 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10069EAEC();
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configs"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKeyPath:", v5));

  if (!v13)
  {
    v14 = BALog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10069EB18((uint64_t)v5, v15, v16, v17, v18, v19, v20, v21);
LABEL_11:

LABEL_12:
    v13 = 0;
  }

  return v13;
}

- (void)analyticsControllerDidStartSession:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id evaluateAfterSessionStart;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id buf[2];

  v4 = a3;
  v5 = BALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "analyticsControllerDidStartSession: start", (uint8_t *)buf, 2u);
  }

  -[BKAppAnalyticsManager setDidStartFirstSession:](self, "setDidStartFirstSession:", 1);
  -[BKAppAnalyticsManager setIsSessionActive:](self, "setIsSessionActive:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationTracker"));

  objc_msgSend(v8, "popOrientationData");
  if (objc_msgSend(v8, "optedIn"))
    objc_msgSend(v8, "pushOrientationDataFromFile:line:", CFSTR("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppAnalyticsManager.m"), 325);
  objc_msgSend(v8, "submitAppSessionStartEvent");
  objc_msgSend(v8, "timeAppSessionEndEvent");
  objc_initWeak(buf, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sessionStartTime"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appLaunchCoordinator:", self));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000639A8;
  v23[3] = &unk_1008E98F8;
  objc_copyWeak(&v25, buf);
  v13 = v10;
  v24 = v13;
  objc_msgSend(v12, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 4097, CFSTR("analyticsControllerDidStartSession"), v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000C858;
  v21[3] = &unk_1008E8B70;
  objc_copyWeak(&v22, buf);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", UIDeviceOrientationDidChangeNotification, 0, v15, v21));
  -[BKAppAnalyticsManager setDeviceOrentationDidChangeObserver:](self, "setDeviceOrentationDidChangeObserver:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager evaluateAfterSessionStart](self, "evaluateAfterSessionStart"));
  evaluateAfterSessionStart = self->_evaluateAfterSessionStart;
  self->_evaluateAfterSessionStart = 0;

  v19 = objc_retainBlock(v17);
  v20 = v19;
  if (v19)
    (*((void (**)(id))v19 + 2))(v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);

  objc_destroyWeak(buf);
}

- (void)setupSessionChangeNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationTracker"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "applicationTracker"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017604;
  v8[3] = &unk_1008E98D0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "onSessionChangeWithBlock:", v8);

}

- (void)analyticsSetupTracking
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v3 = objc_alloc_init((Class)BAAnalyticsController);
  -[BKAppAnalyticsManager setAnalyticsController:](self, "setAnalyticsController:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  objc_msgSend(v5, "setConfigurationProvider:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  objc_msgSend(v6, "start");

  -[BKAppAnalyticsManager updateTreatmentData](self, "updateTreatmentData");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BRCConfigurationManager sharedInstance](BRCConfigurationManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  objc_msgSend(v8, "setUserConfiguration:", v7);

  -[BKAppAnalyticsManager setupSessionChangeNotifications](self, "setupSessionChangeNotifications");
  -[BKAppAnalyticsManager setupWindowNotification](self, "setupWindowNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "onTreatmentDataChange:", CFSTR("kBABookTreatmentDataDidChange"), 0);

  global_queue = dispatch_get_global_queue(25, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v11, &stru_1008E98A8);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager delegate](self, "delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "appLaunchCoordinator:", self));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100063D74;
  v16[3] = &unk_1008E77C8;
  v16[4] = self;
  objc_msgSend(v13, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 1024, CFSTR("analyticsSetupTracking"), v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDragController sharedInstance](TUIDragController, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKDragAndDropMonitor sharedInstance](BKDragAndDropMonitor, "sharedInstance"));
  objc_msgSend(v14, "addObserver:", v15);

}

- (BAAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)updateTreatmentData
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005B4EC;
  v4[3] = &unk_1008E74C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)setDidStartFirstSession:(BOOL)a3
{
  self->_didStartFirstSession = a3;
}

- (void)setDeviceOrentationDidChangeObserver:(id)a3
{
  objc_storeStrong(&self->_deviceOrentationDidChangeObserver, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setAnalyticsSessionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsSessionAssertion, a3);
}

- (void)setAnalyticsController:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsController, a3);
}

- (BKPersonalizationEventProcessor)personalizationEventProcessor
{
  return self->_personalizationEventProcessor;
}

- (id)mainLibrary
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "analyticsManagerLibrary:", self));

  return v4;
}

- (BOOL)didStartFirstSession
{
  return self->_didStartFirstSession;
}

- (void)analyticsStartSession
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = kBAResetAnalyticsUserID;
  v5 = objc_msgSend(v3, "BOOLForKey:", kBAResetAnalyticsUserID);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager delegate](self, "delegate"));
    objc_msgSend(v6, "analyticsManagerForceEndSession:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
    v8 = objc_msgSend(v7, "waitForSessionEnd:", 0.001);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
      objc_msgSend(v9, "resetPrivateData:", 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v10, "setBool:forKey:", 0, v4);

    }
    else
    {
      v11 = BALog();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10069EA74(v12, v13, v14, v15, v16, v17, v18, v19);

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  v21 = objc_msgSend(v20, "newSessionAssertion");
  -[BKAppAnalyticsManager setAnalyticsSessionAssertion:](self, "setAnalyticsSessionAssertion:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  objc_msgSend(v22, "deployStagedDataIfNeeded");

}

- (BUAssertion)analyticsSessionAssertion
{
  return self->_analyticsSessionAssertion;
}

- (void)analyticsControllerWillStartSession:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = BALog(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "analyticsControllerWillStartSession: start", v13, 2u);
  }

  if (!-[BKAppAnalyticsManager didStartFirstSession](self, "didStartFirstSession"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
    v7 = objc_msgSend(v6, "waitForConfiguration:", 1.0);

    if ((v7 & 1) == 0)
    {
      v11 = BALog(v8, v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10069EBA8();

    }
  }
}

- (NSArray)additionalEventProcessors
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager personalizationEventProcessor](self, "personalizationEventProcessor"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

+ (id)resolver
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bridgedResolver"));

  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[JSAStore sharedInstance](JSAStore, "sharedInstance"));
  objc_msgSend(v4, "removeObserver:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[JSAAccountController sharedController](JSAAccountController, "sharedController"));
  objc_msgSend(v5, "removeObserver:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDragController sharedInstance](TUIDragController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKDragAndDropMonitor sharedInstance](BKDragAndDropMonitor, "sharedInstance"));
  objc_msgSend(v6, "removeObserver:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:", self);
  objc_msgSend(v8, "removeObserver:name:object:", self->_applicationDidBecomeActiveObserver, UIApplicationDidBecomeActiveNotification, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "removeObserver:forKeyPath:", self, kBAResetAnalyticsUserID);

  v10.receiver = self;
  v10.super_class = (Class)BKAppAnalyticsManager;
  -[BKAppAnalyticsManager dealloc](&v10, "dealloc");
}

- (id)sceneManager
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "analyticsManagerSceneManager:", self));

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  objc_super v17;

  if (off_1009C9760 == a6)
  {
    v11 = a5;
    v12 = objc_opt_class(NSNumber);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));

    v14 = BUDynamicCast(v12, v13);
    v16 = (id)objc_claimAutoreleasedReturnValue(v14);

    if (objc_msgSend(v16, "BOOLValue"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager delegate](self, "delegate"));
      objc_msgSend(v15, "analyticsManagerForceEndSession:", self);

    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)BKAppAnalyticsManager;
    v10 = a5;
    -[BKAppAnalyticsManager observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", a3, a4, v10, a6);

  }
}

- (void)windowOcclusionStateDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController", a3));
  objc_msgSend(v3, "refreshSessionDataIfActive");

}

- (void)appWillTerminate
{
  -[BKAppAnalyticsManager terminateSession](self, "terminateSession");
}

- (void)terminateSession
{
  -[BKAppAnalyticsManager _mq_analyticsEndSession](self, "_mq_analyticsEndSession");
}

- (void)analyticsEndSession
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BBE3C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)analyticsSetReferralURL:(id)a3 app:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  objc_msgSend(v8, "setReferralURL:app:", v7, v6);

}

- (void)setEvaluateAfterSessionStart:(id)a3
{
  id v4;
  unsigned int v5;
  id evaluateAfterSessionStart;
  void (**v7)(_QWORD);

  v4 = a3;
  v5 = -[BKAppAnalyticsManager isSessionActive](self, "isSessionActive");
  v7 = (void (**)(_QWORD))objc_retainBlock(v4);

  if (v5)
  {
    evaluateAfterSessionStart = v7;
    if (v7)
    {
      v7[2](v7);
      evaluateAfterSessionStart = v7;
    }
  }
  else
  {
    evaluateAfterSessionStart = self->_evaluateAfterSessionStart;
    self->_evaluateAfterSessionStart = v7;
  }

}

- (void)analyticsControllerWillEndSession:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id location;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint8_t v43[4];
  uint64_t v44;

  v4 = a3;
  v7 = BALog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "analyticsControllerWillEndSession: start", buf, 2u);
  }

  os_unfair_lock_lock(&self->_analyticsLock);
  *(_QWORD *)buf = 0;
  v40 = buf;
  v41 = 0x2020000000;
  v42 = 0;
  v42 = -[BKAppAnalyticsManager analyticsBackgroundTaskIdentifier](self, "analyticsBackgroundTaskIdentifier");
  if (*((_QWORD *)v40 + 3) == UIBackgroundTaskInvalid)
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000BC39C;
    v36[3] = &unk_1008E9920;
    objc_copyWeak(&v37, &location);
    v36[4] = buf;
    v10 = objc_msgSend(v9, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("BKAppAnalyticsManager"), v36);
    *((_QWORD *)v40 + 3) = v10;

    v11 = -[BKAppAnalyticsManager setAnalyticsBackgroundTaskIdentifier:](self, "setAnalyticsBackgroundTaskIdentifier:", *((_QWORD *)v40 + 3));
    v14 = BALog(v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *((_QWORD *)v40 + 3);
      *(_DWORD *)v43 = 134217984;
      v44 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Background Task: %ld (BKAppAnalyticsManager) created.", v43, 0xCu);
    }

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(&self->_analyticsLock);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsController](self, "analyticsController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "applicationTracker"));

  v19 = objc_alloc((Class)BASessionReadingData);
  -[BKAppAnalyticsManager analyticsAccumulatedReadTime](self, "analyticsAccumulatedReadTime");
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsAccumulatedReadIDs](self, "analyticsAccumulatedReadIDs"));
  v23 = objc_msgSend(v19, "initWithTimeSpentReading:uniqueBooksRead:", (uint64_t)v21, BARoundIntegerToSignificantFigures(objc_msgSend(v22, "count"), 1));

  -[BKAppAnalyticsManager setAnalyticsAccumulatedReadTime:](self, "setAnalyticsAccumulatedReadTime:", 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsAccumulatedReadIDs](self, "analyticsAccumulatedReadIDs"));
  objc_msgSend(v24, "removeAllObjects");

  objc_msgSend(v18, "popSessionReadingData");
  objc_msgSend(v18, "pushSessionReadingData:file:line:", v23, CFSTR("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppAnalyticsManager.m"), 402);
  v25 = objc_alloc((Class)BASessionListeningData);
  -[BKAppAnalyticsManager analyticsAccumulatedListenTime](self, "analyticsAccumulatedListenTime");
  v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsAccumulatedListenIDs](self, "analyticsAccumulatedListenIDs"));
  v29 = objc_msgSend(v25, "initWithTimeSpentListening:uniqueAudiobooksListened:", (uint64_t)v27, BARoundIntegerToSignificantFigures(objc_msgSend(v28, "count"), 1));

  -[BKAppAnalyticsManager setAnalyticsAccumulatedListenTime:](self, "setAnalyticsAccumulatedListenTime:", 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsAccumulatedListenIDs](self, "analyticsAccumulatedListenIDs"));
  objc_msgSend(v30, "removeAllObjects");

  objc_msgSend(v18, "popSessionListeningData");
  objc_msgSend(v18, "pushSessionListeningData:file:line:", v29, CFSTR("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAppAnalyticsManager.m"), 408);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "engagementManager"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "analyticsHelper"));
  objc_msgSend(v33, "collectLocalSignalsAnalyticsWithTracker:", v18);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager deviceOrentationDidChangeObserver](self, "deviceOrentationDidChangeObserver"));
  objc_msgSend(v34, "removeObserver:name:object:", v35, UIDeviceOrientationDidChangeNotification, 0);

  -[BKAppAnalyticsManager setIsSessionActive:](self, "setIsSessionActive:", 0);
  _Block_object_dispose(buf, 8);

}

- (void)analyticsControllerDidEndSession:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  unint64_t v17;

  v4 = a3;
  v7 = BALog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "analyticsControllerDidEndSession: start", (uint8_t *)&v16, 2u);
  }

  objc_msgSend(v4, "unsetLaunchedFromShortcutItem");
  if (-[BKAppAnalyticsManager isColdLaunched](self, "isColdLaunched"))
    -[BKAppAnalyticsManager setColdLaunched:](self, "setColdLaunched:", 0);
  os_unfair_lock_lock(&self->_analyticsLock);
  v9 = -[BKAppAnalyticsManager analyticsBackgroundTaskIdentifier](self, "analyticsBackgroundTaskIdentifier");
  if (v9 != UIBackgroundTaskInvalid)
  {
    v12 = v9;
    v13 = BALog(v9, v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Background Task: %ld (BKAppAnalyticsManager) no longer need, ending it with -endBackgroundTask:.", (uint8_t *)&v16, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v15, "endBackgroundTask:", v12);

    -[BKAppAnalyticsManager setAnalyticsBackgroundTaskIdentifier:](self, "setAnalyticsBackgroundTaskIdentifier:", UIBackgroundTaskInvalid);
  }
  os_unfair_lock_unlock(&self->_analyticsLock);
}

- (void)analyticsController:(id)a3 resetSessionWithCompletion:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t *v15;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;

  v5 = a4;
  v8 = BALog(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "resetSessionWithCompletion: start", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x2020000000;
  v20 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC730;
  block[3] = &unk_1008E75B8;
  block[4] = self;
  block[5] = buf;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  global_queue = dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BC794;
  v13[3] = &unk_1008E9970;
  v14 = v5;
  v15 = buf;
  v13[4] = self;
  v12 = v5;
  dispatch_async(v11, v13);

  _Block_object_dispose(buf, 8);
}

- (void)_mq_analyticsEndSession
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppAnalyticsManager analyticsSessionAssertion](self, "analyticsSessionAssertion"));
  objc_msgSend(v3, "invalidate");

  -[BKAppAnalyticsManager setAnalyticsSessionAssertion:](self, "setAnalyticsSessionAssertion:", 0);
}

- (NSMutableSet)analyticsAccumulatedReadIDs
{
  return self->_analyticsAccumulatedReadIDs;
}

- (NSMutableSet)analyticsAccumulatedListenIDs
{
  return self->_analyticsAccumulatedListenIDs;
}

- (double)analyticsAccumulatedReadTime
{
  return self->_analyticsAccumulatedReadTime;
}

- (void)setAnalyticsAccumulatedReadTime:(double)a3
{
  self->_analyticsAccumulatedReadTime = a3;
}

- (double)analyticsAccumulatedListenTime
{
  return self->_analyticsAccumulatedListenTime;
}

- (void)setAnalyticsAccumulatedListenTime:(double)a3
{
  self->_analyticsAccumulatedListenTime = a3;
}

- (id)evaluateAfterSessionStart
{
  return self->_evaluateAfterSessionStart;
}

- (unint64_t)analyticsBackgroundTaskIdentifier
{
  return self->_analyticsBackgroundTaskIdentifier;
}

- (void)setAnalyticsBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_analyticsBackgroundTaskIdentifier = a3;
}

- (os_unfair_lock_s)analyticsLock
{
  return self->_analyticsLock;
}

- (void)setAnalyticsLock:(os_unfair_lock_s)a3
{
  self->_analyticsLock = a3;
}

- (void)setColdLaunched:(BOOL)a3
{
  self->_coldLaunched = a3;
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (void)setIsSessionActive:(BOOL)a3
{
  self->_isSessionActive = a3;
}

- (id)applicationDidBecomeActiveObserver
{
  return self->_applicationDidBecomeActiveObserver;
}

- (void)setApplicationDidBecomeActiveObserver:(id)a3
{
  objc_storeStrong(&self->_applicationDidBecomeActiveObserver, a3);
}

- (id)deviceOrentationDidChangeObserver
{
  return self->_deviceOrentationDidChangeObserver;
}

- (void)setPersonalizationEventProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationEventProcessor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personalizationEventProcessor, 0);
  objc_storeStrong(&self->_deviceOrentationDidChangeObserver, 0);
  objc_storeStrong(&self->_applicationDidBecomeActiveObserver, 0);
  objc_storeStrong((id *)&self->_analyticsSessionAssertion, 0);
  objc_storeStrong(&self->_evaluateAfterSessionStart, 0);
  objc_storeStrong((id *)&self->_analyticsAccumulatedListenIDs, 0);
  objc_storeStrong((id *)&self->_analyticsAccumulatedReadIDs, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startInitialAppStateQueryWithSessionStartTime:(id)a3 analyticsController:(id)a4 libraryAssetProvider:(id)a5 analyticsSessionAssertion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  BKAppAnalyticsManager *v16;
  uint64_t v17;

  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = a4;
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);
  v16 = self;
  sub_1003FC3FC((uint64_t)v14, v15, (uint64_t)a5, (uint64_t)a6);

  swift_unknownObjectRelease(a5);
  swift_unknownObjectRelease(a6);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

@end
