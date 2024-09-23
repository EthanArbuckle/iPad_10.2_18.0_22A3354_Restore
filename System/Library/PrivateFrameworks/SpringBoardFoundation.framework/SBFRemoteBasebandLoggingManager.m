@implementation SBFRemoteBasebandLoggingManager

- (SBFRemoteBasebandLoggingManager)init
{
  SBFRemoteBasebandLoggingManager *v2;
  void *v3;
  objc_class *v4;
  CellularLogging *v5;
  CellularLogging *cellularLogging;
  NSObject *v7;
  CellularLogging *v8;
  int v9;
  uint64_t v10;
  NSHashTable *observers;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE buf[24];
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SBFRemoteBasebandLoggingManager;
  v2 = -[SBFRemoteBasebandLoggingManager init](&v14, sel_init);
  if (v2)
  {
    if (!CellularLoggingLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E200E0C0;
      *(_QWORD *)&buf[16] = 0;
      CellularLoggingLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (CellularLoggingLibraryCore_frameworkLibrary)
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2050000000;
      v3 = (void *)getCellularLoggingClass_softClass;
      v18 = getCellularLoggingClass_softClass;
      if (!getCellularLoggingClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCellularLoggingClass_block_invoke;
        v20 = &unk_1E200E038;
        v21 = &v15;
        __getCellularLoggingClass_block_invoke((uint64_t)buf);
        v3 = (void *)v16[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v15, 8);
      v5 = (CellularLogging *)objc_alloc_init(v4);
      cellularLogging = v2->_cellularLogging;
      v2->_cellularLogging = v5;

      SBLogCellularLogCollection();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v2->_cellularLogging;
        v9 = -[CellularLogging isLoggingStarted](v8, "isLoggingStarted");
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v9;
        _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_DEFAULT, "SBFRemoteBasebandLoggingManager %p initialized, log collection status is %{BOOL}d", buf, 0x12u);
      }

    }
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 2);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v10;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SBFHandleRemoteBasebandLoggingStatusChanged, CFSTR("com.apple.CarrierCellularLogging.state"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_manager;
}

void __49__SBFRemoteBasebandLoggingManager_sharedInstance__block_invoke()
{
  SBFRemoteBasebandLoggingManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBFRemoteBasebandLoggingManager);
  v1 = (void *)sharedInstance_manager;
  sharedInstance_manager = (uint64_t)v0;

}

- (BOOL)isLogCollectionEnabled
{
  return -[CellularLogging isLoggingStarted](self->_cellularLogging, "isLoggingStarted");
}

- (void)_notifyObservers
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[SBFRemoteBasebandLoggingManager isLogCollectionEnabled](self, "isLogCollectionEnabled");
  SBLogCellularLogCollection();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = v3;
    _os_log_impl(&dword_18AB69000, v4, OS_LOG_TYPE_DEFAULT, "Remote Baseband Log Collection Status changed to %{BOOL}d, notifying observers", buf, 8u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SBFRemoteBasebandLoggingManager observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "remoteBasebandLogCollectionStateDidChange:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFRemoteBasebandLoggingManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFRemoteBasebandLoggingManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (CellularLogging)cellularLogging
{
  return self->_cellularLogging;
}

- (void)setCellularLogging:(id)a3
{
  objc_storeStrong((id *)&self->_cellularLogging, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cellularLogging, 0);
}

@end
