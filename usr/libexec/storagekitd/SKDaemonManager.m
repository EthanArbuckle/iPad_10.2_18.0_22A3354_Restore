@implementation SKDaemonManager

+ (id)sharedManager
{
  if (qword_100051AE8 != -1)
    dispatch_once(&qword_100051AE8, &stru_1000452E8);
  return (id)qword_100051AE0;
}

- (void)createDASession
{
  __DASession *v3;
  int v4;
  int v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;

  while (1)
  {
    v3 = DASessionCreate(0);
    self->daSession = v3;
    if (v3)
      break;
    v8 = sub_10000BA9C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[SKDaemonManager createDASession]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: DASessionCreate failed, retrying", buf, 0xCu);
    }

LABEL_9:
    sleep(1u);
  }
  DASessionSetDispatchQueue(v3, (dispatch_queue_t)self->_diskArbCallbacksQueue);
  v4 = DASessionKeepAlive(self->daSession, self->_diskArbCallbacksQueue);
  if (v4)
  {
    v5 = v4;
    v6 = sub_10000BA9C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[SKDaemonManager createDASession]";
      v12 = 1024;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: DASessionKeepAlive failed with code %d, retrying", buf, 0x12u);
    }

    DASessionSetDispatchQueue(self->daSession, 0);
    CFRelease(self->daSession);
    goto LABEL_9;
  }
}

- (SKDaemonManager)init
{
  SKDaemonManager *v2;
  NSMutableArray *v3;
  NSMutableArray *allDisks;
  NSMutableDictionary *v5;
  NSMutableDictionary *diskOperationMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *preIdleOperationMap;
  NSMutableArray *v9;
  NSMutableArray *pendingOperations;
  NSMutableSet *v11;
  NSMutableSet *listeners;
  NSMutableArray *v13;
  NSMutableArray *syncAllDisksSemaphores;
  uint64_t v15;
  NSMutableDictionary *extendedDiskInfoCache;
  NSObject *v17;
  NSObject *lastDiskObjectIDLock;
  NSMutableArray *v19;
  NSMutableArray *disksNotificationsWaiters;
  dispatch_queue_t v21;
  OS_dispatch_queue *diskNotificationQueue;
  NSThread *v23;
  NSThread *diskWorkThread;
  NSThread *v25;
  NSThread *diskEjectThread;
  dispatch_queue_t v27;
  OS_dispatch_queue *diskWorkQueueWatchDog;
  dispatch_queue_t v29;
  OS_dispatch_queue *heartbeatSynchronizationQueue;
  SKMultiSerialQueue *v31;
  SKMultiSerialQueue *notificationsProcessingQueue;
  dispatch_queue_t v33;
  OS_dispatch_queue *waitForCompletionQueue;
  SKMultiSerialQueue *v35;
  SKMultiSerialQueue *boosterQueue;
  dispatch_queue_t v37;
  OS_dispatch_queue *notificationsSyncQueue;
  dispatch_queue_t v39;
  OS_dispatch_queue *diskArbCallbacksQueue;
  NSTimer *daForceIdleTimer;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)SKDaemonManager;
  v2 = -[SKDaemonManager init](&v43, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
    allDisks = v2->allDisks;
    v2->allDisks = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    diskOperationMap = v2->_diskOperationMap;
    v2->_diskOperationMap = v5;

    v7 = objc_opt_new(NSMutableDictionary);
    preIdleOperationMap = v2->_preIdleOperationMap;
    v2->_preIdleOperationMap = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingOperations = v2->pendingOperations;
    v2->pendingOperations = v9;

    v11 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 1);
    listeners = v2->_listeners;
    v2->_listeners = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    syncAllDisksSemaphores = v2->_syncAllDisksSemaphores;
    v2->_syncAllDisksSemaphores = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    extendedDiskInfoCache = v2->_extendedDiskInfoCache;
    v2->_extendedDiskInfoCache = (NSMutableDictionary *)v15;

    v17 = objc_opt_new(NSObject);
    lastDiskObjectIDLock = v2->_lastDiskObjectIDLock;
    v2->_lastDiskObjectIDLock = v17;

    v19 = objc_opt_new(NSMutableArray);
    disksNotificationsWaiters = v2->_disksNotificationsWaiters;
    v2->_disksNotificationsWaiters = v19;

    v21 = dispatch_queue_create("com.apple.StorageKit.notification", 0);
    diskNotificationQueue = v2->diskNotificationQueue;
    v2->diskNotificationQueue = (OS_dispatch_queue *)v21;

    v23 = (NSThread *)objc_msgSend(objc_alloc((Class)NSThread), "initWithTarget:selector:object:", v2, "_workerThread", 0);
    diskWorkThread = v2->diskWorkThread;
    v2->diskWorkThread = v23;

    v25 = (NSThread *)objc_msgSend(objc_alloc((Class)NSThread), "initWithTarget:selector:object:", v2, "_diskEjectThread", 0);
    diskEjectThread = v2->diskEjectThread;
    v2->diskEjectThread = v25;

    v2->runHeartbeatThread = 0;
    -[NSThread start](v2->diskWorkThread, "start");
    -[NSThread start](v2->diskEjectThread, "start");
    v27 = dispatch_queue_create("com.apple.StorageKit.watchdog", 0);
    diskWorkQueueWatchDog = v2->diskWorkQueueWatchDog;
    v2->diskWorkQueueWatchDog = (OS_dispatch_queue *)v27;

    v29 = dispatch_queue_create("com.apple.StorageKit.heartbeat", 0);
    heartbeatSynchronizationQueue = v2->_heartbeatSynchronizationQueue;
    v2->_heartbeatSynchronizationQueue = (OS_dispatch_queue *)v29;

    v31 = -[SKMultiSerialQueue initWithName:]([SKMultiSerialQueue alloc], "initWithName:", CFSTR("com.apple.StorageKit.notifications.processing"));
    notificationsProcessingQueue = v2->_notificationsProcessingQueue;
    v2->_notificationsProcessingQueue = v31;

    v33 = dispatch_queue_create("com.apple.StorageKit.initial.populate", 0);
    waitForCompletionQueue = v2->_waitForCompletionQueue;
    v2->_waitForCompletionQueue = (OS_dispatch_queue *)v33;

    v35 = -[SKMultiSerialQueue initWithName:]([SKMultiSerialQueue alloc], "initWithName:", CFSTR("com.apple.StorageKit.booster"));
    boosterQueue = v2->_boosterQueue;
    v2->_boosterQueue = v35;

    sub_10000F99C(v2->diskNotificationQueue, "kDiskNotificationQueueTag");
    v37 = dispatch_queue_create("com.apple.StorageKit.notifications.sync", 0);
    notificationsSyncQueue = v2->_notificationsSyncQueue;
    v2->_notificationsSyncQueue = (OS_dispatch_queue *)v37;

    v39 = dispatch_queue_create("com.apple.StorageKit.DiskArbCallbacks", 0);
    diskArbCallbacksQueue = v2->_diskArbCallbacksQueue;
    v2->_diskArbCallbacksQueue = (OS_dispatch_queue *)v39;

    daForceIdleTimer = v2->daForceIdleTimer;
    v2->daForceIdleTimer = 0;

    IOEngineInitialize(-[SKDaemonManager createDASession](v2, "createDASession"));
    -[SKDaemonManager registerDiskArbCallbacks](v2, "registerDiskArbCallbacks");
  }
  return v2;
}

- (void)_workerThread
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPort port](NSPort, "port"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  objc_msgSend(v5, "setName:", CFSTR("Storage Kit Work Thread"));

  if (v4)
    objc_msgSend(v3, "addPort:forMode:", v4, NSRunLoopCommonModes);
  objc_msgSend(v3, "run");

  objc_autoreleasePoolPop(v2);
}

- (void)_diskEjectThread
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPort port](NSPort, "port"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  objc_msgSend(v5, "setName:", CFSTR("Storage Kit Disk Eject Thread"));

  if (v4)
    objc_msgSend(v3, "addPort:forMode:", v4, NSRunLoopCommonModes);
  objc_msgSend(v3, "run");

  objc_autoreleasePoolPop(v2);
}

- (void)dispatchToWorkThread:(id)a3
{
  NSThread *diskWorkThread;
  id v5;

  diskWorkThread = self->diskWorkThread;
  v5 = objc_retainBlock(a3);
  -[SKDaemonManager performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", "_doBlockOnWorkThread:", diskWorkThread, v5, 0);

}

- (void)dispatchSyncToWorkThread:(id)a3
{
  NSThread *diskWorkThread;
  id v5;

  diskWorkThread = self->diskWorkThread;
  v5 = objc_retainBlock(a3);
  -[SKDaemonManager performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", "_doBlockOnWorkThread:", diskWorkThread, v5, 1);

}

- (void)_doBlockOnWorkThread:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)dispatchToEjectThread:(id)a3
{
  NSThread *diskEjectThread;
  id v5;

  diskEjectThread = self->diskEjectThread;
  v5 = objc_retainBlock(a3);
  -[SKDaemonManager performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", "_doBlockOnEjectThread:", diskEjectThread, v5, 0);

}

- (void)dispatchSyncToEjectThread:(id)a3
{
  NSThread *diskEjectThread;
  id v5;

  diskEjectThread = self->diskEjectThread;
  v5 = objc_retainBlock(a3);
  -[SKDaemonManager performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", "_doBlockOnEjectThread:", diskEjectThread, v5, 1);

}

- (void)_doBlockOnEjectThread:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)dispatchBoostedToWorkThread:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager boosterQueue](self, "boosterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019244;
  v7[3] = &unk_100045358;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchWithBlock:", v7);

}

- (void)registerDiskArbCallbacks
{
  DARegisterDiskDisappearedCallback(self->daSession, 0, (DADiskDisappearedCallback)sub_1000193A8, self);
  DARegisterDiskDescriptionChangedCallback(self->daSession, 0, 0, (DADiskDescriptionChangedCallback)sub_100019480, self);
  DARegisterDiskListCompleteCallback(self->daSession, sub_100019568, self);
  DARegisterDiskAppearedCallback(self->daSession, 0, (DADiskAppearedCallback)sub_10001961C, self);
  DARegisterIdleCallback(self->daSession, j__objc_msgSend__idleCallback, self);
}

- (void)addListener:(id)a3
{
  void *v4;
  NSMutableSet *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager allDisks](self, "allDisks"));
  v5 = self->_listeners;
  objc_sync_enter(v5);
  -[NSMutableSet addObject:](self->_listeners, "addObject:", v6);
  if (objc_msgSend(v4, "count"))
    -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:](self, "_performDiskStateUpdateSelector:onListener:withDisks:", "disksAppeared:", v6, v4);
  objc_sync_exit(v5);

}

- (void)removeListener:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_listeners;
  objc_sync_enter(v4);
  -[NSMutableSet removeObject:](self->_listeners, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (id)allDisks
{
  NSMutableArray *v3;
  id v4;

  v3 = self->allDisks;
  objc_sync_enter(v3);
  v4 = -[NSMutableArray copy](self->allDisks, "copy");
  objc_sync_exit(v3);

  return v4;
}

+ (id)defaultVisibleRoles
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", kSKDiskRoleLegacyMacData, kSKDiskRoleLegacyMacSystem, kSKDiskRoleMacData, kSKDiskRoleMacSystem, kSKDiskRoleWindowsData, 0);
}

- (id)knownDiskForDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  DADiskRef v8;
  const __CFURL *v9;
  DADiskRef v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("diskIdentifier")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")));
  if (objc_msgSend(v6, "isEqualToString:", kSKDiskTypeAPFSLV))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mountPoint")));
    if (v7)
    {
      v8 = (DADiskRef)v7;
      v9 = (const __CFURL *)objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", v7);
      v10 = DADiskCreateFromVolumePath(0, self->daSession, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v10));

LABEL_14:
      goto LABEL_15;
    }
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", kSKDiskTypeAPFSContainer))
      v12 = v5 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      if (objc_msgSend(v5, "hasPrefix:", kSKDiskIdentifierLiveFSAPFSPrefix))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _cachedDiskWithDiskIdentifier:](self, "_cachedDiskWithDiskIdentifier:", v5));
        goto LABEL_15;
      }
LABEL_13:
      v8 = DADiskCreateFromBSDName(0, self->daSession, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v8));
      goto LABEL_14;
    }
  }
  if (v5)
    goto LABEL_13;
  v11 = 0;
LABEL_15:

  return v11;
}

- (id)rootWholeDisk
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];

  v3 = self->allDisks;
  objc_sync_enter(v3);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->allDisks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mountPoint", (_QWORD)v19));
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("/"));

        if (v10)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
  if (v5 && (v11 = objc_opt_class(SKAPFSDisk), (objc_opt_isKindOfClass(v5, v11) & 1) != 0))
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "container"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject designatedPhysicalStore](v12, "designatedPhysicalStore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager wholeDiskForDisk:](self, "wholeDiskForDisk:", v13));
    if (!v14)
    {
      v15 = sub_10000BA9C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[SKDaemonManager rootWholeDisk]";
        v25 = 2112;
        v26 = v12;
        v27 = 2112;
        v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Couldn't find root disk. container: %@, PS: %@", buf, 0x20u);
      }

    }
  }
  else
  {
    v17 = sub_10000BA9C();
    v12 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Root volume must be APFS - found: %@", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (void)performVMDiskResizeWithSize:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;

  v5 = sub_10000BA9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = (const char *)a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requested to resize the VM's internal disk to %lld bytes", buf, 0xCu);
  }

  v7 = sub_10000BA9C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SKDaemonManager performVMDiskResizeWithSize:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Root disk (the system's snapshot) might appear after first DA idle, waiting a bit", buf, 0xCu);
  }

  sleep(1u);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019E80;
  v9[3] = &unk_1000453A0;
  v9[4] = self;
  v9[5] = a3;
  -[SKDaemonManager syncAllDisksWithCompletionBlock:](self, "syncAllDisksWithCompletionBlock:", v9);
}

- (void)_diskQueueHeartbeat
{
  NSObject *heartbeatSynchronizationQueue;
  dispatch_time_t v4;
  _QWORD v5[5];
  _QWORD block[5];

  if (self->runHeartbeatThread)
  {
    heartbeatSynchronizationQueue = self->_heartbeatSynchronizationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A234;
    block[3] = &unk_100044B78;
    block[4] = self;
    dispatch_sync(heartbeatSynchronizationQueue, block);
    v4 = dispatch_time(0, 5000000000);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001A274;
    v5[3] = &unk_100044B78;
    v5[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

- (void)_diskQueueWatchdog
{
  NSObject *heartbeatSynchronizationQueue;
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  dispatch_time_t v17;
  NSObject *diskWorkQueueWatchDog;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[6];
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;

  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x2020000000;
  v32 = 0;
  if (self->runHeartbeatThread)
  {
    heartbeatSynchronizationQueue = self->_heartbeatSynchronizationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A678;
    block[3] = &unk_1000453C8;
    block[4] = self;
    block[5] = &v29;
    dispatch_sync(heartbeatSynchronizationQueue, block);
    if (v30[3] <= 10.0)
    {
      if (self->diskQueueStuck)
      {
        self->diskQueueStuck = 0;
        v7 = self->_listeners;
        objc_sync_enter(v7);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v8 = self->_listeners;
        v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v8);
              v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
              if ((objc_opt_respondsToSelector(v16, "managerResumed") & 1) != 0)
                objc_msgSend(v16, "managerResumed");
            }
            v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v33, 16);
          }
          while (v13);
        }
        goto LABEL_26;
      }
    }
    else if (!self->diskQueueStuck)
    {
      self->diskQueueStuck = 1;
      v4 = sub_10000BA9C();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager lastOperationName](self, "lastOperationName"));
        *(_DWORD *)buf = 138412290;
        v36 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disk queue stuck, last operation: %@", buf, 0xCu);

      }
      v7 = self->_listeners;
      objc_sync_enter(v7);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v8 = self->_listeners;
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v9; j = (char *)j + 1)
          {
            if (*(_QWORD *)v25 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
            if ((objc_opt_respondsToSelector(v12, "managerStalled") & 1) != 0)
              objc_msgSend(v12, "managerStalled");
          }
          v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        }
        while (v9);
      }
LABEL_26:

      objc_sync_exit(v7);
    }
    v17 = dispatch_time(0, 5000000000);
    diskWorkQueueWatchDog = self->diskWorkQueueWatchDog;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001A6B8;
    v19[3] = &unk_100044B78;
    v19[4] = self;
    dispatch_after(v17, diskWorkQueueWatchDog, v19);
  }
  _Block_object_dispose(&v29, 8);
}

- (id)_cachedDiskWithDiskIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (sub_10000FABC(v4))
  {
    v5 = self->allDisks;
    objc_sync_enter(v5);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->allDisks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "diskIdentifier", (_QWORD)v14));
          v12 = objc_msgSend(v4, "isEqual:", v11);

          if (v12)
          {
            v7 = v10;
            goto LABEL_13;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_cachedDiskWithDADisk:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (v4)
  {
    v5 = self->allDisks;
    objc_sync_enter(v5);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->allDisks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "daDisk", (_QWORD)v15));
          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "daDisk"));
            v13 = objc_msgSend(v4, "isEqual:", v12);

            if (v13)
            {
              v7 = v10;
              goto LABEL_14;
            }
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_diskWithDADisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  void *v24;
  void *v25;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _cachedDiskWithDADisk:](self, "_cachedDiskWithDADisk:", v4));
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = sub_10001ABFC;
      v20 = sub_10001AC0C;
      v21 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskOperationIdentifierWithDADisk:](self, "_diskOperationIdentifierWithDADisk:", v4));
      v24 = v8;
      v22[0] = off_100051A50;
      v22[1] = off_100051A18;
      v23[0] = v4;
      v23[1] = off_100051A40;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      v25 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001AC14;
      v13[3] = &unk_1000453F0;
      v15 = &v16;
      v13[4] = self;
      v11 = v10;
      v14 = v11;
      -[SKDaemonManager dispatchSyncToEjectThread:](self, "dispatchSyncToEjectThread:", v13);
      v7 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  SKRenameOperation *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  SKDaemonManager *v16;
  __int16 v17;
  id v18;

  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v10 = a3;
  v11 = -[SKRenameOperation initWithDisk:name:withCompletionBlock:]([SKRenameOperation alloc], "initWithDisk:name:withCompletionBlock:", v10, v8, v9);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    objc_msgSend(v12, "_scheduleOperation:", v11);
  }
  else
  {
    v13 = sub_10000BA9C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not rename disk %@ to %@", (uint8_t *)&v15, 0x16u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 102, 0));
    v9[2](v9, v12);
  }

}

- (id)_apfsStoreDiskWithUUID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (v4)
  {
    v5 = self->allDisks;
    objc_sync_enter(v5);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->allDisks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v11 = objc_opt_class(SKAPFSStoreDisk);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "apfsUUID", (_QWORD)v15));
            v13 = objc_msgSend(v12, "isEqualToString:", v4);

            if (v13)
            {
              v7 = v10;
              goto LABEL_14;
            }
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (__DASession)diskArbSession
{
  return self->daSession;
}

- (void)_invalidateExtendedDiskInfoCache
{
  NSMutableDictionary *obj;

  obj = self->_extendedDiskInfoCache;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_extendedDiskInfoCache, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)_addToExtendedDiskInfoCacheWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  obj = self->_extendedDiskInfoCache;
  objc_sync_enter(obj);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extendedDiskInfoCache, "objectForKeyedSubscript:", v9));

        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extendedDiskInfoCache, "objectForKeyedSubscript:", v9));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));
          objc_msgSend(v11, "addEntriesFromDictionary:", v12);
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extendedDiskInfoCache, "setObject:forKeyedSubscript:", v12, v9);
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

- (id)copyExtendedDiskInfoWithDiskIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self->_extendedDiskInfoCache;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_extendedDiskInfoCache, "objectForKeyedSubscript:", v4));
  v7 = objc_msgSend(v6, "copy");

  objc_sync_exit(v5);
  return v7;
}

- (id)copyUpdatedDADiskForDisk:(id)a3
{
  id v4;
  __DASession *daSession;
  id v6;
  DADiskRef v7;
  void *v8;
  void *v9;
  DADiskRef v10;

  v4 = a3;
  if (objc_msgSend(v4, "isIOMediaDisk"))
  {
    daSession = self->daSession;
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "diskIdentifier")));
    v7 = DADiskCreateFromBSDName(0, daSession, (const char *)objc_msgSend(v6, "UTF8String"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mountPoint"));

    if (!v8)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mountPoint"));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9));

    v7 = DADiskCreateFromVolumePath(0, self->daSession, (CFURLRef)v6);
  }
  v10 = v7;

LABEL_7:
  return v10;
}

- (void)_fastRecacheWithDisks:(id)a3 options:(unint64_t)a4
{
  int v4;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  NSObject *v15;
  SKDaemonManager *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int v26;
  _BYTE v27[128];

  v4 = a4;
  v6 = a3;
  v16 = self;
  -[SKDaemonManager _invalidateExtendedDiskInfoCache](self, "_invalidateExtendedDiskInfoCache");
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "_supportsRecaching"))
        {
          v14 = sub_10000BA9C();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v22 = "-[SKDaemonManager _fastRecacheWithDisks:options:]";
            v23 = 2112;
            v24 = v13;
            v25 = 1024;
            v26 = v4;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ options=0x%x", buf, 0x1Cu);
          }

          objc_msgSend(v13, "_cacheSpacesWithPurgeable:", (v4 & 4) == 0);
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v10);
  }

  -[SKDaemonManager _disksChanged:](v16, "_disksChanged:", v7);
}

- (id)_fullRecacheWithDisks:(id)a3 options:(unint64_t)a4
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  id v21;
  id v22;
  __int128 v24;
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[3];
  _QWORD v45[3];
  _BYTE v46[128];

  v5 = a3;
  v26 = objc_alloc_init((Class)NSMutableDictionary);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_10001ABFC;
  v38 = sub_10001AC0C;
  v39 = 0;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v31;
    *(_QWORD *)&v8 = 136315394;
    v24 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "_supportsRecaching", v24))
        {
          v12 = -[SKDaemonManager copyUpdatedDADiskForDisk:](self, "copyUpdatedDADiskForDisk:", v11);
          v13 = v12;
          if (v12)
          {
            v44[0] = off_100051A50;
            v44[1] = off_100051A18;
            v45[0] = v12;
            v45[1] = off_100051A38;
            v44[2] = off_100051A48;
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
            v45[2] = v14;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 3));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "diskIdentifier"));
            objc_msgSend(v26, "setObject:forKeyedSubscript:", v15, v16);

            v17 = sub_10000BA9C();
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              v41 = "-[SKDaemonManager _fullRecacheWithDisks:options:]";
              v42 = 2112;
              v43 = v11;
              v19 = v18;
              v20 = "%s: Recaching %@";
              goto LABEL_12;
            }
          }
          else
          {
            v21 = sub_10000BA9C();
            v18 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v24;
              v41 = "-[SKDaemonManager _fullRecacheWithDisks:options:]";
              v42 = 2112;
              v43 = v11;
              v19 = v18;
              v20 = "%s: Failed to create an updated DADiskRef for %@";
LABEL_12:
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
            }
          }

          continue;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v26, "count"))
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10001B8C4;
    v27[3] = &unk_1000453F0;
    v29 = &v34;
    v27[4] = self;
    v28 = v26;
    -[SKDaemonManager dispatchSyncToEjectThread:](self, "dispatchSyncToEjectThread:", v27);

  }
  v22 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v22;
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD);
  unint64_t v16;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (v8
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "diskIdentifier")), v10, v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v8));
    if ((a4 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "children"));
      if (v12)
        objc_msgSend(v11, "addObjectsFromArray:", v12);

    }
    if ((a4 & 2) != 0)
    {
      -[SKDaemonManager _fastRecacheWithDisks:options:](self, "_fastRecacheWithDisks:options:", v11, a4);
      if (v9)
        v9[2](v9);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001BA54;
      v13[3] = &unk_100045418;
      v13[4] = self;
      v14 = v11;
      v16 = a4;
      v15 = v9;
      -[SKDaemonManager dispatchBoostedToWorkThread:](self, "dispatchBoostedToWorkThread:", v13);

    }
  }
  else if (v9)
  {
    v9[2](v9);
  }

}

- (id)_recacheSyncDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v8;

  if (!a3)
    return 0;
  v8 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _fullRecacheWithDisks:options:](self, "_fullRecacheWithDisks:options:", v5, 0, v8));
  return v6;
}

- (void)_scheduleOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager boosterQueue](self, "boosterQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BBEC;
  v7[3] = &unk_100044ED8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchWithBlock:", v7);

}

- (void)_advanceOperationQueue
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001BF28;
  v2[3] = &unk_100044B78;
  v2[4] = self;
  -[SKDaemonManager dispatchToWorkThread:](self, "dispatchToWorkThread:", v2);
}

- (void)_advanceOperationQueueOnWorkQueue
{
  id v3;
  NSObject *v4;
  SKManagerOperation *currentOperation;
  SKManagerOperation *v6;
  SKManagerOperation *v7;
  void *v8;
  id v9;
  NSObject *v10;
  SKManagerOperation *v11;
  SKManagerOperation *v12;
  id v13;
  NSObject *v14;
  int v15;
  const char *v16;

  if (self->currentOperation)
  {
    v3 = sub_10000BA9C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      currentOperation = self->currentOperation;
      v15 = 138412290;
      v16 = (const char *)currentOperation;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished operation: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  if (-[NSMutableArray count](self->pendingOperations, "count"))
  {
    v6 = (SKManagerOperation *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->pendingOperations, "objectAtIndexedSubscript:", 0));
    v7 = self->currentOperation;
    self->currentOperation = v6;

    -[NSMutableArray removeObjectAtIndex:](self->pendingOperations, "removeObjectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation description](self->currentOperation, "description"));
    -[SKDaemonManager setLastOperationName:](self, "setLastOperationName:", v8);

    v9 = sub_10000BA9C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->currentOperation;
      v15 = 138412290;
      v16 = (const char *)v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Running operation: %@", (uint8_t *)&v15, 0xCu);
    }

    -[SKManagerOperation run](self->currentOperation, "run");
  }
  else
  {
    self->runHeartbeatThread = 0;
    -[SKDaemonManager setLastOperationName:](self, "setLastOperationName:", 0);
    v12 = self->currentOperation;
    self->currentOperation = 0;

    v13 = sub_10000BA9C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[SKDaemonManager _advanceOperationQueueOnWorkQueue]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Operation queue is empty", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)_scheduleGenericOperationWithCompletionBlock:(id)a3
{
  SKGenericOperation *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  v4 = objc_opt_new(SKGenericOperation);
  -[SKGenericOperation setCompletionBlock:](v4, "setCompletionBlock:", v5);
  if (v4)
    -[SKDaemonManager _scheduleOperation:](self, "_scheduleOperation:", v4);
  else
    v5[2]();

}

- (void)_disksChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  uint64_t v18;
  NSMutableSet *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];

  v4 = a3;
  v18 = 120;
  obj = self->_listeners;
  objc_sync_enter(obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager allDisks](self, "allDisks"));
  v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v5, "containsObject:", v11, v18))
        {
          objc_msgSend(v6, "addObject:", v11);
        }
        else
        {
          v12 = sub_10000BA9C();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v30 = "-[SKDaemonManager _disksChanged:]";
            v31 = 2112;
            v32 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@ disappeared, skipping changed notification", buf, 0x16u);
          }

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v8);
  }

  sub_10000BC28(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks changed:", v6);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = *(id *)&self->SKBaseManager_opaque[v18];
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:](self, "_performDiskStateUpdateSelector:onListener:withDisks:", "disksChanged:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), v6, v18);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  objc_sync_exit(obj);
}

- (void)_disksAppeared:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self->_listeners;
  objc_sync_enter(v5);
  sub_10000BC28(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks appeared:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_listeners;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:](self, "_performDiskStateUpdateSelector:onListener:withDisks:", "disksAppeared:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), v4, (_QWORD)v10);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_disksDisappeared:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v5 = self->_listeners;
  objc_sync_enter(v5);
  sub_10000BC28(OS_LOG_TYPE_DEFAULT, (uint64_t)"DAEMON - Disks disappeared:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_listeners;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[SKDaemonManager _performDiskStateUpdateSelector:onListener:withDisks:](self, "_performDiskStateUpdateSelector:onListener:withDisks:", "disksDisappeared:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), v4, (_QWORD)v10);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)_performDiskStateUpdateSelector:(SEL)a3 onListener:(id)a4 withDisks:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v14), "dictionaryRepresentation"));
        objc_msgSend(v9, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  if ((objc_opt_respondsToSelector(v7, a3) & 1) != 0)
  {
    if ((objc_opt_respondsToSelector(v7, "visibleDiskRoles") & 1) != 0
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "visibleDiskRoles")), v16, v16))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10001C9A0;
      v20[3] = &unk_100045440;
      v17 = v7;
      v21 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v20));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredArrayUsingPredicate:", v18));
      objc_msgSend(v17, "performSelector:withObject:", a3, v19);

    }
    else
    {
      objc_msgSend(v7, "performSelector:withObject:", a3, v9);
    }
  }

}

- (unint64_t)nextDiskObjectID
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager lastDiskObjectIDLock](self, "lastDiskObjectIDLock"));
  objc_sync_enter(v3);
  v4 = self->_lastDiskObjectID + 1;
  self->_lastDiskObjectID = v4;
  objc_sync_exit(v3);

  return v4;
}

- (void)startForceIdleTimer
{
  NSTimer *v3;
  NSTimer *daForceIdleTimer;
  _QWORD v5[5];

  if (!self->daForceIdleTimer)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001CAF8;
    v5[3] = &unk_100045468;
    v5[4] = self;
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 10.0));
    daForceIdleTimer = self->daForceIdleTimer;
    self->daForceIdleTimer = v3;

  }
}

- (void)_idleCallback
{
  id v3;
  NSObject *v4;
  NSTimer *daForceIdleTimer;
  NSTimer *v6;
  unsigned __int8 v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *diskOperationMap;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  unsigned __int8 v14;
  uint8_t buf[4];
  const char *v16;

  v3 = sub_10000BA9C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SKDaemonManager _idleCallback]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: DA idle received", buf, 0xCu);
  }

  daForceIdleTimer = self->daForceIdleTimer;
  if (daForceIdleTimer)
  {
    -[NSTimer invalidate](daForceIdleTimer, "invalidate");
    v6 = self->daForceIdleTimer;
    self->daForceIdleTimer = 0;

  }
  v7 = -[SKDaemonManager diskListCompleteReceived](self, "diskListCompleteReceived");
  -[SKDaemonManager setDiskListCompleteReceived:](self, "setDiskListCompleteReceived:", 0);
  v8 = self->_diskOperationMap;
  objc_sync_enter(v8);
  diskOperationMap = self->_diskOperationMap;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager preIdleOperationMap](self, "preIdleOperationMap"));
  -[NSMutableDictionary addEntriesFromDictionary:](diskOperationMap, "addEntriesFromDictionary:", v10);

  objc_sync_exit(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager preIdleOperationMap](self, "preIdleOperationMap"));
  objc_msgSend(v11, "removeAllObjects");

  v12 = objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsSyncQueue](self, "notificationsSyncQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001CD24;
  v13[3] = &unk_100045490;
  v13[4] = self;
  v14 = v7;
  dispatch_async(v12, v13);

}

- (id)_diskOperationIdentifierWithDADisk:(id)a3
{
  __DADisk *v3;
  const char *BSDName;
  void *v5;
  void *v6;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (__DADisk *)a3;
  BSDName = DADiskGetBSDName(v3);
  if (BSDName)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", BSDName));
    if (!v5)
    {
LABEL_3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

    }
  }
  else
  {
    v8 = DADiskCopyDescription(v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", kDADiskDescriptionVolumeLifsURLKey));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", kDADiskDescriptionVolumePathKey));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v9, v11));

    }
    else
    {
      v5 = 0;
    }

    if (!v5)
      goto LABEL_3;
  }

  return v5;
}

- (void)_handleDANotificationWithDisk:(id)a3 operation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskOperationIdentifierWithDADisk:](self, "_diskOperationIdentifierWithDADisk:", v6));
    v14[0] = off_100051A50;
    v14[1] = off_100051A18;
    v15[0] = v6;
    v15[1] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager preIdleOperationMap](self, "preIdleOperationMap"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager disksNotificationsWaiters](self, "disksNotificationsWaiters"));
    objc_sync_enter(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager disksNotificationsWaiters](self, "disksNotificationsWaiters"));
    v13 = objc_msgSend(v12, "count") == 0;

    if (!v13)
      -[SKDaemonManager _notifyLockedDisksNotificationsWaitersWithDisk:](self, "_notifyLockedDisksNotificationsWaitersWithDisk:", v6);
    objc_sync_exit(v11);

  }
  -[SKDaemonManager startForceIdleTimer](self, "startForceIdleTimer");

}

- (void)_notifyLockedDisksNotificationsWaitersWithDisk:(id)a3
{
  CFDictionaryRef v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = DADiskCopyDescription((DADiskRef)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", kDADiskDescriptionMediaBSDNameKey));
  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", kDADiskDescriptionVolumeLifsURLKey));
    if (!v6)
      goto LABEL_14;
    v7 = (void *)v6;
    v8 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "host"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("apfs://%@"), v9));

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager disksNotificationsWaiters](self, "disksNotificationsWaiters"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "expectedDiskIdentifier"));
        v17 = objc_msgSend(v16, "isEqual:", v5);

        if (v17)
        {
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "semaphore"));
          dispatch_semaphore_signal(v18);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

LABEL_14:
}

- (void)dmAsyncStartedForDisk:(__DADisk *)a3
{
  if ((objc_opt_respondsToSelector(self->currentOperation, "dmAsyncStartedForDisk:") & 1) != 0)
    -[SKManagerOperation dmAsyncStartedForDisk:](self->currentOperation, "dmAsyncStartedForDisk:", a3);
}

- (void)dmAsyncProgressForDisk:(__DADisk *)a3 barberPole:(BOOL)a4 percent:(float)a5
{
  _BOOL8 v6;
  double v9;

  v6 = a4;
  if ((objc_opt_respondsToSelector(self->currentOperation, "dmAsyncProgressForDisk:barberPole:percent:") & 1) != 0)
  {
    *(float *)&v9 = a5;
    -[SKManagerOperation dmAsyncProgressForDisk:barberPole:percent:](self->currentOperation, "dmAsyncProgressForDisk:barberPole:percent:", a3, v6, v9);
  }
}

- (void)dmAsyncMessageForDisk:(__DADisk *)a3 string:(id)a4 dictionary:(id)a5
{
  id v8;
  id v9;

  v9 = a4;
  v8 = a5;
  if ((objc_opt_respondsToSelector(self->currentOperation, "dmAsyncMessageForDisk:string:dictionary:") & 1) != 0)
    -[SKManagerOperation dmAsyncMessageForDisk:string:dictionary:](self->currentOperation, "dmAsyncMessageForDisk:string:dictionary:", a3, v9, v8);

}

- (void)dmAsyncFinishedForDisk:(__DADisk *)a3 mainError:(int)a4 detailError:(int)a5 dictionary:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  __DADisk *v14;
  int v15;
  int v16;

  v10 = a6;
  if (a3)
    CFRetain(a3);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001D714;
  v12[3] = &unk_1000454E0;
  v13 = v10;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v12[4] = self;
  v11 = v10;
  -[SKDaemonManager dispatchToWorkThread:](self, "dispatchToWorkThread:", v12);

}

- (void)syncAllDisksWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SKDaemonManager waitForCompletionQueue](self, "waitForCompletionQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D810;
  v7[3] = &unk_100045358;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DAF0;
  v7[3] = &unk_100045508;
  v8 = a5;
  v6 = v8;
  -[SKDaemonManager dispatchBoostedToWorkThread:](self, "dispatchBoostedToWorkThread:", v7);

}

- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SKDaemonManager *v10;
  id v11;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001DBA4;
  v8[3] = &unk_100045530;
  v9 = a3;
  v10 = self;
  v11 = a4;
  v6 = v11;
  v7 = v9;
  -[SKDaemonManager dispatchBoostedToWorkThread:](self, "dispatchBoostedToWorkThread:", v8);

}

- (id)wholeDiskForDisk:(id)a3
{
  id v4;
  id v5;
  void *v6;
  __DADisk *v7;
  DADiskRef v8;

  v4 = a3;
  if (objc_msgSend(v4, "isWholeDisk"))
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daDisk"));

    if (v6)
    {
      v7 = (__DADisk *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "daDisk"));
      v8 = DADiskCopyWholeDisk(v7);

      if (v8)
        v5 = (id)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v8));
      else
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  SKDaemonManager *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DEF8;
  v7[3] = &unk_100045530;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[SKDaemonManager dispatchBoostedToWorkThread:](v8, "dispatchBoostedToWorkThread:", v7);

}

- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SKDaemonManager *v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001DFE8;
  v9[3] = &unk_100045558;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v7 = v12;
  v8 = v6;
  -[SKDaemonManager dispatchBoostedToWorkThread:](self, "dispatchBoostedToWorkThread:", v9);

}

- (void)isBusy:(id)a3
{
  id v3;
  _QWORD v4[4];
  SKDaemonManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E184;
  v4[3] = &unk_100045330;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[SKDaemonManager dispatchBoostedToWorkThread:](v5, "dispatchBoostedToWorkThread:", v4);

}

- (id)formatableFileSystems
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](SKFilesystem, "buildFilesystems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_100045578));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "filteredArrayUsingPredicate:", v3));

  return v4;
}

- (void)filesystemsWithCallbackBlock:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](SKFilesystem, "buildFilesystems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "dictionaryRepresentation", (_QWORD)v12));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (v3)
    v3[2](v3, v5);

}

- (id)_filesystemForDMFilesystemType:(id)a3 isEncrypted:(BOOL)a4
{
  int v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a4;
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](SKFilesystem, "buildFilesystems"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dmPersonality", (_QWORD)v16));
        if (objc_msgSend(v12, "isEqualToString:", v5))
        {
          v13 = objc_msgSend(v11, "isEncrypted");

          if (v13 == v4)
          {
            v14 = v11;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)_filesystemForIOContent:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](SKFilesystem, "buildFilesystems"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentMask", (_QWORD)v12));
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_firstFilesystemForMajorType:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](SKFilesystem, "buildFilesystems"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "majorType", (_QWORD)v12));
        v10 = objc_msgSend(v9, "isEqualToString:", v3);

        if ((v10 & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_filesystemForUnlocalizedName:(id)a3 dmPersonality:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  unsigned __int8 v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SKFilesystem buildFilesystems](SKFilesystem, "buildFilesystems"));
  v8 = v7;
  if (v5)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      v27 = v8;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "unlocalizedName"));
          if (objc_msgSend(v5, "isEqualToString:", v15))
          {

            goto LABEL_24;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "unlocalizedEncryptedName"));
          v17 = objc_msgSend(v5, "isEqualToString:", v16);

          if ((v17 & 1) != 0)
            goto LABEL_24;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        v18 = 0;
        v8 = v27;
        if (v11)
          continue;
        goto LABEL_25;
      }
    }
  }
  else
  {
    if (!v6)
    {
      v18 = 0;
      goto LABEL_26;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v7;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      v27 = v8;
      while (2)
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dmPersonality"));
          v25 = objc_msgSend(v6, "isEqualToString:", v24);

          if ((v25 & 1) != 0)
          {
LABEL_24:
            v18 = v14;
            v8 = v27;
            goto LABEL_25;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        v18 = 0;
        v8 = v27;
        if (v21)
          continue;
        goto LABEL_25;
      }
    }
  }
  v18 = 0;
LABEL_25:

LABEL_26:
  return v18;
}

- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  SKIOMedia *v8;
  void *v9;
  SKIOMedia *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  SKIOMedia *v16;
  SKIOMedia *v17;
  __DASession *daSession;
  id v19;
  DADiskRef v20;
  void *v21;
  SKIOMedia *v22;
  id v23;
  void *v24;
  SKIOMedia *v25;
  id v26;

  v26 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v26 && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "daDisk")), v7, v7))
  {
    v8 = [SKIOMedia alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "daDisk"));
    v10 = -[SKIOMedia initWithDADisk:](v8, "initWithDADisk:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKIOObject ioObjectWithClassName:iterateParents:](v10, "ioObjectWithClassName:iterateParents:", CFSTR("AppleAPFSContainer"), 1));
    v12 = objc_msgSend(v11, "copyParent");
    v13 = v12;
    if (v12)
    {
      v24 = v11;
      v25 = v10;
      v23 = v12;
      v14 = objc_msgSend(v12, "newIteratorWithOptions:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v16 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v14);
      if (v16)
      {
        v17 = v16;
        do
        {
          if (objc_msgSend(v14, "invalidated"))
            objc_msgSend(v15, "removeAllObjects");
          if (IOObjectConformsTo(-[SKIOObject ioObj](v17, "ioObj"), "IOMedia"))
          {
            daSession = self->daSession;
            v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SKIOMedia BSDName](v17, "BSDName")));
            v20 = DADiskCreateFromBSDName(0, daSession, (const char *)objc_msgSend(v19, "fileSystemRepresentation"));

            if (v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v20));
              if (v21)
                objc_msgSend(v15, "addObject:", v21);

            }
          }
          v22 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v14);

          v17 = v22;
        }
        while (v22);
      }
      v6[2](v6, v15);

      v11 = v24;
      v10 = v25;
      v13 = v23;
    }
    else
    {
      v6[2](v6, &__NSArray0__struct);
    }

  }
  else
  {
    v6[2](v6, &__NSArray0__struct);
  }

}

- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  char **v7;
  SKIOMedia *v8;
  void *v9;
  SKIOMedia *v10;
  void *v11;
  void *v12;
  id v13;
  SKIOMedia *v14;
  SKIOMedia *v15;
  _UNKNOWN **v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  const __CFString *v21;
  char **v22;
  const __CFString *v23;
  _UNKNOWN **v24;
  __DASession *daSession;
  id v26;
  DADiskRef v27;
  void *v28;
  SKIOMedia *v29;
  void (**v30)(id, void *);
  void *v31;
  SKIOMedia *v32;
  id v34;

  v34 = a3;
  v5 = (void (**)(id, void *))a4;
  if (v34 && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "daDisk")), v6, v6))
  {
    v7 = &selRef_sendStderr_;
    v8 = [SKIOMedia alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "daDisk"));
    v10 = -[SKIOMedia initWithDADisk:](v8, "initWithDADisk:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKIOObject ioObjectWithClassName:iterateParents:](v10, "ioObjectWithClassName:iterateParents:", CFSTR("AppleAPFSContainer"), 0));
    if (v11)
    {
      v30 = v5;
      v32 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v31 = v11;
      v13 = objc_msgSend(v11, "newIteratorWithOptions:", 0);
      v14 = -[SKIOObject initWithIteratorNext:]([SKIOMedia alloc], "initWithIteratorNext:", v13);
      if (v14)
      {
        v15 = v14;
        v16 = &APFSCancelContainerResize_ptr;
        v17 = CFSTR("Content");
        v18 = CFSTR("41504653-0000-11AA-AA11-00306543ECAC");
        do
        {
          if (objc_msgSend(v13, "invalidated"))
            objc_msgSend(v12, "removeAllObjects");
          if (IOObjectConformsTo(-[SKIOObject ioObj](v15, "ioObj"), "AppleAPFSVolume"))
          {
            v19 = -[SKIOObject copyPropertyWithClass:key:](v15, "copyPropertyWithClass:key:", objc_opt_class(v16[113]), v17);
            v20 = v19;
            if (v19 && objc_msgSend(v19, "isEqualToString:", v18))
            {
              v21 = v18;
              v22 = v7;
              v23 = v17;
              v24 = v16;
              daSession = self->daSession;
              v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SKIOMedia BSDName](v15, "BSDName")));
              v27 = DADiskCreateFromBSDName(0, daSession, (const char *)objc_msgSend(v26, "fileSystemRepresentation"));

              if (v27)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _diskWithDADisk:](self, "_diskWithDADisk:", v27));
                if (v28)
                  objc_msgSend(v12, "addObject:", v28);

              }
              v16 = v24;
              v17 = v23;
              v7 = v22;
              v18 = v21;
            }

          }
          v29 = (SKIOMedia *)objc_msgSend(objc_alloc((Class)(v7 + 402)), "initWithIteratorNext:", v13);

          v15 = v29;
        }
        while (v29);
      }
      v5 = v30;
      v30[2](v30, v12);

      v11 = v31;
      v10 = v32;
    }
    else
    {
      v5[2](v5, &__NSArray0__struct);
    }

  }
  else
  {
    v5[2](v5, &__NSArray0__struct);
  }

}

- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4
{
  -[SKDaemonManager unmountDisk:options:withCompletionBlock:](self, "unmountDisk:options:withCompletionBlock:", a3, 0, a4);
}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  id v9;
  SKUnmountOperation *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;

  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = -[SKUnmountOperation initWithDisk:options:withCompletionBlock:]([SKUnmountOperation alloc], "initWithDisk:options:withCompletionBlock:", v7, v9, v8);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    objc_msgSend(v11, "_scheduleOperation:", v10);
  }
  else
  {
    v12 = sub_10000BA9C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Could not unmount disk %@", (uint8_t *)&v14, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 102, 0));
    v8[2](v8, v11);
  }

}

- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  SKEjectOperation *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = -[SKEjectOperation initWithDisk:withCompletionBlock:]([SKEjectOperation alloc], "initWithDisk:withCompletionBlock:", v5, v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
    objc_msgSend(v8, "_scheduleOperation:", v7);
  }
  else
  {
    v9 = sub_10000BA9C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not eject disk %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 102, 0));
    v6[2](v6, v8);
  }

}

- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  SKEraseOperation *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = -[SKEraseOperation initWithEraser:withCompletionBlock:]([SKEraseOperation alloc], "initWithEraser:withCompletionBlock:", v6, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  objc_msgSend(v8, "_scheduleOperation:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "progress"));
  return v9;
}

- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5
{
  id v7;
  void (**v8)(id, SKResizeOperation *);
  void *v9;
  SKResizeOperation *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  SKResizeOperation *v17;
  int v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, SKResizeOperation *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daDisk"));

  if (!v9)
  {
    v13 = sub_10000BA9C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Tried to resize a disk with no DADiskRef!", (uint8_t *)&v19, 2u);
    }

    v10 = (SKResizeOperation *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 117, 0));
    v8[2](v8, v10);
    goto LABEL_10;
  }
  v10 = -[SKResizeOperation initWithDisk:toSize:withCompletionBlock:]([SKResizeOperation alloc], "initWithDisk:toSize:withCompletionBlock:", v7, a4, v8);
  if (!v10)
  {
    v15 = sub_10000BA9C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not resize disk %@", (uint8_t *)&v19, 0xCu);
    }

    v17 = (SKResizeOperation *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](SKError, "errorWithCode:userInfo:", 102, 0));
    v8[2](v8, v17);

LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](SKDaemonManager, "sharedManager"));
  objc_msgSend(v11, "_scheduleOperation:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKManagerOperation skProgress](v10, "skProgress"));
LABEL_11:

  return v12;
}

- (SKNotificationsCache)notificationsCache
{
  return self->_notificationsCache;
}

- (void)setNotificationsCache:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsCache, a3);
}

- (NSMutableArray)syncAllDisksSemaphores
{
  return self->_syncAllDisksSemaphores;
}

- (void)setSyncAllDisksSemaphores:(id)a3
{
  objc_storeStrong((id *)&self->_syncAllDisksSemaphores, a3);
}

- (OS_dispatch_queue)waitForCompletionQueue
{
  return self->_waitForCompletionQueue;
}

- (void)setWaitForCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_waitForCompletionQueue, a3);
}

- (SKMultiSerialQueue)boosterQueue
{
  return self->_boosterQueue;
}

- (void)setBoosterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_boosterQueue, a3);
}

- (SKMultiSerialQueue)notificationsProcessingQueue
{
  return self->_notificationsProcessingQueue;
}

- (void)setNotificationsProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsProcessingQueue, a3);
}

- (NSString)lastOperationName
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastOperationName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSMutableArray)disksNotificationsWaiters
{
  return self->_disksNotificationsWaiters;
}

- (void)setDisksNotificationsWaiters:(id)a3
{
  objc_storeStrong((id *)&self->_disksNotificationsWaiters, a3);
}

- (OS_dispatch_queue)diskArbCallbacksQueue
{
  return self->_diskArbCallbacksQueue;
}

- (void)setDiskArbCallbacksQueue:(id)a3
{
  objc_storeStrong((id *)&self->_diskArbCallbacksQueue, a3);
}

- (OS_dispatch_queue)notificationsSyncQueue
{
  return self->_notificationsSyncQueue;
}

- (void)setNotificationsSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsSyncQueue, a3);
}

- (unint64_t)lastDiskObjectID
{
  return self->_lastDiskObjectID;
}

- (void)setLastDiskObjectID:(unint64_t)a3
{
  self->_lastDiskObjectID = a3;
}

- (NSObject)lastDiskObjectIDLock
{
  return self->_lastDiskObjectIDLock;
}

- (void)setLastDiskObjectIDLock:(id)a3
{
  objc_storeStrong((id *)&self->_lastDiskObjectIDLock, a3);
}

- (BOOL)diskListCompleteReceived
{
  return self->_diskListCompleteReceived;
}

- (void)setDiskListCompleteReceived:(BOOL)a3
{
  self->_diskListCompleteReceived = a3;
}

- (NSMutableDictionary)preIdleOperationMap
{
  return self->_preIdleOperationMap;
}

- (void)setPreIdleOperationMap:(id)a3
{
  objc_storeStrong((id *)&self->_preIdleOperationMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preIdleOperationMap, 0);
  objc_storeStrong((id *)&self->_lastDiskObjectIDLock, 0);
  objc_storeStrong((id *)&self->_notificationsSyncQueue, 0);
  objc_storeStrong((id *)&self->_diskArbCallbacksQueue, 0);
  objc_storeStrong((id *)&self->_disksNotificationsWaiters, 0);
  objc_storeStrong((id *)&self->_lastOperationName, 0);
  objc_storeStrong((id *)&self->_notificationsProcessingQueue, 0);
  objc_storeStrong((id *)&self->_boosterQueue, 0);
  objc_storeStrong((id *)&self->_waitForCompletionQueue, 0);
  objc_storeStrong((id *)&self->_syncAllDisksSemaphores, 0);
  objc_storeStrong((id *)&self->_notificationsCache, 0);
  objc_storeStrong((id *)&self->_extendedDiskInfoCache, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_diskOperationMap, 0);
  objc_storeStrong((id *)&self->allDisks, 0);
  objc_storeStrong((id *)&self->currentOperation, 0);
  objc_storeStrong((id *)&self->pendingOperations, 0);
  objc_storeStrong((id *)&self->daForceIdleTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->lastDiskQueueHeartbeat, 0);
  objc_storeStrong((id *)&self->diskWorkQueueWatchDog, 0);
  objc_storeStrong((id *)&self->diskEjectThread, 0);
  objc_storeStrong((id *)&self->diskWorkThread, 0);
  objc_storeStrong((id *)&self->diskNotificationQueue, 0);
}

- (BOOL)addAppearedDisk:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10000BA9C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[SKDaemonManager(DiskNotifications) addAppearedDisk:]";
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v11, 0x16u);
    }

    v7 = self->allDisks;
    objc_sync_enter(v7);
    -[NSMutableArray addObject:](self->allDisks, "addObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appearedDisks"));
    objc_msgSend(v9, "addObject:", v4);

    objc_sync_exit(v7);
  }

  return v4 != 0;
}

- (void)addChangedDisk:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10000BA9C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[SKDaemonManager(DiskNotifications) addChangedDisk:]";
      v13 = 2112;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v11, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "changedDisks"));

    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "changedDisks"));
    objc_msgSend(v10, "addObject:", v4);

    objc_sync_exit(v8);
  }

}

- (void)addDisappearedDisk:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v5 = sub_10000BA9C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[SKDaemonManager(DiskNotifications) addDisappearedDisk:]";
      v12 = 2112;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
    }

    v7 = self->allDisks;
    objc_sync_enter(v7);
    -[NSMutableArray removeObject:](self->allDisks, "removeObject:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "disappearedDisks"));
    objc_msgSend(v9, "addObject:", v4);

    objc_sync_exit(v7);
  }

}

- (void)_processDiskNotificationsWithCompleteDiskList:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = self->_diskOperationMap;
  objc_sync_enter(v6);
  v7 = -[NSMutableDictionary copy](self->_diskOperationMap, "copy");
  -[NSMutableDictionary removeAllObjects](self->_diskOperationMap, "removeAllObjects");
  objc_sync_exit(v6);

  v8 = -[SKDaemonManager _processDiskNotificationsForMap:isCompleteDiskList:](self, "_processDiskNotificationsForMap:isCompleteDiskList:", v7, v3);
  objc_autoreleasePoolPop(v5);
}

- (void)addMissingDisappearedDisks
{
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  CFDictionaryRef v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager allDisks](self, "allDisks"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 136315650;
    v15 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "_supportsRecaching", v15))
        {
          v10 = -[SKDaemonManager copyUpdatedDADiskForDisk:](self, "copyUpdatedDADiskForDisk:", v9);
          v11 = v10;
          if (!v10 || (v12 = DADiskCopyDescription((DADiskRef)v10)) == 0)
          {
            v13 = sub_10000BA9C();
            v14 = objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v15;
              v21 = "-[SKDaemonManager(DiskNotifications) addMissingDisappearedDisks]";
              v22 = 2112;
              v23 = v9;
              v24 = 2112;
              v25 = v11;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: %@ (%@) disappeared while DA daemon was down", buf, 0x20u);
            }

            -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", v9);
            v12 = 0;
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v6);
  }

}

- (void)_processNotificationsWithDiskOperations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "wholeDiskOperation"));
  -[SKDaemonManager _processNotificationWithDiskOperation:](self, "_processNotificationWithDiskOperation:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childrenOperations"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childrenOperations"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      do
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsProcessingQueue](self, "notificationsProcessingQueue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "processingGroup"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100028848;
        v17[3] = &unk_100045928;
        v17[4] = self;
        v14 = v4;
        v18 = v14;
        v19 = v10;
        objc_msgSend(v11, "dispatchWithGroup:block:", v13, v17);

        ++v10;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "childrenOperations"));
        v16 = objc_msgSend(v15, "count");

      }
      while (v10 < (unint64_t)v16);
    }
  }

}

- (id)_processDiskNotificationsForMap:(id)a3 isCompleteDiskList:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SKNotificationsCache *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v46[6];

  v4 = a4;
  v6 = a3;
  v7 = -[SKNotificationsCache initWithDiskOperationMap:]([SKNotificationsCache alloc], "initWithDiskOperationMap:", v6);
  -[SKDaemonManager setNotificationsCache:](self, "setNotificationsCache:", v7);

  v8 = objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "disksToProcess")),
        v12 = objc_msgSend(v11, "count"),
        v11,
        v10,
        v9,
        v12))
  {
    -[SKDaemonManager _invalidateExtendedDiskInfoCache](self, "_invalidateExtendedDiskInfoCache");
    if (v4)
      -[SKDaemonManager addMissingDisappearedDisks](self, "addMissingDisappearedDisks");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "disksToProcess"));
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v16 = 0;
      do
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsProcessingQueue](self, "notificationsProcessingQueue"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "processingGroup"));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100028C28;
        v46[3] = &unk_1000453A0;
        v46[4] = self;
        v46[5] = v16;
        objc_msgSend(v17, "dispatchWithGroup:block:", v19, v46);

        ++v16;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "disksToProcess"));
        v22 = objc_msgSend(v21, "count");

      }
      while (v16 < (unint64_t)v22);
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "processingGroup"));
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    -[SKDaemonManager updateRAIDDisks](self, "updateRAIDDisks");
    -[SKDaemonManager removeLIFSAPFSContainers](self, "removeLIFSAPFSContainers");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "appearedDisks"));
    v27 = objc_msgSend(v26, "copy");
    -[SKDaemonManager updatePhysicalStoresWithDisks:](self, "updatePhysicalStoresWithDisks:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "disappearedDisks"));
    v30 = objc_msgSend(v29, "count");

    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "disappearedDisks"));
      -[SKDaemonManager _disksDisappeared:](self, "_disksDisappeared:", v32);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "appearedDisks"));
    v35 = objc_msgSend(v34, "count");

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "appearedDisks"));
      -[SKDaemonManager _disksAppeared:](self, "_disksAppeared:", v37);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "changedDisks"));
    v40 = objc_msgSend(v39, "count");

    if (v40)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "changedDisks"));
      -[SKDaemonManager _disksChanged:](self, "_disksChanged:", v42);

    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "processedDisk"));

  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (void)removePostProcessWithCachedDisk:(id)a3
{
  id v4;

  v4 = a3;
  -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", v4);
  -[SKDaemonManager postProcessWithDisk:](self, "postProcessWithDisk:", v4);

}

- (id)_processAppearedOrChangedWithDisk:(id)a3 operation:(id)a4
{
  __DADisk *v5;
  CFDictionaryRef v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  DADiskRef v15;
  __DADisk *v16;
  __DADisk *v17;
  SKIOMedia *v18;
  SKIOMedia *v19;
  __DADisk *v20;
  id v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  __DADisk *v27;

  v5 = (__DADisk *)a3;
  v6 = DADiskCopyDescription(v5);
  if (v6)
  {
    v7 = +[SKAPFSSnapshotDisk isiOSRootSnapshotWithDiskDescription:](SKAPFSSnapshotDisk, "isiOSRootSnapshotWithDiskDescription:", v6);
    if ((v7 & 1) != 0
      || +[SKAPFSDisk isLIFSAPFSWithDiskDescription:](SKAPFSDisk, "isLIFSAPFSWithDiskDescription:", v6))
    {
      v8 = 0;
      v9 = 0;
      goto LABEL_5;
    }
    v18 = -[SKIOMedia initWithDADisk:]([SKIOMedia alloc], "initWithDADisk:", v5);
    if (v18)
    {
      v19 = v18;
      v9 = -[SKIOObject copyPropertyWithClass:key:](v18, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("Content"));
      v8 = -[SKIOObject copyPropertyWithClass:key:](v19, "copyPropertyWithClass:key:", objc_opt_class(NSString), CFSTR("UUID"));

LABEL_5:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _cachedDiskWithDADisk:](self, "_cachedDiskWithDADisk:", v5));
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "setDaDisk:", v5);
        if (!-[SKDaemonManager diskHasMutated:rawIOContent:diskDesc:mediaUUID:](self, "diskHasMutated:rawIOContent:diskDesc:mediaUUID:", v11, v9, v6, v8))
        {
          if (objc_msgSend(v11, "_cacheInfo"))
          {
            -[SKDaemonManager addChangedDisk:](self, "addChangedDisk:", v11);
            v16 = v11;
            goto LABEL_37;
          }
          goto LABEL_28;
        }
        v12 = sub_10000BA9C();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136315394;
          v25 = "-[SKDaemonManager(DiskNotifications) _processAppearedOrChangedWithDisk:operation:]";
          v26 = 2112;
          v27 = v5;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Disk %@ mutated", (uint8_t *)&v24, 0x16u);
        }

        -[SKDaemonManager removePostProcessWithCachedDisk:](self, "removePostProcessWithCachedDisk:", v11);
      }
      if (+[SKAPFSDisk isLIFSAPFSWithDiskDescription:](SKAPFSDisk, "isLIFSAPFSWithDiskDescription:", v6))
      {
        v14 = (objc_class *)SKAPFSDisk;
        goto LABEL_12;
      }
      if (+[SKAPFSStoreDisk isIOMediaStoreWithDisk:](SKAPFSStoreDisk, "isIOMediaStoreWithDisk:", v5))
      {
        v17 = (__DADisk *)objc_msgSend(objc_alloc((Class)SKAPFSStoreDisk), "initWithDADisk:isLiveFSContainer:", v5, 0);
        if (!v17)
          goto LABEL_31;
        v16 = v17;
        -[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v17);
LABEL_37:

        goto LABEL_38;
      }
      if (+[SKAPFSStoreDisk isLiveFSStoreWithRawIOContent:diskDesc:](SKAPFSStoreDisk, "isLiveFSStoreWithRawIOContent:diskDesc:", v9, v6))
      {
        v16 = (__DADisk *)objc_msgSend(objc_alloc((Class)SKAPFSStoreDisk), "initWithDADisk:isLiveFSContainer:", v5, 1);
        if (v16)
        {
          v20 = (__DADisk *)objc_msgSend(objc_alloc((Class)SKAPFSContainerDisk), "initWithPhysicalStoreDisk:", v5);
          if (v20)
          {
            v15 = v20;
            -[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v16);
            -[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v15);
LABEL_36:

            goto LABEL_37;
          }
        }
        v15 = v16;
LABEL_30:

        goto LABEL_31;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("EF57347C-0000-11AA-AA11-00306543ECAC")))
      {
        if (-[SKDaemonManager delayedAPFSDiskNotificationWithDisk:wholeDisk:](self, "delayedAPFSDiskNotificationWithDisk:wholeDisk:", v5, v5))
        {
          goto LABEL_28;
        }
        v14 = (objc_class *)SKAPFSContainerDisk;
LABEL_12:
        v15 = (DADiskRef)objc_msgSend([v14 alloc], "initWithDADisk:", v5);
        v16 = v15;
        if (-[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v15))
          goto LABEL_37;
        goto LABEL_30;
      }
      if ((v7 & 1) != 0
        || +[SKAPFSSnapshotDisk diskIsSnapshot:](SKAPFSSnapshotDisk, "diskIsSnapshot:", v5))
      {
        v14 = (objc_class *)SKAPFSSnapshotDisk;
        goto LABEL_12;
      }
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("41504653-0000-11AA-AA11-00306543ECAC")))
      {
LABEL_31:
        v15 = (DADiskRef)objc_msgSend(objc_alloc((Class)SKDisk), "initWithDADisk:", v5);
        if (-[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v15))
        {
          v16 = v15;
        }
        else
        {
          v21 = sub_10000BA9C();
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v24 = 136315394;
            v25 = "-[SKDaemonManager(DiskNotifications) _processAppearedOrChangedWithDisk:operation:]";
            v26 = 2112;
            v27 = v5;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Failed to initialize SKDisk of any kind for %@", (uint8_t *)&v24, 0x16u);
          }

          v16 = 0;
        }
        goto LABEL_36;
      }
      v15 = DADiskCopyWholeDisk(v5);
      if (!-[SKDaemonManager delayedAPFSDiskNotificationWithDisk:wholeDisk:](self, "delayedAPFSDiskNotificationWithDisk:wholeDisk:", v5, v15))
      {
        v16 = (__DADisk *)objc_msgSend(objc_alloc((Class)SKAPFSDisk), "initWithDADisk:", v5);
        if (-[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v16))
          goto LABEL_36;

        goto LABEL_30;
      }

LABEL_28:
      v16 = 0;
      goto LABEL_37;
    }
  }
  v16 = 0;
LABEL_38:

  return v16;
}

- (void)postProcessWithDisk:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;

  v3 = a3;
  v4 = objc_opt_class(SKAPFSDisk);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "apfsVolumeGroupUUID"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "container"));
      if (v7)
      {
        v28 = v3;
        v8 = sub_10000BA9C();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskIdentifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "apfsVolumeGroupUUID"));
          *(_DWORD *)buf = 136315650;
          v36 = "-[SKDaemonManager(DiskNotifications) postProcessWithDisk:]";
          v37 = 2114;
          v38 = v10;
          v39 = 2114;
          v40 = v11;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: volume %{public}@ changed or disappeared, looking for other volumes in group %{public}@", buf, 0x20u);

        }
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v27 = v7;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "volumes"));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "apfsVolumeGroupUUID"));
              if (v18)
              {
                v19 = (void *)v18;
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "apfsVolumeGroupUUID"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "apfsVolumeGroupUUID"));
                if ((objc_msgSend(v20, "isEqualToString:", v21) & 1) != 0)
                {
                  v22 = objc_msgSend(v5, "isEqual:", v17);

                  if ((v22 & 1) == 0)
                  {
                    v23 = sub_10000BA9C();
                    v24 = objc_claimAutoreleasedReturnValue(v23);
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                    {
                      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "diskIdentifier"));
                      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "apfsVolumeGroupUUID"));
                      *(_DWORD *)buf = 136315650;
                      v36 = "-[SKDaemonManager(DiskNotifications) postProcessWithDisk:]";
                      v37 = 2114;
                      v38 = v25;
                      v39 = 2114;
                      v40 = v26;
                      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: %{public}@ is also a member of %{public}@ group, re-caching it", buf, 0x20u);

                    }
                    if (objc_msgSend(v17, "_cacheInfo"))
                      -[SKDaemonManager addChangedDisk:](self, "addChangedDisk:", v17);
                  }
                }
                else
                {

                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          }
          while (v14);
        }

        v7 = v27;
        v3 = v28;
      }

    }
  }

}

- (void)_processNotificationWithDiskOperation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  int v16;
  id v17;

  v4 = a3;
  v5 = sub_10000BA9C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543362;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting to process: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100051A18));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", off_100051A50));
  if (objc_msgSend(v7, "isEqualToString:", off_100051A30))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _cachedDiskWithDADisk:](self, "_cachedDiskWithDADisk:", v8));
    -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager _processAppearedOrChangedWithDisk:operation:](self, "_processAppearedOrChangedWithDisk:operation:", v8, v4));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    objc_sync_enter(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "processedDisk"));
    v14 = v13 == 0;

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
      objc_msgSend(v15, "setProcessedDisk:", v10);

    }
    objc_sync_exit(v11);

    if (objc_msgSend(v7, "isEqualToString:", off_100051A28))
      v9 = v10;
    else
      v9 = 0;

  }
  if (v9)
    -[SKDaemonManager postProcessWithDisk:](self, "postProcessWithDisk:", v9);

}

- (void)updatePhysicalStoresWithContainer:(id)a3
{
  void *v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  NSMutableArray *obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v23 = a3;
  v25 = objc_msgSend(v23, "copyPhysicalStoresUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  obj = self->allDisks;
  objc_sync_enter(obj);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = self->allDisks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isMemberOfClass:", objc_opt_class(SKDisk)))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mediaUUID"));
          v11 = objc_msgSend(v25, "containsObject:", v10);

          if (v11)
            objc_msgSend(v4, "addObject:", v9);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v6);
  }

  objc_sync_exit(obj);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
        v17 = sub_10000BA9C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "diskIdentifier"));
          *(_DWORD *)buf = 136315394;
          v35 = "-[SKDaemonManager(DiskNotifications) updatePhysicalStoresWithContainer:]";
          v36 = 2114;
          v37 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Re-creating APFS physical store %{public}@", buf, 0x16u);

        }
        v20 = objc_alloc((Class)SKAPFSStoreDisk);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "daDisk"));
        v22 = objc_msgSend(v20, "initWithDADisk:isLiveFSContainer:", v21, 0);

        if (v22)
        {
          -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", v16);
          -[SKDaemonManager addAppearedDisk:](self, "addAppearedDisk:", v22);
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v13);
  }

}

- (void)updatePhysicalStoresWithDisks:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(SKAPFSContainerDisk);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0 && (objc_msgSend(v9, "isLiveFSAPFSDisk") & 1) == 0)
          -[SKDaemonManager updatePhysicalStoresWithContainer:](self, "updatePhysicalStoresWithContainer:", v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)diskHasMutated:(id)a3 rawIOContent:(id)a4 diskDesc:(id)a5 mediaUUID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  BOOL v15;
  unsigned int v16;
  unsigned int v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  uint64_t v20;
  char isKindOfClass;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  int v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "isIOMediaDisk"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "daDisk"));
    if (+[SKAPFSStoreDisk isIOMediaStoreWithDisk:](SKAPFSStoreDisk, "isIOMediaStoreWithDisk:", v13))
      v14 = 1;
    else
      v14 = +[SKAPFSStoreDisk isLiveFSStoreWithRawIOContent:diskDesc:](SKAPFSStoreDisk, "isLiveFSStoreWithRawIOContent:diskDesc:", v10, v11);
    v16 = objc_msgSend(v10, "isEqualToString:", CFSTR("EF57347C-0000-11AA-AA11-00306543ECAC"));
    v17 = objc_msgSend(v10, "isEqualToString:", CFSTR("41504653-0000-11AA-AA11-00306543ECAC"));
    v18 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class(SKAPFSStoreDisk));
    if (v14)
    {
      if ((v18 & 1) == 0)
        goto LABEL_16;
    }
    else if ((v18 & 1) != 0)
    {
      goto LABEL_16;
    }
    v19 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class(SKAPFSContainerDisk));
    if (v16)
    {
      if ((v19 & 1) == 0)
        goto LABEL_16;
LABEL_14:
      v20 = objc_opt_class(SKAPFSDisk);
      isKindOfClass = objc_opt_isKindOfClass(v9, v20);
      if (v17)
      {
        if ((isKindOfClass & 1) == 0)
          goto LABEL_16;
      }
      else if ((isKindOfClass & 1) != 0)
      {
        goto LABEL_16;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mediaUUID"));
      v24 = v12;
      v25 = v24;
      if ((v24 != 0) != (v23 != 0) || v24 && (objc_msgSend(v23, "isEqualToString:", v24) & 1) == 0)
      {
        v26 = sub_10000BA9C();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "diskIdentifier"));
          v29 = (objc_class *)objc_opt_class(v9);
          v30 = NSStringFromClass(v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          v32 = 136316162;
          v33 = "-[SKDaemonManager(DiskNotifications) diskHasMutated:rawIOContent:diskDesc:mediaUUID:]";
          v34 = 2114;
          v35 = v28;
          v36 = 2114;
          v37 = v31;
          v38 = 2114;
          v39 = v23;
          v40 = 2114;
          v41 = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: UUID of %{public}@ (%{public}@) changed from %{public}@ to %{public}@", (uint8_t *)&v32, 0x34u);

        }
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }

      goto LABEL_17;
    }
    if ((v19 & 1) == 0)
      goto LABEL_14;
LABEL_16:
    v15 = 1;
LABEL_17:

    goto LABEL_18;
  }
  v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)delayedAPFSDiskNotificationWithDisk:(id)a3 wholeDisk:(id)a4
{
  return 0;
}

- (void)removeLIFSAPFSContainers
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager notificationsCache](self, "notificationsCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "disappearedDisks"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v11 = objc_opt_class(SKAPFSStoreDisk);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "privateCache"));
          v14 = objc_msgSend(v13, "isLiveFSContainer");

          if (v14)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "container"));
            v16 = v15;
            if (v15)
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "designatedPhysicalStore"));
              if (!v17)
                objc_msgSend(v3, "addObject:", v16);

            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v3;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        -[SKDaemonManager addDisappearedDisk:](self, "addDisappearedDisk:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j), (_QWORD)v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

}

@end
