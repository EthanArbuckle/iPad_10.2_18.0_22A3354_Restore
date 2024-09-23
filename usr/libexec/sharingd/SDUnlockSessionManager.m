@implementation SDUnlockSessionManager

- (SDUnlockSessionManager)init
{
  SDUnlockSessionManager *v2;
  SDUnlockSessionManager *v3;
  OS_dispatch_source *unlockTimer;
  void *v5;
  id WeakRetained;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDUnlockSessionManager;
  v2 = -[SDUnlockSessionManager init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    unlockTimer = v2->_unlockTimer;
    v2->_unlockTimer = 0;

    v3->_unlockAuthSession = -1;
    v3->_stashBagSession = -1;
    v3->_setupAuthSession = -1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](SDUnlockIDSController, "sharedController"));
    objc_storeWeak((id *)&v3->_idsController, v5);

    WeakRetained = objc_loadWeakRetained((id *)&v3->_idsController);
    objc_msgSend(WeakRetained, "addDelegate:", v3);

    -[SDUnlockSessionManager updateSecurityManager](v3, "updateSecurityManager");
    -[SDUnlockSessionManager preventExitForLocaleIfNeeded](v3, "preventExitForLocaleIfNeeded");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SDUnlockSessionManager removeObservers](self, "removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)SDUnlockSessionManager;
  -[SDUnlockSessionManager dealloc](&v3, "dealloc");
}

- (void)updateSecurityManagerIfNeeded
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));

  if (!v3)
    -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
}

- (void)updateSecurityManager
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  SDUnlockSecurityManager *v7;
  void *v8;
  SDUnlockSecurityManager *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager pairingID](self, "pairingID"));
  v4 = objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager pairingStorePath](self, "pairingStorePath"));
  v6 = (void *)v4;
  if (!v3 || !v4)
  {
    v15 = paired_unlock_log(v4, v5);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDeviceDescription](self, "activeDeviceDescription"));
    v16 = 138412803;
    v17 = v3;
    v18 = 2112;
    v19 = v6;
    v20 = 2113;
    v21 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to create security manager (pairing id %@, pairing store path %@, active device %{private}@)", (uint8_t *)&v16, 0x20u);
    goto LABEL_5;
  }
  v7 = [SDUnlockSecurityManager alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDeviceName](self, "activeDeviceName"));
  v9 = -[SDUnlockSecurityManager initWithPairingID:pairingStorePath:deviceName:](v7, "initWithPairingID:pairingStorePath:deviceName:", v3, v6, v8);
  -[SDUnlockSessionManager setSecurityManager:](self, "setSecurityManager:", v9);

  v12 = paired_unlock_log(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDeviceName](self, "activeDeviceName"));
    v16 = 138412802;
    v17 = v3;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created new security manager (pairing id %@, store path %@, device name %@)", (uint8_t *)&v16, 0x20u);
LABEL_5:

  }
LABEL_7:

}

- (void)preventExitForLocaleIfNeeded
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];

  v2 = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState");
  v3 = v2;
  v5 = paired_unlock_log(v2, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing state on launch %d", (uint8_t *)v7, 8u);
  }

}

- (void)addObservers
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session manager adding observers", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "debugInfoRequested:", CFSTR("com.apple.sharingd.DebugInfoRequested"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "devicesDidFailToPair:", NRPairedDeviceRegistryDeviceDidFailToPairNotification, 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "pairingStatusChanged:", NRPairedDeviceRegistryStatusDidChange, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "pairingDidBegin:", NRPairedDeviceRegistryDeviceDidBeginPairingNotification, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "deviceDidEnterConfigState:", NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification, 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)generateDebugInfo
{
  NSMutableArray *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;

  v3 = objc_opt_new(NSMutableArray);
  if (-[SDUnlockSessionManager unlockEnabled](self, "unlockEnabled"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unlock Enabled:%@"), v4));
  -[NSMutableArray addObject:](v3, "addObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localLongTermKey"));
  if (v7)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Local Long Term Key Exists:%@"), v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteLongTermKey"));
  if (v11)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Remote Long Term Key Exists:%@"), v12));
  -[NSMutableArray addObject:](v3, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device Key Bag State:%ld"), objc_msgSend(v14, "deviceKeyBagState")));
  -[NSMutableArray addObject:](v3, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AKS Key Bag State:%d"), objc_msgSend(v16, "lockState")));
  -[NSMutableArray addObject:](v3, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  if (objc_msgSend(v18, "isDefaultPairedDeviceNearby"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device Nearby:%@"), v19));
  -[NSMutableArray addObject:](v3, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setup AKS Session ID:%ld"), -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession")));
  -[NSMutableArray addObject:](v3, "addObject:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unlock AKS Session ID:%ld"), -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession")));
  -[NSMutableArray addObject:](v3, "addObject:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Stash AKS Session ID:%ld"), -[SDUnlockSessionManager stashBagSession](self, "stashBagSession")));
  -[NSMutableArray addObject:](v3, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Nano Registry State:%d"), -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState")));
  -[NSMutableArray addObject:](v3, "addObject:", v24);

  if (-[SDUnlockSessionManager deviceIsPaired](self, "deviceIsPaired"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device Paired:%@"), v25));
  -[NSMutableArray addObject:](v3, "addObject:", v26);

  return v3;
}

- (void)devicesDidFailToPair:(id)a3
{
  -[SDUnlockSessionManager handleDevicesDidFailToPair](self, "handleDevicesDidFailToPair", a3);
}

- (void)handleDevicesDidFailToPair
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device pairing failed, throwing away anything that was setup", v5, 2u);
  }

  -[SDUnlockSessionManager disableUnlockPairing](self, "disableUnlockPairing");
}

- (void)pairingStatusChanged:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD v9[2];

  v4 = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState", a3);
  v5 = v4;
  v7 = paired_unlock_log(v4, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pairing status changed %d", (uint8_t *)v9, 8u);
  }

  -[SDUnlockSessionManager updateExitPrevention](self, "updateExitPrevention");
}

- (void)pairingDidBegin:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _DWORD v6[2];

  v4 = paired_unlock_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pairing did begin %d", (uint8_t *)v6, 8u);
  }

  -[SDUnlockSessionManager updateExitPrevention](self, "updateExitPrevention");
}

- (void)deviceDidEnterConfigState:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _DWORD v6[2];

  v4 = paired_unlock_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device entered config state %d", (uint8_t *)v6, 8u);
  }

  -[SDUnlockSessionManager updateExitPrevention](self, "updateExitPrevention");
}

- (void)enableUnlockPairing
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, SFPairedUnlockStateChangedNotification, 0, 0, 1u);
  v5 = paired_unlock_log(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing Enabled", v7, 2u);
  }

}

- (void)disableUnlockPairing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EAB2C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)disableUnlockPairingForSecManager:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  v5 = paired_unlock_log(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pairingID"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Pairing Disabled: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (BOOL)unlockEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v3 = objc_msgSend(v2, "ltksExist");

  return v3;
}

- (void)disableUnlockWithDevice:(id)a3 completionHandler:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001EAD04;
  v5[3] = &unk_100714F40;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)resetAll
{
  -[SDUnlockSessionManager resetSetupState](self, "resetSetupState");
  -[SDUnlockSessionManager resetAndClearState](self, "resetAndClearState");
  -[SDUnlockSessionManager resetStashState](self, "resetStashState");
}

- (void)resetSetupState
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v3, "clearStateForSession:", -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession"));

  -[SDUnlockSessionManager setSetupAuthSession:](self, "setSetupAuthSession:", -1);
}

- (void)resetState
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v3, "clearStateForSession:", -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession"));

  -[SDUnlockSessionManager setUnlockAuthSession:](self, "setUnlockAuthSession:", -1);
  -[SDUnlockSessionManager invalidateUnlockTimer](self, "invalidateUnlockTimer");
}

- (void)resetStashState
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v3, "clearStateForSession:", -[SDUnlockSessionManager stashBagSession](self, "stashBagSession"));

  -[SDUnlockSessionManager setStashBagSession:](self, "setStashBagSession:", -1);
}

- (void)restartUnlockTimer:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *unlockTimer;
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "restartUnlockTimer", buf, 2u);
  }

  unlockTimer = self->_unlockTimer;
  if (!unlockTimer)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001EAF40;
    v11[3] = &unk_1007146D8;
    v11[4] = self;
    v8 = sub_10019AAD8(0, &_dispatch_main_q, v11);
    v9 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v8);
    v10 = self->_unlockTimer;
    self->_unlockTimer = v9;

    dispatch_resume((dispatch_object_t)self->_unlockTimer);
    unlockTimer = self->_unlockTimer;
  }
  sub_10019AB78(unlockTimer, a3);
}

- (void)invalidateUnlockTimer
{
  uint64_t v3;
  NSObject *v4;
  NSObject *unlockTimer;
  OS_dispatch_source *v6;
  uint8_t v7[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "invalidateUnlockTimer", v7, 2u);
  }

  unlockTimer = self->_unlockTimer;
  if (unlockTimer)
  {
    dispatch_source_cancel(unlockTimer);
    v6 = self->_unlockTimer;
    self->_unlockTimer = 0;

  }
}

- (void)sendResetMessage:(unsigned int)a3 reason:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  void *v8;
  SDUnlockReset *v9;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v9 = objc_alloc_init(SDUnlockReset);
  -[SDUnlockReset setVersion:](v9, "setVersion:", 1);
  -[SDUnlockReset setSessionID:](v9, "setSessionID:", v5);
  -[SDUnlockReset setResetReason:](v9, "setResetReason:", v4);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_idsController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockReset data](v9, "data"));
  objc_msgSend(WeakRetained, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v8, 1, 0, 1, &stru_10071B030);

  -[SDUnlockSessionManager resetAndClearState](self, "resetAndClearState");
}

- (void)sendDisableMessage
{
  id WeakRetained;
  void *v4;
  SDUnlockDisable *v5;

  v5 = objc_alloc_init(SDUnlockDisable);
  -[SDUnlockDisable setVersion:](v5, "setVersion:", 1);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_idsController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockDisable data](v5, "data"));
  objc_msgSend(WeakRetained, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v4, 2, 0, 2, &stru_10071B050);

}

- (void)abortDevicePairingWithReason:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if ((objc_msgSend(v5, "bypassLTKeyAbort") & 1) != 0
    || !-[SDUnlockSessionManager inConfigureState](self, "inConfigureState"))
  {

  }
  else
  {
    v6 = -[SDUnlockSessionManager shouldAbort](self, "shouldAbort");

    if (v6)
    {
      v9 = paired_unlock_log(v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001EBC44();

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      objc_msgSend(v11, "deleteLongTermKeys");

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
      objc_msgSend(v12, "abortPairingWithReason:", v4);

    }
  }

}

- (BOOL)shouldAbort
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];

  v2 = objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  v3 = (void *)v2;
  if (v2 && (v4 = NRWatchOSVersionForRemoteDevice(v2), v4 >= 0x40000))
  {
    v7 = paired_unlock_log(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Watch supports new LTK model, not aborting.", v10, 2u);
    }

    v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)inConfigureState
{
  return -[SDUnlockSessionManager pairingCompatibilityState](self, "pairingCompatibilityState") == 3;
}

- (unsigned)pairingCompatibilityState
{
  void *v2;
  unsigned __int16 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (unsigned __int16)objc_msgSend(v2, "compatibilityState");

  return v3;
}

- (BOOL)deviceIsPaired
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyIsPaired));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)pairingID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyPairingID));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));

  return v4;
}

- (id)pairingStorePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyLocalPairingDataStorePath));

  return v3;
}

- (id)activeDeviceName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForProperty:", NRDevicePropertyDeviceNameString));

  return v3;
}

- (id)activeDeviceDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return v3;
}

- (id)activeDevice
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getAllDevicesWithArchivedDevices"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = NRDevicePropertyIsActive;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", v7));
        v11 = objc_msgSend(v10, "BOOLValue");

        if (v11)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)activeDevicesMatch
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager activeDevice](self, "activeDevice"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeIDSDevice"));

    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceForIDSDevice:", v6));

      if (v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairingID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pairingID](v10, "pairingID"));
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) != 0)
        {
          v18 = 1;
LABEL_17:

          goto LABEL_18;
        }
        v23 = paired_unlock_log(v16, v17);
        v22 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_1001EBCF4();
      }
      else
      {
        v21 = paired_unlock_log(v11, v12);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_1001EBCC8();
      }

    }
    else
    {
      v20 = paired_unlock_log(v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1001EBC9C();
    }
    v18 = 0;
    goto LABEL_17;
  }
  v19 = paired_unlock_log(0, v3);
  v6 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1001EBC70();
  v18 = 0;
LABEL_18:

  return v18;
}

- (unsigned)generateSessionID
{
  return arc4random_uniform(0x7FFFFFFFu);
}

- (void)logProtoBufSend:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  void *v17;

  v3 = a3;
  v5 = v3;
  if (v3)
  {
    v6 = paired_unlock_log(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class(v5, v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v16 = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending %@", (uint8_t *)&v16, 0xCu);

    }
    v14 = paired_unlock_log(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Message Contents %@", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)logProtoBufReceived:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  void *v17;

  v3 = a3;
  v5 = v3;
  if (v3)
  {
    v6 = paired_unlock_log(v3, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (objc_class *)objc_opt_class(v5, v8);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v16 = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@", (uint8_t *)&v16, 0xCu);

    }
    v14 = paired_unlock_log(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Message Contents %@", (uint8_t *)&v16, 0xCu);
    }

  }
}

- (void)logMetrics
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));

  if (v3)
  {
    v6 = paired_unlock_log(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Submitting metrics", v9, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager metrics](self, "metrics"));
    objc_msgSend(v8, "submitEvent");

  }
  -[SDUnlockSessionManager setMetrics:](self, "setMetrics:", 0);
}

- (int64_t)setupAuthSession
{
  return self->_setupAuthSession;
}

- (void)setSetupAuthSession:(int64_t)a3
{
  self->_setupAuthSession = a3;
}

- (int64_t)unlockAuthSession
{
  return self->_unlockAuthSession;
}

- (void)setUnlockAuthSession:(int64_t)a3
{
  self->_unlockAuthSession = a3;
}

- (int64_t)stashBagSession
{
  return self->_stashBagSession;
}

- (void)setStashBagSession:(int64_t)a3
{
  self->_stashBagSession = a3;
}

- (SDUnlockIDSController)idsController
{
  return (SDUnlockIDSController *)objc_loadWeakRetained((id *)&self->_idsController);
}

- (void)setIdsController:(id)a3
{
  objc_storeWeak((id *)&self->_idsController, a3);
}

- (SDUnlockSecurityManager)securityManager
{
  return (SDUnlockSecurityManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSecurityManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SFPairedUnlockEvent)metrics
{
  return (SFPairedUnlockEvent *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_source)unlockTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUnlockTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockTimer, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_securityManager, 0);
  objc_destroyWeak((id *)&self->_idsController);
}

@end
