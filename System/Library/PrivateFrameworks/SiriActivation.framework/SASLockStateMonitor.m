@implementation SASLockStateMonitor

- (SASLockStateMonitor)init
{
  SASLockStateMonitor *v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  __CFNotificationCenter *v6;
  _QWORD block[4];
  SASLockStateMonitor *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SASLockStateMonitor;
  v2 = -[SASLockStateMonitor init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__lockStateDidChange_, CFSTR("SBDeviceLockStateChangedNotification"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_PasscodeLockStateDidChange, CFSTR("com.apple.springboard.DeviceLockStatusChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__lockStateDidChange_, CFSTR("SBBiometricEventMonitorHasAuthenticated"), 0);

    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)_AFPreferencesDidChangeCallback, (CFStringRef)*MEMORY[0x1E0CFEB68], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__SASLockStateMonitor_init__block_invoke;
    block[3] = &unk_1E91FC1A0;
    v9 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  return v2;
}

uint64_t __27__SASLockStateMonitor_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLockState:", objc_msgSend(*(id *)(a1 + 32), "_currentLockState"));
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.springboard.DeviceLockStatusChanged"), 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x1E0CFEB68], 0);
  v6.receiver = self;
  v6.super_class = (Class)SASLockStateMonitor;
  -[SASLockStateMonitor dealloc](&v6, sel_dealloc);
}

- (BOOL)isBlocked
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  char v7;
  _QWORD block[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    soft_SBUIGetUserAgent_0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "deviceIsBlocked");
    *((_BYTE *)v11 + 24) = v6;

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__SASLockStateMonitor_isBlocked__block_invoke;
    block[3] = &unk_1E91FC090;
    block[4] = &v10;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __32__SASLockStateMonitor_isBlocked__block_invoke(uint64_t a1)
{
  id v2;

  soft_SBUIGetUserAgent_0();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "deviceIsBlocked");

}

- (BOOL)hasUnlockedSinceBoot
{
  unsigned int (*v2)(void);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (unsigned int (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v9 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v5[3] = &unk_1E91FC090;
    v5[4] = &v6;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (unsigned int (*)(void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)soft_SBUIGetUserAgent_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  return v2() == 1;
}

- (BOOL)isScreenOn
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;
  char v7;
  _QWORD block[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    soft_SBUIGetUserAgent_0();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isScreenOn");
    *((_BYTE *)v11 + 24) = v6;

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__SASLockStateMonitor_isScreenOn__block_invoke;
    block[3] = &unk_1E91FC090;
    block[4] = &v10;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
  v7 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __33__SASLockStateMonitor_isScreenOn__block_invoke(uint64_t a1)
{
  id v2;

  soft_SBUIGetUserAgent_0();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "isScreenOn");

}

- (unint64_t)_currentLockState
{
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  char v5;
  unint64_t v6;
  _QWORD aBlock[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__SASLockStateMonitor__currentLockState__block_invoke;
  aBlock[3] = &unk_1E91FC090;
  aBlock[4] = &v9;
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
    v2[2](v2);
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v2);
  v6 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __40__SASLockStateMonitor__currentLockState__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;

  soft_SBUIGetUserAgent_0();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lockScreenIsShowing");

  if (v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 1uLL;
  soft_SBUIGetUserAgent_0();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceIsPasscodeLocked");

  if (v5)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 2uLL;
}

- (void)_lockStateDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("SBBiometricEventMonitorHasAuthenticated"));

  if ((v5 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v11, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("SBDeviceLockStateChangedNotification"));

  if (v7)
  {
    objc_msgSend(v11, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("kSBNotificationKeyState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
LABEL_4:
      -[SASLockStateMonitor setUnlockedByTouchID:](self, "setUnlockedByTouchID:", v5);
  }
  -[SASLockStateMonitor _updateLockState](self, "_updateLockState");

}

- (void)_updateLockState
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = -[SASLockStateMonitor _currentLockState](self, "_currentLockState");
  if (-[SASLockStateMonitor lockState](self, "lockState") != v3)
  {
    v4 = -[SASLockStateMonitor lockState](self, "lockState");
    -[SASLockStateMonitor setLockState:](self, "setLockState:", v3);
    -[SASLockStateMonitor delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "didChangeLockState:toState:", v4, -[SASLockStateMonitor lockState](self, "lockState"));
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "didChangeLockState:", -[SASLockStateMonitor lockState](self, "lockState"));
    }
    -[SASLockStateMonitor assistantIsEnabled](self, "assistantIsEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v3)
        v9 = 1435;
      else
        v9 = 1436;
      objc_msgSend(v7, "logEventWithType:context:", v9, 0);

    }
  }
}

- (NSNumber)assistantIsEnabled
{
  NSNumber *assistantIsEnabled;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  assistantIsEnabled = self->_assistantIsEnabled;
  if (!assistantIsEnabled)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "assistantIsEnabled"));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assistantIsEnabled;
    self->_assistantIsEnabled = v6;

    assistantIsEnabled = self->_assistantIsEnabled;
  }
  return assistantIsEnabled;
}

- (SASLockStateMonitorDelegate)delegate
{
  return (SASLockStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (BOOL)unlockedByTouchID
{
  return self->_unlockedByTouchID;
}

- (void)setUnlockedByTouchID:(BOOL)a3
{
  self->_unlockedByTouchID = a3;
}

- (void)setAssistantIsEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_assistantIsEnabled, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantIsEnabled, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
