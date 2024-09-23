@implementation SBSystemStatusWifiDataProvider

void __51__SBSystemStatusWifiDataProvider__queue_updateData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  +[SBWiFiManager sharedInstance](SBWiFiManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isWifiActive"))
    v4 = objc_msgSend(*(id *)(a1 + 32), "isFallingBackToCellular") ^ 1;
  else
    v4 = 0;
  objc_msgSend(v3, "setWifiActive:", v4);
  objc_msgSend(v3, "setSignalStrengthBars:", (int)objc_msgSend(v5, "signalStrengthBars"));
  objc_msgSend(v3, "setAssociatedToIOSHotspot:", objc_msgSend(v5, "isAssociatedToIOSHotspot"));

}

uint64_t __45__SBSystemStatusWifiDataProvider__updateData__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateData");
}

- (STWifiStatusDomainPublisher)wifiDataPublisher
{
  return self->_wifiDataPublisher;
}

- (BOOL)isWifiActive
{
  return self->_queue_wifiActive;
}

- (BOOL)isFallingBackToCellular
{
  return self->_queue_fallingBackToCellular;
}

- (void)_updateData
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SBSystemStatusWifiDataProvider__updateData__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

- (void)_queue_updateData
{
  void *v3;
  _QWORD v4[5];

  BSDispatchQueueAssert();
  -[SBSystemStatusWifiDataProvider wifiDataPublisher](self, "wifiDataPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SBSystemStatusWifiDataProvider__queue_updateData__block_invoke;
  v4[3] = &unk_1E8EACE98;
  v4[4] = self;
  objc_msgSend(v3, "updateDataWithBlock:", v4);

}

- (SBSystemStatusWifiDataProvider)init
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t Serial;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBSystemStatusWifiDataProvider;
  v2 = -[SBSystemStatusWifiDataProvider init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0DB0AA0]);
    objc_msgSend((id)SBApp, "systemStatusServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithServerHandle:", v4);
    v6 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v5;

    Serial = BSDispatchQueueCreateSerial();
    v8 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = Serial;

    objc_msgSend(v2, "_registerForNotifications");
    objc_initWeak(&location, v2);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __38__SBSystemStatusWifiDataProvider_init__block_invoke;
    v14 = &unk_1E8E9DF28;
    objc_copyWeak(&v15, &location);
    v9 = (void *)MEMORY[0x1D17E5550](&v11);
    *((_QWORD *)v2 + 4) = tcp_connection_fallback_watcher_create();
    objc_msgSend(v2, "_updateWifiActive", v11, v12, v13, v14);
    dispatch_async(*((dispatch_queue_t *)v2 + 2), v9);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return (SBSystemStatusWifiDataProvider *)v2;
}

void __38__SBSystemStatusWifiDataProvider_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cellularFallbackWatcher");
  v2 = tcp_fallback_watcher_fallback_inuse();
  if ((_DWORD)v2 != objc_msgSend(WeakRetained, "isFallingBackToCellular"))
  {
    objc_msgSend(WeakRetained, "setFallingBackToCellular:", v2);
    SBLogStatusBarish();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = CFSTR("off");
      if ((_DWORD)v2)
        v4 = CFSTR("on");
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "cellular fallback is %{public}@", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(WeakRetained, "_updateData");
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SBSystemStatusWifiDataProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemStatusWifiDataProvider;
  -[SBSystemStatusWifiDataProvider dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *v3;

  -[STWifiStatusDomainPublisher invalidate](self->_wifiDataPublisher, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (-[SBSystemStatusWifiDataProvider cellularFallbackWatcher](self, "cellularFallbackWatcher"))
  {
    tcp_connection_fallback_watcher_destroy();
    -[SBSystemStatusWifiDataProvider setCellularFallbackWatcher:](self, "setCellularFallbackWatcher:", 0);
  }
}

- (void)_registerForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateData, CFSTR("SBWifiSignalStrengthChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateData, CFSTR("SBWifiManagerLinkHotSpotnessDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateWifiActive, CFSTR("SBWifiManagerPrimaryInterfaceMayHaveChangedNotification"), 0);

}

- (void)_updateWifiActive
{
  NSObject *updateQueue;
  _QWORD block[5];

  updateQueue = self->_updateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SBSystemStatusWifiDataProvider__updateWifiActive__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

uint64_t __51__SBSystemStatusWifiDataProvider__updateWifiActive__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateWifiActive");
}

- (void)setWifiActive:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_wifiActive != v3)
    self->_queue_wifiActive = v3;
}

- (void)setFallingBackToCellular:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  BSDispatchQueueAssert();
  if (self->_queue_fallingBackToCellular != v3)
    self->_queue_fallingBackToCellular = v3;
}

- (void)_queue_updateWifiActive
{
  uint64_t v3;
  id v4;

  BSDispatchQueueAssert();
  +[SBWiFiManager sharedInstance](SBWiFiManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isPowered") && objc_msgSend(v4, "isPrimaryInterface"))
    v3 = objc_msgSend(v4, "isAssociated");
  else
    v3 = 0;
  -[SBSystemStatusWifiDataProvider setWifiActive:](self, "setWifiActive:", v3);
  -[SBSystemStatusWifiDataProvider _queue_updateData](self, "_queue_updateData");

}

- (void)cellularFallbackWatcher
{
  return self->_cellularFallbackWatcher;
}

- (void)setCellularFallbackWatcher:(void *)a3
{
  self->_cellularFallbackWatcher = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiDataPublisher, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
}

@end
