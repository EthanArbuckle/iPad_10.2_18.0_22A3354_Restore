@implementation SDAutoUnlockKeySession

- (SDAutoUnlockKeySession)initWithBLEDevice:(id)a3 sessionID:(id)a4
{
  id v6;
  SDAutoUnlockKeySession *v7;
  SDAutoUnlockKeySession *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SDAutoUnlockKeySession;
  v7 = -[SDAutoUnlockAuthSession initWithDevice:sessionID:bleDevice:](&v22, "initWithDevice:sessionID:bleDevice:", 0, a4, v6);
  v8 = v7;
  if (v7)
  {
    v7->_powerAssertionID = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cachedIDSDeviceIDsForBluetoothID:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    -[SDAutoUnlockPairingSession setDeviceID:](v8, "setDeviceID:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v8, "deviceID"));
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsDeviceForBluetoothID:", v15));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueID"));
      -[SDAutoUnlockPairingSession setDeviceID:](v8, "setDeviceID:", v17);

    }
    v18 = auto_unlock_log(-[SDAutoUnlockKeySession addObservers](v8, "addObservers"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](v8, "deviceID"));
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Key session initialized (device id: %@)", buf, 0xCu);

    }
  }

  return v8;
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = SFHighPriorityQueue(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000246B4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)invalidateOnQueue
{
  uint64_t v3;
  NSObject *v4;

  v3 = SFHighPriorityQueue(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  dispatch_assert_queue_V2(v4);

  -[SDAutoUnlockKeySession _invalidate](self, "_invalidate");
}

- (void)_invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  objc_super v13;
  uint8_t buf[16];

  if (!-[SDAutoUnlockKeySession invalidated](self, "invalidated"))
  {
    -[SDAutoUnlockKeySession setInvalidated:](self, "setInvalidated:", 1);
    -[SDAutoUnlockKeySession setSuppressWatchNotification:](self, "setSuppressWatchNotification:", 0);
    -[SDAutoUnlockKeySession setDidDelayWorkDueToPowerAssertion:](self, "setDidDelayWorkDueToPowerAssertion:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession motionDetector](self, "motionDetector"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession motionDetector](self, "motionDetector"));
      objc_msgSend(v4, "invalidate");

      -[SDAutoUnlockKeySession setMotionDetector:](self, "setMotionDetector:", 0);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](SDAutoUnlockWiFiManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
    objc_msgSend(v5, "cancelWiFiRequest:", v6);

    -[SDAutoUnlockAuthSession setWifiRequest:](self, "setWifiRequest:", 0);
    -[SDAutoUnlockKeySession removeObservers](self, "removeObservers");
    v7 = -[SDAutoUnlockKeySession promptingForApproval](self, "promptingForApproval");
    if (v7)
    {
      v8 = auto_unlock_log(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing authorization request", buf, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockNotificationsManager sharedManager](SDAutoUnlockNotificationsManager, "sharedManager"));
      objc_msgSend(v10, "removeAuthorizationRequestNotification");

    }
    sub_1000C8A34(0);
    v13.receiver = self;
    v13.super_class = (Class)SDAutoUnlockKeySession;
    -[SDAutoUnlockAuthSession invalidate](&v13, "invalidate");
    v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000248AC;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_async(v11, block);

  }
}

- (BOOL)keyInState
{
  void *v2;
  unsigned int v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;

  if ((id)-[SDAutoUnlockAuthSession protocol](self, "protocol") != (id)2)
    return 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v3 = objc_msgSend(v2, "deviceKeyBagDisabled");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v5 = objc_msgSend(v4, "watchWristState");

  if ((v3 & 1) == 0 && v5 != (id)1)
    return 1;
  v8 = auto_unlock_log(v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("YES");
    if (v3)
      v11 = CFSTR("NO");
    else
      v11 = CFSTR("YES");
    if (v5 == (id)1)
      v10 = CFSTR("NO");
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Watch not in state. Passcode enabled: %@, wrist detection enabled: %@", (uint8_t *)&v13, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  objc_msgSend(v12, "deleteEscrowSecretForPhones");

  return 0;
}

- (void)notifyDelegateWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Auth key session notifying delegate with error: %@", (uint8_t *)&v13, 0xCu);
  }

  if (!-[SDAutoUnlockKeySession sessionCompleted](self, "sessionCompleted"))
  {
    -[SDAutoUnlockKeySession setSessionCompleted:](self, "setSessionCompleted:", 1);
    v7 = -[SDAutoUnlockKeySession shouldAlertOnNotify](self, "shouldAlertOnNotify");
    if (v7)
    {
      v8 = auto_unlock_log(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Alerting on notify", (uint8_t *)&v13, 2u);
      }

      -[SDAutoUnlockKeySession alertOfUnlock](self, "alertOfUnlock");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    v11 = objc_opt_respondsToSelector(v10, "session:didCompleteWithError:");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
      objc_msgSend(v12, "session:didCompleteWithError:", self, v4);

    }
  }

}

- (void)postBeganUnlockingNotification
{
  void *v3;
  id v4;

  if (-[SDAutoUnlockAuthSession isAuthenticatingForSiri](self, "isAuthenticatingForSiri"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockNotificationsManager sharedManager](SDAutoUnlockNotificationsManager, "sharedManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    objc_msgSend(v4, "showAuthenticatedSiriForDeviceID:", v3);

  }
}

- (void)addObservers
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "deviceDisconnected:", SFBluetoothNotificationNameDisconnected, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "systemIsActive:", CFSTR("com.apple.sharingd.SystemHasPoweredOn"), 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "systemIsActive:", CFSTR("com.apple.sharingd.SystemWillNotSleep"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)deviceDisconnected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSErrorUserInfoKey v18;
  const __CFString *v19;
  uint8_t buf[4];
  void *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", SFBluetoothNotificationKeyPeerDevice));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    v11 = auto_unlock_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "BLE peer disconnected (identifier: %@)", buf, 0xCu);

    }
    v15 = SFAutoUnlockErrorDomain;
    v18 = NSLocalizedDescriptionKey;
    v19 = CFSTR("BLE Peer disconnected");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, 186, v16));
    -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v17);

  }
}

- (void)systemIsActive:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  SDAutoUnlockKeySession *v7;
  _BOOL8 v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "System is active", buf, 2u);
  }

  v7 = self;
  objc_sync_enter(v7);
  v8 = -[SDAutoUnlockKeySession didDelayWorkDueToPowerAssertion](v7, "didDelayWorkDueToPowerAssertion");
  v9 = v8;
  if (v8)
  {
    v10 = auto_unlock_log(v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning delayed work", buf, 2u);
    }

    -[SDAutoUnlockKeySession setDidDelayWorkDueToPowerAssertion:](v7, "setDidDelayWorkDueToPowerAssertion:", 0);
  }
  -[SDAutoUnlockKeySession setShouldDelayWorkDueToPowerAssertion:](v7, "setShouldDelayWorkDueToPowerAssertion:", 0);
  objc_sync_exit(v7);

  if (v9)
  {
    v14 = SFHighPriorityQueue(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025050;
    block[3] = &unk_1007146D8;
    block[4] = v7;
    dispatch_async(v15, block);

  }
}

- (void)alertOfUnlock
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[16];

  v3 = -[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired");
  if (v3
    || (v3 = -[SDAutoUnlockKeySession alerted](self, "alerted"))
    || (v3 = -[SDAutoUnlockKeySession suppressWatchNotification](self, "suppressWatchNotification")))
  {
    v4 = auto_unlock_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Authorization allowed by request, not showing alert", buf, 2u);
    }

  }
  else
  {
    -[SDAutoUnlockKeySession setAlerted:](self, "setAlerted:", 1);
    v7 = (id)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockNotificationsManager sharedManager](SDAutoUnlockNotificationsManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
    objc_msgSend(v7, "showUnlockedByDeviceNotificationWithDeviceID:", v6);

  }
}

- (void)createWiFiRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  id v13;
  void ***v14;
  SDAutoUnlockWiFiRequest *v15;
  SDAutoUnlockWiFiRequest *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  SDAutoUnlockKeySession *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[SDAutoUnlockAuthSession setAwdlStart:](self, "setAwdlStart:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession localAWDLInfo](self, "localAWDLInfo"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("AWDL_INFO_SELF"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dispatchQueue"));

  location[0] = 0;
  objc_initWeak(location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100025414;
  v29[3] = &unk_100714728;
  v9 = v8;
  v30 = v9;
  objc_copyWeak(&v31, location);
  v10 = objc_retainBlock(v29);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100025538;
  v25[3] = &unk_100714778;
  v11 = v9;
  v26 = v11;
  objc_copyWeak(&v28, location);
  v27 = self;
  v12 = objc_retainBlock(v25);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100025738;
  v22 = &unk_1007147A0;
  v13 = v11;
  v23 = v13;
  objc_copyWeak(&v24, location);
  v14 = objc_retainBlock(&v19);
  v15 = [SDAutoUnlockWiFiRequest alloc];
  v16 = -[SDAutoUnlockWiFiRequest initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rangingStartedHandler:rangingCompletedHandler:invalidationHandler:](v15, "initWithAwdlInfo:isRangingInitiator:rangingPeer:queueAvailableHandler:awdlStartedHandler:peerFoundHandler:rangingStartedHandler:rangingCompletedHandler:invalidationHandler:", v5, 0, 0, v10, v12, 0, 0, 0, v14, v19, v20, v21, v22);
  -[SDAutoUnlockAuthSession setWifiRequest:](self, "setWifiRequest:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](SDAutoUnlockWiFiManager, "sharedManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
  objc_msgSend(v17, "scheduleWiFiRequest:", v18);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);

}

- (void)nq_awdlNetworkStarted
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dispatchQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = kdebug_trace(725286944, 0, 0, 0, 0);
  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "awdlInfo"));
    v16 = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AWDL network up with info %@", (uint8_t *)&v16, 0xCu);

  }
  v11 = auto_unlock_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlStart](self, "awdlStart"));
    objc_msgSend(v13, "timeIntervalSinceDate:", v14);
    v16 = 134217984;
    v17 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Automation: AWDL started %0.2f", (uint8_t *)&v16, 0xCu);

  }
}

- (void)nq_handleWiFiRequestStartedWithStartAWDLHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dispatchQueue"));
  dispatch_assert_queue_V2(v6);

  -[SDAutoUnlockKeySession setWifiRequestStartedHandler:](self, "setWifiRequestStartedHandler:", v4);
  -[SDAutoUnlockKeySession createAuthTokenIfReady](self, "createAuthTokenIfReady");
}

- (void)nq_handleWiFiRequestInvalidated
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_100029308();

}

- (void)handleMessageWithWrapper:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  SDAutoUnlockKeySession *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  int v50;
  void *v51;

  v4 = a3;
  v5 = objc_msgSend(v4, "messageType");
  switch((int)v5)
  {
    case 8:
      v6 = auto_unlock_log(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSessionKeyExchangeResponse", (uint8_t *)&v50, 2u);
      }

      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
      -[SDAutoUnlockKeySession handleSessionKeyExchangeResponse:](self, "handleSessionKeyExchangeResponse:", v8);

      break;
    case 9:
    case 11:
    case 13:
      break;
    case 10:
      v27 = auto_unlock_log(v5);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received SDUnlockSessionConfirmation", (uint8_t *)&v50, 2u);
      }

      -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
      -[SDAutoUnlockKeySession handleUnlockConfirmation:](self, "handleUnlockConfirmation:", v29);

      break;
    case 12:
      sub_1000C8A34(1);
      v31 = auto_unlock_log(v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Finished setting in progress", (uint8_t *)&v50, 2u);
      }

      v33 = objc_msgSend(v4, "hasSenderID");
      if ((_DWORD)v33)
      {
        v34 = objc_alloc((Class)NSUUID);
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderID")));
        v36 = objc_msgSend(v34, "initWithUUIDBytes:", objc_msgSend(v35, "bytes"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "UUIDString"));
        -[SDAutoUnlockPairingSession setDeviceID:](self, "setDeviceID:", v37);

        v39 = auto_unlock_log(v38);
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
          v50 = 138412290;
          v51 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Key session received device id: %@", (uint8_t *)&v50, 0xCu);

        }
      }
      v42 = auto_unlock_log(v33);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockAuthPromptRequest", (uint8_t *)&v50, 2u);
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
      -[SDAutoUnlockKeySession handleAuthPromptRequest:](self, "handleAuthPromptRequest:", v44);

      break;
    case 14:
      v45 = auto_unlock_log(v5);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockAuthPromptImageData", (uint8_t *)&v50, 2u);
      }

      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
      -[SDAutoUnlockKeySession handleAuthPromptImageData:](self, "handleAuthPromptImageData:", v47);

      break;
    case 15:
      v48 = auto_unlock_log(v5);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockMessageTypeCleanUpAWDL", (uint8_t *)&v50, 2u);
      }

      -[SDAutoUnlockKeySession handleCleanUpAWDL](self, "handleCleanUpAWDL");
      break;
    default:
      if ((_DWORD)v5 == 301)
      {
        sub_1000C8A34(1);
        v10 = auto_unlock_log(v9);
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v50) = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Finished setting in progress", (uint8_t *)&v50, 2u);
        }

        v12 = objc_msgSend(v4, "hasSenderID");
        if ((_DWORD)v12)
        {
          v13 = objc_alloc((Class)NSUUID);
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderID")));
          v15 = objc_msgSend(v13, "initWithUUIDBytes:", objc_msgSend(v14, "bytes"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
          -[SDAutoUnlockPairingSession setDeviceID:](self, "setDeviceID:", v16);

          v18 = auto_unlock_log(v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
            v50 = 138412290;
            v51 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Key session received device id: %@", (uint8_t *)&v50, 0xCu);

          }
        }
        v21 = auto_unlock_log(v12);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
          v50 = 138412290;
          v51 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received SDAutoUnlockMessageTypeAWDLInfo %@", (uint8_t *)&v50, 0xCu);

        }
        kdebug_trace(725286920, 0, 0, 0, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
        v25 = -[SDAutoUnlockKeySession handleAWDLInfo:](self, "handleAWDLInfo:", v24);

        if (v25)
        {
          -[SDAutoUnlockKeySession postBeganUnlockingNotification](self, "postBeganUnlockingNotification");
          v26 = self;
          objc_sync_enter(v26);
          if (-[SDAutoUnlockKeySession shouldDelayWorkDueToPowerAssertion](v26, "shouldDelayWorkDueToPowerAssertion"))
          {
            -[SDAutoUnlockKeySession setDidDelayWorkDueToPowerAssertion:](v26, "setDidDelayWorkDueToPowerAssertion:", 1);
            objc_sync_exit(v26);

          }
          else
          {
            objc_sync_exit(v26);

            -[SDAutoUnlockKeySession beginAKSSession](v26, "beginAKSSession");
          }
        }
      }
      break;
  }

}

- (BOOL)handleAWDLInfo:(id)a3
{
  id v4;
  SDAutoUnlockAWDLInfo *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
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
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  int v37;
  uint64_t v38;
  _BOOL4 v39;
  _BOOL8 v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _BOOL8 v44;
  _BOOL8 v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  BOOL v51;
  uint8_t v53[8];
  NSErrorUserInfoKey v54;
  const __CFString *v55;
  NSErrorUserInfoKey v56;
  const __CFString *v57;

  v4 = a3;
  v5 = -[SDAutoUnlockAWDLInfo initWithData:]([SDAutoUnlockAWDLInfo alloc], "initWithData:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo awdlInfo](v5, "awdlInfo"));
  v7 = sub_1000C7E44(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v10 = (id)-[SDAutoUnlockAWDLInfo version](v5, "version");
    if ((_DWORD)v10 == 1)
    {
      v11 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v53 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using legacy protocol", v53, 2u);
      }
      v13 = 0;
    }
    else
    {
      v36 = (id)-[SDAutoUnlockAWDLInfo version](v5, "version");
      v37 = (int)v36;
      v38 = auto_unlock_log(v36);
      v12 = objc_claimAutoreleasedReturnValue(v38);
      v39 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v37 == 4)
      {
        if (v39)
        {
          *(_WORD *)v53 = 0;
          v13 = 2;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using attested protocol", v53, 2u);
        }
        else
        {
          v13 = 2;
        }
      }
      else
      {
        if (v39)
        {
          *(_WORD *)v53 = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Using modern protocol", v53, 2u);
        }
        v13 = 1;
      }
    }

    -[SDAutoUnlockAuthSession setProtocol:](self, "setProtocol:", v13);
    -[SDAutoUnlockKeySession logAutoUnlockStart](self, "logAutoUnlockStart");
    -[SDAutoUnlockKeySession declareSystemActivityAssertion](self, "declareSystemActivityAssertion");
    if (-[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken"))
      v40 = -[SDAutoUnlockAWDLInfo useToken](v5, "useToken");
    else
      v40 = 0;
    -[SDAutoUnlockAuthSession setUseAKSToken:](self, "setUseAKSToken:", v40);
    -[SDAutoUnlockAuthSession setRemoteAWDLInfo:](self, "setRemoteAWDLInfo:", v8);
    if (-[SDAutoUnlockAWDLInfo authPrompt](v5, "authPrompt"))
      v41 = 2;
    else
      v41 = 1;
    -[SDAutoUnlockAuthSession setAttemptType:](self, "setAttemptType:", v41);
    if ((id)-[SDAutoUnlockAuthSession attemptType](self, "attemptType") == (id)2)
    {
      -[SDAutoUnlockKeySession setOldApproveProtocol:](self, "setOldApproveProtocol:", 1);
      -[SDAutoUnlockKeySession setUserRequestRequired:](self, "setUserRequestRequired:", 1);
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo appName](v5, "appName"));
    -[SDAutoUnlockAuthSession setAppName:](self, "setAppName:", v42);

    -[SDAutoUnlockAWDLInfo phoneUnlockDate](v5, "phoneUnlockDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    -[SDAutoUnlockKeySession setPhoneUnlockDate:](self, "setPhoneUnlockDate:", v43);

    if (-[SDAutoUnlockAWDLInfo hasIsAuthenticatingForSiri](v5, "hasIsAuthenticatingForSiri"))
      v44 = -[SDAutoUnlockAWDLInfo isAuthenticatingForSiri](v5, "isAuthenticatingForSiri");
    else
      v44 = 0;
    -[SDAutoUnlockKeySession setAuthenticatingForSiri:](self, "setAuthenticatingForSiri:", v44);
    if (-[SDAutoUnlockAWDLInfo hasSkipMotionCheck](v5, "hasSkipMotionCheck"))
      v45 = -[SDAutoUnlockAWDLInfo skipMotionCheck](v5, "skipMotionCheck");
    else
      v45 = 0;
    -[SDAutoUnlockAuthSession setSkipMotionCheck:](self, "setSkipMotionCheck:", v45);
    if ((id)-[SDAutoUnlockAuthSession protocol](self, "protocol") != (id)4
      || !-[SDAutoUnlockKeySession localDeviceNeedsArming](self, "localDeviceNeedsArming"))
    {
      v51 = 1;
      goto LABEL_39;
    }
    v46 = SFAutoUnlockErrorDomain;
    v54 = NSLocalizedDescriptionKey;
    v55 = CFSTR("Key Needs To Be Armed");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v46, 213, v47));

    v49 = auto_unlock_log(v48);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_10002940C();

    -[SDAutoUnlockKeySession sendKeyExchangeRequestWithData:error:](self, "sendKeyExchangeRequestWithData:error:", 0, v35);
    -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
  }
  else
  {
    v14 = auto_unlock_log(v9);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000293A4(v15, v16, v17, v18, v19, v20, v21, v22);

    v24 = auto_unlock_log(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100029334(v25, v26, v27, v28, v29, v30, v31, v32);

    v33 = SFAutoUnlockErrorDomain;
    v56 = NSLocalizedDescriptionKey;
    v57 = CFSTR("AWDL Info Failure");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, 114, v34));

  }
  -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v35);

  v51 = 0;
LABEL_39:

  return v51;
}

- (void)handleAuthPromptRequest:(id)a3
{
  id v4;
  SDAutoUnlockAuthPromptRequest *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  SDAutoUnlockMacIconCache *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  SDAutoUnlockKeySession *v25;
  uint8_t v26[8];
  NSErrorUserInfoKey v27;
  const __CFString *v28;

  v4 = a3;
  v5 = -[SDAutoUnlockAuthPromptRequest initWithData:]([SDAutoUnlockAuthPromptRequest alloc], "initWithData:", v4);
  v6 = -[SDAutoUnlockAuthPromptRequest hasIconHash](v5, "hasIconHash");
  if (v6)
  {
    -[SDAutoUnlockKeySession logAutoUnlockStart](self, "logAutoUnlockStart");
    -[SDAutoUnlockKeySession declareSystemActivityAssertion](self, "declareSystemActivityAssertion");
    -[SDAutoUnlockAuthSession setUseAKSToken:](self, "setUseAKSToken:", 0);
    -[SDAutoUnlockAuthSession setAttemptType:](self, "setAttemptType:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest appName](v5, "appName"));
    -[SDAutoUnlockAuthSession setAppName:](self, "setAppName:", v7);

    -[SDAutoUnlockKeySession setUserRequestRequired:](self, "setUserRequestRequired:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest navBarTitle](v5, "navBarTitle"));
    -[SDAutoUnlockAuthSession setNavBarTitle:](self, "setNavBarTitle:", v8);

    v9 = objc_alloc_init(SDAutoUnlockMacIconCache);
    -[SDAutoUnlockKeySession setIconCache:](self, "setIconCache:", v9);

    v10 = sub_1000CE8D0(CFSTR("AUDisableIconCache"), 0);
    if ((_DWORD)v10)
    {
      v11 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Image caching disabled", v26, 2u);
      }

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession iconCache](self, "iconCache"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest iconHash](v5, "iconHash"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "iconImageDataForHash:", v18));

      if (v13)
      {
        v20 = auto_unlock_log(v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Prompting with cached image", v26, 2u);
        }

        -[SDAutoUnlockKeySession setUsingImageCache:](self, "setUsingImageCache:", 1);
        v22 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithData:", v13);
        -[SDAutoUnlockKeySession setAuthPromptIconData:](self, "setAuthPromptIconData:", v22);

        -[SDAutoUnlockKeySession promptForApproval](self, "promptForApproval");
        goto LABEL_14;
      }
    }
    -[SDAutoUnlockKeySession setNeedsImageData:](self, "setNeedsImageData:", 1);
    v13 = 0;
LABEL_14:
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest iconHash](v5, "iconHash"));
    -[SDAutoUnlockKeySession setAuthPromptIconHash:](self, "setAuthPromptIconHash:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptRequest appName](v5, "appName"));
    -[SDAutoUnlockAuthSession setAppName:](self, "setAppName:", v24);

    v25 = self;
    objc_sync_enter(v25);
    if (-[SDAutoUnlockKeySession shouldDelayWorkDueToPowerAssertion](v25, "shouldDelayWorkDueToPowerAssertion"))
    {
      -[SDAutoUnlockKeySession setDidDelayWorkDueToPowerAssertion:](v25, "setDidDelayWorkDueToPowerAssertion:", 1);
      objc_sync_exit(v25);

    }
    else
    {
      objc_sync_exit(v25);

      -[SDAutoUnlockKeySession beginAKSSession](v25, "beginAKSSession");
    }
    goto LABEL_17;
  }
  v14 = auto_unlock_log(v6);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_100029438((uint64_t)v5, v15);

  v27 = NSLocalizedDescriptionKey;
  v28 = CFSTR("Auth prompt request missing info");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAutoUnlockErrorDomain, 114, v16));

  -[SDAutoUnlockKeySession sendAuthPromptResponseWithData:error:](self, "sendAuthPromptResponseWithData:error:", 0, v13);
LABEL_17:

}

- (void)handleAuthPromptImageData:(id)a3
{
  id v4;
  SDAutoUnlockAuthPromptImageData *v5;
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;

  v4 = a3;
  v5 = -[SDAutoUnlockAuthPromptImageData initWithData:]([SDAutoUnlockAuthPromptImageData alloc], "initWithData:", v4);

  v6 = -[SDAutoUnlockAuthPromptImageData hasImageData](v5, "hasImageData");
  if (!v6)
  {
    v10 = auto_unlock_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000294E8();
    goto LABEL_7;
  }
  v7 = -[SDAutoUnlockKeySession usingImageCache](self, "usingImageCache");
  if (v7)
  {
    v8 = auto_unlock_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000294BC();
LABEL_7:

    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));

  if (!v11)
  {
    v12 = objc_alloc_init((Class)NSMutableData);
    -[SDAutoUnlockKeySession setAuthPromptIconData:](self, "setAuthPromptIconData:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptImageData imageData](v5, "imageData"));
  objc_msgSend(v13, "appendData:", v14);

  v16 = auto_unlock_log(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptImageData imageData](v5, "imageData"));
    v19 = objc_msgSend(v18, "length");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));
    v21 = 134218240;
    v22 = v19;
    v23 = 2048;
    v24 = objc_msgSend(v20, "length");
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received image data (length: %ld, total: %ld)", (uint8_t *)&v21, 0x16u);

  }
  if (-[SDAutoUnlockAuthPromptImageData finalMessage](v5, "finalMessage"))
    -[SDAutoUnlockKeySession promptForApproval](self, "promptForApproval");
LABEL_8:

}

- (void)handleSessionKeyExchangeResponse:(id)a3
{
  id v4;
  SDUnlockSessionKeyExchangeResponse *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;

  v4 = a3;
  kdebug_trace(725286932, 0, 0, 0, 0);
  v5 = -[SDUnlockSessionKeyExchangeResponse initWithData:]([SDUnlockSessionKeyExchangeResponse alloc], "initWithData:", v4);

  if (-[SDUnlockSessionKeyExchangeResponse hasKey](v5, "hasKey"))
  {
    -[SDAutoUnlockKeySession setExchangeResponse:](self, "setExchangeResponse:", v5);
    if (-[SDUnlockSessionKeyExchangeResponse version](v5, "version") >= 2
      && -[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired"))
    {
      -[SDAutoUnlockKeySession createAuthTokenIfReady](self, "createAuthTokenIfReady");
    }
    else
    {
      -[SDAutoUnlockKeySession createWiFiRequest](self, "createWiFiRequest");
    }
  }
  else
  {
    v6 = -[SDUnlockSessionKeyExchangeResponse hasKeyFailed](v5, "hasKeyFailed");
    if (v6 && (v6 = -[SDUnlockSessionKeyExchangeResponse keyFailed](v5, "keyFailed")))
      v7 = 101;
    else
      v7 = 103;
    v8 = auto_unlock_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100029548();

    v10 = SFAutoUnlockErrorDomain;
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("Exchange response failed");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, v7, v11));

    -[SDAutoUnlockKeySession sendSessionAuthToken:error:](self, "sendSessionAuthToken:error:", 0, v12);
    -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v12);

  }
}

- (void)createAuthTokenIfReady
{
  void *v2;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned int v10;
  __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  SDAutoUnlockRangingPeer *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  const __CFString **v33;
  NSErrorUserInfoKey *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  id v51;
  NSErrorUserInfoKey v52;
  __CFString *v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;
  NSErrorUserInfoKey v56;
  const __CFString *v57;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession exchangeResponse](self, "exchangeResponse"));
  if (!v4)
    goto LABEL_9;
  v5 = -[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired");
  if (v5)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession unlockAllowed](self, "unlockAllowed"));
    if (objc_msgSend(v2, "BOOLValue"))
    {

LABEL_22:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession exchangeResponse](self, "exchangeResponse"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "key"));
      v51 = 0;
      v23 = objc_msgSend(v20, "stepSessionWithData:outputData:", v22, &v51);
      v13 = (__CFString *)v51;

      if (v23)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession exchangeResponse](self, "exchangeResponse"));
        if (objc_msgSend(v25, "version") < 2)
        {

        }
        else
        {
          v26 = -[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired");

          if (v26)
          {
            v28 = auto_unlock_log(v27);
            v29 = objc_claimAutoreleasedReturnValue(v28);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              sub_100029608();

            -[SDAutoUnlockKeySession sendSessionAuthToken:error:](self, "sendSessionAuthToken:error:", v13, 0);
            goto LABEL_42;
          }
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "generateSessionToken"));
        -[SDAutoUnlockAuthSession setSessionRangingKey:](self, "setSessionRangingKey:", v36);

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession sessionRangingKey](self, "sessionRangingKey"));
        if (v37)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession remoteAWDLInfo](self, "remoteAWDLInfo"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession peerListFromAWDLInfo:](self, "peerListFromAWDLInfo:", v39));
          -[SDAutoUnlockKeySession setPeerList:](self, "setPeerList:", v40);

          v18 = objc_opt_new(SDAutoUnlockRangingPeer);
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession peerList](self, "peerList"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "firstObject"));
          -[SDAutoUnlockRangingPeer setNiRangingPeer:](v18, "setNiRangingPeer:", v42);

          v43 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](SDAutoUnlockWiFiManager, "sharedManager"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
          objc_msgSend(v43, "updateWiFiRequest:setRangingPeer:", v44, v18);

          v46 = auto_unlock_log(v45);
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            sub_100029694();

          -[SDAutoUnlockKeySession sendSessionAuthToken:error:](self, "sendSessionAuthToken:error:", v13, 0);
          goto LABEL_41;
        }
        v48 = auto_unlock_log(v38);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          sub_100029668();

        v32 = SFAutoUnlockErrorDomain;
        v56 = NSLocalizedDescriptionKey;
        v57 = CFSTR("Failed to generate ranging session token");
        v33 = &v57;
        v34 = &v56;
      }
      else
      {
        v30 = auto_unlock_log(v24);
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_1000296F4();

        v32 = SFAutoUnlockErrorDomain;
        v54 = NSLocalizedDescriptionKey;
        v55 = CFSTR("Creating auth token failed");
        v33 = &v55;
        v34 = &v54;
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v34, 1));
      v18 = (SDAutoUnlockRangingPeer *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v32, 101, v50));

LABEL_40:
      -[SDAutoUnlockKeySession sendSessionAuthToken:error:](self, "sendSessionAuthToken:error:", 0, v18);
      -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v18);
LABEL_41:

LABEL_42:
      return;
    }
    if (-[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired"))
    {

      goto LABEL_9;
    }
  }
  else if (-[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired"))
  {
LABEL_9:

    goto LABEL_10;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession wifiRequestStartedHandler](self, "wifiRequestStartedHandler"));

  if (v5)
  if (v19)
    goto LABEL_22;
LABEL_10:
  if (-[SDAutoUnlockKeySession userRequestRequired](self, "userRequestRequired"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession unlockAllowed](self, "unlockAllowed"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession unlockAllowed](self, "unlockAllowed"));
      v9 = objc_msgSend(v8, "BOOLValue");

      if ((v9 & 1) == 0)
      {
        v10 = -[SDAutoUnlockKeySession errorRequestingUnlock](self, "errorRequestingUnlock");
        v11 = CFSTR("Error posting authorization request");
        if (v10)
        {
          v12 = 180;
        }
        else
        {
          v11 = CFSTR("User denied authorization request");
          v12 = 179;
        }
        v13 = v11;
        v14 = auto_unlock_log(v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_1000295A8();

        v16 = SFAutoUnlockErrorDomain;
        v52 = NSLocalizedDescriptionKey;
        v53 = v13;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
        v18 = (SDAutoUnlockRangingPeer *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, v12, v17));

        goto LABEL_40;
      }
    }
  }
}

- (void)handleUnlockConfirmation:(id)a3
{
  id v4;
  SDUnlockSessionConfirmation *v5;
  _BOOL8 v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __CFString *v25;
  SDAutoUnlockMacIconCache *iconCache;
  void *v27;
  void *v28;
  void *v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  uint8_t buf[4];
  const __CFString *v33;

  v4 = a3;
  v5 = -[SDUnlockSessionConfirmation initWithData:]([SDUnlockSessionConfirmation alloc], "initWithData:", v4);

  v6 = -[SDUnlockSessionConfirmation success](v5, "success");
  if (v6)
  {
    -[SDAutoUnlockKeySession setSuppressWatchNotification:](self, "setSuppressWatchNotification:", -[SDUnlockSessionConfirmation suppressNotification](v5, "suppressNotification"));
    if (-[SDUnlockSessionConfirmation hasSupportsACK](v5, "hasSupportsACK")
      && -[SDUnlockSessionConfirmation supportsACK](v5, "supportsACK"))
    {
      -[SDAutoUnlockKeySession sendConfirmationACK](self, "sendConfirmationACK");
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
    -[SDAutoUnlockAuthSession setAksSuccess:](self, "setAksSuccess:", objc_msgSend(v13, "confirmSession"));

    v15 = auto_unlock_log(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[SDAutoUnlockAuthSession aksSuccess](self, "aksSuccess");
      v18 = CFSTR("NO");
      if (v17)
        v18 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Session confirmed %@", buf, 0xCu);
    }

    if (!-[SDAutoUnlockKeySession usingImageCache](self, "usingImageCache"))
    {
      v19 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));
      if (v19)
      {
        v20 = (void *)v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconHash](self, "authPromptIconHash"));

        if (v21)
        {
          v23 = auto_unlock_log(v22);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession appName](self, "appName"));
            *(_DWORD *)buf = 138412290;
            v33 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Caching image for app %@", buf, 0xCu);

          }
          iconCache = self->_iconCache;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconData](self, "authPromptIconData"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession authPromptIconHash](self, "authPromptIconHash"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession appName](self, "appName"));
          -[SDAutoUnlockMacIconCache cacheIconImageData:hash:appName:](iconCache, "cacheIconImageData:hash:appName:", v27, v28, v29);

        }
      }
    }
    if ((v7 & 1) == 0)
      -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", 0);
  }
  else
  {
    v8 = auto_unlock_log(v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100029720();

    v10 = SFAutoUnlockErrorDomain;
    v30 = NSLocalizedDescriptionKey;
    v31 = CFSTR("Confirmation failed");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, 101, v11));
    -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v12);

  }
}

- (void)handleCleanUpAWDL
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](SDAutoUnlockWiFiManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession wifiRequest](self, "wifiRequest"));
  objc_msgSend(v3, "cancelWiFiRequest:", v4);

  -[SDAutoUnlockAuthSession setWifiRequest:](self, "setWifiRequest:", 0);
}

- (void)sendAWDLInfoWithKeyData:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  SDAutoUnlockAWDLInfo *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint8_t buf[8];
  NSErrorUserInfoKey v29;
  const __CFString *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v6 = a3;
  v7 = (uint64_t)a4;
  if (!v7)
  {
    if (-[SDAutoUnlockKeySession wifiEnabled](self, "wifiEnabled")
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor")),
          v9 = objc_msgSend(v8, "wirelessEnabled"),
          v8,
          (v9 & 1) != 0))
    {
      v7 = 0;
    }
    else
    {
      v11 = auto_unlock_log(v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100029778();

      v13 = SFAutoUnlockErrorDomain;
      v31 = NSLocalizedDescriptionKey;
      v32 = CFSTR("WiFi interface disabled on Watch");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v7 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, 199, v14));

    }
  }
  v15 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession awdlInfoData](self, "awdlInfoData"));
  v16 = (void *)v15;
  if (!(v15 | v7))
  {
    v17 = auto_unlock_log(v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10002974C();

    v19 = SFAutoUnlockErrorDomain;
    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("Failed to serialize AWDL Info");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v7 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v19, 114, v20));

  }
  v21 = auto_unlock_log(v15);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAWDLInfo", buf, 2u);
  }

  v23 = objc_alloc_init(SDAutoUnlockAWDLInfo);
  -[SDAutoUnlockAWDLInfo setVersion:](v23, "setVersion:", 3);
  -[SDAutoUnlockAWDLInfo setAwdlInfo:](v23, "setAwdlInfo:", v16);
  -[SDAutoUnlockAWDLInfo setUseToken:](v23, "setUseToken:", -[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken"));
  -[SDAutoUnlockAWDLInfo setKeyData:](v23, "setKeyData:", v6);
  -[SDAutoUnlockAWDLInfo setSupportsConfirmationACK:](v23, "setSupportsConfirmationACK:", 1);
  if (v7)
    -[SDAutoUnlockAWDLInfo setErrorCode:](v23, "setErrorCode:", objc_msgSend((id)v7, "code"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAWDLInfo data](v23, "data"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v24, 301));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000278A0;
  v27[3] = &unk_1007147C8;
  v27[4] = self;
  -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:](self, "sendData:bleDevice:direct:completionHandler:", v25, v26, 1, v27);

  if (v7)
  {
    if (!v16)
      -[SDAutoUnlockKeySession notifyDelegateWithError:](self, "notifyDelegateWithError:", v7);
  }
  else
  {
    -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)15));
  }
  kdebug_trace(725286924, 0, 0, 0, 0);

}

- (void)sendAuthPromptResponseWithData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SDAutoUnlockAuthPromptResponse *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SDAutoUnlockAuthPromptResponse);
  -[SDAutoUnlockAuthPromptResponse setVersion:](v8, "setVersion:", 1);
  -[SDAutoUnlockAuthPromptResponse setKeyData:](v8, "setKeyData:", v7);

  v9 = -[SDAutoUnlockAuthPromptResponse setNeedsImageData:](v8, "setNeedsImageData:", -[SDAutoUnlockKeySession needsImageData](self, "needsImageData"));
  if (v6)
    v9 = -[SDAutoUnlockAuthPromptResponse setErrorCode:](v8, "setErrorCode:", objc_msgSend(v6, "code"));
  v10 = auto_unlock_log(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockAuthPromptResponse", buf, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthPromptResponse data](v8, "data"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100027B4C;
  v13[3] = &unk_1007147C8;
  v13[4] = self;
  -[SDAutoUnlockAuthSession sendData:type:errorHandler:](self, "sendData:type:errorHandler:", v12, 13, v13);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)15));
}

- (void)sendKeyExchangeRequestWithData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SDUnlockSessionKeyExchangeRequest *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(SDUnlockSessionKeyExchangeRequest);
  -[SDUnlockSessionKeyExchangeRequest setVersion:](v8, "setVersion:", 1);
  v9 = -[SDUnlockSessionKeyExchangeRequest setUsingRecord:](v8, "setUsingRecord:", -[SDAutoUnlockAuthSession useAKSToken](self, "useAKSToken") ^ 1);
  if (v6)
    v9 = -[SDUnlockSessionKeyExchangeRequest setKey:](v8, "setKey:", v6);
  if (v7)
    v9 = -[SDUnlockSessionKeyExchangeRequest setErrorCode:](v8, "setErrorCode:", objc_msgSend(v7, "code"));
  v10 = auto_unlock_log(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionKeyExchangeRequest", buf, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeRequest data](v8, "data"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100027DEC;
  v13[3] = &unk_1007147C8;
  v13[4] = self;
  -[SDAutoUnlockAuthSession sendData:type:errorHandler:](self, "sendData:type:errorHandler:", v12, 7, v13);

  kdebug_trace(725286928, 0, 0, 0, 0);
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)15));

}

- (void)sendSessionAuthToken:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SDUnlockSessionAuthToken *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(SDUnlockSessionAuthToken);
  v9 = -[SDUnlockSessionAuthToken setVersion:](v8, "setVersion:", 2);
  if (v6)
    v9 = -[SDUnlockSessionAuthToken setAuthToken:](v8, "setAuthToken:", v6);
  if (v7)
    v9 = -[SDUnlockSessionAuthToken setErrorCode:](v8, "setErrorCode:", objc_msgSend(v7, "code"));
  v10 = auto_unlock_log(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending SDUnlockSessionAuthToken", buf, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionAuthToken data](v8, "data"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v12, 9));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000280D0;
  v17[3] = &unk_1007147F0;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v15 = v7;
  v16 = v6;
  -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:](self, "sendData:bleDevice:direct:completionHandler:", v13, v14, 1, v17);

  kdebug_trace(725286936, 0, 0, 0, 0);
  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)15));

}

- (void)sendConfirmationACK
{
  SDAutoUnlockSessionConfirmationACK *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  v3 = objc_opt_new(SDAutoUnlockSessionConfirmationACK);
  -[SDAutoUnlockSessionConfirmationACK setVersion:](v3, "setVersion:", 1);
  -[SDAutoUnlockSessionConfirmationACK setSuccess:](v3, "setSuccess:", 1);
  v4 = auto_unlock_log(-[SDAutoUnlockKeySession setShouldAlertOnNotify:](self, "setShouldAlertOnNotify:", 1));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending SDAutoUnlockSessionConfirmationACK", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionConfirmationACK data](v3, "data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession wrapPayload:withType:](self, "wrapPayload:withType:", v6, 11));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000283E8;
  v9[3] = &unk_1007147C8;
  v9[4] = self;
  -[SDAutoUnlockAuthSession sendData:bleDevice:direct:completionHandler:](self, "sendData:bleDevice:direct:completionHandler:", v7, v8, 1, v9);

  -[SDAutoUnlockPairingSession restartResponseTimer:](self, "restartResponseTimer:", sub_10019AAC0((double)2));
}

- (void)declareSystemActivityAssertion
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  uint64_t v5;
  unsigned int *p_powerAssertionID;
  uint64_t v7;
  NSObject *v8;
  int *p_powerAssertionState;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  int v26;

  -[SDAutoUnlockKeySession setShouldDelayWorkDueToPowerAssertion:](self, "setShouldDelayWorkDueToPowerAssertion:", 0);
  v3 = (OS_os_transaction *)os_transaction_create("SDAutoUnlockKeySession");
  transaction = self->_transaction;
  self->_transaction = v3;

  p_powerAssertionID = &self->_powerAssertionID;
  if (self->_powerAssertionID)
  {
    v7 = auto_unlock_log(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Grabbing assertion we already have", (uint8_t *)&v23, 2u);
    }

  }
  else
  {
    p_powerAssertionState = &self->_powerAssertionState;
    self->_powerAssertionState = 1;
    v10 = auto_unlock_log(v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Grabbing system activity assertion for Auto Unlock key session", (uint8_t *)&v23, 2u);
    }

    v12 = IOPMAssertionDeclareSystemActivity(CFSTR("AutoUnlock-Key"), &self->_powerAssertionID, &self->_powerAssertionState);
    if ((_DWORD)v12 && *p_powerAssertionState)
    {
      v13 = v12;
      v14 = auto_unlock_log(v12);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_100029864(v13, v15);

      *p_powerAssertionID = 0;
      -[SDAutoUnlockKeySession releaseIdleSleepAssertion](self, "releaseIdleSleepAssertion");
    }
    else
    {
      v16 = auto_unlock_log(v12);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *p_powerAssertionID;
        v19 = *p_powerAssertionState;
        v23 = 134218240;
        v24 = v18;
        v25 = 1024;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Power assertion (assertion %ld, state %d)", (uint8_t *)&v23, 0x12u);
      }

      if (*p_powerAssertionState)
      {
        v20 = auto_unlock_log(-[SDAutoUnlockKeySession setShouldDelayWorkDueToPowerAssertion:](self, "setShouldDelayWorkDueToPowerAssertion:", 1));
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *p_powerAssertionState;
          v23 = 67109120;
          LODWORD(v24) = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "System wake scheduled for key session (state %d)", (uint8_t *)&v23, 8u);
        }

      }
      -[SDAutoUnlockKeySession restartAssertionTimer](self, "restartAssertionTimer");
    }
  }
}

- (void)releaseIdleSleepAssertion
{
  uint64_t v3;
  NSObject *v4;
  OS_os_transaction *transaction;
  uint8_t v6[16];

  if (self->_powerAssertionID)
  {
    v3 = auto_unlock_log(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing key power assertion", v6, 2u);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_powerAssertionID = 0;
  }
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)restartAssertionTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[5];
  uint8_t buf[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting assertion timer", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100028880;
    v12[3] = &unk_1007146D8;
    v12[4] = self;
    v7 = sub_10019AAD8(0, v6, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[SDAutoUnlockKeySession setAssertionTimer:](self, "setAssertionTimer:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
    dispatch_resume(v9);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
  v11 = sub_10019AAC0(20.0);
  sub_10019AB78(v10, v11);

}

- (void)invalidateAssertionTimer
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating aggressive advertising timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockKeySession assertionTimer](self, "assertionTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockKeySession setAssertionTimer:](self, "setAssertionTimer:", 0);
  }
}

- (void)logAutoUnlockStart
{
  NSString *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[3];

  v3 = sub_1000C8E18(1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[SDAutoUnlockAuthSession protocol](self, "protocol");
  v6 = CFSTR("Mac");
  if (v5 == 2)
    v6 = CFSTR("Phone");
  v13[0] = CFSTR("Start");
  v12[0] = CFSTR("State");
  v12[1] = CFSTR("DeviceID");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v12[2] = CFSTR("UnlockPeerType");
  v13[1] = v10;
  v13[2] = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 3));

  SFPowerLogTimeSensitiveEvent(v4, v11);
}

- (void)logAutoUnlockEnd
{
  NSString *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[4];

  v3 = sub_1000C8E18(1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = -[SDAutoUnlockAuthSession protocol](self, "protocol");
  v6 = CFSTR("Mac");
  if (v5 == 2)
    v6 = CFSTR("Phone");
  v14[0] = CFSTR("End");
  v13[0] = CFSTR("State");
  v13[1] = CFSTR("DeviceID");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAuthSession bleDevice](self, "bleDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v14[1] = v10;
  v14[2] = v7;
  v13[2] = CFSTR("UnlockPeerType");
  v13[3] = CFSTR("Success");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SDAutoUnlockKeySession alerted](self, "alerted")));
  v14[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 4));

  SFPowerLogTimeSensitiveEvent(v4, v12);
}

- (BOOL)wifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setWifiEnabled:(BOOL)a3
{
  self->_wifiEnabled = a3;
}

- (NSArray)wakeGestureDates
{
  return self->_wakeGestureDates;
}

- (void)setWakeGestureDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSDate)unlockedOnWristDate
{
  return self->_unlockedOnWristDate;
}

- (void)setUnlockedOnWristDate:(id)a3
{
  objc_storeStrong((id *)&self->_unlockedOnWristDate, a3);
}

- (BOOL)needsStrictMotionCheck
{
  return self->_needsStrictMotionCheck;
}

- (void)setNeedsStrictMotionCheck:(BOOL)a3
{
  self->_needsStrictMotionCheck = a3;
}

- (BOOL)localDeviceNeedsArming
{
  return self->_localDeviceNeedsArming;
}

- (void)setLocalDeviceNeedsArming:(BOOL)a3
{
  self->_localDeviceNeedsArming = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSDate)phoneUnlockDate
{
  return self->_phoneUnlockDate;
}

- (void)setPhoneUnlockDate:(id)a3
{
  objc_storeStrong((id *)&self->_phoneUnlockDate, a3);
}

- (BOOL)sentAWDLInfo
{
  return self->_sentAWDLInfo;
}

- (void)setSentAWDLInfo:(BOOL)a3
{
  self->_sentAWDLInfo = a3;
}

- (BOOL)userRequestRequired
{
  return self->_userRequestRequired;
}

- (void)setUserRequestRequired:(BOOL)a3
{
  self->_userRequestRequired = a3;
}

- (BOOL)sessionCompleted
{
  return self->_sessionCompleted;
}

- (void)setSessionCompleted:(BOOL)a3
{
  self->_sessionCompleted = a3;
}

- (BOOL)alerted
{
  return self->_alerted;
}

- (void)setAlerted:(BOOL)a3
{
  self->_alerted = a3;
}

- (BOOL)shouldAlertOnNotify
{
  return self->_shouldAlertOnNotify;
}

- (void)setShouldAlertOnNotify:(BOOL)a3
{
  self->_shouldAlertOnNotify = a3;
}

- (BOOL)promptedForApproval
{
  return self->_promptedForApproval;
}

- (void)setPromptedForApproval:(BOOL)a3
{
  self->_promptedForApproval = a3;
}

- (BOOL)promptingForApproval
{
  return self->_promptingForApproval;
}

- (void)setPromptingForApproval:(BOOL)a3
{
  self->_promptingForApproval = a3;
}

- (BOOL)oldApproveProtocol
{
  return self->_oldApproveProtocol;
}

- (void)setOldApproveProtocol:(BOOL)a3
{
  self->_oldApproveProtocol = a3;
}

- (NSNumber)unlockAllowed
{
  return self->_unlockAllowed;
}

- (void)setUnlockAllowed:(id)a3
{
  objc_storeStrong((id *)&self->_unlockAllowed, a3);
}

- (int)errorRequestingUnlock
{
  return self->_errorRequestingUnlock;
}

- (void)setErrorRequestingUnlock:(int)a3
{
  self->_errorRequestingUnlock = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (int)powerAssertionState
{
  return self->_powerAssertionState;
}

- (void)setPowerAssertionState:(int)a3
{
  self->_powerAssertionState = a3;
}

- (id)wifiRequestStartedHandler
{
  return self->_wifiRequestStartedHandler;
}

- (void)setWifiRequestStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (int64_t)remoteCacheID
{
  return self->_remoteCacheID;
}

- (void)setRemoteCacheID:(int64_t)a3
{
  self->_remoteCacheID = a3;
}

- (NSArray)peerList
{
  return self->_peerList;
}

- (void)setPeerList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSData)proxyRequestData
{
  return self->_proxyRequestData;
}

- (void)setProxyRequestData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (OS_dispatch_source)assertionTimer
{
  return self->_assertionTimer;
}

- (void)setAssertionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_assertionTimer, a3);
}

- (SDUnlockSessionKeyExchangeResponse)exchangeResponse
{
  return self->_exchangeResponse;
}

- (void)setExchangeResponse:(id)a3
{
  objc_storeStrong((id *)&self->_exchangeResponse, a3);
}

- (NSMutableData)authPromptIconData
{
  return self->_authPromptIconData;
}

- (void)setAuthPromptIconData:(id)a3
{
  objc_storeStrong((id *)&self->_authPromptIconData, a3);
}

- (SDAutoUnlockMacIconCache)iconCache
{
  return self->_iconCache;
}

- (void)setIconCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconCache, a3);
}

- (NSData)authPromptIconHash
{
  return self->_authPromptIconHash;
}

- (void)setAuthPromptIconHash:(id)a3
{
  objc_storeStrong((id *)&self->_authPromptIconHash, a3);
}

- (BOOL)needsImageData
{
  return self->_needsImageData;
}

- (void)setNeedsImageData:(BOOL)a3
{
  self->_needsImageData = a3;
}

- (BOOL)usingImageCache
{
  return self->_usingImageCache;
}

- (void)setUsingImageCache:(BOOL)a3
{
  self->_usingImageCache = a3;
}

- (BOOL)shouldDelayWorkDueToPowerAssertion
{
  return self->_shouldDelayWorkDueToPowerAssertion;
}

- (void)setShouldDelayWorkDueToPowerAssertion:(BOOL)a3
{
  self->_shouldDelayWorkDueToPowerAssertion = a3;
}

- (BOOL)didDelayWorkDueToPowerAssertion
{
  return self->_didDelayWorkDueToPowerAssertion;
}

- (void)setDidDelayWorkDueToPowerAssertion:(BOOL)a3
{
  self->_didDelayWorkDueToPowerAssertion = a3;
}

- (BOOL)suppressWatchNotification
{
  return self->_suppressWatchNotification;
}

- (void)setSuppressWatchNotification:(BOOL)a3
{
  self->_suppressWatchNotification = a3;
}

- (BOOL)authenticatingForSiri
{
  return self->_authenticatingForSiri;
}

- (void)setAuthenticatingForSiri:(BOOL)a3
{
  self->_authenticatingForSiri = a3;
}

- (SDUnlockMotionDetector)motionDetector
{
  return self->_motionDetector;
}

- (void)setMotionDetector:(id)a3
{
  objc_storeStrong((id *)&self->_motionDetector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_storeStrong((id *)&self->_authPromptIconHash, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_authPromptIconData, 0);
  objc_storeStrong((id *)&self->_exchangeResponse, 0);
  objc_storeStrong((id *)&self->_assertionTimer, 0);
  objc_storeStrong((id *)&self->_proxyRequestData, 0);
  objc_storeStrong((id *)&self->_peerList, 0);
  objc_storeStrong(&self->_wifiRequestStartedHandler, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_unlockAllowed, 0);
  objc_storeStrong((id *)&self->_phoneUnlockDate, 0);
  objc_storeStrong((id *)&self->_unlockedOnWristDate, 0);
  objc_storeStrong((id *)&self->_wakeGestureDates, 0);
}

@end
