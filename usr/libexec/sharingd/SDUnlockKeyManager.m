@implementation SDUnlockKeyManager

- (BOOL)wasInLockScreen
{
  return self->_wasInLockScreen;
}

- (void)setWasInLockScreen:(BOOL)a3
{
  self->_wasInLockScreen = a3;
}

- (void)handleSystemUIChanged
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000884C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)sharedKeyManager
{
  if (qword_1007C6DC8 != -1)
    dispatch_once(&qword_1007C6DC8, &stru_10071AE58);
  return (id)qword_1007C6DC0;
}

- (SDUnlockKeyManager)init
{
  SDUnlockKeyManager *v2;
  SDUnlockKeyManager *v3;
  OS_dispatch_source *stateTimer;
  id stashHandler;
  id stateHandler;
  SDUnlockSessionRecord *sessionRecord;
  void *v8;
  SDUnlockKeyMetricDates *v9;
  SDUnlockKeyMetricDates *metricDates;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const __CFString *v30;

  v26.receiver = self;
  v26.super_class = (Class)SDUnlockKeyManager;
  v2 = -[SDUnlockSessionManager init](&v26, "init");
  v3 = v2;
  if (v2)
  {
    stateTimer = v2->_stateTimer;
    v2->_stateTimer = 0;

    stashHandler = v3->_stashHandler;
    v3->_stashHandler = 0;

    stateHandler = v3->_stateHandler;
    v3->_stateHandler = 0;

    sessionRecord = v3->_sessionRecord;
    v3->_sessionRecord = 0;

    v3->_useEscrowRecord = 1;
    v3->_remoteDeviceLocked = 1;
    v3->_unlockingState = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v3->_wasInLockScreen = objc_msgSend(v8, "deviceKeyBagLocked");

    v9 = objc_alloc_init(SDUnlockKeyMetricDates);
    metricDates = v3->_metricDates;
    v3->_metricDates = v9;

    -[SDUnlockKeyManager addObservers](v3, "addObservers");
    v11 = -[SDUnlockKeyManager checkDevicePairingState](v3, "checkDevicePairingState");
    v13 = paired_unlock_log(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[SDUnlockSessionManager pairingCompatibilityState](v3, "pairingCompatibilityState");
      v16 = -[SDUnlockSessionManager deviceIsPaired](v3, "deviceIsPaired");
      v17 = CFSTR("NO");
      if (v16)
        v17 = CFSTR("YES");
      *(_DWORD *)buf = 67109378;
      v28 = v15;
      v29 = 2112;
      v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Key loading NanoRegitry, (compatibility state = %d, is paired = %@)", buf, 0x12u);
    }

    if (-[SDUnlockSessionManager inConfigureState](v3, "inConfigureState"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](v3, "securityManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localLongTermKey"));
      if (v19)
      {

      }
      else
      {
        v20 = -[SDUnlockSessionManager deviceIsPaired](v3, "deviceIsPaired");

        if ((v20 & 1) == 0)
        {
          v23 = paired_unlock_log(v21, v22);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "NanoRegistry is already in the configure state", buf, 2u);
          }

          -[SDUnlockKeyManager handleConfigState](v3, "handleConfigState");
        }
      }
    }
    if (_os_feature_enabled_impl("Sharing", "pu_lock_button_all"))
      -[SDUnlockKeyManager setAutoUnlockEnabledUpdatedAfterFirstUnlock:](v3, "setAutoUnlockEnabledUpdatedAfterFirstUnlock:", 1);
  }
  return v3;
}

- (void)addObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SDUnlockKeyManager;
  -[SDUnlockSessionManager addObservers](&v14, "addObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleUILockStateChange", CFSTR("com.apple.sharingd.UILockStatusChanged"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "keyBagLockStateChange:", CFSTR("com.apple.sharingd.KeyBagLockStatusChanged"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "handlePairedWatchWristStateChanged", CFSTR("com.apple.sharingd.PairedWatchWristStateChanged"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "bannerDidDismiss", CFSTR("SDUnlockBannerCouldNotBeDisplayed"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "bannerLockButtonWasTapped", CFSTR("SDUnlockBannerButtonTapped"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "bannerDidDismiss", CFSTR("SDUnlockBannerDismissed"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "handleAutoUnlockEnabledStateUpdated", CFSTR("SDAutoUnlockAKSManagerDynamicStoreUpdatedAfterFirstUnlockNotification"), 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "devicesDidUnpair:", NRPairedDeviceRegistryDeviceDidUnpairNotification, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "newDeviceBecameActive:", NRPairedDeviceRegistryDeviceDidBecomeActive, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "deviceDidEnterConfigurationState:", NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "handleSystemUIChanged", CFSTR("com.apple.sharingd.SystemUIChanged"), 0);

  -[SDUnlockKeyManager addObserversForTests](self, "addObserversForTests");
}

- (void)debugInfoRequested:(id)a3
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager generateDebugInfo](self, "generateDebugInfo"));
  sub_1000455A8(v7, (uint64_t)v6);

}

- (id)generateDebugInfo
{
  NSMutableArray *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v3 = objc_opt_new(NSMutableArray);
  v17.receiver = self;
  v17.super_class = (Class)SDUnlockKeyManager;
  v4 = -[SDUnlockSessionManager generateDebugInfo](&v17, "generateDebugInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  if (objc_msgSend(v6, "checkForEscrowData"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Escrow Secret Exists:%@"), v7));
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  if (-[SDUnlockKeyManager remoteDeviceLocked](self, "remoteDeviceLocked"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Remote Device Locked:%@"), v9));
  -[NSMutableArray addObject:](v3, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager stringForState:](self, "stringForState:", -[SDUnlockKeyManager unlockingState](self, "unlockingState")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unlocking State:%@"), v11));
  -[NSMutableArray addObject:](v3, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allKeychainItems"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Keychain Items:%@"), v14));
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  return v3;
}

- (id)getWatchNameForTesting
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", NRDevicePropertyName));

  }
  else
  {
    v5 = CFSTR("Nobody's Apple Watch");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForKey:", CFSTR("PairedUnlockWatchName")));
  v8 = v7;
  if (v7)
  {
    v9 = v7;

    v5 = v9;
  }

  return v5;
}

- (void)addObserversForTests
{
  _QWORD v3[5];
  _QWORD handler[5];
  int out_token;

  out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001DA5CC;
  handler[3] = &unk_100714EC8;
  handler[4] = self;
  notify_register_dispatch("PairedUnlock-banner-old", &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1001DA628;
  v3[3] = &unk_100714EC8;
  v3[4] = self;
  notify_register_dispatch("PairedUnlock-banner-new", &out_token, (dispatch_queue_t)&_dispatch_main_q, v3);

  notify_register_dispatch("PairedUnlock-banner-update", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_10071AE98);
  notify_register_dispatch("PairedUnlock-banner-dismiss", &out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_10071AEB8);

}

- (void)deviceDidEnterConfigurationState:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = paired_unlock_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received config state notification", v10, 2u);
  }

  v6 = -[SDUnlockSessionManager inConfigureState](self, "inConfigureState");
  if (v6 && !(v6 = -[SDUnlockSessionManager deviceIsPaired](self, "deviceIsPaired")))
  {
    -[SDUnlockKeyManager handleConfigState](self, "handleConfigState");
  }
  else
  {
    v8 = paired_unlock_log(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1001E2020();

  }
}

- (void)handleConfigState
{
  void *v3;
  void *v4;
  unsigned int v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v3, "deviceKeyBagUnlocked"))
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v5 = objc_msgSend(v4, "deviceKeyBagDisabled");

    if (!v5)
    {
      v6 = 1;
      goto LABEL_6;
    }
  }
  -[SDUnlockKeyManager startLTKExchange](self, "startLTKExchange");
  v6 = 0;
LABEL_6:
  self->_ltkWaitingForUnlock = v6;
}

- (void)handleAutoUnlockEnabledStateUpdated
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DA888;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startLTKExchange
{
  -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
  -[SDUnlockKeyManager takeMobileKeybagAssertion](self, "takeMobileKeybagAssertion");
  -[SDUnlockKeyManager sendStartLTKTransfer](self, "sendStartLTKTransfer");
}

- (void)keyBagLockStateChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned __int8 v14;
  _BOOL8 v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  const __CFString *v31;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6 = paired_unlock_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v9 = sub_1001958B4((unint64_t)objc_msgSend(v8, "deviceKeyBagState"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
    v30 = 138412290;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Keybag state changed to %@", (uint8_t *)&v30, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v12 = objc_msgSend(v11, "deviceKeyBagUnlocked");

  if (!self->_ltkWaitingForUnlock || (v12 & 1) != 0)
  {
    if (!self->_ltkWaitingForUnlock)
      goto LABEL_9;
    goto LABEL_8;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v14 = objc_msgSend(v13, "deviceKeyBagDisabled");

  if ((v14 & 1) != 0)
  {
LABEL_8:
    -[SDUnlockKeyManager startLTKExchange](self, "startLTKExchange");
    self->_ltkWaitingForUnlock = 0;
  }
LABEL_9:
  if ((_os_feature_enabled_impl("Sharing", "pu_lock_button_all") & 1) != 0)
  {
    -[SDUnlockKeyManager setAutoUnlockEnabledUpdatedAfterFirstUnlock:](self, "setAutoUnlockEnabledUpdatedAfterFirstUnlock:", 1);
    if ((v12 & 1) == 0)
    {
LABEL_26:
      if (self->_unlockingForKeybagUnlock)
      {
        v24 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
        if (v24 <= 1)
        {
          v26 = paired_unlock_log(v24, v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v30) = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Device locked before auth token sent. Cancelling", (uint8_t *)&v30, 2u);
          }

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          if (v28)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
            objc_msgSend(v29, "setFailureReason:", 14);

          }
          -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
        }
      }
      -[SDUnlockSessionManager logMetrics](self, "logMetrics");
      return;
    }
  }
  else
  {
    v15 = -[SDUnlockKeyManager autoUnlockEnabledUpdatedAfterFirstUnlock](self, "autoUnlockEnabledUpdatedAfterFirstUnlock");
    if (v15)
    {
      if (!v12)
        goto LABEL_26;
      if (!-[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill"))
      {
        v17 = -[SDUnlockKeyManager startUnlockIfNeeded](self, "startUnlockIfNeeded");
        self->_unlockingForKeybagUnlock = v17;
        v19 = paired_unlock_log(v17, v18);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          if (self->_unlockingForKeybagUnlock)
            v21 = CFSTR("YES");
          else
            v21 = CFSTR("NO");
          v30 = 138412290;
          v31 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Paired Unlock started: %@", (uint8_t *)&v30, 0xCu);
        }

      }
    }
    else
    {
      v22 = paired_unlock_log(v15, v16);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not starting Paired Unlock until we can verify whether Auto Unlock is enabled", (uint8_t *)&v30, 2u);
      }

      -[SDUnlockKeyManager setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:](self, "setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:", 1);
      if ((v12 & 1) == 0)
        goto LABEL_26;
    }
  }
  if (!self->_unlockingForKeybagUnlock)
    -[SDUnlockKeyManager beginUnlockIfNotOnLockScreen](self, "beginUnlockIfNotOnLockScreen");
}

- (void)handleUILockStateChange
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  const __CFString *v20;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceUIUnlocked");

  v7 = paired_unlock_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v4)
      v9 = CFSTR("YES");
    v19 = 138412290;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Key manager received UI lock state changed (UI unlocked: %@)", (uint8_t *)&v19, 0xCu);
  }

  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    objc_msgSend(v10, "migrateEscrowDataIfNeeded");

    v11 = -[SDUnlockKeyManager autoUnlockEnabledUpdatedAfterFirstUnlock](self, "autoUnlockEnabledUpdatedAfterFirstUnlock");
    if (v11)
    {
      if (self->_unlockingForKeybagUnlock)
        goto LABEL_8;
      v11 = -[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill");
      if (v11)
      {
        if (!self->_unlockingForKeybagUnlock)
        {
          v18 = paired_unlock_log(v11, v12);
          v14 = objc_claimAutoreleasedReturnValue(v18);
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            goto LABEL_11;
          LOWORD(v19) = 0;
          v15 = "Ignoring. Needs updated pill.";
          goto LABEL_10;
        }
LABEL_8:
        v13 = paired_unlock_log(v11, v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
LABEL_11:

          return;
        }
        LOWORD(v19) = 0;
        v15 = "Already unlocking for keybag";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 2u);
        goto LABEL_11;
      }
      self->_unlockingForKeybagUnlock = -[SDUnlockKeyManager startUnlockIfNeeded](self, "startUnlockIfNeeded");
    }
    else
    {
      v16 = paired_unlock_log(v11, v12);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not starting Paired Unlock until we can verify whether Auto Unlock is enabled", (uint8_t *)&v19, 2u);
      }

      -[SDUnlockKeyManager setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:](self, "setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:", 1);
    }
  }
}

- (void)beginUnlockIfNotOnLockScreen
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  unsigned int v12;
  _BOOL4 unlockingForKeybagUnlock;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  int v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "systemUIFlags");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v6 = objc_msgSend(v5, "deviceKeyBagUnlocked");

  if ((v4 & 2) != 0
    || (v7 = -[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill"), !(v7 & v6))
    || self->_unlockingForKeybagUnlock)
  {
    v9 = paired_unlock_log(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((v4 & 2) != 0)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = -[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill");
      unlockingForKeybagUnlock = self->_unlockingForKeybagUnlock;
      if (v12)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v26 = 138413058;
      if (v6)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v27 = v11;
      if (unlockingForKeybagUnlock)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      v17 = "Ignoring begin attempt. lock screen: %@, should use updated pill: %@, device unlocked: %@, ongoing watch unlock: %@";
      v18 = v10;
      v19 = 42;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v26, v19);
    }
  }
  else
  {
    v20 = paired_unlock_log(v7, v8);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Starting Paired Unlock if needed", (uint8_t *)&v26, 2u);
    }

    v22 = -[SDUnlockKeyManager startUnlockIfNeeded](self, "startUnlockIfNeeded");
    self->_unlockingForKeybagUnlock = v22;
    v24 = paired_unlock_log(v22, v23);
    v10 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_unlockingForKeybagUnlock)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v26 = 138412290;
      v27 = v25;
      v17 = "Paired Unlock started: %@";
      v18 = v10;
      v19 = 12;
      goto LABEL_18;
    }
  }

}

- (void)handlePairedWatchWristStateChanged
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DB248;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bannerDidDismiss
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DB3BC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bannerLockButtonWasTapped
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DB5D4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)devicesDidUnpair:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  SDUnlockSecurityManager *v18;
  int v19;
  id v20;

  v4 = a3;
  v6 = paired_unlock_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138477827;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received devices unpaired notification: %{private}@", (uint8_t *)&v19, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NRPairedDeviceRegistryDevice));

  v12 = paired_unlock_log(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138477827;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device from notification %{private}@", (uint8_t *)&v19, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", NRDevicePropertyPairingID));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", NRDevicePropertyLocalPairingDataStorePath));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", NRDevicePropertyDeviceNameString));
    if (v14)
    {
      v18 = -[SDUnlockSecurityManager initWithPairingID:pairingStorePath:deviceName:]([SDUnlockSecurityManager alloc], "initWithPairingID:pairingStorePath:deviceName:", v14, v16, v17);
      -[SDUnlockKeyManager disableUnlockPairingForSecurityManager:](self, "disableUnlockPairingForSecurityManager:", v18);

    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_1001E20C4();
  }

  self->_outstandingStartLTK = 0;
  -[SDUnlockKeyManager invalidateLongTermKeyTimer](self, "invalidateLongTermKeyTimer");
  -[SDUnlockKeyManager releaseKeyBagAssertion](self, "releaseKeyBagAssertion");

}

- (void)devicesDidFailToPair:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  SDUnlockSecurityManager *v18;
  int v19;
  id v20;

  v4 = a3;
  v6 = paired_unlock_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138477827;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received devices failed to pair notification: %{private}@", (uint8_t *)&v19, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NRPairedDeviceRegistryDevice));

  v12 = paired_unlock_log(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138477827;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device from notification %{private}@", (uint8_t *)&v19, 0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", NRDevicePropertyPairingID));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", NRDevicePropertyLocalPairingDataStorePath));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", NRDevicePropertyDeviceNameString));
    if (v14)
    {
      v18 = -[SDUnlockSecurityManager initWithPairingID:pairingStorePath:deviceName:]([SDUnlockSecurityManager alloc], "initWithPairingID:pairingStorePath:deviceName:", v14, v16, v17);
      -[SDUnlockKeyManager disableUnlockPairingForSecurityManager:](self, "disableUnlockPairingForSecurityManager:", v18);

    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_1001E20F0();
  }

  self->_outstandingStartLTK = 0;
  -[SDUnlockKeyManager invalidateLongTermKeyTimer](self, "invalidateLongTermKeyTimer");
  -[SDUnlockKeyManager releaseKeyBagAssertion](self, "releaseKeyBagAssertion");

}

- (void)newDeviceBecameActive:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = paired_unlock_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDeviceDescription](self, "activeDeviceDescription"));
    v7 = 138477827;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device became active %{private}@", (uint8_t *)&v7, 0xCu);

  }
  -[SDUnlockKeyManager handleActiveDeviceUpdated](self, "handleActiveDeviceUpdated");
}

- (void)restartDelayedStartTimer:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *delayedStartTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v6 = a4;
  v8 = paired_unlock_log(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restarting delayed start timer", buf, 2u);
  }

  delayedStartTimer = self->_delayedStartTimer;
  if (!delayedStartTimer)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001DBD78;
    v14[3] = &unk_1007159D0;
    v14[4] = self;
    v15 = v6;
    v11 = sub_10019AAD8(0, &_dispatch_main_q, v14);
    v12 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v11);
    v13 = self->_delayedStartTimer;
    self->_delayedStartTimer = v12;

    dispatch_resume((dispatch_object_t)self->_delayedStartTimer);
    delayedStartTimer = self->_delayedStartTimer;
  }
  sub_10019AB78(delayedStartTimer, a3);

}

- (void)invalidateDelayedStartTimer
{
  uint64_t v3;
  NSObject *v4;
  NSObject *delayedStartTimer;
  OS_dispatch_source *v6;
  uint8_t v7[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating delayed start timer", v7, 2u);
  }

  delayedStartTimer = self->_delayedStartTimer;
  if (delayedStartTimer)
  {
    dispatch_source_cancel(delayedStartTimer);
    v6 = self->_delayedStartTimer;
    self->_delayedStartTimer = 0;

  }
}

- (void)restartLongTermKeyTimer:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *longTermKeyTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v5 = paired_unlock_log(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting long-term key timer", buf, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (!longTermKeyTimer)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001DBF68;
    v11[3] = &unk_1007146D8;
    v11[4] = self;
    v8 = sub_10019AAD8(0, &_dispatch_main_q, v11);
    v9 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v8);
    v10 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = v9;

    dispatch_resume((dispatch_object_t)self->_longTermKeyTimer);
    longTermKeyTimer = self->_longTermKeyTimer;
  }
  sub_10019AB78(longTermKeyTimer, a3);
}

- (void)invalidateLongTermKeyTimer
{
  uint64_t v3;
  NSObject *v4;
  NSObject *longTermKeyTimer;
  OS_dispatch_source *v6;
  uint8_t v7[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating long-term key timer", v7, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (longTermKeyTimer)
  {
    dispatch_source_cancel(longTermKeyTimer);
    v6 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = 0;

  }
}

- (void)takeMobileKeybagAssertion
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id keybagAssertion;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Taking keybag assertion", (uint8_t *)&v8, 2u);
  }

  if (!self->_keybagAssertion)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)75 + 45.0 + 10.0, 0, CFSTR("MKBAssertionKey"), CFSTR("MKBAssertionTimeout"), CFSTR("RemoteProfile")));
    v10[1] = v5;
    v6 = (void *)MKBDeviceLockAssertion(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, &v9, 2), &v8);
    keybagAssertion = self->_keybagAssertion;
    self->_keybagAssertion = v6;

  }
}

- (void)releaseKeyBagAssertion
{
  uint64_t v3;
  NSObject *v4;
  id keybagAssertion;
  uint8_t v6[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing keybag assertion", v6, 2u);
  }

  keybagAssertion = self->_keybagAssertion;
  self->_keybagAssertion = 0;

}

- (void)handleActiveDeviceUpdated
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DC294;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)checkDevicePairingState
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];

  v3 = -[SDUnlockSessionManager deviceIsPaired](self, "deviceIsPaired");
  if (v3 || (v3 = -[SDUnlockSessionManager inConfigureState](self, "inConfigureState")))
  {
    v5 = paired_unlock_log(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Devices paired/pairing (state = %d)", (uint8_t *)v9, 8u);
    }

  }
  else
  {
    v7 = paired_unlock_log(v3, v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Devices unpaired, disabling Paired Unlock", (uint8_t *)v9, 2u);
    }

    -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
  }
}

- (void)disableUnlockPairing
{
  -[SDUnlockKeyManager disableUnlockPairingForSecurityManager:](self, "disableUnlockPairingForSecurityManager:", 0);
}

- (void)disableUnlockPairingForSecurityManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "deleteEscrowData");
    v8.receiver = self;
    v8.super_class = (Class)SDUnlockKeyManager;
    -[SDUnlockSessionManager disableUnlockPairingForSecManager:](&v8, "disableUnlockPairingForSecManager:", v5);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    objc_msgSend(v6, "deleteEscrowData");

    v7.receiver = self;
    v7.super_class = (Class)SDUnlockKeyManager;
    -[SDUnlockSessionManager disableUnlockPairing](&v7, "disableUnlockPairing");
  }

}

- (BOOL)unlockEnabled
{
  unsigned __int8 v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SDUnlockKeyManager;
  v3 = -[SDUnlockSessionManager unlockEnabled](&v7, "unlockEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v5 = objc_msgSend(v4, "checkForEscrowData");

  return v3 & v5;
}

- (void)syncUnlockEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a3;
  v5 = -[SDUnlockKeyManager unlockEnabled](self, "unlockEnabled");
  if (v3)
  {
    if (!v5)
    {
      v7 = paired_unlock_log(v5, v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Local unlock disabled, remote enabled. Sending disable message", buf, 2u);
      }

      -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
    }
  }
  else if (v5)
  {
    v9 = paired_unlock_log(v5, v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remote unlock disabled, local enabled. Disabling local unlock", v11, 2u);
    }

    -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
  }
}

- (void)unlockStateForDevice:(id)a3 completionHandler:(id)a4
{
  id v5;
  id stateHandler;
  uint64_t v7;
  void *v8;
  void *v9;
  NSErrorUserInfoKey v10;
  const __CFString *v11;

  if (a4)
  {
    v5 = objc_msgSend(a4, "copy", a3);
    stateHandler = self->_stateHandler;
    self->_stateHandler = v5;

    -[SDUnlockKeyManager sendStateRequest](self, "sendStateRequest");
  }
  else
  {
    v7 = SFUnlockErrorDomian;
    v10 = NSLocalizedDescriptionKey;
    v11 = CFSTR("No completion handler");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v7, 112, v8));
    -[SDUnlockKeyManager notifyUnlockStateWithState:error:](self, "notifyUnlockStateWithState:error:", 0, v9);

  }
}

- (void)notifyUnlockStateWithState:(id)a3 error:(id)a4
{
  void (**stateHandler)(id, id, id);
  id v6;

  stateHandler = (void (**)(id, id, id))self->_stateHandler;
  if (stateHandler)
  {
    stateHandler[2](stateHandler, a3, a4);
    v6 = self->_stateHandler;
    self->_stateHandler = 0;

  }
  -[SDUnlockKeyManager invalidateStateTimer](self, "invalidateStateTimer", a3, a4);
}

- (void)restartStateTimer
{
  uint64_t v3;
  NSObject *v4;
  NSObject *stateTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting state request key timer", buf, 2u);
  }

  stateTimer = self->_stateTimer;
  if (!stateTimer)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001DC900;
    v10[3] = &unk_1007146D8;
    v10[4] = self;
    v6 = sub_10019AAD8(0, &_dispatch_main_q, v10);
    v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_stateTimer;
    self->_stateTimer = v7;

    dispatch_resume((dispatch_object_t)self->_stateTimer);
    stateTimer = self->_stateTimer;
  }
  v9 = sub_10019AAC0(10.0 * 2.0 + 5.0);
  sub_10019AB78(stateTimer, v9);
}

- (void)invalidateStateTimer
{
  uint64_t v3;
  NSObject *v4;
  NSObject *stateTimer;
  OS_dispatch_source *v6;
  uint8_t v7[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating state timer", v7, 2u);
  }

  stateTimer = self->_stateTimer;
  if (stateTimer)
  {
    dispatch_source_cancel(stateTimer);
    v6 = self->_stateTimer;
    self->_stateTimer = 0;

  }
}

- (void)restartStashTimer
{
  NSTimer *stashTimer;
  NSTimer *v4;
  NSTimer *v5;

  stashTimer = self->_stashTimer;
  if (stashTimer)
    -[NSTimer invalidate](stashTimer, "invalidate");
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "stashTimerFired:", 0, 0, 20.0));
  v5 = self->_stashTimer;
  self->_stashTimer = v4;

}

- (void)stashTimerFired:(id)a3
{
  NSTimer *stashTimer;
  uint64_t v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v8;
  const __CFString *v9;

  stashTimer = self->_stashTimer;
  self->_stashTimer = 0;

  v5 = SFUnlockErrorDomian;
  v8 = NSLocalizedDescriptionKey;
  v9 = CFSTR("Other side never responded");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, 107, v6));
  -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", v7);

}

- (void)invalidateStashTimer
{
  NSTimer *stashTimer;
  NSTimer *v4;

  stashTimer = self->_stashTimer;
  if (stashTimer)
  {
    -[NSTimer invalidate](stashTimer, "invalidate");
    v4 = self->_stashTimer;
    self->_stashTimer = 0;

  }
}

- (void)establishStashBagWithCompletionHandler:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001DCCB0;
  v4[3] = &unk_1007159D0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)establishStashBagWithManifest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001DCF08;
  block[3] = &unk_100717108;
  v9 = a3;
  v10 = a4;
  block[4] = self;
  v6 = v9;
  v7 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)notifyStashStateWithError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void (**stashHandler)(id, BOOL, id);
  id v9;
  int v10;
  id v11;

  v4 = a3;
  v6 = paired_unlock_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling stash handler with error = %@", (uint8_t *)&v10, 0xCu);
  }

  stashHandler = (void (**)(id, BOOL, id))self->_stashHandler;
  if (stashHandler)
  {
    stashHandler[2](stashHandler, v4 == 0, v4);
    v9 = self->_stashHandler;
    self->_stashHandler = 0;

  }
  -[SDUnlockSessionManager resetStashState](self, "resetStashState");
  -[SDUnlockKeyManager invalidateStashTimer](self, "invalidateStashTimer");

}

- (void)resetSetupState
{
  objc_super v2;

  self->_useEscrowRecord = 1;
  v2.receiver = self;
  v2.super_class = (Class)SDUnlockKeyManager;
  -[SDUnlockSessionManager resetSetupState](&v2, "resetSetupState");
}

- (void)resetAndClearState
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[16];

  self->_useEscrowRecord = 1;
  v3 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
  if (v3 == (id)2)
  {
    v5 = paired_unlock_log(2, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Confirmation failed, relocking watch.", buf, 2u);
    }

    -[SDUnlockKeyManager sendRelockRequestWithReset:](self, "sendRelockRequestWithReset:", 0);
    v3 = -[SDUnlockKeyManager setUnlockingState:](self, "setUnlockingState:", 0);
  }
  v7 = paired_unlock_log(v3, v4);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resetting state. Dismissing banner if not dismissed already", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDHUDManager shared](SDHUDManager, "shared"));
  objc_msgSend(v9, "dismissPairedUnlockBanner");

  v10.receiver = self;
  v10.super_class = (Class)SDUnlockKeyManager;
  -[SDUnlockSessionManager resetAndClearState](&v10, "resetAndClearState");
}

- (void)resetState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  SDUnlockKeyMetricDates *v14;
  SDUnlockSessionRecord *sessionRecord;
  objc_super v16;
  uint8_t buf[4];
  void *v18;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

  if (v3)
  {
    v6 = paired_unlock_log(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      v9 = sub_1001E9E98(objc_msgSend(v8, "failureReason"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting key manager. Reason: %@", buf, 0xCu);

    }
    if (-[SDUnlockKeyManager unlockingState](self, "unlockingState") >= 1)
    {
      v11 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      objc_msgSend(v12, "setPhoneState:", v11);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
    -[SDUnlockKeyManager consolidateLatencies:](self, "consolidateLatencies:", v13);

    v14 = objc_alloc_init(SDUnlockKeyMetricDates);
    -[SDUnlockKeyManager setMetricDates:](self, "setMetricDates:", v14);

  }
  sessionRecord = self->_sessionRecord;
  self->_sessionRecord = 0;

  self->_unlockingForKeybagUnlock = 0;
  -[SDUnlockKeyManager setUnlockingState:](self, "setUnlockingState:", 0);
  v16.receiver = self;
  v16.super_class = (Class)SDUnlockKeyManager;
  -[SDUnlockSessionManager resetState](&v16, "resetState");
}

- (int64_t)unlockingState
{
  SDUnlockKeyManager *v2;
  int64_t unlockingState;

  v2 = self;
  objc_sync_enter(v2);
  unlockingState = v2->_unlockingState;
  objc_sync_exit(v2);

  return unlockingState;
}

- (void)setUnlockingState:(int64_t)a3
{
  SDUnlockKeyManager *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = self;
  v5 = objc_sync_enter(v4);
  v4->_unlockingState = a3;
  v7 = paired_unlock_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager stringForState:](v4, "stringForState:", v4->_unlockingState));
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting unlocking state to %@", (uint8_t *)&v10, 0xCu);

  }
  objc_sync_exit(v4);

}

- (id)stringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Unknown State");
  else
    return *(&off_10071AEF8 + a3);
}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5
{
  int v5;
  id v8;
  SDUnlockDisable *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  if (v5 <= 1000)
  {
    switch(v5)
    {
      case 1:
        -[SDUnlockKeyManager handleResetState:](self, "handleResetState:", v8);
        break;
      case 2:
        v9 = -[SDUnlockDisable initWithData:]([SDUnlockDisable alloc], "initWithData:", v8);
        -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v9);

        -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
        break;
      case 4:
        -[SDUnlockKeyManager invalidateStateTimer](self, "invalidateStateTimer");
        -[SDUnlockKeyManager handleUnlockStateResponse:](self, "handleUnlockStateResponse:", v8);
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 1001:
        -[SDUnlockKeyManager handleRemoteLockStateChanged:](self, "handleRemoteLockStateChanged:", v8);
        break;
      case 1002:
        -[SDUnlockKeyManager handleSetupRequest:](self, "handleSetupRequest:", v8);
        break;
      case 1003:
        -[SDUnlockKeyManager handleCreateEscrowSecret:](self, "handleCreateEscrowSecret:", v8);
        break;
      case 1004:
        -[SDUnlockSessionManager invalidateUnlockTimer](self, "invalidateUnlockTimer");
        -[SDUnlockKeyManager handleSessionKeyExchangeResponse:](self, "handleSessionKeyExchangeResponse:", v8);
        break;
      case 1005:
        -[SDUnlockSessionManager invalidateUnlockTimer](self, "invalidateUnlockTimer");
        -[SDUnlockKeyManager handleUnlockConfirmation:](self, "handleUnlockConfirmation:", v8);
        break;
      case 1006:
        -[SDUnlockKeyManager invalidateStashTimer](self, "invalidateStashTimer");
        -[SDUnlockKeyManager handleStashKeyExchangeResponse:](self, "handleStashKeyExchangeResponse:", v8);
        break;
      case 1007:
        -[SDUnlockKeyManager invalidateStashTimer](self, "invalidateStashTimer");
        -[SDUnlockKeyManager handleStashConfirmation:](self, "handleStashConfirmation:", v8);
        break;
      case 1008:
        -[SDUnlockKeyManager handleLongTermKeyRequest:](self, "handleLongTermKeyRequest:", v8);
        -[SDUnlockKeyManager invalidateLongTermKeyTimer](self, "invalidateLongTermKeyTimer");
        break;
      case 1009:
        -[SDUnlockKeyManager handleClassALongTermKeyRequest:](self, "handleClassALongTermKeyRequest:", v8);
        break;
      default:
        break;
    }
  }

}

- (void)idsControllerNearbyStateChanged:(id)a3
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController", a3));
  v5 = objc_msgSend(v4, "isDefaultPairedDeviceNearby");

  if ((v5 & 1) == 0)
    -[SDUnlockKeyManager setRemoteDeviceLocked:](self, "setRemoteDeviceLocked:", 1);
}

- (void)handleRemoteLockStateChanged:(id)a3
{
  id v4;
  SDUnlockLockStateUpdated *v5;
  _BOOL8 v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  __int16 v28[8];
  uint8_t v29[16];
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = -[SDUnlockLockStateUpdated initWithData:]([SDUnlockLockStateUpdated alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (v5 && -[SDUnlockLockStateUpdated hasUnlocked](v5, "hasUnlocked"))
  {
    if (-[SDUnlockKeyManager unlockEnabled](self, "unlockEnabled"))
    {
      v6 = -[SDUnlockLockStateUpdated unlocked](v5, "unlocked");
      v7 = v6;
      v9 = paired_unlock_log(v6, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v11)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Lock device is unlocked", buf, 2u);
        }

        if (self->_delayedStartTimer || (v12 = -[SDUnlockKeyManager unlockingState](self, "unlockingState"), v12 == 1))
        {
          v14 = paired_unlock_log(v12, v13);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v29 = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Watch unlocked already. Dismissing banner", v29, 2u);
          }

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDHUDManager shared](SDHUDManager, "shared"));
          objc_msgSend(v16, "dismissPairedUnlockBanner");

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
            objc_msgSend(v18, "setFailureReason:", 15);

          }
        }
        -[SDUnlockKeyManager setRemoteDeviceLocked:](self, "setRemoteDeviceLocked:", 0);
        -[SDUnlockKeyManager resetState](self, "resetState");
      }
      else
      {
        if (v11)
        {
          v28[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Lock device is locked", (uint8_t *)v28, 2u);
        }

        -[SDUnlockKeyManager setRemoteDeviceLocked:](self, "setRemoteDeviceLocked:", 1);
      }
    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      if (v19)
      {
        v20 = (void *)v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pairingID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager pairingID](self, "pairingID"));
        if (objc_msgSend(v22, "isEqualToString:", v23))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pairingStorePath"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager pairingStorePath](self, "pairingStorePath"));
          v27 = objc_msgSend(v25, "isEqualToString:", v26);

          if (v27)
            -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
        }
        else
        {

        }
      }
    }
  }

}

- (void)handleLongTermKeyRequest:(id)a3
{
  id v4;
  SDUnlockLongTermKeyRequest *v5;
  _BOOL8 v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  __CFString **v19;
  void *v20;

  self->_outstandingStartLTK = 0;
  v4 = a3;
  v5 = -[SDUnlockLongTermKeyRequest initWithData:]([SDUnlockLongTermKeyRequest alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = -[SDUnlockSessionManager inConfigureState](self, "inConfigureState");
  if (!v6)
  {
    v15 = paired_unlock_log(v6, v7);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1001E21C8(self, v16);

    goto LABEL_14;
  }
  -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
  v8 = -[SDUnlockLongTermKeyRequest hasLongTermKey](v5, "hasLongTermKey");
  if (!v8
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyRequest longTermKey](v5, "longTermKey")),
        v11 = -[SDUnlockKeyManager updateLongTermKey:](self, "updateLongTermKey:", v10),
        v10,
        !v11))
  {
    v17 = paired_unlock_log(v8, v9);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1001E211C();

    if (-[SDUnlockLongTermKeyRequest hasLongTermKey](v5, "hasLongTermKey"))
      v19 = &off_10071B010;
    else
      v19 = &off_10071B008;
    -[SDUnlockSessionManager abortDevicePairingWithReason:](self, "abortDevicePairingWithReason:", *v19);
LABEL_14:
    -[SDUnlockKeyManager releaseKeyBagAssertion](self, "releaseKeyBagAssertion");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyRequest requestID](v5, "requestID"));
    -[SDUnlockKeyManager sendLongTermKeyResponse:requestID:](self, "sendLongTermKeyResponse:requestID:", 0, v20);

    goto LABEL_15;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localLongTermKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyRequest requestID](v5, "requestID"));
  -[SDUnlockKeyManager sendLongTermKeyResponse:requestID:](self, "sendLongTermKeyResponse:requestID:", v13, v14);

  -[SDUnlockKeyManager releaseKeyBagAssertion](self, "releaseKeyBagAssertion");
LABEL_15:

}

- (void)handleClassALongTermKeyRequest:(id)a3
{
  id v4;
  SDUnlockClassALongTermKeyRequest *v5;
  void *v6;
  unsigned int v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;

  v4 = a3;
  v5 = -[SDUnlockClassALongTermKeyRequest initWithData:]([SDUnlockClassALongTermKeyRequest alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v7 = objc_msgSend(v6, "deviceKeyBagUnlocked");

  if (v7)
  {
    v8 = -[SDUnlockClassALongTermKeyRequest hasLongTermKey](v5, "hasLongTermKey");
    if (v8)
    {
      -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockClassALongTermKeyRequest longTermKey](v5, "longTermKey"));
      v11 = -[SDUnlockKeyManager updateLongTermKey:](self, "updateLongTermKey:", v10);

      if ((v11 & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localLongTermKey"));
        -[SDUnlockKeyManager sendClassALongTermKeyResponse:sessionID:errorCode:](self, "sendClassALongTermKeyResponse:sessionID:errorCode:", v13, -[SDUnlockClassALongTermKeyRequest sessionID](v5, "sessionID"), 0);

        goto LABEL_13;
      }
      v16 = 101;
    }
    else
    {
      v16 = 103;
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v15 = objc_msgSend(v14, "deviceKeyBagDisabled");

    if (v15)
      v16 = 108;
    else
      v16 = 102;
  }
  v17 = paired_unlock_log(v8, v9);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_1001E2244();

  -[SDUnlockKeyManager sendClassALongTermKeyResponse:sessionID:errorCode:](self, "sendClassALongTermKeyResponse:sessionID:errorCode:", 0, -[SDUnlockClassALongTermKeyRequest sessionID](v5, "sessionID"), v16);
  -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
LABEL_13:

}

- (BOOL)updateLongTermKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "generateLocalLongTermKey:", 1));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "signRemoteKey:withLocalKey:localKeyClass:remoteKeyClass:", v4, v6, 1, 3));

      v9 = v8 != 0;
      if (v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        objc_msgSend(v10, "updateLocalLongTermKey:remoteLongTermKey:", v6, v8);

      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handleSetupRequest:(id)a3
{
  id v4;
  SDUnlockSetupRequest *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  SDUnlockKeyManager *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;

  v4 = a3;
  v5 = -[SDUnlockSetupRequest initWithData:]([SDUnlockSetupRequest alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v7 = objc_msgSend(v6, "deviceKeyBagUnlocked");

  if (v7)
  {
    if (v5)
    {
      if (!-[SDUnlockSetupRequest hasLongTermKey](v5, "hasLongTermKey"))
      {
        v12 = (id)-[SDUnlockSetupRequest sessionID](v5, "sessionID");
        v13 = self;
        v14 = 0;
        goto LABEL_11;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupRequest longTermKey](v5, "longTermKey"));
      v11 = -[SDUnlockKeyManager updateLongTermKey:](self, "updateLongTermKey:", v10);

      if (v11)
      {
        v12 = (id)-[SDUnlockSetupRequest sessionID](v5, "sessionID");
        v13 = self;
        v14 = 1;
LABEL_11:
        -[SDUnlockKeyManager handleEscrowSessionRequest:withUpdatedLongTermKey:](v13, "handleEscrowSessionRequest:withUpdatedLongTermKey:", v12, v14);
        goto LABEL_16;
      }
      v17 = 101;
    }
    else
    {
      v17 = 103;
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v16 = objc_msgSend(v15, "deviceKeyBagDisabled");

    if (v16)
      v17 = 108;
    else
      v17 = 102;
  }
  v18 = paired_unlock_log(v8, v9);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_1001E22A4();

  -[SDUnlockKeyManager sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:](self, "sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:", 0, 0, -[SDUnlockSetupRequest sessionID](v5, "sessionID"), v17);
  -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
  -[SDUnlockKeyManager resetSetupState](self, "resetSetupState");
LABEL_16:

}

- (void)handleEscrowSessionRequest:(unsigned int)a3 withUpdatedLongTermKey:(BOOL)a4
{
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localLongTermKey"));
  if (!v8)
  {

    goto LABEL_8;
  }
  v9 = (void *)v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteLongTermKey"));

  if (!v11)
  {
LABEL_8:
    v19 = 187;
    goto LABEL_9;
  }
  v22 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  -[SDUnlockSessionManager setSetupAuthSession:](self, "setSetupAuthSession:", objc_msgSend(v14, "escrowCreationSessionAsOriginator:errorCode:", 1, &v22));

  v12 = -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession");
  if (v12 < 0)
  {
    v19 = 188;
    if (v22 != -536870174 && v22 != -536362984)
    {
      if (v22 == -536362989)
        v19 = 188;
      else
        v19 = 101;
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stepWithAuthSession:data:", -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession"), 0));

    if (v16)
    {
      if (a4)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localLongTermKey"));
        -[SDUnlockKeyManager sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:](self, "sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:", v18, v16, v5, 0);

      }
      else
      {
        -[SDUnlockKeyManager sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:](self, "sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:", 0, v16, v5, 0);
      }

      return;
    }
    v19 = 101;
  }
LABEL_9:
  v20 = paired_unlock_log(v12, v13);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_100039DB4();

  -[SDUnlockKeyManager sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:](self, "sendSetupSessionCreatedWithLocalKey:stepData:sessionID:errorCode:", 0, 0, v5, v19);
  -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
  -[SDUnlockKeyManager resetSetupState](self, "resetSetupState");
}

- (void)handleCreateEscrowSecret:(id)a3
{
  id v4;
  SDUnlockSetupCreateSecret *v5;
  void *v6;
  unsigned int v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  const __CFString *v27;
  uint8_t buf[8];
  uint64_t v29;

  v4 = a3;
  v5 = -[SDUnlockSetupCreateSecret initWithData:]([SDUnlockSetupCreateSecret alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v7 = objc_msgSend(v6, "deviceKeyBagUnlocked");

  if (v7)
  {
    if (v5 && (v8 = -[SDUnlockSetupCreateSecret hasToken](v5, "hasToken")))
    {
      v29 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      v11 = -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateSecret token](v5, "token"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stepWithAuthSession:data:authStep:errorCode:", v11, v12, 0, &v29));

      if (!v13)
      {
        if (v29 == -536363002)
        {
          v22 = paired_unlock_log(v8, v9);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Bad signature, deleting bad LTKs", buf, 2u);
          }

          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
          objc_msgSend(v24, "deleteLongTermKeys");

          v19 = 188;
        }
        else
        {
          v19 = 101;
        }
        v18 = CFSTR("Could not complete step");
        goto LABEL_11;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "escrowSecretWithAuthSession:", -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession")));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
        v17 = objc_msgSend(v16, "storeEscrowData:", v15);

        if ((v17 & 1) != 0)
        {
          -[SDUnlockKeyManager sendSetupCreateEscrowRecordWithSessionID:stepData:errorCode:](self, "sendSetupCreateEscrowRecordWithSessionID:stepData:errorCode:", -[SDUnlockSetupCreateSecret sessionID](v5, "sessionID"), v13, 0);
          -[SDUnlockSessionManager enableUnlockPairing](self, "enableUnlockPairing");
          -[SDUnlockKeyManager resetSetupState](self, "resetSetupState");

          goto LABEL_14;
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
        v26 = objc_msgSend(v25, "deviceKeyBagLocked");
        v27 = CFSTR("NO");
        if (v26)
          v27 = CFSTR("YES");
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to store escrow secret (locked = %@)"), v27));

      }
      else
      {
        v18 = CFSTR("Failed to create escrow secret");
      }

    }
    else
    {
      v18 = CFSTR("No remote step data in message");
    }
    v19 = 101;
  }
  else
  {
    v18 = CFSTR("Device locked");
    v19 = 102;
  }
LABEL_11:
  v20 = paired_unlock_log(v8, v9);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_1001E2304();

  -[SDUnlockKeyManager sendSetupCreateEscrowRecordWithSessionID:stepData:errorCode:](self, "sendSetupCreateEscrowRecordWithSessionID:stepData:errorCode:", -[SDUnlockSetupCreateSecret sessionID](v5, "sessionID"), 0, v19);
  -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
  -[SDUnlockKeyManager resetSetupState](self, "resetSetupState");

LABEL_14:
}

- (void)handleSessionKeyExchangeResponse:(id)a3
{
  id v4;
  SDUnlockSessionKeyExchangeResponse *v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  dispatch_time_t v25;
  _BOOL8 v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  int64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[5];
  id v61;
  SDUnlockSessionKeyExchangeResponse *v62;
  uint64_t v63;
  uint8_t buf[4];
  double v65;
  __int16 v66;
  uint64_t v67;

  v4 = a3;
  v5 = -[SDUnlockSessionKeyExchangeResponse initWithData:]([SDUnlockSessionKeyExchangeResponse alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
  objc_msgSend(v7, "setKeyExchangeResponseReceived:", v6);

  if ((id)-[SDUnlockKeyManager unlockingState](self, "unlockingState") == (id)1
    && -[SDUnlockSessionKeyExchangeResponse hasKey](v5, "hasKey"))
  {
    v8 = -[SDUnlockSessionKeyExchangeResponse hasSessionID](v5, "hasSessionID");
    if ((_DWORD)v8
      && (v10 = -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"),
          v8 = -[SDUnlockSessionRecord unlockSessionID](self->_sessionRecord, "unlockSessionID"),
          v8 == v10))
    {
      v63 = 0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      v12 = -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeResponse key](v5, "key"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stepWithAuthSession:data:authStep:errorCode:", v12, v13, 0, &v63));

      if (v14)
      {
        if (-[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill"))
        {
          if (SBUIIsSystemApertureEnabled())
            v17 = 5.0999999;
          else
            v17 = 3.5999999;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForProperty:", NRDevicePropertyName));

          if ((+[SFAutoUnlockManager autoUnlockEnabled](SFAutoUnlockManager, "autoUnlockEnabled") & 1) != 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDHUDManager shared](SDHUDManager, "shared"));
            objc_msgSend(v20, "postPairedUnlockBannerFor:needsLockButton:needsUpdate:", v19, 1, 1);

            v23 = paired_unlock_log(v21, v22);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v65 = v17;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Auto Unlock enabled. Waiting %f sec for user to respond to pill...", buf, 0xCu);
            }

            v25 = sub_10019AAC0(v17);
            v60[0] = _NSConcreteStackBlock;
            v60[1] = 3221225472;
            v60[2] = sub_1001DECB4;
            v60[3] = &unk_100715138;
            v60[4] = self;
            v61 = v14;
            v62 = v5;
            -[SDUnlockKeyManager restartDelayedStartTimer:withCompletionHandler:](self, "restartDelayedStartTimer:withCompletionHandler:", v25, v60);

          }
          else
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "keyExchangeResponseReceived"));
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
            objc_msgSend(v58, "setPillUpdated:", v57);

            -[SDUnlockKeyManager sendSessionAuthenticationToken:sessionID:](self, "sendSessionAuthenticationToken:sessionID:", v14, -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[SDHUDManager shared](SDHUDManager, "shared"));
            objc_msgSend(v59, "postPairedUnlockBannerFor:needsLockButton:needsUpdate:", v19, 1, 0);

          }
        }
        else
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "keyExchangeResponseReceived"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
          objc_msgSend(v53, "setPillUpdated:", v52);

          -[SDUnlockKeyManager sendSessionAuthenticationToken:sessionID:](self, "sendSessionAuthenticationToken:sessionID:", v14, -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"));
        }
      }
      else
      {
        v42 = paired_unlock_log(v15, v16);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          sub_1001E2390();

        if (v63 == -536363002)
        {
          v46 = paired_unlock_log(v44, v45);
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            sub_1001E2364();

          -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
          -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
          objc_msgSend(v48, "deleteLongTermKeys");

          v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          if (v49)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
            objc_msgSend(v50, "setFailureReason:", 22);

          }
        }
        else
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

          if (v54)
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
            objc_msgSend(v55, "setFailureReason:", 3);

          }
          -[SDUnlockSessionManager sendResetMessage:reason:](self, "sendResetMessage:reason:", -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"), 3);
        }
      }

    }
    else
    {
      v39 = paired_unlock_log(v8, v9);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = -[SDUnlockSessionRecord unlockSessionID](self->_sessionRecord, "unlockSessionID");
        *(_DWORD *)buf = 134218240;
        v65 = *(double *)&v41;
        v66 = 2048;
        v67 = -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID");
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Incorrect session ID (key ID: %ld, lock ID: %ld)", buf, 0x16u);
      }

      -[SDUnlockSessionManager restartUnlockTimer:](self, "restartUnlockTimer:", sub_10019AAC0((double)45));
    }
  }
  else
  {
    v26 = -[SDUnlockSessionKeyExchangeResponse hasKeyFailed](v5, "hasKeyFailed");
    if (v26 && (v26 = -[SDUnlockSessionKeyExchangeResponse keyFailed](v5, "keyFailed")))
    {
      v28 = -[SDUnlockKeyManager resetState](self, "resetState");
      if (!self->_useEscrowRecord)
      {
        self->_useEscrowRecord = 1;
        v30 = paired_unlock_log(v28, v29);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_1001E23BC();

        self->_unlockingForKeybagUnlock = 1;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          objc_msgSend(v33, "setRetriedWithEscrowRecord:", 1);

        }
        -[SDUnlockKeyManager initiateRemoteUnlock](self, "initiateRemoteUnlock");
      }
    }
    else
    {
      v34 = paired_unlock_log(v26, v27);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_1001E23E8(self, v5);

      if ((id)-[SDUnlockKeyManager unlockingState](self, "unlockingState") == (id)1)
        v36 = 2;
      else
        v36 = 9;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
        objc_msgSend(v38, "setFailureReason:", v36);

      }
      -[SDUnlockSessionManager sendResetMessage:reason:](self, "sendResetMessage:reason:", -[SDUnlockSessionKeyExchangeResponse sessionID](v5, "sessionID"), v36);
    }
  }

}

- (void)handleUnlockConfirmation:(id)a3
{
  id v4;
  SDUnlockSessionConfirmation *v5;
  void *v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 useEscrowRecord;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  unsigned int v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;

  v4 = a3;
  v5 = -[SDUnlockSessionConfirmation initWithData:]([SDUnlockSessionConfirmation alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
  objc_msgSend(v7, "setConfirmationReceived:", v6);

  v8 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
  if (v8 == 2
    && (v8 = -[SDUnlockSessionConfirmation hasSuccess](v5, "hasSuccess"), (_DWORD)v8)
    && (v8 = -[SDUnlockSessionConfirmation success](v5, "success"), (_DWORD)v8)
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager")),
        v11 = objc_msgSend(v10, "confirmUnlockWithAuthSession:", -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession")), v10, v11))
  {
    self->_useEscrowRecord = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      objc_msgSend(v13, "setSucceeded:", 1);

    }
    v14 = -[SDUnlockKeyManager resetState](self, "resetState");
    v16 = paired_unlock_log(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "UNLOCK CONFIRMED!", (uint8_t *)&v32, 2u);
    }

    if (+[SFAutoUnlockManager autoUnlockEnabled](SFAutoUnlockManager, "autoUnlockEnabled")
      && !-[SDUnlockKeyManager pairedWatchSupportsRelock](self, "pairedWatchSupportsRelock"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForProperty:", NRDevicePropertyName));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDHUDManager shared](SDHUDManager, "shared"));
      objc_msgSend(v20, "postPairedUnlockBannerFor:needsLockButton:needsUpdate:", v19, 0, 0);

    }
  }
  else
  {
    useEscrowRecord = self->_useEscrowRecord;
    v22 = paired_unlock_log(v8, v9);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (useEscrowRecord)
    {
      if (v24)
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Confirmation failed, resetting state", (uint8_t *)&v32, 2u);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      if (v25)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
        objc_msgSend(v26, "setFailureReason:", 25);

      }
      -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
    }
    else
    {
      if (v24)
      {
        v27 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
        if (-[SDUnlockSessionConfirmation hasSuccess](v5, "hasSuccess"))
          v28 = CFSTR("YES");
        else
          v28 = CFSTR("NO");
        LODWORD(v32) = 67109634;
        if (-[SDUnlockSessionConfirmation success](v5, "success"))
          v29 = CFSTR("YES");
        else
          v29 = CFSTR("NO");
        HIDWORD(v32) = v27;
        v33 = 2112;
        v34 = v28;
        v35 = 2112;
        v36 = v29;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Token unlock failed, retrying (state = %d, confirmation has success = %@, confirmation success = %@)", (uint8_t *)&v32, 0x1Cu);
      }

      -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
      self->_unlockingForKeybagUnlock = 1;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
        objc_msgSend(v31, "setRetriedWithEscrowRecord:", 1);

      }
      -[SDUnlockKeyManager initiateRemoteUnlock](self, "initiateRemoteUnlock", v32);
    }
  }

}

- (void)handleResetState:(id)a3
{
  id v4;
  void *v5;
  unsigned __int16 v6;
  void *v7;
  SDUnlockSessionRecord *sessionRecord;
  unsigned int v9;
  SDUnlockReset *v10;

  v4 = a3;
  v10 = -[SDUnlockReset initWithData:]([SDUnlockReset alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v10);
  if (-[SDUnlockReset hasResetReason](v10, "hasResetReason"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

    if (v5)
    {
      v6 = (unsigned __int16)-[SDUnlockReset resetReason](v10, "resetReason");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      objc_msgSend(v7, "setFailureReason:", v6);

    }
  }
  sessionRecord = self->_sessionRecord;
  if (!sessionRecord
    || (v9 = -[SDUnlockSessionRecord unlockSessionID](sessionRecord, "unlockSessionID"),
        -[SDUnlockReset sessionID](v10, "sessionID") == v9))
  {
    -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
  }

}

- (void)handleStashKeyExchangeResponse:(id)a3
{
  id v4;
  SDUnlockStashKeyExchangeResponse *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;

  v4 = a3;
  v5 = -[SDUnlockStashKeyExchangeResponse initWithData:]([SDUnlockStashKeyExchangeResponse alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (-[SDUnlockStashKeyExchangeResponse hasKey](v5, "hasKey"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    v7 = -[SDUnlockSessionManager stashBagSession](self, "stashBagSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashKeyExchangeResponse key](v5, "key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stepWithAuthSession:data:", v7, v8));

    if (v9)
    {
      -[SDUnlockKeyManager sendStashToken:sessionID:](self, "sendStashToken:sessionID:", v9, -[SDUnlockStashKeyExchangeResponse sessionID](v5, "sessionID"));
    }
    else
    {
      v21 = paired_unlock_log(v10, v11);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1001E2490();

      v23 = SFUnlockErrorDomian;
      v28 = NSLocalizedDescriptionKey;
      v29 = CFSTR("Error creating stash token");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v23, 101, v24));
      -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", v25);

    }
  }
  else
  {
    v12 = (id)-[SDUnlockStashKeyExchangeResponse hasErrorCode](v5, "hasErrorCode");
    if ((_DWORD)v12)
    {
      v12 = (id)-[SDUnlockStashKeyExchangeResponse errorCode](v5, "errorCode");
      v14 = v12;
    }
    else
    {
      v14 = 103;
    }
    v15 = paired_unlock_log(v12, v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1001E24BC(v14, v16, v17);

    v18 = SFUnlockErrorDomian;
    v19 = v14;
    v26 = NSLocalizedDescriptionKey;
    v27 = CFSTR("Error getting repsonse key");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, v19, v9));
    -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", v20);

  }
}

- (void)handleStashConfirmation:(id)a3
{
  id v4;
  SDUnlockStashConfirmation *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v4 = a3;
  v5 = -[SDUnlockStashConfirmation initWithData:]([SDUnlockStashConfirmation alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (-[SDUnlockStashConfirmation hasSuccess](v5, "hasSuccess") && -[SDUnlockStashConfirmation success](v5, "success"))
  {
    -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", 0);
  }
  else
  {
    v6 = SFUnlockErrorDomian;
    v9 = NSLocalizedDescriptionKey;
    v10 = CFSTR("Other device failed to confirm stash setup");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 101, v7));
    -[SDUnlockKeyManager notifyStashStateWithError:](self, "notifyStashStateWithError:", v8);

  }
}

- (void)handleUnlockStateResponse:(id)a3
{
  id v4;
  SDUnlockStateResponse *v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v17;
  const __CFString *v18;

  v4 = a3;
  v5 = -[SDUnlockStateResponse initWithData:]([SDUnlockStateResponse alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = -[SDUnlockStateResponse hasUnlockEnabled](v5, "hasUnlockEnabled");
  if (v6 && (v6 = -[SDUnlockStateResponse hasPasscodeEnabled](v5, "hasPasscodeEnabled")))
  {
    -[SDUnlockKeyManager syncUnlockEnabled:](self, "syncUnlockEnabled:", -[SDUnlockStateResponse unlockEnabled](v5, "unlockEnabled"));
    v8 = objc_alloc((Class)SFUnlockState);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDUnlockKeyManager unlockEnabled](self, "unlockEnabled")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDUnlockStateResponse passcodeEnabled](v5, "passcodeEnabled")));
    v11 = objc_msgSend(v8, "initWithUnlockEnabled:remotePasscodeEnabled:", v9, v10);

    -[SDUnlockKeyManager notifyUnlockStateWithState:error:](self, "notifyUnlockStateWithState:error:", v11, 0);
  }
  else
  {
    v12 = paired_unlock_log(v6, v7);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1001E2524();

    v14 = SFUnlockErrorDomian;
    v17 = NSLocalizedDescriptionKey;
    v18 = CFSTR("Response is missing information");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, 103, v15));
    -[SDUnlockKeyManager notifyUnlockStateWithState:error:](self, "notifyUnlockStateWithState:error:", 0, v16);

  }
}

- (void)sendStartLTKTransfer
{
  SDUnlockStartLTKTransfer *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc_init(SDUnlockStartLTKTransfer);
  -[SDUnlockStartLTKTransfer setVersion:](v3, "setVersion:", 1);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v3);
  self->_outstandingStartLTK = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStartLTKTransfer data](v3, "data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 75));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001DF9A4;
  v7[3] = &unk_1007147C8;
  v7[4] = self;
  objc_msgSend(v4, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v5, 108, v6, 0, v7);

  -[SDUnlockKeyManager restartLongTermKeyTimer:](self, "restartLongTermKeyTimer:", sub_10019AAC0((double)75 + 45.0 + 10.0));
}

- (void)sendLongTermKeyResponse:(id)a3 requestID:(id)a4
{
  id v6;
  id v7;
  SDUnlockLongTermKeyResponse *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SDUnlockLongTermKeyResponse);
  -[SDUnlockLongTermKeyResponse setVersion:](v8, "setVersion:", 1);
  -[SDUnlockLongTermKeyResponse setRequestID:](v8, "setRequestID:", v7);

  if (v6)
    -[SDUnlockLongTermKeyResponse setLongTermKey:](v8, "setLongTermKey:", v6);
  else
    -[SDUnlockLongTermKeyResponse setKeyFailed:](v8, "setKeyFailed:", 1);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyResponse data](v8, "data"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001DFB60;
  v12[3] = &unk_1007147C8;
  v12[4] = self;
  objc_msgSend(v9, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v10, 107, v11, 0, v12);

}

- (void)sendClassALongTermKeyResponse:(id)a3 sessionID:(unsigned int)a4 errorCode:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  SDUnlockClassALongTermKeyResponse *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = objc_alloc_init(SDUnlockClassALongTermKeyResponse);
  -[SDUnlockClassALongTermKeyResponse setVersion:](v9, "setVersion:", 1);
  -[SDUnlockClassALongTermKeyResponse setSessionID:](v9, "setSessionID:", v6);
  if (v8)
    -[SDUnlockClassALongTermKeyResponse setLongTermKey:](v9, "setLongTermKey:", v8);
  else
    -[SDUnlockClassALongTermKeyResponse setErrorCode:](v9, "setErrorCode:", v5);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockClassALongTermKeyResponse data](v9, "data"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v13[1] = 3221225472;
  v13[2] = sub_1001DFCF0;
  v13[3] = &unk_1007147C8;
  v13[4] = self;
  v13[0] = _NSConcreteStackBlock;
  objc_msgSend(v10, "sendProtocolBufferData:withType:timeout:option:dataClass:queueOneID:errorHandler:", v11, 109, v12, 0, 2, 0, v13);

}

- (void)sendSetupSessionCreatedWithLocalKey:(id)a3 stepData:(id)a4 sessionID:(unsigned int)a5 errorCode:(int64_t)a6
{
  uint64_t v7;
  id v10;
  id v11;
  SDUnlockSetupSessionCreated *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(SDUnlockSetupSessionCreated);
  -[SDUnlockSetupSessionCreated setVersion:](v12, "setVersion:", 1);
  -[SDUnlockSetupSessionCreated setSessionID:](v12, "setSessionID:", v7);
  if (v10)
    -[SDUnlockSetupSessionCreated setLongTermKey:](v12, "setLongTermKey:", v10);
  if (v11)
    -[SDUnlockSetupSessionCreated setToken:](v12, "setToken:", v11);
  if (a6)
    -[SDUnlockSetupSessionCreated setErrorCode:](v12, "setErrorCode:", a6);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated data](v12, "data"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001DFE54;
  v16[3] = &unk_1007147C8;
  v16[4] = self;
  objc_msgSend(v13, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v14, 101, v15, 0, v16);

}

- (void)sendSetupCreateEscrowRecordWithSessionID:(unsigned int)a3 stepData:(id)a4 errorCode:(int64_t)a5
{
  uint64_t v6;
  id v8;
  SDUnlockSetupCreateRecord *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = objc_alloc_init(SDUnlockSetupCreateRecord);
  -[SDUnlockSetupCreateRecord setVersion:](v9, "setVersion:", 1);
  -[SDUnlockSetupCreateRecord setSessionID:](v9, "setSessionID:", v6);
  if (v8)
    -[SDUnlockSetupCreateRecord setToken:](v9, "setToken:", v8);
  if (a5)
    -[SDUnlockSetupCreateRecord setErrorCode:](v9, "setErrorCode:", a5);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateRecord data](v9, "data"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001DFF90;
  v13[3] = &unk_1007147C8;
  v13[4] = self;
  objc_msgSend(v10, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v11, 102, v12, 0, v13);

}

- (void)sendSessionKeyExchangeRequest:(id)a3 usedEscrow:(BOOL)a4 sessionID:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  SDUnlockSessionKeyExchangeRequest *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(SDUnlockSessionKeyExchangeRequest);
  -[SDUnlockSessionKeyExchangeRequest setVersion:](v9, "setVersion:", 1);
  -[SDUnlockSessionKeyExchangeRequest setSessionID:](v9, "setSessionID:", v5);
  -[SDUnlockSessionKeyExchangeRequest setUsingRecord:](v9, "setUsingRecord:", v6);
  -[SDUnlockSessionKeyExchangeRequest setKey:](v9, "setKey:", v8);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest data](v9, "data"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001E00E0;
  v13[3] = &unk_1007147C8;
  v13[4] = self;
  objc_msgSend(v10, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v11, 103, v12, 0, v13);

  -[SDUnlockKeyManager setUnlockingState:](self, "setUnlockingState:", 1);
}

- (void)sendSessionAuthenticationToken:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SDUnlockSessionAuthToken *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SDUnlockSessionAuthToken);
  -[SDUnlockSessionAuthToken setVersion:](v7, "setVersion:", 1);
  -[SDUnlockSessionAuthToken setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockSessionAuthToken setAuthToken:](v7, "setAuthToken:", v6);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionAuthToken data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E028C;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v9, 104, v10, 1, v11);

  -[SDUnlockSessionManager restartUnlockTimer:](self, "restartUnlockTimer:", sub_10019AAC0((double)45));
  -[SDUnlockKeyManager setUnlockingState:](self, "setUnlockingState:", 2);

}

- (void)sendStashKeyRequest:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SDUnlockStashKeyExchangeRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SDUnlockStashKeyExchangeRequest);
  -[SDUnlockStashKeyExchangeRequest setVersion:](v7, "setVersion:", 1);
  -[SDUnlockStashKeyExchangeRequest setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockStashKeyExchangeRequest setKey:](v7, "setKey:", v6);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashKeyExchangeRequest data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E04A4;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v9, 105, v10, 1, v11);

  -[SDUnlockKeyManager restartStashTimer](self, "restartStashTimer");
}

- (void)sendStashToken:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SDUnlockStashToken *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SDUnlockStashToken);
  -[SDUnlockStashToken setVersion:](v7, "setVersion:", 1);
  -[SDUnlockStashToken setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockStashToken setStashToken:](v7, "setStashToken:", v6);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashToken data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E06A0;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v9, 106, v10, 1, v11);

  -[SDUnlockKeyManager restartStashTimer](self, "restartStashTimer");
}

- (void)sendStateRequest
{
  SDUnlockStateRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc_init(SDUnlockStateRequest);
  -[SDUnlockStateRequest setVersion:](v3, "setVersion:", 1);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStateRequest data](v3, "data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 10.0));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001E0870;
  v7[3] = &unk_1007147C8;
  v7[4] = self;
  objc_msgSend(v4, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v5, 3, v6, 1, v7);

  -[SDUnlockKeyManager restartStateTimer](self, "restartStateTimer");
}

- (void)sendRelockRequestWithReset:(BOOL)a3
{
  _BOOL4 v3;
  SDUnlockRelockRequest *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = a3;
  v5 = objc_alloc_init(SDUnlockRelockRequest);
  v6 = -[SDUnlockRelockRequest setVersion:](v5, "setVersion:", 1);
  v8 = paired_unlock_log(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending relock request", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockRelockRequest data](v5, "data"));
  objc_msgSend(v10, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v11, 111, 0, 1, &stru_10071AED8);

  if (v3)
  {
    v14 = paired_unlock_log(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cancelling session", v16, 2u);
    }

    -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
  }

}

- (BOOL)pairedWatchSupportsRelock
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[16];

  v3 = _os_feature_enabled_impl("Sharing", "pu_new_pill");
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeIDSDevice"));

    if (v6)
    {
      -[NSObject operatingSystemVersion](v6, "operatingSystemVersion");
      v7 = v12;
      -[NSObject operatingSystemVersion](v6, "operatingSystemVersion");
    }
    else
    {
      v7 = 0;
      v11 = 0;
    }
    v9 = v7 == qword_1007B3998 && v11 >= qword_1007B39A0 || v7 > qword_1007B3998;
  }
  else
  {
    v8 = paired_unlock_log(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Using old behavior", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldUseTwoPartPill
{
  unsigned int v3;

  if ((_os_feature_enabled_impl("Sharing", "pu_lock_button_all") & 1) != 0
    || (v3 = +[SFAutoUnlockManager autoUnlockEnabled](SFAutoUnlockManager, "autoUnlockEnabled")) != 0)
  {
    LOBYTE(v3) = -[SDUnlockKeyManager pairedWatchSupportsRelock](self, "pairedWatchSupportsRelock");
  }
  return v3;
}

- (BOOL)shouldStartUnlock
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  uint64_t v9;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  __int16 v15;
  uint8_t buf[2];

  v3 = -[SDUnlockKeyManager remoteDeviceLocked](self, "remoteDeviceLocked");
  if (v3)
  {
    if (self->_unlockingForKeybagUnlock)
    {
      v5 = paired_unlock_log(v3, v4);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 0;
        v7 = "Ongoing unlock. Not starting";
        v8 = (uint8_t *)&v15;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
    else
    {
      if (!-[SDUnlockKeyManager pairedWatchSupportsRelock](self, "pairedWatchSupportsRelock"))
        return 1;
      v11 = -[SDUnlockKeyManager needsOffWristBeforePairedUnlock](self, "needsOffWristBeforePairedUnlock");
      if (!v11)
        return 1;
      v13 = paired_unlock_log(v11, v12);
      v6 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 0;
        v7 = "Due to previous relock request, Paired Unlock disabled until watch goes off wrist";
        v8 = (uint8_t *)&v14;
        goto LABEL_7;
      }
    }
  }
  else
  {
    v9 = paired_unlock_log(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Not initiating, remote unlocked";
      v8 = buf;
      goto LABEL_7;
    }
  }

  return 0;
}

- (BOOL)startUnlockIfNeeded
{
  _BOOL8 v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = -[SDUnlockKeyManager unlockEnabled](self, "unlockEnabled");
  if (v3)
  {
    v5 = -[SDUnlockKeyManager shouldStartUnlock](self, "shouldStartUnlock");
    if (v5)
    {
      -[SDUnlockKeyManager initializeMetrics](self, "initializeMetrics");
      -[SDUnlockKeyManager initiateRemoteUnlock](self, "initiateRemoteUnlock");
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    v6 = paired_unlock_log(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not initiating, not enabled", v9, 2u);
    }

    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)initiateRemoteUnlock
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  SDUnlockSessionRecord *sessionRecord;
  void *v12;
  _BOOL8 useEscrowRecord;
  SDUnlockSessionRecord *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSDate *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSDate *deviceSwitchUnlockRetryDate;
  void *v45;
  int64_t v46;
  uint64_t v47;
  _BOOL4 v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  int64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  SDUnlockSessionRecord *v57;
  SDUnlockSessionRecord *v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  _BYTE v75[24];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = paired_unlock_log(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Initiating unlock", v75, 2u);
  }

  if (-[SDUnlockKeyManager unlockingState](self, "unlockingState"))
  {
    v7 = -[SDUnlockKeyManager unlockingState](self, "unlockingState");
    if (v7 == 1 && self->_sessionRecord)
    {
      v9 = paired_unlock_log(1, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        sessionRecord = self->_sessionRecord;
        *(_DWORD *)v75 = 138412290;
        *(_QWORD *)&v75[4] = sessionRecord;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unlock already in progress with record = %@", v75, 0xCu);
      }

      -[SDUnlockSessionRecord setExpireTime:](self->_sessionRecord, "setExpireTime:", dispatch_time(-[SDUnlockSessionRecord expireTime](self->_sessionRecord, "expireTime"), 45000000000));
      -[SDUnlockSessionManager restartUnlockTimer:](self, "restartUnlockTimer:", -[SDUnlockSessionRecord expireTime](self->_sessionRecord, "expireTime"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionRecord keyData](self->_sessionRecord, "keyData"));
      useEscrowRecord = self->_useEscrowRecord;
      v14 = self->_sessionRecord;
      goto LABEL_45;
    }
    v15 = paired_unlock_log(v7, v8);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1001E289C();

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      objc_msgSend(v18, "setFailureReason:", 20);

    }
    -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
    return;
  }
  -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
  v19 = -[SDUnlockSessionManager activeDevicesMatch](self, "activeDevicesMatch");
  if (!v19)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v37 = (NSDate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dateByAddingTimeInterval:", (double)qword_1007B39A8));

    v40 = paired_unlock_log(v38, v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_1001E283C();

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    if (v42)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      objc_msgSend(v43, "setFailureReason:", 18);

    }
    -[SDUnlockKeyManager resetState](self, "resetState");
    deviceSwitchUnlockRetryDate = self->_deviceSwitchUnlockRetryDate;
    self->_deviceSwitchUnlockRetryDate = v37;

    return;
  }
  v21 = paired_unlock_log(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Active devices match", v75, 2u);
  }

  v25 = paired_unlock_log(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_useEscrowRecord)
      v27 = CFSTR("YES");
    else
      v27 = CFSTR("NO");
    *(_DWORD *)v75 = 138412290;
    *(_QWORD *)&v75[4] = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Using escrow record = %@", v75, 0xCu);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  if (v28)
  {
    v29 = self->_useEscrowRecord;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    objc_msgSend(v30, "setUsingEscrowRecord:", v29);

  }
  if (self->_useEscrowRecord)
    goto LABEL_25;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  -[SDUnlockSessionManager setUnlockAuthSession:](self, "setUnlockAuthSession:", objc_msgSend(v45, "unlockSessionAsOriginator:usingEscrow:escrowSecret:", 1, 0, 0));

  v46 = -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession");
  if (v46 < 0)
  {
    v73 = paired_unlock_log(v46, v47);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Falling back to escrow record", v75, 2u);
    }

    self->_useEscrowRecord = 1;
LABEL_25:
    *(_DWORD *)v75 = 0;
    goto LABEL_26;
  }
  v48 = self->_useEscrowRecord;
  *(_DWORD *)v75 = 0;
  if (!v48)
    goto LABEL_42;
LABEL_26:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager", *(_QWORD *)v75));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "escrowData"));

  if (v32)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    -[SDUnlockSessionManager setUnlockAuthSession:](self, "setUnlockAuthSession:", objc_msgSend(v35, "unlockSessionAsOriginator:usingEscrow:escrowSecret:errorCode:", 1, 1, v32, v75));
  }
  else
  {
    v49 = paired_unlock_log(v33, v34);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_1001E2810();

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    if (!v51)
      goto LABEL_41;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    objc_msgSend(v35, "setFailureReason:", 23);
  }

LABEL_41:
LABEL_42:
  v52 = -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession", *(_QWORD *)v75);
  if ((v52 & 0x8000000000000000) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "stepWithAuthSession:data:", -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession"), 0));

    if (!v12)
    {
      v69 = paired_unlock_log(v55, v56);
      v70 = objc_claimAutoreleasedReturnValue(v69);
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        sub_1001E2740();

      v71 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      if (v71)
      {
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
        objc_msgSend(v72, "setFailureReason:", 21);

      }
      -[SDUnlockKeyManager resetState](self, "resetState");
      goto LABEL_46;
    }
    v57 = objc_alloc_init(SDUnlockSessionRecord);
    v58 = self->_sessionRecord;
    self->_sessionRecord = v57;

    -[SDUnlockSessionRecord setKeyData:](self->_sessionRecord, "setKeyData:", v12);
    -[SDUnlockSessionRecord setUnlockSessionID:](self->_sessionRecord, "setUnlockSessionID:", -[SDUnlockSessionManager generateSessionID](self, "generateSessionID"));
    -[SDUnlockSessionRecord setExpireTime:](self->_sessionRecord, "setExpireTime:", sub_10019AAC0((double)65));
    -[SDUnlockSessionManager restartUnlockTimer:](self, "restartUnlockTimer:", -[SDUnlockSessionRecord expireTime](self->_sessionRecord, "expireTime"));
    useEscrowRecord = self->_useEscrowRecord;
    v14 = self->_sessionRecord;
LABEL_45:
    -[SDUnlockKeyManager sendSessionKeyExchangeRequest:usedEscrow:sessionID:](self, "sendSessionKeyExchangeRequest:usedEscrow:sessionID:", v12, useEscrowRecord, -[SDUnlockSessionRecord unlockSessionID](v14, "unlockSessionID"));
LABEL_46:

    return;
  }
  v59 = paired_unlock_log(v52, v53);
  v60 = objc_claimAutoreleasedReturnValue(v59);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    sub_1001E27A4((int *)v75, v60, v61);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  if (v62)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    objc_msgSend(v63, "setFailureReason:", 21);

  }
  v64 = -[SDUnlockKeyManager resetAndClearState](self, "resetAndClearState");
  if (*(_DWORD *)v75 == -536870174 || *(_DWORD *)v75 == -536362984 || *(_DWORD *)v75 == -536362989)
  {
    v65 = auto_unlock_log(v64);
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
      sub_1001E276C();

    v67 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    if (v67)
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
      objc_msgSend(v68, "setFailureReason:", 22);

    }
    -[SDUnlockKeyManager disableUnlockPairing](self, "disableUnlockPairing");
    -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    objc_msgSend(v12, "deleteLongTermKeys");
    goto LABEL_46;
  }
}

- (BOOL)initiateStashBagCreationWithManifest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "escrowData"));

  if (!v6)
  {
    v15 = paired_unlock_log(v7, v8);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1001E2928();
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  -[SDUnlockSessionManager setStashBagSession:](self, "setStashBagSession:", objc_msgSend(v9, "stashBagSessionAsOriginator:escrowSecret:manifest:", 1, v6, v4));

  v10 = -[SDUnlockSessionManager stashBagSession](self, "stashBagSession");
  if (v10 < 0)
  {
    v17 = paired_unlock_log(v10, v11);
    v16 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1001E2954();
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stepWithAuthSession:data:", -[SDUnlockSessionManager stashBagSession](self, "stashBagSession"), 0));

  v14 = v13 != 0;
  if (v13)
    -[SDUnlockKeyManager sendStashKeyRequest:sessionID:](self, "sendStashKeyRequest:sessionID:", v13, -[SDUnlockSessionManager generateSessionID](self, "generateSessionID"));

LABEL_11:
  return v14;
}

- (void)initializeMetrics
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  _BYTE *v10;
  _BYTE *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = objc_alloc_init((Class)SFPairedUnlockEvent);
  -[SDUnlockSessionManager setMetrics:](self, "setMetrics:", v3);

  v4 = +[SFAutoUnlockManager autoUnlockEnabled](SFAutoUnlockManager, "autoUnlockEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  objc_msgSend(v5, "setPhoneAutoUnlockEnabled:", v4);

  v6 = -[SDUnlockKeyManager shouldUseTwoPartPill](self, "shouldUseTwoPartPill");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  objc_msgSend(v7, "setCanRelock:", v6);

  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components:fromDate:", 32, v23));
  v10 = objc_msgSend(v9, "hour");
  v11 = objc_msgSend(v8, "maximumRangeOfUnit:", 32);
  v13 = (uint64_t)((double)(unint64_t)(v10 - v11) / (double)v12 * 24.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  objc_msgSend(v14, "setAttemptHourLocal:", (unsigned __int16)v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeIDSDevice"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "productBuildVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  objc_msgSend(v18, "setWatchSoftwareVersion:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "modelIdentifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
  objc_msgSend(v20, "setWatchHardwareModel:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockKeyManager metricDates](self, "metricDates"));
  objc_msgSend(v22, "setStarted:", v21);

}

- (void)consolidateLatencies:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;

  v50 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  if (v50)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "started"));
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

      if (v7)
      {
        dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "keyExchangeResponseReceived"));

        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "keyExchangeResponseReceived"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "started"));
          objc_msgSend(v9, "timeIntervalSinceDate:", v10);
          v12 = v11;

          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          objc_msgSend(v13, "setKeyExchangeDuration:", (v12 * 1000.0));
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "started"));
          objc_msgSend(v4, "timeIntervalSinceDate:", v13);
          v15 = (v14 * 1000.0);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          objc_msgSend(v16, "setKeyExchangeDuration:", v15);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "keyExchangeResponseReceived"));
        v18 = v50;
        if (v17
          && (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "pillUpdated")),
              v19,
              v17,
              v18 = v50,
              v19))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "pillUpdated"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "keyExchangeResponseReceived"));
          objc_msgSend(v20, "timeIntervalSinceDate:", v21);
          v23 = (v22 * 1000.0);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          objc_msgSend(v24, "setPillDelay:", v23);

        }
        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "keyExchangeResponseReceived"));

          v26 = v50;
          if (!v25)
          {
LABEL_13:
            v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "pillUpdated"));
            if (v29
              && (v30 = (void *)v29,
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "confirmationReceived")),
                  v31,
                  v30,
                  v31))
            {
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "confirmationReceived"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "pillUpdated"));
              objc_msgSend(v32, "timeIntervalSinceDate:", v33);
              v35 = v34;

              v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
              objc_msgSend(v36, "setConfirmationDuration:", (v35 * 1000.0));
            }
            else
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "pillUpdated"));

              v38 = v50;
              if (!v37)
              {
LABEL_19:
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "started"));
                objc_msgSend(v4, "timeIntervalSinceDate:", v42);
                v44 = (v43 * 1000.0);
                v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
                objc_msgSend(v45, "setTotalUnlockDuration:", v44);

                v46 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
                LODWORD(v44) = objc_msgSend(v46, "keyExchangeDuration");
                v47 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
                v48 = objc_msgSend(v47, "confirmationDuration") + v44;
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
                objc_msgSend(v49, "setTotalUnlockProcessDuration:", v48);

                goto LABEL_20;
              }
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "pillUpdated"));
              objc_msgSend(v4, "timeIntervalSinceDate:", v36);
              v40 = (v39 * 1000.0);
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
              objc_msgSend(v41, "setConfirmationDuration:", v40);

            }
            v38 = v50;
            goto LABEL_19;
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "keyExchangeResponseReceived"));
          objc_msgSend(v4, "timeIntervalSinceDate:", v20);
          v28 = (v27 * 1000.0);
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
          objc_msgSend(v21, "setPillDelay:", v28);
        }

        v26 = v50;
        goto LABEL_13;
      }
    }
  }
LABEL_20:

}

- (BOOL)useEscrowRecord
{
  return self->_useEscrowRecord;
}

- (void)setUseEscrowRecord:(BOOL)a3
{
  self->_useEscrowRecord = a3;
}

- (NSTimer)stashTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStashTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)remoteDeviceLocked
{
  return self->_remoteDeviceLocked;
}

- (void)setRemoteDeviceLocked:(BOOL)a3
{
  self->_remoteDeviceLocked = a3;
}

- (BOOL)ltkWaitingForUnlock
{
  return self->_ltkWaitingForUnlock;
}

- (void)setLtkWaitingForUnlock:(BOOL)a3
{
  self->_ltkWaitingForUnlock = a3;
}

- (BOOL)outstandingStartLTK
{
  return self->_outstandingStartLTK;
}

- (void)setOutstandingStartLTK:(BOOL)a3
{
  self->_outstandingStartLTK = a3;
}

- (BOOL)unlockingForKeybagUnlock
{
  return self->_unlockingForKeybagUnlock;
}

- (void)setUnlockingForKeybagUnlock:(BOOL)a3
{
  self->_unlockingForKeybagUnlock = a3;
}

- (BOOL)needsOffWristBeforePairedUnlock
{
  return self->_needsOffWristBeforePairedUnlock;
}

- (void)setNeedsOffWristBeforePairedUnlock:(BOOL)a3
{
  self->_needsOffWristBeforePairedUnlock = a3;
}

- (BOOL)autoUnlockEnabledUpdatedAfterFirstUnlock
{
  return self->_autoUnlockEnabledUpdatedAfterFirstUnlock;
}

- (void)setAutoUnlockEnabledUpdatedAfterFirstUnlock:(BOOL)a3
{
  self->_autoUnlockEnabledUpdatedAfterFirstUnlock = a3;
}

- (BOOL)waitingForAutoUnlockStateUpdateToStartPairedUnlock
{
  return self->_waitingForAutoUnlockStateUpdateToStartPairedUnlock;
}

- (void)setWaitingForAutoUnlockStateUpdateToStartPairedUnlock:(BOOL)a3
{
  self->_waitingForAutoUnlockStateUpdateToStartPairedUnlock = a3;
}

- (NSDate)deviceSwitchUnlockRetryDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceSwitchUnlockRetryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_dispatch_source)delayedStartTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDelayedStartTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_source)stateTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStateTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (OS_dispatch_source)longTermKeyTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLongTermKeyTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (SDUnlockSessionRecord)sessionRecord
{
  return (SDUnlockSessionRecord *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSessionRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (SDUnlockKeyMetricDates)metricDates
{
  return (SDUnlockKeyMetricDates *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMetricDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (id)stashHandler
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setStashHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (id)stateHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setStateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (id)keybagAssertion
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setKeybagAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keybagAssertion, 0);
  objc_storeStrong(&self->_stateHandler, 0);
  objc_storeStrong(&self->_stashHandler, 0);
  objc_storeStrong((id *)&self->_metricDates, 0);
  objc_storeStrong((id *)&self->_sessionRecord, 0);
  objc_storeStrong((id *)&self->_longTermKeyTimer, 0);
  objc_storeStrong((id *)&self->_stateTimer, 0);
  objc_storeStrong((id *)&self->_delayedStartTimer, 0);
  objc_storeStrong((id *)&self->_deviceSwitchUnlockRetryDate, 0);
  objc_storeStrong((id *)&self->_stashTimer, 0);
}

@end
