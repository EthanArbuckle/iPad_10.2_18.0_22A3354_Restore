@implementation SBSOSEventHandler

- (BOOL)isSOSActive
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[SBSOSEventHandler _sosManager](self, "_sosManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[SBSOSEventHandler _sosManager](self, "_sosManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentSOSInitiationState");

  return v5 == 1;
}

- (SOSManager)_sosManager
{
  SOSManager *override_sosManager;

  override_sosManager = self->_override_sosManager;
  if (override_sosManager)
    return override_sosManager;
  objc_msgSend(MEMORY[0x1E0D89860], "sharedInstance");
  return (SOSManager *)(id)objc_claimAutoreleasedReturnValue();
}

+ (SBSOSEventHandler)sharedInstance
{
  if (sharedInstance_onceToken_44 != -1)
    dispatch_once(&sharedInstance_onceToken_44, &__block_literal_global_283);
  return (SBSOSEventHandler *)(id)sharedInstance_eventHandler;
}

void __35__SBSOSEventHandler_sharedInstance__block_invoke()
{
  SBSOSEventHandler *v0;
  void *v1;

  v0 = objc_alloc_init(SBSOSEventHandler);
  v1 = (void *)sharedInstance_eventHandler;
  sharedInstance_eventHandler = (uint64_t)v0;

}

- (SBSOSEventHandler)init
{
  SBSOSEventHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSOSEventHandler;
  result = -[SBSOSEventHandler init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_isValid = 1;
  return result;
}

- (void)invalidate
{
  id v3;

  if (self->_isValid)
  {
    self->_isValid = 0;
    -[BSCompoundAssertion invalidate](self->_observers, "invalidate");
    -[SBSOSEventHandler _sosManager](self, "_sosManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
}

- (void)dealloc
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSOSEventHandler.m");
  v16 = 1024;
  v17 = 73;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)run
{
  void *v3;

  if (!-[SBSOSEventHandler _isRunning](self, "_isRunning"))
  {
    -[SBSOSEventHandler _sosManager](self, "_sosManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:queue:", self, MEMORY[0x1E0C80D38]);

    -[SBSOSEventHandler _setRunning:](self, "_setRunning:", 1);
  }
}

- (id)addObserver:(id)a3
{
  id v4;
  BSCompoundAssertion *observers;
  BSCompoundAssertion *v6;
  BSCompoundAssertion *v7;
  void *v8;
  void *v9;

  v4 = a3;
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:", CFSTR("SOSEventObservers"));
    v6 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
  }
  objc_msgSend((id)objc_opt_class(), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](observers, "acquireForReason:withContext:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3
{
  BSDispatchMain();
}

void __56__SBSOSEventHandler_didUpdateCurrentSOSInitiationState___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  objc_class *v5;
  void *v6;
  const char *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isSOSActive");
  SBLogButtonsCombo();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4)
      goto LABEL_7;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    v7 = "%{public}@ - SOS UI initiation state changed. SOS active";
  }
  else
  {
    if (!v4)
      goto LABEL_7;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    v7 = "%{public}@ - SOS UI initiation state changed. SOS inactive";
  }
  _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);

LABEL_7:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "orderedContext", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "SOSEventHandlerStateDidChange:", *(_QWORD *)(a1 + 32));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)didDismissSOSBeforeSOSCall:(int64_t)a3
{
  BSDispatchMain();
}

void __48__SBSOSEventHandler_didDismissSOSBeforeSOSCall___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogButtonsCombo();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - SOS dismissed", (uint8_t *)&v10, 0xCu);

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (v5 != 1)
      return;
    objc_msgSend(*(id *)(a1 + 32), "_backlightController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBacklightState:source:", 3, 3);

    v7 = *(void **)(a1 + 32);
    v8 = 1;
    v9 = 0;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = 22;
    v9 = 1;
  }
  objc_msgSend(v7, "_forceBioAuthenticationLockoutIfAvailableWithSource:showingPasscode:", v8, v9);
}

- (void)_forceBioAuthenticationLockoutIfAvailableWithSource:(int)a3 showingPasscode:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v13[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "authenticationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPasscodeSet");

  if ((v7 & v4) != 0)
    v8 = &__block_literal_global_11_5;
  else
    v8 = 0;
  v12[0] = CFSTR("SBUILockOptionsForceBioLockoutKey");
  v12[1] = CFSTR("SBUILockOptionsForceLockKey");
  v13[0] = MEMORY[0x1E0C9AAB0];
  v13[1] = MEMORY[0x1E0C9AAB0];
  v12[2] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lockUIFromSource:withOptions:completion:", v5, v10, v8);

}

void __89__SBSOSEventHandler__forceBioAuthenticationLockoutIfAvailableWithSource_showingPasscode___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_12_3);
}

void __89__SBSOSEventHandler__forceBioAuthenticationLockoutIfAvailableWithSource_showingPasscode___block_invoke_2()
{
  id v0;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPasscodeVisible:animated:", 1, 1);

}

- (SBFUserAuthenticationController)_authenticationController
{
  SBFUserAuthenticationController *override_authenticationController;

  override_authenticationController = self->_override_authenticationController;
  if (override_authenticationController)
    return override_authenticationController;
  objc_msgSend((id)SBApp, "authenticationController");
  return (SBFUserAuthenticationController *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBBacklightController)_backlightController
{
  SBBacklightController *override_backlightController;

  override_backlightController = self->_override_backlightController;
  if (override_backlightController)
    return override_backlightController;
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  return (SBBacklightController *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBLockScreenManager)_lockScreenManager
{
  SBLockScreenManager *override_lockscreenManager;

  override_lockscreenManager = self->_override_lockscreenManager;
  if (override_lockscreenManager)
    return override_lockscreenManager;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  return (SBLockScreenManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_isRunning
{
  return self->_running;
}

- (void)_setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_override_sosManager, 0);
  objc_storeStrong((id *)&self->_override_lockscreenManager, 0);
  objc_storeStrong((id *)&self->_override_backlightController, 0);
  objc_storeStrong((id *)&self->_override_authenticationController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_coversheetObserverToken, 0);
}

@end
