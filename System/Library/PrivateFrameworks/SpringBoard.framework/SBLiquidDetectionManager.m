@implementation SBLiquidDetectionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_28 != -1)
    dispatch_once(&sharedInstance_onceToken_28, &__block_literal_global_191);
  return (id)__SharedInstance;
}

uint64_t __42__SBLiquidDetectionManager_sharedInstance__block_invoke()
{
  SBLiquidDetectionManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBLiquidDetectionManager);
  v1 = (void *)__SharedInstance;
  __SharedInstance = (uint64_t)v0;

  return kdebug_trace();
}

- (SBLiquidDetectionManager)init
{
  SBLiquidDetectionManager *v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  SBLiquidDetectionManager *v7;
  NSObject *v8;
  __int16 v10[8];
  _QWORD block[4];
  SBLiquidDetectionManager *v12;
  _QWORD handler[4];
  NSObject *p_super;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBLiquidDetectionManager;
  v2 = -[SBLiquidDetectionManager init](&v15, sel_init);
  if (v2)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
      {
        v2->_detectionEnabled = 0;
        goto LABEL_8;
      }
      v4 = MGGetBoolAnswer();
      v2->_detectionEnabled = v4;
      if (!v4)
      {
LABEL_8:
        SBLogLiquidDetection();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v10[0] = 0;
          _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBLiquidDetectionManager is not supported on this device.", (uint8_t *)v10, 2u);
        }
        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceIdiom") == 1)
        v2->_detectionEnabled = 0;
      else
        v2->_detectionEnabled = MGGetBoolAnswer();

      if (!v2->_detectionEnabled)
        goto LABEL_8;
    }
    v2->_wetToken = -1;
    v6 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __32__SBLiquidDetectionManager_init__block_invoke;
    handler[3] = &unk_1E8E9EBA8;
    v7 = v2;
    p_super = &v7->super;
    v8 = MEMORY[0x1E0C80D38];
    notify_register_dispatch("com.apple.ioam.accessory.vhi.stateChange", &v2->_wetToken, MEMORY[0x1E0C80D38], handler);
    -[SBLiquidDetectionManager _updateWetState](v7, "_updateWetState");
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __32__SBLiquidDetectionManager_init__block_invoke_7;
    block[3] = &unk_1E8E9DED8;
    v12 = v7;
    dispatch_async(v8, block);

    v5 = p_super;
LABEL_13:

  }
  return v2;
}

uint64_t __32__SBLiquidDetectionManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogLiquidDetection();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "com.apple.ioam.accessory.vhi.stateChange";
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "SBLiquidDetectionManager received notification %s", (uint8_t *)&v4, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateWetState");
}

uint64_t __32__SBLiquidDetectionManager_init__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishInit");
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLiquidDetectionManager.m"), 73, CFSTR("a singleton should not be deallocated"));

  notify_cancel(self->_wetToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SBLiquidDetectionManager;
  -[SBLiquidDetectionManager dealloc](&v6, sel_dealloc);
}

- (BOOL)isLiquidDetected
{
  _BOOL4 v3;

  v3 = -[SBLiquidDetectionManager isDetectionEnabled](self, "isDetectionEnabled");
  if (v3)
    LOBYTE(v3) = -[SBLiquidDetectionManager isAccessoryPortWet](self, "isAccessoryPortWet");
  return v3;
}

+ (BOOL)showStatusBarIcon
{
  return objc_msgSend((id)__SharedInstance, "_showStatusBarIcon");
}

- (void)_finishInit
{
  self->_finishedInit = 1;
  -[SBLiquidDetectionManager _updateStatusBar](self, "_updateStatusBar");
  -[SBLiquidDetectionManager _stateDidUpdate](self, "_stateDidUpdate");
}

- (void)_updateWetState
{
  uint32_t state;
  uint32_t v4;
  NSObject *v5;
  uint64_t v6;
  BOOL v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t state64;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  state = notify_get_state(self->_wetToken, &state64);
  if (state)
  {
    v4 = state;
    SBLogLiquidDetection();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v12) = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBLiquidDetectionManager was unable to obtain the wet/dry state; notify error code %u.",
        buf,
        8u);
    }

  }
  else
  {
    v6 = state64;
    v7 = state64 != 0;
    SBLogLiquidDetection();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("dry");
      if (v6)
        v9 = CFSTR("wet");
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBLiquidDetectionManager loaded accessory port wetness state: %{public}@", buf, 0xCu);
    }

    if ((BSEqualBools() & 1) == 0)
    {
      self->_accessoryPortWet = v7;
      -[SBLiquidDetectionManager _updateStatusBar](self, "_updateStatusBar");
      -[SBLiquidDetectionManager _stateDidUpdate](self, "_stateDidUpdate");
    }
  }
}

- (void)_updateStatusBar
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_finishedInit)
  {
    SBLogLiquidDetection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[SBLiquidDetectionManager _showStatusBarIcon](self, "_showStatusBarIcon");
      NSStringFromBOOL();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SBLiquidDetectionManager updating status bar icon to visible: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend((id)SBApp, "statusBarStateAggregator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateStatusBarItem:", 40);
    +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forceUpdateLocalStatusBarData");

  }
}

- (void)_stateDidUpdate
{
  NSObject *v3;
  _BOOL4 v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_finishedInit)
  {
    SBLogLiquidDetection();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[SBLiquidDetectionManager isLiquidDetected](self, "isLiquidDetected");
      v5 = CFSTR("no liquid detected");
      if (v4)
        v5 = CFSTR("liquid detected");
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SBLiquidDetectionManager posting state did change to: %{public}@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBLiquidDetectionManagerStateDidChange"), 0);

  }
}

- (id)description
{
  return -[SBLiquidDetectionManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLiquidDetectionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBLiquidDetectionManager isDetectionEnabled](self, "isDetectionEnabled"), CFSTR("enabled"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBLiquidDetectionManager isLiquidDetected](self, "isLiquidDetected"), CFSTR("detected"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLiquidDetectionManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isDetectionEnabled
{
  return self->_detectionEnabled;
}

- (BOOL)isAccessoryPortWet
{
  return self->_accessoryPortWet;
}

@end
