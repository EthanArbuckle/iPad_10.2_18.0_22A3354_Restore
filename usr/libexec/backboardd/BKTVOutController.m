@implementation BKTVOutController

- (BKTVOutController)init
{
  BKTVOutController *v2;
  uint64_t Serial;
  OS_dispatch_queue *workQueue;
  BKDisplayCloneMirroringManager *v5;
  BKDisplayCloneMirroringManager *queue_cloneMirrorManager;
  void *v7;
  id v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BSInvalidatable *systemShellObserving;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  objc_super v34;
  _BYTE v35[128];

  v34.receiver = self;
  v34.super_class = (Class)BKTVOutController;
  v2 = -[BKTVOutController init](&v34, "init");
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial(CFSTR("com.apple.backboardd.BKTVOutController.workQueue"));
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)Serial;

    v5 = -[BKDisplayCloneMirroringManager initWithDisplayProvider:]([BKDisplayCloneMirroringManager alloc], "initWithDisplayProvider:", v2);
    queue_cloneMirrorManager = v2->_queue_cloneMirrorManager;
    v2->_queue_cloneMirrorManager = v5;

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](CAWindowServer, "serverIfRunning"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "displayWithName:", CFSTR("TVOut")));
    if (v7)
    {
      v8 = sub_10000F6DC();
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      if (v7 == v9)
        v2->_queue_forceTVOutMode = 1;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay TVOutDisplay](CADisplay, "TVOutDisplay"));
    objc_msgSend(v26, "addObserver:forKeyPath:options:context:", v2, CFSTR("currentMode"), 0, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10005FBD4, CFSTR("com.apple.iapd.videoout.SettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)sub_10005FBE8, CFSTR("kIAPDServerDiedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKTetherController sharedInstance](BKTetherController, "sharedInstance"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, "_tetherSettingChanged:", CFSTR("BKTetherControllerTetherStateChangedNotification"), v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](BKSystemShellSentinel, "sharedInstance"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "addSystemShellObserver:reason:", v2, CFSTR("BKTVOutController")));
    systemShellObserving = v2->_systemShellObserving;
    v2->_systemShellObserving = (BSInvalidatable *)v15;

    v32 = 0;
    v33 = 0;
    sub_10005EE30((uint64_t)v2, &v33, &v32, 0);
    v17 = v33;
    v18 = v32;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v24, "addObserver:forKeyPath:options:context:", v2, CFSTR("availableModes"), 0, CFSTR("Wireless"));
          -[BKTVOutController observeValueForKeyPath:ofObject:change:context:](v2, "observeValueForKeyPath:ofObject:change:context:", CFSTR("availableModes"), v24, 0, CFSTR("Wireless"));
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v21);
    }

    if (v7 && v18)
    {
      sub_10005F718((uint64_t)v2, 1, v7);
      objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v2, CFSTR("availableModes"), 0, CFSTR("PurpleTVOut"));
      -[BKTVOutController observeValueForKeyPath:ofObject:change:context:](v2, "observeValueForKeyPath:ofObject:change:context:", CFSTR("availableModes"), v18, 0, CFSTR("PurpleTVOut"));
    }

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  void *v5;
  objc_super v6;

  if (self)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, CFSTR("com.apple.iapd.videoout.SettingsChanged"), 0);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, 0, CFSTR("kIAPDServerDiedNotification"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("BKTetherControllerTetherStateChangedNotification"), 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)BKTVOutController;
  -[BKTVOutController dealloc](&v6, "dealloc");
}

- (NSArray)windowServerDisplays
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](CAWindowServer, "serverIfRunning"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displays"));

  return (NSArray *)v3;
}

- (id)windowServerDisplayForDisplayIdentifier:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](CAWindowServer, "serverIfRunning"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayWithDisplayId:", v3));

  return v5;
}

- (BOOL)displayIsConnected:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = objc_msgSend(a3, "displayId");
  if (self)
  {
    v5 = v4;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay displays](CADisplay, "displays", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v11, "displayId") == v5)
          {
            v12 = objc_msgSend(v11, "immutableCopy");
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_12:

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "availableModes"));
  v14 = objc_msgSend(v13, "count") != 0;

  return v14;
}

- (BOOL)supportCloningToDisplay:(id)a3
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "name"));
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Wireless")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("TVOut")))
  {
    v5 = !self->_queue_forceTVOutMode;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *workQueue;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  _QWORD block[4];
  id v32;
  id v33;
  BKTVOutController *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = objc_opt_class(CADisplay, v13);
  v15 = v11;
  v16 = v15;
  if (v14)
  {
    if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  if (v18)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentMode")))
    {
      v19 = objc_msgSend(v18, "immutableCopy");
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005F788;
      block[3] = &unk_1000EB770;
      v32 = v16;
      v33 = v12;
      v34 = self;
      v35 = v19;
      v21 = v19;
      dispatch_async(workQueue, block);

      v22 = v32;
    }
    else
    {
      v23 = objc_msgSend(v10, "isEqualToString:", CFSTR("availableModes"));
      if (!(_DWORD)v23)
      {
        v27 = BKLogDisplay(v23);
        v21 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v37 = v10;
          v38 = 2114;
          v39 = v16;
          v40 = 2114;
          v41 = v12;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ changed on %{public}@ -> %{public}@", buf, 0x20u);
        }
        goto LABEL_14;
      }
      v24 = objc_msgSend(v18, "immutableCopy");
      v25 = self->_workQueue;
      v28[0] = _NSConcreteStackBlock;
      v26 = 2 * (a6 == CFSTR("Wireless"));
      v28[1] = 3221225472;
      v28[2] = sub_10005F9C4;
      v28[3] = &unk_1000EB798;
      if (a6 == CFSTR("PurpleTVOut"))
        v26 = 1;
      v28[4] = self;
      v29 = v24;
      v30 = v26;
      v21 = v24;
      dispatch_async(v25, v28);
      v22 = v29;
    }

LABEL_14:
  }

}

- (void)systemShellDidFinishLaunching:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  NSObject *workQueue;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  sub_10005EE30((uint64_t)self, &v12, &v11, 1);
  v4 = v12;
  v5 = v11;
  if (objc_msgSend(v4, "count"))
    v6 = 0;
  else
    v6 = v5 == 0;
  if (!v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005F178;
    block[3] = &unk_1000ECD38;
    block[4] = self;
    v9 = v4;
    v10 = v5;
    dispatch_async(workQueue, block);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemShellObserving, 0);
  objc_storeStrong((id *)&self->_blankingContext, 0);
  objc_storeStrong((id *)&self->_queue_cloneMirrorManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_handleIapServerConnectionDied
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005EDC0;
    block[3] = &unk_1000ECDA8;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

@end
