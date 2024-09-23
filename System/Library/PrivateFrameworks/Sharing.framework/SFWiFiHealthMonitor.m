@implementation SFWiFiHealthMonitor

- (SFWiFiHealthMonitor)init
{
  SFWiFiHealthMonitor *v2;
  SFWiFiHealthMonitor *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFWiFiHealthMonitor;
  v2 = -[SFWiFiHealthMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    *(_QWORD *)&v3->_lockdownActivated = -1;
  }
  return v3;
}

- (id)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  NSAppendPrintF();
  v3 = 0;
  NSAppendPrintF();
  v4 = v3;

  NSAppendPrintF();
  v5 = v4;

  if (self->_wifiStatusGoodTicks)
  {
    mach_absolute_time();
    UpTicksToSeconds();
    NSAppendPrintF();
    v6 = v5;

    v5 = v6;
  }
  if (self->_wifiStatusBadTicks)
  {
    mach_absolute_time();
    UpTicksToSeconds();
    NSAppendPrintF();
    v7 = v5;

    v5 = v7;
  }
  return v5;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SFWiFiHealthMonitor_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SFWiFiHealthMonitor_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  double v3;
  double v4;
  double wifiStatusDebounceSecs;
  NSObject *dispatchQueue;
  double v7;
  double v8;
  _QWORD handler[5];
  int v10;

  if (gLogCategory_SFWiFiHealthMonitor <= 30
    && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = 0;
  CFPrefs_GetDouble();
  v4 = v3;
  wifiStatusDebounceSecs = self->_wifiStatusDebounceSecs;
  if (v4 != wifiStatusDebounceSecs)
  {
    if (gLogCategory_SFWiFiHealthMonitor <= 40)
    {
      if (gLogCategory_SFWiFiHealthMonitor == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_10;
        wifiStatusDebounceSecs = self->_wifiStatusDebounceSecs;
      }
      v7 = wifiStatusDebounceSecs;
      v8 = v4;
      LogPrintF();
    }
LABEL_10:
    self->_wifiStatusDebounceSecs = v4;
  }
  if (self->_lockdownActivationNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __32__SFWiFiHealthMonitor__activate__block_invoke;
    handler[3] = &unk_1E482FB48;
    handler[4] = self;
    notify_register_dispatch("com.apple.mobile.lockdown.activation_state", &self->_lockdownActivationNotifyToken, dispatchQueue, handler);
  }
  -[SFWiFiHealthMonitor _update](self, "_update", *(_QWORD *)&v7, *(_QWORD *)&v8);
}

uint64_t __32__SFWiFiHealthMonitor__activate__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_DWORD *)(v1 + 12) = -1;
    return objc_msgSend(*(id *)(result + 32), "_update");
  }
  return result;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFWiFiHealthMonitor_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__SFWiFiHealthMonitor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int lockdownActivationNotifyToken;
  CURetrier *wifiRetrier;
  void (**invalidationHandler)(void);
  id v6;
  id statusHandler;

  if (!self->_invalidateCalled
    && gLogCategory_SFWiFiHealthMonitor <= 30
    && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  lockdownActivationNotifyToken = self->_lockdownActivationNotifyToken;
  if (lockdownActivationNotifyToken != -1)
  {
    notify_cancel(lockdownActivationNotifyToken);
    self->_lockdownActivationNotifyToken = -1;
  }
  -[CURetrier invalidateDirect](self->_wifiRetrier, "invalidateDirect");
  wifiRetrier = self->_wifiRetrier;
  self->_wifiRetrier = 0;

  -[SFWiFiHealthMonitor _wifiEnsureStopped](self, "_wifiEnsureStopped");
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    v6 = self->_invalidationHandler;
  }
  else
  {
    v6 = 0;
  }
  self->_invalidationHandler = 0;

  statusHandler = self->_statusHandler;
  self->_statusHandler = 0;

}

- (void)reset
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SFWiFiHealthMonitor_reset__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SFWiFiHealthMonitor_reset__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFWiFiHealthMonitor <= 30
    && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_wifiStatusChangedInternal:", 1);
}

- (void)_update
{
  int lockdownActivated;
  const char *v4;
  const char *v5;
  CURetrier *wifiRetrier;
  CURetrier *v7;
  CURetrier *v8;
  CURetrier *v9;
  const char *v10;
  const char *v11;
  _QWORD v12[5];

  lockdownActivated = self->_lockdownActivated;
  if (lockdownActivated < 0)
  {
    lockdownActivated = MAGetActivationState();
    if (self->_lockdownActivated != lockdownActivated)
    {
      if (gLogCategory_SFWiFiHealthMonitor <= 30
        && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
      {
        v4 = "yes";
        if (lockdownActivated)
          v5 = "no";
        else
          v5 = "yes";
        if (!lockdownActivated)
          v4 = "no";
        v10 = v5;
        v11 = v4;
        LogPrintF();
      }
      self->_lockdownActivated = lockdownActivated;
    }
  }
  wifiRetrier = self->_wifiRetrier;
  if (lockdownActivated)
  {
    if (!wifiRetrier)
    {
      if (gLogCategory_SFWiFiHealthMonitor <= 30
        && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7 = (CURetrier *)objc_alloc_init(MEMORY[0x1E0D1B430]);
      v8 = self->_wifiRetrier;
      self->_wifiRetrier = v7;

      -[CURetrier setDispatchQueue:](self->_wifiRetrier, "setDispatchQueue:", self->_dispatchQueue);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __30__SFWiFiHealthMonitor__update__block_invoke;
      v12[3] = &unk_1E482DF78;
      v12[4] = self;
      -[CURetrier setActionHandler:](self->_wifiRetrier, "setActionHandler:", v12);
      -[CURetrier startDirect](self->_wifiRetrier, "startDirect");
    }
  }
  else
  {
    if (wifiRetrier)
    {
      if (gLogCategory_SFWiFiHealthMonitor <= 30
        && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[CURetrier invalidateDirect](self->_wifiRetrier, "invalidateDirect", v10, v11);
      v9 = self->_wifiRetrier;
      self->_wifiRetrier = 0;

    }
    -[SFWiFiHealthMonitor _wifiEnsureStopped](self, "_wifiEnsureStopped");
  }
}

uint64_t __30__SFWiFiHealthMonitor__update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wifiEnsureStarted");
}

- (void)_wifiEnsureStarted
{
  uint64_t v3;
  __WiFiManagerClient *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  __WiFiDeviceClient *ValueAtIndex;
  const __CFArray *v8;

  *(int64x2_t *)&self->_wifiStatusExternal = vdupq_n_s64(1uLL);
  v3 = mach_absolute_time();
  self->_wifiStatusBadTicks = 0;
  self->_wifiStatusGoodTicks = v3;
  if (self->_wifiManager)
    goto LABEL_36;
  v4 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->_wifiManager = v4;
  if (v4)
    goto LABEL_36;
  if (gLogCategory_SFWiFiHealthMonitor <= 60)
  {
    if (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (self->_wifiManager)
    {
LABEL_36:
      if (!self->_wifiManagerSetup)
      {
        CFRunLoopGetMain();
        WiFiManagerClientScheduleWithRunLoop();
        WiFiManagerClientRegisterDeviceAttachmentCallback();
        WiFiManagerClientRegisterServerRestartCallback();
        self->_wifiManagerSetup = 1;
        if (gLogCategory_SFWiFiHealthMonitor <= 30
          && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      if (self->_wifiManager && !self->_wifiDevice)
      {
        v5 = (const __CFArray *)WiFiManagerClientCopyDevices();
        v6 = v5;
        if (v5 && CFArrayGetCount(v5) >= 1)
        {
          ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v6, 0);
          self->_wifiDevice = ValueAtIndex;
          CFRetain(ValueAtIndex);
LABEL_24:
          CFRelease(v6);
          goto LABEL_25;
        }
        if (gLogCategory_SFWiFiHealthMonitor <= 60
          && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
        {
          v8 = v6;
          LogPrintF();
        }
        if (v6)
          goto LABEL_24;
      }
    }
  }
LABEL_25:
  if (self->_wifiDevice && !self->_wifiDeviceSetup)
  {
    WiFiDeviceClientRegisterAutoJoinNotificationCallback();
    WiFiDeviceClientRegisterRemovalCallback();
    self->_wifiDeviceSetup = 1;
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[CURetrier succeededDirect](self->_wifiRetrier, "succeededDirect", v8);
  }
  if (!self->_wifiDeviceSetup)
    -[CURetrier failedDirect](self->_wifiRetrier, "failedDirect");
}

- (void)_wifiEnsureStopped
{
  OS_dispatch_source *wifiStatusDebounceTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  wifiStatusDebounceTimer = self->_wifiStatusDebounceTimer;
  if (wifiStatusDebounceTimer)
  {
    v4 = wifiStatusDebounceTimer;
    dispatch_source_cancel(v4);
    v5 = self->_wifiStatusDebounceTimer;
    self->_wifiStatusDebounceTimer = 0;

  }
  self->_wifiDeviceSetup = 0;
  if (self->_wifiDevice)
  {
    WiFiDeviceClientRegisterAutoJoinNotificationCallback();
    WiFiDeviceClientRegisterRemovalCallback();
    CFRelease(self->_wifiDevice);
    self->_wifiDevice = 0;
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  self->_wifiManagerSetup = 0;
  if (self->_wifiManager)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterServerRestartCallback();
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_wifiAutoJoinNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SFWiFiHealthMonitor <= 30
    && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
  {
    v6 = v4;
    LogPrintF();
  }
  if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D4FE18], v6) & 1) != 0
    || (objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D4FE10]) & 1) != 0
    || objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D4FDF8]))
  {
    if (CFDictionaryGetInt64())
      v5 = 3;
    else
      v5 = 2;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D4FE20]))
      goto LABEL_12;
    v5 = 1;
  }
  -[SFWiFiHealthMonitor _wifiStatusChangedInternal:](self, "_wifiStatusChangedInternal:", v5);
LABEL_12:

}

- (void)_wifiStatusChangedExternal:(int64_t)a3
{
  void (**statusHandler)(id, int64_t);

  if (self->_wifiStatusExternal != a3)
  {
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_wifiStatusExternal = a3;
    statusHandler = (void (**)(id, int64_t))self->_statusHandler;
    if (statusHandler)
      statusHandler[2](statusHandler, a3);
  }
}

- (void)_wifiStatusChangedInternal:(int64_t)a3
{
  OS_dispatch_source *wifiStatusDebounceTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  _QWORD handler[5];

  if (self->_wifiStatusInternal != a3)
  {
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_wifiStatusInternal = a3;
    if (a3 == 1)
    {
      self->_wifiStatusBadTicks = 0;
      self->_wifiStatusGoodTicks = mach_absolute_time();
      wifiStatusDebounceTimer = self->_wifiStatusDebounceTimer;
      if (wifiStatusDebounceTimer)
      {
        v6 = wifiStatusDebounceTimer;
        dispatch_source_cancel(v6);
        v7 = self->_wifiStatusDebounceTimer;
        self->_wifiStatusDebounceTimer = 0;

      }
      -[SFWiFiHealthMonitor _wifiStatusChangedExternal:](self, "_wifiStatusChangedExternal:", self->_wifiStatusInternal);
    }
    else if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      self->_wifiStatusBadTicks = mach_absolute_time();
      self->_wifiStatusGoodTicks = 0;
      if (!self->_wifiStatusDebounceTimer)
      {
        v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        v9 = self->_wifiStatusDebounceTimer;
        self->_wifiStatusDebounceTimer = v8;

        v10 = self->_wifiStatusDebounceTimer;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __50__SFWiFiHealthMonitor__wifiStatusChangedInternal___block_invoke;
        handler[3] = &unk_1E482DF78;
        handler[4] = self;
        dispatch_source_set_event_handler(v10, handler);
        SFDispatchTimerSet(self->_wifiStatusDebounceTimer, self->_wifiStatusDebounceSecs, -1.0, -4.0);
        dispatch_resume((dispatch_object_t)self->_wifiStatusDebounceTimer);
      }
    }
  }
}

uint64_t __50__SFWiFiHealthMonitor__wifiStatusChangedInternal___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(void **)(*(_QWORD *)(v1 + 32) + 88);
    if (v2)
    {
      v3 = v2;
      dispatch_source_cancel(v3);
      v4 = *(_QWORD *)(v1 + 32);
      v5 = *(void **)(v4 + 88);
      *(_QWORD *)(v4 + 88) = 0;

    }
    return objc_msgSend(*(id *)(v1 + 32), "_wifiStatusChangedExternal:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 104));
  }
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)statusHandler
{
  return self->_statusHandler;
}

- (void)setStatusHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiStatusDebounceTimer, 0);
  objc_storeStrong((id *)&self->_wifiRetrier, 0);
}

@end
