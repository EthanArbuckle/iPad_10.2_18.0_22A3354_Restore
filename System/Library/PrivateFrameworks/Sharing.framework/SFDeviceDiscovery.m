@implementation SFDeviceDiscovery

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (NSSet)deviceFilter
{
  return self->_deviceFilter;
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (int64_t)scanRate
{
  return self->_scanRate;
}

- (BOOL)overrideScreenOff
{
  return self->_overrideScreenOff;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (NSSet)useCases
{
  return self->_useCases;
}

- (BOOL)trackPeers
{
  return self->_trackPeers;
}

- (int64_t)scanRateOverride
{
  return self->_scanRateOverride;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (int64_t)overrideScreenOffRescanInterval
{
  return self->_overrideScreenOffRescanInterval;
}

uint64_t __46__SFDeviceDiscovery__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceDiscoveryUpdate:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "_startTimeoutIfNeeded");
}

uint64_t __33__SFDeviceDiscovery_setScanRate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 176) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __42__SFDeviceDiscovery_setOverrideScreenOff___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __39__SFDeviceDiscovery_setDiscoveryFlags___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 112) = *(_QWORD *)(result + 40);
  return result;
}

- (void)dealloc
{
  id deviceFoundHandler;
  id deviceLostHandler;
  id interruptionHandler;
  id invalidationHandler;
  id scanStateChangedHandler;
  id timeoutHandler;
  SFDeviceDiscovery *v9;
  SEL v10;
  objc_super v11;

  if (!self->_activateCalled || self->_invalidateCalled || self->_invalidateDone)
  {
    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    scanStateChangedHandler = self->_scanStateChangedHandler;
    self->_scanStateChangedHandler = 0;

    timeoutHandler = self->_timeoutHandler;
    self->_timeoutHandler = 0;

    v11.receiver = self;
    v11.super_class = (Class)SFDeviceDiscovery;
    -[SFDeviceDiscovery dealloc](&v11, sel_dealloc);
  }
  else
  {
    v9 = (SFDeviceDiscovery *)FatalErrorF();
    -[SFDeviceDiscovery .cxx_destruct](v9, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scanStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_useCases, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_consoleUserTimer, 0);
}

- (SFDeviceDiscovery)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SFDeviceDiscovery;
  v5 = -[SFDeviceDiscovery init](&v29, sel_init);
  if (v5)
  {
    SFMainQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v6;

    *(_OWORD *)(v5 + 168) = xmmword_1A2AF8030;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("changeFlags")))
      *((_DWORD *)v5 + 18) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeFlags"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("deviceFilter")))
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      v9 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("deviceFilter"));
      v11 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "raise:format:", v13, CFSTR("%@: non-set value for key %@ : %@"), v14, CFSTR("deviceFilter"), v11);

      }
      v15 = (void *)*((_QWORD *)v5 + 10);
      *((_QWORD *)v5 + 10) = v11;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("discoveryFlags")))
      *((_QWORD *)v5 + 14) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("discoveryFlags"));
    v16 = v4;
    if (objc_msgSend(v16, "containsValueForKey:", CFSTR("fastScanMode")))
      *((_QWORD *)v5 + 16) = objc_msgSend(v16, "decodeIntegerForKey:", CFSTR("fastScanMode"));

    if (objc_msgSend(v16, "containsValueForKey:", CFSTR("legacy")))
      v5[42] = objc_msgSend(v16, "decodeBoolForKey:", CFSTR("legacy"));
    if (objc_msgSend(v16, "containsValueForKey:", CFSTR("overrideScreenOff")))
      v5[64] = objc_msgSend(v16, "decodeBoolForKey:", CFSTR("overrideScreenOff"));
    if (objc_msgSend(v16, "containsValueForKey:", CFSTR("osoitvl")))
      *((_QWORD *)v5 + 19) = objc_msgSend(v16, "decodeIntegerForKey:", CFSTR("osoitvl"));
    v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (objc_msgSend(v17, "containsValueForKey:", CFSTR("rssiChangeDetection")))
      v5[65] = objc_msgSend(v17, "decodeBoolForKey:", CFSTR("rssiChangeDetection"));
    if (objc_msgSend(v17, "containsValueForKey:", CFSTR("rssiThreshold")))
      *((_QWORD *)v5 + 21) = objc_msgSend(v17, "decodeIntegerForKey:", CFSTR("rssiThreshold"));
    if (objc_msgSend(v17, "containsValueForKey:", CFSTR("scanCache")))
      v5[66] = objc_msgSend(v17, "decodeBoolForKey:", CFSTR("scanCache"));
    if (objc_msgSend(v17, "containsValueForKey:", CFSTR("scanRate")))
      *((_QWORD *)v5 + 22) = objc_msgSend(v17, "decodeIntegerForKey:", CFSTR("scanRate"));
    v18 = v17;
    if (objc_msgSend(v18, "containsValueForKey:", CFSTR("trackPeers")))
      v5[68] = objc_msgSend(v18, "decodeBoolForKey:", CFSTR("trackPeers"));

    if (objc_msgSend(v18, "containsValueForKey:", CFSTR("useCases")))
    {
      v19 = (void *)MEMORY[0x1E0C99E60];
      v20 = objc_opt_class();
      objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "decodeObjectOfClasses:forKey:", v21, CFSTR("useCases"));
      v22 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (void *)MEMORY[0x1E0C99DA0];
        v24 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "raise:format:", v24, CFSTR("%@: non-set value for key %@ : %@"), v25, CFSTR("deviceFilter"), v22);

      }
      v26 = (void *)*((_QWORD *)v5 + 26);
      *((_QWORD *)v5 + 26) = v22;

    }
    v27 = v5;
  }

  return (SFDeviceDiscovery *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *deviceFilter;
  int64_t fastScanMode;
  int64_t overrideScreenOffRescanInterval;
  NSString *purpose;
  int64_t rssiThreshold;
  NSSet *useCases;
  int64_t scanRate;
  int64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeInteger:forKey:", self->_changeFlags, CFSTR("changeFlags"));
  deviceFilter = self->_deviceFilter;
  if (deviceFilter)
    objc_msgSend(v13, "encodeObject:forKey:", deviceFilter, CFSTR("deviceFilter"));
  objc_msgSend(v13, "encodeInteger:forKey:", self->_discoveryFlags, CFSTR("discoveryFlags"));
  fastScanMode = self->_fastScanMode;
  if (fastScanMode)
    objc_msgSend(v13, "encodeInteger:forKey:", fastScanMode, CFSTR("fastScanMode"));
  if (self->_legacy)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("legacy"));
  if (self->_overrideScreenOff)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("overrideScreenOff"));
  overrideScreenOffRescanInterval = self->_overrideScreenOffRescanInterval;
  if (overrideScreenOffRescanInterval)
    objc_msgSend(v13, "encodeInteger:forKey:", overrideScreenOffRescanInterval, CFSTR("osoitvl"));
  purpose = self->_purpose;
  if (purpose)
    objc_msgSend(v13, "encodeObject:forKey:", purpose, CFSTR("purpose"));
  if (self->_rssiChangeDetection)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("rssiChangeDetection"));
  rssiThreshold = self->_rssiThreshold;
  if (rssiThreshold)
    objc_msgSend(v13, "encodeInteger:forKey:", rssiThreshold, CFSTR("rssiThreshold"));
  if (self->_scanCache)
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("scanCache"));
  useCases = self->_useCases;
  if (useCases)
    objc_msgSend(v13, "encodeObject:forKey:", useCases, CFSTR("useCases"));
  scanRate = self->_scanRate;
  if (scanRate > 2)
  {
    if (scanRate == 20)
      goto LABEL_33;
    if (scanRate != 3)
      goto LABEL_28;
    v11 = 40;
  }
  else
  {
    if (scanRate != 1)
    {
      if (scanRate == 2)
        goto LABEL_33;
LABEL_28:
      if (scanRate == 4)
        v11 = 50;
      else
        v11 = self->_scanRate;
      goto LABEL_32;
    }
    v11 = 10;
  }
LABEL_32:
  objc_msgSend(v13, "encodeInteger:forKey:", v11, CFSTR("scanRate"));
LABEL_33:
  v12 = v13;
  if (self->_trackPeers)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("trackPeers"));
    v12 = v13;
  }

}

- (void)deviceDiscoveryFoundDevice:(id)a3
{
  void *v4;
  void *v5;
  NSMutableDictionary *devices;
  void *v7;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 9
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    v13 = v14;
    LogPrintF();
  }
  objc_msgSend(v14, "identifier", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    devices = self->_devices;
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v14, v4);
      v7 = _Block_copy(self->_deviceChangedHandler);
      v8 = v7;
      if (v7)
        (*((void (**)(void *, id, uint64_t))v7 + 2))(v7, v14, 0xFFFFFFFFLL);
    }
    else
    {
      v9 = v14;
      if (!devices)
      {
        v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v11 = self->_devices;
        self->_devices = v10;

        v9 = v14;
        devices = self->_devices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v9, v4);
      v12 = _Block_copy(self->_deviceFoundHandler);
      v8 = v12;
      if (v12)
        (*((void (**)(void *, id))v12 + 2))(v12, v14);
    }

  }
}

- (void)deviceDiscoveryLostDevice:(id)a3
{
  void *v4;
  void *v5;
  void (**deviceLostHandler)(id, void *);
  id v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 9
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    v7 = v8;
    LogPrintF();
  }
  objc_msgSend(v8, "identifier", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4);
      objc_msgSend(v5, "setIsBLEDeviceReplaced:", objc_msgSend(v8, "isBLEDeviceReplaced"));
      deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
      if (deviceLostHandler)
        deviceLostHandler[2](deviceLostHandler, v5);
    }
  }
  else
  {
    v5 = 0;
  }

}

- (int64_t)fastScanMode
{
  return self->_fastScanMode;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (id)scanStateChangedHandler
{
  return self->_scanStateChangedHandler;
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setScanRate:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__SFDeviceDiscovery_setScanRate___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  v3[5] = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v4[6];

  v3 = a3 & 0xFFFFFFEC | 0x10;
  if ((a3 & 0x647FFC0) == 0)
    v3 = a3;
  if ((v3 & 0x400000) != 0)
    v3 |= 0x60uLL;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SFDeviceDiscovery_setDiscoveryFlags___block_invoke;
  v4[3] = &unk_1E482E018;
  if ((v3 & 0x40000) != 0)
    v3 |= 0x20060uLL;
  v4[4] = self;
  v4[5] = v3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v4);
}

- (void)setOverrideScreenOff:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__SFDeviceDiscovery_setOverrideScreenOff___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

- (void)setDeviceFilter:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SFDeviceDiscovery_setDeviceFilter___block_invoke;
  v6[3] = &unk_1E482D3A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);

}

- (void)_invokeBlockActivateSafe:(id)a3
{
  void (**v4)(_QWORD);
  SFDeviceDiscovery *v5;
  NSObject *v6;
  NSObject *dispatchQueue;
  _QWORD v8[5];
  void (**v9)(_QWORD);
  os_activity_scope_state_s state;

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFDeviceDiscovery/deviceDiscoveryUpdate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    dispatchQueue = v5->_dispatchQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__SFDeviceDiscovery__invokeBlockActivateSafe___block_invoke;
    v8[3] = &unk_1E482E0F0;
    v8[4] = v5;
    v9 = v4;
    dispatch_async(dispatchQueue, v8);

    os_activity_scope_leave(&state);
  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

void __37__SFDeviceDiscovery_setDeviceFilter___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allKeys");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7) & 1) == 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v7);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              if (gLogCategory_SFDeviceDiscovery <= 30
                && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
              {
                v10 = v8;
                LogPrintF();
              }
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", v7, v10);
              v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
              if (v9)
                (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);
            }

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

  }
}

- (void)_startTimeoutIfNeeded
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  _QWORD handler[5];

  if (self->_timeout > 0.0 && self->_scanState == 1 && !self->_timeoutFired && !self->_timeoutTimer)
  {
    if (gLogCategory_SFDeviceDiscovery <= 20
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v3;

    v5 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __42__SFDeviceDiscovery__startTimeoutIfNeeded__block_invoke;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    SFDispatchTimerSet(self->_timeoutTimer, self->_timeout, 1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }
}

- (void)deviceDiscoveryScanStateChanged:(int64_t)a3
{
  void (**scanStateChangedHandler)(id, int64_t);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_scanState = a3;
  scanStateChangedHandler = (void (**)(id, int64_t))self->_scanStateChangedHandler;
  if (scanStateChangedHandler)
    scanStateChangedHandler[2](scanStateChangedHandler, a3);
  -[SFDeviceDiscovery _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded");
}

- (id)description
{
  id v3;
  void *v4;
  NSString *purpose;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unsigned int changeFlags;
  id *v12;
  id v13;
  int64_t scanRate;
  const char *v15;
  id v16;
  int64_t fastScanMode;
  const char *v18;
  const char *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSString *v28;
  int64_t overrideScreenOffRescanInterval;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;

  v34 = 0;
  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  purpose = self->_purpose;
  if (purpose)
  {
    v33 = v3;
    v28 = purpose;
    NSAppendPrintF();
    v6 = v33;

    v4 = v6;
  }
  if (self->_invalidateCalled)
  {
    v32[4] = v4;
    NSAppendPrintF();
    v7 = v4;

    v4 = v7;
  }
  if (self->_legacy)
  {
    v32[3] = v4;
    NSAppendPrintF();
    v8 = v4;

    v4 = v8;
  }
  if (-[NSSet count](self->_deviceFilter, "count", v28))
  {
    v32[2] = v4;
    -[NSSet count](self->_deviceFilter, "count");
    NSAppendPrintF();
    v9 = v4;

    v4 = v9;
  }
  v32[1] = v4;
  v30 = &unk_1A2AF8109;
  NSAppendPrintF();
  v10 = v4;

  changeFlags = self->_changeFlags;
  if (changeFlags)
  {
    if (changeFlags == -1)
    {
      v32[0] = v10;
      v12 = (id *)v32;
    }
    else
    {
      v31 = v10;
      v30 = &unk_1A2AF8225;
      v12 = &v31;
    }
    NSAppendPrintF();
    v13 = *v12;

    v10 = v13;
  }
  scanRate = self->_scanRate;
  if (scanRate > 19)
  {
    if (scanRate > 39)
    {
      if (scanRate == 40)
      {
        v15 = "High";
        goto LABEL_31;
      }
      if (scanRate == 50)
      {
        v15 = "Aggressive";
        goto LABEL_31;
      }
    }
    else
    {
      if (scanRate == 20)
      {
        v15 = "Normal";
        goto LABEL_31;
      }
      if (scanRate == 30)
      {
        v15 = "HighNormal";
        goto LABEL_31;
      }
    }
LABEL_30:
    v15 = "?";
  }
  else
  {
    v15 = "Invalid";
    switch(scanRate)
    {
      case 0:
        break;
      case 1:
        v15 = "BackgroundOld";
        break;
      case 2:
        v15 = "NormalOld";
        break;
      case 3:
        v15 = "HighOld";
        break;
      case 4:
        v15 = "AggressiveOld";
        break;
      case 10:
        v15 = "Background";
        break;
      default:
        goto LABEL_30;
    }
  }
LABEL_31:
  overrideScreenOffRescanInterval = (int64_t)v15;
  NSAppendPrintF();
  v16 = v10;

  fastScanMode = self->_fastScanMode;
  if (fastScanMode)
  {
    v18 = "?";
    if (fastScanMode == 1)
      v18 = "Start";
    if (fastScanMode == 2)
      v19 = "Match";
    else
      v19 = v18;
    overrideScreenOffRescanInterval = (int64_t)v19;
    NSAppendPrintF();
    v20 = v16;

    v16 = v20;
  }
  if (self->_overrideScreenOff)
  {
    NSAppendPrintF();
    v21 = v16;

    if (self->_overrideScreenOff && self->_overrideScreenOffRescanInterval)
    {
      overrideScreenOffRescanInterval = self->_overrideScreenOffRescanInterval;
      NSAppendPrintF();
      v16 = v21;

    }
    else
    {
      v16 = v21;
    }
  }
  if (self->_rssiChangeDetection)
  {
    NSAppendPrintF();
    v22 = v16;

    v16 = v22;
  }
  if (self->_rssiThreshold)
  {
    overrideScreenOffRescanInterval = self->_rssiThreshold;
    NSAppendPrintF();
    v23 = v16;

    v16 = v23;
  }
  if (self->_scanCache)
  {
    NSAppendPrintF();
    v24 = v16;

    v16 = v24;
  }
  if (self->_trackPeers)
  {
    NSAppendPrintF();
    v25 = v16;

    v16 = v25;
  }
  if (self->_xpcCnx)
  {
    -[NSMutableDictionary count](self->_devices, "count", overrideScreenOffRescanInterval, v30);
    NSAppendPrintF();
    v26 = v16;

    v16 = v26;
  }
  return v16;
}

- (BOOL)rssiChangeDetection
{
  return self->_rssiChangeDetection;
}

- (void)deviceDiscoveryDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void (**deviceFoundHandler)(id, id);
  void (**deviceChangedHandler)(id, id, _QWORD);
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 9
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    v10 = v4;
    v11 = &unk_1A2AF8225;
    v9 = v12;
    LogPrintF();
  }
  objc_msgSend(v12, "identifier", v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v12, v6);
    if (self->_legacy)
    {
      deviceFoundHandler = (void (**)(id, id))self->_deviceFoundHandler;
      if (deviceFoundHandler)
        deviceFoundHandler[2](deviceFoundHandler, v12);
    }
    deviceChangedHandler = (void (**)(id, id, _QWORD))self->_deviceChangedHandler;
    if (deviceChangedHandler)
      deviceChangedHandler[2](deviceChangedHandler, v12, v4);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFDeviceDiscovery)init
{
  SFDeviceDiscovery *v2;
  SFDeviceDiscovery *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceDiscovery;
  v2 = -[SFDeviceDiscovery init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_changeFlags = 1;
    v2->_discoveryFlags = 1;
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_legacy = 1;
    *(_OWORD *)&v3->_rssiThreshold = xmmword_1A2AF8030;
  }
  return v3;
}

- (void)setChangeFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__SFDeviceDiscovery_setChangeFlags___block_invoke;
  v3[3] = &unk_1E4830D68;
  v3[4] = self;
  v4 = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __36__SFDeviceDiscovery_setChangeFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 72) = *(_DWORD *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 42) = 0;
  return result;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  SFDeviceDiscovery *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)setFastScanMode:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__SFDeviceDiscovery_setFastScanMode___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  v3[5] = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __37__SFDeviceDiscovery_setFastScanMode___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 128) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setOverrideScreenOffRescanInterval:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__SFDeviceDiscovery_setOverrideScreenOffRescanInterval___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  v3[5] = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __56__SFDeviceDiscovery_setOverrideScreenOffRescanInterval___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 152) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setRssiChangeDetection:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__SFDeviceDiscovery_setRssiChangeDetection___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __44__SFDeviceDiscovery_setRssiChangeDetection___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 65) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setRssiThreshold:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__SFDeviceDiscovery_setRssiThreshold___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  v3[5] = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __38__SFDeviceDiscovery_setRssiThreshold___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 168) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setScanCache:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__SFDeviceDiscovery_setScanCache___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __34__SFDeviceDiscovery_setScanCache___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 66) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setTimeout:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__SFDeviceDiscovery_setTimeout___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

double __32__SFDeviceDiscovery_setTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  double result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

  }
  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 192) = result;
  return result;
}

- (void)setTrackPeers:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__SFDeviceDiscovery_setTrackPeers___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __35__SFDeviceDiscovery_setTrackPeers___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 68) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setUseCases:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SFDeviceDiscovery_setUseCases___block_invoke;
  v6[3] = &unk_1E482D3A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SFDeviceDiscovery _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);

}

void __33__SFDeviceDiscovery_setUseCases___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  SFDeviceDiscovery *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SFDeviceDiscovery_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __44__SFDeviceDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  const char *v5;
  const char *v6;
  NSString *v7;
  NSString *purpose;
  NSObject *v9;
  NSXPCConnection *xpcCnx;
  uint64_t v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  void (**v22)(id, void *);
  _QWORD v23[4];
  void (**v24)(id, void *);
  os_activity_scope_state_s state;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 30
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    if (self->_targetUserSession)
      v5 = "(TargetUserSession)";
    else
      v5 = "";
    v20 = (uint64_t)v5;
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    if (gLogCategory_SFDeviceDiscovery <= 60
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      v20 = 4294960572;
      LogPrintF();
    }
    if (v4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("?");
      if (v15)
        v17 = (const __CFString *)v15;
      v27[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6724, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v19);

    }
  }
  else
  {
    if (!self->_purpose)
    {
      v6 = getprogname();
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        purpose = self->_purpose;
        self->_purpose = v7;

      }
    }
    self->_activateTicks = mach_absolute_time();
    if (-[SFDeviceDiscovery _ensureXPCStarted](self, "_ensureXPCStarted"))
    {
      if (gLogCategory_SFDeviceDiscovery <= 50
        && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (v4)
        v4[2](v4, 0);
    }
    else
    {
      v9 = _os_activity_create(&dword_1A2830000, "Sharing/SFDeviceDiscovery/deviceDiscoveryActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v9, &state);
      xpcCnx = self->_xpcCnx;
      v11 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __45__SFDeviceDiscovery__activateWithCompletion___block_invoke;
      v23[3] = &unk_1E482E490;
      v12 = v4;
      v24 = v12;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v11;
      v21[1] = 3221225472;
      v21[2] = __45__SFDeviceDiscovery__activateWithCompletion___block_invoke_2;
      v21[3] = &unk_1E482E490;
      v22 = v12;
      objc_msgSend(v13, "deviceDiscoveryActivate:completion:", self, v21);

      os_activity_scope_leave(&state);
    }
  }

}

uint64_t __45__SFDeviceDiscovery__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __45__SFDeviceDiscovery__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B55E0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__SFDeviceDiscovery__ensureXPCStarted__block_invoke;
    v10[3] = &unk_1E482DF78;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __38__SFDeviceDiscovery__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_1E482DF78;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBE68);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFDeviceDiscovery <= 30
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return 0;
}

uint64_t __38__SFDeviceDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __38__SFDeviceDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)fastScanTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SFDeviceDiscovery *v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFDeviceDiscovery/deviceDiscoveryFastScanTrigger", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SFDeviceDiscovery_fastScanTrigger___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __37__SFDeviceDiscovery_fastScanTrigger___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (gLogCategory_SFDeviceDiscovery <= 50
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "remoteObjectProxy", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceDiscoveryFastScanTrigger:", *(_QWORD *)(a1 + 32));

}

- (void)fastScanCancel:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SFDeviceDiscovery *v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFDeviceDiscovery/deviceDiscoveryFastScanCancel", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__SFDeviceDiscovery_fastScanCancel___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __36__SFDeviceDiscovery_fastScanCancel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (gLogCategory_SFDeviceDiscovery <= 50
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "remoteObjectProxy", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceDiscoveryFastScanCancel:", *(_QWORD *)(a1 + 32));

}

- (void)triggerEnhancedDiscovery:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SFDeviceDiscovery *v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFDeviceDiscovery/deviceDiscoveryTrigggerEnhancedDiscovery", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__SFDeviceDiscovery_triggerEnhancedDiscovery___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __46__SFDeviceDiscovery_triggerEnhancedDiscovery___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (gLogCategory_SFDeviceDiscovery <= 30
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "remoteObjectProxy", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceDiscoveryTriggerEnhancedDiscovery:", *(_QWORD *)(a1 + 32));

}

- (void)triggerEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SFDeviceDiscovery *v16;
  id v17;
  unsigned int v18;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_1A2830000, "Sharing/SFDeviceDiscovery/deviceDiscoveryTrigggerEnhancedDiscovery", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__SFDeviceDiscovery_triggerEnhancedDiscovery_useCase_completion___block_invoke;
  v14[3] = &unk_1E4831C00;
  v18 = a4;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

void __65__SFDeviceDiscovery_triggerEnhancedDiscovery_useCase_completion___block_invoke(uint64_t a1)
{
  int v2;
  const char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  if (gLogCategory_SFDeviceDiscovery <= 30
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    v2 = *(_DWORD *)(a1 + 56);
    if (v2 >= 0x20000)
    {
      if (v2 >= 327680)
      {
        if (v2 >= 589824)
        {
          if (v2 <= 2147418111)
          {
            switch(v2)
            {
              case 589824:
                v3 = "FindNearbyRemote";
                break;
              case 589825:
                v3 = "FindNearbyPencil";
                break;
              case 655360:
                v3 = "AccessDigitalHomeKey";
                break;
              default:
LABEL_118:
                v3 = "?";
                break;
            }
          }
          else
          {
            switch(v2)
            {
              case 2147418112:
                v3 = "InternalTestNoLockScan";
                break;
              case 2147418113:
                v3 = "InternalTestNoScreenOffScan";
                break;
              case 2147418114:
                v3 = "InternalTestScanWithNoDups";
                break;
              case 2147418115:
                v3 = "InternalTestScanWithDups";
                break;
              case 2147418116:
                v3 = "InternalTestScanFor20Seconds";
                break;
              case 2147418117:
                v3 = "InternalTestActiveScan";
                break;
              case 2147418118:
                v3 = "InternalTestUUIDScan";
                break;
              case 2147418119:
                v3 = "InternalTestScanFor10ClockSeconds";
                break;
              case 2147418120:
                v3 = "InternalTestScanBoost";
                break;
              default:
                goto LABEL_118;
            }
          }
        }
        else if (v2 > 458752)
        {
          switch(v2)
          {
            case 524288:
              v3 = "ADPD";
              break;
            case 524289:
              v3 = "ADPDBuffer";
              break;
            case 524290:
              v3 = "MicroLocation";
              break;
            case 524291:
              v3 = "MicroLocationLeech";
              break;
            default:
              if (v2 == 458753)
              {
                v3 = "PrecisionFindingFindee";
              }
              else
              {
                if (v2 != 458754)
                  goto LABEL_118;
                v3 = "PrecisionFindingFindeeHighPriority";
              }
              break;
          }
        }
        else
        {
          switch(v2)
          {
            case 393216:
              v3 = "CaptiveNetworkJoin";
              break;
            case 393217:
              v3 = "UseCaseSIMTransfer";
              break;
            case 393218:
              v3 = "MacSetup";
              break;
            case 393219:
              v3 = "AppleIDSignIn";
              break;
            case 393220:
              v3 = "AppleIDSignInSettings";
              break;
            default:
              if (v2 == 327680)
              {
                v3 = "RapportThirdParty";
              }
              else
              {
                if (v2 != 458752)
                  goto LABEL_118;
                v3 = "PrecisionFindingFinder";
              }
              break;
          }
        }
      }
      else
      {
        switch(v2)
        {
          case 131072:
            v3 = "SharingDefault";
            break;
          case 131073:
            v3 = "SharingPhoneAutoUnlock";
            break;
          case 131074:
            v3 = "SharingSiriWatchAuth";
            break;
          case 131075:
            v3 = "SharingMacAutoUnlock";
            break;
          case 131076:
            v3 = "SharingEDTScreenOn";
            break;
          case 131077:
            v3 = "SharingEDTWiFiDisabled";
            break;
          case 131078:
            v3 = "SharingEDTWombatEligibleAsDefaultCamera";
            break;
          case 131079:
            v3 = "SharingEDTWombatCameraPicker";
            break;
          case 131080:
            v3 = "SharingWombatBackground";
            break;
          case 131081:
            v3 = "SharingUniversalControl";
            break;
          case 131082:
            v3 = "SharingPeopleProximity";
            break;
          case 131083:
            v3 = "SharingEDTEnsembleOpenDisplayPrefs";
            break;
          case 131084:
            v3 = "SharingEDTNearbydMotionStopped";
            break;
          case 131085:
            v3 = "SharingDoubleBoostGenericScan";
            break;
          case 131086:
            v3 = "SharingEDTIncomingAdvertisement ";
            break;
          case 131087:
            v3 = "SharingEDTWombatStreamStart";
            break;
          case 131088:
            v3 = "SharingOYAutoUnlock";
            break;
          case 131089:
            goto LABEL_118;
          case 131090:
            v3 = "SharingAirDrop";
            break;
          case 131091:
            v3 = "SharingNearbyInvitationHost";
            break;
          case 131092:
            v3 = "SharingNearbyInvitationParticipant";
            break;
          case 131093:
            v3 = "SharingAirDropAskToAirDrop";
            break;
          case 131094:
            v3 = "SharingAirDropTempIdentity";
            break;
          case 131095:
            v3 = "SharingAirDropNeedsCLink";
            break;
          case 131096:
            v3 = "SharingRemoteWidgetUpdate";
            break;
          case 131097:
            v3 = "SharingCountryCodeUpdate";
            break;
          case 131098:
            v3 = "SharingMacPhoneAutoUnlock";
            break;
          case 131099:
            v3 = "SharingVisionProDiscovery";
            break;
          case 131100:
            v3 = "SharingVisionProStateChange";
            break;
          case 131101:
            v3 = "SharingContinuityScreen";
            break;
          case 131102:
            v3 = "SharingEDTRemoteDisplay";
            break;
          default:
            if (v2 == 196608)
            {
              v3 = "DigitalIDTSA";
            }
            else
            {
              if (v2 != 0x40000)
                goto LABEL_118;
              v3 = "DigitalCarKeyThirdParty";
            }
            break;
        }
      }
    }
    else
    {
      v3 = "Unspecified";
      switch(v2)
      {
        case 0:
          break;
        case 1:
          v3 = "HealthKit";
          break;
        case 2:
          v3 = "HomeKit";
          break;
        case 3:
          v3 = "FindMyObjectConnection";
          break;
        case 4:
          v3 = "FindMyObjectConnectionTransient";
          break;
        case 5:
          v3 = "MIDI";
          break;
        case 6:
          v3 = "Continuity";
          break;
        case 7:
          v3 = "InstantHotSpot";
          break;
        case 8:
          v3 = "NearBy";
          break;
        case 9:
          v3 = "Sharing";
          break;
        case 10:
          v3 = "HearingSupport";
          break;
        case 11:
          v3 = "Magnet";
          break;
        case 12:
          v3 = "HID";
          break;
        case 13:
          v3 = "LEA";
          break;
        case 14:
          v3 = "External";
          break;
        case 15:
          v3 = "ExternalMedical";
          break;
        case 16:
          v3 = "ExternalLock";
          break;
        case 17:
          v3 = "ExternalWatch";
          break;
        case 18:
          v3 = "SmartRouting";
          break;
        case 19:
          v3 = "DigitalID";
          break;
        case 20:
          v3 = "DigitalKey";
          break;
        case 21:
          v3 = "DigitalCarKey";
          break;
        case 22:
          v3 = "HeySiri";
          break;
        case 23:
          v3 = "ThirdPartyApp";
          break;
        case 24:
          v3 = "CNJ";
          break;
        default:
          switch(v2)
          {
            case 256:
              v3 = "DevicePresenceDetection";
              break;
            case 257:
              v3 = "AudioBox";
              break;
            case 258:
              v3 = "SIMTransfer";
              break;
            case 259:
              v3 = "ProximityScreenOnLeechScan";
              break;
            case 260:
              v3 = "MacMigrate";
              break;
            case 263:
              v3 = "HIDUARTService";
              break;
            case 264:
              v3 = "AccessibilitySwitchControlPairing";
              break;
            case 265:
              v3 = "BaseBandFastConnect";
              break;
            case 266:
              v3 = "SafetyAlerts";
              break;
            case 267:
              v3 = "LECarPlay";
              break;
            case 268:
              v3 = "TCCBluetooth";
              break;
            case 269:
              v3 = "AOPBufferLeech";
              break;
            default:
              goto LABEL_118;
          }
          break;
      }
    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v3;
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "remoteObjectProxy", v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned int *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SFDeviceDiscovery_triggerEnhancedDiscovery_useCase_completion___block_invoke_2;
  v9[3] = &unk_1E482EE00;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v4, "deviceDiscoveryTriggerEnhancedDiscovery:useCase:completion:", v10, v6, v9);

}

void __65__SFDeviceDiscovery_triggerEnhancedDiscovery_useCase_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_SFDeviceDiscovery <= 60)
    {
      if (gLogCategory_SFDeviceDiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)_interrupted
{
  void (**interruptionHandler)(void);
  NSMutableDictionary *devices;
  NSObject *v5;
  void *v6;
  os_activity_scope_state_s state;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 50
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0;

  if (self->_activateCalled)
  {
    if (-[SFDeviceDiscovery _ensureXPCStarted](self, "_ensureXPCStarted"))
    {
      if (gLogCategory_SFDeviceDiscovery <= 50
        && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFDeviceDiscovery/deviceDiscoveryActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v5, &state);
      if (gLogCategory_SFDeviceDiscovery <= 50
        && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deviceDiscoveryActivate:completion:", self, &__block_literal_global_41);

      os_activity_scope_leave(&state);
    }
  }
}

void __33__SFDeviceDiscovery__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFDeviceDiscovery <= 30
    && ((v5 = v2, gLogCategory_SFDeviceDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SFDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__SFDeviceDiscovery_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    *(_BYTE *)(v1 + 40) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 41)
      && gLogCategory_SFDeviceDiscovery <= 30
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    if (v3)
    {
      v4 = v3;
      dispatch_source_cancel(v4);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = 0;

    }
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    if (v7)
    {
      v8 = v7;
      dispatch_source_cancel(v8);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 48);
      *(_QWORD *)(v9 + 48) = 0;

    }
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    if (v11)
    {
      objc_msgSend(v11, "invalidate");
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 56);
      *(_QWORD *)(v12 + 56) = 0;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidated");
    }
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  OS_dispatch_source *consoleUserTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *timeoutTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  NSMutableDictionary *devices;
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  id interruptionHandler;
  id v15;
  id scanStateChangedHandler;
  id timeoutHandler;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFDeviceDiscovery <= 50
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    consoleUserTimer = self->_consoleUserTimer;
    if (consoleUserTimer)
    {
      v5 = consoleUserTimer;
      dispatch_source_cancel(v5);
      v6 = self->_consoleUserTimer;
      self->_consoleUserTimer = 0;

    }
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v8 = timeoutTimer;
      dispatch_source_cancel(v8);
      v9 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
    devices = self->_devices;
    self->_devices = 0;

    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    deviceChangedHandler = self->_deviceChangedHandler;
    self->_deviceChangedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v15 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    scanStateChangedHandler = self->_scanStateChangedHandler;
    self->_scanStateChangedHandler = 0;

    timeoutHandler = self->_timeoutHandler;
    self->_timeoutHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFDeviceDiscovery <= 30
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_retryConsole
{
  OS_dispatch_source *consoleUserTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  NSObject *v6;
  void *v7;
  os_activity_scope_state_s state;

  consoleUserTimer = self->_consoleUserTimer;
  if (consoleUserTimer)
  {
    v4 = consoleUserTimer;
    dispatch_source_cancel(v4);
    v5 = self->_consoleUserTimer;
    self->_consoleUserTimer = 0;

  }
  if (-[SFDeviceDiscovery _ensureXPCStarted](self, "_ensureXPCStarted"))
  {
    if (gLogCategory_SFDeviceDiscovery <= 50
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFDeviceDiscovery/deviceDiscoveryActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    if (gLogCategory_SFDeviceDiscovery <= 50
      && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deviceDiscoveryActivate:completion:", self, &__block_literal_global_250);

    os_activity_scope_leave(&state);
  }
}

void __34__SFDeviceDiscovery__retryConsole__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFDeviceDiscovery <= 30
    && ((v5 = v2, gLogCategory_SFDeviceDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

uint64_t __42__SFDeviceDiscovery__startTimeoutIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeoutTimerFired");
}

- (void)_timeoutTimerFired
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void (**timeoutHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceDiscovery <= 20
    && (gLogCategory_SFDeviceDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v4 = timeoutTimer;
    dispatch_source_cancel(v4);
    v5 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    timeoutHandler = (void (**)(void))self->_timeoutHandler;
  }
  self->_timeoutHandler = 0;

}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)scanState
{
  return self->_scanState;
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setScanRateOverride:(int64_t)a3
{
  self->_scanRateOverride = a3;
}

- (void)setScanStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

@end
