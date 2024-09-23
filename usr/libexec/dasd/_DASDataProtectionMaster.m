@implementation _DASDataProtectionMaster

- (BOOL)isDataAvailableFor:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *stateQueue;
  BOOL v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (self->_deviceFormatedForContentProtection)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004E00;
    block[3] = &unk_10015D930;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync((dispatch_queue_t)stateQueue, block);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003FE94;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB580 != -1)
    dispatch_once(&qword_1001AB580, block);
  return (id)qword_1001AB578;
}

- (_DASDataProtectionMaster)init
{
  _DASDataProtectionMaster *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *stateQueue;
  uint64_t v5;
  NSMutableDictionary *handlers;
  uint64_t v7;
  NSMutableDictionary *availableState;
  NSMutableDictionary *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  int v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *notifyQueue;
  NSObject *v26;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)_DASDataProtectionMaster;
  v2 = -[_DASDataProtectionMaster init](&v31, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.state", 0);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v3;

    v2->_deviceFormatedForContentProtection = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v7;

    v9 = v2->_availableState;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassA](_DASDataProtectionStateMonitor, "dataProtectionClassA"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v10);

    v11 = v2->_availableState;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v12);

    v13 = v2->_availableState;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassD](_DASDataProtectionStateMonitor, "dataProtectionClassD"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v14);

    v15 = MKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v15 != 0;
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[_DASDataProtectionMaster isDataAvailableForClassA](v2, "isDataAvailableForClassA")));
      v17 = v2->_availableState;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassA](_DASDataProtectionStateMonitor, "dataProtectionClassA"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[_DASDataProtectionMaster isDataAvailableForClassC](v2, "isDataAvailableForClassC")));
      v20 = v2->_availableState;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassC](_DASDataProtectionStateMonitor, "dataProtectionClassC"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v19, v21);

      v22 = v2->_availableState;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDataProtectionStateMonitor dataProtectionClassD](_DASDataProtectionStateMonitor, "dataProtectionClassD"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v23);

      v24 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.notify", 0);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v24;

      v2->_notifyToken = 0;
      objc_initWeak(&location, v2);
      v26 = v2->_notifyQueue;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100040184;
      v28[3] = &unk_10015DEB8;
      objc_copyWeak(&v29, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v26, v28);
      v2->_notifyEnabled = 1;
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)handleKeyBagLockNotification
{
  OS_dispatch_queue *stateQueue;
  void *v4;
  OS_dispatch_queue *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  _QWORD block[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  id v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_1000404B4;
  v34[4] = sub_1000404C4;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_1000404B4;
  v32 = sub_1000404C4;
  v33 = 0;
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000404CC;
  block[3] = &unk_10015DEE0;
  block[4] = self;
  block[5] = v34;
  block[6] = &v28;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = self->_stateQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000405E0;
  v24[3] = &unk_10015DB40;
  v26 = v34;
  v24[4] = self;
  v6 = v4;
  v25 = v6;
  dispatch_sync((dispatch_queue_t)v5, v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v10)));
        objc_msgSend(v11, "BOOLValue");

        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v12 = (id)v29[5];
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v36, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v17;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v17 != v14)
                objc_enumerationMutation(v12);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15) + 16))();
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v36, 16);
          }
          while (v13);
        }

        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v37, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);

}

- (BOOL)deviceHasBeenUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot(self, a2) != 0;
}

- (BOOL)deviceIsPasswordConfigured
{
  const __CFBoolean *v2;
  CFBooleanRef v3;

  v2 = (const __CFBoolean *)MGCopyAnswer(CFSTR("PasswordConfigured"), 0);
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3 == kCFBooleanTrue;
}

- (BOOL)deviceIsLocked
{
  const __CFBoolean *v2;
  CFBooleanRef v3;

  v2 = (const __CFBoolean *)MGCopyAnswer(CFSTR("PasswordProtected"), 0);
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3 == kCFBooleanTrue;
}

- (BOOL)isDataAvailableForClassC
{
  if (-[_DASDataProtectionMaster deviceHasBeenUnlockedSinceBoot](self, "deviceHasBeenUnlockedSinceBoot"))
    return 1;
  else
    return !-[_DASDataProtectionMaster deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
}

- (BOOL)isDataAvailableForClassA
{
  if (-[_DASDataProtectionMaster deviceIsLocked](self, "deviceIsLocked"))
    return !-[_DASDataProtectionMaster deviceIsPasswordConfigured](self, "deviceIsPasswordConfigured");
  else
    return 1;
}

- (id)registerStateChangeHandler:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *stateQueue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004094C;
    block[3] = &unk_10015DF08;
    block[4] = self;
    v7 = v5;
    v12 = v7;
    v13 = v4;
    dispatch_sync((dispatch_queue_t)stateQueue, block);
    v8 = v13;
    v9 = v7;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)deregisterStateChangeHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040A0C;
  block[3] = &unk_10015D558;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);

}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (BOOL)deviceFormatedForContentProtection
{
  return self->_deviceFormatedForContentProtection;
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (NSMutableDictionary)availableState
{
  return self->_availableState;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)notifyEnabled
{
  return self->_notifyEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_availableState, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end
