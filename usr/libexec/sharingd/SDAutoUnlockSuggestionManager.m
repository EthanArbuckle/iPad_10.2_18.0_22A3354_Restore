@implementation SDAutoUnlockSuggestionManager

- (SDAutoUnlockSuggestionManager)init
{
  SDAutoUnlockSuggestionManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *suggestionManagerQueue;
  NSUUID *v5;
  NSUUID *suggestionManagerSessionID;
  NSMutableArray *v7;
  NSMutableArray *foundPeers;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SDAutoUnlockSuggestionManager;
  v2 = -[SDAutoUnlockSuggestionManager init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.sharingd.auto-unlock.suggestion-manager-queue", 0);
    suggestionManagerQueue = v2->_suggestionManagerQueue;
    v2->_suggestionManagerQueue = (OS_dispatch_queue *)v3;

    v5 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("C42094B4-B936-4673-8034-4EEFD437BEB0"));
    suggestionManagerSessionID = v2->_suggestionManagerSessionID;
    v2->_suggestionManagerSessionID = v5;

    v7 = objc_opt_new(NSMutableArray);
    foundPeers = v2->_foundPeers;
    v2->_foundPeers = v7;

    -[SDAutoUnlockSuggestionManager loadSuggestedPeers](v2, "loadSuggestedPeers");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    objc_msgSend(v9, "addClient:forIdentifer:", v2, CFSTR("C42094B4-B936-4673-8034-4EEFD437BEB0"));

    -[SDAutoUnlockSuggestionManager addObservers](v2, "addObservers");
  }
  return v2;
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_systemWillSleep", CFSTR("com.apple.sharingd.SystemWillSleep"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_systemHasPoweredOn", CFSTR("com.apple.sharingd.SystemHasPoweredOn"), 0);

}

- (void)handleTestSuggestion
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (IsAppleInternalBuild(self, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager testDeviceID](self, "testDeviceID"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "autoUnlockDeviceForDeviceID:", v4));

    if (v6)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
      objc_msgSend(v5, "setObject:atIndexedSubscript:", v6, 0);

      -[SDAutoUnlockSuggestionManager postSuggestionNotification](self, "postSuggestionNotification");
    }

  }
}

- (void)screenLockUnlocked:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = auto_unlock_log(self);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received screen lock unlocked notification", v7, 2u);
  }

  -[SDAutoUnlockSuggestionManager triggerDevicesIfNeeded](self, "triggerDevicesIfNeeded");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  objc_msgSend(v6, "updateDynamicStoreEnabled");

  -[SDAutoUnlockSuggestionManager setupRetryIfNeeded](self, "setupRetryIfNeeded");
}

- (void)setupRetryIfNeeded
{
  unsigned int v3;
  _BOOL8 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;

  if (IsAppleInternalBuild(self, a2))
  {
    v3 = -[SDAutoUnlockSuggestionManager retriedSetup](self, "retriedSetup");
    v4 = -[SDAutoUnlockSuggestionManager alwaysShowSetupRetry](self, "alwaysShowSetupRetry");
    v5 = v4;
    if ((!v3 || v4)
      && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager lastSuccessfulDevice](self, "lastSuccessfulDevice")),
          v6,
          v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager lastSuccessfulDevice](self, "lastSuccessfulDevice"));
      -[SDAutoUnlockSuggestionManager setSetupRetryDevice:](self, "setSetupRetryDevice:", v7);

      -[SDAutoUnlockSuggestionManager setLastSuccessfulDevice:](self, "setLastSuccessfulDevice:", 0);
      v14 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockNotificationsManager sharedManager](SDAutoUnlockNotificationsManager, "sharedManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDevice](self, "setupRetryDevice"));
      objc_msgSend(v14, "showSetupRetryNotificationWithDevice:", v8);

    }
    else
    {
      v9 = auto_unlock_log(v4);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v3)
          v11 = CFSTR("YES");
        else
          v11 = CFSTR("NO");
        if (v5)
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager lastSuccessfulDevice](self, "lastSuccessfulDevice"));
        *(_DWORD *)buf = 138412802;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not initiating setup retry (already retried: %@, always show: %@, lastSuccessfulDevice: %@)", buf, 0x20u);

      }
    }
  }
}

- (void)setupRetryNotificationDismissed
{
  -[SDAutoUnlockSuggestionManager setRetriedSetup](self, "setRetriedSetup");
  -[SDAutoUnlockSuggestionManager setSetupRetryDevice:](self, "setSetupRetryDevice:", 0);
}

- (void)setSetupRetryDeviceID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_setupRetryDeviceID, a3);
  if (!self->_setupRetryDeviceID)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Retry setup device ID cleared", v7, 2u);
    }

    -[SDAutoUnlockSuggestionManager invalidateSuggestedDeviceTimer](self, "invalidateSuggestedDeviceTimer");
  }
}

- (void)restartSetupRetryDeviceTimer:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting retry setup device timer", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001C747C;
    v14[3] = &unk_1007146D8;
    v14[4] = self;
    v9 = sub_10019AAD8(0, v8, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockSuggestionManager setSetupRetryDeviceTimer:](self, "setSetupRetryDeviceTimer:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
    dispatch_resume(v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
  v13 = sub_10019AAC0((double)a3);
  sub_10019AB78(v12, v13);

}

- (void)invalidateSetupRetryDeviceTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding setup device device timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager setupRetryDeviceTimer](self, "setupRetryDeviceTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSuggestionManager setSetupRetryDeviceTimer:](self, "setSetupRetryDeviceTimer:", 0);
  }
}

- (void)postNotificationIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
    objc_msgSend(v5, "sortUsingComparator:", &stru_10071A820);

    v7 = auto_unlock_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
      v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Suggestion Found Peers %@", (uint8_t *)&v10, 0xCu);

    }
    -[SDAutoUnlockSuggestionManager postSuggestionNotification](self, "postSuggestionNotification");
  }
}

- (void)postSuggestionNotification
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  -[SDAutoUnlockSuggestionManager setSuggestedPeer:](self, "setSuggestedPeer:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockNotificationsManager sharedManager](SDAutoUnlockNotificationsManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeer](self, "suggestedPeer"));
  objc_msgSend(v6, "showSuggestionNotificationWithDevice:", v5);

}

- (void)setSuggestedDeviceID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_storeStrong((id *)&self->_suggestedDeviceID, a3);
  if (!self->_suggestedDeviceID)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Suggested device ID cleared", v7, 2u);
    }

    -[SDAutoUnlockSuggestionManager invalidateSuggestedDeviceTimer](self, "invalidateSuggestedDeviceTimer");
  }
}

- (void)restartSuggestedDeviceTimer:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting suggested device timer", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001C7970;
    v14[3] = &unk_1007146D8;
    v14[4] = self;
    v9 = sub_10019AAD8(0, v8, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockSuggestionManager setDeviceTimer:](self, "setDeviceTimer:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
    dispatch_resume(v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
  v13 = sub_10019AAC0((double)a3);
  sub_10019AB78(v12, v13);

}

- (void)invalidateSuggestedDeviceTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding suggested device timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager deviceTimer](self, "deviceTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSuggestionManager setDeviceTimer:](self, "setDeviceTimer:", 0);
  }
}

- (void)updateSuggestionService
{
  void *v3;
  dispatch_time_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v3, "addServiceClientForIdentifier:", CFSTR("com.apple.sharing.auto-unlock-suggestion-manager"));

  v4 = sub_10019AAC0(30.0);
  -[SDAutoUnlockSuggestionManager restartServiceTimer:](self, "restartServiceTimer:", v4);
}

- (void)invalidateSuggestionService
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  objc_msgSend(v3, "removeServiceClientForIdentifier:", CFSTR("com.apple.sharing.auto-unlock-suggestion-manager"));

  -[SDAutoUnlockSuggestionManager invalidateServiceTimer](self, "invalidateServiceTimer");
}

- (void)restartServiceTimer:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting suggestion service timer", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001C7C54;
    v13[3] = &unk_1007146D8;
    v13[4] = self;
    v9 = sub_10019AAD8(0, v8, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockSuggestionManager setServiceTimer:](self, "setServiceTimer:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
    dispatch_resume(v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
  sub_10019AB78(v12, a3);

}

- (void)invalidateServiceTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion service timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager serviceTimer](self, "serviceTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSuggestionManager setServiceTimer:](self, "setServiceTimer:", 0);
  }
}

- (void)startScanningForIDSDeviceIDs:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  NSMutableSet *v45;
  _BYTE v46[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));

  if (v5)
  {
    v7 = auto_unlock_log(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Already scanning for suggestions", buf, 2u);
    }
LABEL_19:

    -[SDAutoUnlockSuggestionManager restartScanTimer:](self, "restartScanTimer:", sub_10019AAC0(30.0));
    goto LABEL_20;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "autoUnlockEligibleWatches"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));

  v12 = objc_opt_new(NSMutableSet);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = v11;
  v13 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueID"));
        v18 = objc_msgSend(v4, "containsObject:", v17);

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bluetoothID"));
          -[NSMutableSet addObject:](v12, "addObject:", v19);

        }
      }
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v13);
  }

  if (-[NSMutableSet count](v12, "count"))
  {
    location = 0;
    objc_initWeak(&location, self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));
      objc_msgSend(v21, "invalidate");

    }
    v22 = objc_msgSend(objc_alloc((Class)SFBLEScanner), "initWithType:", 16);
    -[SDAutoUnlockSuggestionManager setScanner:](self, "setScanner:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));
    objc_msgSend(v24, "setDispatchQueue:", v23);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1001C821C;
    v37[3] = &unk_100717340;
    objc_copyWeak(&v38, &location);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));
    objc_msgSend(v25, "setDeviceFoundHandler:", v37);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));
    objc_msgSend(v26, "setInvalidationHandler:", &stru_10071A840);

    v28 = auto_unlock_log(v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v12;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Suggestion scanning for bluetooth IDs %@", buf, 0xCu);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v12, "allObjects"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));
    objc_msgSend(v31, "setDeviceFilter:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v12, "allObjects"));
    -[SDAutoUnlockSuggestionManager setCurrentBluetoothIDs:](self, "setCurrentBluetoothIDs:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1001C82DC;
    v36[3] = &unk_1007147C8;
    v36[4] = self;
    objc_msgSend(v33, "activateWithCompletion:", v36);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

    goto LABEL_19;
  }
  v34 = auto_unlock_log(0);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No devices to scan for, not starting suggetion scanner", buf, 2u);
  }

LABEL_20:
}

- (void)handleFoundPeer:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  unsigned __int8 v27;
  _BYTE v28[22];
  __int16 v29;
  const __CFString *v30;

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v28 = 138412290;
    *(_QWORD *)&v28[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Suggestion manager found peer: %@", v28, 0xCu);
  }

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager currentBluetoothIDs](self, "currentBluetoothIDs")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier")),
        v11 = objc_msgSend(v9, "containsObject:", v10),
        v10,
        v9,
        v8,
        v11))
  {
    v12 = sub_1000C7FF0(v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "autoUnlockDeviceForBluetoothID:", v14));

    if (v15)
    {
      v16 = -[NSObject supportsAdvertisingUnlocked](v15, "supportsAdvertisingUnlocked");
      v17 = v16 ^ 1 | v12;
    }
    else
    {
      v17 = 0;
    }
    v21 = auto_unlock_log(v16);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      if (v15)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      if (-[NSObject supportsAdvertisingUnlocked](v15, "supportsAdvertisingUnlocked"))
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      *(_DWORD *)v28 = 138412802;
      *(_QWORD *)&v28[4] = v23;
      if (v12)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      *(_WORD *)&v28[12] = 2112;
      *(_QWORD *)&v28[14] = v24;
      v29 = 2112;
      v30 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Suggestion manager peer (device: %@, supports advertising unlocked: %@, unlocked on wrist: %@)", v28, 0x20u);
    }

    if (v17)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
      if ((objc_msgSend(v26, "containsObject:", v4) & 1) != 0)
      {
LABEL_27:

        goto LABEL_28;
      }
      v27 = -[NSObject unlockEnabled](v15, "unlockEnabled");

      if ((v27 & 1) == 0)
      {
        if (!-[SDAutoUnlockSuggestionManager foundFirstPeer](self, "foundFirstPeer"))
        {
          -[SDAutoUnlockSuggestionManager setFoundFirstPeer:](self, "setFoundFirstPeer:", 1);
          -[SDAutoUnlockSuggestionManager restartScanTimer:](self, "restartScanTimer:", sub_10019AAC0(3.0));
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers", *(_OWORD *)v28));
        objc_msgSend(v26, "addObject:", v15);
        goto LABEL_27;
      }
    }
  }
  else
  {
    v18 = auto_unlock_log(v7);
    v15 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)&v28[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not looking for peer, ignoring: %@", v28, 0xCu);

    }
  }
LABEL_28:

}

- (void)invalidateScanner
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));

  if (v3)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating suggestion scanner", v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanner](self, "scanner"));
    objc_msgSend(v7, "invalidate");

    -[SDAutoUnlockSuggestionManager setScanner:](self, "setScanner:", 0);
    -[SDAutoUnlockSuggestionManager setCurrentBluetoothIDs:](self, "setCurrentBluetoothIDs:", 0);
    -[SDAutoUnlockSuggestionManager setFoundFirstPeer:](self, "setFoundFirstPeer:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager foundPeers](self, "foundPeers"));
    objc_msgSend(v8, "removeAllObjects");

    -[SDAutoUnlockSuggestionManager invalidateScanTimer](self, "invalidateScanTimer");
  }
}

- (void)restartScanTimer:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint8_t buf[16];

  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting suggestion scan timer", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
  if (!v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001C888C;
    v12[3] = &unk_1007146D8;
    v12[4] = self;
    v8 = sub_10019AAD8(0, &_dispatch_main_q, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[SDAutoUnlockSuggestionManager setScanTimer:](self, "setScanTimer:", v9);

    v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
    dispatch_resume(v10);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
  sub_10019AB78(v11, a3);

}

- (void)invalidateScanTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion scan timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager scanTimer](self, "scanTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSuggestionManager setScanTimer:](self, "setScanTimer:", 0);
  }
}

- (void)sendStartAdvertisingToDeviceID:(id)a3
{
  id v4;
  SDAutoUnlockStartAdvertising *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = objc_opt_new(SDAutoUnlockStartAdvertising);
  -[SDAutoUnlockStartAdvertising setVersion:](v5, "setVersion:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockStartAdvertising data](v5, "data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerSessionID](self, "suggestionManagerSessionID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 15));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001C8AC8;
  v11[3] = &unk_1007147C8;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v6, "sendPayload:toDevice:type:sessionID:timeout:errorHandler:", v7, v10, 401, v8, v9, v11);

}

- (void)transport:(id)a3 didReceivePayload:(id)a4 type:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SDAutoUnlockSuggestionManager *v17;
  unsigned __int16 v18;

  v9 = a4;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestionManagerQueue](self, "suggestionManagerQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001C8BDC;
  v14[3] = &unk_1007145F8;
  v18 = a5;
  v15 = v10;
  v16 = v9;
  v17 = self;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, v14);

}

- (void)watchAvailableForUnlockWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)shouldSendRequestsForDeviceID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  BOOL v11;
  int v13;
  id v14;
  __int16 v15;
  const __CFString *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v6 = objc_msgSend(v5, "deviceEnabledAsKey:", v4);

  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v6)
      v10 = CFSTR("YES");
    v13 = 138412546;
    v14 = v4;
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Should send request (device: %@ enabled: %@)", (uint8_t *)&v13, 0x16u);
  }

  if ((v6 & 1) != 0)
    v11 = 0;
  else
    v11 = -[SDAutoUnlockSuggestionManager canSuggestForDeviceID:](self, "canSuggestForDeviceID:", v4);

  return v11;
}

- (BOOL)canSuggestForDeviceID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDate *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  BOOL v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("AutoUnlockPeerRetries")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AutoUnlockRetryDate")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AutoUnlockRetryMultiplier")));
  v9 = (uint64_t)objc_msgSend(v8, "integerValue");
  if (v9 > 2048)
  {
    v17 = auto_unlock_log(v9);
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412546;
      v21 = v3;
      v22 = 2048;
      v23 = objc_msgSend(v8, "integerValue");
      v16 = "Reached limit of suggestions (device %@, multiplier: %ld)";
      goto LABEL_8;
    }
  }
  else
  {
    if (!v7
      || (v10 = objc_opt_new(NSDate),
          -[NSDate timeIntervalSinceDate:](v10, "timeIntervalSinceDate:", v7),
          v12 = v11,
          v10,
          v12 >= 0.0))
    {
      v18 = 1;
      goto LABEL_11;
    }
    v14 = auto_unlock_log(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412546;
      v21 = v3;
      v22 = 2112;
      v23 = v7;
      v16 = "Suggestions still backing off (device %@, retry date %@)";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0x16u);
    }
  }

  v18 = 0;
LABEL_11:

  return v18;
}

- (void)updateDefaultsForDeviceID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t v11;
  double v12;
  NSDate *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("AutoUnlockPeerRetries")));
  v6 = (NSMutableDictionary *)objc_msgSend(v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v3));
  v8 = (NSMutableDictionary *)objc_msgSend(v7, "mutableCopy");

  v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("AutoUnlockRetryMultiplier")));
  if (v9)
    v10 = (_UNKNOWN **)v9;
  else
    v10 = &off_10074BA90;
  if ((uint64_t)objc_msgSend(v10, "integerValue") > 128)
  {
    v12 = 604800.0;
  }
  else
  {
    v11 = (uint64_t)objc_msgSend(v10, "integerValue");
    if (v11 >= 24)
      v12 = (double)(3600 * v11);
    else
      v12 = 86400.0;
  }
  v13 = objc_opt_new(NSDate);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate dateByAddingTimeInterval:](v13, "dateByAddingTimeInterval:", v12));

  v16 = auto_unlock_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138413058;
    v21 = v3;
    v22 = 2048;
    v23 = objc_msgSend(v10, "integerValue");
    v24 = 2048;
    v25 = (uint64_t)v12;
    v26 = 2112;
    v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Next suggestion (device: %@, multiplier: %ld, seconds: %ld, retry date %@)", (uint8_t *)&v20, 0x2Au);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 2 * (_QWORD)objc_msgSend(v10, "integerValue")));
  if (!v8)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    if (v6)
      goto LABEL_13;
LABEL_15:
    v6 = objc_opt_new(NSMutableDictionary);
    goto LABEL_13;
  }
  if (!v6)
    goto LABEL_15;
LABEL_13:
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, CFSTR("AutoUnlockRetryDate"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v18, CFSTR("AutoUnlockRetryMultiplier"));
  v19 = -[NSMutableDictionary copy](v8, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v19, v3);

  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("AutoUnlockPeerRetries"));
  objc_msgSend(v4, "synchronize");

}

- (BOOL)featureSuggestedForDeviceID:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeers](self, "suggestedPeers"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setFeatureSuggestedForDeviceID:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting feature suggested for device: %@", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeers](self, "suggestedPeers"));
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeers](self, "suggestedPeers"));
      objc_msgSend(v9, "addObject:", v4);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSuggestionManager suggestedPeers](self, "suggestedPeers"));
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("AutoUnlockSuggestedPeers"));

      objc_msgSend(v10, "synchronize");
    }
  }

}

- (void)loadSuggestedPeers
{
  void *v3;
  uint64_t v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("AutoUnlockSuggestedPeers")));
  if (v3 && (v4 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
  else
    v5 = objc_opt_new(NSMutableArray);
  v6 = v5;
  -[SDAutoUnlockSuggestionManager setSuggestedPeers:](self, "setSuggestedPeers:", v5);

}

- (BOOL)retriedSetup
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("AutoUnlockSetupRetryVersion"));
  v4 = auto_unlock_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retry version: %ld", (uint8_t *)&v7, 0xCu);
  }

  return (uint64_t)v3 > 0;
}

- (void)setRetriedSetup
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "setInteger:forKey:", 1, CFSTR("AutoUnlockSetupRetryVersion"));

}

- (BOOL)suggestionsEnabled
{
  return sub_1000CE8D0(CFSTR("AUSuggestionsEnabled"), 1) != 0;
}

- (BOOL)ignoreBackOff
{
  return sub_1000CE8D0(CFSTR("AUSuggestionsIgnoreBackoff"), 0) != 0;
}

- (id)testDeviceID
{
  return (id)(id)sub_1000CE9F0(CFSTR("AUSuggestionsTestDeviceID"));
}

- (BOOL)alwaysShowSetupRetry
{
  return sub_1000CE8D0(CFSTR("AUAlwaysShowSetupRetry"), 0) != 0;
}

- (void)_systemWillSleep
{
  NSObject *suggestionManagerQueue;
  _QWORD block[5];

  suggestionManagerQueue = self->_suggestionManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C97D8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(suggestionManagerQueue, block);
}

- (void)_systemHasPoweredOn
{
  NSObject *suggestionManagerQueue;
  _QWORD block[5];

  suggestionManagerQueue = self->_suggestionManagerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001C9838;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(suggestionManagerQueue, block);
}

- (NSString)suggestedDeviceID
{
  return self->_suggestedDeviceID;
}

- (NSString)setupRetryDeviceID
{
  return self->_setupRetryDeviceID;
}

- (SFAutoUnlockDevice)lastSuccessfulDevice
{
  return self->_lastSuccessfulDevice;
}

- (void)setLastSuccessfulDevice:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulDevice, a3);
}

- (BOOL)foundFirstPeer
{
  return self->_foundFirstPeer;
}

- (void)setFoundFirstPeer:(BOOL)a3
{
  self->_foundFirstPeer = a3;
}

- (SFBLEScanner)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
  objc_storeStrong((id *)&self->_scanner, a3);
}

- (NSMutableArray)foundPeers
{
  return self->_foundPeers;
}

- (void)setFoundPeers:(id)a3
{
  objc_storeStrong((id *)&self->_foundPeers, a3);
}

- (OS_dispatch_source)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scanTimer, a3);
}

- (NSArray)currentBluetoothIDs
{
  return self->_currentBluetoothIDs;
}

- (void)setCurrentBluetoothIDs:(id)a3
{
  objc_storeStrong((id *)&self->_currentBluetoothIDs, a3);
}

- (OS_dispatch_source)serviceTimer
{
  return self->_serviceTimer;
}

- (void)setServiceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_serviceTimer, a3);
}

- (OS_dispatch_source)deviceTimer
{
  return self->_deviceTimer;
}

- (void)setDeviceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTimer, a3);
}

- (OS_dispatch_source)setupRetryDeviceTimer
{
  return self->_setupRetryDeviceTimer;
}

- (void)setSetupRetryDeviceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_setupRetryDeviceTimer, a3);
}

- (NSMutableArray)suggestedPeers
{
  return self->_suggestedPeers;
}

- (void)setSuggestedPeers:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedPeers, a3);
}

- (SFAutoUnlockDevice)suggestedPeer
{
  return self->_suggestedPeer;
}

- (void)setSuggestedPeer:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedPeer, a3);
}

- (NSUUID)suggestionManagerSessionID
{
  return self->_suggestionManagerSessionID;
}

- (void)setSuggestionManagerSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionManagerSessionID, a3);
}

- (SFAutoUnlockDevice)setupRetryDevice
{
  return self->_setupRetryDevice;
}

- (void)setSetupRetryDevice:(id)a3
{
  objc_storeStrong((id *)&self->_setupRetryDevice, a3);
}

- (OS_dispatch_queue)suggestionManagerQueue
{
  return self->_suggestionManagerQueue;
}

- (void)setSuggestionManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionManagerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionManagerQueue, 0);
  objc_storeStrong((id *)&self->_setupRetryDevice, 0);
  objc_storeStrong((id *)&self->_suggestionManagerSessionID, 0);
  objc_storeStrong((id *)&self->_suggestedPeer, 0);
  objc_storeStrong((id *)&self->_suggestedPeers, 0);
  objc_storeStrong((id *)&self->_setupRetryDeviceTimer, 0);
  objc_storeStrong((id *)&self->_deviceTimer, 0);
  objc_storeStrong((id *)&self->_serviceTimer, 0);
  objc_storeStrong((id *)&self->_currentBluetoothIDs, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_foundPeers, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_lastSuccessfulDevice, 0);
  objc_storeStrong((id *)&self->_setupRetryDeviceID, 0);
  objc_storeStrong((id *)&self->_suggestedDeviceID, 0);
}

@end
