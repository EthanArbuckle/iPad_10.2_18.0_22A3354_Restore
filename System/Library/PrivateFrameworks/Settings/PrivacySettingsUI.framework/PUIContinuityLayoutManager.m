@implementation PUIContinuityLayoutManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PUIContinuityLayoutManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_instance;
}

void __44__PUIContinuityLayoutManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v1;

}

- (PUIContinuityLayoutManager)init
{
  PUIContinuityLayoutManager *v2;
  PUIContinuityLayoutManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUIContinuityLayoutManager;
  v2 = -[PUIContinuityLayoutManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isMirroring = 0;
    -[PUIContinuityLayoutManager createContinuityDisplayMonitor](v2, "createContinuityDisplayMonitor");
  }
  return v3;
}

- (void)appDidLaunch
{
  NSObject *v2;
  uint8_t v3[16];

  _PUILoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB1FB000, v2, OS_LOG_TYPE_DEFAULT, "App did launch for continuity layout monitor", v3, 2u);
  }

}

- (void)createContinuityDisplayMonitor
{
  void *v3;
  FBSDisplayLayoutMonitor *monitor;
  FBSDisplayLayoutMonitor *v5;
  FBSDisplayLayoutMonitor *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  void *v10;
  id v11;
  id location;

  objc_msgSend(MEMORY[0x1E0D230E0], "configurationForContinuityDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __60__PUIContinuityLayoutManager_createContinuityDisplayMonitor__block_invoke;
  v10 = &unk_1EA26B2C0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setTransitionHandler:", &v7);
  monitor = self->_monitor;
  if (monitor)
    -[FBSDisplayLayoutMonitor invalidate](monitor, "invalidate", v7, v8, v9, v10);
  objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v3, v7, v8, v9, v10);
  v5 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  v6 = self->_monitor;
  self->_monitor = v5;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __60__PUIContinuityLayoutManager_createContinuityDisplayMonitor__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  const __CFString *v6;
  id WeakRetained;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _PUILoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("No");
    if (a3)
      v6 = CFSTR("Yes");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1DB1FB000, v5, OS_LOG_TYPE_DEFAULT, "Received transition for continuity layout, is active: %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsMirroring:", a3 != 0);

}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (BOOL)isMirroring
{
  return self->_isMirroring;
}

- (void)setIsMirroring:(BOOL)a3
{
  self->_isMirroring = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
