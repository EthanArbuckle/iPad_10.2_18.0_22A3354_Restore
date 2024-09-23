@implementation QLNetworkStateObserver

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__QLNetworkStateObserver_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance__sharedInstance;
}

void __40__QLNetworkStateObserver_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v1;

}

- (QLNetworkStateObserver)init
{
  QLNetworkStateObserver *v2;
  QLNetworkStateObserver *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLNetworkStateObserver;
  v2 = -[QLNetworkStateObserver init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[QLNetworkStateObserver _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  NSMutableArray *v3;
  NSMutableArray *completionBlocks;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  RadiosPreferences *v7;
  RadiosPreferences *radiosPreferences;

  v3 = (NSMutableArray *)objc_opt_new();
  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = v3;

  self->_iCloudDriveReachabilityToken = -1;
  if (!+[QLNetworkStateObserver usingRemoteNetworkObserver](QLNetworkStateObserver, "usingRemoteNetworkObserver"))
  {
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.quicklook.networkwatcher", 0);
    queue = self->_queue;
    self->_queue = v5;

    v7 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x1E0CFA9B8]);
    radiosPreferences = self->_radiosPreferences;
    self->_radiosPreferences = v7;

    -[RadiosPreferences setDelegate:](self->_radiosPreferences, "setDelegate:", self);
    -[QLNetworkStateObserver startObserving](self, "startObserving");
  }
}

- (void)setRemoteObserver:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObserver, a3);
  -[QLNetworkStateObserver _updateRemoteObserver](self, "_updateRemoteObserver");
}

- (void)pushOperation
{
  QLNetworkStateObserver *obj;

  obj = self;
  objc_sync_enter(obj);
  ++obj->_stack;
  -[QLNetworkStateObserver _updateNetworkActivityIndicator](obj, "_updateNetworkActivityIndicator");
  objc_sync_exit(obj);

}

- (void)popOperation
{
  QLNetworkStateObserver *obj;

  obj = self;
  objc_sync_enter(obj);
  --obj->_stack;
  -[QLNetworkStateObserver _updateNetworkActivityIndicator](obj, "_updateNetworkActivityIndicator");
  objc_sync_exit(obj);

}

- (void)_updateNetworkStateWithNotifyToken:(int)a3
{
  uint32_t state;
  uint32_t v5;
  NSObject **v6;
  NSObject *v7;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  state = notify_get_state(a3, &state64);
  if (state)
  {
    v5 = state;
    v6 = (NSObject **)MEMORY[0x1E0D83678];
    v7 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v5;
      _os_log_impl(&dword_1D936E000, v7, OS_LOG_TYPE_DEFAULT, "Could not get state of the CloudDocs availability notification: error %u #Downloading", buf, 8u);
    }
    -[QLNetworkStateObserver _setNetworkState:](self, "_setNetworkState:", 0);
  }
  else
  {
    -[QLNetworkStateObserver _updateNetworkStateWithFlags:](self, "_updateNetworkStateWithFlags:", state64);
  }
}

- (void)startObserving
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__QLNetworkStateObserver_startObserving__block_invoke;
  v2[3] = &unk_1E9EFC370;
  v2[4] = self;
  QLRunInBackgroundThread(v2);
}

void __40__QLNetworkStateObserver_startObserving__block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  uint64_t v4;
  double v5;
  id v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  uint32_t v10;
  NSObject **v11;
  NSObject *v12;
  uint64_t v13;
  const __SCNetworkReachability *v14;
  NSObject **v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  NSObject **v20;
  NSObject *v21;
  _QWORD handler[4];
  id v23;
  id location[2];
  uint8_t buf[4];
  uint32_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = objc_msgSend((id)objc_opt_class(), "networkAccessShouldGoThroughCloudDocsDaemon");
  v4 = *(_QWORD *)(a1 + 32);
  if (!v3)
  {
    if (*(_QWORD *)(v4 + 64))
      goto LABEL_25;
    *(_QWORD *)(v4 + 32) = v4;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = SCNetworkReachabilityCreateWithName(0, "apple.com");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(const __SCNetworkReachability **)(v13 + 64);
    if (v14)
    {
      if (SCNetworkReachabilitySetCallback(v14, (SCNetworkReachabilityCallBack)_reachabilityDidChange, (SCNetworkReachabilityContext *)(v13 + 24))&& SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(*(_QWORD *)(a1 + 32) + 64), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16)))
      {
        goto LABEL_25;
      }
      v15 = (NSObject **)MEMORY[0x1E0D83678];
      v16 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v16 = *v15;
      }
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 76) = 0;
        objc_msgSend(*(id *)(a1 + 32), "_setNetworkState:", 2);
        goto LABEL_25;
      }
      LOWORD(location[0]) = 0;
      v17 = "Couldn't set reachability callback or queue #Downloading";
      v18 = v16;
      v19 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      v20 = (NSObject **)MEMORY[0x1E0D83678];
      v21 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v21 = *v20;
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      LOWORD(location[0]) = 0;
      v17 = "Couldn't create reachability object #Downloading";
      v18 = v21;
      v19 = OS_LOG_TYPE_DEFAULT;
    }
    _os_log_impl(&dword_1D936E000, v18, v19, v17, (uint8_t *)location, 2u);
    goto LABEL_22;
  }
  if ((*(_DWORD *)(v4 + 72) & 0x80000000) != 0)
  {
    objc_initWeak(location, (id)v4);
    BRNotificationNameForServerAvailabilityChanges_delayInitStub(v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __40__QLNetworkStateObserver_startObserving__block_invoke_2;
    handler[3] = &unk_1E9EFC348;
    objc_copyWeak(&v23, location);
    v10 = notify_register_dispatch(v7, (int *)(v8 + 72), v9, handler);

    if (v10)
    {
      v11 = (NSObject **)MEMORY[0x1E0D83678];
      v12 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v26 = v10;
        _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_DEFAULT, "Could not register for the CloudDocs availability notification: error %u #Downloading", buf, 8u);
      }
      objc_msgSend(*(id *)(a1 + 32), "_setNetworkState:", 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateNetworkStateWithNotifyToken:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 72));
    }
    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }
LABEL_25:
  objc_sync_exit(v2);

}

void __40__QLNetworkStateObserver_startObserving__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNetworkStateWithNotifyToken:", a2);

}

- (void)stopObserving
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__QLNetworkStateObserver_stopObserving__block_invoke;
  v2[3] = &unk_1E9EFC370;
  v2[4] = self;
  QLRunInBackgroundThread(v2);
}

void __39__QLNetworkStateObserver_stopObserving__block_invoke(uint64_t a1)
{
  int v2;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "_unregisterReachability");
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v2 >= 1)
  {
    notify_cancel(v2);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = -1;
  }
  objc_sync_exit(obj);

}

- (void)_unregisterReachability
{
  __SCNetworkReachability *reachability;

  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetCallback(reachability, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(self->_reachability, 0);
    CFRelease(self->_reachability);
    self->_reachability = 0;
    self->_reachabilityFlags = 0;
    self->_networkState = 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  -[QLNetworkStateObserver _unregisterReachability](self, "_unregisterReachability");
  v3.receiver = self;
  v3.super_class = (Class)QLNetworkStateObserver;
  -[QLNetworkStateObserver dealloc](&v3, sel_dealloc);
}

- (BOOL)isConnected
{
  return -[QLNetworkStateObserver networkState](self, "networkState") == 4
      || -[QLNetworkStateObserver networkState](self, "networkState") == 3;
}

- (BOOL)isWifiCapable
{
  if ((MGGetBoolAnswer() & 1) != 0)
    return 1;
  else
    return MGGetBoolAnswer();
}

- (void)_update
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  if (SCNetworkReachabilityGetFlags(self->_reachability, &flags))
    -[QLNetworkStateObserver _updateNetworkStateWithFlags:](self, "_updateNetworkStateWithFlags:", flags);
}

- (void)_updateNetworkActivityIndicator
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNetworkActivityIndicatorVisible:", self->_stack != 0);

}

- (void)_setNetworkState:(unint64_t)a3
{
  NSObject **v4;
  NSObject *v5;
  unint64_t networkState;
  const __CFString *v7;
  NSObject *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_networkState != a3)
  {
    self->_networkState = a3;
    v4 = (NSObject **)MEMORY[0x1E0D83678];
    v5 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      networkState = self->_networkState;
      if (networkState > 4)
        v7 = CFSTR("Undefined QLNetworkState");
      else
        v7 = off_1E9EFC390[networkState];
      *(_DWORD *)v9 = 138412290;
      *(_QWORD *)&v9[4] = v7;
      v8 = v5;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_INFO, "Network state changed to %@ #Downloading", v9, 0xCu);

    }
    -[QLNetworkStateObserver _updateRemoteObserver](self, "_updateRemoteObserver", *(_OWORD *)v9);
  }
}

- (void)_updateNetworkStateWithFlags:(unsigned int)a3
{
  NSObject **v5;
  NSObject *v6;
  uint64_t v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_reachabilityFlags = a3;
  v5 = (NSObject **)MEMORY[0x1E0D83678];
  v6 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a3;
    _os_log_impl(&dword_1D936E000, v6, OS_LOG_TYPE_INFO, "Network reachability flags changed to 0x%x #Downloading", (uint8_t *)v8, 8u);
  }
  if ((a3 & 2) != 0)
  {
    if ((a3 & 0x40000) != 0)
      v7 = 4;
    else
      v7 = 3;
  }
  else
  {
    -[RadiosPreferences refresh](self->_radiosPreferences, "refresh");
    if (-[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode"))
      v7 = 1;
    else
      v7 = 2;
  }
  -[QLNetworkStateObserver _setNetworkState:](self, "_setNetworkState:", v7);
}

- (void)setNetworkState:(unint64_t)a3
{
  self->_networkState = a3;
  if (a3)
    -[QLNetworkStateObserver _updateCompletionBlocks](self, "_updateCompletionBlocks");
}

- (void)networkStateWithCompletionBlock:(id)a3
{
  void (**v4)(id, unint64_t);
  NSMutableArray *v5;
  NSMutableArray *completionBlocks;
  void *v7;
  void (**v8)(id, unint64_t);

  v4 = (void (**)(id, unint64_t))a3;
  if (v4)
  {
    v8 = v4;
    if (-[QLNetworkStateObserver networkState](self, "networkState"))
    {
      v8[2](v8, self->_networkState);
    }
    else
    {
      v5 = self->_completionBlocks;
      objc_sync_enter(v5);
      completionBlocks = self->_completionBlocks;
      v7 = (void *)MEMORY[0x1DF089CE8](v8);
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v7);

      objc_sync_exit(v5);
    }
    v4 = v8;
  }

}

- (void)_updateCompletionBlocks
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = self->_completionBlocks;
  objc_sync_enter(v3);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_completionBlocks;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD, unint64_t))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7), -[QLNetworkStateObserver networkState](self, "networkState", (_QWORD)v8));
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_completionBlocks, "removeAllObjects");
  objc_sync_exit(v3);

}

- (void)airplaneModeChanged
{
  if (-[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode"))
    -[QLNetworkStateObserver _setNetworkState:](self, "_setNetworkState:", 1);
  else
    -[QLNetworkStateObserver _update](self, "_update");
}

- (void)updateState:(unint64_t)a3
{
  NSObject **v5;
  NSObject *v6;
  const __CFString *v7;
  NSObject *v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (NSObject **)MEMORY[0x1E0D83678];
  v6 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3 > 4)
      v7 = CFSTR("Undefined QLNetworkState");
    else
      v7 = off_1E9EFC390[a3];
    *(_DWORD *)v9 = 138412290;
    *(_QWORD *)&v9[4] = v7;
    v8 = v6;
    _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_INFO, "Network state update from host %@ #Downloading", v9, 0xCu);

  }
  -[QLNetworkStateObserver _setNetworkState:](self, "_setNetworkState:", a3, *(_OWORD *)v9);
}

+ (BOOL)usingRemoteNetworkObserver
{
  void *v2;
  void *v3;
  int v4;
  __CFString **v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = _os_feature_enabled_impl();
  v5 = &kQuickLookUIExtensionIdentifier;
  if (!v4)
    v5 = &kQLPreviewExtensionIdentifier;
  v6 = objc_msgSend(v3, "isEqualToString:", *v5);

  return v6;
}

+ (BOOL)networkAccessShouldGoThroughCloudDocsDaemon
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iCloudDriveApp"));

  return v4;
}

- (void)_updateRemoteObserver
{
  -[QLNetworkStateListener updateState:](self->_remoteObserver, "updateState:", -[QLNetworkStateObserver networkState](self, "networkState"));
}

- (unint64_t)networkState
{
  return self->_networkState;
}

- (QLNetworkStateListener)remoteObserver
{
  return self->_remoteObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObserver, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
