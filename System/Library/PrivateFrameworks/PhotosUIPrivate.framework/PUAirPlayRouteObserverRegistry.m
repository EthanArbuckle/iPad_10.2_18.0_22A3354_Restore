@implementation PUAirPlayRouteObserverRegistry

- (PUAirPlayRouteObserverRegistry)init
{
  PUAirPlayRouteObserverRegistry *v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  PUAirPlayRouteObserverRegistry *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUAirPlayRouteObserverRegistry;
  v2 = -[PUAirPlayRouteObserverRegistry init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAirPlayRouteObserverRegistry _setRouteObservers:](v2, "_setRouteObservers:", v3);
    v4 = dispatch_queue_create("com.apple.photos.PHAirPlayRouteAvailability", 0);
    -[PUAirPlayRouteObserverRegistry _setDiscoverySessionIsolationQueue:](v2, "_setDiscoverySessionIsolationQueue:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__appEnteredBackground_, *MEMORY[0x1E0DC4768], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__appEnteringForeground_, *MEMORY[0x1E0DC4860], 0);

    v2->__discoveryAllowed = 1;
    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__PUAirPlayRouteObserverRegistry_init__block_invoke;
    v9[3] = &unk_1E58ABD10;
    v10 = v2;
    objc_msgSend(v7, "scheduleMainQueueTask:", v9);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUAirPlayRouteObserverRegistry;
  -[PUAirPlayRouteObserverRegistry dealloc](&v4, sel_dealloc);
}

- (void)addRouteObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PUAirPlayRouteObserverRegistry _routeObservers](self, "_routeObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[PUAirPlayRouteObserverRegistry _updateDiscoverySession](self, "_updateDiscoverySession");
}

- (void)removeRouteObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PUAirPlayRouteObserverRegistry _routeObservers](self, "_routeObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[PUAirPlayRouteObserverRegistry _updateDiscoverySession](self, "_updateDiscoverySession");
}

- (void)_updateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUAirPlayRouteObserverRegistry delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airPlayRouteObserverRegistryRouteAvailabilityChanged:forRouteObserver:", self, v4);

}

- (void)_updateAllObservers
{
  void *v3;
  uint64_t v4;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PUAirPlayRouteObserverRegistry _routeObservers](self, "_routeObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[PUAirPlayRouteObserverRegistry _updateObserver:](self, "_updateObserver:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_setRouteAvailability:(unint64_t)a3
{
  if (self->_routeAvailability != a3)
  {
    self->_routeAvailability = a3;
    -[PUAirPlayRouteObserverRegistry _updateAllObservers](self, "_updateAllObservers");
  }
}

- (void)_setDiscoverySession:(id)a3
{
  void *v6;
  int v7;
  AVOutputDeviceDiscoverySession **p_discoverySession;
  AVOutputDeviceDiscoverySession *discoverySession;
  AVOutputDeviceDiscoverySession *v10;
  void *v11;
  AVOutputDeviceDiscoverySession *v12;

  v12 = (AVOutputDeviceDiscoverySession *)a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMainThread");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAirPlayRouteObserverRegistry.m"), 160, CFSTR("_discoverySession may only be accessed on background queue"));

  }
  discoverySession = self->__discoverySession;
  p_discoverySession = &self->__discoverySession;
  v10 = v12;
  if (discoverySession != v12)
  {
    objc_storeStrong((id *)p_discoverySession, a3);
    v10 = v12;
  }

}

- (AVOutputDeviceDiscoverySession)_discoverySession
{
  void *v4;
  int v5;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMainThread");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAirPlayRouteObserverRegistry.m"), 170, CFSTR("_discoverySession may only be accessed on background queue"));

  }
  return self->__discoverySession;
}

- (void)_updateDiscoverySession
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[PUAirPlayRouteObserverRegistry _routeObservers](self, "_routeObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = -[PUAirPlayRouteObserverRegistry _isDiscoveryAllowed](self, "_isDiscoveryAllowed");
  else
    v4 = 0;

  -[PUAirPlayRouteObserverRegistry _discoverySessionIsolationQueue](self, "_discoverySessionIsolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PUAirPlayRouteObserverRegistry__updateDiscoverySession__block_invoke;
  v6[3] = &unk_1E58AAD68;
  v6[4] = self;
  v7 = v4;
  dispatch_async(v5, v6);

}

- (void)_discoverySessionIsolationQueue_updateRouteAvailability
{
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  unint64_t v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 2;
  +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "routeAvailabilityOverride");

  if (v4)
  {
    if (v4 == 1)
    {
      v5 = v19;
      v6 = 1;
      goto LABEL_9;
    }
    if (v4 == 2)
    {
      v5 = v19;
      v6 = 2;
LABEL_9:
      v5[3] = v6;
    }
  }
  else
  {
    -[PUAirPlayRouteObserverRegistry _discoverySession](self, "_discoverySession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_pu_routeAvailability");
    v19[3] = v8;

    PLAirPlayGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v19[3];
      if (v10 > 2)
        v11 = 0;
      else
        v11 = off_1E589BBF0[v10];
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Device route availability: %@", buf, 0xCu);
    }

    if (v19[3])
    {
      -[PUAirPlayRouteObserverRegistry setLastKnownRouteAvailability:](self, "setLastKnownRouteAvailability:");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAirPlayRouteObserverRegistry setLastKnownRouteAvailabilityDate:](self, "setLastKnownRouteAvailabilityDate:", v12);

    }
    else
    {
      -[PUAirPlayRouteObserverRegistry lastKnownRouteAvailabilityDate](self, "lastKnownRouteAvailabilityDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceNow");
      v15 = v14;

      if (v15 <= 0.0 && v15 >= -15.0)
      {
        v16 = -[PUAirPlayRouteObserverRegistry lastKnownRouteAvailability](self, "lastKnownRouteAvailability");
        v19[3] = v16;
      }
    }
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__PUAirPlayRouteObserverRegistry__discoverySessionIsolationQueue_updateRouteAvailability__block_invoke;
  v17[3] = &unk_1E58AAE48;
  v17[4] = self;
  v17[5] = &v18;
  dispatch_async(MEMORY[0x1E0C80D38], v17);
  _Block_object_dispose(&v18, 8);
}

- (void)_availableOutputDevicesDidChange:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  PUAirPlayRouteObserverRegistry *v10;
  SEL v11;

  v5 = a3;
  -[PUAirPlayRouteObserverRegistry _discoverySessionIsolationQueue](self, "_discoverySessionIsolationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PUAirPlayRouteObserverRegistry__availableOutputDevicesDidChange___block_invoke;
  block[3] = &unk_1E58A9DF0;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

- (void)_appEnteredBackground:(id)a3
{
  -[PUAirPlayRouteObserverRegistry _setDiscoveryAllowed:](self, "_setDiscoveryAllowed:", 0);
  -[PUAirPlayRouteObserverRegistry _updateDiscoverySession](self, "_updateDiscoverySession");
}

- (void)_appEnteringForeground:(id)a3
{
  -[PUAirPlayRouteObserverRegistry _setDiscoveryAllowed:](self, "_setDiscoveryAllowed:", 1);
  -[PUAirPlayRouteObserverRegistry _updateDiscoverySession](self, "_updateDiscoverySession");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  NSObject *v5;
  _QWORD block[5];

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("routeAvailability")))
  {
    -[PUAirPlayRouteObserverRegistry _discoverySessionIsolationQueue](self, "_discoverySessionIsolationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__PUAirPlayRouteObserverRegistry_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E58ABD10;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (PUAirPlayRouteObserverRegistryDelegate)delegate
{
  return (PUAirPlayRouteObserverRegistryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)routeAvailability
{
  return self->_routeAvailability;
}

- (NSHashTable)_routeObservers
{
  return self->__routeObservers;
}

- (void)_setRouteObservers:(id)a3
{
  objc_storeStrong((id *)&self->__routeObservers, a3);
}

- (OS_dispatch_queue)_discoverySessionIsolationQueue
{
  return self->__discoverySessionIsolationQueue;
}

- (void)_setDiscoverySessionIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->__discoverySessionIsolationQueue, a3);
}

- (BOOL)_isDiscoveryAllowed
{
  return self->__discoveryAllowed;
}

- (void)_setDiscoveryAllowed:(BOOL)a3
{
  self->__discoveryAllowed = a3;
}

- (unint64_t)lastKnownRouteAvailability
{
  return self->_lastKnownRouteAvailability;
}

- (void)setLastKnownRouteAvailability:(unint64_t)a3
{
  self->_lastKnownRouteAvailability = a3;
}

- (NSDate)lastKnownRouteAvailabilityDate
{
  return self->_lastKnownRouteAvailabilityDate;
}

- (void)setLastKnownRouteAvailabilityDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownRouteAvailabilityDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownRouteAvailabilityDate, 0);
  objc_storeStrong((id *)&self->__discoverySessionIsolationQueue, 0);
  objc_storeStrong((id *)&self->__routeObservers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__discoverySession, 0);
}

uint64_t __62__PUAirPlayRouteObserverRegistry_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoverySessionIsolationQueue_updateRouteAvailability");
}

uint64_t __67__PUAirPlayRouteObserverRegistry__availableOutputDevicesDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_discoverySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("PUAirPlayRouteObserverRegistry.m"), 245, CFSTR("New discovery session, who dis?"));

  }
  return objc_msgSend(*(id *)(a1 + 40), "_discoverySessionIsolationQueue_updateRouteAvailability");
}

uint64_t __89__PUAirPlayRouteObserverRegistry__discoverySessionIsolationQueue_updateRouteAvailability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setRouteAvailability:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __57__PUAirPlayRouteObserverRegistry__updateDiscoverySession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  unint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  int v10;
  __CFString *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_discoverySession");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (*(_BYTE *)(a1 + 40))
    v4 = v2 == 0;
  else
    v4 = 0;
  if (v4)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2C8]), "initWithDeviceFeatures:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_setDiscoverySession:", v3);
  }
  if (v3)
  {
    v5 = objc_msgSend(v3, "discoveryMode");
    v6 = (id)*MEMORY[0x1E0C8AB88];
    if (!*(_BYTE *)(a1 + 40) || v5 == 1)
    {
      if (*(_BYTE *)(a1 + 40) || !v5)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), v6, v3);
      v5 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__availableOutputDevicesDidChange_, v6, v3);
      v5 = 1;
    }

LABEL_15:
    objc_msgSend(v3, "setDiscoveryMode:", v5);
    PLAirPlayGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 3)
        v9 = 0;
      else
        v9 = off_1E589BBD0[v5];
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Set discovery mode to %@ on session %@", (uint8_t *)&v10, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_discoverySessionIsolationQueue_updateRouteAvailability");
  }

}

void __38__PUAirPlayRouteObserverRegistry_init__block_invoke(uint64_t a1)
{
  id v2;

  +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyObserver:", *(_QWORD *)(a1 + 32));

}

@end
