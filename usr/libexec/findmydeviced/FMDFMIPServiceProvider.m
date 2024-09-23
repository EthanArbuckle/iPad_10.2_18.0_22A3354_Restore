@implementation FMDFMIPServiceProvider

- (unint64_t)fmipState
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dsid"));

  if (v3 && (v4 = (unint64_t)objc_msgSend(v2, "unregisterState"), v4 <= 5))
    v5 = qword_1002537B8[v4];
  else
    v5 = 3;

  return v5;
}

- (FMDFMIPServiceProvider)init
{
  FMDFMIPServiceProvider *v2;
  FMDFMIPServiceProvider *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_queue_t v11;
  dispatch_queue_t v12;
  id v13;
  NSObject *v14;
  id v15;
  FMDFMIPNanoIDSListener *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  FMDMagSafeSetupLauncher *v21;
  FMDMagSafeSetupLauncher *magSafeSetupLauncher;
  uint8_t buf[16];
  _QWORD block[4];
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)FMDFMIPServiceProvider;
  v2 = -[FMDServiceProvider init](&v28, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider fm_logID](v2, "fm_logID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.icloud.findmydeviced.identityWaitQueue-%@"), v4));

    v6 = objc_retainAutorelease(v5);
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4), 0);
    -[FMDFMIPServiceProvider setIdentity_wait_queue:](v3, "setIdentity_wait_queue:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider fm_logID](v3, "fm_logID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.icloud.findmydeviced.deviceUnlockActionsQueue-%@"), v8));

    v10 = objc_retainAutorelease(v9);
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4), 0);
    -[FMDFMIPServiceProvider setDevice_unlock_actions_queue:](v3, "setDevice_unlock_actions_queue:", v11);

    -[FMDFMIPServiceProvider setLockStateNotifyToken:](v3, "setLockStateNotifyToken:", 0xFFFFFFFFLL);
    v12 = dispatch_queue_create("fmipServiceProvider-tokenHealingQueue", 0);
    -[FMDFMIPServiceProvider setAuthTokenHealingQueue:](v3, "setAuthTokenHealingQueue:", v12);

    +[FMDServiceProvider setActiveServiceProvider:](FMDServiceProvider, "setActiveServiceProvider:", v3);
    objc_initWeak(&location, v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100046028;
    block[3] = &unk_1002C1378;
    objc_copyWeak(&v26, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_100228C20(v14);

    v15 = objc_msgSend(objc_alloc((Class)FMNanoIDSManager), "initWithServiceId:minimumVersion:", CFSTR("com.apple.private.alloy.findmydeviced.watch"), 2);
    v16 = -[FMDFMIPNanoIDSListener initWithManager:]([FMDFMIPNanoIDSListener alloc], "initWithManager:", v15);
    -[FMDFMIPServiceProvider setIdsListener:](v3, "setIdsListener:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "addObserver:selector:name:object:", v3, "checkShutdownSoonRegistration", CFSTR("FMDFMIPLowBatteryLocateStateDidChangeLocalNotification"), 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v3, "_fmipStateChangeLocalNotification:", CFSTR("FMIPStateChangeLocalNotification"), 0);

    v19 = sub_1000031B8();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Findmy MagSafe enabled", buf, 2u);
    }

    v21 = objc_alloc_init(FMDMagSafeSetupLauncher);
    magSafeSetupLauncher = v3->_magSafeSetupLauncher;
    v3->_magSafeSetupLauncher = v21;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

  }
  return v3;
}

- (id)accountStore
{
  if (qword_100306558 != -1)
    dispatch_once(&qword_100306558, &stru_1002C30B8);
  return (id)qword_100306550;
}

- (id)serviceName
{
  return CFSTR("FMIP");
}

- (void)start
{
  FMDUnregisterTokenStore *v3;
  void *v4;
  void *v5;
  void *v6;
  FMDNanoMigrator *v7;
  void *v8;
  void *v9;
  FMDNanoMigrator *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FMDFMIPServiceProvider;
  -[FMDServiceProvider start](&v12, "start");
  -[FMDFMIPServiceProvider syncFMIPStateToWatch](self, "syncFMIPStateToWatch");
  v3 = objc_alloc_init(FMDUnregisterTokenStore);
  -[FMDFMIPServiceProvider setUnregisterTokenStore:](self, "setUnregisterTokenStore:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCompanionRegistryFactory companionRegistryWithDelegate:](FMDCompanionRegistryFactory, "companionRegistryWithDelegate:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider unregisterTokenStore](self, "unregisterTokenStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allAccessories"));
  objc_msgSend(v5, "expungeUnregisterTokens:", v6);

  v7 = [FMDNanoMigrator alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider unregisterTokenStore](self, "unregisterTokenStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionController](self, "serverInteractionController"));
  v10 = -[FMDNanoMigrator initWithCompanionRegistry:unregisterTokenStore:serverInteractionController:](v7, "initWithCompanionRegistry:unregisterTokenStore:serverInteractionController:", v4, v8, v9);
  -[FMDFMIPServiceProvider setNanoMigrator:](self, "setNanoMigrator:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider nanoMigrator](self, "nanoMigrator"));
  objc_msgSend(v11, "unregisterAccessoriesIfNeeded");

  -[FMDServiceProvider startLocationMonitoringIfNeeded](self, "startLocationMonitoringIfNeeded");
}

- (BOOL)willMakeProviderActive
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  _DWORD v8[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v4 = objc_msgSend(v3, "isBuddyDone");

  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = (_DWORD)v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Buddy status: %d", (uint8_t *)v8, 8u);
  }

  -[FMDFMIPServiceProvider _checkForBuddyCompletionAndReinitialize:withBuddyStatus:](self, "_checkForBuddyCompletionAndReinitialize:withBuddyStatus:", 0, v4);
  return (char)v4;
}

- (void)didMakeProviderActive
{
  void *v3;
  unint64_t v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  FMDDetachNotificationManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)FMDFMIPServiceProvider;
  -[FMDDeviceActionsServiceProvider didMakeProviderActive](&v23, "didMakeProviderActive");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v4 = (unint64_t)objc_msgSend(v3, "unregisterState");

  if (v4 <= 4 && ((1 << v4) & 0x1A) != 0)
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found an fmip account that was previously unregistering in the last run of findmydeviced. That unregister may or may not have failed & error may or may not have been shown to the user. Showing error to user & turning FMIP back on", v22, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    +[RegisterAction deleteRegisterDigestForAccount:](RegisterAction, "deleteRegisterDigestForAccount:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    objc_msgSend(v8, "setUnregisterState:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider accountStore](self, "accountStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    objc_msgSend(v9, "saveAccount:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v12 = objc_msgSend(v11, "fmipDisableContext");
    if ((unint64_t)v12 <= 1)
      v13 = 1;
    else
      v13 = (uint64_t)v12;
    -[FMDFMIPServiceProvider _showUnregisterDeviceErrorForResponseError:inContext:](self, "_showUnregisterDeviceErrorForResponseError:inContext:", 2, v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider unregisterTokenStore](self, "unregisterTokenStore"));
  objc_msgSend(v14, "clearUnregisterTokens");

  -[FMDFMIPServiceProvider registerCommonNotifications](self, "registerCommonNotifications");
  -[FMDFMIPServiceProvider synchronizeLocalActivationLockState](self, "synchronizeLocalActivationLockState");
  v15 = objc_alloc_init(FMDDetachNotificationManager);
  -[FMDFMIPServiceProvider setDetachNotificationManager:](self, "setDetachNotificationManager:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryRegistry](self, "accessoryRegistry"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider detachNotificationManager](self, "detachNotificationManager"));
  objc_msgSend(v16, "registerDelegate:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider supportedAccessoryRegistry](self, "supportedAccessoryRegistry"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider detachNotificationManager](self, "detachNotificationManager"));
  objc_msgSend(v19, "setSupportedAccessoryRegistry:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider accessoryLocationStore](self, "accessoryLocationStore"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider detachNotificationManager](self, "detachNotificationManager"));
  objc_msgSend(v21, "setLocationStore:", v20);

}

- (void)willMakeProviderInactive
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDFMIPServiceProvider;
  -[FMDDeviceActionsServiceProvider willMakeProviderInactive](&v6, "willMakeProviderInactive");
  -[FMDFMIPServiceProvider deregisterCommonNotifications](self, "deregisterCommonNotifications");
  -[FMDFMIPServiceProvider stopMonitoringPendingDeviceIdentity](self, "stopMonitoringPendingDeviceIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider deviceIdentityPendingXpcTransactionName](self, "deviceIdentityPendingXpcTransactionName"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider deviceIdentityPendingXpcTransactionName](self, "deviceIdentityPendingXpcTransactionName"));
    objc_msgSend(v4, "endTransaction:", v5);

    -[FMDFMIPServiceProvider setDeviceIdentityPendingXpcTransactionName:](self, "setDeviceIdentityPendingXpcTransactionName:", 0);
  }
}

- (void)registerCommonNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "systemShutdownSoon:", CFSTR("FMDSystemShutdownSoonNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "locationServiceAuthorizationChanged:", CFSTR("FMDLocationServiceAuthorizationChangedNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_deviceDidPair:", CFSTR("nano.devicedidpair"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_deviceDidUnpair:", CFSTR("nano.devicedidunpair"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_activeWatchDidChange", CFSTR("nano.watchdidbecomeactive"), 0);

  v8.receiver = self;
  v8.super_class = (Class)FMDFMIPServiceProvider;
  -[FMDDeviceActionsServiceProvider registerCommonNotifications](&v8, "registerCommonNotifications");
}

- (void)deregisterCommonNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("FMDSystemShutdownSoonNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("FMDLocationServiceAuthorizationChangedNotification"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("nano.devicedidpair"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("nano.devicedidunpair"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("nano.watchdidbecomeactive"), 0);

  v8.receiver = self;
  v8.super_class = (Class)FMDFMIPServiceProvider;
  -[FMDDeviceActionsServiceProvider deregisterCommonNotifications](&v8, "deregisterCommonNotifications");
}

- (id)alertActionInfoForAction:(id)a3 andURL:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  unsigned int v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];

  v5 = a3;
  v6 = (__CFString *)a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("appleid")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT")));
    v19[0] = CFSTR("url");
    v19[1] = CFSTR("sensitive");
    v20[0] = v7;
    v20[1] = &__kCFBooleanTrue;
    v8 = v20;
    v9 = v19;
LABEL_10:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v9, 2));

    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("settings")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE")));
    v17[0] = CFSTR("url");
    v17[1] = CFSTR("sensitive");
    v18[0] = v7;
    v18[1] = &__kCFBooleanTrue;
    v8 = v18;
    v9 = v17;
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("fmip-settings")))
  {

    v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/DEVICE_LOCATOR");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/DEVICE_LOCATOR")));
    v15[0] = CFSTR("url");
    v15[1] = CFSTR("sensitive");
    v16[0] = v7;
    v16[1] = &__kCFBooleanTrue;
    v8 = v16;
    v9 = v15;
    goto LABEL_10;
  }
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("open-url"));
  v11 = 0;
  if (v6 && v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v13[0] = CFSTR("url");
    v13[1] = CFSTR("sensitive");
    v14[0] = v7;
    v14[1] = &__kCFBooleanFalse;
    v8 = v14;
    v9 = v13;
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

- (void)accountRemoveRequestedWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v6 = objc_msgSend(v5, "unregisterState");

  if (v6 == (id)1)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending unregister because account state changed to UnregisterPending", buf, 2u);
    }

    -[FMDServiceProvider makeProviderInactive](self, "makeProviderInactive");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    +[RegisterAction deleteRegisterDigestForAccount:](RegisterAction, "deleteRegisterDigestForAccount:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDeviceActionsServiceProvider locationTracker](self, "locationTracker"));
    objc_msgSend(v10, "deleteLocationTrackingInfoAndStopTracking");

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100046C0C;
    v13[3] = &unk_1002C30E0;
    v13[4] = self;
    v14 = v4;
    -[FMDFMIPServiceProvider unregisterDeviceWithCompletion:](self, "unregisterDeviceWithCompletion:", v13);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDMagSafeDataStore sharedInstance](FMDMagSafeDataStore, "sharedInstance"));
    objc_msgSend(v11, "clearDataStore");

    v12.receiver = self;
    v12.super_class = (Class)FMDFMIPServiceProvider;
    -[FMDDeviceActionsServiceProvider accountRemoveRequestedWithCompletion:](&v12, "accountRemoveRequestedWithCompletion:", v4);
  }

}

- (void)checkShutdownSoonRegistration
{
  void *v3;
  _QWORD *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  __CFString *v10;
  id v11;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  if (objc_msgSend(v3, "lowBatteryLocateEnabled"))
  {
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100046E0C;
    v9[3] = &unk_1002C11E8;
    objc_copyWeak(&v11, &location);
    v10 = CFSTR("com.apple.DuetHeuristic-BM.shutdowsoon");
    v4 = objc_retainBlock(v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance"));
    v6 = objc_msgSend(v5, "isHandlerRegisteredForDarwinNotification:", CFSTR("com.apple.DuetHeuristic-BM.shutdowsoon"));

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance"));
      objc_msgSend(v7, "registerHandler:forDarwinNotification:", v4, CFSTR("com.apple.DuetHeuristic-BM.shutdowsoon"));

    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCNotificationsUtil sharedInstance](FMXPCNotificationsUtil, "sharedInstance"));
    objc_msgSend(v8, "deregisterHandlerForDarwinNotification:", CFSTR("com.apple.DuetHeuristic-BM.shutdowsoon"));

  }
  -[FMDFMIPServiceProvider syncFMIPStateToWatch](self, "syncFMIPStateToWatch");

}

- (void)tryToFetchAuthToken
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider authTokenHealingQueue](self, "authTokenHealingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047104;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v3, block);

}

- (unsigned)essentialServerInfoMissingError
{
  FMDFMIPServiceProvider *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1196379972;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider authTokenHealingQueue](self, "authTokenHealingQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100047254;
  v5[3] = &unk_1002C11C0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)sendDeviceIdentity:(int64_t)a3
{
  FMDIdentityInfo *v4;

  v4 = -[FMDIdentityInfo initWithVersion:]([FMDIdentityInfo alloc], "initWithVersion:", a3);
  -[FMDFMIPServiceProvider sendDeviceIdentityWithIdentityInfo:](self, "sendDeviceIdentityWithIdentityInfo:", v4);

}

- (void)sendDeviceIdentityWithIdentityInfo:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (-[FMDFMIPServiceProvider isMonitoringPendingDeviceIdentity](self, "isMonitoringPendingDeviceIdentity"))
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Already waiting to send deviceIdentity", v7, 2u);
    }

  }
  else
  {
    -[FMDFMIPServiceProvider sendDeviceIdentityIfEligibleWithIdentityInfo:](self, "sendDeviceIdentityIfEligibleWithIdentityInfo:", v4);
  }

}

- (void)_sendDeviceIdentityNowWithIdentityInfo:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  FMDRequestIdentityV5 *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = -[FMDFMIPServiceProvider essentialServerInfoMissingError](self, "essentialServerInfoMissingError");
  if ((_DWORD)v5 != 1196379972)
  {
    v9 = v5;
    v10 = sub_1000031B8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFourCC:](NSString, "stringWithFourCC:", v9));
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not sending device identity to server since some essential server info is missing - '%@'", buf, 0xCu);

    }
    -[FMDFMIPServiceProvider tryToFetchAuthToken](self, "tryToFetchAuthToken");
    v8 = (FMDRequestIdentityV5 *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider accountStore](self, "accountStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    -[FMDRequestIdentityV5 saveAccount:](v8, "saveAccount:", v13);

    goto LABEL_7;
  }
  +[FMPreferencesUtil removeKey:inDomain:](FMPreferencesUtil, "removeKey:inDomain:", CFSTR("identityVersion"), kFMDNotBackedUpPrefDomain);
  +[FMPreferencesUtil synchronizeDomain:](FMPreferencesUtil, "synchronizeDomain:", kFMDNotBackedUpPrefDomain);
  v6 = (unint64_t)objc_msgSend(v4, "version");
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v7 = v6;
    v8 = -[FMDRequestIdentityV5 initWithProvider:identityInfo:]([FMDRequestIdentityV5 alloc], "initWithProvider:identityInfo:", self, v4);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100047554;
    v14[3] = &unk_1002C3108;
    v14[4] = self;
    v14[5] = v7;
    -[FMDRequest setCompletionHandler:](v8, "setCompletionHandler:", v14);
    -[FMDServiceProvider enqueueRequest:](self, "enqueueRequest:", v8);
LABEL_7:

  }
}

- (void)registerDeviceWithCause:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v8 = objc_msgSend(v7, "unregisterState");

  if (!v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)FMDFMIPServiceProvider;
    -[FMDServiceProvider registerDeviceWithCause:force:](&v9, "registerDeviceWithCause:force:", v6, v4);
  }

}

- (void)registerDidSucceed
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDFMIPServiceProvider;
  -[FMDServiceProvider registerDidSucceed](&v4, "registerDidSucceed");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  objc_msgSend(v3, "setLastLoggedInDsid:", 0);

}

- (void)disableLocationDisplayWithCompletion:(id)a3
{
  id v4;
  FMDDisableLocationDisplayRequest *v5;
  void *v6;
  FMDDisableLocationDisplayRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  FMDActingRequestDecorator *v11;
  id v12;
  FMDActingRequestDecorator *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;

  v4 = a3;
  v5 = [FMDDisableLocationDisplayRequest alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v7 = -[FMDDisableLocationDisplayRequest initWithAccount:](v5, "initWithAccount:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[ServerDeviceInfo sharedInstance](ServerDeviceInfo, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceInfoForAccount:", v9));

  v11 = [FMDActingRequestDecorator alloc];
  v20[4] = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100047BAC;
  v21[3] = &unk_1002C1D20;
  v22 = v10;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100047BB4;
  v20[3] = &unk_1002C1D20;
  v12 = v10;
  v13 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v11, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C3128, v21, 0, v20);
  -[FMDRequest setDecorator:](v7, "setDecorator:", v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100047C28;
  v18[3] = &unk_1002C1130;
  v19 = v4;
  v14 = v4;
  -[FMDRequest setCompletionHandler:](v7, "setCompletionHandler:", v18);
  v15 = sub_1000532DC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDisableLocationDisplayRequest fm_logID](v7, "fm_logID"));
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: sending request to disable locations.", buf, 0xCu);

  }
  -[FMDServiceProvider enqueueRequest:](self, "enqueueRequest:", v7);

}

- (void)deviceEligibleForRepairWithContext:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD);
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  id v12;
  id v13;
  NSMutableArray *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  id v18;
  id v19;
  __int16 v20;
  __int16 v21;
  __int16 v22;

  v5 = (void (**)(id, id, _QWORD))a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "repairDeviceMode");
  if (v7 == (id)2)
  {
    v12 = sub_1000531FC();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v21 = 0;
    v10 = "deviceEligibleForRepairWithContext for trade in mode";
    v11 = (uint8_t *)&v21;
  }
  else if (v7 == (id)1)
  {
    v8 = sub_1000531FC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v22 = 0;
    v10 = "deviceEligibleForRepairWithContext for repairMode";
    v11 = (uint8_t *)&v22;
  }
  else
  {
    v13 = sub_1000531FC();
    v9 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v20 = 0;
    v10 = "deviceEligibleForRepairWithContext for unknown";
    v11 = (uint8_t *)&v20;
  }
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
LABEL_10:

  v14 = objc_opt_new(NSMutableArray);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchIdentifiers"));

  v16 = FMDRepairDeviceThisDeviceIdentifier;
  v17 = objc_msgSend(v15, "containsObject:", FMDRepairDeviceThisDeviceIdentifier);

  if (v17)
  {
    v18 = objc_msgSend(objc_alloc((Class)FMDRepairDevice), "initWithClientIdentifier:isThisDevice:", v16, 1);
    -[NSMutableArray addObject:](v14, "addObject:", v18);

  }
  v19 = objc_msgSend(objc_alloc((Class)FMDRepairDeviceResult), "initWithEligibleDevices:devicesInRepairMode:", v14, &__NSArray0__struct);
  v5[2](v5, v19, 0);

}

- (void)enableRepairWithContext:(id)a3 callingClient:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  FMDFMIPServiceProvider *v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "repairDeviceMode");
  if (v11 == (id)2)
  {
    v15 = sub_1000531FC();
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v14 = "enableRepairWithContext for trade in mode";
  }
  else if (v11 == (id)1)
  {
    v12 = sub_1000531FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v14 = "enableRepairWithContext for repairMode";
  }
  else
  {
    v16 = sub_1000531FC();
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v14 = "deviceEligibleForRepairWithContext for unknown";
  }
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
LABEL_10:

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ephemeralToken"));
  if (v17)
  {
    v18 = sub_1000531FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Got ephemeral token for repair device.", buf, 2u);
    }

    -[FMDFMIPServiceProvider _enableRepairWithContext:callingClient:completion:](self, "_enableRepairWithContext:callingClient:completion:", v8, v9, v10);
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100048308;
    v20[3] = &unk_1002C3150;
    v24 = v10;
    v21 = v8;
    v22 = self;
    v23 = v9;
    -[FMDFMIPServiceProvider ephemeralTokenForUserWithCompletion:](self, "ephemeralTokenForUserWithCompletion:", v20);

  }
}

- (void)_enableRepairWithContext:(id)a3 callingClient:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  id v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  FMDActingRequestDecorator *v22;
  id v23;
  FMDActingRequestDecorator *v24;
  void *v25;
  void *v26;
  FMDRepairDeviceRequest *v27;
  void *v28;
  void *v29;
  FMDActingRequestDecorator *v30;
  void *v31;
  id v32;
  FMDRepairDeviceRequest *v33;
  void *v34;
  FMDRepairDeviceRequest *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[16];
  _QWORD v47[5];
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  NSErrorUserInfoKey v54;
  FMDRepairDeviceRequest *v55;
  NSErrorUserInfoKey v56;
  id v57;
  _BYTE v58[128];

  v8 = a3;
  v45 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = objc_alloc_init((Class)FMDRepairDevice);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedDevices"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v51;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v16);
      v14 |= objc_msgSend(v17, "isThisDevice");
      if (objc_msgSend(v17, "isThisDevice"))
        break;
      if (v13 == (id)++v16)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v13)
          goto LABEL_3;

        if ((v14 & 1) == 0)
          goto LABEL_17;
LABEL_12:
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[ServerDeviceInfo sharedInstance](ServerDeviceInfo, "sharedInstance"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "deviceInfoForAccount:", v20));

        v22 = [FMDActingRequestDecorator alloc];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1000488D8;
        v48[3] = &unk_1002C1D20;
        v23 = v21;
        v49 = v23;
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_1000488E0;
        v47[3] = &unk_1002C1D20;
        v47[4] = self;
        v24 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v22, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C3170, v48, 0, v47);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dsid"));

        if (v26)
        {
          v27 = [FMDRepairDeviceRequest alloc];
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
          v29 = v26;
          v30 = v24;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ephemeralToken"));
          v32 = objc_msgSend(v8, "repairDeviceMode");
          v33 = v27;
          v44 = v29;
          v34 = v45;
          v35 = -[FMDRepairDeviceRequest initWithDeviceIdentifier:ephemeralToken:dsid:callingClient:mode:](v33, "initWithDeviceIdentifier:ephemeralToken:dsid:callingClient:mode:", v28, v31, v29, v45, v32);

          v24 = v30;
          -[FMDRequest setDecorator:](v35, "setDecorator:", v30);
          -[FMDFMIPServiceProvider setCompletionHandlerForRepairDeviceRequest:thisDevice:completion:](self, "setCompletionHandlerForRepairDeviceRequest:thisDevice:completion:", v35, v10, v9);
          v36 = sub_1000531FC();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Sending request to repair device.", buf, 2u);
          }

          -[FMDServiceProvider enqueueRequest:](self, "enqueueRequest:", v35);
          v26 = v44;
        }
        else
        {
          v35 = (FMDRepairDeviceRequest *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("dsid is nil")));
          v41 = kFMDErrorDomain;
          v54 = NSLocalizedFailureReasonErrorKey;
          v55 = v35;
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v41, 5, v42));
          v9[2](v9, 0, v43);

          v34 = v45;
        }

        v39 = v49;
        goto LABEL_20;
      }
    }
    v18 = v17;

    v10 = v18;
    if ((v14 & 1) == 0)
      goto LABEL_17;
    goto LABEL_12;
  }

LABEL_17:
  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Request is not for the current device")));
  v38 = kFMDErrorDomain;
  v56 = NSLocalizedFailureReasonErrorKey;
  v57 = v23;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v38, 0, v39));
  v9[2](v9, 0, v40);

  v34 = v45;
LABEL_20:

}

- (void)setCompletionHandlerForRepairDeviceRequest:(id)a3 thisDevice:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000489F8;
  v9[3] = &unk_1002C3198;
  v10 = a4;
  v11 = a5;
  v7 = v10;
  v8 = v11;
  objc_msgSend(a3, "setCompletionHandler:", v9);

}

- (void)ephemeralTokenForUserWithCompletion:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[8];
  NSErrorUserInfoKey v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  v6 = objc_msgSend(v5, "isInternalBuild");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    if (v7)
    {
      v8 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "setIsUsernameEditable:", 0);
        objc_msgSend(v9, "setShouldPromptForPasswordOnly:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "username"));
        objc_msgSend(v9, "setUsername:", v11);

        objc_msgSend(v9, "setDefaultButtonString:", CFSTR("Default Button Text"));
        objc_msgSend(v9, "setIsEphemeral:", 1);
        objc_msgSend(v9, "setAuthenticationType:", 2);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000490B4;
        v22[3] = &unk_1002C31C0;
        v23 = v4;
        objc_msgSend(v7, "authenticateWithContext:completion:", v9, v22);
        v12 = v23;
      }
      else
      {
        v19 = sub_1000031B8();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to instantiate authContext", buf, 2u);
        }

        v21 = objc_alloc((Class)NSError);
        v12 = objc_msgSend(v21, "initWithDomain:code:userInfo:", kFMDErrorDomain, 5, 0);
        (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v12);
      }

    }
    else
    {
      v16 = sub_1000031B8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to instantiate authController", buf, 2u);
      }

      v18 = objc_alloc((Class)NSError);
      v9 = objc_msgSend(v18, "initWithDomain:code:userInfo:", kFMDErrorDomain, 5, 0);
      (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v9);
    }

  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot find an ephemeral token, please provide one")));
    v13 = kFMDErrorDomain;
    v25 = NSLocalizedFailureReasonErrorKey;
    v26 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, 4, v14));
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v15);

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)disableFMIPForPairedDeviceWithUDID:(id)a3 account:(id)a4 andCompletion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  FMDFMIPUnregisterDeviceInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  FMDRequestFMIPUnregister *v44;
  FMDFMIPServiceProvider *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  FMDFMIPServiceProvider *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  NSErrorUserInfoKey v56;
  const __CFString *v57;
  _BYTE v58[128];

  v45 = self;
  v7 = a3;
  v47 = a4;
  v46 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry pairedDevicesSelectorBlock](NRPairedDeviceRegistry, "pairedDevicesSelectorBlock"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v9));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v53;
    v15 = NRDevicePropertyIsPaired;
    v16 = NRDevicePropertyUDID;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v14)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForProperty:", v15, v45));
      v20 = objc_msgSend(v19, "BOOLValue");

      if (v7)
      {
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForProperty:", v16));
          v22 = objc_msgSend(v7, "isEqualToString:", v21);

          if ((v22 & 1) != 0)
            break;
        }
      }
      if (v13 == (id)++v17)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    v23 = v18;

    if (!v23)
      goto LABEL_15;
    v24 = objc_alloc_init(FMDFMIPUnregisterDeviceInfo);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", v16));
    -[FMDFMIPUnregisterDeviceInfo setUdid:](v24, "setUdid:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertySerialNumber));
    -[FMDFMIPUnregisterDeviceInfo setSerialNumber:](v24, "setSerialNumber:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertyProductType));
    -[FMDFMIPUnregisterDeviceInfo setProductType:](v24, "setProductType:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertyPairingID));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));
    -[FMDFMIPUnregisterDeviceInfo setPairingId:](v24, "setPairingId:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("productVersionOverride"), kFMDNotBackedUpPrefDomain));
    v32 = v46;
    v31 = v47;
    if (v30)
    {
      -[FMDFMIPUnregisterDeviceInfo setProductVersion:](v24, "setProductVersion:", v30);
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertySystemVersion));
      -[FMDFMIPUnregisterDeviceInfo setProductVersion:](v24, "setProductVersion:", v42);

    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertySystemBuildVersion));
    -[FMDFMIPUnregisterDeviceInfo setBuildVersion:](v24, "setBuildVersion:", v43);

    -[FMDFMIPUnregisterDeviceInfo setDisableContext:](v24, "setDisableContext:", 5);
    v44 = -[FMDRequestFMIPUnregister initWithAccount:device:otherDevices:]([FMDRequestFMIPUnregister alloc], "initWithAccount:device:otherDevices:", v47, v24, 0);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10004964C;
    v48[3] = &unk_1002C31E8;
    v49 = v7;
    v50 = v45;
    v51 = v46;
    -[FMDRequest setCompletionHandler:](v44, "setCompletionHandler:", v48);
    -[FMDServiceProvider enqueueRequest:account:](v45, "enqueueRequest:account:", v44, v47);

    goto LABEL_21;
  }
LABEL_11:

LABEL_15:
  v33 = sub_1000031B8();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  v32 = v46;
  v31 = v47;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    sub_100228CC4((uint64_t)v7, v34, v35, v36, v37, v38, v39, v40);

  if (v46)
  {
    v41 = kFMDErrorDomain;
    v56 = NSLocalizedFailureReasonErrorKey;
    v57 = CFSTR("No paired device with this UDID");
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
    v24 = (FMDFMIPUnregisterDeviceInfo *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v41, 1, v23));
    (*((void (**)(id, FMDFMIPUnregisterDeviceInfo *))v46 + 2))(v46, v24);
LABEL_21:

  }
}

- (void)unregisterDeviceWithCompletion:(id)a3
{
  FMDFMIPUnregisterDeviceInfo *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  FMDFMIPUnregisterDeviceInfo *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  FMDRequestFMIPUnregister *v41;
  void *v42;
  FMDRequestFMIPUnregister *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  FMDFMIPUnregisterDeviceInfo *v51;
  _QWORD v52[4];
  id v53;
  FMDFMIPServiceProvider *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];

  v50 = a3;
  v4 = objc_alloc_init(FMDFMIPUnregisterDeviceInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceUDID"));
  -[FMDFMIPUnregisterDeviceInfo setUdid:](v4, "setUdid:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internationalMobileEquipmentIdentity"));
  -[FMDFMIPUnregisterDeviceInfo setImei:](v4, "setImei:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "internationalMobileEquipmentIdentityTwo"));
  -[FMDFMIPUnregisterDeviceInfo setImei2:](v4, "setImei2:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mobileEquipmentIdentifier"));
  -[FMDFMIPUnregisterDeviceInfo setMeid:](v4, "setMeid:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serialNumber"));
  -[FMDFMIPUnregisterDeviceInfo setSerialNumber:](v4, "setSerialNumber:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "productType"));
  -[FMDFMIPUnregisterDeviceInfo setProductType:](v4, "setProductType:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "productVersion"));
  -[FMDFMIPUnregisterDeviceInfo setProductVersion:](v4, "setProductVersion:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "buildVersion"));
  -[FMDFMIPUnregisterDeviceInfo setBuildVersion:](v4, "setBuildVersion:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v51 = v4;
  -[FMDFMIPUnregisterDeviceInfo setDisableContext:](v4, "setDisableContext:", objc_msgSend(v21, "fmipDisableContext"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[FMDCompanionRegistryFactory companionRegistryWithDelegate:](FMDCompanionRegistryFactory, "companionRegistryWithDelegate:", 0));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allAccessories"));

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v31 = objc_alloc_init(FMDFMIPUnregisterDeviceInfo);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "udid"));
        -[FMDFMIPUnregisterDeviceInfo setUdid:](v31, "setUdid:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "serialNumber"));
        -[FMDFMIPUnregisterDeviceInfo setSerialNumber:](v31, "setSerialNumber:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "productType"));
        -[FMDFMIPUnregisterDeviceInfo setProductType:](v31, "setProductType:", v34);

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "productVersion"));
        -[FMDFMIPUnregisterDeviceInfo setProductVersion:](v31, "setProductVersion:", v35);

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "buildVersion"));
        -[FMDFMIPUnregisterDeviceInfo setBuildVersion:](v31, "setBuildVersion:", v36);

        -[FMDFMIPUnregisterDeviceInfo setPaired:](v31, "setPaired:", objc_msgSend(v30, "paired"));
        -[FMDFMIPUnregisterDeviceInfo setMigrationConfirmed:](v31, "setMigrationConfirmed:", objc_msgSend(v30, "migrationPossible"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
        -[FMDFMIPUnregisterDeviceInfo setDisableContext:](v31, "setDisableContext:", objc_msgSend(v37, "fmipDisableContext"));

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pairingId"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "UUIDString"));
        -[FMDFMIPUnregisterDeviceInfo setPairingId:](v31, "setPairingId:", v39);

        objc_msgSend(v22, "addObject:", v31);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    }
    while (v27);
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v41 = [FMDRequestFMIPUnregister alloc];
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v43 = -[FMDRequestFMIPUnregister initWithAccount:device:otherDevices:](v41, "initWithAccount:device:otherDevices:", v42, v51, v22);

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10004A314;
  v52[3] = &unk_1002C31E8;
  v44 = v40;
  v53 = v44;
  v54 = self;
  v45 = v50;
  v55 = v45;
  -[FMDRequest setCompletionHandler:](v43, "setCompletionHandler:", v52);
  v46 = objc_msgSend(v44, "unregisterState");
  objc_msgSend(v44, "setUnregisterState:", 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider accountStore](self, "accountStore"));
  objc_msgSend(v47, "saveAccount:", v44);

  if (!-[FMDServiceProvider enqueueRequest:](self, "enqueueRequest:", v43))
  {
    objc_msgSend(v44, "setUnregisterState:", v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider accountStore](self, "accountStore"));
    objc_msgSend(v48, "saveAccount:", v44);

    if (v45)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.findmydeviced.fmipunregister"), 2, 0));
      (*((void (**)(id, void *))v45 + 2))(v45, v49);

    }
  }

}

- (void)markPairedDeviceWithUdid:(id)a3 asMissingUsingToken:(id)a4 withCompletion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  FMDFMIPMissingDeviceInfo *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  FMDRequestMissingDevice *v42;
  void *v43;
  FMDRequestMissingDevice *v44;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;
  _BYTE v56[128];

  v7 = a3;
  v47 = a4;
  v46 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry pairedDevicesSelectorBlock](NRPairedDeviceRegistry, "pairedDevicesSelectorBlock"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v9));

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v51;
    v15 = NRDevicePropertyIsPaired;
    v16 = NRDevicePropertyUDID;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v14)
        objc_enumerationMutation(v11);
      v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForProperty:", v15));
      v20 = objc_msgSend(v19, "BOOLValue");

      if (v7)
      {
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForProperty:", v16));
          v22 = objc_msgSend(v7, "isEqualToString:", v21);

          if ((v22 & 1) != 0)
            break;
        }
      }
      if (v13 == (id)++v17)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    v23 = v18;

    if (!v23)
      goto LABEL_15;
    v24 = objc_alloc_init(FMDFMIPMissingDeviceInfo);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", v16));
    -[FMDFMIPMissingDeviceInfo setUdid:](v24, "setUdid:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertySerialNumber));
    -[FMDFMIPMissingDeviceInfo setSerialNumber:](v24, "setSerialNumber:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertyProductType));
    -[FMDFMIPMissingDeviceInfo setProductType:](v24, "setProductType:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("productVersionOverride"), kFMDNotBackedUpPrefDomain));
    v29 = v47;
    if (v28)
    {
      -[FMDFMIPMissingDeviceInfo setProductVersion:](v24, "setProductVersion:", v28);
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertySystemVersion));
      -[FMDFMIPMissingDeviceInfo setProductVersion:](v24, "setProductVersion:", v40);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "valueForProperty:", NRDevicePropertySystemBuildVersion));
    -[FMDFMIPMissingDeviceInfo setBuildVersion:](v24, "setBuildVersion:", v41);

    v42 = [FMDRequestMissingDevice alloc];
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v44 = -[FMDRequestMissingDevice initWithAccount:token:andMissingDeviceInfo:](v42, "initWithAccount:token:andMissingDeviceInfo:", v43, v47, v24);

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10004B1C8;
    v48[3] = &unk_1002C3238;
    v48[4] = self;
    v38 = v46;
    v49 = v46;
    -[FMDRequest setCompletionHandler:](v44, "setCompletionHandler:", v48);
    -[FMDServiceProvider enqueueRequest:](self, "enqueueRequest:", v44);

    goto LABEL_21;
  }
LABEL_11:

LABEL_15:
  v30 = sub_1000031B8();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  v38 = v46;
  v29 = v47;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_100228CC4((uint64_t)v7, v31, v32, v33, v34, v35, v36, v37);

  if (v46)
  {
    v39 = kFMDErrorDomain;
    v54 = NSLocalizedFailureReasonErrorKey;
    v55 = CFSTR("No paired device with this UDID");
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    v24 = (FMDFMIPMissingDeviceInfo *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v39, 1, v23));
    (*((void (**)(id, FMDFMIPMissingDeviceInfo *))v46 + 2))(v46, v24);
LABEL_21:

  }
}

- (void)_showUnregisterDeviceErrorForResponseError:(int64_t)a3 inContext:(unint64_t)a4
{
  LocalizedUnregisterErrorKey *v6;
  void *v7;
  LocalizedUnregisterErrorKey *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = objc_alloc_init((Class)FMAlert);
  objc_msgSend(v19, "setCategory:", 1);
  v6 = [LocalizedUnregisterErrorKey alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v8 = -[LocalizedUnregisterErrorKey initWithUnregisterError:context:deviceClass:](v6, "initWithUnregisterError:context:deviceClass:", a3, a4, objc_msgSend(v7, "deviceClass"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey titleKey](v8, "titleKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey textKey](v8, "textKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey okButtonKey](v8, "okButtonKey"));
  v12 = sub_10002B040(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v19, "setMsgTitle:", v13);

  v14 = sub_10002B040(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v19, "setMsgText:", v15);

  v16 = sub_10002B040(v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v19, "setDefaultButtonTitle:", v17);

  objc_msgSend(v19, "setShowMsgInLockScreen:", 1);
  objc_msgSend(v19, "setDismissMsgOnUnlock:", 0);
  objc_msgSend(v19, "setDismissMsgOnLock:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
  objc_msgSend(v18, "activateAlert:", v19);

}

- (void)_showMarkAsMissingErrorForResponseError:(int64_t)a3
{
  LocalizedUnregisterErrorKey *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = objc_alloc_init((Class)FMAlert);
  objc_msgSend(v15, "setCategory:", 1);
  v4 = -[LocalizedUnregisterErrorKey initWithUnregisterError:context:deviceClass:]([LocalizedUnregisterErrorKey alloc], "initWithUnregisterError:context:deviceClass:", a3, 6, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey titleKey](v4, "titleKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey textKey](v4, "textKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey okButtonKey](v4, "okButtonKey"));
  v8 = sub_10002B040(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v15, "setMsgTitle:", v9);

  v10 = sub_10002B040(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v15, "setMsgText:", v11);

  v12 = sub_10002B040(v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v15, "setDefaultButtonTitle:", v13);

  objc_msgSend(v15, "setShowMsgInLockScreen:", 1);
  objc_msgSend(v15, "setDismissMsgOnUnlock:", 0);
  objc_msgSend(v15, "setDismissMsgOnLock:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
  objc_msgSend(v14, "activateAlert:", v15);

}

- (void)_showPairedDeviceDisableFMIPErrorForResponseError:(int64_t)a3
{
  LocalizedUnregisterErrorKey *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = objc_alloc_init((Class)FMAlert);
  objc_msgSend(v15, "setCategory:", 1);
  v4 = -[LocalizedUnregisterErrorKey initWithUnregisterError:context:deviceClass:]([LocalizedUnregisterErrorKey alloc], "initWithUnregisterError:context:deviceClass:", a3, 5, 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey titleKey](v4, "titleKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey textKey](v4, "textKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey okButtonKey](v4, "okButtonKey"));
  v8 = sub_10002B040(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v15, "setMsgTitle:", v9);

  v10 = sub_10002B040(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v15, "setMsgText:", v11);

  v12 = sub_10002B040(v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v15, "setDefaultButtonTitle:", v13);

  objc_msgSend(v15, "setShowMsgInLockScreen:", 1);
  objc_msgSend(v15, "setDismissMsgOnUnlock:", 0);
  objc_msgSend(v15, "setDismissMsgOnLock:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
  objc_msgSend(v14, "activateAlert:", v15);

}

- (void)didReceiveAuthFailureForRequest:(id)a3
{
  id v3;
  unsigned int v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDFMIPServiceProvider;
  v3 = a3;
  -[FMDServiceProvider didReceiveAuthFailureForRequest:](&v6, "didReceiveAuthFailureForRequest:", v3);
  v4 = objc_msgSend(v3, "showAuthFailedMessage", v6.receiver, v6.super_class);

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAppleAccountManager sharedInstance](FMDAppleAccountManager, "sharedInstance"));
    objc_msgSend(v5, "fixFMIPAuthTokenShouldForce:", 0);

  }
}

- (void)setPendingSecureMessage:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSecureMessage, a3);
  -[FMDFMIPServiceProvider _updateToHomescreenAlerts](self, "_updateToHomescreenAlerts");
}

- (void)setPendingLocateAlert:(id)a3
{
  objc_storeStrong((id *)&self->_pendingLocateAlert, a3);
  -[FMDFMIPServiceProvider _updateToHomescreenAlerts](self, "_updateToHomescreenAlerts");
}

- (void)_updateToHomescreenAlerts
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider device_unlock_actions_queue](self, "device_unlock_actions_queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004BBF8;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_showPendingHomescreenAlertNow
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider device_unlock_actions_queue](self, "device_unlock_actions_queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004BDB0;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_checkForBuddyCompletionAndReinitialize:(BOOL)a3 withBuddyStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;
  uint8_t buf[4];
  _BOOL4 v13;

  v4 = a4;
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Buddy complete? : %d", buf, 8u);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004BFB8;
  v9[3] = &unk_1002C3288;
  v10 = v4;
  v9[4] = self;
  v11 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)syncFMIPStateToWatch
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void **v17;
  const __CFString **v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  unsigned int v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  unsigned int v42;
  id v43;
  NSObject *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  id v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  unsigned int v54;
  void *v55;
  id v56;
  id v57;
  NSObject *v58;
  _BOOL4 v59;
  const __CFString *v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __CFString *v82;
  uint8_t v83[128];
  uint8_t buf[4];
  const __CFString *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  NSObject *v91;
  const __CFString *v92;
  void *v93;
  _QWORD v94[4];
  _QWORD v95[4];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking for changes in FMIP State to sync to the Watch...", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v6 = objc_msgSend(v5, "allowsActivationLock");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dsid"));

  v9 = -[FMDFMIPServiceProvider fmipState](self, "fmipState");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountAddTime"));
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
  v14 = objc_msgSend(v13, "lowBatteryLocateEnabled");

  v15 = &__kCFBooleanFalse;
  v67 = (void *)v12;
  if (v9 > 2)
  {
    v16 = (void *)v8;
    v92 = CFSTR("Enabled");
    v93 = &__kCFBooleanFalse;
    v17 = &v93;
    v18 = &v92;
    v19 = 1;
  }
  else
  {
    v94[0] = CFSTR("Enabled");
    v94[1] = CFSTR("AccountId");
    v95[0] = &__kCFBooleanTrue;
    v95[1] = v8;
    v16 = (void *)v8;
    v94[2] = CFSTR("AccountAddTime");
    v94[3] = CFSTR("LowBatteryLocateEnabled");
    if (v14)
      v15 = &__kCFBooleanTrue;
    v95[2] = v12;
    v95[3] = v15;
    v17 = (void **)v95;
    v18 = (const __CFString **)v94;
    v19 = 4;
  }
  v20 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v18, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  +[FMPreferencesUtil synchronizeDomain:](FMPreferencesUtil, "synchronizeDomain:", kFMDWatchNotBackedUpPrefDomain);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil objectForKey:inDomain:](FMPreferencesUtil, "objectForKey:inDomain:", CFSTR("FMIPInfo"), kFMDWatchNotBackedUpPrefDomain));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil objectForKey:inDomain:](FMPreferencesUtil, "objectForKey:inDomain:", CFSTR("ActivationLockAllowed"), kFMDWatchNotBackedUpPrefDomain));
  v66 = v22;
  if ((objc_msgSend(v22, "isEqual:", v20) & 1) == 0)
    objc_msgSend(v21, "addObject:", CFSTR("FMIPInfo"));
  if ((_DWORD)v6 != objc_msgSend(v70, "BOOLValue"))
    objc_msgSend(v21, "addObject:", CFSTR("ActivationLockAllowed"));
  v75 = (void *)v20;
  v68 = v16;
  v69 = v21;
  if (objc_msgSend(v21, "count"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v23, "timeIntervalSinceReferenceDate");
    v24 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    v25 = sub_1000031B8();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("Enabled")));
      v28 = objc_msgSend(v27, "BOOLValue");
      *(_DWORD *)buf = 134218754;
      v85 = (const __CFString *)v28;
      v86 = 2112;
      v87 = (uint64_t)v16;
      v88 = 2048;
      v89 = v6;
      v90 = 2112;
      v91 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Updating watch with fmipEnabled:%ld, fmipAccount:%@, activationLockAllowed:%ld, lastUpdated:%@...", buf, 0x2Au);

    }
    objc_msgSend(v69, "addObject:", CFSTR("LastUpdated"));
    +[FMPreferencesUtil setObject:forKey:inDomain:](FMPreferencesUtil, "setObject:forKey:inDomain:", v24, CFSTR("LastUpdated"), kFMDWatchNotBackedUpPrefDomain);
    +[FMPreferencesUtil setObject:forKey:inDomain:](FMPreferencesUtil, "setObject:forKey:inDomain:", v75, CFSTR("FMIPInfo"), kFMDWatchNotBackedUpPrefDomain);
    +[FMPreferencesUtil setBool:forKey:inDomain:](FMPreferencesUtil, "setBool:forKey:inDomain:", v6, CFSTR("ActivationLockAllowed"), kFMDWatchNotBackedUpPrefDomain);
    v29 = objc_alloc_init((Class)NPSManager);
    objc_msgSend(v29, "synchronizeUserDefaultsDomain:keys:", kFMDWatchNotBackedUpPrefDomain, v69);

  }
  else
  {
    v30 = sub_1000031B8();
    v24 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No changes in FMIP state. Nothing to be synced to the Watch", buf, 2u);
    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getPairedDevices"));

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v33 = v32;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v79;
    v77 = NRDevicePropertyIsPaired;
    v76 = NRDevicePropertySystemVersion;
    v71 = NRDevicePropertyLocalPairingDataStorePath;
    v72 = NRDevicePropertyPairingID;
    v73 = *(_QWORD *)v79;
    v74 = v33;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v79 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "valueForProperty:", v77));
        v40 = objc_msgSend(v39, "BOOLValue");

        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "valueForProperty:", v76));
          v42 = NRRawVersionFromString();

          v43 = sub_1000031B8();
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            v85 = (const __CFString *)HIWORD(v42);
            v86 = 2048;
            v87 = 3;
            _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Comparing paired version %ld to %ld", buf, 0x16u);
          }

          if (HIWORD(v42) <= 2u)
          {
            v45 = CFSTR("ShowFMWUpgradeAlert");
            if (CFSTR("ShowFMWUpgradeAlert"))
            {
              v46 = v45;
              v47 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "valueForProperty:", v72));
              v48 = sub_1000031B8();
              v49 = objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v85 = v47;
                v86 = 2112;
                v87 = (uint64_t)CFSTR("ShowFMWUpgradeAlert");
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Found old paired device with pairing ID %@. Checking if upgrade alert state needs to be synced for %@...", buf, 0x16u);
              }

              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "valueForProperty:", v71));
              v51 = objc_alloc((Class)NPSDomainAccessor);
              v52 = objc_msgSend(v51, "initWithDomain:pairingID:pairingDataStore:", kFMDWatchNotBackedUpPrefDomain, v47, v50);
              v53 = objc_msgSend(v52, "synchronize");
              v54 = objc_msgSend(v52, "BOOLForKey:", v46);
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("Enabled")));
              v56 = objc_msgSend(v55, "BOOLValue");

              v57 = sub_1000031B8();
              v58 = objc_claimAutoreleasedReturnValue(v57);
              v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
              if (v54 == (_DWORD)v56)
              {
                if (v59)
                {
                  v65 = CFSTR("Don't Show");
                  if ((_DWORD)v56)
                    v65 = CFSTR("Show");
                  *(_DWORD *)buf = 138412290;
                  v85 = v65;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Upgrade alert state is already in sync : '%@'", buf, 0xCu);
                }
              }
              else
              {
                if (v59)
                {
                  *(_DWORD *)buf = 138412546;
                  v60 = CFSTR("Don't Show");
                  if ((_DWORD)v56)
                    v60 = CFSTR("Show");
                  v85 = CFSTR("ShowFMWUpgradeAlert");
                  v86 = 2112;
                  v87 = (uint64_t)v60;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Syncing %@ upgrade alert state : '%@'", buf, 0x16u);
                }

                objc_msgSend(v52, "setBool:forKey:", v56, v46);
                v61 = objc_msgSend(v52, "synchronize");
                v58 = objc_opt_new(NPSManager);
                v62 = kFMDWatchNotBackedUpPrefDomain;
                v82 = v46;
                v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1));
                v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v63));
                -[NSObject synchronizeNanoDomain:keys:](v58, "synchronizeNanoDomain:keys:", v62, v64);

              }
              v33 = v74;

              v36 = v73;
            }
          }
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
    }
    while (v35);
  }

}

- (void)synchronizeLocalActivationLockState
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CB6C;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_enqueueIdentityOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider fm_logID](self, "fm_logID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("identityOperation-%@"), v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v7, "beginTransaction:", v6);

  v8 = objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider identity_wait_queue](self, "identity_wait_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CD48;
  block[3] = &unk_1002C16D8;
  v12 = v6;
  v13 = v4;
  v9 = v6;
  v10 = v4;
  dispatch_async(v8, block);

}

- (BOOL)_canSendDeviceIdentityNow
{
  id v2;
  unsigned int v3;
  BOOL v4;
  id v5;
  NSObject *v6;

  if (!+[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("MustBackgroundSettings"), kFMDNotBackedUpPrefDomain))return 1;
  v2 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  v3 = objc_msgSend(v2, "applicationStateForApplication:", CFSTR("com.apple.Preferences"));
  objc_msgSend(v2, "invalidate");
  v4 = v3 != 8;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100228DE0(v3 != 8, v6);

  return v4;
}

- (void)sendDeviceIdentityIfEligibleWithIdentityInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004CF20;
  v6[3] = &unk_1002C11E8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[FMDFMIPServiceProvider _enqueueIdentityOperation:](self, "_enqueueIdentityOperation:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_serialQueue_sendDeviceIdentityIfEligibleWithIdentityInfo:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[2];
  __int16 v16;

  v4 = a3;
  if (-[FMDFMIPServiceProvider isMonitoringPendingDeviceIdentity](self, "isMonitoringPendingDeviceIdentity"))
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v7 = "Already monitoring for the right time to send a deviceIdentity request.";
      v8 = (uint8_t *)&v16;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v10 = objc_msgSend(v9, "allowsActivationLock");

  if ((v10 & 1) == 0)
  {
    v11 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Not sending a deviceIdentity request because activation lock is not allowed.";
      v8 = buf;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (-[FMDFMIPServiceProvider _canSendDeviceIdentityNow](self, "_canSendDeviceIdentityNow"))
  {
    -[FMDFMIPServiceProvider _sendDeviceIdentityNowWithIdentityInfo:](self, "_sendDeviceIdentityNowWithIdentityInfo:", v4);
  }
  else
  {
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cannot send a deviceIdentity request now. Will wait for the right moment", v14, 2u);
    }

    -[FMDFMIPServiceProvider monitorAndSendDeviceIdentityLaterWithIdentityInfo:](self, "monitorAndSendDeviceIdentityLaterWithIdentityInfo:", v4);
  }
LABEL_11:

}

- (void)monitorAndSendDeviceIdentityLaterWithIdentityInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DeviceIdentityPending-%lX"), self));
  -[FMDFMIPServiceProvider setDeviceIdentityPendingXpcTransactionName:](self, "setDeviceIdentityPendingXpcTransactionName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider deviceIdentityPendingXpcTransactionName](self, "deviceIdentityPendingXpcTransactionName"));
  objc_msgSend(v6, "beginTransaction:", v7);

  -[FMDFMIPServiceProvider setIsMonitoringPendingDeviceIdentity:](self, "setIsMonitoringPendingDeviceIdentity:", 1);
  v8 = objc_alloc((Class)BKSApplicationStateMonitor);
  v9 = objc_msgSend(v8, "initWithBundleIDs:states:", &off_1002D8EE8, BKSApplicationStateAll);
  -[FMDFMIPServiceProvider setPendingDeviceIdentityMonitor:](self, "setPendingDeviceIdentityMonitor:", v9);

  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004D238;
  v12[3] = &unk_1002C32B0;
  objc_copyWeak(&v14, &location);
  v10 = v4;
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider pendingDeviceIdentityMonitor](self, "pendingDeviceIdentityMonitor"));
  objc_msgSend(v11, "setHandler:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)stopMonitoringPendingDeviceIdentity
{
  void *v3;
  void *v4;
  void *v5;

  if (-[FMDFMIPServiceProvider isMonitoringPendingDeviceIdentity](self, "isMonitoringPendingDeviceIdentity"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider pendingDeviceIdentityMonitor](self, "pendingDeviceIdentityMonitor"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider pendingDeviceIdentityMonitor](self, "pendingDeviceIdentityMonitor"));
      objc_msgSend(v4, "invalidate");

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider pendingDeviceIdentityMonitor](self, "pendingDeviceIdentityMonitor"));
      objc_msgSend(v5, "setHandler:", 0);

      -[FMDFMIPServiceProvider setPendingDeviceIdentityMonitor:](self, "setPendingDeviceIdentityMonitor:", 0);
    }
    -[FMDFMIPServiceProvider setIsMonitoringPendingDeviceIdentity:](self, "setIsMonitoringPendingDeviceIdentity:", 0);
  }
}

- (void)checkAndSendPendingDeviceIdentityWithIdentityInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004D464;
  v6[3] = &unk_1002C11E8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[FMDFMIPServiceProvider _enqueueIdentityOperation:](self, "_enqueueIdentityOperation:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_serialQueue_checkAndSendPendingDeviceIdentityWithIdentityInfo:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  const __CFString *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;

  v4 = a3;
  v5 = -[FMDFMIPServiceProvider _canSendDeviceIdentityNow](self, "_canSendDeviceIdentityNow");
  if (-[FMDFMIPServiceProvider isMonitoringPendingDeviceIdentity](self, "isMonitoringPendingDeviceIdentity") && v5)
  {
    -[FMDFMIPServiceProvider stopMonitoringPendingDeviceIdentity](self, "stopMonitoringPendingDeviceIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v7 = objc_msgSend(v6, "allowsActivationLock");

    if ((v7 & 1) != 0)
    {
      -[FMDFMIPServiceProvider _sendDeviceIdentityNowWithIdentityInfo:](self, "_sendDeviceIdentityNowWithIdentityInfo:", v4);
    }
    else
    {
      v13 = sub_1000031B8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not sending a deviceIdentity request because activation lock is not allowed.", (uint8_t *)&v17, 2u);
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider deviceIdentityPendingXpcTransactionName](self, "deviceIdentityPendingXpcTransactionName"));
    objc_msgSend(v15, "endTransaction:", v16);

    -[FMDFMIPServiceProvider setDeviceIdentityPendingXpcTransactionName:](self, "setDeviceIdentityPendingXpcTransactionName:", 0);
  }
  else
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[FMDFMIPServiceProvider isMonitoringPendingDeviceIdentity](self, "isMonitoringPendingDeviceIdentity");
      v11 = CFSTR("NO");
      if (v10)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v5)
        v11 = CFSTR("YES");
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not sending a deviceIdentity request... monitoring:%@, canSend:%@", (uint8_t *)&v17, 0x16u);
    }

  }
}

- (void)_buddyCompletionCheckTimerFired:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Buddy completion check timer fired", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v7 = objc_msgSend(v6, "isBuddyDone");

  -[FMDFMIPServiceProvider _checkForBuddyCompletionAndReinitialize:withBuddyStatus:](self, "_checkForBuddyCompletionAndReinitialize:withBuddyStatus:", 1, v7);
}

- (void)buddyDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Buddy completion notification received", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v7 = objc_msgSend(v6, "isBuddyDone");

  -[FMDFMIPServiceProvider _checkForBuddyCompletionAndReinitialize:withBuddyStatus:](self, "_checkForBuddyCompletionAndReinitialize:withBuddyStatus:", 1, v7);
}

- (void)_fmipStateChangeLocalNotification:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_time_t v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;

  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = 2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMIPStateChangeLocalNotification received. Will sync state to the watch after %llu seconds", buf, 0xCu);
  }

  v6 = dispatch_time(0, 2000000000);
  global_queue = dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D8C4;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_after(v6, v8, block);

}

- (void)systemShutdownSoon:(id)a3
{
  void *v4;
  unsigned int v5;
  FMDActingRequestDecorator *v6;
  QCAction *v7;
  void *v8;
  void *v9;
  QCAction *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t v14[8];
  _QWORD v15[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account", a3));
  v5 = objc_msgSend(v4, "lowBatteryLocateEnabled");

  if (v5)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004DA78;
    v15[3] = &unk_1002C1D20;
    v15[4] = self;
    v6 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:]([FMDActingRequestDecorator alloc], "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C32D0, v15, 0, 0);
    v7 = [QCAction alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider account](self, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDServiceProvider serverInteractionController](self, "serverInteractionController"));
    v10 = -[QCAction initWithAccount:shutdownActivityPending:serverInteractionController:](v7, "initWithAccount:shutdownActivityPending:serverInteractionController:", v8, 1, v9);

    -[QCAction setRequestDecorator:](v10, "setRequestDecorator:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
    v12 = objc_msgSend(v11, "enqueueAction:", v10);

  }
  else
  {
    v13 = sub_1000031B8();
    v6 = (FMDActingRequestDecorator *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_DEFAULT, "Received shutdown soon notification, but ignoring it since low battery locate is disabled", v14, 2u);
    }
  }

}

- (void)locationServiceAuthorizationChanged:(id)a3
{
  -[FMDFMIPServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("locationServiceAuthorizationChanged"), 0);
}

- (void)_deviceDidPair:(id)a3
{
  -[FMDFMIPServiceProvider syncFMIPStateToWatch](self, "syncFMIPStateToWatch", a3);
  -[FMDFMIPServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("deviceDidPair"), 0);
}

- (void)_deviceDidUnpair:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[FMDFMIPServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("deviceDidUnpair"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[FMDCompanionRegistryFactory companionRegistryWithDelegate:](FMDCompanionRegistryFactory, "companionRegistryWithDelegate:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFMIPServiceProvider unregisterTokenStore](self, "unregisterTokenStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allAccessories"));
  objc_msgSend(v4, "expungeUnregisterTokens:", v5);

}

- (void)_activeWatchDidChange
{
  -[FMDFMIPServiceProvider registerDeviceWithCause:force:](self, "registerDeviceWithCause:force:", CFSTR("ActiveWatchDidChange"), 0);
}

- (id)_unregisterDeviceErrorForResponseError:(int64_t)a3 inContext:(unint64_t)a4
{
  uint64_t v6;
  LocalizedUnregisterErrorKey *v7;
  void *v8;
  LocalizedUnregisterErrorKey *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v17;
  void *v18;

  if (a4 - 3 < 5)
  {
LABEL_2:
    v6 = 2 * ((a3 & 0x200) == 0);
    goto LABEL_3;
  }
  if (a4 != 2)
  {
    if (a4 != 1)
    {
      v6 = 2;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  if ((a3 & 0x200) != 0)
    v6 = 1;
  else
    v6 = 3;
LABEL_3:
  v7 = [LocalizedUnregisterErrorKey alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v9 = -[LocalizedUnregisterErrorKey initWithUnregisterError:context:deviceClass:](v7, "initWithUnregisterError:context:deviceClass:", a3, a4, objc_msgSend(v8, "deviceClass"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LocalizedUnregisterErrorKey textKey](v9, "textKey"));
  v11 = sub_10002B040(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = FMDFMIPManagerUnregisterErrorDomain;
  v17 = NSLocalizedDescriptionKey;
  v18 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, v6, v14));

  return v15;
}

- (FMAlert)pendingSecureMessage
{
  return self->_pendingSecureMessage;
}

- (FMAlert)pendingLocateAlert
{
  return self->_pendingLocateAlert;
}

- (FMDDetachNotificationManager)detachNotificationManager
{
  return self->_detachNotificationManager;
}

- (void)setDetachNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_detachNotificationManager, a3);
}

- (BOOL)isMonitoringPendingDeviceIdentity
{
  return self->_isMonitoringPendingDeviceIdentity;
}

- (void)setIsMonitoringPendingDeviceIdentity:(BOOL)a3
{
  self->_isMonitoringPendingDeviceIdentity = a3;
}

- (BKSApplicationStateMonitor)pendingDeviceIdentityMonitor
{
  return self->_pendingDeviceIdentityMonitor;
}

- (void)setPendingDeviceIdentityMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_pendingDeviceIdentityMonitor, a3);
}

- (NSString)deviceIdentityPendingXpcTransactionName
{
  return self->_deviceIdentityPendingXpcTransactionName;
}

- (void)setDeviceIdentityPendingXpcTransactionName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentityPendingXpcTransactionName, a3);
}

- (OS_dispatch_queue)identity_wait_queue
{
  return self->_identity_wait_queue;
}

- (void)setIdentity_wait_queue:(id)a3
{
  objc_storeStrong((id *)&self->_identity_wait_queue, a3);
}

- (int)lockStateNotifyToken
{
  return self->_lockStateNotifyToken;
}

- (void)setLockStateNotifyToken:(int)a3
{
  self->_lockStateNotifyToken = a3;
}

- (OS_dispatch_queue)device_unlock_actions_queue
{
  return self->_device_unlock_actions_queue;
}

- (void)setDevice_unlock_actions_queue:(id)a3
{
  objc_storeStrong((id *)&self->_device_unlock_actions_queue, a3);
}

- (NSTimer)buddyWaitTimer
{
  return self->_buddyWaitTimer;
}

- (void)setBuddyWaitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_buddyWaitTimer, a3);
}

- (BOOL)waitingForBuddy
{
  return self->_waitingForBuddy;
}

- (void)setWaitingForBuddy:(BOOL)a3
{
  self->_waitingForBuddy = a3;
}

- (FMDFMIPNanoIDSListener)idsListener
{
  return self->_idsListener;
}

- (void)setIdsListener:(id)a3
{
  objc_storeStrong((id *)&self->_idsListener, a3);
}

- (OS_dispatch_queue)authTokenHealingQueue
{
  return self->_authTokenHealingQueue;
}

- (void)setAuthTokenHealingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_authTokenHealingQueue, a3);
}

- (FMDNanoMigrator)nanoMigrator
{
  return self->_nanoMigrator;
}

- (void)setNanoMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_nanoMigrator, a3);
}

- (FMDUnregisterTokenStore)unregisterTokenStore
{
  return self->_unregisterTokenStore;
}

- (void)setUnregisterTokenStore:(id)a3
{
  objc_storeStrong((id *)&self->_unregisterTokenStore, a3);
}

- (FMDMagSafeSetupLauncher)magSafeSetupLauncher
{
  return self->_magSafeSetupLauncher;
}

- (void)setMagSafeSetupLauncher:(id)a3
{
  objc_storeStrong((id *)&self->_magSafeSetupLauncher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magSafeSetupLauncher, 0);
  objc_storeStrong((id *)&self->_unregisterTokenStore, 0);
  objc_storeStrong((id *)&self->_nanoMigrator, 0);
  objc_storeStrong((id *)&self->_authTokenHealingQueue, 0);
  objc_storeStrong((id *)&self->_idsListener, 0);
  objc_storeStrong((id *)&self->_buddyWaitTimer, 0);
  objc_storeStrong((id *)&self->_device_unlock_actions_queue, 0);
  objc_storeStrong((id *)&self->_identity_wait_queue, 0);
  objc_storeStrong((id *)&self->_deviceIdentityPendingXpcTransactionName, 0);
  objc_storeStrong((id *)&self->_pendingDeviceIdentityMonitor, 0);
  objc_storeStrong((id *)&self->_detachNotificationManager, 0);
  objc_storeStrong((id *)&self->_pendingLocateAlert, 0);
  objc_storeStrong((id *)&self->_pendingSecureMessage, 0);
}

@end
