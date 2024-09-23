@implementation SDAutoUnlockSessionManager

+ (id)sharedManager
{
  if (qword_1007C66B8 != -1)
    dispatch_once(&qword_1007C66B8, &stru_100716018);
  return (id)qword_1007C66B0;
}

- (SDAutoUnlockSessionManager)init
{
  void *v3;
  void *v4;
  void *v5;
  SDAutoUnlockSessionManager *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](SDUnlockIDSController, "sharedController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v6 = -[SDAutoUnlockSessionManager initWithTransport:magnetTransport:keyManager:](self, "initWithTransport:magnetTransport:keyManager:", v3, v4, v5);

  return v6;
}

- (SDAutoUnlockSessionManager)initWithTransport:(id)a3 magnetTransport:(id)a4 keyManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  SDAutoUnlockSessionManager *v11;
  SDAutoUnlockSessionManager *v12;
  id v13;
  id isSignedIntoPrimaryiCloudAccount;
  _QWORD *v15;
  id isFaceIDEnabled;
  _QWORD *v17;
  id isWifiEnabled;
  id isBluetoothEnabled;
  id isActiveDeviceNearby;
  NSMutableDictionary *v21;
  NSMutableDictionary *lockAuthSessions;
  NSMutableDictionary *v23;
  NSMutableDictionary *keyAuthSessions;
  NSMutableDictionary *v25;
  NSMutableDictionary *lockPairingSessions;
  NSMutableDictionary *v27;
  NSMutableDictionary *keyPairingSessions;
  NSMutableArray *v29;
  NSMutableArray *canceledAuthLockSessions;
  NSMutableArray *v31;
  NSMutableArray *canceledPairingKeySessions;
  NSMutableSet *v33;
  NSMutableSet *serviceClients;
  NSMutableDictionary *v35;
  NSMutableDictionary *proxySessions;
  NSMutableArray *v37;
  NSMutableArray *locksWithAKSTokens;
  NSMutableArray *v39;
  NSMutableArray *keysWithAKSTokens;
  uint64_t v41;
  NSMutableDictionary *keyRegistrationSessionsByDeviceID;
  uint64_t v43;
  NSMutableDictionary *lockRegistrationSessionsByDeviceID;
  dispatch_queue_t v45;
  OS_dispatch_queue *sessionManagerQueue;
  uint64_t v47;
  NSHashTable *observerTable;
  uint64_t v49;
  uint64_t v50;
  int v51;
  void *v52;
  id v53;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id location;
  objc_super v60;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v60.receiver = self;
  v60.super_class = (Class)SDAutoUnlockSessionManager;
  v11 = -[SDAutoUnlockSessionManager init](&v60, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_autoUnlockTransport, v8);
    v13 = objc_storeWeak((id *)&v12->_magnetTransport, v9);
    objc_msgSend(v9, "addDelegate:", v12);

    objc_storeWeak((id *)&v12->_keyManager, v10);
    isSignedIntoPrimaryiCloudAccount = v12->_isSignedIntoPrimaryiCloudAccount;
    v12->_isSignedIntoPrimaryiCloudAccount = &stru_100716058;

    location = 0;
    objc_initWeak(&location, v12);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10008B80C;
    v57[3] = &unk_100716080;
    objc_copyWeak(&v58, &location);
    v15 = objc_retainBlock(v57);
    isFaceIDEnabled = v12->_isFaceIDEnabled;
    v12->_isFaceIDEnabled = v15;

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_10008B858;
    v55[3] = &unk_100716080;
    objc_copyWeak(&v56, &location);
    v17 = objc_retainBlock(v55);
    isWifiEnabled = v12->_isWifiEnabled;
    v12->_isWifiEnabled = v17;

    isBluetoothEnabled = v12->_isBluetoothEnabled;
    v12->_isBluetoothEnabled = &stru_1007160A0;

    isActiveDeviceNearby = v12->_isActiveDeviceNearby;
    v12->_isActiveDeviceNearby = &stru_1007160C0;

    v12->_idsMacCountCache = -1;
    v12->_timeSinceLastMachineWake = -1;
    v21 = objc_opt_new(NSMutableDictionary);
    lockAuthSessions = v12->_lockAuthSessions;
    v12->_lockAuthSessions = v21;

    v23 = objc_opt_new(NSMutableDictionary);
    keyAuthSessions = v12->_keyAuthSessions;
    v12->_keyAuthSessions = v23;

    v25 = objc_opt_new(NSMutableDictionary);
    lockPairingSessions = v12->_lockPairingSessions;
    v12->_lockPairingSessions = v25;

    v27 = objc_opt_new(NSMutableDictionary);
    keyPairingSessions = v12->_keyPairingSessions;
    v12->_keyPairingSessions = v27;

    v29 = objc_opt_new(NSMutableArray);
    canceledAuthLockSessions = v12->_canceledAuthLockSessions;
    v12->_canceledAuthLockSessions = v29;

    v31 = objc_opt_new(NSMutableArray);
    canceledPairingKeySessions = v12->_canceledPairingKeySessions;
    v12->_canceledPairingKeySessions = v31;

    v33 = objc_opt_new(NSMutableSet);
    serviceClients = v12->_serviceClients;
    v12->_serviceClients = v33;

    v35 = objc_opt_new(NSMutableDictionary);
    proxySessions = v12->_proxySessions;
    v12->_proxySessions = v35;

    v37 = objc_opt_new(NSMutableArray);
    locksWithAKSTokens = v12->_locksWithAKSTokens;
    v12->_locksWithAKSTokens = v37;

    v39 = objc_opt_new(NSMutableArray);
    keysWithAKSTokens = v12->_keysWithAKSTokens;
    v12->_keysWithAKSTokens = v39;

    v41 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    keyRegistrationSessionsByDeviceID = v12->_keyRegistrationSessionsByDeviceID;
    v12->_keyRegistrationSessionsByDeviceID = (NSMutableDictionary *)v41;

    v43 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    lockRegistrationSessionsByDeviceID = v12->_lockRegistrationSessionsByDeviceID;
    v12->_lockRegistrationSessionsByDeviceID = (NSMutableDictionary *)v43;

    v45 = dispatch_queue_create("com.apple.sharingd.auto-unlock.session-manager-queue", 0);
    sessionManagerQueue = v12->_sessionManagerQueue;
    v12->_sessionManagerQueue = (OS_dispatch_queue *)v45;

    v47 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observerTable = v12->_observerTable;
    v12->_observerTable = (NSHashTable *)v47;

    v51 = SFDeviceClassCodeGet(v49, v50);
    if (v51 == 7 || v51 == 1)
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      v53 = objc_msgSend(v52, "sharedNearbyPipe");

    }
    objc_destroyWeak(&v56);
    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B988;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)onqueue_start
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  SDAutoUnlockSuggestionManager *v9;
  SDAutoUnlockSuggestionManager *suggestionManager;
  void *v11;
  SDAutoUnlockIconTransferStore *v12;
  SDAutoUnlockIconTransferStore *iconTransferStore;
  uint64_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  SDAutoUnlockLocalDeviceController *v26;
  void *v27;
  SDAutoUnlockLocalDeviceController *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _BYTE buf[24];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Session manager starting", buf, 2u);
  }

  -[SDAutoUnlockSessionManager addNotificationsObservers](self, "addNotificationsObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  objc_msgSend(v7, "setPrimaryClient:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  objc_msgSend(v8, "start");

  v9 = objc_opt_new(SDAutoUnlockSuggestionManager);
  suggestionManager = self->_suggestionManager;
  self->_suggestionManager = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  self->_previousNearbyState = objc_msgSend(v11, "deviceNearby");

  v12 = objc_alloc_init(SDAutoUnlockIconTransferStore);
  iconTransferStore = self->_iconTransferStore;
  self->_iconTransferStore = v12;

  -[SDAutoUnlockSessionManager initializeAttemptState](self, "initializeAttemptState");
  -[SDAutoUnlockSessionManager initializeCaptureBlock](self, "initializeCaptureBlock");
  v14 = auto_unlock_log(-[SDAutoUnlockSessionManager updateAdvertising](self, "updateAdvertising"));
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Resetting in progress state", buf, 2u);
  }

  sub_1000C8A34(0);
  -[SDAutoUnlockSessionManager loadPresentedBluetoothError](self, "loadPresentedBluetoothError");
  v16 = -[SDAutoUnlockSessionManager loadPresentedWiFiError](self, "loadPresentedWiFiError");
  if (SFDeviceClassCodeGet(v16, v17) != 8)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    -[SDAutoUnlockSessionManager setCachedDeviceWiFiState:](self, "setCachedDeviceWiFiState:", objc_msgSend(v18, "wirelessEnabled"));

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "autoUnlockEligibleWatchesWithCloudPairing:", 0));

  v22 = auto_unlock_log(v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Auto Unlock eligible devices %@", buf, 0xCu);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockWiFiManager sharedManager](SDAutoUnlockWiFiManager, "sharedManager"));
  objc_msgSend(v24, "start");

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  objc_msgSend(v25, "updateApproveBluetoothIDs");

  v26 = [SDAutoUnlockLocalDeviceController alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v28 = -[SDAutoUnlockLocalDeviceController initWithQueue:](v26, "initWithQueue:", v27);
  -[SDAutoUnlockSessionManager setLocalDeviceController:](self, "setLocalDeviceController:", v28);

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10008BD28;
  v30[3] = &unk_1007145D0;
  objc_copyWeak(&v31, (id *)buf);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  objc_msgSend(v29, "setDeviceEnteredBioLockoutHandler:", v30);

  if (MKBDeviceUnlockedSinceBoot(-[SDAutoUnlockSessionManager initializeRemotePeer](self, "initializeRemotePeer")) == 1)
    -[SDAutoUnlockSessionManager registerRemotePeerIfNecessary](self, "registerRemotePeerIfNecessary");
  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

}

- (void)initializeAttemptState
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD block[5];
  uint8_t buf[4];
  id v17;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  self->_attemptCount = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v5 = objc_msgSend(v4, "deviceKeyBagUnlocked");

  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device unlocked on start up", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[SDAutoUnlockSessionManager setLastUnlockDate:](self, "setLastUnlockDate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[SDAutoUnlockSessionManager setLockStateChangedDate:](self, "setLockStateChangedDate:", v11);

  }
  else
  {
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      *(_DWORD *)buf = 134217984;
      v17 = objc_msgSend(v12, "deviceKeyBagState");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "### Device not unlocked on start up (state: %ld)", buf, 0xCu);

    }
    v13 = dispatch_time(0, 5000000000);
    v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008BF34;
    block[3] = &unk_1007146D8;
    block[4] = self;
    dispatch_after(v13, v14, block);

  }
}

- (void)addNotificationsObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleBLEDataReceivedNotification:", CFSTR("SDNearbyAgentNotificationUnlockBLEDataReceived"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "keyBagLockStateChange:", CFSTR("com.apple.sharingd.KeyBagLockStatusChanged"), 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "handleWiFiPowerChanged:", CFSTR("com.apple.sharingd.WirelessPowerChanged"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "btPipeConnectionChanged:", SFNotificationNamePipeConnectionStateChanged, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "handleAuthenticationSessionStarted", CFSTR("SDAuthenticationSessionStarted"), 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "btPipeConnectionChanged:", SFNotificationNameBTPoweredOff, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "handlePairedDeviceLockStateChanged", CFSTR("com.apple.sharingd.PairedWatchLockStateChanged"), 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "handleUnexpectedDisablement:", CFSTR("SDAutoUnlockAKSManagerUnexpectedDisablementNotification"), 0);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10008C330, CFSTR("com.apple.purplebuddy.setupdone"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  location = 0;
  objc_initWeak(&location, self);
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10008C408;
  v13[3] = &unk_100714590;
  objc_copyWeak(&v14, &location);
  notify_register_dispatch("com.apple.iokit.hid.displayStatus", &self->_screenDisplayChangedToken, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SDAutoUnlockSessionManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008C4F4;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SDAutoUnlockSessionManager *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008C64C;
  v7[3] = &unk_100714860;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)notifyObserverOfKeyDeviceLockWithDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008C7A4;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)notifyObserverOfEnabledDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008C9D0;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)notifyObserverOfFailedToEnableDevice:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CC20;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)notifyObserverOfAttemptBeganWithDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008CE50;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)notifyObserversOfUnlockCompletionWithDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!-[SDAutoUnlockSessionManager suppressAlert](self, "suppressAlert"))
    -[SDAutoUnlockSessionManager completeSuccessfulAttempt](self, "completeSuccessfulAttempt");
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008D090;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)notifyObserversOfUnlockFailureWithResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D2E0;
  block[3] = &unk_100715138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)repairCloudPairing
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_async(v2, &stru_1007160E0);

}

- (void)eligibleDevicesFilterCompatibleDevices:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[4];
  uint64_t v21;
  _BYTE v22[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableSet);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modelIdentifier", (_QWORD)v16));
        v12 = sub_1000C92EC(v11);

        if (!v12)
        {
          v14 = auto_unlock_log(v13);
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            sub_10009CE18(v20, v10, &v21, v15);

          objc_msgSend(v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "minusSet:", v4);
}

- (BOOL)phoneAutoUnlockSupportedByDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "modelIdentifier"));
  if (sub_1000C92EC(v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "productVersion"));
    v6 = sub_1000C93C8(v5);

    if (v6)
    {
      v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  v9 = auto_unlock_log(v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10009CE8C(v3, v10);

  v8 = 0;
LABEL_8:

  return v8;
}

- (void)eligibleDevicesRequestFromBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D840;
  block[3] = &unk_100714F68;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)enableAutoUnlockWithDevice:(id)a3 passcode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  v9 = objc_msgSend(v8, "faceIDEnabled");

  if ((v9 & 1) == 0)
  {
    v19 = SFAutoUnlockErrorDomain;
    v32 = NSLocalizedDescriptionKey;
    v33 = CFSTR("FaceID not enabled");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    v17 = v19;
    v18 = 205;
LABEL_7:
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v17, v18, v16));
    -[SDAutoUnlockSessionManager notifyObserverOfFailedToEnableDevice:error:](self, "notifyObserverOfFailedToEnableDevice:error:", v6, v20);

    goto LABEL_11;
  }
  v10 = sub_1000C8E68();
  v11 = v10;
  v12 = auto_unlock_log(v10);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "### Unable to enable Auto Unlock due to profile", buf, 2u);
    }

    v15 = SFAutoUnlockErrorDomain;
    v30 = NSLocalizedDescriptionKey;
    v31 = CFSTR("Disabled due to profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v17 = v15;
    v18 = 111;
    goto LABEL_7;
  }
  if (v14)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
    *(_DWORD *)buf = 138412546;
    v27 = v6;
    v28 = 2112;
    v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enabling device %@, id %@", buf, 0x16u);

  }
  v22 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008DE28;
  block[3] = &unk_100715138;
  block[4] = self;
  v24 = v6;
  v25 = v7;
  dispatch_async(v22, block);

LABEL_11:
}

- (void)cancelEnablingAllDevices
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008DEA4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)cancelEnablingAutoUnlockForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008E088;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelEnablingAutoUnlockForDeviceID:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cancel enabling device %@", (uint8_t *)&v13, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockPairingSessions](self, "lockPairingSessions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v4));

  if (v8 && (v9 = objc_msgSend(v8, "canceled"), (v9 & 1) == 0))
  {
    objc_msgSend(v8, "cancel");
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v11, "UUIDString"));
    -[SDAutoUnlockSessionManager disablePairingForDeviceID:pairingID:](self, "disablePairingForDeviceID:pairingID:", v4, v12);

  }
  else
  {
    v10 = auto_unlock_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No pairing lock session to cancel (device id: %@)", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)disableAutoUnlockForAllWatches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enabledAutoUnlockDevicesUsingCache:", 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "type", (_QWORD)v12) == (id)1)
          -[SDAutoUnlockSessionManager disableAutoUnlockForDevice:completionHandler:](self, "disableAutoUnlockForDevice:completionHandler:", v11, 0);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)disableAutoUnlockForDevice:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  SDAutoUnlockSessionManager *v15;
  id v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Disabling Auto Unlock (device: %@)", buf, 0xCu);
  }

  sub_1000CA254(CFSTR("com.apple.watch.auto-unlock.disabled"));
  v10 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E4D4;
  block[3] = &unk_100714F68;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)attemptAutoUnlockForType:(int64_t)a3
{
  -[SDAutoUnlockSessionManager attemptAutoUnlockForType:preventRadarNotification:](self, "attemptAutoUnlockForType:preventRadarNotification:", a3, 1);
}

- (void)attemptAutoUnlockForType:(int64_t)a3 preventRadarNotification:(BOOL)a4
{
  -[SDAutoUnlockSessionManager attemptAutoUnlockForType:externalACMContext:preventRadarNotification:bundlePath:appName:navBarTitle:reply:](self, "attemptAutoUnlockForType:externalACMContext:preventRadarNotification:bundlePath:appName:navBarTitle:reply:", a3, 0, a4, 0, 0, 0, 0);
}

- (void)attemptAutoUnlockForType:(int64_t)a3 externalACMContext:(id)a4 preventRadarNotification:(BOOL)a5 bundlePath:(id)a6 appName:(id)a7 navBarTitle:(id)a8 reply:(id)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  BOOL v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  _BOOL8 v29;
  const __CFString *v30;
  __CFString *v31;
  NSObject *v32;
  id v33;
  _QWORD block[6];
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  __CFString *v38;

  v12 = a5;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a4;
  v21 = auto_unlock_log(v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = a3 == 2;
    v33 = v19;
    v24 = v16;
    v25 = v18;
    v26 = v20;
    v27 = v17;
    v28 = a3;
    v29 = v12;
    if (v23)
      v30 = CFSTR("Approve with Apple Watch");
    else
      v30 = CFSTR("Auto Unlock");
    v31 = (__CFString *)sub_1000CEB84(0);
    *(_DWORD *)buf = 138412546;
    v36 = v30;
    v12 = v29;
    a3 = v28;
    v17 = v27;
    v20 = v26;
    v18 = v25;
    v16 = v24;
    v19 = v33;
    v37 = 2112;
    v38 = v31;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Begin %@: %@", buf, 0x16u);

  }
  kdebug_trace(725286912, 0, 0, 0, 0);
  -[SDAutoUnlockSessionManager setAttemptActivatedHandler:](self, "setAttemptActivatedHandler:", v16);

  -[SDAutoUnlockSessionManager setAttemptType:](self, "setAttemptType:", a3);
  -[SDAutoUnlockSessionManager setAttemptBundlePath:](self, "setAttemptBundlePath:", v19);

  -[SDAutoUnlockSessionManager setAttemptAppName:](self, "setAttemptAppName:", v18);
  -[SDAutoUnlockSessionManager setAttemptNavBarTitle:](self, "setAttemptNavBarTitle:", v17);

  -[SDAutoUnlockSessionManager setAttemptExternalACMContext:](self, "setAttemptExternalACMContext:", v20);
  -[SDAutoUnlockSessionManager setPreventRadarNotification:](self, "setPreventRadarNotification:", v12);
  v32 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008E818;
  block[3] = &unk_100716108;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v32, block);

}

- (void)generateAttemptForType:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  _UNKNOWN **v17;
  _UNKNOWN **v18;
  double v19;
  dispatch_time_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _UNKNOWN **v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  SDAutoUnlockSessionManager *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint8_t buf[16];

  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Test mode attempt", buf, 2u);
  }

  v7 = a3 == 2;
  v8 = objc_alloc_init((Class)SFAutoUnlockDevice);
  objc_msgSend(v8, "setName:", CFSTR("Apple Watch"));
  objc_msgSend(v8, "setModelName:", CFSTR("Apple Watch"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  objc_msgSend(v8, "setUniqueID:", v10);

  -[SDAutoUnlockSessionManager notifyObserverOfAttemptBeganWithDevice:](self, "notifyObserverOfAttemptBeganWithDevice:", v8);
  v11 = variable initialization expression of HeadphoneProxFeatureClient.delegate();
  v12 = (uint64_t)sub_1000C91F4();
  v13 = variable initialization expression of HeadphoneProxFeatureClient.delegate();
  v14 = sub_1000C835C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)v15;
  v17 = &off_100750048;
  if (v15)
    v17 = (_UNKNOWN **)v15;
  v18 = v17;

  objc_msgSend(v18, "doubleValue");
  v20 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
  v22 = SFMainQueue(v20, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008EA6C;
  block[3] = &unk_100716130;
  v27 = v8;
  v28 = v18;
  v31 = v12;
  v32 = v13;
  v29 = self;
  v30 = v11;
  v33 = v7;
  v24 = v18;
  v25 = v8;
  dispatch_after(v20, v23, block);

}

- (void)failedAttemptBeforeStarting:(id)a3 metricErrorString:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[8];
  _QWORD v16[8];

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v8);

  -[SDAutoUnlockSessionManager setAttemptStart:](self, "setAttemptStart:", 0);
  -[SDAutoUnlockSessionManager setPrewarmStart:](self, "setPrewarmStart:", 0);
  v15[0] = SDAutoUnlockManagerMetricSuccessKey;
  v15[1] = SDAutoUnlockManagerMetricErrorDomainKey;
  v16[0] = &off_10074B4D8;
  v16[1] = SFAutoUnlockErrorDomain;
  v15[2] = SDAutoUnlockManagerMetricErrorCodeKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "code")));
  v16[2] = v9;
  v16[3] = v6;
  v15[3] = SDAutoUnlockManagerMetricErrorStringKey;
  v15[4] = CFSTR("SDAutoUnlockBypassMetricLog");
  v16[4] = &__kCFBooleanTrue;
  v15[5] = SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices")));
  v16[5] = v10;
  v15[6] = SDAutoUnlockManagerMetricTimeSinceLastWakeKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
  v16[6] = v11;
  v15[7] = SDAutoUnlockManagerMetricLastSleepTypeKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType")));
  v16[7] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 8));

  v14 = objc_msgSend(v13, "mutableCopy");
  -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v14);

  -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:](self, "notifyObserversOfUnlockFailureWithResults:error:", v13, v7);
  -[SDAutoUnlockSessionManager setLastSleepType:](self, "setLastSleepType:", 0);
  -[SDAutoUnlockSessionManager setTimeSinceLastMachineWake:](self, "setTimeSinceLastMachineWake:", -1);
  -[SDAutoUnlockSessionManager setConnectedBluetoothDevices:](self, "setConnectedBluetoothDevices:", 0);

}

- (void)attemptAutoUnlock
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  unsigned int v11;
  const __CFString *v12;
  _QWORD *v13;
  NSDate *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t (**v26)(void);
  uint64_t v27;
  uint64_t (**v28)(void);
  uint64_t v29;
  uint64_t (**v30)(void);
  uint64_t v31;
  id v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  const __CFString *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  SDAutoUnlockSessionManager *v50;
  NSObject *v51;
  const __CFString *v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *i;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  const __CFString *v63;
  const __CFString *v64;
  int64_t v65;
  void *v66;
  _BOOL8 v67;
  uint64_t v68;
  void *v69;
  void *v70;
  unsigned __int8 (**v71)(void);
  int v72;
  uint64_t v73;
  void *v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  double v89;
  double v90;
  uint64_t v91;
  _BOOL8 v92;
  void *v93;
  void *v94;
  NSMutableSet *v95;
  id v96;
  id v97;
  void *j;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  unsigned int v103;
  uint64_t v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  const __CFString *v112;
  const __CFString *v113;
  uint64_t v114;
  __CFString *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  void *k;
  void *v127;
  int v128;
  id v129;
  uint64_t v130;
  NSObject *v131;
  NSMutableSet *v132;
  void *v133;
  id obj;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD v144[5];
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];
  NSErrorUserInfoKey v152;
  void *v153;
  NSErrorUserInfoKey v154;
  const __CFString *v155;
  NSErrorUserInfoKey v156;
  const __CFString *v157;
  NSErrorUserInfoKey v158;
  const __CFString *v159;
  NSErrorUserInfoKey v160;
  void *v161;
  _QWORD v162[2];
  _QWORD v163[2];
  NSErrorUserInfoKey v164;
  const __CFString *v165;
  uint8_t buf[4];
  int64_t v167;
  __int16 v168;
  int64_t v169;
  __int16 v170;
  int64_t v171;
  __int16 v172;
  void *v173;
  NSErrorUserInfoKey v174;
  const __CFString *v175;
  _BYTE v176[128];

  if (-[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress")
    && -[SDAutoUnlockSessionManager attemptPrewarmed](self, "attemptPrewarmed"))
  {
    -[SDAutoUnlockSessionManager setAttemptPrewarmed:](self, "setAttemptPrewarmed:", 0);
    v3 = -[SDAutoUnlockSessionManager isBeingUsedForSiri](self, "isBeingUsedForSiri");
    if (v3)
    {
      v4 = auto_unlock_log(v3);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SPI attempt overlap with prewarm attempt", buf, 2u);
      }

      v6 = SFAutoUnlockErrorDomain;
      v174 = NSLocalizedDescriptionKey;
      v175 = CFSTR("SPI attempt overlap with prewarm attempt, try again when phone is not prewarming");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1));
      v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, 219, v7));

      -[SDAutoUnlockSessionManager failedAttemptBeforeStarting:metricErrorString:](self, "failedAttemptBeforeStarting:metricErrorString:", v8, CFSTR("SPI attempt overlap with prewarm attempt, try again when phone is not prewarming"));
    }
    else
    {
      v148 = 0u;
      v149 = 0u;
      v146 = 0u;
      v147 = 0u;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "allValues"));

      v54 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v146, v176, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v147;
        do
        {
          for (i = 0; i != v55; i = (char *)i + 1)
          {
            if (*(_QWORD *)v147 != v56)
              objc_enumerationMutation(v8);
            v58 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v58, "attemptPrewarmed"))
            {
              objc_msgSend(v58, "setDoNotPostUnlockConfirmation:", -[SDAutoUnlockSessionManager doNotPostUnlockConfirmation](self, "doNotPostUnlockConfirmation"));
              objc_msgSend(v58, "completeAttemptIfNecessary");
            }
          }
          v55 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v146, v176, 16);
        }
        while (v55);
      }
    }
    goto LABEL_52;
  }
  v9 = -[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress");
  if (!v9)
  {
    v144[0] = _NSConcreteStackBlock;
    v144[1] = 3221225472;
    v144[2] = sub_10009017C;
    v144[3] = &unk_100716158;
    v144[4] = self;
    v145 = 0;
    v13 = objc_retainBlock(v144);
    -[SDAutoUnlockSessionManager setConnectedBluetoothDevices:](self, "setConnectedBluetoothDevices:", variable initialization expression of HeadphoneProxFeatureClient.delegate());
    -[SDAutoUnlockSessionManager setTimeSinceLastMachineWake:](self, "setTimeSinceLastMachineWake:", (uint64_t)sub_1000C91F4());
    -[SDAutoUnlockSessionManager setLastSleepType:](self, "setLastSleepType:", variable initialization expression of HeadphoneProxFeatureClient.delegate());
    v14 = objc_opt_new(NSDate);
    -[SDAutoUnlockSessionManager setAttemptStart:](self, "setAttemptStart:", v14);

    v16 = auto_unlock_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount");
      v19 = -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices");
      v20 = -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake");
      -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType");
      v21 = sub_1000C92E0();
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 134218754;
      v167 = v18;
      v168 = 2048;
      v169 = v19;
      v170 = 2048;
      v171 = v20;
      v172 = 2112;
      v173 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Starting attempt (attempt count: %ld, bluetooth devices: %ld, time since last wake: %ld seconds, sleep type: %@)", buf, 0x2Au);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager autoUnlockTransport](self, "autoUnlockTransport"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "enabledAutoUnlockDevicesUsingCache:", 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allObjects"));

    if (objc_msgSend(v25, "count"))
    {
      v26 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager isBluetoothEnabled](self, "isBluetoothEnabled"));
      v27 = v26[2]();

      v28 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager isWifiEnabled](self, "isWifiEnabled"));
      v29 = v28[2]();

      if ((id)-[SDAutoUnlockSessionManager attemptType](self, "attemptType") != (id)2 && (v29 & 1) == 0)
        -[SDAutoUnlockSessionManager presentedWiFiError](self, "presentedWiFiError");
      v30 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager isFaceIDEnabled](self, "isFaceIDEnabled"));
      v31 = v30[2]();

      if ((v31 & 1) != 0)
      {
        if ((v27 & v29 & 1) != 0)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v34 = objc_msgSend(v33, "internetSharingEnabled");

          if (v34)
          {
            v36 = auto_unlock_log(v35);
            v37 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "### Mac is internet sharing", buf, 2u);
            }

            v39 = SFLocalizedStringForKey(CFSTR("UNLOCK_INTERNET_SHARING"), v38);
            v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
            v41 = SFAutoUnlockErrorDomain;
            v160 = NSLocalizedDescriptionKey;
            v161 = v40;
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1));
            v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v41, 146, v42));

            -[SDAutoUnlockSessionManager failedAttemptBeforeStarting:metricErrorString:](self, "failedAttemptBeforeStarting:metricErrorString:", v8, v40);
            ((void (*)(_QWORD *, _QWORD))v13[2])(v13, 0);
            goto LABEL_24;
          }
          v71 = (unsigned __int8 (**)(void))objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager isActiveDeviceNearby](self, "isActiveDeviceNearby"));
          v72 = v71[2]();

          if ((v72 & 1) == 0)
          {
            v81 = auto_unlock_log(v73);
            v82 = objc_claimAutoreleasedReturnValue(v81);
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "### Device is not nearby", buf, 2u);
            }

            v83 = SFAutoUnlockErrorDomain;
            v158 = NSLocalizedDescriptionKey;
            v159 = CFSTR("Device not connected");
            v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1));
            v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v83, 186, v84));

            v52 = CFSTR("Device not nearby");
            goto LABEL_61;
          }
          v74 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
          v75 = objc_msgSend(v74, "isKeyBagLocked");

          if (v75)
          {
            v77 = auto_unlock_log(v76);
            v78 = objc_claimAutoreleasedReturnValue(v77);
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "### Watch needs to be unlocked", buf, 2u);
            }

            v79 = SFAutoUnlockErrorDomain;
            v156 = NSLocalizedDescriptionKey;
            v157 = CFSTR("Watch needs to be unlocked");
            v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1));
            v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v79, 102, v80));

            v52 = CFSTR("Watch locked and unarmed");
LABEL_61:
            v50 = self;
            v51 = v8;
            goto LABEL_29;
          }
          -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount");
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
          v86 = objc_msgSend(v85, "canPerformUnlocks");

          if ((v86 & 1) != 0)
          {

            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -23400.0));
            v88 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lastUnlockDate](self, "lastUnlockDate"));
            objc_msgSend(v88, "timeIntervalSinceDate:", v40);
            v90 = v89;

            if (v90 < 0.0)
            {
              v107 = auto_unlock_log(v91);
              v108 = objc_claimAutoreleasedReturnValue(v107);
              if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
              {
                v109 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lastUnlockDate](self, "lastUnlockDate"));
                *(_DWORD *)buf = 138412546;
                v167 = (int64_t)v109;
                v168 = 2112;
                v169 = (int64_t)v40;
                _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "Last unlock date: %@, should be after: %@", buf, 0x16u);

              }
            }
            else
            {
              v92 = -[SDAutoUnlockSessionManager lastLockedByRelock](self, "lastLockedByRelock");
              if (!v92)
              {
                v133 = v40;
                sub_1000C8A34(1);
                -[SDAutoUnlockSessionManager setAttemptInProgress:](self, "setAttemptInProgress:", 1);
                v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "UUIDString"));
                -[SDAutoUnlockSessionManager setAttemptID:](self, "setAttemptID:", v94);

                v95 = objc_opt_new(NSMutableSet);
                v140 = 0u;
                v141 = 0u;
                v142 = 0u;
                v143 = 0u;
                obj = v25;
                v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v151, 16);
                if (v96)
                {
                  v97 = v96;
                  v135 = *(_QWORD *)v141;
                  v132 = v95;
                  while (2)
                  {
                    for (j = 0; j != v97; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v141 != v135)
                        objc_enumerationMutation(obj);
                      v99 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)j);
                      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "uniqueID"));
                      v101 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
                      v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "deviceID"));
                      v103 = objc_msgSend(v100, "isEqualToString:", v102);

                      if (v103)
                      {
                        v95 = v132;
                        -[NSMutableSet addObject:](v132, "addObject:", v99);
                        goto LABEL_93;
                      }
                    }
                    v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v151, 16);
                    v95 = v132;
                    if (v97)
                      continue;
                    break;
                  }
                }
LABEL_93:

                -[SDAutoUnlockSessionManager setScanAutoUnlockDevices:](self, "setScanAutoUnlockDevices:", v95);
                v121 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
                objc_msgSend(v121, "setAutoUnlockActive:", 1);

                v138 = 0u;
                v139 = 0u;
                v136 = 0u;
                v137 = 0u;
                v115 = v95;
                v122 = -[__CFString countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v136, v150, 16);
                if (v122)
                {
                  v123 = v122;
                  LODWORD(v124) = 0;
                  v125 = *(_QWORD *)v137;
                  do
                  {
                    for (k = 0; k != v123; k = (char *)k + 1)
                    {
                      if (*(_QWORD *)v137 != v125)
                        objc_enumerationMutation(v115);
                      v127 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)k);
                      if (objc_msgSend(v127, "supportsHEIC"))
                        v128 = 2;
                      else
                        v128 = 1;
                      v124 = v128 | v124;
                      -[SDAutoUnlockSessionManager createLockSessionWithWatchDevice:](self, "createLockSessionWithWatchDevice:", v127);
                    }
                    v123 = -[__CFString countByEnumeratingWithState:objects:count:](v115, "countByEnumeratingWithState:objects:count:", &v136, v150, 16);
                  }
                  while (v123);
                }
                else
                {
                  v124 = 0;
                }

                v129 = -[SDAutoUnlockSessionManager attemptType](self, "attemptType");
                if (v129 == (id)2)
                  v129 = -[SDAutoUnlockSessionManager generateAppIconImageWithOptions:](self, "generateAppIconImageWithOptions:", v124);
                v130 = auto_unlock_log(v129);
                v131 = objc_claimAutoreleasedReturnValue(v130);
                v40 = v133;
                if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v167 = (int64_t)v115;
                  _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_DEFAULT, "Connecting to watches: %@", buf, 0xCu);
                }

                ((void (*)(_QWORD *, uint64_t))v13[2])(v13, 1);
                v8 = 0;
                goto LABEL_110;
              }
            }
            v110 = auto_unlock_log(v92);
            v111 = objc_claimAutoreleasedReturnValue(v110);
            if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
            {
              if (v90 < 0.0)
                v112 = CFSTR("NO");
              else
                v112 = CFSTR("YES");
              if (-[SDAutoUnlockSessionManager lastLockedByRelock](self, "lastLockedByRelock"))
                v113 = CFSTR("YES");
              else
                v113 = CFSTR("NO");
              *(_DWORD *)buf = 138412546;
              v167 = (int64_t)v112;
              v168 = 2112;
              v169 = (int64_t)v113;
              _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "### Device needs to be unlocked through another method first (unlocked recently: %@, last locked by relock %@)", buf, 0x16u);
            }

            if (v90 < 0.0)
            {
              v115 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No unlocks in the last %f hrs"), 0x4018000000000000));
              v116 = 214;
            }
            else
            {
              v115 = CFSTR("Blocked PAU attempt due to Relock");
              v116 = 216;
            }
            v117 = SFLocalizedStringForKey(CFSTR("UNLOCK_EXPIRED_TEXT"), v114);
            v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
            v119 = SFAutoUnlockErrorDomain;
            v152 = NSLocalizedDescriptionKey;
            v153 = v118;
            v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1));
            v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v119, v116, v120));

            -[SDAutoUnlockSessionManager failedAttemptBeforeStarting:metricErrorString:](self, "failedAttemptBeforeStarting:metricErrorString:", v8, v115);
            ((void (*)(_QWORD *, _QWORD))v13[2])(v13, 0);

LABEL_110:
LABEL_24:

LABEL_51:
            goto LABEL_52;
          }
          v104 = auto_unlock_log(v87);
          v105 = objc_claimAutoreleasedReturnValue(v104);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "### Device needs to be unlocked through another method first (device armed: NO)", buf, 2u);
          }

          v106 = SFAutoUnlockErrorDomain;
          v154 = NSLocalizedDescriptionKey;
          v46 = CFSTR("Token not armed");
          v155 = CFSTR("Token not armed");
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));
          v48 = v106;
          v49 = 213;
LABEL_28:
          v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v48, v49, v47));

          v50 = self;
          v51 = v8;
          v52 = v46;
LABEL_29:
          -[SDAutoUnlockSessionManager failedAttemptBeforeStarting:metricErrorString:](v50, "failedAttemptBeforeStarting:metricErrorString:", v51, v52);
          ((void (*)(_QWORD *, _QWORD))v13[2])(v13, 0);
          goto LABEL_51;
        }
      }
      else
      {
        v59 = auto_unlock_log(v32);
        v60 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "### FaceID disabled. Disabling Auto Unlock for all key devices", buf, 2u);
        }

        v32 = -[SDAutoUnlockSessionManager disableAutoUnlockForAllWatches](self, "disableAutoUnlockForAllWatches");
      }
      v61 = auto_unlock_log(v32);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = CFSTR("YES");
        if ((_DWORD)v27)
          v64 = CFSTR("NO");
        else
          v64 = CFSTR("YES");
        if ((_DWORD)v29)
          v63 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v167 = (int64_t)v64;
        v168 = 2112;
        v169 = (int64_t)v63;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "### Interfaces off (bluetooth off: %@, wifi off: %@)", buf, 0x16u);
      }

      v65 = -[SDAutoUnlockSessionManager errorCodeForBluetoothEnabled:wifiEnabled:faceIDEnabled:](self, "errorCodeForBluetoothEnabled:wifiEnabled:faceIDEnabled:", v27, v29, v31);
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager errorStringForBluetoothEnabled:wifiEnabled:faceIDEnabled:](self, "errorStringForBluetoothEnabled:wifiEnabled:faceIDEnabled:", v27, v29, v31));
      v67 = -[SDAutoUnlockSessionManager shouldShowErrorForBluetoothEnabled:](self, "shouldShowErrorForBluetoothEnabled:", v27);
      v68 = SFAutoUnlockErrorDomain;
      v163[0] = v66;
      v162[0] = NSLocalizedDescriptionKey;
      v162[1] = CFSTR("SDAutoUnlockShowScreenLockError");
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v67));
      v163[1] = v69;
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v163, v162, 2));
      v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v68, v65, v70));

      -[SDAutoUnlockSessionManager failedAttemptBeforeStarting:metricErrorString:](self, "failedAttemptBeforeStarting:metricErrorString:", v8, v66);
      ((void (*)(_QWORD *, _QWORD))v13[2])(v13, 0);

      goto LABEL_51;
    }
    v43 = auto_unlock_log(0);
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "### No enabled devices for attempt", buf, 2u);
    }

    v45 = SFAutoUnlockErrorDomain;
    v164 = NSLocalizedDescriptionKey;
    v46 = CFSTR("No enabled devices");
    v165 = CFSTR("No enabled devices");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1));
    v48 = v45;
    v49 = 117;
    goto LABEL_28;
  }
  v10 = auto_unlock_log(v9);
  v8 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress");
    v12 = CFSTR("NO");
    if (v11)
      v12 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v167 = (int64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempt already in progress (progress state: %@)", buf, 0xCu);
  }
LABEL_52:

}

- (void)prewarmAutoUnlock
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSDate *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  v4 = objc_msgSend(v3, "shouldPrewarmAttempt");

  if (v4)
  {
    v6 = auto_unlock_log(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Beginning prewarming of unlock attempt", v9, 2u);
    }

    -[SDAutoUnlockSessionManager setAttemptPrewarmed:](self, "setAttemptPrewarmed:", 1);
    v8 = objc_opt_new(NSDate);
    -[SDAutoUnlockSessionManager setPrewarmStart:](self, "setPrewarmStart:", v8);

    -[SDAutoUnlockSessionManager attemptAutoUnlockForType:](self, "attemptAutoUnlockForType:", 1);
  }
  else
  {
    -[SDAutoUnlockSessionManager setAttemptPrewarmed:](self, "setAttemptPrewarmed:", 0);
  }
}

- (void)attemptAutoUnlockForSiri
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "attemptAutoUnlockForSiri", v5, 2u);
  }

  -[SDAutoUnlockSessionManager setIsBeingUsedForSiri:](self, "setIsBeingUsedForSiri:", 1);
  -[SDAutoUnlockSessionManager attemptAutoUnlockForType:](self, "attemptAutoUnlockForType:", 1);
}

- (void)attemptAutoUnlockWithoutNotifyingWatch
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Calling attemptAutoUnlockWithoutNotifyingWatch", v5, 2u);
  }

  -[SDAutoUnlockSessionManager setDoNotPostUnlockConfirmation:](self, "setDoNotPostUnlockConfirmation:", 1);
  -[SDAutoUnlockSessionManager attemptAutoUnlockForType:](self, "attemptAutoUnlockForType:", 1);
}

- (void)completeAutoUnlockWithNotification:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  const __CFString *v12;

  v3 = a3;
  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Complete Auto Unlock, Post Notification: %@", buf, 0xCu);
  }

  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100090580;
  v9[3] = &unk_100715BB0;
  v9[4] = self;
  v10 = v3;
  dispatch_async(v8, v9);

}

- (void)donateDeviceUnlockedWithMask:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = !a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, SDAutoUnlockManagerMetricMaskKey);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  objc_msgSend(v7, "deviceUnlockedWithMask:", v4);

}

- (void)invalidateAttempt
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating attempt", buf, 2u);
  }

  -[SDAutoUnlockSessionManager setAttemptActivatedHandler:](self, "setAttemptActivatedHandler:", 0);
  -[SDAutoUnlockSessionManager setAttemptType:](self, "setAttemptType:", 0);
  -[SDAutoUnlockSessionManager setAttemptDevice:](self, "setAttemptDevice:", 0);
  -[SDAutoUnlockSessionManager setAttemptExternalACMContext:](self, "setAttemptExternalACMContext:", 0);
  -[SDAutoUnlockSessionManager setAttemptBundlePath:](self, "setAttemptBundlePath:", 0);
  -[SDAutoUnlockSessionManager setAttemptAppName:](self, "setAttemptAppName:", 0);
  -[SDAutoUnlockSessionManager setAttemptID:](self, "setAttemptID:", 0);
  -[SDAutoUnlockSessionManager setAttemptStart:](self, "setAttemptStart:", 0);
  -[SDAutoUnlockSessionManager setPrewarmStart:](self, "setPrewarmStart:", 0);
  -[SDAutoUnlockSessionManager setAuthSessionError:](self, "setAuthSessionError:", 0);
  -[SDAutoUnlockSessionManager setIncrementedCountID:](self, "setIncrementedCountID:", 0);
  -[SDAutoUnlockSessionManager setLastSleepType:](self, "setLastSleepType:", 0);
  -[SDAutoUnlockSessionManager setTimeSinceLastMachineWake:](self, "setTimeSinceLastMachineWake:", -1);
  -[SDAutoUnlockSessionManager setConnectedBluetoothDevices:](self, "setConnectedBluetoothDevices:", 0);
  -[SDAutoUnlockSessionManager setAttemptPrewarmed:](self, "setAttemptPrewarmed:", 0);
  -[SDAutoUnlockSessionManager setAttemptInProgress:](self, "setAttemptInProgress:", 0);
  -[SDAutoUnlockSessionManager setProxyNotAvailableForUnlock:](self, "setProxyNotAvailableForUnlock:", 0);
  -[SDAutoUnlockSessionManager setScanWatchIDs:](self, "setScanWatchIDs:", 0);
  -[SDAutoUnlockSessionManager setScanPhoneIDs:](self, "setScanPhoneIDs:", 0);
  -[SDAutoUnlockSessionManager setScanAutoUnlockDevices:](self, "setScanAutoUnlockDevices:", 0);
  -[SDAutoUnlockSessionManager setDoNotPostUnlockConfirmation:](self, "setDoNotPostUnlockConfirmation:", 0);
  -[SDAutoUnlockSessionManager invalidateScanner](self, "invalidateScanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  objc_msgSend(v5, "setAutoUnlockActive:", 0);

  -[SDAutoUnlockSessionManager setIsBeingUsedForSiri:](self, "setIsBeingUsedForSiri:", 0);
  -[SDAutoUnlockSessionManager cleanUpProxySessions](self, "cleanUpProxySessions");
  sub_1000C8A34(0);
  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Posting state changed: Attempt invalidated", v14, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, SFAutoUnlockStateChangedNotification, 0, 0, 1u);
  v10 = -[SDAutoUnlockSessionManager wifiStateNeedsUpdating](self, "wifiStateNeedsUpdating");
  if (v10)
  {
    v11 = auto_unlock_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating WiFi state after attempt", v13, 2u);
    }

    -[SDAutoUnlockSessionManager handleWiFiPowerChanged:](self, "handleWiFiPowerChanged:", 0);
  }
}

- (void)completeSuccessfulAttempt
{
  -[SDAutoUnlockSessionManager setLastUnlockedByWatch:](self, "setLastUnlockedByWatch:", 1);
  -[SDAutoUnlockSessionManager grabLanguageAssertionForAutoRelock](self, "grabLanguageAssertionForAutoRelock");
}

- (void)cancelAutoUnlock
{
  -[SDAutoUnlockSessionManager cancelAutoUnlockWithCancelReason:usingTool:](self, "cancelAutoUnlockWithCancelReason:usingTool:", -1, 0);
}

- (void)cancelAutoUnlockWithCancelReason:(int64_t)a3 usingTool:(BOOL)a4
{
  NSObject *v7;
  _QWORD block[6];
  BOOL v9;

  v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090D60;
  block[3] = &unk_100716180;
  v9 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v7, block);

}

- (void)cancelAttemptsForDeviceUnlocked
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "aksSuccess"))
        {

          v11 = auto_unlock_log(v10);
          v12 = objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Canceling attempt in progress – device unlocked", v13, 2u);
          }

          -[SDAutoUnlockSessionManager cancelAutoUnlock](self, "cancelAutoUnlock");
          return;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }

}

- (void)logUnintentionalAutoUnlockAttempt:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000914F4;
  v6[3] = &unk_100716108;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)incrementAttemptCount
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceKeyBagUnlocked");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptID](self, "attemptID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager incrementedCountID](self, "incrementedCountID"));
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptID](self, "attemptID"));
      -[SDAutoUnlockSessionManager setIncrementedCountID:](self, "setIncrementedCountID:", v8);

      v9 = auto_unlock_log(-[SDAutoUnlockSessionManager setAttemptCount:](self, "setAttemptCount:", (char *)-[SDAutoUnlockSessionManager attemptCount](self, "attemptCount") + 1));
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Incremented attempt count %d", (uint8_t *)v11, 8u);
      }

    }
  }
}

- (void)decrementAttemptCount
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount");
  if (v3 >= 1)
  {
    v4 = auto_unlock_log(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Decrementing", v6, 2u);
    }

    -[SDAutoUnlockSessionManager setAttemptCount:](self, "setAttemptCount:", (char *)-[SDAutoUnlockSessionManager attemptCount](self, "attemptCount") - 1);
  }
}

- (void)requestRelock
{
  uint64_t v3;
  NSObject *v4;
  SDAutoUnlockRelockRequest *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending relock request", v8, 2u);
  }

  v5 = objc_alloc_init(SDAutoUnlockRelockRequest);
  -[SDAutoUnlockRelockRequest setVersion:](v5, "setVersion:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockRelockRequest data](v5, "data"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetTransport](self, "magnetTransport"));
  objc_msgSend(v7, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v6, 110, 0, 1, &stru_1007161A0);

}

- (void)autoUnlockStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = -[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));

    if (v6)
      v7 = 3;
    else
      v7 = 2;
  }
  else
  {
    v7 = 1;
  }
  v8 = auto_unlock_log(v5);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (-[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress"))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager stringForState:](self, "stringForState:", v7));
    v14 = 138412802;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "State requested (attempt in progress: %@, device: %@, state: %@)", (uint8_t *)&v14, 0x20u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v7));
  v4[2](v4, v13, 0);

}

- (id)stringForState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unexpected");
  else
    return *(&off_1007162B8 + a3);
}

- (void)authPromptInfoWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void (**)(id, void *, _QWORD))a3;
  v4 = auto_unlock_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Returning auth prompt info", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockNotificationsManager sharedManager](SDAutoUnlockNotificationsManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notificationModel"));
  v3[2](v3, v7, 0);

}

- (BOOL)disablePairingForDeviceID:(id)a3 pairingID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Disabling (device ID: %@, pairingID: %@)", (uint8_t *)&v13, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v11 = objc_msgSend(v10, "disablePairingWithKeyDevice:", v6);

  -[SDAutoUnlockSessionManager sendDisableMessageToDeviceID:pairingID:](self, "sendDisableMessageToDeviceID:pairingID:", v6, v7);
  return v11;
}

- (void)sendDisableMessageToDeviceID:(id)a3 pairingID:(id)a4
{
  id v5;
  id v6;
  SDUnlockDisable *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  SDUnlockDisable *v24;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(SDUnlockDisable);
  -[SDUnlockDisable setVersion:](v7, "setVersion:", 1);
  -[SDUnlockDisable setPairingID:](v7, "setPairingID:", v6);

  v9 = auto_unlock_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class(v7, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138412546;
    v22 = v14;
    v23 = 2112;
    v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending %@ %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockDisable data](v7, "data"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100091E8C;
  v19[3] = &unk_1007147C8;
  v20 = v5;
  v18 = v5;
  objc_msgSend(v15, "sendPayload:toDevice:type:sessionID:timeout:errorHandler:", v16, v18, 2, 0, v17, v19);

}

- (void)transport:(id)a3 didReceiveDisableMessage:(id)a4 fromDeviceID:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  SDAutoUnlockSessionManager *v15;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091FA8;
  block[3] = &unk_100715138;
  v13 = v8;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (void)handleDisableMessageForKey:(id)a3 fromDeviceID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyPairingIDForDeviceID:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyPairingSessions](self, "keyPairingSessions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v7));

  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingID"));
    v13 = objc_msgSend(v12, "isEqualToString:", v9);

    if ((v13 & 1) == 0 && !v11)
    {
      v15 = auto_unlock_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        goto LABEL_14;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingID"));
      v29 = 138412546;
      v30 = v9;
      v31 = 2112;
      v32 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not disabling (local pairingID: %@, received pairingID: %@)", (uint8_t *)&v29, 0x16u);
LABEL_6:

      goto LABEL_13;
    }
  }
  if (v11)
  {
    objc_msgSend(v11, "cancel");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingID"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager canceledPairingKeySessions](self, "canceledPairingKeySessions"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingID"));
      objc_msgSend(v19, "addObject:", v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingID"));
    v24 = objc_msgSend(v22, "isEqualToString:", v23);

    if (!v24)
    {
      v26 = auto_unlock_log(v25);
      v16 = objc_claimAutoreleasedReturnValue(v26);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pairingID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionID"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
      v29 = 138412802;
      v30 = v7;
      v31 = 2112;
      v32 = v17;
      v33 = 2112;
      v34 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "### Received disable while enabling device but pairing IDs don't match (lock device: %@, received pairing ID: %@, session ID: %@)", (uint8_t *)&v29, 0x20u);

      goto LABEL_6;
    }
  }
  -[SDAutoUnlockSessionManager disableKeyPairingForDeviceID:](self, "disableKeyPairingForDeviceID:", v7);
LABEL_14:

}

- (void)handleDisableMessageForLock:(id)a3 fromDeviceID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pairingIDForWatchID:", v6));

  if (v8
    && objc_msgSend(v5, "hasPairingID")
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pairingID")),
        v10 = objc_msgSend(v9, "isEqualToString:", v8),
        v9,
        !v10))
  {
    v13 = auto_unlock_log(v11);
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pairingID"));
      v15 = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not disabling (local pairingID: %@, received pairingID: %@)", (uint8_t *)&v15, 0x16u);

    }
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    -[NSObject disablePairingWithKeyDevice:](v12, "disablePairingWithKeyDevice:", v6);
  }

}

- (void)disableKeyPairingForDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  objc_msgSend(v5, "deleteEscrowSecretForDeviceID:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  objc_msgSend(v6, "deleteRangingKeyForDeviceID:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v8 = objc_msgSend(v7, "deviceTypeForDeviceID:", v4);

  if (v8 == (id)2)
  {
    v10 = auto_unlock_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing remote LTK for %@", (uint8_t *)&v13, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    objc_msgSend(v12, "removeRemoteLTKForDeviceID:", v4);

  }
  -[SDAutoUnlockSessionManager updateAdvertising](self, "updateAdvertising");

}

- (void)createPairingLockSessionWithDevice:(id)a3 passcode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  SDAutoUnlockPairingLockSession *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockPairingSessions](self, "lockPairingSessions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  if (!v10)
  {
    v15 = [SDAutoUnlockPairingLockSession alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v13 = -[SDAutoUnlockPairingLockSession initWithDevice:sessionID:](v15, "initWithDevice:sessionID:", v16, v17);

    -[NSObject setDelegate:](v13, "setDelegate:", self);
    -[NSObject setPasscode:](v13, "setPasscode:", v7);
    -[NSObject setPlaceholder:](v13, "setPlaceholder:", objc_msgSend(v6, "placeholder"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "suggestedDeviceID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    if ((_DWORD)v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
      objc_msgSend(v22, "setSuggestedDeviceID:", 0);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "setupRetryDeviceID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
    v26 = objc_msgSend(v24, "isEqualToString:", v25);

    if ((_DWORD)v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
      objc_msgSend(v27, "setSetupRetryDeviceID:", 0);

    }
    -[NSObject setSetupRetryDevice:](v13, "setSetupRetryDevice:", v26);
    -[NSObject setUpsellDevice:](v13, "setUpsellDevice:", v21);
    -[NSObject start](v13, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockPairingSessions](self, "lockPairingSessions"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v28);

    goto LABEL_9;
  }
  v12 = auto_unlock_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockPairingSessions](self, "lockPairingSessions"));
    v29 = 138412290;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Pairing lock session in progress %@", (uint8_t *)&v29, 0xCu);
LABEL_9:

  }
}

- (void)createPairingKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  SDAutoUnlockPairingKeySession *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyPairingSessions](self, "keyPairingSessions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v9));

    if (v13)
    {
      v15 = auto_unlock_log(v14);
      v16 = (SDAutoUnlockPairingKeySession *)objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(&v16->super.super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyPairingSessions](self, "keyPairingSessions"));
      v21 = 138412290;
      v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, &v16->super.super, OS_LOG_TYPE_DEFAULT, "Pairing key session in progress %@", (uint8_t *)&v21, 0xCu);
    }
    else
    {
      v16 = -[SDAutoUnlockPairingKeySession initWithDevice:sessionID:]([SDAutoUnlockPairingKeySession alloc], "initWithDevice:sessionID:", v9, v8);
      -[SDAutoUnlockPairingSession setDelegate:](v16, "setDelegate:", self);
      -[SDAutoUnlockPairingKeySession setRequestData:](v16, "setRequestData:", v11);
      -[SDAutoUnlockPairingKeySession start](v16, "start");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyPairingSessions](self, "keyPairingSessions"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v9);
    }

    goto LABEL_10;
  }
  v18 = auto_unlock_log(v10);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_10009D0AC();

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  objc_msgSend(v20, "logDevices");

LABEL_11:
}

- (void)createLockSessionWithWatchDevice:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  SDAutoUnlockLockSession *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  _QWORD v35[2];

  v4 = a3;
  v5 = objc_alloc_init((Class)SFBLEDevice);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothID"));
  objc_msgSend(v5, "setIdentifier:", v6);

  objc_msgSend(v5, "setUseBTPipe:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));

  if (!v9)
  {
    v14 = [SDAutoUnlockLockSession alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = -[SDAutoUnlockLockSession initWithAutoUnlockDevice:sessionID:bleDevice:](v14, "initWithAutoUnlockDevice:sessionID:bleDevice:", v4, v15, v5);

    -[NSObject setUseProxy:](v12, "setUseProxy:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptStart](self, "attemptStart"));
    -[NSObject setAttemptStartDate:](v12, "setAttemptStartDate:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager prewarmStart](self, "prewarmStart"));
    -[NSObject setPrewarmStartDate:](v12, "setPrewarmStartDate:", v17);

    -[NSObject setAttemptType:](v12, "setAttemptType:", -[SDAutoUnlockSessionManager attemptType](self, "attemptType"));
    -[NSObject setUseEncryption:](v12, "setUseEncryption:", objc_msgSend(v4, "supportsEncryption"));
    -[NSObject setConnectedBluetoothDevices:](v12, "setConnectedBluetoothDevices:", -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices"));
    -[NSObject setTimeSinceLastMachineWake:](v12, "setTimeSinceLastMachineWake:", -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake"));
    -[NSObject setLastSleepType:](v12, "setLastSleepType:", -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType"));
    -[NSObject setAttemptPrewarmed:](v12, "setAttemptPrewarmed:", -[SDAutoUnlockSessionManager attemptPrewarmed](self, "attemptPrewarmed"));
    -[NSObject setDoNotPostUnlockConfirmation:](v12, "setDoNotPostUnlockConfirmation:", -[SDAutoUnlockSessionManager doNotPostUnlockConfirmation](self, "doNotPostUnlockConfirmation"));
    -[NSObject setIsAuthenticatingForSiri:](v12, "setIsAuthenticatingForSiri:", -[SDAutoUnlockSessionManager isBeingUsedForSiri](self, "isBeingUsedForSiri"));
    -[NSObject setDelegate:](v12, "setDelegate:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lastUnlockDate](self, "lastUnlockDate"));
    -[NSObject setLastLocalUnlockDate:](v12, "setLastLocalUnlockDate:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockStateChangedDate](self, "lockStateChangedDate"));
    objc_msgSend(v19, "timeIntervalSinceNow");
    v21 = v20;

    v23 = auto_unlock_log(v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if (v21 < (double)-480)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        sub_10009D0D8(480, self, v25);
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockStateChangedDate](self, "lockStateChangedDate"));
      v34 = 67109378;
      LODWORD(v35[0]) = 8;
      WORD2(v35[0]) = 2112;
      *(_QWORD *)((char *)v35 + 6) = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Phone was used within the last %d min. Last lock/unlock date: %@. Telling Watch to skip motion check", (uint8_t *)&v34, 0x12u);

    }
    -[NSObject setSkipMotionCheck:](v12, "setSkipMotionCheck:", v21 >= (double)-480);
    if ((id)-[SDAutoUnlockSessionManager attemptType](self, "attemptType") == (id)2)
    {
      v27 = auto_unlock_log(2);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptExternalACMContext](self, "attemptExternalACMContext"));
        v34 = 138412290;
        v35[0] = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Lock session setting context %@", (uint8_t *)&v34, 0xCu);

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptExternalACMContext](self, "attemptExternalACMContext"));
      -[NSObject setExternalACMContext:](v12, "setExternalACMContext:", v30);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));
    -[NSObject setUseAKSToken:](v12, "setUseAKSToken:", objc_msgSend(v31, "containsObject:", v32));

    -[NSObject start](v12, "start");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v33);

    goto LABEL_14;
  }
  v11 = auto_unlock_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    v34 = 138412290;
    v35[0] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Auth lock session in progress %@", (uint8_t *)&v34, 0xCu);
LABEL_14:

  }
}

- (void)createKeySessionWithBLEDevice:(id)a3 sessionID:(id)a4 wrapper:(id)a5 useEncryption:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  SDAutoUnlockKeySession *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[SDAutoUnlockSessionManager invalidateExistingSessionsForBLEDevice:incomingSessionID:](self, "invalidateExistingSessionsForBLEDevice:incomingSessionID:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](self, "keyAuthSessions"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

  if (!v15)
  {
    v18 = -[SDAutoUnlockKeySession initWithBLEDevice:sessionID:]([SDAutoUnlockKeySession alloc], "initWithBLEDevice:sessionID:", v10, v11);
    -[SDAutoUnlockPairingSession setDelegate:](v18, "setDelegate:", self);
    -[SDAutoUnlockAuthSession setUseEncryption:](v18, "setUseEncryption:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keysWithAKSTokens](self, "keysWithAKSTokens"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    -[SDAutoUnlockAuthSession setUseAKSToken:](v18, "setUseAKSToken:", objc_msgSend(v20, "containsObject:", v21));

    -[SDAutoUnlockKeySession setLocalDeviceNeedsArming:](v18, "setLocalDeviceNeedsArming:", -[SDAutoUnlockSessionManager needsArming](self, "needsArming"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keysWithAKSTokens](self, "keysWithAKSTokens"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    objc_msgSend(v22, "removeObject:", v23);

    -[SDAutoUnlockKeySession setWifiEnabled:](v18, "setWifiEnabled:", -[SDAutoUnlockSessionManager cachedWatchWiFiState](self, "cachedWatchWiFiState"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "wakeGestureDates"));
    -[SDAutoUnlockKeySession setWakeGestureDates:](v18, "setWakeGestureDates:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager unlockedOnWristDate](self, "unlockedOnWristDate"));
    -[SDAutoUnlockKeySession setUnlockedOnWristDate:](v18, "setUnlockedOnWristDate:", v26);

    -[SDAutoUnlockKeySession setNeedsStrictMotionCheck:](v18, "setNeedsStrictMotionCheck:", -[SDAutoUnlockSessionManager needsStrictMotionCheck](self, "needsStrictMotionCheck"));
    -[SDAutoUnlockAuthSession start](v18, "start");
    -[SDAutoUnlockKeySession handleMessageWithWrapper:](v18, "handleMessageWithWrapper:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](self, "keyAuthSessions"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v27);

    goto LABEL_5;
  }
  v17 = auto_unlock_log(v16);
  v18 = (SDAutoUnlockKeySession *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(&v18->super.super.super, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](self, "keyAuthSessions"));
    v28 = 138412290;
    v29 = v19;
    _os_log_impl((void *)&_mh_execute_header, &v18->super.super.super, OS_LOG_TYPE_DEFAULT, "Auth key session in progress %@", (uint8_t *)&v28, 0xCu);
LABEL_5:

  }
}

- (void)createProxySessionWithDeviceID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  SDAutoUnlockProxySession *v14;
  void *v15;
  SDAutoUnlockProxySession *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bluetoothIDForIDSID:", v4));
  v7 = objc_alloc_init((Class)SFBLEDevice);
  objc_msgSend(v7, "setIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  if (v10)
  {
    v12 = auto_unlock_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Already sent trigger to device", v21, 2u);
    }

  }
  else
  {
    kdebug_trace(725286916, 0, 0, 0, 0);
    v14 = [SDAutoUnlockProxySession alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v16 = -[SDAutoUnlockProxySession initWithDevice:sessionID:bleDevice:](v14, "initWithDevice:sessionID:bleDevice:", v4, v15, v7);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelIdentifierForDeviceID:", v4));
    -[SDAutoUnlockProxySession setModel:](v16, "setModel:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptStart](self, "attemptStart"));
    -[SDAutoUnlockProxySession setStartDate:](v16, "setStartDate:", v18);

    -[SDAutoUnlockPairingSession setDelegate:](v16, "setDelegate:", self);
    -[SDAutoUnlockProxySession start](v16, "start");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, v20);

  }
}

- (void)updateStringForProxySession
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (!-[SDAutoUnlockSessionManager proxyErrorCode](self, "proxyErrorCode"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions", 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v10 = objc_msgSend(v9, "state");
          if ((uint64_t)v10 <= -[SDAutoUnlockSessionManager lastProxyState](self, "lastProxyState"))
            v11 = -[SDAutoUnlockSessionManager lastProxyState](self, "lastProxyState");
          else
            v11 = objc_msgSend(v9, "state");
          -[SDAutoUnlockSessionManager setLastProxyState:](self, "setLastProxyState:", v11);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

    if ((id)-[SDAutoUnlockSessionManager lastProxyState](self, "lastProxyState") == (id)2)
    {
      v12 = CFSTR("Trigger Send Failed With Timeout");
      v13 = 142;
    }
    else
    {
      if ((id)-[SDAutoUnlockSessionManager lastProxyState](self, "lastProxyState") != (id)3)
        return;
      v12 = CFSTR("Unable to Find Proxy Watch");
      v13 = 132;
    }
    -[SDAutoUnlockSessionManager setScanErrorString:](self, "setScanErrorString:", v12);
    -[SDAutoUnlockSessionManager setProxyErrorCode:](self, "setProxyErrorCode:", v13);
  }
}

- (void)cleanUpProxySessions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[SDAutoUnlockSessionManager updateStringForProxySession](self, "updateStringForProxySession");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "invalidate");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
  objc_msgSend(v9, "removeAllObjects");

  -[SDAutoUnlockSessionManager setLastProxyState:](self, "setLastProxyState:", 0);
  -[SDAutoUnlockSessionManager setNotifiedForProxy:](self, "setNotifiedForProxy:", 0);
  -[SDAutoUnlockSessionManager setProxyDiscoverTime:](self, "setProxyDiscoverTime:", 0.0);
  -[SDAutoUnlockSessionManager setProxyDeviceModel:](self, "setProxyDeviceModel:", 0);
  -[SDAutoUnlockSessionManager setProxyConnectionTime:](self, "setProxyConnectionTime:", 0.0);
  -[SDAutoUnlockSessionManager setProxyErrorCode:](self, "setProxyErrorCode:", 0);
  -[SDAutoUnlockSessionManager setProxyRSSI:](self, "setProxyRSSI:", 0);
}

- (void)clearAllKeysWithTokens
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing all keys with tokens", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keysWithAKSTokens](self, "keysWithAKSTokens"));
  objc_msgSend(v5, "removeAllObjects");

}

- (void)cancelAllLockSessionsForScanTimeout
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "setAttemptTimedOut:", 1);
        objc_msgSend(v8, "cancel");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)invalidateExistingSessionsForBLEDevice:(id)a3 incomingSessionID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  SDAutoUnlockSessionManager *v28;
  char v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cachedIDSDeviceIDsForBluetoothID:", v9));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  v28 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](self, "keyAuthSessions"));
  v12 = objc_msgSend(v11, "copy");

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  v15 = v13;
  if (!v14)
  {
LABEL_16:

    goto LABEL_17;
  }
  v16 = v14;
  v27 = v6;
  v29 = 0;
  v17 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(_QWORD *)v32 != v17)
        objc_enumerationMutation(v13);
      v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
      if ((objc_msgSend(v21, "isEqualToString:", v19) & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "deviceID"));
        v23 = objc_msgSend(v22, "isEqualToString:", v30);

        if (!v23)
          goto LABEL_12;
        v25 = auto_unlock_log(v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v20;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Invalidating existing session: %@", buf, 0xCu);
        }

        objc_msgSend(v20, "invalidateOnQueue");
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyAuthSessions](v28, "keyAuthSessions"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", 0, v19);
        v29 = 1;
      }

LABEL_12:
    }
    v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  }
  while (v16);

  v6 = v27;
  if ((v29 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockNotificationsManager sharedManager](SDAutoUnlockNotificationsManager, "sharedManager"));
    objc_msgSend(v15, "removeAutoUnlockNotification");
    goto LABEL_16;
  }
LABEL_17:

}

- (void)createRegistrationKeySessionWithIdentifier:(id)a3 deviceID:(id)a4 requestData:(id)a5 locallyGenerated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  SDAutoUnlockRegistrationKeySession *v23;
  void *v24;
  int v25;
  void *v26;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyRegistrationSessionsByDeviceID](self, "keyRegistrationSessionsByDeviceID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v11));

    if (v15)
    {
      v17 = auto_unlock_log(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyRegistrationSessionsByDeviceID](self, "keyRegistrationSessionsByDeviceID"));
        v25 = 138412290;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Registration key session in progress %@", (uint8_t *)&v25, 0xCu);

      }
    }
    else
    {
      v23 = -[SDAutoUnlockPairingSession initWithDevice:sessionID:]([SDAutoUnlockRegistrationKeySession alloc], "initWithDevice:sessionID:", v11, v10);
      -[SDAutoUnlockPairingSession setDelegate:](v23, "setDelegate:", self);
      -[SDAutoUnlockRegistrationKeySession setRequestData:](v23, "setRequestData:", v13);
      -[SDAutoUnlockRegistrationKeySession setLocallyGenerated:](v23, "setLocallyGenerated:", v6);
      -[SDAutoUnlockRegistrationKeySession start](v23, "start");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyRegistrationSessionsByDeviceID](self, "keyRegistrationSessionsByDeviceID"));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v11);

    }
  }
  else
  {
    v20 = auto_unlock_log(v12);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10009D180();

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    objc_msgSend(v22, "logDevices");

  }
}

- (void)createRegistrationLockSessionWithDeviceID:(id)a3 sessionID:(id)a4 requestData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  SDAutoUnlockRegistrationLockSession *v22;
  void *v23;
  int v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID](self, "lockRegistrationSessionsByDeviceID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));

    if (v13)
    {
      v15 = auto_unlock_log(v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID](self, "lockRegistrationSessionsByDeviceID"));
        v24 = 138412290;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Registration lock session in progress %@", (uint8_t *)&v24, 0xCu);

      }
    }
    else
    {
      if (v9)
        v21 = v9;
      else
        v21 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v16 = v21;
      v22 = -[SDAutoUnlockRegistrationLockSession initWithDevice:sessionID:]([SDAutoUnlockRegistrationLockSession alloc], "initWithDevice:sessionID:", v8, v21);
      -[SDAutoUnlockPairingSession setDelegate:](v22, "setDelegate:", self);
      -[SDAutoUnlockRegistrationLockSession setRequestData:](v22, "setRequestData:", v11);
      -[SDAutoUnlockRegistrationLockSession start](v22, "start");
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID](self, "lockRegistrationSessionsByDeviceID"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v8);

    }
  }
  else
  {
    v18 = auto_unlock_log(v10);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10009D1AC();

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    objc_msgSend(v20, "logDevices");

  }
}

- (void)armDevicesWaitingForUnlock
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  id v6;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v5 = objc_msgSend(v4, "deviceKeyBagUnlocked");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
    objc_msgSend(v6, "handleDeviceUnlocked");

  }
}

- (void)initializeRemotePeer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  SDAutoUnlockPeer *v13;
  int v14;
  void *v15;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeDevice"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIDOverride"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager keyManager](self, "keyManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteLTKForDeviceID:", v6));

    v10 = auto_unlock_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Initialized remote peer to %@", (uint8_t *)&v14, 0xCu);
      }

      v13 = -[SDAutoUnlockPeer initWithDeviceID:]([SDAutoUnlockPeer alloc], "initWithDeviceID:", v6);
      -[SDAutoUnlockSessionManager setRemotePeer:](self, "setRemotePeer:", v13);

    }
    else
    {
      if (v12)
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find remote LTK for active device: %@", (uint8_t *)&v14, 0xCu);
      }

      -[SDAutoUnlockSessionManager setRemotePeer:](self, "setRemotePeer:", 0);
    }
  }

}

- (void)registerRemotePeerIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeDevice"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIDOverride"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
    -[SDAutoUnlockSessionManager initializeRemotePeer](self, "initializeRemotePeer");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
  v11 = objc_msgSend(v10, "shouldRegister");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
    objc_msgSend(v12, "handleRegistrationBegan");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceID"));
    -[SDAutoUnlockSessionManager createRegistrationLockSessionWithDeviceID:sessionID:requestData:](self, "createRegistrationLockSessionWithDeviceID:sessionID:requestData:", v14, 0, 0);
LABEL_10:

    goto LABEL_11;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deviceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "remoteLTKForDeviceID:", v17));

  v18 = sub_10001D8AC(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
  LODWORD(v17) = objc_msgSend(v19, "canPerformUnlocks");

  if ((_DWORD)v17 && v18 != 3)
  {
    v21 = auto_unlock_log(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
      v24 = sub_10001DD10(v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v28 = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Mismatch between peer state (%@) and AKS state (%@)", (uint8_t *)&v28, 0x16u);

    }
    sub_10001DB10(v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
    objc_msgSend(v26, "handleRegistrationBegan");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceID"));
    -[SDAutoUnlockSessionManager createRegistrationLockSessionWithDeviceID:sessionID:requestData:](self, "createRegistrationLockSessionWithDeviceID:sessionID:requestData:", v27, 0, 0);

    goto LABEL_10;
  }
LABEL_11:

}

- (void)cancelParallelRegistrationSessionsForDeviceID:(id)a3 newSessionID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID](self, "lockRegistrationSessionsByDeviceID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sessionID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v15 = objc_msgSend(v13, "compare:", v14);

    if (v15 == (id)1)
    {
      v17 = auto_unlock_log(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412290;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Invalidating existing registration session: %@", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(v11, "invalidate");
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v6);
    }
  }

}

- (void)session:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SDAutoUnlockSessionManager *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100094710;
  block[3] = &unk_100715138;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)handleLockSessionCompleted:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSErrorUserInfoKey v64;
  const __CFString *v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  void *v72;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autoUnlockDevice"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager canceledAuthLockSessions](self, "canceledAuthLockSessions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
  v12 = objc_msgSend(v10, "containsObject:", v11);

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager canceledAuthLockSessions](self, "canceledAuthLockSessions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
    objc_msgSend(v13, "removeObject:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
    objc_msgSend(v15, "setLastSuccessfulDevice:", 0);

    if (v7)
    {
      -[SDAutoUnlockSessionManager performRegistrationIfNecessaryForLockSession:error:](self, "performRegistrationIfNecessaryForLockSession:error:", v6, v7);
    }
    else
    {
      v24 = auto_unlock_log(v16);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Canceled at end", buf, 2u);
      }

      objc_msgSend(v6, "handleCanceledAfterSuccess");
    }
    if (objc_msgSend(v6, "otherSessionCancel"))
    {
      v26 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceID"));
      -[NSObject removeObject:](v26, "removeObject:", v27);

LABEL_31:
    }
  }
  else if (v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    v18 = objc_msgSend(v17, "count");

    if ((unint64_t)v18 <= 1)
    {
      objc_msgSend(v6, "logResults");
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autoUnlockDevice"));
      v72 = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wifiRangingResults"));
      -[SDAutoUnlockSessionManager createRadarForError:devices:rangingResults:](self, "createRadarForError:devices:rangingResults:", v7, v32, v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attemptResults"));
      v35 = objc_msgSend(v34, "mutableCopy");
      -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v35);

      -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:](self, "notifyObserversOfUnlockFailureWithResults:error:", v34, v7);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceID"));
      objc_msgSend(v36, "removeObject:", v37);

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
      objc_msgSend(v38, "setLastSuccessfulDevice:", 0);

      if (objc_msgSend(v7, "code") == (id)145)
        -[SDAutoUnlockSessionManager decrementAttemptCount](self, "decrementAttemptCount");
      else
        -[SDAutoUnlockSessionManager performRegistrationIfNecessaryForLockSession:error:](self, "performRegistrationIfNecessaryForLockSession:error:", v6, v7);
      -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");

    }
    else
    {
      v20 = auto_unlock_log(v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
        *(_DWORD *)buf = 138412802;
        v67 = v22;
        v68 = 2112;
        v69 = v7;
        v70 = 2112;
        v71 = v23;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Session failed (id: %@, error: %@, outstanding sessions: %@)", buf, 0x20u);

      }
      -[SDAutoUnlockSessionManager setAuthSessionError:](self, "setAuthSessionError:", v7);
    }
    if (objc_msgSend(v7, "code") == (id)101)
      -[SDAutoUnlockSessionManager registerRemotePeerIfNecessary](self, "registerRemotePeerIfNecessary");
  }
  else
  {
    if ((id)-[SDAutoUnlockSessionManager attemptType](self, "attemptType") == (id)1)
    {
      v26 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v28 = -[NSObject BOOLForKey:](v26, "BOOLForKey:", CFSTR("phoneAutoUnlockSkipPrewarmOnNextUnlock"));
      if ((_DWORD)v28)
      {
        v29 = auto_unlock_log(v28);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Skipped donating positive mask signal due to default phoneAutoUnlockSkipPrewarmOnNextUnlock", buf, 2u);
        }
      }
      else
      {
        v30 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
        -[NSObject deviceUnlockedWithMask:](v30, "deviceUnlockedWithMask:", 1);
      }

      objc_msgSend(v6, "logResults");
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attemptResults"));
      objc_msgSend(v9, "setResults:", v46);

      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
      v48 = objc_msgSend(v47, "mutableCopy");
      -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v48);

      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceID"));
      objc_msgSend(v49, "addObject:", v50);

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager suggestionManager](self, "suggestionManager"));
      objc_msgSend(v51, "setLastSuccessfulDevice:", v9);

      -[SDAutoUnlockSessionManager notifyObserversOfUnlockCompletionWithDevice:](self, "notifyObserversOfUnlockCompletionWithDevice:", v9);
      -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
      goto LABEL_31;
    }
    v39 = -[SDAutoUnlockSessionManager attemptType](self, "attemptType");
    if (v39 != 2)
    {
      v52 = auto_unlock_log(v39);
      v26 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10009D278(self);
      goto LABEL_31;
    }
    objc_msgSend(v6, "logResults");
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attemptResults"));
    objc_msgSend(v9, "setResults:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
    v42 = objc_msgSend(v41, "mutableCopy");
    -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hintToken"));
    objc_msgSend(v9, "setHintToken:", v43);

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hintToken"));
    if (v44)
    {
      -[SDAutoUnlockSessionManager notifyObserversOfUnlockCompletionWithDevice:](self, "notifyObserversOfUnlockCompletionWithDevice:", v9);
    }
    else
    {
      v56 = auto_unlock_log(v45);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        sub_10009D204(self);

      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
      v59 = SFAutoUnlockErrorDomain;
      v64 = NSLocalizedDescriptionKey;
      v65 = CFSTR("Missing authorization token");
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v59, 185, v60));
      -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:](self, "notifyObserversOfUnlockFailureWithResults:error:", v58, v61);

    }
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager locksWithAKSTokens](self, "locksWithAKSTokens"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceID"));
    objc_msgSend(v62, "removeObject:", v63);

    -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
  }
  objc_msgSend(v6, "invalidate");
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "identifier"));
  objc_msgSend(v53, "removeObjectForKey:", v55);

  -[SDAutoUnlockSessionManager setScanErrorString:](self, "setScanErrorString:", 0);
}

- (void)handleProxySessionCompleted:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v15, "connectionTime");
  -[SDAutoUnlockSessionManager setProxyConnectionTime:](self, "setProxyConnectionTime:");
  if (!v6)
  {
    -[SDAutoUnlockSessionManager setLastProxyState:](self, "setLastProxyState:", objc_msgSend(v15, "state"));
    goto LABEL_8;
  }
  -[SDAutoUnlockSessionManager setProxyErrorCode:](self, "setProxyErrorCode:", objc_msgSend(v6, "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
  -[SDAutoUnlockSessionManager setScanErrorString:](self, "setScanErrorString:", v7);

  -[SDAutoUnlockSessionManager setProxyNotAvailableForUnlock:](self, "setProxyNotAvailableForUnlock:", objc_msgSend(v6, "code") == (id)144);
  if (objc_msgSend(v6, "code") == (id)135)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
LABEL_6:

      goto LABEL_8;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
    v10 = objc_msgSend(v9, "count");

    if (v10 == (id)1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager baseResultsDictionaryForError:](self, "baseResultsDictionaryForError:", v6));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "results"));
      objc_msgSend(v8, "addEntriesFromDictionary:", v11);

      -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v8);
      -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:](self, "notifyObserversOfUnlockFailureWithResults:error:", v8, v6);
      -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
      goto LABEL_6;
    }
  }
LABEL_8:
  objc_msgSend(v15, "invalidate");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bleDevice"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  objc_msgSend(v12, "removeObjectForKey:", v14);

}

- (void)sessionDidStartConnection:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = objc_opt_class(SDAutoUnlockLockSession, v4);
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
  {
    -[SDAutoUnlockSessionManager handleLockConnectionStartedForSession:](self, "handleLockConnectionStartedForSession:", v8);
  }
  else
  {
    v7 = objc_opt_class(SDAutoUnlockProxySession, v6);
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0)
      -[SDAutoUnlockSessionManager handleProxyConnectionStartedForSession:](self, "handleProxyConnectionStartedForSession:", v8);
  }

}

- (void)handleLockConnectionStartedForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned int v7;
  int64_t v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  int64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  void *v46;
  void *v47;
  unsigned __int8 v48;
  void *v49;
  __CFString *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[7];
  _QWORD v56[7];
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[4];
  const __CFString *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  v6 = objc_msgSend(v5, "faceIDEnabled");

  v7 = -[SDAutoUnlockSessionManager cachedDeviceWiFiState](self, "cachedDeviceWiFiState");
  v8 = -[SDAutoUnlockSessionManager attemptType](self, "attemptType");
  if (v8 == 2)
    v9 = 1;
  else
    v9 = v7;
  v10 = auto_unlock_log(v8);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("NO");
    if (v7)
      v12 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v60 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Wi-Fi powered on: %@", buf, 0xCu);
  }

  v13 = -[SDAutoUnlockSessionManager invalidateScanner](self, "invalidateScanner");
  if (v9)
  {
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autoUnlockDevice"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));

    if (v15)
    {
      v17 = auto_unlock_log(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));
        *(_DWORD *)buf = 138412546;
        v60 = v14;
        v61 = 2112;
        v62 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Already connected (new device: %@, attempt device: %@)", buf, 0x16u);

      }
    }
    else
    {
      -[SDAutoUnlockSessionManager setAttemptDevice:](self, "setAttemptDevice:", v14);
      objc_msgSend(v4, "setChosenDevice:", 1);
      v35 = (id)-[SDAutoUnlockSessionManager notifiedForProxy](self, "notifiedForProxy");
      if ((v35 & 1) == 0)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));
        -[SDAutoUnlockSessionManager notifyObserverOfAttemptBeganWithDevice:](self, "notifyObserverOfAttemptBeganWithDevice:", v36);

        v35 = -[SDAutoUnlockSessionManager incrementAttemptCount](self, "incrementAttemptCount");
      }
      v37 = auto_unlock_log(v35);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Posting state changed: Scan stopped - session in progress", buf, 2u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, SFAutoUnlockStateChangedNotification, 0, 0, 1u);
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allValues"));

      v41 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      if (v41)
      {
        v42 = v41;
        v50 = v14;
        v43 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(_QWORD *)v52 != v43)
              objc_enumerationMutation(v18);
            v45 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sessionID"));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionID"));
            v48 = objc_msgSend(v46, "isEqual:", v47);

            if ((v48 & 1) == 0)
            {
              v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager canceledAuthLockSessions](self, "canceledAuthLockSessions"));
              objc_msgSend(v49, "addObject:", v46);

              objc_msgSend(v45, "setOtherSessionCancel:", 1);
              objc_msgSend(v45, "cancel");
            }

          }
          v42 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
        }
        while (v42);
        v14 = v50;
      }
    }
  }
  else
  {
    v20 = auto_unlock_log(v13);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "### Discovered peer but Wi-Fi is off", buf, 2u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v23 = objc_msgSend(v22, "bluetoothEnabled");

    v24 = -[SDAutoUnlockSessionManager errorCodeForBluetoothEnabled:wifiEnabled:faceIDEnabled:](self, "errorCodeForBluetoothEnabled:wifiEnabled:faceIDEnabled:", v23, 0, v6);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager errorStringForBluetoothEnabled:wifiEnabled:faceIDEnabled:](self, "errorStringForBluetoothEnabled:wifiEnabled:faceIDEnabled:", v23, 0, v6));
    v25 = -[SDAutoUnlockSessionManager shouldShowErrorForWiFiEnabled:](self, "shouldShowErrorForWiFiEnabled:", 0);
    v26 = SFAutoUnlockErrorDomain;
    v57[0] = NSLocalizedDescriptionKey;
    v57[1] = CFSTR("SDAutoUnlockShowScreenLockError");
    v58[0] = v14;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v25));
    v58[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 2));
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v26, v24, v28));

    v55[0] = SDAutoUnlockManagerMetricSuccessKey;
    v55[1] = SDAutoUnlockManagerMetricErrorDomainKey;
    v56[0] = &off_10074B4D8;
    v56[1] = v26;
    v55[2] = SDAutoUnlockManagerMetricErrorCodeKey;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v24));
    v56[2] = v29;
    v56[3] = v14;
    v55[3] = SDAutoUnlockManagerMetricErrorStringKey;
    v55[4] = SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices")));
    v56[4] = v30;
    v55[5] = SDAutoUnlockManagerMetricTimeSinceLastWakeKey;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
    v56[5] = v31;
    v55[6] = SDAutoUnlockManagerMetricLastSleepTypeKey;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType")));
    v56[6] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 7));

    v34 = objc_msgSend(v33, "mutableCopy");
    -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v34);

    -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:](self, "notifyObserversOfUnlockFailureWithResults:error:", v33, v18);
    -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");

  }
}

- (void)handleProxyConnectionStartedForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  if (!-[SDAutoUnlockSessionManager notifiedForProxy](self, "notifiedForProxy"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager attemptDevice](self, "attemptDevice"));

    if (!v5)
    {
      v6 = objc_alloc_init((Class)SFAutoUnlockDevice);
      objc_msgSend(v6, "setName:", CFSTR("Proxied Apple Watch"));
      objc_msgSend(v6, "setModelName:", CFSTR("Apple Watch"));
      -[SDAutoUnlockSessionManager notifyObserverOfAttemptBeganWithDevice:](self, "notifyObserverOfAttemptBeganWithDevice:", v6);
      -[SDAutoUnlockSessionManager setNotifiedForProxy:](self, "setNotifiedForProxy:", 1);
      -[SDAutoUnlockSessionManager incrementAttemptCount](self, "incrementAttemptCount");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
        objc_msgSend(v8, "setTimeout:", 0.0);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
        objc_msgSend(v9, "setTimeoutHandler:", 0);

        -[SDAutoUnlockSessionManager restartScanTimer:](self, "restartScanTimer:", sub_10019AAC0(12.0));
      }
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions", 0));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15);
            objc_msgSend(v4, "connectionTime");
            objc_msgSend(v16, "setProxyConnectionTime:");
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
            objc_msgSend(v16, "setProxyDeviceModel:", v17);

            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v13);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
      -[SDAutoUnlockSessionManager setProxyDeviceModel:](self, "setProxyDeviceModel:", v18);

      -[SDAutoUnlockSessionManager setProxyRSSI:](self, "setProxyRSSI:", objc_msgSend(v4, "proxyRSSI"));
      objc_msgSend(v4, "proxyDiscoveryTime");
      -[SDAutoUnlockSessionManager setProxyDiscoverTime:](self, "setProxyDiscoverTime:");

    }
  }

}

- (void)sessionDidReceiveKeyDeviceLocked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceID"));

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "autoUnlockDeviceForDeviceID:", v6));
  -[SDAutoUnlockSessionManager notifyObserverOfKeyDeviceLockWithDevice:](self, "notifyObserverOfKeyDeviceLockWithDevice:", v7);

}

- (BOOL)isDisplayOff
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v3 = objc_msgSend(v2, "screenOn") ^ 1;

  return v3;
}

- (void)performRegistrationIfNecessaryForLockSession:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = objc_msgSend(v7, "code");
  if (v9 == (id)136)
  {
    v10 = -[SDAutoUnlockSessionManager suppressAlert](self, "suppressAlert");
    if (v10)
    {
LABEL_11:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
      objc_msgSend(v16, "handleConfirmationFailed");

      -[SDAutoUnlockSessionManager registerRemotePeerIfNecessary](self, "registerRemotePeerIfNecessary");
      goto LABEL_12;
    }
    v11 = auto_unlock_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Locking device on confirmation failed error", buf, 2u);
    }

    v13 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
    -[NSObject lockDevice](v13, "lockDevice");
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v6, "aksSuccess"))
  {
    v14 = objc_msgSend(v6, "unlockSucceeded");
    if ((v14 & 1) == 0)
    {
      v15 = auto_unlock_log(v14);
      v13 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AKS unlocked but unlock did not succeed", v17, 2u);
      }
      goto LABEL_10;
    }
  }
LABEL_12:

}

- (void)transportDidChangeDevices:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000965C8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)transportDidChangeNearbyState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000966CC;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)transport:(id)a3 didReceivePairingRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100096828;
  v16[3] = &unk_100714990;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (void)transport:(id)a3 didReceiveRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009691C;
  v16[3] = &unk_100714990;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(v12, v16);

}

- (void)transport:(id)a3 didReceiveKeyOriginatingRegistrationRequestWithSessionID:(id)a4 deviceID:(id)a5 requestData:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100096A34;
  v16[3] = &unk_100714990;
  v16[4] = self;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(v12, v16);

}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6
{
  int v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  SDAutoUnlockSessionWrapper *v17;
  _BOOL8 v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  SDAutoUnlockSessionWrapper *v30;
  _QWORD block[5];
  id v32;
  uint8_t buf[16];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (v7 == 2001)
  {
    v17 = -[SDAutoUnlockSessionWrapper initWithData:]([SDAutoUnlockSessionWrapper alloc], "initWithData:", v11);
    v18 = -[SDAutoUnlockSessionWrapper hasSessionID](v17, "hasSessionID");
    if (v18
      && (v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper sessionID](v17, "sessionID")),
          v20 = objc_msgSend(v19, "length"),
          v19,
          v20 == (id)16))
    {
      v21 = objc_alloc((Class)NSUUID);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper sessionID](v17, "sessionID")));
      v23 = objc_msgSend(v21, "initWithUUIDBytes:", objc_msgSend(v22, "bytes"));

      v24 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100096D90;
      v27[3] = &unk_100714990;
      v27[4] = self;
      v28 = v23;
      v29 = v13;
      v30 = v17;
      v25 = v23;
      dispatch_async(v24, v27);

    }
    else
    {
      v26 = auto_unlock_log(v18);
      v25 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10009D2EC(v17, (uint64_t)v11, v25);
    }

  }
  else if (v7 == 110)
  {
    v14 = auto_unlock_log(v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received relock request", buf, 2u);
    }

    v16 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100096CE4;
    block[3] = &unk_100714860;
    block[4] = self;
    v32 = v13;
    dispatch_async(v16, block);

  }
}

- (void)startScannerWithWatchBluetoothIDs:(id)a3 phoneBluetoothIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SFDeviceDiscovery *v10;
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
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  uint8_t buf[4];
  double v42;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    objc_msgSend(v9, "invalidate");

  }
  v10 = objc_opt_new(SFDeviceDiscovery);
  -[SDAutoUnlockSessionManager setScanner:](self, "setScanner:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  objc_msgSend(v11, "setDiscoveryFlags:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  objc_msgSend(v12, "setDispatchQueue:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  objc_msgSend(v14, "setScanRate:", 50);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000972A8;
  v38[3] = &unk_1007161C8;
  objc_copyWeak(&v39, &location);
  objc_msgSend(v15, "setDeviceFoundHandler:", v38);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  objc_msgSend(v16, "setChangeFlags:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100097318;
  v36[3] = &unk_1007161F0;
  objc_copyWeak(&v37, &location);
  objc_msgSend(v17, "setDeviceChangedHandler:", v36);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  objc_msgSend(v18, "setInvalidationHandler:", &stru_100716210);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "setByAddingObjectsFromSet:", v7));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  objc_msgSend(v20, "setDeviceFilter:", v19);

  v22 = auto_unlock_log(v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = *(double *)&v19;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Scanning for bluetooth IDs %@", buf, 0xCu);
  }

  -[SDAutoUnlockSessionManager setScanWatchIDs:](self, "setScanWatchIDs:", v6);
  -[SDAutoUnlockSessionManager setScanPhoneIDs:](self, "setScanPhoneIDs:", v7);
  v24 = (void *)sub_1000CE9F0(CFSTR("AUBLEScanTimeout"));
  v25 = v24;
  if (v24)
    v26 = (double)(uint64_t)objc_msgSend(v24, "integerValue");
  else
    v26 = 4.0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  objc_msgSend(v27, "setTimeout:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000973EC;
  v34[3] = &unk_1007145D0;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v28, "setTimeoutHandler:", v34);

  v30 = auto_unlock_log(v29);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v42 = v26;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Using BLE scan timeout %.2f seconds", buf, 0xCu);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000974B8;
  v33[3] = &unk_1007147C8;
  v33[4] = self;
  objc_msgSend(v32, "activateWithCompletion:", v33);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

- (void)invalidateScanner
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));

  if (v3)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating scanner", v11, 2u);
    }

    -[SDAutoUnlockSessionManager setExtendedTimer:](self, "setExtendedTimer:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    objc_msgSend(v7, "setTimeout:", 0.0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    objc_msgSend(v8, "setTimeoutHandler:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    objc_msgSend(v9, "setInvalidationHandler:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanner](self, "scanner"));
    objc_msgSend(v10, "invalidate");

    -[SDAutoUnlockSessionManager setScanner:](self, "setScanner:", 0);
    -[SDAutoUnlockSessionManager invalidateScanTimer](self, "invalidateScanTimer");
  }
}

- (void)handleFoundPeer:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found BLE peer: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanWatchIDs](self, "scanWatchIDs"));
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockAuthSessions](self, "lockAuthSessions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues"));

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bleDevice"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
          v19 = objc_msgSend(v18, "isEqual:", v7);

          if (v19)
            objc_msgSend(v16, "handleFoundBLEDevice:", v4);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v13);
    }
LABEL_24:

    goto LABEL_25;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanPhoneIDs](self, "scanPhoneIDs"));
  v21 = objc_msgSend(v20, "containsObject:", v7);

  if (v21)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxySessions](self, "proxySessions", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allValues"));

    v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v11);
          v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bleDevice"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifier"));
          v30 = objc_msgSend(v29, "isEqual:", v7);

          if (v30)
            objc_msgSend(v27, "handleFoundBLEDevice:", v4);
        }
        v24 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v24);
    }
    goto LABEL_24;
  }
LABEL_25:

}

- (void)restartScanTimer:(unint64_t)a3
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting scan timer", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100097B6C;
    v13[3] = &unk_1007146D8;
    v13[4] = self;
    v9 = sub_10019AAD8(0, v8, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockSessionManager setScanTimer:](self, "setScanTimer:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
    dispatch_resume(v11);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
  sub_10019AB78(v12, a3);

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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating scan timer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanTimer](self, "scanTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockSessionManager setScanTimer:](self, "setScanTimer:", 0);
  }
}

- (void)handleBLEScanTimerFired
{
  -[SDAutoUnlockSessionManager updateStringForProxySession](self, "updateStringForProxySession");
  -[SDAutoUnlockSessionManager cancelAllLockSessionsForScanTimeout](self, "cancelAllLockSessionsForScanTimeout");
  -[SDAutoUnlockSessionManager handleScanTimerFired](self, "handleScanTimerFired");
  -[SDAutoUnlockSessionManager invalidateAttempt](self, "invalidateAttempt");
  -[SDAutoUnlockSessionManager setScanErrorString:](self, "setScanErrorString:", 0);
}

- (void)handleScanTimerFired
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  NSMutableDictionary *v8;
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
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSErrorUserInfoKey v27;
  __CFString *v28;

  v3 = SFAutoUnlockErrorDomain;
  v4 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanErrorString](self, "scanErrorString"));
  v5 = (void *)v4;
  v6 = CFSTR("Apple Watch Not Found");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v3, SDAutoUnlockManagerMetricErrorDomainKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_10074B4D8, SDAutoUnlockManagerMetricSuccessKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v9, SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v10, SDAutoUnlockManagerMetricTimeSinceLastWakeKey);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v11, SDAutoUnlockManagerMetricLastSleepTypeKey);

  if (-[SDAutoUnlockSessionManager notifiedForProxy](self, "notifiedForProxy"))
  {
    v12 = -[SDAutoUnlockSessionManager proxyErrorCode](self, "proxyErrorCode");
    if (v12)
      v13 = v12;
    else
      v13 = 143;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SDAutoUnlockManagerMetricUsingProxyDeviceKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager proxyDeviceModel](self, "proxyDeviceModel"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, SDAutoUnlockManagerMetricProxyDeviceModelKey);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[SDAutoUnlockSessionManager proxyRSSI](self, "proxyRSSI")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v15, SDAutoUnlockManagerMetricProxyDeviceRSSIKey);

    -[SDAutoUnlockSessionManager proxyDiscoverTime](self, "proxyDiscoverTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v16, SDAutoUnlockManagerMetricBluetoothProxyDeviceDiscoveryKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_10074B520, SDAutoUnlockManagerMetricErrorTypeKey);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager authSessionError](self, "authSessionError"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager authSessionError](self, "authSessionError"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSLocalizedDescriptionKey));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager authSessionError](self, "authSessionError"));
      v13 = (uint64_t)objc_msgSend(v21, "code");

      v7 = (__CFString *)v20;
    }
    else if (-[SDAutoUnlockSessionManager proxyNotAvailableForUnlock](self, "proxyNotAvailableForUnlock"))
    {

      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_10074B538, SDAutoUnlockManagerMetricErrorTypeKey);
      v7 = CFSTR("Watch Not On Wrist");
      v13 = 144;
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_10074B550, SDAutoUnlockManagerMetricErrorTypeKey);
      v13 = 131;
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, SDAutoUnlockManagerMetricErrorStringKey);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v13));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v22, SDAutoUnlockManagerMetricErrorCodeKey);

  v27 = NSLocalizedDescriptionKey;
  v28 = v7;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v3, v13, v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager scanAutoUnlockDevices](self, "scanAutoUnlockDevices"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));
  -[SDAutoUnlockSessionManager createRadarForError:devices:rangingResults:](self, "createRadarForError:devices:rangingResults:", v24, v26, 0);

  -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", v8);
  -[SDAutoUnlockSessionManager notifyObserversOfUnlockFailureWithResults:error:](self, "notifyObserversOfUnlockFailureWithResults:error:", v8, v24);

}

- (BOOL)unlockEnabledForPeer:(id)a3
{
  return CFDictionaryGetInt64(objc_msgSend(a3, "advertisementFields"), CFSTR("ue"), 0) != 0;
}

- (BOOL)proxyAdvertisementForPeer:(id)a3
{
  return CFDictionaryGetInt64(objc_msgSend(a3, "advertisementFields"), CFSTR("uw"), 0) != 0;
}

- (BOOL)watchLockedOnWristForPeer:(id)a3
{
  return CFDictionaryGetInt64(objc_msgSend(a3, "advertisementFields"), CFSTR("wl"), 0) != 0;
}

- (BOOL)advertisingEnabled
{
  return 0;
}

- (BOOL)watchLockedAndOnWrist
{
  return 0;
}

- (int64_t)idsMacCount
{
  void *v3;
  void *v4;

  if (-[SDAutoUnlockSessionManager idsMacCountCache](self, "idsMacCountCache") < 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsMacDeviceIDs"));
    -[SDAutoUnlockSessionManager setIdsMacCountCache:](self, "setIdsMacCountCache:", objc_msgSend(v4, "count"));

  }
  return -[SDAutoUnlockSessionManager idsMacCountCache](self, "idsMacCountCache");
}

- (void)addServiceClientForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager serviceClients](self, "serviceClients"));
  objc_msgSend(v5, "addObject:", v4);

  -[SDAutoUnlockSessionManager updateAdvertising](self, "updateAdvertising");
}

- (void)removeServiceClientForIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager serviceClients](self, "serviceClients"));
  objc_msgSend(v5, "removeObject:", v4);

  -[SDAutoUnlockSessionManager updateAdvertising](self, "updateAdvertising");
}

- (void)handleBLEDataReceivedNotification:(id)a3
{
  id v4;
  void *v5;
  SDAutoUnlockSessionWrapper *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  SDAutoUnlockSessionWrapper *v12;
  uint64_t v13;
  NSObject *v14;
  SDAutoUnlockSessionWrapper *v15;
  SDAutoUnlockSessionWrapper *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  SDAutoUnlockSessionWrapper *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  SDAutoUnlockSessionWrapper *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[5];
  SDAutoUnlockSessionWrapper *v45;
  SDAutoUnlockSessionWrapper *v46;
  uint8_t buf[4];
  SDAutoUnlockSessionWrapper *v48;
  __int16 v49;
  SDAutoUnlockSessionWrapper *v50;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (SDAutoUnlockSessionWrapper *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SDNearbyAgentNotificationInfoKeyBLEDevice")));

  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v6;
    v49 = 1024;
    LODWORD(v50) = -[SDAutoUnlockSessionWrapper useBTPipe](v6, "useBTPipe");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received message from bleDevice %@, useBTPipe %d", buf, 0x12u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SDNearbyAgentNotificationInfoKeyBLEData")));

  v12 = -[SDAutoUnlockSessionWrapper initWithData:]([SDAutoUnlockSessionWrapper alloc], "initWithData:", v11);
  v13 = auto_unlock_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received wrapper %@", buf, 0xCu);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10009876C;
  v44[3] = &unk_100716238;
  v44[4] = self;
  v15 = v6;
  v45 = v15;
  v16 = v12;
  v46 = v16;
  v17 = objc_retainBlock(v44);
  if (-[SDAutoUnlockSessionWrapper hasEncryptedPayload](v16, "hasEncryptedPayload"))
  {
    v43 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper encryptedPayload](v16, "encryptedPayload"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper authTag](v16, "authTag"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper nonce](v16, "nonce"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper identifier](v15, "identifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "decryptMessage:authTag:nonce:bluetoothID:cachedDevices:errorCode:", v19, v20, v21, v22, 1, &v43));

    if (v23)
    {
      v25 = -[SDAutoUnlockSessionWrapper initWithData:]([SDAutoUnlockSessionWrapper alloc], "initWithData:", v23);
      ((void (*)(_QWORD *, SDAutoUnlockSessionWrapper *, uint64_t))v17[2])(v17, v25, 1);
    }
    else
    {
      v26 = auto_unlock_log(v24);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_10009D4AC((uint64_t)&v43, v27, v28, v29, v30, v31, v32, v33);

      v25 = objc_opt_new(SDAutoUnlockDecryptionFailed);
      -[SDAutoUnlockSessionWrapper setVersion:](v25, "setVersion:", 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      if (objc_msgSend(v34, "deviceWasUnlockedOnce"))
        v35 = v43;
      else
        v35 = 195;
      -[SDAutoUnlockSessionWrapper setErrorCode:](v25, "setErrorCode:", v35);

      v36 = objc_opt_new(SDAutoUnlockSessionWrapper);
      -[SDAutoUnlockSessionWrapper setVersion:](v36, "setVersion:", 1);
      -[SDAutoUnlockSessionWrapper setMessageType:](v36, "setMessageType:", 309);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v25, "data"));
      -[SDAutoUnlockSessionWrapper setPayload:](v36, "setPayload:", v37);

      v39 = auto_unlock_log(v38);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v48 = v25;
        v49 = 2112;
        v50 = v36;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Sending %@ Wrapper %@", buf, 0x16u);
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v36, "data"));
      objc_msgSend(v41, "sendUnlockData:toBLEDevice:completion:", v42, v15, &stru_100716258);

    }
  }
  else
  {
    ((void (*)(_QWORD *, SDAutoUnlockSessionWrapper *, _QWORD))v17[2])(v17, v16, 0);
  }

}

- (void)handleRelockMessage
{
  NSObject *v3;
  void *v4;
  id v5;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  objc_msgSend(v4, "lockWithBioLockOut");

  -[SDAutoUnlockSessionManager setLastLockedByRelock:](self, "setLastLockedByRelock:", 1);
  -[SDAutoUnlockSessionManager cancelAutoUnlock](self, "cancelAutoUnlock");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SDAutoUnlockManagerMetricManualRelockKey);

}

- (void)keyBagLockStateChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100098C18;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)onqueue_keyBagLockStateChange:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSDate *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue", a3));
  dispatch_assert_queue_V2(v4);

  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v9 = sub_1001958B4((unint64_t)objc_msgSend(v8, "deviceKeyBagState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v13 = 138412290;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Keybag state changed to %@", (uint8_t *)&v13, 0xCu);

  }
  v11 = objc_opt_new(NSDate);
  -[SDAutoUnlockSessionManager setLockStateChangedDate:](self, "setLockStateChangedDate:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  objc_msgSend(v12, "handleKeyBagLockStateChanged");

  -[SDAutoUnlockSessionManager handleLockStateChanged](self, "handleLockStateChanged");
}

- (void)clearPhoneAutoUnlockNotification:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a3;
  if (a3)
  {
    v4 = auto_unlock_log(self);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User declined to enable Phone Auto Unlock", v8, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v6, "setBool:forKey:", 1, CFSTR("AutoUnlockDeclinedToEnablePAU"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockNotificationsManager sharedManager](SDAutoUnlockNotificationsManager, "sharedManager"));
  objc_msgSend(v7, "clearPhoneAutoUnlockUpsellNotification:", v3);

}

- (BOOL)behaviorChangedAfterUpgrade
{
  NSObject *v2;
  void *v3;
  id v4;
  float v5;
  float v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  const __CFString *v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;

  v2 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "floatForKey:", CFSTR("AutoUnlockLastSeenVersion"));
  v6 = v5;
  v7 = SFDeviceProductVersion(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v8, "floatValue");
  v10 = v9;

  v12 = auto_unlock_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    v16 = 138413058;
    if (v6 < 15.0)
      v14 = CFSTR("YES");
    v17 = v14;
    v18 = 2048;
    v19 = v6;
    v20 = 2048;
    v21 = v10;
    v22 = 2048;
    v23 = 15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "behavior changed: %@, last seen version: %f, current version: %f, firstSupportedVersion: %ld", (uint8_t *)&v16, 0x2Au);
  }

  return v6 < 15.0;
}

- (void)upsellBehaviorChangedAfterUpgradeIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  _BOOL4 v13;
  unsigned __int8 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD block[4];
  unsigned __int8 v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enabledAutoUnlockDevicesUsingCache:", 1));
  v6 = objc_msgSend(v5, "count");

  v7 = -[SDAutoUnlockSessionManager behaviorChangedAfterUpgrade](self, "behaviorChangedAfterUpgrade");
  v8 = v7;
  v9 = auto_unlock_log(v7);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v6)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    if (v8)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v23 = v12;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AutoUnlock Enabled: %@, behavior changed after upgrade: %@", buf, 0x16u);
  }

  if (v6)
    v13 = v8;
  else
    v13 = 0;
  if (v13)
  {
    v14 = +[SFSiriController isSiriEnabled](SFSiriController, "isSiriEnabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v16 = SFDeviceProductVersion(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(v17, "floatValue");
    objc_msgSend(v15, "setFloat:forKey:", CFSTR("AutoUnlockLastSeenVersion"));

    v18 = dispatch_time(0, 3000000000);
    v19 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100099148;
    block[3] = &unk_100716278;
    v21 = v14;
    dispatch_after(v18, v19, block);

  }
}

- (id)getUpsellNotificationBodyTextForEvent:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  int v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;

  v4 = a3;
  v5 = +[SFSiriController isSiriEnabled](SFSiriController, "isSiriEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  v7 = objc_msgSend(v6, "supportsPeriocular");

  v9 = auto_unlock_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (v7)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    if (v5)
      v11 = CFSTR("YES");
    v23 = 138412546;
    v24 = v12;
    v25 = 2112;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Displaying upsell text. Supports periocular: %@. Siri enabled: %@", (uint8_t *)&v23, 0x16u);
  }

  if (_os_feature_enabled_impl("SpringBoard", "PAUOcclusion"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.faceid.any-face-covering.detected"));

    if (((v16 | v7) & 1) == 0)
    {
LABEL_10:
      v17 = CFSTR("UNLOCK_PHONE_UPSELL_BODY");
      v18 = CFSTR("UNLOCK_PHONE_UPSELL_BODY_SIRI_ENABLED");
      goto LABEL_13;
    }
  }
  else if (!v7)
  {
    goto LABEL_10;
  }
  v17 = CFSTR("UNLOCK_PHONE_UPSELL_BODY_GENERIC_SIRI_ENABLED");
  v18 = CFSTR("UNLOCK_PHONE_UPSELL_BODY_GENERIC");
LABEL_13:
  if (v5)
    v19 = v18;
  else
    v19 = v17;
  v20 = SFLocalizedStringForKey(v19, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  return v21;
}

- (void)upsellPhoneAutoUnlock
{
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int v7;
  id v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  const __CFString *v37;
  const __CFString *v38;
  uint64_t v39;
  NSObject *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const __CFString *v45;
  const __CFString *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  dispatch_time_t v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  _QWORD v62[5];
  id v63;
  uint8_t buf[4];
  double v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  const __CFString *v69;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
  if (objc_msgSend(v3, "faceIDEnabled") && SFDeviceSupportsAutoUnlock())
  {
    v4 = sub_1000C8E68();

    if ((v4 & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v7 = -[NSObject BOOLForKey:](v6, "BOOLForKey:", CFSTR("AutoUnlockDeclinedToEnablePAU"));
      v8 = -[NSObject BOOLForKey:](v6, "BOOLForKey:", CFSTR("AutoUnlockAlreadyEnabledBefore"));
      v9 = (int)v8;
      if ((v7 & 1) == 0 && !(_DWORD)v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pairedAutoUnlockDevice"));

        if (!v11
          || (v12 = -[NSObject unlockEnabled](v11, "unlockEnabled"), (v12 & 1) != 0)
          || (v12 = (id)-[SDAutoUnlockSessionManager phoneAutoUnlockSupportedByDevice:](self, "phoneAutoUnlockSupportedByDevice:", v11), (v12 & 1) == 0))
        {
          v39 = auto_unlock_log(v12);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = CFSTR("YES");
            if (!v11)
              v41 = CFSTR("NO");
            *(_DWORD *)buf = 138412290;
            v65 = *(double *)&v41;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Skipping upsell. Current Active Watch found:%@", buf, 0xCu);
          }

          if (v11)
          {
            v43 = auto_unlock_log(v42);
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              if (-[NSObject unlockEnabled](v11, "unlockEnabled"))
                v45 = CFSTR("YES");
              else
                v45 = CFSTR("NO");
              if (-[SDAutoUnlockSessionManager phoneAutoUnlockSupportedByDevice:](self, "phoneAutoUnlockSupportedByDevice:", v11))
              {
                v46 = CFSTR("YES");
              }
              else
              {
                v46 = CFSTR("NO");
              }
              *(_DWORD *)buf = 138412546;
              v65 = *(double *)&v45;
              v66 = 2112;
              v67 = v46;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Watch unlockEnabled:%@, Watch HW/SW compatible:%@", buf, 0x16u);
            }

            if (-[NSObject unlockEnabled](v11, "unlockEnabled"))
              -[NSObject setBool:forKey:](v6, "setBool:forKey:", 1, CFSTR("AutoUnlockAlreadyEnabledBefore"));
          }
          goto LABEL_29;
        }
        v13 = auto_unlock_log(v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uniqueID](v11, "uniqueID"));
          *(_DWORD *)buf = 138412290;
          v65 = *(double *)&v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current Active Watch ID %@", buf, 0xCu);

        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
        if (objc_msgSend(v16, "pairedWatchWristState") == (id)3)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v18 = objc_msgSend(v17, "pairedWatchLockState");

          if (!v18)
          {
            v20 = -[SDAutoUnlockSessionManager shouldNotify](self, "shouldNotify");
            if (v20)
            {
              v21 = sub_1000CA2E8(1);
              v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
              v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
              v24 = (void *)v23;
              if (v23)
              {
                v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "endDate"));
                objc_msgSend(v25, "timeIntervalSinceDate:", v26);
                v28 = v27;

              }
              else
              {
                v28 = 10.0;
              }
              v54 = auto_unlock_log(v23);
              v55 = objc_claimAutoreleasedReturnValue(v54);
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v65 = v28;
                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Last Mask Detection %f seconds ago", buf, 0xCu);
              }

              if (v28 >= 10.0)
              {
                v60 = auto_unlock_log(v56);
                v61 = objc_claimAutoreleasedReturnValue(v60);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Skipping upsell. Last Mask Detection too long ago", buf, 2u);
                }

              }
              else
              {
                -[NSObject setInteger:forKey:](v6, "setInteger:forKey:", (char *)-[NSObject integerForKey:](v6, "integerForKey:", CFSTR("AutoUnlockLastUpsellState")) + 1, CFSTR("AutoUnlockLastUpsellState"));
                v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
                -[NSObject setObject:forKey:](v6, "setObject:forKey:", v57, CFSTR("AutoUnlockLastUpsellDate"));

                v58 = dispatch_time(0, 3000000000);
                v59 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
                v62[0] = _NSConcreteStackBlock;
                v62[1] = 3221225472;
                v62[2] = sub_100099AB0;
                v62[3] = &unk_100714860;
                v62[4] = self;
                v63 = v24;
                dispatch_after(v58, v59, v62);

              }
              goto LABEL_29;
            }
            v53 = auto_unlock_log(v20);
            v48 = objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Skipping upsell. Should not notify based on previous notification and upsell state", buf, 2u);
            }
            goto LABEL_56;
          }
        }
        else
        {

        }
        v47 = auto_unlock_log(v19);
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v50 = objc_msgSend(v49, "pairedWatchWristState");
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
          v52 = objc_msgSend(v51, "pairedWatchLockState");
          *(_DWORD *)buf = 134218240;
          v65 = *(double *)&v50;
          v66 = 1024;
          LODWORD(v67) = v52;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Skipping upsell. Active watch not on wrist (state: %ld) and unlocked (state: %d). Skipping upsell.", buf, 0x12u);

        }
LABEL_56:

        goto LABEL_29;
      }
      v36 = auto_unlock_log(v8);
      v11 = objc_claimAutoreleasedReturnValue(v36);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_29:

        goto LABEL_30;
      }
      v37 = CFSTR("NO");
      if (v7)
        v38 = CFSTR("YES");
      else
        v38 = CFSTR("NO");
      if (v9)
        v37 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v65 = *(double *)&v38;
      v66 = 2112;
      v67 = v37;
      v33 = "Skipping upsell. User declined to enable PAU after reading the pop up: %@, PAU already enabled before: %@";
      v34 = v11;
      v35 = 22;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
      goto LABEL_29;
    }
  }
  else
  {

  }
  v29 = auto_unlock_log(v5);
  v6 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager localDeviceController](self, "localDeviceController"));
    if (-[NSObject faceIDEnabled](v11, "faceIDEnabled"))
      v30 = CFSTR("YES");
    else
      v30 = CFSTR("NO");
    if (SFDeviceSupportsAutoUnlock())
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    if (sub_1000C8E68())
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    v65 = *(double *)&v30;
    v66 = 2112;
    v67 = v31;
    v68 = 2112;
    v69 = v32;
    v33 = "Skipping upsell. FaceIDEnabled:%@, SFDeviceSupportsAutoUnlock:%@, SDAutoUnlockDisallowedDueToManagement:%@";
    v34 = v6;
    v35 = 32;
    goto LABEL_28;
  }
LABEL_30:

}

- (BOOL)shouldNotify
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("AutoUnlockLastUpsellDate")));
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components:fromDate:toDate:options:", 32, v4, v6, 0));
    v8 = (uint64_t)objc_msgSend(v7, "hour");

  }
  else
  {
    v8 = 0;
  }
  v9 = auto_unlock_log(v3);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v4;
    v21 = 2048;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Last notification date: %@, %ld hours ago", (uint8_t *)&v19, 0x16u);
  }

  v11 = v8 > 48;
  if (v4 && v8 < 49)
    goto LABEL_16;
  v12 = objc_msgSend(v2, "integerForKey:", CFSTR("AutoUnlockLastUpsellState"));
  v13 = auto_unlock_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134217984;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Number of notifications sent for this phone: %ld", (uint8_t *)&v19, 0xCu);
  }

  if (!v12)
  {
    v11 = 1;
    goto LABEL_17;
  }
  if (v12 == (id)2)
  {
    v11 = v8 > 168;
    goto LABEL_17;
  }
  if (v12 != (id)1)
  {
    v16 = auto_unlock_log(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No more upselling for this watch", (uint8_t *)&v19, 2u);
    }

LABEL_16:
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (void)handleUnexpectedDisablement:(id)a3
{
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", a3));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("AutoUnlockAlreadyEnabledBefore"));
  v5 = (int)v4;
  v6 = auto_unlock_log(v4);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting upsell notification defaults", buf, 2u);
    }

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("AutoUnlockLastUpsellState"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("AutoUnlockLastUpsellDate"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("AutoUnlockDeclinedToEnablePAU"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("AutoUnlockAlreadyEnabledBefore"));
  }
  else
  {
    if (v8)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Keeping upsell notification defaults", v9, 2u);
    }

  }
}

- (void)handleLockStateChanged
{
  NSObject *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  uint8_t v18[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v5 = objc_msgSend(v4, "deviceKeyBagUnlocked");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    objc_msgSend(v6, "updateApproveBluetoothIDs");

    -[SDAutoUnlockSessionManager armDevicesWaitingForUnlock](self, "armDevicesWaitingForUnlock");
    -[SDAutoUnlockSessionManager registerRemotePeerIfNecessary](self, "registerRemotePeerIfNecessary");
    if (!-[SDAutoUnlockSessionManager doNotPostUnlockConfirmation](self, "doNotPostUnlockConfirmation"))
      -[SDAutoUnlockSessionManager cancelAttemptsForDeviceUnlocked](self, "cancelAttemptsForDeviceUnlocked");
    if (!-[SDAutoUnlockSessionManager lastUnlockedByWatch](self, "lastUnlockedByWatch"))
    {
      -[SDAutoUnlockSessionManager setLastLockedByRelock:](self, "setLastLockedByRelock:", 0);
      -[SDAutoUnlockSessionManager upsellPhoneAutoUnlock](self, "upsellPhoneAutoUnlock");
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[SDAutoUnlockSessionManager setLastUnlockDate:](self, "setLastUnlockDate:", v7);

    v8 = -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount");
    if (v8 >= 1)
    {
      v9 = auto_unlock_log(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resetting attempt count", v18, 2u);
      }

      -[SDAutoUnlockSessionManager setAttemptCount:](self, "setAttemptCount:", 0);
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    -[SDAutoUnlockSessionManager setCachedDeviceWiFiState:](self, "setCachedDeviceWiFiState:", objc_msgSend(v11, "wirelessEnabled"));

    if (-[SDAutoUnlockSessionManager lastUnlockedByWatch](self, "lastUnlockedByWatch"))
      -[SDAutoUnlockSessionManager releaseLanguageAssertionForAutoRelock](self, "releaseLanguageAssertionForAutoRelock");
    if (-[SDAutoUnlockSessionManager periocularStatus](self, "periocularStatus"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager periocularStatus](self, "periocularStatus")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, SDAutoUnlockManagerMetricPeriocularStatus);

    }
    -[SDAutoUnlockSessionManager setPeriocularStatus:](self, "setPeriocularStatus:", 0);
    -[SDAutoUnlockSessionManager setLastUnlockedByWatch:](self, "setLastUnlockedByWatch:", 0);
    -[SDAutoUnlockSessionManager setSuppressAlert:](self, "setSuppressAlert:", 0);
    -[SDAutoUnlockSessionManager cancelMagnetLinkTimer](self, "cancelMagnetLinkTimer");
    v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
    if (v14)
    {
      v15 = (void *)v14;
      v16 = -[SDAutoUnlockSessionManager isBeingUsedForSiri](self, "isBeingUsedForSiri");

      if ((v16 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
        sub_1000C6224(v17);

        -[SDAutoUnlockSessionManager setCachedMetrics:](self, "setCachedMetrics:", 0);
      }
    }
  }
}

- (id)unlockedOnWristDate
{
  return 0;
}

- (void)pipeConnectionChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A134;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleDisplayStateChanged:(unint64_t)a3
{
  NSObject *v5;
  _BOOL8 v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v5);

  if (!a3)
  {
    v6 = -[SDAutoUnlockSessionManager attemptInProgress](self, "attemptInProgress");
    if (v6)
    {
      v7 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Canceling attempt in progress – device screen turned off", v9, 2u);
      }

      -[SDAutoUnlockSessionManager cancelAutoUnlock](self, "cancelAutoUnlock");
    }
  }
}

- (void)beginKeyRegistrationIfNecessary
{
  NSObject *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  uint8_t buf[4];
  void *v18;

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v16 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v16, "deviceKeyBagUnlocked"))
  {
    v4 = -[SDAutoUnlockSessionManager needsArming](self, "needsArming");

    if (v4)
    {
      v5 = auto_unlock_log(-[SDAutoUnlockSessionManager setNeedsArming:](self, "setNeedsArming:", 0));
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checking if key originated registration is needed", buf, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      objc_msgSend(v7, "updateLTKs");

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pairedDeviceID"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteLTKForDeviceID:", v9));

      v13 = auto_unlock_log(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning key originated registration", buf, 2u);
        }

        v14 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        -[SDAutoUnlockSessionManager createRegistrationKeySessionWithIdentifier:deviceID:requestData:locallyGenerated:](self, "createRegistrationKeySessionWithIdentifier:deviceID:requestData:locallyGenerated:", v14, v9, 0, 1);
      }
      else if (v15)
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not find remote LTK for %@", buf, 0xCu);
      }

    }
  }
  else
  {

  }
}

- (void)handleBioLockout
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  dispatch_assert_queue_V2(v3);

  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device entered bio lockout, resetting all key devices", buf, 2u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID](self, "lockRegistrationSessionsByDeviceID", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "invalidate");
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
  objc_msgSend(v13, "handleBioLockout");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID](self, "lockRegistrationSessionsByDeviceID"));
  objc_msgSend(v14, "removeAllObjects");

  -[SDAutoUnlockSessionManager cancelAutoUnlock](self, "cancelAutoUnlock");
  -[SDAutoUnlockSessionManager registerRemotePeerIfNecessary](self, "registerRemotePeerIfNecessary");
}

- (void)handlePairedDeviceLockStateChanged
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A660;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleAuthenticationSessionStarted
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A74C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)grabLanguageAssertionForAutoRelock
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v2 = auto_unlock_log(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = 70;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Delay releasing language assertion for Auto Relock for %ld seconds", (uint8_t *)&v8, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", 70.0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v6, "addPreventExitForLocaleReason:", CFSTR("AutoUnlockAutoRelockPreventExitReason"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v7, "pushDateForPreventExitForLocaleReason:expirationDate:", CFSTR("AutoUnlockAutoRelockPreventExitReason"), v5);

}

- (void)releaseLanguageAssertionForAutoRelock
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = auto_unlock_log(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Release language assertion for Auto Relock", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v4, "removePreventExitForLocaleReason:", CFSTR("AutoUnlockAutoRelockPreventExitReason"));

}

- (BOOL)deviceCurrentlyUnlockedByWatch
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v3, "deviceKeyBagUnlocked"))
    v4 = -[SDAutoUnlockSessionManager lastUnlockedByWatch](self, "lastUnlockedByWatch");
  else
    v4 = 0;

  return v4;
}

- (void)setUpMagnetLinkTimer
{
  NSObject *v3;
  dispatch_source_t v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD handler[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  -[SDAutoUnlockSessionManager setMagnetLinkTimer:](self, "setMagnetLinkTimer:", v4);

  v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10009ABB4;
  handler[3] = &unk_1007146D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);

  v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  v7 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

  v8 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  dispatch_source_set_cancel_handler(v8, &stru_100716298);

  v9 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  dispatch_activate(v9);

  v11 = auto_unlock_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Magnet Link Timer Activated", v13, 2u);
  }

}

- (void)btPipeConnectionChanged:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  _BOOL8 v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int v27;
  const __CFString *v28;
  const __CFString *v29;
  int v30;
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;

  v4 = (__CFString *)a3;
  if (!_os_feature_enabled_impl("Sharing", "pau_relock_auto"))
    goto LABEL_26;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString userInfo](v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", SFNotificationKeyConnectionState));
  v7 = objc_msgSend(v6, "integerValue");

  v9 = auto_unlock_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 138412290;
    v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "btPipeConnectionChanged Notification: %@", (uint8_t *)&v30, 0xCu);
  }

  if (v7 != (id)2)
  {
    if (v7 == (id)1)
      -[SDAutoUnlockSessionManager cancelMagnetLinkTimer](self, "cancelMagnetLinkTimer");
    goto LABEL_26;
  }
  v12 = auto_unlock_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[SDAutoUnlockSessionManager lastUnlockedByWatch](self, "lastUnlockedByWatch");
    v15 = CFSTR("NO");
    if (v14)
      v15 = CFSTR("YES");
    v30 = 138412290;
    v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device unlock by Phone Auto Unlock status: %@", (uint8_t *)&v30, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lastUnlockDate](self, "lastUnlockDate"));
  objc_msgSend(v16, "timeIntervalSinceDate:", v17);
  v19 = v18;

  if (v19 > 60.0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, SDAutoUnlockManagerMetricAutoRelockWindowExpiredKey);

    v20 = -[SDAutoUnlockSessionManager deviceCurrentlyUnlockedByWatch](self, "deviceCurrentlyUnlockedByWatch");
  }
  else
  {
    v20 = -[SDAutoUnlockSessionManager deviceCurrentlyUnlockedByWatch](self, "deviceCurrentlyUnlockedByWatch");
    if (v20)
    {
      v21 = auto_unlock_log(v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v30) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device Unlocked & AutoRelock Window Not Expired, BTPipe Disconnected, Create Magnet Link Timer", (uint8_t *)&v30, 2u);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
      if (!v23)
        -[SDAutoUnlockSessionManager setUpMagnetLinkTimer](self, "setUpMagnetLinkTimer");
      goto LABEL_26;
    }
  }
  v25 = auto_unlock_log(v20);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = -[SDAutoUnlockSessionManager deviceCurrentlyUnlockedByWatch](self, "deviceCurrentlyUnlockedByWatch");
    v28 = CFSTR("NO");
    if (v27)
      v29 = CFSTR("YES");
    else
      v29 = CFSTR("NO");
    if (v19 > 60.0)
      v28 = CFSTR("YES");
    v30 = 138412546;
    v31 = v29;
    v32 = 2112;
    v33 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Not Creating Magnet Link Timer, deviceCurrentlyUnlockedByWatch: %@, autoRelockWindowExpired: %@", (uint8_t *)&v30, 0x16u);
  }

LABEL_26:
}

- (void)cancelMagnetLinkTimer
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  intptr_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
    v6 = dispatch_source_testcancel(v5);

    if (!v6)
    {
      v7 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager magnetLinkTimer](self, "magnetLinkTimer"));
      dispatch_source_cancel(v7);

      -[SDAutoUnlockSessionManager setMagnetLinkTimer:](self, "setMagnetLinkTimer:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
      v9 = SDAutoUnlockManagerMetricAutoRelockTimerCanceledKey;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", SDAutoUnlockManagerMetricAutoRelockTimerCanceledKey));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
      v12 = v11;
      if (v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v9));
        v14 = objc_msgSend(v13, "intValue");

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14 + 1));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager cachedMetrics](self, "cachedMetrics"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v9);

      }
      else
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", &off_10074B508, v9);
      }

      v17 = auto_unlock_log(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cancelled Magnet Link Timer", v19, 2u);
      }

    }
  }
}

- (id)baseResultsDictionaryForError:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, SDAutoUnlockManagerMetricErrorDomainKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", &off_10074B4D8, SDAutoUnlockManagerMetricSuccessKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager connectedBluetoothDevices](self, "connectedBluetoothDevices")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, SDAutoUnlockManagerMetricConnectedBluetoothDevicesKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager timeSinceLastMachineWake](self, "timeSinceLastMachineWake")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, SDAutoUnlockManagerMetricTimeSinceLastWakeKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[SDAutoUnlockSessionManager lastSleepType](self, "lastSleepType")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, SDAutoUnlockManagerMetricLastSleepTypeKey);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedDescription"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, SDAutoUnlockManagerMetricErrorStringKey);

  v11 = objc_msgSend(v4, "code");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, SDAutoUnlockManagerMetricErrorCodeKey);

  return v5;
}

- (void)handleBluetoothPowerChanged:(id)a3
{
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor", a3));
  v5 = objc_msgSend(v4, "bluetoothEnabled");

  v7 = auto_unlock_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Bluetooth power changed (interface on: %@)", (uint8_t *)&v10, 0xCu);
  }

  if (v5)
  {
    -[SDAutoUnlockSessionManager setBluetoothErrorCount:](self, "setBluetoothErrorCount:", 0);
    -[SDAutoUnlockSessionManager setPresentedBluetoothError:](self, "setPresentedBluetoothError:", 0);
    -[SDAutoUnlockSessionManager savePresentedBluetoothError](self, "savePresentedBluetoothError");
  }
}

- (void)handleWiFiPowerChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor", a3));
  -[SDAutoUnlockSessionManager setCachedDeviceWiFiState:](self, "setCachedDeviceWiFiState:", objc_msgSend(v4, "wirelessEnabled"));

  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[SDAutoUnlockSessionManager cachedDeviceWiFiState](self, "cachedDeviceWiFiState");
    v9 = CFSTR("NO");
    if (v8)
      v9 = CFSTR("YES");
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wi-Fi power changed (interface on: %@)", (uint8_t *)&v10, 0xCu);
  }

}

- (id)errorStringForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5
{
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v9;
  uint64_t v10;

  if (!a5)
    return CFSTR("### FaceID needs to be enabled for this feature to work");
  if (!a3 && !a4)
  {
    v5 = SFIsGreenTeaDevice(self, a2);
    v6 = CFSTR("UNLOCK_WIFI_BLUETOOTH_DISABLED");
    v7 = CFSTR("UNLOCK_WLAN_BLUETOOTH_DISABLED");
LABEL_11:
    if (v5)
      v9 = v7;
    else
      v9 = v6;
    goto LABEL_14;
  }
  if (a3)
  {
    if (a4)
      return 0;
    v5 = SFIsGreenTeaDevice(self, a2);
    v6 = CFSTR("UNLOCK_WIFI_DISABLED");
    v7 = CFSTR("UNLOCK_WLAN_DISABLED");
    goto LABEL_11;
  }
  v9 = CFSTR("UNLOCK_BLUETOOTH_DISABLED");
LABEL_14:
  v10 = SFLocalizedStringForKey(v9, a2);
  return (id)objc_claimAutoreleasedReturnValue(v10);
}

- (int64_t)errorCodeForBluetoothEnabled:(BOOL)a3 wifiEnabled:(BOOL)a4 faceIDEnabled:(BOOL)a5
{
  int64_t v5;
  uint64_t v6;

  v5 = 123;
  if (!a3 && !a4)
    v5 = 124;
  v6 = 120;
  if (a4)
    v6 = 0;
  if (a3)
    v5 = v6;
  if (a5)
    return v5;
  else
    return 205;
}

- (BOOL)shouldShowErrorForBluetoothEnabled:(BOOL)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;
  NSObject *v9;
  _DWORD v10[2];

  if (a3)
    return 0;
  v4 = -[SDAutoUnlockSessionManager presentedBluetoothError](self, "presentedBluetoothError");
  if (v4)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Already presented Bluetooth off error", (uint8_t *)v10, 2u);
    }

    return 0;
  }
  if (-[SDAutoUnlockSessionManager bluetoothErrorCount](self, "bluetoothErrorCount") >= 5)
  {
    -[SDAutoUnlockSessionManager setPresentedBluetoothError:](self, "setPresentedBluetoothError:", 1);
    -[SDAutoUnlockSessionManager savePresentedBluetoothError](self, "savePresentedBluetoothError");
    return 0;
  }
  v8 = auto_unlock_log(-[SDAutoUnlockSessionManager setBluetoothErrorCount:](self, "setBluetoothErrorCount:", (char *)-[SDAutoUnlockSessionManager bluetoothErrorCount](self, "bluetoothErrorCount") + 1));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = -[SDAutoUnlockSessionManager bluetoothErrorCount](self, "bluetoothErrorCount");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "### Bluetooth error count: %d", (uint8_t *)v10, 8u);
  }

  return 1;
}

- (BOOL)shouldShowErrorForWiFiEnabled:(BOOL)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;
  NSObject *v9;
  _DWORD v10[2];

  if (a3)
    return 0;
  v4 = -[SDAutoUnlockSessionManager presentedWiFiError](self, "presentedWiFiError");
  if (v4)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Already presented Wi-Fi off error", (uint8_t *)v10, 2u);
    }

    return 0;
  }
  if (-[SDAutoUnlockSessionManager wifiErrorCount](self, "wifiErrorCount") >= 5)
  {
    -[SDAutoUnlockSessionManager setPresentedWiFiError:](self, "setPresentedWiFiError:", 1);
    -[SDAutoUnlockSessionManager savePresentedWiFiError](self, "savePresentedWiFiError");
    return 0;
  }
  v8 = auto_unlock_log(-[SDAutoUnlockSessionManager setWifiErrorCount:](self, "setWifiErrorCount:", (char *)-[SDAutoUnlockSessionManager wifiErrorCount](self, "wifiErrorCount") + 1));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = -[SDAutoUnlockSessionManager wifiErrorCount](self, "wifiErrorCount");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "### WiFi error count: %d", (uint8_t *)v10, 8u);
  }

  return 1;
}

- (void)loadPresentedBluetoothError
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  -[SDAutoUnlockSessionManager setPresentedBluetoothError:](self, "setPresentedBluetoothError:", objc_msgSend(v3, "BOOLForKey:", CFSTR("AutoUnlockPresentedBluetoothError")));

}

- (void)loadPresentedWiFiError
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  -[SDAutoUnlockSessionManager setPresentedWiFiError:](self, "setPresentedWiFiError:", objc_msgSend(v3, "BOOLForKey:", CFSTR("AutoUnlockPresentedWiFiError")));

}

- (void)savePresentedBluetoothError
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", -[SDAutoUnlockSessionManager presentedBluetoothError](self, "presentedBluetoothError"), CFSTR("AutoUnlockPresentedBluetoothError"));
  objc_msgSend(v3, "synchronize");

}

- (void)savePresentedWiFiError
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "setBool:forKey:", -[SDAutoUnlockSessionManager presentedWiFiError](self, "presentedWiFiError"), CFSTR("AutoUnlockPresentedWiFiError"));
  objc_msgSend(v3, "synchronize");

}

- (void)generateStateDump
{
  uint64_t v2;
  NSObject *v3;

  v2 = auto_unlock_log(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10009D6E8();

}

- (void)initializeCaptureBlock
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager sessionManagerQueue](self, "sessionManagerQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009BB24;
  v4[3] = &unk_100714CC0;
  v4[4] = self;
  -[SDAutoUnlockSessionManager setStateHandle:](self, "setStateHandle:", os_state_add_handler(v3, v4));

}

- (os_state_data_s)dumpState
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  os_state_data_s *v18;
  os_state_data_s *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dumping state", buf, 2u);
  }

  v25 = 0;
  NSAppendPrintF(&v25, "\n");
  v5 = v25;
  v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager state](self, "state"));
  v7 = (void *)v6;
  if (v6)
  {
    v24 = v5;
    NSAppendPrintF(&v24, "%@\n", v6);
    v8 = v24;

    v5 = v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "state"));

  if (v10)
  {
    v23 = v5;
    NSAppendPrintF(&v23, "%@\n", v10);
    v11 = v23;

    v5 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "state"));

  if (v13)
  {
    v22 = v5;
    NSAppendPrintF(&v22, "%@\n", v13);
    v14 = v22;

    v5 = v14;
  }
  v21 = v5;
  NSAppendPrintF(&v21, "Auto Unlock State End\n");
  v15 = v21;

  if (v15)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v15, 200, 0, 0));
    v17 = objc_msgSend(v16, "length");
    v18 = (os_state_data_s *)malloc_type_calloc(1uLL, (size_t)v17 + 200, 0xD2D2FD3FuLL);
    v19 = v18;
    if (v18)
    {
      v18->var0 = 1;
      v18->var1.var1 = v17;
      __strlcpy_chk(v18->var3, "Auto Unlock State", 64, 64);
      v16 = objc_retainAutorelease(v16);
      memcpy(v19->var4, objc_msgSend(v16, "bytes"), (size_t)v17);
    }
  }
  else
  {
    v16 = 0;
    v19 = 0;
  }

  return v19;
}

- (NSString)state
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  id v7;
  NSDate *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  const __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  const __CFString *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  const __CFString *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  const __CFString *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;

  v64 = 0;
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v64, "%@\n", v5);
  v6 = v64;

  v63 = v6;
  NSAppendPrintF(&v63, "-------------\n");
  v7 = v63;

  v62 = v7;
  v8 = objc_opt_new(NSDate);
  v9 = sub_1000C8074(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  NSAppendPrintF(&v62, "Current Date: %@\n", v10);
  v11 = v62;

  v61 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v12, "deviceSupportsRanging"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  NSAppendPrintF(&v61, "Ranging Supported: %@\n", v13);
  v14 = v61;

  v60 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "modelCode"));
  NSAppendPrintF(&v60, "Model Identifier: %@\n", v16);
  v17 = v60;

  v59 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v18, "deviceKeyBagDisabled"))
    v19 = CFSTR("NO");
  else
    v19 = CFSTR("YES");
  NSAppendPrintF(&v59, "Device Has Passcode: %@\n", v19);
  v20 = v59;

  v58 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v21, "deviceKeyBagUnlocked"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  NSAppendPrintF(&v58, "Unlocked: %@\n", v22);
  v23 = v58;

  v57 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockStateChangedDate](self, "lockStateChangedDate"));
  v25 = sub_1000C8074(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  NSAppendPrintF(&v57, "Lock State Changed: %@\n", v26);
  v27 = v57;

  v56 = v27;
  NSAppendPrintF(&v56, "\n");
  v28 = v56;

  v55 = v28;
  NSAppendPrintF(&v55, "Attempt Count: %d\n", -[SDAutoUnlockSessionManager attemptCount](self, "attemptCount"));
  v29 = v55;

  v54 = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lastUnlockDate](self, "lastUnlockDate"));
  if (v30)
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  NSAppendPrintF(&v54, "Device Been Unlocked: %@\n", v31);
  v32 = v54;

  v53 = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager advertisingChangedDate](self, "advertisingChangedDate"));
  v34 = sub_1000C8074(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  NSAppendPrintF(&v53, "Advertising Changed Date: %@\n", v35);
  v36 = v53;

  v52 = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  if (objc_msgSend(v37, "deviceNearby"))
    v38 = CFSTR("YES");
  else
    v38 = CFSTR("NO");
  NSAppendPrintF(&v52, "Nearby: %@\n", v38);
  v39 = v52;

  v51 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager nearbyDeviceChangedDate](self, "nearbyDeviceChangedDate"));
  v41 = sub_1000C8074(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  NSAppendPrintF(&v51, "Nearby Devices Changed Date: %@\n", v42);
  v43 = v51;

  v50 = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager lockRegistrationSessionsByDeviceID](self, "lockRegistrationSessionsByDeviceID"));
  NSAppendPrintF(&v50, "Registration Sessions: %@\n", v44);
  v45 = v50;

  v49 = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager remotePeer](self, "remotePeer"));
  NSAppendPrintF(&v49, "Remote Peer: %@\n", v46);
  v47 = v49;

  return (NSString *)v47;
}

- (void)storePreviousSessionID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SDAutoUnlockSessionManager loadPreviousSessionIDs](self, "loadPreviousSessionIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
  objc_msgSend(v4, "insertObject:atIndex:", v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 >= 0x65)
  {
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
      objc_msgSend(v8, "removeLastObject");

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
      v10 = objc_msgSend(v9, "count");

    }
    while ((unint64_t)v10 > 0x64);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
  objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("ApproveSessionIDs"));

  objc_msgSend(v11, "synchronize");
}

- (BOOL)previousSessionExists:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SDAutoUnlockSessionManager loadPreviousSessionIDs](self, "loadPreviousSessionIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)loadPreviousSessionIDs
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSMutableArray *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));

  if (!v3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ApproveSessionIDs")));
    v5 = objc_msgSend(v4, "mutableCopy");
    -[SDAutoUnlockSessionManager setPreviousSessionIDs:](self, "setPreviousSessionIDs:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionManager previousSessionIDs](self, "previousSessionIDs"));
    if (!v6)
    {
      v7 = objc_opt_new(NSMutableArray);
      -[SDAutoUnlockSessionManager setPreviousSessionIDs:](self, "setPreviousSessionIDs:", v7);

    }
  }
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)attemptInProgress
{
  return self->_attemptInProgress;
}

- (void)setAttemptInProgress:(BOOL)a3
{
  self->_attemptInProgress = a3;
}

- (NSData)attemptExternalACMContext
{
  return self->_attemptExternalACMContext;
}

- (void)setAttemptExternalACMContext:(id)a3
{
  objc_storeStrong((id *)&self->_attemptExternalACMContext, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (NSDictionary)awdlInfo
{
  return self->_awdlInfo;
}

- (void)setAwdlInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)sessionManagerQueue
{
  return self->_sessionManagerQueue;
}

- (void)setSessionManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionManagerQueue, a3);
}

- (NSHashTable)observerTable
{
  return self->_observerTable;
}

- (void)setObserverTable:(id)a3
{
  objc_storeStrong((id *)&self->_observerTable, a3);
}

- (SDAutoUnlockSuggestionManager)suggestionManager
{
  return self->_suggestionManager;
}

- (void)setSuggestionManager:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionManager, a3);
}

- (NSMutableDictionary)lockAuthSessions
{
  return self->_lockAuthSessions;
}

- (void)setLockAuthSessions:(id)a3
{
  objc_storeStrong((id *)&self->_lockAuthSessions, a3);
}

- (NSMutableArray)canceledPairingKeySessions
{
  return self->_canceledPairingKeySessions;
}

- (void)setCanceledPairingKeySessions:(id)a3
{
  objc_storeStrong((id *)&self->_canceledPairingKeySessions, a3);
}

- (NSMutableArray)canceledAuthLockSessions
{
  return self->_canceledAuthLockSessions;
}

- (void)setCanceledAuthLockSessions:(id)a3
{
  objc_storeStrong((id *)&self->_canceledAuthLockSessions, a3);
}

- (NSMutableDictionary)keyAuthSessions
{
  return self->_keyAuthSessions;
}

- (void)setKeyAuthSessions:(id)a3
{
  objc_storeStrong((id *)&self->_keyAuthSessions, a3);
}

- (NSMutableDictionary)lockPairingSessions
{
  return self->_lockPairingSessions;
}

- (void)setLockPairingSessions:(id)a3
{
  objc_storeStrong((id *)&self->_lockPairingSessions, a3);
}

- (NSMutableDictionary)keyPairingSessions
{
  return self->_keyPairingSessions;
}

- (void)setKeyPairingSessions:(id)a3
{
  objc_storeStrong((id *)&self->_keyPairingSessions, a3);
}

- (NSMutableDictionary)proxySessions
{
  return self->_proxySessions;
}

- (void)setProxySessions:(id)a3
{
  objc_storeStrong((id *)&self->_proxySessions, a3);
}

- (NSMutableArray)locksWithAKSTokens
{
  return self->_locksWithAKSTokens;
}

- (void)setLocksWithAKSTokens:(id)a3
{
  objc_storeStrong((id *)&self->_locksWithAKSTokens, a3);
}

- (NSMutableArray)keysWithAKSTokens
{
  return self->_keysWithAKSTokens;
}

- (void)setKeysWithAKSTokens:(id)a3
{
  objc_storeStrong((id *)&self->_keysWithAKSTokens, a3);
}

- (NSMutableDictionary)keyRegistrationSessionsByDeviceID
{
  return self->_keyRegistrationSessionsByDeviceID;
}

- (void)setKeyRegistrationSessionsByDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_keyRegistrationSessionsByDeviceID, a3);
}

- (NSMutableDictionary)lockRegistrationSessionsByDeviceID
{
  return self->_lockRegistrationSessionsByDeviceID;
}

- (void)setLockRegistrationSessionsByDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_lockRegistrationSessionsByDeviceID, a3);
}

- (NSMutableSet)serviceClients
{
  return self->_serviceClients;
}

- (void)setServiceClients:(id)a3
{
  objc_storeStrong((id *)&self->_serviceClients, a3);
}

- (BOOL)watchUnlockEnabled
{
  return self->_watchUnlockEnabled;
}

- (void)setWatchUnlockEnabled:(BOOL)a3
{
  self->_watchUnlockEnabled = a3;
}

- (NSData)previousMacAddressData
{
  return self->_previousMacAddressData;
}

- (void)setPreviousMacAddressData:(id)a3
{
  objc_storeStrong((id *)&self->_previousMacAddressData, a3);
}

- (BOOL)previousNearbyState
{
  return self->_previousNearbyState;
}

- (void)setPreviousNearbyState:(BOOL)a3
{
  self->_previousNearbyState = a3;
}

- (OS_dispatch_source)nearbyPushTimer
{
  return self->_nearbyPushTimer;
}

- (void)setNearbyPushTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyPushTimer, a3);
}

- (BOOL)attemptPrewarmed
{
  return self->_attemptPrewarmed;
}

- (void)setAttemptPrewarmed:(BOOL)a3
{
  self->_attemptPrewarmed = a3;
}

- (NSDate)prewarmStart
{
  return self->_prewarmStart;
}

- (void)setPrewarmStart:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmStart, a3);
}

- (NSDate)attemptStart
{
  return self->_attemptStart;
}

- (void)setAttemptStart:(id)a3
{
  objc_storeStrong((id *)&self->_attemptStart, a3);
}

- (BOOL)extendedTimer
{
  return self->_extendedTimer;
}

- (void)setExtendedTimer:(BOOL)a3
{
  self->_extendedTimer = a3;
}

- (SFDeviceDiscovery)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
  objc_storeStrong((id *)&self->_scanner, a3);
}

- (SFAutoUnlockDevice)attemptDevice
{
  return self->_attemptDevice;
}

- (void)setAttemptDevice:(id)a3
{
  objc_storeStrong((id *)&self->_attemptDevice, a3);
}

- (int64_t)attemptType
{
  return self->_attemptType;
}

- (void)setAttemptType:(int64_t)a3
{
  self->_attemptType = a3;
}

- (NSString)attemptBundlePath
{
  return self->_attemptBundlePath;
}

- (void)setAttemptBundlePath:(id)a3
{
  objc_storeStrong((id *)&self->_attemptBundlePath, a3);
}

- (NSString)attemptAppName
{
  return self->_attemptAppName;
}

- (void)setAttemptAppName:(id)a3
{
  objc_storeStrong((id *)&self->_attemptAppName, a3);
}

- (NSString)attemptNavBarTitle
{
  return self->_attemptNavBarTitle;
}

- (void)setAttemptNavBarTitle:(id)a3
{
  objc_storeStrong((id *)&self->_attemptNavBarTitle, a3);
}

- (id)attemptActivatedHandler
{
  return self->_attemptActivatedHandler;
}

- (void)setAttemptActivatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (OS_dispatch_source)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scanTimer, a3);
}

- (double)proxyDiscoverTime
{
  return self->_proxyDiscoverTime;
}

- (void)setProxyDiscoverTime:(double)a3
{
  self->_proxyDiscoverTime = a3;
}

- (BOOL)notifiedForProxy
{
  return self->_notifiedForProxy;
}

- (void)setNotifiedForProxy:(BOOL)a3
{
  self->_notifiedForProxy = a3;
}

- (NSString)scanErrorString
{
  return self->_scanErrorString;
}

- (void)setScanErrorString:(id)a3
{
  objc_storeStrong((id *)&self->_scanErrorString, a3);
}

- (NSError)authSessionError
{
  return self->_authSessionError;
}

- (void)setAuthSessionError:(id)a3
{
  objc_storeStrong((id *)&self->_authSessionError, a3);
}

- (int64_t)proxyErrorCode
{
  return self->_proxyErrorCode;
}

- (void)setProxyErrorCode:(int64_t)a3
{
  self->_proxyErrorCode = a3;
}

- (NSString)proxyDeviceModel
{
  return self->_proxyDeviceModel;
}

- (void)setProxyDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_proxyDeviceModel, a3);
}

- (int)proxyRSSI
{
  return self->_proxyRSSI;
}

- (void)setProxyRSSI:(int)a3
{
  self->_proxyRSSI = a3;
}

- (int64_t)lastProxyState
{
  return self->_lastProxyState;
}

- (void)setLastProxyState:(int64_t)a3
{
  self->_lastProxyState = a3;
}

- (double)proxyConnectionTime
{
  return self->_proxyConnectionTime;
}

- (void)setProxyConnectionTime:(double)a3
{
  self->_proxyConnectionTime = a3;
}

- (BOOL)proxyNotAvailableForUnlock
{
  return self->_proxyNotAvailableForUnlock;
}

- (void)setProxyNotAvailableForUnlock:(BOOL)a3
{
  self->_proxyNotAvailableForUnlock = a3;
}

- (NSSet)scanAutoUnlockDevices
{
  return self->_scanAutoUnlockDevices;
}

- (void)setScanAutoUnlockDevices:(id)a3
{
  objc_storeStrong((id *)&self->_scanAutoUnlockDevices, a3);
}

- (NSSet)scanWatchIDs
{
  return self->_scanWatchIDs;
}

- (void)setScanWatchIDs:(id)a3
{
  objc_storeStrong((id *)&self->_scanWatchIDs, a3);
}

- (NSSet)scanPhoneIDs
{
  return self->_scanPhoneIDs;
}

- (void)setScanPhoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_scanPhoneIDs, a3);
}

- (int64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(int64_t)a3
{
  self->_attemptCount = a3;
}

- (NSString)attemptID
{
  return self->_attemptID;
}

- (void)setAttemptID:(id)a3
{
  objc_storeStrong((id *)&self->_attemptID, a3);
}

- (NSString)incrementedCountID
{
  return self->_incrementedCountID;
}

- (void)setIncrementedCountID:(id)a3
{
  objc_storeStrong((id *)&self->_incrementedCountID, a3);
}

- (int64_t)connectedBluetoothDevices
{
  return self->_connectedBluetoothDevices;
}

- (void)setConnectedBluetoothDevices:(int64_t)a3
{
  self->_connectedBluetoothDevices = a3;
}

- (int64_t)timeSinceLastMachineWake
{
  return self->_timeSinceLastMachineWake;
}

- (void)setTimeSinceLastMachineWake:(int64_t)a3
{
  self->_timeSinceLastMachineWake = a3;
}

- (int64_t)lastSleepType
{
  return self->_lastSleepType;
}

- (void)setLastSleepType:(int64_t)a3
{
  self->_lastSleepType = a3;
}

- (NSSet)eligibleDevices
{
  return self->_eligibleDevices;
}

- (void)setEligibleDevices:(id)a3
{
  objc_storeStrong((id *)&self->_eligibleDevices, a3);
}

- (int64_t)wifiErrorCount
{
  return self->_wifiErrorCount;
}

- (void)setWifiErrorCount:(int64_t)a3
{
  self->_wifiErrorCount = a3;
}

- (int64_t)bluetoothErrorCount
{
  return self->_bluetoothErrorCount;
}

- (void)setBluetoothErrorCount:(int64_t)a3
{
  self->_bluetoothErrorCount = a3;
}

- (BOOL)presentedBluetoothError
{
  return self->_presentedBluetoothError;
}

- (void)setPresentedBluetoothError:(BOOL)a3
{
  self->_presentedBluetoothError = a3;
}

- (BOOL)presentedWiFiError
{
  return self->_presentedWiFiError;
}

- (void)setPresentedWiFiError:(BOOL)a3
{
  self->_presentedWiFiError = a3;
}

- (BOOL)currentlyAdvertising
{
  return self->_currentlyAdvertising;
}

- (void)setCurrentlyAdvertising:(BOOL)a3
{
  self->_currentlyAdvertising = a3;
}

- (int64_t)idsMacCountCache
{
  return self->_idsMacCountCache;
}

- (void)setIdsMacCountCache:(int64_t)a3
{
  self->_idsMacCountCache = a3;
}

- (NSDate)advertisingChangedDate
{
  return self->_advertisingChangedDate;
}

- (void)setAdvertisingChangedDate:(id)a3
{
  objc_storeStrong((id *)&self->_advertisingChangedDate, a3);
}

- (NSDate)wristStateChangedDate
{
  return self->_wristStateChangedDate;
}

- (void)setWristStateChangedDate:(id)a3
{
  objc_storeStrong((id *)&self->_wristStateChangedDate, a3);
}

- (NSDate)lockStateChangedDate
{
  return self->_lockStateChangedDate;
}

- (void)setLockStateChangedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lockStateChangedDate, a3);
}

- (NSDate)nearbyDeviceChangedDate
{
  return self->_nearbyDeviceChangedDate;
}

- (void)setNearbyDeviceChangedDate:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDeviceChangedDate, a3);
}

- (NSDate)pipeConnectionChangedDate
{
  return self->_pipeConnectionChangedDate;
}

- (void)setPipeConnectionChangedDate:(id)a3
{
  objc_storeStrong((id *)&self->_pipeConnectionChangedDate, a3);
}

- (BOOL)previousConnectedState
{
  return self->_previousConnectedState;
}

- (void)setPreviousConnectedState:(BOOL)a3
{
  self->_previousConnectedState = a3;
}

- (BOOL)autoRelockAssertionTimerActive
{
  return self->_autoRelockAssertionTimerActive;
}

- (void)setAutoRelockAssertionTimerActive:(BOOL)a3
{
  self->_autoRelockAssertionTimerActive = a3;
}

- (BOOL)cachedDeviceWiFiState
{
  return self->_cachedDeviceWiFiState;
}

- (void)setCachedDeviceWiFiState:(BOOL)a3
{
  self->_cachedDeviceWiFiState = a3;
}

- (BOOL)cachedWatchWiFiState
{
  return self->_cachedWatchWiFiState;
}

- (void)setCachedWatchWiFiState:(BOOL)a3
{
  self->_cachedWatchWiFiState = a3;
}

- (BOOL)wifiStateNeedsUpdating
{
  return self->_wifiStateNeedsUpdating;
}

- (void)setWifiStateNeedsUpdating:(BOOL)a3
{
  self->_wifiStateNeedsUpdating = a3;
}

- (BOOL)useBTPipe
{
  return self->_useBTPipe;
}

- (void)setUseBTPipe:(BOOL)a3
{
  self->_useBTPipe = a3;
}

- (BOOL)preventRadarNotification
{
  return self->_preventRadarNotification;
}

- (void)setPreventRadarNotification:(BOOL)a3
{
  self->_preventRadarNotification = a3;
}

- (NSMutableDictionary)cachedMetrics
{
  return self->_cachedMetrics;
}

- (void)setCachedMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMetrics, a3);
}

- (NSMutableArray)previousSessionIDs
{
  return self->_previousSessionIDs;
}

- (void)setPreviousSessionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_previousSessionIDs, a3);
}

- (SDAutoUnlockIconTransferStore)iconTransferStore
{
  return self->_iconTransferStore;
}

- (void)setIconTransferStore:(id)a3
{
  objc_storeStrong((id *)&self->_iconTransferStore, a3);
}

- (SDAutoUnlockLocalDeviceController)localDeviceController
{
  return self->_localDeviceController;
}

- (void)setLocalDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceController, a3);
}

- (OS_dispatch_source)magnetLinkTimer
{
  return self->_magnetLinkTimer;
}

- (void)setMagnetLinkTimer:(id)a3
{
  objc_storeStrong((id *)&self->_magnetLinkTimer, a3);
}

- (NSDate)lastUnlockDate
{
  return self->_lastUnlockDate;
}

- (void)setLastUnlockDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUnlockDate, a3);
}

- (BOOL)lastUnlockedByWatch
{
  return self->_lastUnlockedByWatch;
}

- (void)setLastUnlockedByWatch:(BOOL)a3
{
  self->_lastUnlockedByWatch = a3;
}

- (BOOL)lastLockedByRelock
{
  return self->_lastLockedByRelock;
}

- (void)setLastLockedByRelock:(BOOL)a3
{
  self->_lastLockedByRelock = a3;
}

- (BOOL)doNotPostUnlockConfirmation
{
  return self->_doNotPostUnlockConfirmation;
}

- (void)setDoNotPostUnlockConfirmation:(BOOL)a3
{
  self->_doNotPostUnlockConfirmation = a3;
}

- (BOOL)suppressAlert
{
  return self->_suppressAlert;
}

- (void)setSuppressAlert:(BOOL)a3
{
  self->_suppressAlert = a3;
}

- (int64_t)periocularStatus
{
  return self->_periocularStatus;
}

- (void)setPeriocularStatus:(int64_t)a3
{
  self->_periocularStatus = a3;
}

- (int)screenDisplayChangedToken
{
  return self->_screenDisplayChangedToken;
}

- (void)setScreenDisplayChangedToken:(int)a3
{
  self->_screenDisplayChangedToken = a3;
}

- (BOOL)needsArming
{
  return self->_needsArming;
}

- (void)setNeedsArming:(BOOL)a3
{
  self->_needsArming = a3;
}

- (BOOL)isBeingUsedForSiri
{
  return self->_isBeingUsedForSiri;
}

- (void)setIsBeingUsedForSiri:(BOOL)a3
{
  self->_isBeingUsedForSiri = a3;
}

- (BOOL)needsStrictMotionCheck
{
  return self->_needsStrictMotionCheck;
}

- (void)setNeedsStrictMotionCheck:(BOOL)a3
{
  self->_needsStrictMotionCheck = a3;
}

- (SDAutoUnlockTransportProtocol)autoUnlockTransport
{
  return (SDAutoUnlockTransportProtocol *)objc_loadWeakRetained((id *)&self->_autoUnlockTransport);
}

- (SDUnlockMagnetTransport)magnetTransport
{
  return (SDUnlockMagnetTransport *)objc_loadWeakRetained((id *)&self->_magnetTransport);
}

- (SDKeyManaging)keyManager
{
  return (SDKeyManaging *)objc_loadWeakRetained((id *)&self->_keyManager);
}

- (id)isSignedIntoPrimaryiCloudAccount
{
  return self->_isSignedIntoPrimaryiCloudAccount;
}

- (void)setIsSignedIntoPrimaryiCloudAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (id)isFaceIDEnabled
{
  return self->_isFaceIDEnabled;
}

- (void)setIsFaceIDEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (id)isWifiEnabled
{
  return self->_isWifiEnabled;
}

- (void)setIsWifiEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (id)isBluetoothEnabled
{
  return self->_isBluetoothEnabled;
}

- (void)setIsBluetoothEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (id)isActiveDeviceNearby
{
  return self->_isActiveDeviceNearby;
}

- (void)setIsActiveDeviceNearby:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 600);
}

- (SDAutoUnlockPeer)remotePeer
{
  return self->_remotePeer;
}

- (void)setRemotePeer:(id)a3
{
  objc_storeStrong((id *)&self->_remotePeer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePeer, 0);
  objc_storeStrong(&self->_isActiveDeviceNearby, 0);
  objc_storeStrong(&self->_isBluetoothEnabled, 0);
  objc_storeStrong(&self->_isWifiEnabled, 0);
  objc_storeStrong(&self->_isFaceIDEnabled, 0);
  objc_storeStrong(&self->_isSignedIntoPrimaryiCloudAccount, 0);
  objc_destroyWeak((id *)&self->_keyManager);
  objc_destroyWeak((id *)&self->_magnetTransport);
  objc_destroyWeak((id *)&self->_autoUnlockTransport);
  objc_storeStrong((id *)&self->_lastUnlockDate, 0);
  objc_storeStrong((id *)&self->_magnetLinkTimer, 0);
  objc_storeStrong((id *)&self->_localDeviceController, 0);
  objc_storeStrong((id *)&self->_iconTransferStore, 0);
  objc_storeStrong((id *)&self->_previousSessionIDs, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong((id *)&self->_pipeConnectionChangedDate, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceChangedDate, 0);
  objc_storeStrong((id *)&self->_lockStateChangedDate, 0);
  objc_storeStrong((id *)&self->_wristStateChangedDate, 0);
  objc_storeStrong((id *)&self->_advertisingChangedDate, 0);
  objc_storeStrong((id *)&self->_eligibleDevices, 0);
  objc_storeStrong((id *)&self->_incrementedCountID, 0);
  objc_storeStrong((id *)&self->_attemptID, 0);
  objc_storeStrong((id *)&self->_scanPhoneIDs, 0);
  objc_storeStrong((id *)&self->_scanWatchIDs, 0);
  objc_storeStrong((id *)&self->_scanAutoUnlockDevices, 0);
  objc_storeStrong((id *)&self->_proxyDeviceModel, 0);
  objc_storeStrong((id *)&self->_authSessionError, 0);
  objc_storeStrong((id *)&self->_scanErrorString, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong(&self->_attemptActivatedHandler, 0);
  objc_storeStrong((id *)&self->_attemptNavBarTitle, 0);
  objc_storeStrong((id *)&self->_attemptAppName, 0);
  objc_storeStrong((id *)&self->_attemptBundlePath, 0);
  objc_storeStrong((id *)&self->_attemptDevice, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_attemptStart, 0);
  objc_storeStrong((id *)&self->_prewarmStart, 0);
  objc_storeStrong((id *)&self->_nearbyPushTimer, 0);
  objc_storeStrong((id *)&self->_previousMacAddressData, 0);
  objc_storeStrong((id *)&self->_serviceClients, 0);
  objc_storeStrong((id *)&self->_lockRegistrationSessionsByDeviceID, 0);
  objc_storeStrong((id *)&self->_keyRegistrationSessionsByDeviceID, 0);
  objc_storeStrong((id *)&self->_keysWithAKSTokens, 0);
  objc_storeStrong((id *)&self->_locksWithAKSTokens, 0);
  objc_storeStrong((id *)&self->_proxySessions, 0);
  objc_storeStrong((id *)&self->_keyPairingSessions, 0);
  objc_storeStrong((id *)&self->_lockPairingSessions, 0);
  objc_storeStrong((id *)&self->_keyAuthSessions, 0);
  objc_storeStrong((id *)&self->_canceledAuthLockSessions, 0);
  objc_storeStrong((id *)&self->_canceledPairingKeySessions, 0);
  objc_storeStrong((id *)&self->_lockAuthSessions, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
  objc_storeStrong((id *)&self->_observerTable, 0);
  objc_storeStrong((id *)&self->_sessionManagerQueue, 0);
  objc_storeStrong((id *)&self->_awdlInfo, 0);
  objc_storeStrong((id *)&self->_attemptExternalACMContext, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
