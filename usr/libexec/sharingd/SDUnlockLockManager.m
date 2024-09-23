@implementation SDUnlockLockManager

+ (id)sharedLockManager
{
  if (qword_1007C6DD8 != -1)
    dispatch_once(&qword_1007C6DD8, &stru_10071AF10);
  return (id)qword_1007C6DD0;
}

- (SDUnlockLockManager)init
{
  SDUnlockLockManager *v2;
  SDUnlockLockManager *v3;
  NSString *requestID;
  NSTimer *enableTimer;
  id enableHandler;
  OS_dispatch_source *longTermKeyTimer;
  OS_dispatch_semaphore *positionSemaphore;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  unsigned int v14;
  const __CFString *v15;
  SDUnlockLockMetricDates *v16;
  SDUnlockLockMetricDates *metricDates;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  const __CFString *v24;

  v20.receiver = self;
  v20.super_class = (Class)SDUnlockLockManager;
  v2 = -[SDUnlockSessionManager init](&v20, "init");
  v3 = v2;
  if (v2)
  {
    requestID = v2->_requestID;
    v2->_requestID = 0;

    enableTimer = v3->_enableTimer;
    v3->_enableTimer = 0;

    enableHandler = v3->_enableHandler;
    v3->_enableHandler = 0;

    v3->_sentLockedState = 0;
    v3->_unlockSessionID = -1;
    longTermKeyTimer = v3->_longTermKeyTimer;
    v3->_longTermKeyTimer = 0;

    positionSemaphore = v3->_positionSemaphore;
    v3->_positionSemaphore = 0;

    v3->_waitingForAuthToken = 0;
    v3->_deviceOffWristForSessionID = -1;
    v9 = -[SDUnlockLockManager addObservers](v3, "addObservers");
    v11 = paired_unlock_log(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[SDUnlockSessionManager pairingCompatibilityState](v3, "pairingCompatibilityState");
      v14 = -[SDUnlockSessionManager deviceIsPaired](v3, "deviceIsPaired");
      v15 = CFSTR("NO");
      if (v14)
        v15 = CFSTR("YES");
      *(_DWORD *)buf = 67109378;
      v22 = v13;
      v23 = 2112;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Key loading NanoRegitry, (compatibility state = %d, is paired = %@)", buf, 0x12u);
    }

    -[SDUnlockLockManager checkKeyBagState](v3, "checkKeyBagState");
    v16 = objc_alloc_init(SDUnlockLockMetricDates);
    metricDates = v3->_metricDates;
    v3->_metricDates = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[SDUnlockLockMetricDates setBooted:](v3->_metricDates, "setBooted:", v18);

    -[SDUnlockLockManager scheduleDailyMetricReporterIfNeeded](v3, "scheduleDailyMetricReporterIfNeeded");
  }
  return v3;
}

- (void)addObservers
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDUnlockLockManager;
  -[SDUnlockSessionManager addObservers](&v2, "addObservers");
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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager generateDebugInfo](self, "generateDebugInfo"));
  sub_1000455A8(v7, (uint64_t)v6);

}

- (id)generateDebugInfo
{
  NSMutableArray *v3;
  id v4;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = objc_opt_new(NSMutableArray);
  v10.receiver = self;
  v10.super_class = (Class)SDUnlockLockManager;
  v4 = -[SDUnlockSessionManager generateDebugInfo](&v10, "generateDebugInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);

  v6 = -[SDUnlockLockManager waitingForAuthToken](self, "waitingForAuthToken");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Waiting For Auth Token:%@"), v7));
  -[NSMutableArray addObject:](v3, "addObject:", v8);

  return v3;
}

- (void)keyBagLockStateChange:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = CUMainQueue(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E3754;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)handleConfigurationState
{
  void *v3;
  NSData *v4;
  NSData **p_tempLongTermKey;
  NSData *tempLongTermKey;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  NSString *requestID;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v4 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "generateLocalLongTermKey:", 3));
  p_tempLongTermKey = &self->_tempLongTermKey;
  tempLongTermKey = self->_tempLongTermKey;
  self->_tempLongTermKey = v4;

  if (self->_tempLongTermKey)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    requestID = self->_requestID;
    self->_requestID = v10;

    -[SDUnlockLockManager sendLongTermKeyRequest:requestID:](self, "sendLongTermKeyRequest:requestID:", *p_tempLongTermKey, self->_requestID);
  }
  else
  {
    v12 = paired_unlock_log(v7, v8);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1001E829C((uint64_t)p_tempLongTermKey, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)handleDevicesDidFailToPair
{
  objc_super v3;

  -[SDUnlockLockManager invalidateLongTermKeyTimer](self, "invalidateLongTermKeyTimer");
  -[SDUnlockLockManager resetLongTermKeyRequest](self, "resetLongTermKeyRequest");
  v3.receiver = self;
  v3.super_class = (Class)SDUnlockLockManager;
  -[SDUnlockSessionManager handleDevicesDidFailToPair](&v3, "handleDevicesDidFailToPair");
}

- (void)devicesDidUnpair:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = paired_unlock_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Devices unpaired", v5, 2u);
  }

}

- (void)checkKeyBagState
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t buf[16];

  if (!-[SDUnlockLockManager unlockEnabled](self, "unlockEnabled"))
    return;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v4 = objc_msgSend(v3, "deviceKeyBagDisabled");

  if (v4)
  {
    v7 = paired_unlock_log(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Passcode disabled while sharingd wasn't running", buf, 2u);
    }

    -[SDUnlockLockManager disableUnlockPairing](self, "disableUnlockPairing");
    -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
    return;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if (objc_msgSend(v9, "deviceKeyBagLocked"))
  {

LABEL_9:
    v14 = paired_unlock_log(v10, v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device locked on start up", v23, 2u);
    }

    -[SDUnlockLockManager sendDeviceLockStateChanged:](self, "sendDeviceLockStateChanged:", 0);
    return;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v13 = objc_msgSend(v12, "deviceKeyBagLocking");

  if (v13)
    goto LABEL_9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v17 = objc_msgSend(v16, "deviceKeyBagUnlocked");

  if (v17)
  {
    v20 = paired_unlock_log(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Device unlocked on start up. Assuming device was last unlocked with Paired Unlock", v22, 2u);
    }

    -[SDUnlockLockManager setLastUnlockedByPairedUnlock:](self, "setLastUnlockedByPairedUnlock:", 1);
  }
}

- (void)scheduleDailyMetricReporterIfNeeded
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager dailyMetricReporter](self, "dailyMetricReporter"));
  if (v3)
  {

  }
  else
  {
    v4 = -[SDUnlockLockManager unlockEnabled](self, "unlockEnabled");
    if (v4)
    {
      v6 = paired_unlock_log(v4, v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started tracking daily metrics", buf, 2u);
      }

      v8 = objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", CFSTR("com.apple.Sharing.PairedUnlock.DailyMetric"));
      -[SDUnlockLockManager setDailyMetricReporter:](self, "setDailyMetricReporter:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager dailyMetricReporter](self, "dailyMetricReporter"));
      objc_msgSend(v9, "setRepeats:", 1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager dailyMetricReporter](self, "dailyMetricReporter"));
      objc_msgSend(v10, "setInterval:", 86400.0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager dailyMetricReporter](self, "dailyMetricReporter"));
      objc_msgSend(v11, "setTolerance:", 60.0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager dailyMetricReporter](self, "dailyMetricReporter"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1001E3EE8;
      v14[3] = &unk_10071AF38;
      v14[4] = self;
      objc_msgSend(v12, "scheduleWithBlock:", v14);

      v13 = objc_alloc_init((Class)SFPairedUnlockDailyEvent);
      -[SDUnlockLockManager setDailyMetrics:](self, "setDailyMetrics:", v13);

    }
  }
}

- (void)restartEnableTimerWithTimeout:(double)a3
{
  NSTimer *enableTimer;
  NSTimer *v6;
  NSTimer *v7;

  enableTimer = self->_enableTimer;
  if (enableTimer)
    -[NSTimer invalidate](enableTimer, "invalidate");
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "enableTimerFired:", 0, 0, a3));
  v7 = self->_enableTimer;
  self->_enableTimer = v6;

}

- (void)enableTimerFired:(id)a3
{
  NSTimer *enableTimer;
  uint64_t v5;
  void *v6;
  void *v7;
  NSErrorUserInfoKey v8;
  const __CFString *v9;

  enableTimer = self->_enableTimer;
  self->_enableTimer = 0;

  v5 = SFUnlockErrorDomian;
  v8 = NSLocalizedDescriptionKey;
  v9 = CFSTR("Other side never responded");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, 107, v6));
  -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", v7);

}

- (void)invalidateEnableTimer
{
  NSTimer *enableTimer;
  NSTimer *v4;

  enableTimer = self->_enableTimer;
  if (enableTimer)
  {
    -[NSTimer invalidate](enableTimer, "invalidate");
    v4 = self->_enableTimer;
    self->_enableTimer = 0;

  }
}

- (void)restartLongTermKeyTimer
{
  uint64_t v3;
  NSObject *v4;
  NSObject *longTermKeyTimer;
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restarting long-term key timer", buf, 2u);
  }

  longTermKeyTimer = self->_longTermKeyTimer;
  if (!longTermKeyTimer)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001E43D0;
    v10[3] = &unk_1007146D8;
    v10[4] = self;
    v6 = sub_10019AAD8(0, &_dispatch_main_q, v10);
    v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_longTermKeyTimer;
    self->_longTermKeyTimer = v7;

    dispatch_resume((dispatch_object_t)self->_longTermKeyTimer);
    longTermKeyTimer = self->_longTermKeyTimer;
  }
  v9 = sub_10019AAC0(45.0 + 45.0);
  sub_10019AB78(longTermKeyTimer, v9);
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

- (void)enableUnlockWithDevice:(id)a3 passcode:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SDUnlockLockManager *v15;
  id v16;

  v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001E4594;
  v12[3] = &unk_100714EF0;
  v13 = a4;
  v14 = v8;
  v15 = self;
  v16 = a5;
  v9 = v8;
  v10 = v16;
  v11 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

}

- (void)enableUnlockForcingLTKTransfer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  NSData *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSData *v13;
  NSData *tempLongTermKey;
  NSData *v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  _BOOL8 v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  const __CFString *v28;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v6 = objc_msgSend(v5, "ltksExist");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v8 = objc_msgSend(v7, "ltkFileExists");

  if (self->_tempLongTermKey || (v6 & v8) == 1 && !v3)
    goto LABEL_13;
  -[SDUnlockSessionManager updateSecurityManagerIfNeeded](self, "updateSecurityManagerIfNeeded");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v11, "deleteLongTermKeys");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v13 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "generateLocalLongTermKey:", 3));
  tempLongTermKey = self->_tempLongTermKey;
  self->_tempLongTermKey = v13;

  v9 = self->_tempLongTermKey;
  if (!v9)
  {
LABEL_13:
    v25 = paired_unlock_log(v9, v10);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Using existing LTK", (uint8_t *)&v27, 2u);
    }

    -[SDUnlockLockManager sendSetupRequest:withSessionID:](self, "sendSetupRequest:withSessionID:", 0, -[SDUnlockSessionManager generateSessionID](self, "generateSessionID"));
  }
  else
  {
    v15 = v9;
    v16 = paired_unlock_log(v9, v10);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = CFSTR("NO");
      if (v3)
        v18 = CFSTR("YES");
      v27 = 138412290;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Using updated LTK (forcing: %@)", (uint8_t *)&v27, 0xCu);
    }

    v19 = -[SDUnlockSessionManager inConfigureState](self, "inConfigureState");
    v20 = v19;
    v22 = paired_unlock_log(v19, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v24)
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Exchanging LTKs during setup", (uint8_t *)&v27, 2u);
      }

      -[SDUnlockLockManager sendSetupRequest:withSessionID:](self, "sendSetupRequest:withSessionID:", v15, -[SDUnlockSessionManager generateSessionID](self, "generateSessionID"));
    }
    else
    {
      if (v24)
      {
        LOWORD(v27) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Exchanging LTKs using new service", (uint8_t *)&v27, 2u);
      }

      -[SDUnlockLockManager sendClassALongTermKeyRequest:sessionID:](self, "sendClassALongTermKeyRequest:sessionID:", v15, -[SDUnlockSessionManager generateSessionID](self, "generateSessionID"));
    }

  }
}

- (void)notifyEnableStateWithError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void (**enableHandler)(id, BOOL, id);
  id v9;
  NSData *tempLongTermKey;
  NSString *passcode;
  dispatch_time_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;

  v4 = a3;
  v6 = paired_unlock_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notifying client with error = %@", (uint8_t *)&v16, 0xCu);
  }

  enableHandler = (void (**)(id, BOOL, id))self->_enableHandler;
  if (enableHandler)
  {
    enableHandler[2](enableHandler, v4 == 0, v4);
    v9 = self->_enableHandler;
    self->_enableHandler = 0;

  }
  if (v4)
    -[SDUnlockLockManager disableUnlockPairing](self, "disableUnlockPairing");
  tempLongTermKey = self->_tempLongTermKey;
  self->_tempLongTermKey = 0;

  passcode = self->_passcode;
  self->_passcode = 0;

  self->_canRetrySetup = 1;
  -[SDUnlockSessionManager resetSetupState](self, "resetSetupState");
  -[SDUnlockLockManager invalidateEnableTimer](self, "invalidateEnableTimer");
  if (self->_preventingExitForSetup)
  {
    self->_preventingExitForSetup = 0;
    v12 = dispatch_time(0, 2000000000);
    v14 = SFMainQueue(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    dispatch_after(v12, v15, &stru_10071AF58);

  }
}

- (BOOL)unlockEnabled
{
  BOOL v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDUnlockLockManager;
  v3 = -[SDUnlockSessionManager unlockEnabled](&v8, "unlockEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v5 = objc_msgSend(v4, "unlockSessionAsOriginator:usingEscrow:escrowSecret:", 0, 1, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v6, "clearStateForSession:", v5);

  return (uint64_t)v5 >= 0 && v3;
}

- (void)wristDetectionDisabled:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)disableUnlockPairing
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[16];

  -[SDUnlockLockManager setSentLockedState:](self, "setSentLockedState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  objc_msgSend(v3, "resetEscrowRecord");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager dailyMetricReporter](self, "dailyMetricReporter"));
  objc_msgSend(v4, "invalidate");

  -[SDUnlockLockManager setDailyMetricReporter:](self, "setDailyMetricReporter:", 0);
  v5 = -[SDUnlockLockManager setDailyMetrics:](self, "setDailyMetrics:", 0);
  v7 = paired_unlock_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Stopped tracking daily metrics", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)SDUnlockLockManager;
  -[SDUnlockSessionManager disableUnlockPairing](&v9, "disableUnlockPairing");
}

- (void)resetState
{
  NSDate *sessionStartDate;
  objc_super v4;

  self->_unlockSessionID = -1;
  self->_deviceOffWristForSessionID = -1;
  self->_onWristForCurrentSession = 0;
  sessionStartDate = self->_sessionStartDate;
  self->_sessionStartDate = 0;

  -[SDUnlockLockManager setWaitingForAuthToken:](self, "setWaitingForAuthToken:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SDUnlockLockManager;
  -[SDUnlockSessionManager resetState](&v4, "resetState");
}

- (void)resetLongTermKeyRequest
{
  NSData *tempLongTermKey;
  NSString *requestID;

  tempLongTermKey = self->_tempLongTermKey;
  self->_tempLongTermKey = 0;

  requestID = self->_requestID;
  self->_requestID = 0;

  -[SDUnlockLockManager allowExiting](self, "allowExiting");
}

- (BOOL)localDeviceLocked
{
  void *v2;
  unsigned __int8 v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  if ((objc_msgSend(v2, "deviceKeyBagLocked") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    v3 = objc_msgSend(v4, "deviceKeyBagLocking");

  }
  return v3;
}

- (BOOL)lostModeEnabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;

  v2 = SFLostMode(self, a2);
  v4 = paired_unlock_log(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if ((_DWORD)v2)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lostModeEnabled = %@", (uint8_t *)&v8, 0xCu);
  }

  return v2;
}

- (BOOL)inPosition
{
  return 0;
}

- (void)getWristAndMotionStateWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager metricDates](self, "metricDates"));
    objc_msgSend(v5, "setMotionCheckStarted:", v4);

    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
}

- (void)preventExiting
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v2, "addPreventExitForLocaleReason:", CFSTR("SDUnlockLTKTransferPreventExitReason"));

}

- (void)allowExiting
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v2, "removePreventExitForLocaleReason:", CFSTR("SDUnlockLTKTransferPreventExitReason"));

}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5
{
  int v5;
  id v8;
  SDUnlockReset *v9;
  SDUnlockDisable *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  if (v5 <= 100)
  {
    switch(v5)
    {
      case 1:
        v9 = -[SDUnlockReset initWithData:]([SDUnlockReset alloc], "initWithData:", v8);
        -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v9);

        -[SDUnlockSessionManager resetAndClearState](self, "resetAndClearState");
        break;
      case 2:
        v10 = -[SDUnlockDisable initWithData:]([SDUnlockDisable alloc], "initWithData:", v8);
        -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v10);

        -[SDUnlockLockManager disableUnlockPairing](self, "disableUnlockPairing");
        break;
      case 3:
        -[SDUnlockLockManager handleUnlockStateRequest:](self, "handleUnlockStateRequest:", v8);
        break;
    }
  }
  else
  {
    switch(v5)
    {
      case 'e':
        -[SDUnlockLockManager invalidateEnableTimer](self, "invalidateEnableTimer");
        -[SDUnlockLockManager handleSetupSessionCreated:](self, "handleSetupSessionCreated:", v8);
        break;
      case 'f':
        -[SDUnlockLockManager invalidateEnableTimer](self, "invalidateEnableTimer");
        -[SDUnlockLockManager handleSetupCreateRecord:](self, "handleSetupCreateRecord:", v8);
        break;
      case 'g':
        -[SDUnlockLockManager handleSessionKeyExchangeRequest:](self, "handleSessionKeyExchangeRequest:", v8);
        break;
      case 'h':
        -[SDUnlockSessionManager invalidateUnlockTimer](self, "invalidateUnlockTimer");
        -[SDUnlockLockManager handleSessionAuthToken:](self, "handleSessionAuthToken:", v8);
        break;
      case 'i':
        -[SDUnlockLockManager handleStashKeyExchangeRequest:](self, "handleStashKeyExchangeRequest:", v8);
        break;
      case 'j':
        -[SDUnlockLockManager handleStashToken:](self, "handleStashToken:", v8);
        break;
      case 'k':
        -[SDUnlockLockManager handleLongTermKeyResponse:](self, "handleLongTermKeyResponse:", v8);
        break;
      case 'l':
        -[SDUnlockLockManager handleStartLTK:](self, "handleStartLTK:", v8);
        break;
      case 'm':
        -[SDUnlockLockManager invalidateEnableTimer](self, "invalidateEnableTimer");
        -[SDUnlockLockManager handleClassALongTermKeyResponse:](self, "handleClassALongTermKeyResponse:", v8);
        break;
      case 'o':
        -[SDUnlockLockManager handleRelockRequest](self, "handleRelockRequest");
        break;
      default:
        break;
    }
  }

}

- (void)idsControllerSpaceDidBecomeAvailable:(id)a3
{
  id v4;

  if (-[SDUnlockLockManager unlockEnabled](self, "unlockEnabled", a3))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    -[SDUnlockLockManager sendDeviceLockStateChanged:](self, "sendDeviceLockStateChanged:", objc_msgSend(v4, "deviceKeyBagUnlocked"));

  }
}

- (void)handleStartLTK:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = paired_unlock_log(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received SDUnlockStartLTKTransfer", v10, 2u);
  }

  v6 = -[SDUnlockLockManager preventExiting](self, "preventExiting");
  if (self->_tempLongTermKey)
  {
    v8 = paired_unlock_log(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1001E845C();

  }
  else
  {
    -[SDUnlockSessionManager updateSecurityManager](self, "updateSecurityManager");
    -[SDUnlockLockManager handleConfigurationState](self, "handleConfigurationState");
  }
}

- (void)handleLongTermKeyResponse:(id)a3
{
  id v4;
  SDUnlockLongTermKeyResponse *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL8 v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = -[SDUnlockLongTermKeyResponse initWithData:]([SDUnlockLongTermKeyResponse alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = -[SDUnlockLongTermKeyResponse hasRequestID](v5, "hasRequestID");
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyResponse requestID](v5, "requestID"));
    v9 = objc_msgSend(v8, "isEqualToString:", self->_requestID);

    if (v9)
    {
      v10 = -[SDUnlockLongTermKeyResponse hasKeyFailed](v5, "hasKeyFailed");
      if (v10)
      {
        v12 = paired_unlock_log(v10, v11);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_1001E8488();
      }
      else
      {
        v16 = -[SDUnlockLongTermKeyResponse hasLongTermKey](v5, "hasLongTermKey");
        if (v16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyResponse longTermKey](v5, "longTermKey"));
          v19 = -[SDUnlockLockManager updateLongTermKeys:](self, "updateLongTermKeys:", v18);

          if ((v19 & 1) != 0)
          {
LABEL_16:
            -[SDUnlockLockManager invalidateLongTermKeyTimer](self, "invalidateLongTermKeyTimer");
            -[SDUnlockLockManager resetLongTermKeyRequest](self, "resetLongTermKeyRequest");
            goto LABEL_17;
          }
          v22 = paired_unlock_log(v20, v21);
          v13 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            sub_1001E84B4();
        }
        else
        {
          v23 = paired_unlock_log(v16, v17);
          v13 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            sub_1001E84E0(v5);
        }
      }

      goto LABEL_16;
    }
  }
  v14 = paired_unlock_log(v6, v7);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1001E8580(v5);

LABEL_17:
}

- (void)handleClassALongTermKeyResponse:(id)a3
{
  id v4;
  SDUnlockClassALongTermKeyResponse *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;

  v4 = a3;
  v5 = -[SDUnlockClassALongTermKeyResponse initWithData:]([SDUnlockClassALongTermKeyResponse alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (-[SDUnlockClassALongTermKeyResponse hasErrorCode](v5, "hasErrorCode"))
  {
    v6 = -[SDUnlockClassALongTermKeyResponse hasErrorCode](v5, "hasErrorCode");
    if ((_DWORD)v6)
    {
      v6 = -[SDUnlockClassALongTermKeyResponse errorCode](v5, "errorCode");
      v8 = v6;
    }
    else
    {
      v8 = 103;
    }
    v15 = paired_unlock_log(v6, v7);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1001E8654(v8, v16, v17, v18, v19, v20, v21, v22);

    v23 = SFUnlockErrorDomian;
    v24 = v8;
LABEL_17:
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v23, v24, 0));
    -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", v29);

    goto LABEL_18;
  }
  v9 = -[SDUnlockClassALongTermKeyResponse hasLongTermKey](v5, "hasLongTermKey");
  if (!v9)
  {
    v25 = paired_unlock_log(v9, v10);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_1001E86E4(v5);

    v23 = SFUnlockErrorDomian;
    v24 = 103;
    goto LABEL_17;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockClassALongTermKeyResponse longTermKey](v5, "longTermKey"));
  v12 = -[SDUnlockLockManager updateLongTermKeys:](self, "updateLongTermKeys:", v11);

  if (!v12)
  {
    v27 = paired_unlock_log(v13, v14);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1001E86B8();

    v23 = SFUnlockErrorDomian;
    v24 = 101;
    goto LABEL_17;
  }
  -[SDUnlockLockManager sendSetupRequest:withSessionID:](self, "sendSetupRequest:withSessionID:", 0, -[SDUnlockClassALongTermKeyResponse sessionID](v5, "sessionID"));
LABEL_18:

}

- (BOOL)updateLongTermKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signRemoteKey:withLocalKey:localKeyClass:remoteKeyClass:", v4, self->_tempLongTermKey, 3, 1));

  v7 = v6 != 0;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    objc_msgSend(v8, "updateLocalLongTermKey:remoteLongTermKey:", self->_tempLongTermKey, v6);

  }
  return v7;
}

- (void)handleSetupSessionCreated:(id)a3
{
  id v4;
  SDUnlockSetupSessionCreated *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v4 = a3;
  v5 = -[SDUnlockSetupSessionCreated initWithData:]([SDUnlockSetupSessionCreated alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (v5 && !-[SDUnlockSetupSessionCreated hasErrorCode](v5, "hasErrorCode"))
  {
    if (-[SDUnlockSetupSessionCreated hasLongTermKey](v5, "hasLongTermKey")
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupSessionCreated longTermKey](v5, "longTermKey")),
          v14 = -[SDUnlockLockManager updateLongTermKeys:](self, "updateLongTermKeys:", v13),
          v13,
          !v14))
    {
      v26 = paired_unlock_log(v15, v16);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1001E8814();

      v28 = SFUnlockErrorDomian;
      v31 = NSLocalizedDescriptionKey;
      v32 = CFSTR("Could not sign remote key");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v28, 101, v29));
      -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", v30);

      -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
    }
    else
    {
      -[SDUnlockLockManager handleEscrowSessionRequest:](self, "handleEscrowSessionRequest:", v5);
    }
  }
  else if (self->_canRetrySetup
         && -[SDUnlockSetupSessionCreated hasErrorCode](v5, "hasErrorCode")
         && ((v6 = (id)-[SDUnlockSetupSessionCreated errorCode](v5, "errorCode"), (_DWORD)v6 == 188)
          || (v6 = (id)-[SDUnlockSetupSessionCreated errorCode](v5, "errorCode"), (_DWORD)v6 == 187)))
  {
    self->_canRetrySetup = 0;
    v8 = paired_unlock_log(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1001E87E8();

    -[SDUnlockLockManager enableUnlockForcingLTKTransfer:](self, "enableUnlockForcingLTKTransfer:", 1);
  }
  else
  {
    v10 = -[SDUnlockSetupSessionCreated hasErrorCode](v5, "hasErrorCode");
    if ((_DWORD)v10)
    {
      v10 = -[SDUnlockSetupSessionCreated errorCode](v5, "errorCode");
      v12 = v10;
    }
    else
    {
      v12 = 103;
    }
    v17 = paired_unlock_log(v10, v11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1001E8784(v12, v18, v19, v20, v21, v22, v23, v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFUnlockErrorDomian, v12, 0));
    -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", v25);

  }
}

- (void)handleEscrowSessionRequest:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSErrorUserInfoKey v36;
  const __CFString *v37;
  NSErrorUserInfoKey v38;
  const __CFString *v39;
  NSErrorUserInfoKey v40;
  const __CFString *v41;

  v4 = a3;
  v5 = objc_msgSend(v4, "hasToken");
  if (!(_DWORD)v5)
    goto LABEL_8;
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
    v21 = paired_unlock_log(v5, v6);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1001E8840(v4, self, v22);

    v23 = SFUnlockErrorDomian;
    v36 = NSLocalizedDescriptionKey;
    v37 = CFSTR("Missing information to created session");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v25 = v23;
    v26 = 103;
    goto LABEL_11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  -[SDUnlockSessionManager setSetupAuthSession:](self, "setSetupAuthSession:", objc_msgSend(v12, "escrowCreationSessionAsOriginator:errorCode:", 0, 0));

  v13 = -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession");
  if (v13 < 0)
  {
    v28 = paired_unlock_log(v13, v14);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1001E89BC();

    v30 = SFUnlockErrorDomian;
    v38 = NSLocalizedDescriptionKey;
    v39 = CFSTR("Could not create escrow session");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    v25 = v30;
    v26 = 101;
LABEL_11:
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v25, v26, v24));
    -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", v27);

    -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
    goto LABEL_12;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  v16 = -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "token"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stepWithAuthSession:data:", v16, v17));

  if (v18)
  {
    -[SDUnlockLockManager sendCreateEscrowSecretWithStepData:sessionID:](self, "sendCreateEscrowSecretWithStepData:sessionID:", v18, objc_msgSend(v4, "sessionID"));
  }
  else
  {
    v31 = paired_unlock_log(v19, v20);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1001E8990();

    v33 = SFUnlockErrorDomian;
    v40 = NSLocalizedDescriptionKey;
    v41 = CFSTR("Could not step escrow session");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, 101, v34));
    -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", v35);

    -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
  }

LABEL_12:
}

- (void)handleSetupCreateRecord:(id)a3
{
  id v4;
  SDUnlockSetupCreateRecord *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  const __CFString **v29;
  NSErrorUserInfoKey *v30;
  void *v31;
  void *v32;
  NSErrorUserInfoKey v33;
  const __CFString *v34;
  NSErrorUserInfoKey v35;
  const __CFString *v36;
  NSErrorUserInfoKey v37;
  const __CFString *v38;

  v4 = a3;
  v5 = -[SDUnlockSetupCreateRecord initWithData:]([SDUnlockSetupCreateRecord alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  if (v5
    && -[SDUnlockSetupCreateRecord hasToken](v5, "hasToken")
    && !-[SDUnlockSetupCreateRecord hasErrorCode](v5, "hasErrorCode"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    v19 = -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateRecord token](v5, "token"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stepWithAuthSession:data:authStep:", v19, v20, 1));

    if (v21)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
      v25 = objc_msgSend(v24, "setupWithAuthSession:passcode:", -[SDUnlockSessionManager setupAuthSession](self, "setupAuthSession"), self->_passcode);

      if (v25)
      {
        -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", 0);
        -[SDUnlockSessionManager enableUnlockPairing](self, "enableUnlockPairing");
        -[SDUnlockLockManager scheduleDailyMetricReporterIfNeeded](self, "scheduleDailyMetricReporterIfNeeded");
LABEL_26:

        goto LABEL_17;
      }
      v28 = SFUnlockErrorDomian;
      v37 = NSLocalizedDescriptionKey;
      v38 = CFSTR("Could not step escrow record");
      v29 = &v38;
      v30 = &v37;
    }
    else
    {
      v26 = paired_unlock_log(v22, v23);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1001E8A74();

      v28 = SFUnlockErrorDomian;
      v35 = NSLocalizedDescriptionKey;
      v36 = CFSTR("Could not complete final step");
      v29 = &v36;
      v30 = &v35;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v30, 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v28, 101, v31));
    -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", v32);

    -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
    goto LABEL_26;
  }
  if (self->_canRetrySetup
    && -[SDUnlockSetupCreateRecord hasErrorCode](v5, "hasErrorCode")
    && ((v6 = (id)-[SDUnlockSetupCreateRecord errorCode](v5, "errorCode"), (_DWORD)v6 == 188)
     || (v6 = (id)-[SDUnlockSetupCreateRecord errorCode](v5, "errorCode"), (_DWORD)v6 == 187)))
  {
    self->_canRetrySetup = 0;
    v8 = paired_unlock_log(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1001E8A48();

    -[SDUnlockLockManager enableUnlockForcingLTKTransfer:](self, "enableUnlockForcingLTKTransfer:", 1);
  }
  else
  {
    v10 = (id)-[SDUnlockSetupCreateRecord hasErrorCode](v5, "hasErrorCode");
    if ((_DWORD)v10)
    {
      v10 = (id)-[SDUnlockSetupCreateRecord errorCode](v5, "errorCode");
      v12 = v10;
    }
    else
    {
      v12 = 103;
    }
    v13 = paired_unlock_log(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1001E89E8();

    v15 = SFUnlockErrorDomian;
    v33 = NSLocalizedDescriptionKey;
    v34 = CFSTR("Error occured on the lock side");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, v12, v16));
    -[SDUnlockLockManager notifyEnableStateWithError:](self, "notifyEnableStateWithError:", v17);

    -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
  }
LABEL_17:

}

- (void)handleSessionKeyExchangeRequest:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  void *v9;
  SDUnlockSessionKeyExchangeRequest *v10;
  _BOOL8 v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  SDUnlockLockManager *v21;
  id v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSDate *v35;
  uint8_t v36[16];
  _QWORD v37[5];
  SDUnlockSessionKeyExchangeRequest *v38;

  v4 = a3;
  v5 = -[SDUnlockLockManager unlockEnabled](self, "unlockEnabled");
  if (v5)
  {
    v7 = -[SDUnlockLockManager localDeviceLocked](self, "localDeviceLocked");
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockManager dailyMetrics](self, "dailyMetrics"));
      objc_msgSend(v9, "setTotalAttempts:", (char *)objc_msgSend(v9, "totalAttempts") + 1);

      v10 = -[SDUnlockSessionKeyExchangeRequest initWithData:]([SDUnlockSessionKeyExchangeRequest alloc], "initWithData:", v4);
      -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v10);
      if (-[SDUnlockSessionKeyExchangeRequest hasSessionID](v10, "hasSessionID")
        && self->_unlockSessionID != -[SDUnlockSessionKeyExchangeRequest sessionID](v10, "sessionID"))
      {
        v24 = -[SDUnlockLockManager lostModeEnabled](self, "lostModeEnabled");
        if (!v24)
        {
          self->_unlockSessionID = -[SDUnlockSessionKeyExchangeRequest sessionID](v10, "sessionID");
          v35 = objc_opt_new(NSDate);
          -[SDUnlockLockManager setSessionStartDate:](self, "setSessionStartDate:", v35);

          -[SDUnlockLockManager setOnWristForCurrentSession:](self, "setOnWristForCurrentSession:", -[SDUnlockLockManager inPosition](self, "inPosition"));
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1001E64C4;
          v37[3] = &unk_10071AF80;
          v37[4] = self;
          v38 = v10;
          -[SDUnlockLockManager getWristAndMotionStateWithCompletionHandler:](self, "getWristAndMotionStateWithCompletionHandler:", v37);

          goto LABEL_24;
        }
        v26 = paired_unlock_log(v24, v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_1001E8ACC(v27, v28, v29, v30, v31, v32, v33, v34);

        v22 = (id)-[SDUnlockSessionKeyExchangeRequest sessionID](v10, "sessionID");
        v21 = self;
        v23 = 4;
      }
      else
      {
        v11 = -[SDUnlockSessionKeyExchangeRequest hasSessionID](v10, "hasSessionID");
        v12 = v11;
        v14 = paired_unlock_log(v11, v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        v16 = v15;
        if (v12)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v36 = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received request for session in progress", v36, 2u);
          }

          goto LABEL_24;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_1001E8AA0();

        v21 = self;
        v22 = 0;
        v23 = 8;
      }
      -[SDUnlockSessionManager sendResetMessage:reason:](v21, "sendResetMessage:reason:", v22, v23);
LABEL_24:

      goto LABEL_25;
    }
    v19 = paired_unlock_log(v7, v8);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Device already unlocked", v36, 2u);
    }

    -[SDUnlockLockManager sendDeviceLockStateChanged:](self, "sendDeviceLockStateChanged:", 1);
  }
  else
  {
    v17 = paired_unlock_log(v5, v6);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1001E8B3C();

    -[SDUnlockSessionManager sendDisableMessage](self, "sendDisableMessage");
  }
LABEL_25:

}

- (void)handleSessionAuthToken:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  SDUnlockSessionAuthToken *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  SDUnlockLockManager *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL8 v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint8_t v33[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = -[SDUnlockLockManager localDeviceLocked](self, "localDeviceLocked");
  if (v5)
  {
    v7 = -[SDUnlockSessionAuthToken initWithData:]([SDUnlockSessionAuthToken alloc], "initWithData:", v4);
    -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v7);
    v8 = -[SDUnlockLockManager deviceOffWristForSessionID](self, "deviceOffWristForSessionID");
    v9 = -[SDUnlockLockManager unlockSessionID](self, "unlockSessionID");
    if (v8 == v9)
    {
      v11 = paired_unlock_log(v9, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_1001E8BC0();

      v13 = (id)-[SDUnlockSessionAuthToken sessionID](v7, "sessionID");
      v14 = self;
      v15 = 13;
    }
    else
    {
      v18 = -[SDUnlockLockManager inPosition](self, "inPosition");
      if (v18)
      {
        v18 = -[SDUnlockLockManager waitingForAuthToken](self, "waitingForAuthToken");
        if (v18)
        {
          v18 = -[SDUnlockSessionAuthToken hasAuthToken](v7, "hasAuthToken");
          if (v18)
          {
            -[SDUnlockLockManager setLastUnlockedByPairedUnlock:](self, "setLastUnlockedByPairedUnlock:", 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
            v21 = -[SDUnlockSessionManager unlockAuthSession](self, "unlockAuthSession");
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionAuthToken authToken](v7, "authToken"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stepWithAuthSession:data:authStep:", v21, v22, 1));

            v24 = (id)-[SDUnlockSessionAuthToken sessionID](v7, "sessionID");
            if (v23)
            {
              v25 = -[SDUnlockLockManager sendSessionUnlockConfirmation:sessionID:](self, "sendSessionUnlockConfirmation:sessionID:", 1, v24);
              v27 = paired_unlock_log(v25, v26);
              v28 = objc_claimAutoreleasedReturnValue(v27);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "UNLOCK SUCCEEDED", buf, 2u);
              }

              v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
              -[SDUnlockLockManager setLastPairedUnlockDate:](self, "setLastPairedUnlockDate:", v29);

            }
            else
            {
              -[SDUnlockLockManager sendSessionUnlockConfirmation:sessionID:](self, "sendSessionUnlockConfirmation:sessionID:", 0, v24);
              -[SDUnlockLockManager setLastUnlockedByPairedUnlock:](self, "setLastUnlockedByPairedUnlock:", 0);
            }
            -[SDUnlockLockManager resetState](self, "resetState");

            goto LABEL_27;
          }
        }
      }
      v30 = paired_unlock_log(v18, v19);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        sub_1001E8BEC(self);

      if (-[SDUnlockLockManager inPosition](self, "inPosition"))
      {
        if (-[SDUnlockLockManager waitingForAuthToken](self, "waitingForAuthToken"))
        {
          if (-[SDUnlockSessionAuthToken hasAuthToken](v7, "hasAuthToken"))
            v32 = 0;
          else
            v32 = 11;
        }
        else
        {
          v32 = 10;
        }
      }
      else
      {
        v32 = 12;
      }
      v13 = (id)-[SDUnlockSessionAuthToken sessionID](v7, "sessionID");
      v14 = self;
      v15 = v32;
    }
    -[SDUnlockSessionManager sendResetMessage:reason:](v14, "sendResetMessage:reason:", v13, v15);
LABEL_27:

    goto LABEL_28;
  }
  v16 = paired_unlock_log(v5, v6);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ignoring auth token, device unlocked", v33, 2u);
  }

  -[SDUnlockLockManager sendDeviceLockStateChanged:](self, "sendDeviceLockStateChanged:", 1);
LABEL_28:

}

- (void)handleStashKeyExchangeRequest:(id)a3
{
  id v4;
  SDUnlockStashKeyExchangeRequest *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;

  v4 = a3;
  v5 = -[SDUnlockStashKeyExchangeRequest initWithData:]([SDUnlockStashKeyExchangeRequest alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v5);
  v6 = -[SDUnlockStashKeyExchangeRequest hasKey](v5, "hasKey");
  if (!v6)
  {
    v13 = paired_unlock_log(v6, v7);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1001E8CB8();

    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
  -[SDUnlockSessionManager setStashBagSession:](self, "setStashBagSession:", objc_msgSend(v8, "stashBagSessionAsOriginator:escrowSecret:manifest:", 0, 0, 0));

  if (-[SDUnlockSessionManager stashBagSession](self, "stashBagSession") < 0
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager")),
        v10 = -[SDUnlockSessionManager stashBagSession](self, "stashBagSession"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashKeyExchangeRequest key](v5, "key")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stepWithAuthSession:data:", v10, v11)),
        v11,
        v9,
        !v12))
  {
LABEL_8:
    -[SDUnlockLockManager sendStashKeyExchangeResponse:sessionID:errorCode:](self, "sendStashKeyExchangeResponse:sessionID:errorCode:", 0, -[SDUnlockStashKeyExchangeRequest sessionID](v5, "sessionID"), 101);
    goto LABEL_9;
  }
  -[SDUnlockLockManager sendStashKeyExchangeResponse:sessionID:errorCode:](self, "sendStashKeyExchangeResponse:sessionID:errorCode:", v12, -[SDUnlockStashKeyExchangeRequest sessionID](v5, "sessionID"), 0);

LABEL_9:
}

- (void)handleStashToken:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  SDUnlockStashToken *v10;

  v4 = a3;
  v10 = -[SDUnlockStashToken initWithData:]([SDUnlockStashToken alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v10);
  if (-[SDUnlockStashToken hasStashToken](v10, "hasStashToken"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager securityManager](self, "securityManager"));
    v6 = -[SDUnlockSessionManager stashBagSession](self, "stashBagSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashToken stashToken](v10, "stashToken"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stepWithAuthSession:data:authStep:", v6, v7, 1));

    v9 = v8 != 0;
  }
  else
  {
    v9 = 0;
  }
  -[SDUnlockLockManager sendStashConfirmation:sessionID:](self, "sendStashConfirmation:sessionID:", v9, -[SDUnlockStashToken sessionID](v10, "sessionID"));
  -[SDUnlockSessionManager resetStashState](self, "resetStashState");

}

- (void)handleRelockRequest
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (self->_unlockSessionID)
    self = (SDUnlockLockManager *)-[SDUnlockSessionManager resetAndClearState](self, "resetAndClearState");
  v2 = paired_unlock_log(self, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Locking device", v4, 2u);
  }

  sub_100195904();
}

- (void)handleUnlockStateRequest:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  SDUnlockStateRequest *v8;

  v4 = a3;
  v8 = -[SDUnlockStateRequest initWithData:]([SDUnlockStateRequest alloc], "initWithData:", v4);

  -[SDUnlockSessionManager logProtoBufReceived:](self, "logProtoBufReceived:", v8);
  v5 = -[SDUnlockLockManager unlockEnabled](self, "unlockEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v7 = objc_msgSend(v6, "deviceKeyBagDisabled") ^ 1;

  -[SDUnlockLockManager sendStateResponseWithUnlockEnabled:passcodeEnabled:](self, "sendStateResponseWithUnlockEnabled:passcodeEnabled:", v5, v7);
}

- (void)sendDeviceLockStateChanged:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  SDUnlockLockStateUpdated *v7;

  v3 = a3;
  v7 = objc_alloc_init(SDUnlockLockStateUpdated);
  -[SDUnlockLockStateUpdated setVersion:](v7, "setVersion:", 1);
  -[SDUnlockLockStateUpdated setUnlocked:](v7, "setUnlocked:", v3);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLockStateUpdated data](v7, "data"));
  objc_msgSend(v5, "sendProtocolBufferData:withType:timeout:option:queueOneID:errorHandler:", v6, 1001, 0, 1, CFSTR("com.apple.sharingd.lock-state"), &stru_10071AFA0);

}

- (void)sendLongTermKeyRequest:(id)a3 requestID:(id)a4
{
  id v6;
  id v7;
  SDUnlockLongTermKeyRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SDUnlockLongTermKeyRequest);
  -[SDUnlockLongTermKeyRequest setVersion:](v8, "setVersion:", 1);
  -[SDUnlockLongTermKeyRequest setLongTermKey:](v8, "setLongTermKey:", v7);

  -[SDUnlockLongTermKeyRequest setRequestID:](v8, "setRequestID:", v6);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockLongTermKeyRequest data](v8, "data"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001E7060;
  v12[3] = &unk_1007147C8;
  v12[4] = self;
  objc_msgSend(v9, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v10, 1008, v11, 0, v12);

  -[SDUnlockLockManager restartLongTermKeyTimer](self, "restartLongTermKeyTimer");
}

- (void)sendClassALongTermKeyRequest:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SDUnlockClassALongTermKeyRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SDUnlockClassALongTermKeyRequest);
  -[SDUnlockClassALongTermKeyRequest setVersion:](v7, "setVersion:", 1);
  -[SDUnlockClassALongTermKeyRequest setLongTermKey:](v7, "setLongTermKey:", v6);

  -[SDUnlockClassALongTermKeyRequest setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockClassALongTermKeyRequest data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[1] = 3221225472;
  v11[2] = sub_1001E71FC;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  v11[0] = _NSConcreteStackBlock;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:dataClass:queueOneID:errorHandler:", v9, 1009, v10, 0, 2, 0, v11);

  -[SDUnlockLockManager restartEnableTimerWithTimeout:](self, "restartEnableTimerWithTimeout:", 45.0 * 2.0 + 5.0);
}

- (void)sendSetupRequest:(id)a3 withSessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SDUnlockSetupRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SDUnlockSetupRequest);
  -[SDUnlockSetupRequest setVersion:](v7, "setVersion:", 1);
  -[SDUnlockSetupRequest setSessionID:](v7, "setSessionID:", v4);
  if (v6)
    -[SDUnlockSetupRequest setLongTermKey:](v7, "setLongTermKey:", v6);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupRequest data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E744C;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v9, 1002, v10, 0, v11);

  -[SDUnlockLockManager restartEnableTimerWithTimeout:](self, "restartEnableTimerWithTimeout:", 45.0);
}

- (void)sendCreateEscrowSecretWithStepData:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SDUnlockSetupCreateSecret *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SDUnlockSetupCreateSecret);
  -[SDUnlockSetupCreateSecret setVersion:](v7, "setVersion:", 1);
  -[SDUnlockSetupCreateSecret setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockSetupCreateSecret setToken:](v7, "setToken:", v6);

  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSetupCreateSecret data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E769C;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v9, 1003, v10, 0, v11);

  -[SDUnlockLockManager restartEnableTimerWithTimeout:](self, "restartEnableTimerWithTimeout:", 45.0);
}

- (void)sendKeyExchangeResponse:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  SDUnlockSessionKeyExchangeResponse *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(SDUnlockSessionKeyExchangeResponse);
  -[SDUnlockSessionKeyExchangeResponse setVersion:](v7, "setVersion:", 1);
  -[SDUnlockSessionKeyExchangeResponse setSessionID:](v7, "setSessionID:", v4);
  if (v6)
    -[SDUnlockSessionKeyExchangeResponse setKey:](v7, "setKey:", v6);
  else
    -[SDUnlockSessionKeyExchangeResponse setKeyFailed:](v7, "setKeyFailed:", 1);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionKeyExchangeResponse data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E7910;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v9, 1004, v10, 1, v11);

  -[SDUnlockSessionManager restartUnlockTimer:](self, "restartUnlockTimer:", sub_10019AAC0((double)65));
}

- (void)sendSessionUnlockConfirmation:(BOOL)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  SDUnlockSessionConfirmation *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v7 = objc_alloc_init(SDUnlockSessionConfirmation);
  -[SDUnlockSessionConfirmation setVersion:](v7, "setVersion:", 1);
  -[SDUnlockSessionConfirmation setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockSessionConfirmation setSuccess:](v7, "setSuccess:", v5);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionConfirmation data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E7A2C;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v9, 1005, v10, 1, v11);

}

- (void)sendStashKeyExchangeResponse:(id)a3 sessionID:(unsigned int)a4 errorCode:(int64_t)a5
{
  uint64_t v6;
  id v8;
  SDUnlockStashKeyExchangeResponse *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = objc_alloc_init(SDUnlockStashKeyExchangeResponse);
  -[SDUnlockStashKeyExchangeResponse setVersion:](v9, "setVersion:", 1);
  -[SDUnlockStashKeyExchangeResponse setSessionID:](v9, "setSessionID:", v6);
  if (v8)
    -[SDUnlockStashKeyExchangeResponse setKey:](v9, "setKey:", v8);
  else
    -[SDUnlockStashKeyExchangeResponse setErrorCode:](v9, "setErrorCode:", a5);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashKeyExchangeResponse data](v9, "data"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001E7B64;
  v13[3] = &unk_1007147C8;
  v13[4] = self;
  objc_msgSend(v10, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v11, 1006, v12, 1, v13);

}

- (void)sendStashConfirmation:(BOOL)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;
  SDUnlockStashConfirmation *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v7 = objc_alloc_init(SDUnlockStashConfirmation);
  -[SDUnlockStashConfirmation setVersion:](v7, "setVersion:", 1);
  -[SDUnlockStashConfirmation setSessionID:](v7, "setSessionID:", v4);
  -[SDUnlockStashConfirmation setSuccess:](v7, "setSuccess:", v5);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStashConfirmation data](v7, "data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 45.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E7C80;
  v11[3] = &unk_1007147C8;
  v11[4] = self;
  objc_msgSend(v8, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v9, 1007, v10, 1, v11);

}

- (void)sendStateResponseWithUnlockEnabled:(BOOL)a3 passcodeEnabled:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  SDUnlockStateResponse *v10;

  v4 = a4;
  v5 = a3;
  v10 = objc_alloc_init(SDUnlockStateResponse);
  -[SDUnlockStateResponse setVersion:](v10, "setVersion:", 1);
  -[SDUnlockStateResponse setUnlockEnabled:](v10, "setUnlockEnabled:", v5);
  -[SDUnlockStateResponse setPasscodeEnabled:](v10, "setPasscodeEnabled:", v4);
  -[SDUnlockSessionManager logProtoBufSend:](self, "logProtoBufSend:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockSessionManager idsController](self, "idsController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockStateResponse data](v10, "data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 10.0));
  objc_msgSend(v7, "sendProtocolBufferData:withType:timeout:option:errorHandler:", v8, 4, v9, 1, &stru_10071AFC0);

}

- (NSDate)wristOnDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWristOnDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)lastUnlockedByPairedUnlock
{
  return self->_lastUnlockedByPairedUnlock;
}

- (void)setLastUnlockedByPairedUnlock:(BOOL)a3
{
  self->_lastUnlockedByPairedUnlock = a3;
}

- (void)setInPosition:(BOOL)a3
{
  self->_inPosition = a3;
}

- (BOOL)canRetrySetup
{
  return self->_canRetrySetup;
}

- (void)setCanRetrySetup:(BOOL)a3
{
  self->_canRetrySetup = a3;
}

- (NSString)requestID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)sentLockedState
{
  return self->_sentLockedState;
}

- (void)setSentLockedState:(BOOL)a3
{
  self->_sentLockedState = a3;
}

- (NSTimer)enableTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEnableTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSData)tempLongTermKey
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTempLongTermKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)checkingWristState
{
  return self->_checkingWristState;
}

- (void)setCheckingWristState:(BOOL)a3
{
  self->_checkingWristState = a3;
}

- (BOOL)waitingForAuthToken
{
  return self->_waitingForAuthToken;
}

- (void)setWaitingForAuthToken:(BOOL)a3
{
  self->_waitingForAuthToken = a3;
}

- (NSDate)sessionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSessionStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)passcode
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (int64_t)unlockSessionID
{
  return self->_unlockSessionID;
}

- (void)setUnlockSessionID:(int64_t)a3
{
  self->_unlockSessionID = a3;
}

- (BOOL)preventingExitForSetup
{
  return self->_preventingExitForSetup;
}

- (void)setPreventingExitForSetup:(BOOL)a3
{
  self->_preventingExitForSetup = a3;
}

- (BOOL)onWristForCurrentSession
{
  return self->_onWristForCurrentSession;
}

- (void)setOnWristForCurrentSession:(BOOL)a3
{
  self->_onWristForCurrentSession = a3;
}

- (BOOL)checkingWristAndMotionState
{
  return self->_checkingWristAndMotionState;
}

- (void)setCheckingWristAndMotionState:(BOOL)a3
{
  self->_checkingWristAndMotionState = a3;
}

- (OS_dispatch_source)longTermKeyTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLongTermKeyTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDate)lastPairedUnlockDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastPairedUnlockDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (int64_t)deviceOffWristForSessionID
{
  return self->_deviceOffWristForSessionID;
}

- (void)setDeviceOffWristForSessionID:(int64_t)a3
{
  self->_deviceOffWristForSessionID = a3;
}

- (OS_dispatch_source)wristAndMotionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 160, 1);
}

- (void)setWristAndMotionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (OS_dispatch_semaphore)positionSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPositionSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (SDUnlockMotionDetector)motionDetector
{
  return (SDUnlockMotionDetector *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMotionDetector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (SDUnlockWakeGestureRecord)lastWakeGestureRecord
{
  return (SDUnlockWakeGestureRecord *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastWakeGestureRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (SFPairedUnlockDailyEvent)dailyMetrics
{
  return (SFPairedUnlockDailyEvent *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDailyMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (SDUnlockLockMetricDates)metricDates
{
  return (SDUnlockLockMetricDates *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMetricDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSBackgroundActivityScheduler)dailyMetricReporter
{
  return (NSBackgroundActivityScheduler *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDailyMetricReporter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (id)enableHandler
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setEnableHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 216);
}

- (id)wristAndMotionStateHandler
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setWristAndMotionStateHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wristAndMotionStateHandler, 0);
  objc_storeStrong(&self->_enableHandler, 0);
  objc_storeStrong((id *)&self->_dailyMetricReporter, 0);
  objc_storeStrong((id *)&self->_metricDates, 0);
  objc_storeStrong((id *)&self->_dailyMetrics, 0);
  objc_storeStrong((id *)&self->_lastWakeGestureRecord, 0);
  objc_storeStrong((id *)&self->_motionDetector, 0);
  objc_storeStrong((id *)&self->_positionSemaphore, 0);
  objc_storeStrong((id *)&self->_wristAndMotionTimer, 0);
  objc_storeStrong((id *)&self->_lastPairedUnlockDate, 0);
  objc_storeStrong((id *)&self->_longTermKeyTimer, 0);
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_tempLongTermKey, 0);
  objc_storeStrong((id *)&self->_enableTimer, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_wristOnDate, 0);
}

@end
