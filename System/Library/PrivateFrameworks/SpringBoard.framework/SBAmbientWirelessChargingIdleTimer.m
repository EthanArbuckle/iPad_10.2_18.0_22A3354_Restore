@implementation SBAmbientWirelessChargingIdleTimer

- (SBAmbientWirelessChargingIdleTimer)initWithAmbientPresentationController:(id)a3 screenSleepCoordinator:(id)a4 uiController:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBAmbientWirelessChargingIdleTimer *v11;
  void *v12;
  uint64_t v13;
  SBAmbientDefaults *ambientTestingDefaults;
  AWAttentionAwarenessClient *v15;
  AWAttentionAwarenessClient *attentionClient;
  SBAmbientDefaults *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  AWAttentionAwarenessClient *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)SBAmbientWirelessChargingIdleTimer;
  v11 = -[SBAmbientWirelessChargingIdleTimer init](&v31, sel_init);
  if (v11)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ambientDefaults");
    v13 = objc_claimAutoreleasedReturnValue();
    ambientTestingDefaults = v11->_ambientTestingDefaults;
    v11->_ambientTestingDefaults = (SBAmbientDefaults *)v13;

    objc_msgSend(v8, "addObserver:", v11);
    -[SBAmbientWirelessChargingIdleTimer _setAmbientPresented:](v11, "_setAmbientPresented:", objc_msgSend(v8, "isPresented"));
    objc_storeStrong((id *)&v11->_screenSleepCoordinator, a4);
    objc_storeStrong((id *)&v11->_uiController, a5);
    v15 = (AWAttentionAwarenessClient *)objc_alloc_init(MEMORY[0x1E0CFEC00]);
    attentionClient = v11->_attentionClient;
    v11->_attentionClient = v15;

    -[SBAmbientWirelessChargingIdleTimer _reconfigureAttentionClient](v11, "_reconfigureAttentionClient");
    objc_initWeak(&location, v11);
    v17 = v11->_ambientTestingDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "qiChargingIdleTimerDuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C80D38];
    v21 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __112__SBAmbientWirelessChargingIdleTimer_initWithAmbientPresentationController_screenSleepCoordinator_uiController___block_invoke;
    v28[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v29, &location);
    v22 = (id)-[SBAmbientDefaults observeDefaults:onQueue:withBlock:](v17, "observeDefaults:onQueue:withBlock:", v19, MEMORY[0x1E0C80D38], v28);

    v23 = v11->_attentionClient;
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __112__SBAmbientWirelessChargingIdleTimer_initWithAmbientPresentationController_screenSleepCoordinator_uiController___block_invoke_2;
    v26[3] = &unk_1E8EA36F8;
    objc_copyWeak(&v27, &location);
    -[AWAttentionAwarenessClient setEventHandlerWithQueue:block:](v23, "setEventHandlerWithQueue:block:", MEMORY[0x1E0C80D38], v26);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v11, sel__noteSpringBoardBootComplete, CFSTR("SBBootCompleteNotification"), 0);
    objc_msgSend(v24, "addObserver:selector:name:object:", v11, sel__noteQiPowerStatusChanged, CFSTR("SBUIQiPowerStatusChangedNotification"), 0);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __112__SBAmbientWirelessChargingIdleTimer_initWithAmbientPresentationController_screenSleepCoordinator_uiController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reconfigureAttentionClient");

}

void __112__SBAmbientWirelessChargingIdleTimer_initWithAmbientPresentationController_screenSleepCoordinator_uiController___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "eventMask") & 1) != 0)
  {
    v3 = objc_opt_class();
    v4 = v8;
    if (v3)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5 = v4;
      else
        v5 = 0;
    }
    else
    {
      v5 = 0;
    }
    v6 = v5;

    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "_handleAttentionLost:", v6);

    }
  }

}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[SBAmbientWirelessChargingIdleTimer _updateIdleTimerEnablement](self, "_updateIdleTimerEnablement");
}

- (void)ambientPresentationController:(id)a3 didUpdatePresented:(BOOL)a4
{
  -[SBAmbientWirelessChargingIdleTimer _setAmbientPresented:](self, "_setAmbientPresented:", a4);
}

- (void)backlightController:(id)a3 didTransitionToBacklightState:(int64_t)a4 source:(int64_t)a5
{
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogAmbientDeviceState();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBBacklightStateDescription(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: backlight state changed to %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[SBAmbientWirelessChargingIdleTimer _updateIdleTimerEnablement](self, "_updateIdleTimerEnablement");
}

- (void)_noteSpringBoardBootComplete
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogAmbientDeviceState();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: got notification that SpringBoard boot completed", (uint8_t *)&v5, 0xCu);

  }
  -[SBAmbientWirelessChargingIdleTimer _updateIdleTimerEnablement](self, "_updateIdleTimerEnablement");
}

- (void)_noteQiPowerStatusChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogAmbientDeviceState();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: got notification that Qi power status changed", (uint8_t *)&v5, 0xCu);

  }
  -[SBAmbientWirelessChargingIdleTimer _updateIdleTimerEnablement](self, "_updateIdleTimerEnablement");
}

- (id)_backlightController
{
  SBBacklightController *lazy_backlightController;
  SBBacklightController *v4;
  SBBacklightController *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  lazy_backlightController = self->_lazy_backlightController;
  if (lazy_backlightController)
    return lazy_backlightController;
  +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
  v4 = (SBBacklightController *)objc_claimAutoreleasedReturnValue();
  v5 = self->_lazy_backlightController;
  self->_lazy_backlightController = v4;

  -[SBBacklightController addObserver:](self->_lazy_backlightController, "addObserver:", self);
  if (!self->_lazy_backlightController)
  {
    lazy_backlightController = 0;
    return lazy_backlightController;
  }
  SBLogAmbientDeviceState();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: got backlight controller instance", (uint8_t *)&v9, 0xCu);

  }
  return self->_lazy_backlightController;
}

- (void)_setAmbientPresented:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_ambientPresented != a3)
  {
    v3 = a3;
    self->_ambientPresented = a3;
    SBLogAmbientDeviceState();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: ambientPresented=%{BOOL}u", (uint8_t *)&v7, 0x12u);

    }
    -[SBAmbientWirelessChargingIdleTimer _updateIdleTimerEnablement](self, "_updateIdleTimerEnablement");
  }
}

- (void)_updateIdleTimerEnablement
{
  _BOOL4 v3;
  void *v4;
  int v5;
  _BOOL8 v8;
  NSObject *v9;
  void *v10;
  _BOOL4 enabled;
  _BOOL4 ambientPresented;
  int v13;
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[SBUIController isConnectedToQiPower](self->_uiController, "isConnectedToQiPower");
  -[SBAmbientWirelessChargingIdleTimer _backlightController](self, "_backlightController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "screenIsOn");

  v8 = self->_ambientPresented && v5 != 0 && v3 && self->_enabled;
  SBLogAmbientDeviceState();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    enabled = self->_enabled;
    ambientPresented = self->_ambientPresented;
    v13 = 138544642;
    v14 = v10;
    v15 = 1024;
    v16 = v8;
    v17 = 1024;
    v18 = enabled;
    v19 = 1024;
    v20 = v3;
    v21 = 1024;
    v22 = v5;
    v23 = 1024;
    v24 = ambientPresented;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Wireless charging idle timer requested = %{BOOL}d [ enabled:%{BOOL}d ; isOnQiPower:%{BOOL}d ; screenIs"
      "On:%{BOOL}d ; ambientPresented:%{BOOL}d ]",
      (uint8_t *)&v13,
      0x2Au);

  }
  -[SBAmbientWirelessChargingIdleTimer _setAttentionClientActive:](self, "_setAttentionClientActive:", v8);
}

- (void)_setAttentionClientActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_attentionClientActive != a3)
  {
    v3 = a3;
    self->_attentionClientActive = a3;
    SBLogAmbientDeviceState();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v7;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Resuming attention client", (uint8_t *)&v9, 0xCu);

      }
      -[AWAttentionAwarenessClient resumeWithError:](self->_attentionClient, "resumeWithError:", 0);
    }
    else
    {
      if (v6)
      {
        -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = v8;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Suspending attention client", (uint8_t *)&v9, 0xCu);

      }
      -[AWAttentionAwarenessClient suspendWithError:](self->_attentionClient, "suspendWithError:", 0);
    }
  }
}

- (id)succinctDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
}

- (void)_reconfigureAttentionClient
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CFEC08]);
  objc_msgSend(v3, "setIdentifier:", CFSTR("com.apple.SpringBoard.AmbientWirelessCharging"));
  objc_msgSend(v3, "setEventMask:", 3967);
  objc_msgSend(v3, "setAttentionLostEventMask:", 0);
  -[SBAmbientDefaults qiChargingIdleTimerDuration](self->_ambientTestingDefaults, "qiChargingIdleTimerDuration");
  objc_msgSend(v3, "setAttentionLostTimeout:");
  SBLogAmbientDeviceState();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating attention client with configuration %{public}@", (uint8_t *)&v6, 0x16u);

  }
  -[AWAttentionAwarenessClient setConfiguration:](self->_attentionClient, "setConfiguration:", v3);

}

- (void)_handleAttentionLost:(id)a3
{
  NSObject *v4;
  void *v5;
  _BOOL4 attentionClientActive;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogAmbientDeviceState();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    attentionClientActive = self->_attentionClientActive;
    v9 = 138543618;
    v10 = v5;
    v11 = 1024;
    v12 = attentionClientActive;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Attention lost. _attentionClientActive = %{BOOL}u", (uint8_t *)&v9, 0x12u);

  }
  if (self->_attentionClientActive)
  {
    SBLogAmbientDeviceState();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[SBAmbientWirelessChargingIdleTimer succinctDescription](self, "succinctDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Turning screen off for inactivity while on Qi charger", (uint8_t *)&v9, 0xCu);

    }
    -[SBScreenSleepCoordinator sleepAndLockUIFromSource:completion:](self->_screenSleepCoordinator, "sleepAndLockUIFromSource:completion:", 13, 0);
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)_ambientPresented
{
  return self->_ambientPresented;
}

- (BOOL)_isAttentionClientActive
{
  return self->_attentionClientActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientTestingDefaults, 0);
  objc_storeStrong((id *)&self->_attentionClient, 0);
  objc_storeStrong((id *)&self->_lazy_backlightController, 0);
  objc_storeStrong((id *)&self->_screenSleepCoordinator, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
}

@end
