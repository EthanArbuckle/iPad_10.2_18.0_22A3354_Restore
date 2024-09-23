@implementation VKNotificationObserver

- (VKNotificationObserver)initWithTarget:(id)a3 taskContext:(const void *)a4
{
  id v6;
  VKNotificationObserver *v7;
  VKNotificationObserver *v8;
  NSObject *v9;
  dispatch_source_t v10;
  OS_dispatch_source *memoryNotificationEventSource;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;
  objc_super v27;

  v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)VKNotificationObserver;
  v7 = -[VKNotificationObserver init](&v27, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_target, v6);
    v9 = *(id *)a4;
    v10 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, v9);
    memoryNotificationEventSource = v8->_memoryNotificationEventSource;
    v8->_memoryNotificationEventSource = (OS_dispatch_source *)v10;

    objc_initWeak(&location, v8);
    v12 = v8->_memoryNotificationEventSource;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __53__VKNotificationObserver_initWithTarget_taskContext___block_invoke;
    v24 = &unk_1E42F11D8;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v12, &v21);
    dispatch_resume((dispatch_object_t)v8->_memoryNotificationEventSource);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v21, v22, v23, v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v8, sel__receivedMemoryNotification, CFSTR("VKDidReceiveMemoryWarningNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__receivedFlushTileCachesNotification, CFSTR("VKShouldFlushTileCachesNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__receivedLocalChangedNotification, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "thermalState");

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "isLowPowerModeEnabled");

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__receivedThermalStateDidChangeNotification, *MEMORY[0x1E0CB3050], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v8, sel__receivedPowerStateDidChangeNotification, *MEMORY[0x1E0CB3048], 0);

    -[VKNotificationObserver _receivedThermalStateDidChangeNotification](v8, "_receivedThermalStateDidChangeNotification");
    -[VKNotificationObserver _receivedPowerStateDidChangeNotification](v8, "_receivedPowerStateDidChangeNotification");
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)_receivedThermalStateDidChangeNotification
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didReceiveThermalStateChanged");

}

- (void)_receivedPowerStateDidChangeNotification
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didReceivePowerStateChanged");

}

- (void)dealloc
{
  OS_dispatch_source *memoryNotificationEventSource;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  objc_storeWeak((id *)&self->_target, 0);
  dispatch_source_set_event_handler((dispatch_source_t)self->_memoryNotificationEventSource, &__block_literal_global_8518);
  memoryNotificationEventSource = self->_memoryNotificationEventSource;
  self->_memoryNotificationEventSource = 0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("VKDidReceiveMemoryWarningNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("VKShouldFlushTileCachesNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3048], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0CB3050], 0);

  v9.receiver = self;
  v9.super_class = (Class)VKNotificationObserver;
  -[VKNotificationObserver dealloc](&v9, sel_dealloc);
}

- (void)_receivedMemoryNotification
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    v6 = 134217984;
    v7 = WeakRetained;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Received memory notification: %p", (uint8_t *)&v6, 0xCu);

  }
  v5 = objc_loadWeakRetained((id *)&self->_target);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didReceiveMemoryWarning");

}

- (void)_receivedFlushTileCachesNotification
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    v6 = 134217984;
    v7 = WeakRetained;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Received flush cache notification: %p", (uint8_t *)&v6, 0xCu);

  }
  v5 = objc_loadWeakRetained((id *)&self->_target);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didReceiveFlushTileCaches");

}

- (void)_receivedLocalChangedNotification
{
  NSObject *v3;
  id WeakRetained;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1)
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_4_11772);
  v3 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    v6 = 134217984;
    v7 = WeakRetained;
    _os_log_impl(&dword_19F029000, v3, OS_LOG_TYPE_INFO, "Received system locale changed notification: %p", (uint8_t *)&v6, 0xCu);

  }
  v5 = objc_loadWeakRetained((id *)&self->_target);
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didReceiveLocalChanged");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryNotificationEventSource, 0);
  objc_destroyWeak((id *)&self->_target);
}

void __53__VKNotificationObserver_initWithTarget_taskContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_receivedMemoryNotification");

}

@end
