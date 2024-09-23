@implementation _DASRemoteDeviceActivityMonitor

- (id)state
{
  os_unfair_lock_s *p_lock;
  NSMutableSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_remoteDeviceActivityState;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)anyRemoteDeviceActive
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableSet count](self->_remoteDeviceActivityState, "count");
  os_unfair_lock_unlock(p_lock);
  return v4 != 0;
}

- (void)clearRemoteDeviceActiveSet
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeAllObjects](self->_remoteDeviceActivityState, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isRegistered
{
  return self->_sink != 0;
}

- (void)registerForRemoteDeviceActiveNotificationsWithChange:(id)a3
{
  id v4;
  ContextSyncClient *contextSyncClient;
  BMDSL *remoteDSL;
  void *v7;
  NSObject *v8;
  BMBiomeScheduler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BPSSink *v13;
  BMBiomeScheduler *scheduler;
  BMBiomeScheduler *v15;
  BPSSink *sink;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  if (-[NSMutableDictionary count](self->_recentlyUsedPhotosAppDevices, "count"))
  {
    contextSyncClient = self->_contextSyncClient;
    remoteDSL = self->_remoteDSL;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyUsedPhotosAppDevices, "allKeys"));
    v19 = 0;
    -[ContextSyncClient registerForUpdates:withIdentifier:forUseCase:withOptions:forDevices:withError:](contextSyncClient, "registerForUpdates:withIdentifier:forUseCase:withOptions:forDevices:withError:", remoteDSL, CFSTR("com.apple.duetactivityscheduler.remotedeviceactivitymonitor"), CFSTR("PhotosIntentSyncRemoteDeviceActivity"), 3, v7, &v19);
    v8 = v19;

    os_unfair_lock_lock(&self->_lock);
    -[NSMutableSet removeAllObjects](self->_remoteDeviceActivityState, "removeAllObjects");
    os_unfair_lock_unlock(&self->_lock);
    self->_pendingUnregistration = 0;
    v9 = (BMBiomeScheduler *)objc_msgSend(objc_alloc((Class)BMBiomeScheduler), "initWithIdentifier:targetQueue:", CFSTR("com.apple.duetactivityscheduler.remotedeviceactivitymonitor"), self->_queue);
    v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyUsedPhotosAppDevices, "allKeys"));
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DASContext: Registering for remote device activity for devices: %@", buf, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BMDSL subscribeOn:](self->_localDSL, "subscribeOn:", v9));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000DCD74;
    v17[3] = &unk_100160678;
    v17[4] = self;
    v18 = v4;
    v13 = (BPSSink *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sinkWithCompletion:receiveInput:", &stru_100160650, v17));

    scheduler = self->_scheduler;
    self->_scheduler = v9;
    v15 = v9;

    sink = self->_sink;
    self->_sink = v13;

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DASContext: No remote devices recently used Photos. Not registering", buf, 2u);
    }
  }

}

- (void)unregisterForRemoteDeviceActiveNotifications
{
  id v3;
  ContextSyncClient *contextSyncClient;
  BMDSL *remoteDSL;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  BPSSink *sink;
  BMBiomeScheduler *scheduler;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;

  v3 = -[NSMutableDictionary count](self->_recentlyUsedPhotosAppDevices, "count");
  contextSyncClient = self->_contextSyncClient;
  remoteDSL = self->_remoteDSL;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyUsedPhotosAppDevices, "allKeys"));
    v12 = 0;
    -[ContextSyncClient unregisterForUpdates:withIdentifier:forUseCase:forDevices:withError:](contextSyncClient, "unregisterForUpdates:withIdentifier:forUseCase:forDevices:withError:", remoteDSL, CFSTR("com.apple.duetactivityscheduler.remotedeviceactivitymonitor"), CFSTR("PhotosIntentSyncRemoteDeviceActivity"), v6, &v12);
    v7 = v12;

  }
  else
  {
    v13 = 0;
    -[ContextSyncClient unregisterForUpdates:withIdentifier:forUseCase:forDeviceTypes:withError:](contextSyncClient, "unregisterForUpdates:withIdentifier:forUseCase:forDeviceTypes:withError:", remoteDSL, CFSTR("com.apple.duetactivityscheduler.remotedeviceactivitymonitor"), CFSTR("PhotosIntentSyncRemoteDeviceActivity"), 6, &v13);
    v7 = v13;
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeAllObjects](self->_remoteDeviceActivityState, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  self->_pendingUnregistration = 0;
  v8 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_recentlyUsedPhotosAppDevices, "allKeys"));
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DASContext: Unregistering for remote device activity for devices: %@", buf, 0xCu);

  }
  -[BPSSink cancel](self->_sink, "cancel");
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

}

- (void)runUpdateRecentlyUsedPhotosAppDevicesTask
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSMutableDictionary *recentlyUsedPhotosAppDevices;
  _QWORD v23[4];
  id v24;
  _DASRemoteDeviceActivityMonitor *v25;
  id v26;
  uint8_t buf[4];
  _QWORD v28[2];

  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "schedule: Running updateRecentlyUsedPhotosAppDevices background task", buf, 2u);
  }

  if (!-[_DASRemoteDeviceActivityMonitor isRegistered](self, "isRegistered"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableDictionary removeAllObjects](self->_recentlyUsedPhotosAppDevices, "removeAllObjects");
    os_unfair_lock_unlock(&self->_lock);
    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    objc_msgSend(v5, "setObject:forKey:", self->_recentlyUsedPhotosAppDevices, CFSTR("recentlyusedphotosappdevices"));

    v6 = (void *)objc_opt_new(BMSyncService);
    v26 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteDevicesWithError:", &v26));
    v4 = v26;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1001606B8));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v8));

    if (v4)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000EC028((uint64_t)v4, v10);
    }
    else
    {
      if (!objc_msgSend(v9, "count"))
      {
LABEL_16:

        goto LABEL_17;
      }
      v11 = +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v13 = v12 + -345600.0;
      v14 = BiomeLibrary(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "App"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "InFocus"));

      v17 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28[0] = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DASContext: Remote devices from stream: %@", buf, 0xCu);
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject publishersForDevices:withUseCase:startTime:includeLocal:pipeline:](v10, "publishersForDevices:withUseCase:startTime:includeLocal:pipeline:", v9, CFSTR("PhotosIntentSyncRemoteDeviceAppInFocus"), 0, &stru_1001606F8, v13));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "publishers"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000DD620;
      v23[3] = &unk_100160788;
      v24 = v9;
      v25 = self;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v23);

      v20 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
      objc_msgSend(v20, "setObject:forKey:", self->_recentlyUsedPhotosAppDevices, CFSTR("recentlyusedphotosappdevices"));

      v21 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        recentlyUsedPhotosAppDevices = self->_recentlyUsedPhotosAppDevices;
        *(_DWORD *)buf = 67109378;
        LODWORD(v28[0]) = 4;
        WORD2(v28[0]) = 2112;
        *(_QWORD *)((char *)v28 + 6) = recentlyUsedPhotosAppDevices;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "DASContext: Remote devices that opened Photos in the last %d days: %@", buf, 0x12u);
      }

    }
    goto LABEL_16;
  }
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DASContext: Will not update recently used Photos App remote devices while currently registered to a set of devices", buf, 2u);
  }
LABEL_17:

}

- (void)scheduleUpdateRecentlyUsedPhotosAppDevices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DDA20;
  v12[3] = &unk_10015D5E8;
  v12[4] = self;
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.dasd.updateRecentlyUsedPhotosAppDevices"), 0, v12);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskRequestForIdentifier:", CFSTR("com.apple.dasd.updateRecentlyUsedPhotosAppDevices")));

  if (!v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)BGRepeatingSystemTaskRequest), "initWithIdentifier:", CFSTR("com.apple.dasd.updateRecentlyUsedPhotosAppDevices"));
    objc_msgSend(v6, "setPriority:", 1);
    objc_msgSend(v6, "setRequiresExternalPower:", 1);
    objc_msgSend(v6, "setInterval:", 86400.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](BGSystemTaskScheduler, "sharedScheduler"));
    v11 = 0;
    v8 = objc_msgSend(v7, "submitTaskRequest:error:", v6, &v11);
    v9 = v11;

    if ((v8 & 1) == 0)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to submit task with error: %@", buf, 0xCu);
      }

    }
  }
}

- (_DASRemoteDeviceActivityMonitor)initWithDaemon:(id)a3
{
  id v5;
  _DASRemoteDeviceActivityMonitor *v6;
  _DASRemoteDeviceActivityMonitor *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  ContextSyncClient *v12;
  ContextSyncClient *contextSyncClient;
  uint64_t v14;
  NSMutableSet *remoteDeviceActivityState;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BMDSL *remoteDSL;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BMDSL *localDSL;
  id v31;
  void *v32;
  NSMutableDictionary *v33;
  NSMutableDictionary *recentlyUsedPhotosAppDevices;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  NSObject *v37;
  NSMutableDictionary *v38;
  NSObject *v39;
  objc_super v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  NSMutableDictionary *v45;

  v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_DASRemoteDeviceActivityMonitor;
  v6 = -[_DASRemoteDeviceActivityMonitor init](&v41, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemon, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.duetactivityscheduler.remotedeviceactivitymonitor", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = (ContextSyncClient *)objc_msgSend(objc_alloc((Class)ContextSyncClient), "initWithClientName:", CFSTR("com.apple.duetactivityscheduler.remotedeviceactivitymonitor"));
    contextSyncClient = v7->_contextSyncClient;
    v7->_contextSyncClient = v12;

    v7->_lock._os_unfair_lock_opaque = 0;
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    remoteDeviceActivityState = v7->_remoteDeviceActivityState;
    v7->_remoteDeviceActivityState = (NSMutableSet *)v14;

    v17 = BiomeLibrary(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "Activity"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "Level"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "DSLPublisher"));
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "filterWithKeyPath:comparison:value:", CFSTR("eventBody.inUseStatus"), 0, &off_10016F1E8));
    remoteDSL = v7->_remoteDSL;
    v7->_remoteDSL = (BMDSL *)v22;

    v25 = BiomeLibrary(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ContextSync"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "DeviceActivityLevel"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "DSLPublisher"));
    localDSL = v7->_localDSL;
    v7->_localDSL = (BMDSL *)v29;

    v31 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "dictionaryForKey:", CFSTR("recentlyusedphotosappdevices")));
    v33 = (NSMutableDictionary *)objc_msgSend(v32, "mutableCopy");
    recentlyUsedPhotosAppDevices = v7->_recentlyUsedPhotosAppDevices;
    v7->_recentlyUsedPhotosAppDevices = v33;

    if (!v7->_recentlyUsedPhotosAppDevices)
    {
      v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v36 = v7->_recentlyUsedPhotosAppDevices;
      v7->_recentlyUsedPhotosAppDevices = v35;

    }
    v37 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v7->_recentlyUsedPhotosAppDevices;
      *(_DWORD *)buf = 67109378;
      v43 = 4;
      v44 = 2112;
      v45 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "DASContext: Loaded from defaults - remote devices that opened Photos in the last %d days: %@", buf, 0x12u);
    }

    v7->_pendingUnregistration = 0;
    v39 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger defaultCategory](_DASDaemonLogger, "defaultCategory"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "DASContext: Set up remote device activity monitor", buf, 2u);
    }

  }
  return v7;
}

+ (id)sharedMonitorWithDaemon:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000DDDF8;
  v11 = &unk_10015DF50;
  v12 = a3;
  v13 = a1;
  v4 = qword_1001ABEB8;
  v5 = v12;
  if (v4 != -1)
    dispatch_once(&qword_1001ABEB8, &v8);
  objc_msgSend((id)qword_1001ABEC0, "scheduleUpdateRecentlyUsedPhotosAppDevices", v8, v9, v10, v11);
  v6 = (id)qword_1001ABEC0;

  return v6;
}

- (BOOL)pendingUnregistration
{
  return self->_pendingUnregistration;
}

- (void)setPendingUnregistration:(BOOL)a3
{
  self->_pendingUnregistration = a3;
}

- (_DASDaemon)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (ContextSyncClient)contextSyncClient
{
  return self->_contextSyncClient;
}

- (void)setContextSyncClient:(id)a3
{
  objc_storeStrong((id *)&self->_contextSyncClient, a3);
}

- (BMDSL)remoteDSL
{
  return self->_remoteDSL;
}

- (void)setRemoteDSL:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDSL, a3);
}

- (BMDSL)localDSL
{
  return self->_localDSL;
}

- (void)setLocalDSL:(id)a3
{
  objc_storeStrong((id *)&self->_localDSL, a3);
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
{
  objc_storeStrong((id *)&self->_sink, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableSet)remoteDeviceActivityState
{
  return self->_remoteDeviceActivityState;
}

- (void)setRemoteDeviceActivityState:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceActivityState, a3);
}

- (NSMutableDictionary)recentlyUsedPhotosAppDevices
{
  return self->_recentlyUsedPhotosAppDevices;
}

- (void)setRecentlyUsedPhotosAppDevices:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyUsedPhotosAppDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyUsedPhotosAppDevices, 0);
  objc_storeStrong((id *)&self->_remoteDeviceActivityState, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_localDSL, 0);
  objc_storeStrong((id *)&self->_remoteDSL, 0);
  objc_storeStrong((id *)&self->_contextSyncClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
