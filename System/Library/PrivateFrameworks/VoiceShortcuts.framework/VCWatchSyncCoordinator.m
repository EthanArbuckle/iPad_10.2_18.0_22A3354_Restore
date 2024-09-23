@implementation VCWatchSyncCoordinator

- (VCWatchSyncCoordinator)initWithSyncDataEndpoint:(id)a3 eventHandler:(id)a4
{
  id v6;
  VCWatchSyncCoordinator *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  VCWatchSyncCoordinator *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  VCCompanionSyncService *v15;
  VCCompanionSyncService *service;
  uint64_t v17;
  NSMutableSet *startedSessions;
  uint64_t v19;
  PSYSyncCoordinator *pairedSyncCoordinator;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VCWatchSyncCoordinator;
  v7 = -[VCWatchSyncCoordinator init](&v22, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "idiom") == 1)
    {
      getWFWatchSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[VCWatchSyncCoordinator initWithSyncDataEndpoint:eventHandler:]";
        v10 = "%s Not running WatchSync on iPad";
LABEL_16:
        _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
      }
    }
    else if (objc_opt_class())
    {
      if (objc_opt_class())
      {
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v12 = objc_claimAutoreleasedReturnValue();
        dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
        v9 = objc_claimAutoreleasedReturnValue();

        v13 = dispatch_queue_create("com.apple.VCWatchSyncCoordinator", v9);
        queue = v7->_queue;
        v7->_queue = (OS_dispatch_queue *)v13;

        objc_storeStrong((id *)&v7->_syncDataEndpoint, a3);
        v15 = -[VCCompanionSyncService initWithSyncDataEndpoint:]([VCCompanionSyncService alloc], "initWithSyncDataEndpoint:", v6);
        service = v7->_service;
        v7->_service = v15;

        -[VCCompanionSyncService setDelegate:](v7->_service, "setDelegate:", v7);
        if (v7->_service)
        {
          v17 = objc_opt_new();
          startedSessions = v7->_startedSessions;
          v7->_startedSessions = (NSMutableSet *)v17;

          objc_msgSend(MEMORY[0x1E0D65238], "syncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.siriactionsd"));
          v19 = objc_claimAutoreleasedReturnValue();
          pairedSyncCoordinator = v7->_pairedSyncCoordinator;
          v7->_pairedSyncCoordinator = (PSYSyncCoordinator *)v19;

          -[PSYSyncCoordinator setDelegate:queue:](v7->_pairedSyncCoordinator, "setDelegate:queue:", v7, v7->_queue);
          if (v7->_service)
            -[VCWatchSyncCoordinator startObservingWatchChangeNotifications](v7, "startObservingWatchChangeNotifications");
          v11 = v7;
          goto LABEL_18;
        }
      }
      else
      {
        getWFWatchSyncLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "-[VCWatchSyncCoordinator initWithSyncDataEndpoint:eventHandler:]";
          v10 = "%s The NanoRegistry framework is not present on this device";
          goto LABEL_16;
        }
      }
    }
    else
    {
      getWFWatchSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[VCWatchSyncCoordinator initWithSyncDataEndpoint:eventHandler:]";
        v10 = "%s The PairedSync framework is not present on this device";
        goto LABEL_16;
      }
    }
    v11 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[VCWatchSyncCoordinator stopObservingWatchChangeNotifications](self, "stopObservingWatchChangeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)VCWatchSyncCoordinator;
  -[VCWatchSyncCoordinator dealloc](&v3, sel_dealloc);
}

- (void)requestSyncIfUnrestricted
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VCWatchSyncCoordinator service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[VCWatchSyncCoordinator companionSyncServiceShouldStartSession:](self, "companionSyncServiceShouldStartSession:", v3);

  if (v4)
  {
    -[VCWatchSyncCoordinator pairedSyncCoordinator](self, "pairedSyncCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeSyncSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "sessionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCWatchSyncCoordinator startedSessions](self, "startedSessions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "containsObject:", v7);

      if ((v9 & 1) == 0)
      {
        v10 = objc_msgSend(v6, "syncSessionType");
        -[VCWatchSyncCoordinator service](self, "service");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
          objc_msgSend(v11, "requestSyncImmediately");
        else
          objc_msgSend(v11, "requestFullResync");

        -[VCWatchSyncCoordinator startedSessions](self, "startedSessions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v7);

        getWFWatchSyncLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = 136315394;
          v16 = "-[VCWatchSyncCoordinator requestSyncIfUnrestricted]";
          v17 = 2114;
          v18 = v7;
          _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_INFO, "%s Requested CompanionSync session for PairedSync session %{public}@", (uint8_t *)&v15, 0x16u);
        }

      }
    }
    else
    {
      -[VCWatchSyncCoordinator service](self, "service");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "requestSync");
    }

  }
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFWatchSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "sessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[VCWatchSyncCoordinator syncCoordinator:beginSyncSession:]";
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Starting PairedSync session %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[VCWatchSyncCoordinator requestSyncIfUnrestricted](self, "requestSyncIfUnrestricted");

}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFWatchSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "sessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[VCWatchSyncCoordinator syncCoordinator:didInvalidateSyncSession:]";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Invalidated PairedSync session %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[VCWatchSyncCoordinator startedSessions](self, "startedSessions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v9);

}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFWatchSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[VCWatchSyncCoordinator syncCoordinatorDidChangeSyncRestriction:]";
    v8 = 2048;
    v9 = objc_msgSend(v4, "syncRestriction");
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Sync restriction changed to %lu", (uint8_t *)&v6, 0x16u);
  }

  -[VCWatchSyncCoordinator requestSyncIfUnrestricted](self, "requestSyncIfUnrestricted");
}

- (BOOL)companionSyncServiceShouldStartSession:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[VCWatchSyncCoordinator pairedSyncCoordinator](self, "pairedSyncCoordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "syncRestriction");

  if (v4 == 1)
  {
    getWFWatchSyncLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[VCWatchSyncCoordinator companionSyncServiceShouldStartSession:]";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Not syncing because of PSYSyncRestrictionLimitPush", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4 != 1;
}

- (int64_t)companionSyncService:(id)a3 typeForSession:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[VCWatchSyncCoordinator pairedSyncCoordinator](self, "pairedSyncCoordinator", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSyncSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "syncSessionType");
    if (v6)
      v7 = 2 * (v6 == 1);
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)companionSyncService:(id)a3 didFinishSyncSession:(id)a4 withError:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  -[VCWatchSyncCoordinator pairedSyncCoordinator](self, "pairedSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeSyncSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
    {
      objc_msgSend(v8, "syncDidFailWithError:", v6);
      getWFWatchSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "sessionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 136315650;
        v16 = "-[VCWatchSyncCoordinator companionSyncService:didFinishSyncSession:withError:]";
        v17 = 2114;
        v18 = v10;
        v19 = 2114;
        v20 = v6;
        v11 = "%s PairedSync session %{public}@ failed with error: %{public}@";
        v12 = v9;
        v13 = OS_LOG_TYPE_ERROR;
        v14 = 32;
LABEL_7:
        _os_log_impl(&dword_1C146A000, v12, v13, v11, (uint8_t *)&v15, v14);

      }
    }
    else
    {
      objc_msgSend(v8, "syncDidComplete");
      getWFWatchSyncLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "sessionIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 136315394;
        v16 = "-[VCWatchSyncCoordinator companionSyncService:didFinishSyncSession:withError:]";
        v17 = 2114;
        v18 = v10;
        v11 = "%s Completed PairedSync session %{public}@ succesfully";
        v12 = v9;
        v13 = OS_LOG_TYPE_INFO;
        v14 = 22;
        goto LABEL_7;
      }
    }

  }
}

- (void)companionSyncService:(id)a3 didRejectSessionWithError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[VCWatchSyncCoordinator pairedSyncCoordinator](self, "pairedSyncCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeSyncSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v5)
    {
      objc_msgSend(v7, "syncDidFailWithError:", v5);
      getWFWatchSyncLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "sessionIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[VCWatchSyncCoordinator companionSyncService:didRejectSessionWithError:]";
        v16 = 2114;
        v17 = v9;
        v18 = 2114;
        v19 = v5;
        v10 = "%s PairedSync session %{public}@ failed to start syncing with error: %{public}@";
        v11 = v8;
        v12 = OS_LOG_TYPE_ERROR;
        v13 = 32;
LABEL_7:
        _os_log_impl(&dword_1C146A000, v11, v12, v10, (uint8_t *)&v14, v13);

      }
    }
    else
    {
      objc_msgSend(v7, "syncDidComplete");
      getWFWatchSyncLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v7, "sessionIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315394;
        v15 = "-[VCWatchSyncCoordinator companionSyncService:didRejectSessionWithError:]";
        v16 = 2114;
        v17 = v9;
        v10 = "%s Completed PairedSync session %{public}@ succesfully because no changes had to be sent";
        v11 = v8;
        v12 = OS_LOG_TYPE_INFO;
        v13 = 22;
        goto LABEL_7;
      }
    }

  }
}

- (void)companionSyncService:(id)a3 outgoingSyncSessionDidFinishSendingChanges:(id)a4
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[VCWatchSyncCoordinator pairedSyncCoordinator](self, "pairedSyncCoordinator", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSyncSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "syncDidCompleteSending");
    getWFWatchSyncLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "sessionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[VCWatchSyncCoordinator companionSyncService:outgoingSyncSessionDidFinishSendingChanges:]";
      v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Finished sending changes for PairedSync session %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

- (void)companionSyncService:(id)a3 outgoingSyncSession:(id)a4 didUpdateProgress:(double)a5
{
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VCWatchSyncCoordinator pairedSyncCoordinator](self, "pairedSyncCoordinator", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeSyncSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "reportProgress:", a5);
    getWFWatchSyncLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "sessionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315650;
      v11 = "-[VCWatchSyncCoordinator companionSyncService:outgoingSyncSession:didUpdateProgress:]";
      v12 = 2048;
      v13 = a5;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, "%s Reported progress %f for PairedSync session %{public}@", (uint8_t *)&v10, 0x20u);

    }
  }

}

- (void)startObservingWatchChangeNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D517D8];
  objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleDidUnpairNotification_, v3, v4);

  -[VCWatchSyncCoordinator eventHandler](self, "eventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:", self, sel_handleDeviceDidChangeVersionNotification, CFSTR("com.apple.nanoregistry.paireddevicedidchangeversion"));

}

- (void)stopObservingWatchChangeNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D517D8];
  objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, v3, v4);

  -[VCWatchSyncCoordinator eventHandler](self, "eventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:", self, CFSTR("com.apple.nanoregistry.paireddevicedidchangeversion"));

}

- (void)handleDeviceDidChangeVersionNotification
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFWatchSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[VCWatchSyncCoordinator handleDeviceDidChangeVersionNotification]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Received PairedDeviceDidChangeVersion notification", (uint8_t *)&v4, 0xCu);
  }

  -[VCWatchSyncCoordinator requestSyncIfUnrestricted](self, "requestSyncIfUnrestricted");
}

- (void)handleDidUnpairNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  VCNRDeviceSyncService *v8;
  void *v9;
  VCNRDeviceSyncService *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D517A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  getWFWatchSyncLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[VCWatchSyncCoordinator handleDidUnpairNotification:]";
    v30 = 2114;
    v31 = v7;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s received DidUnpair notification for pairingID=%{public}@", buf, 0x16u);

  }
  v22 = v5;
  if (v5)
  {
    v8 = [VCNRDeviceSyncService alloc];
    -[VCWatchSyncCoordinator service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[VCNRDeviceSyncService initWithCompanionSyncService:device:](v8, "initWithCompanionSyncService:device:", v9, v5);

  }
  else
  {
    v10 = 0;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[VCWatchSyncCoordinator syncDataEndpoint](self, "syncDataEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "syncDataHandlers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v23 = 0;
        v18 = objc_msgSend(v17, "resetSyncStateForService:error:", v10, &v23);
        v19 = v23;
        if ((v18 & 1) == 0)
        {
          getWFWatchSyncLogObject();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            -[VCNRDeviceSyncService syncServiceIdentifier](v10, "syncServiceIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v29 = "-[VCWatchSyncCoordinator handleDidUnpairNotification:]";
            v30 = 2114;
            v31 = v21;
            v32 = 2114;
            v33 = v19;
            _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_ERROR, "%s Error removing sync state for sync service with identifier=%{public}@: %{public}@", buf, 0x20u);

          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v14);
  }

}

- (PSYSyncCoordinator)pairedSyncCoordinator
{
  return self->_pairedSyncCoordinator;
}

- (NSMutableSet)startedSessions
{
  return self->_startedSessions;
}

- (VCSyncDataEndpoint)syncDataEndpoint
{
  return self->_syncDataEndpoint;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (VCCompanionSyncService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_syncDataEndpoint, 0);
  objc_storeStrong((id *)&self->_startedSessions, 0);
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
}

@end
