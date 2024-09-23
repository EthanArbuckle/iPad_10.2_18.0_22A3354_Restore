@implementation RPRemoteDisplayDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayDiscovery)init
{
  RPRemoteDisplayDiscovery *v2;
  RPRemoteDisplayDiscovery *v3;
  int DeviceClass;
  uint64_t v5;
  RPRemoteDisplayDiscovery *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RPRemoteDisplayDiscovery;
  v2 = -[RPRemoteDisplayDiscovery init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_controlFlags = 6;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    DeviceClass = GestaltGetDeviceClass();
    v5 = -60;
    if (DeviceClass == 4)
      v5 = -75;
    v3->_rssiThreshold = v5;
    v6 = v3;
  }

  return v3;
}

- (RPRemoteDisplayDiscovery)initWithCoder:(id)a3
{
  id v4;
  RPRemoteDisplayDiscovery *v5;
  RPRemoteDisplayDiscovery *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  RPRemoteDisplayDiscovery *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RPRemoteDisplayDiscovery;
  v5 = -[RPRemoteDisplayDiscovery init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v7 = v4;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("cFl")))
      v6->_controlFlags = objc_msgSend(v7, "decodeInt64ForKey:", CFSTR("cFl"));

    v8 = v7;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("dFl")))
      v6->_discoveryFlags = objc_msgSend(v8, "decodeInt64ForKey:", CFSTR("dFl"));

    v9 = v8;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("eDis")))
      v6->_triggerEnhancedDiscovery = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("eDis"));

    v10 = v9;
    if (objc_msgSend(v10, "containsValueForKey:", CFSTR("rssiTh")))
      v6->_rssiThreshold = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("rssiTh"));

    v11 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t controlFlags;
  unint64_t discoveryFlags;
  int64_t rssiThreshold;
  id v8;

  v4 = a3;
  controlFlags = self->_controlFlags;
  v8 = v4;
  if (controlFlags)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", controlFlags, CFSTR("cFl"));
    v4 = v8;
  }
  discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags)
  {
    objc_msgSend(v8, "encodeInt64:forKey:", discoveryFlags, CFSTR("dFl"));
    v4 = v8;
  }
  if (self->_triggerEnhancedDiscovery)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("eDis"));
    v4 = v8;
  }
  rssiThreshold = self->_rssiThreshold;
  if (rssiThreshold)
  {
    objc_msgSend(v8, "encodeInteger:forKey:", rssiThreshold, CFSTR("rssiTh"));
    v4 = v8;
  }

}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t discoveryFlags;
  uint64_t v12;
  void *v13;
  void *v14;

  discoveryFlags = (unint64_t)self;
  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  if (self->_discoveryFlags)
  {
    v14 = v3;
    discoveryFlags = self->_discoveryFlags;
    v13 = &unk_1AF307BF5;
    NSAppendPrintF();
    v5 = v14;

    v4 = v5;
  }
  if (self->_controlFlags)
  {
    discoveryFlags = self->_controlFlags;
    v13 = &unk_1AF307C14;
    NSAppendPrintF();
    v6 = v4;

    v4 = v6;
  }
  if (-[NSMutableDictionary count](self->_discoveredDevices, "count", discoveryFlags, v13))
  {
    v12 = -[NSMutableDictionary count](self->_discoveredDevices, "count");
    NSAppendPrintF();
    v7 = v4;

    v4 = v7;
  }
  if (-[NSMutableDictionary count](self->_discoveredPeople, "count", v12))
  {
    -[NSMutableDictionary count](self->_discoveredPeople, "count");
    NSAppendPrintF();
    v8 = v4;

    v4 = v8;
  }
  if (self->_rssiThreshold)
  {
    NSAppendPrintF();
    v9 = v4;

    v4 = v9;
  }
  return v4;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RPRemoteDisplayDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __51__RPRemoteDisplayDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  int DeviceClass;
  uint64_t v3;
  BOOL v4;
  char v5;

  DeviceClass = GestaltGetDeviceClass();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 64))
    v4 = DeviceClass == 100;
  else
    v4 = 0;
  v5 = v4;
  *(_BYTE *)(v3 + 50) = v5;
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSXPCConnection *xpcCnx;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPRemoteDisplayDiscovery <= 30
         && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPRemoteDisplayDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  v7 = MEMORY[0x1E0C809B0];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_1E5F4EED8;
  v17 = v4;
  v9 = v6;
  v16 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_1E5F50AF0;
  v14 = v4;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "remoteDisplayActivateDiscovery:completion:", self, v12);

}

void __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = v7;
    if (v5)
      goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

void __63__RPRemoteDisplayDiscovery__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  id v13;

  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = a2;
  v13 = v5;
  if (a2 && *(_BYTE *)(a1 + 48))
  {
    v6 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), v5);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t))(v6 + 16))(v6);

    v5 = v13;
  }
  if (v5)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
      {
        if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (v9 = _LogCategory_Initialize(), v5 = v13, v9))
        {
LABEL_20:
          LogPrintF();
          v5 = v13;
        }
      }
    }
    else if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1)
        goto LABEL_20;
      v11 = _LogCategory_Initialize();
      v5 = v13;
      if (v11)
        goto LABEL_20;
    }
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1)
        goto LABEL_20;
      v10 = _LogCategory_Initialize();
      v5 = v13;
      if (v10)
        goto LABEL_20;
    }
  }
  else if (gLogCategory_RPRemoteDisplayDiscovery <= 30)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery != -1)
      goto LABEL_20;
    v12 = _LogCategory_Initialize();
    v5 = v13;
    if (v12)
      goto LABEL_20;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v13);
    v5 = v13;
  }

}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.RemoteDisplay"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE452B0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5F4EC60;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AD58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPRemoteDisplayDiscovery <= 10
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __45__RPRemoteDisplayDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPRemoteDisplayDiscovery <= 50
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[RPRemoteDisplayDiscovery _lostAllDevices](self, "_lostAllDevices");
  -[RPRemoteDisplayDiscovery _lostAllPeople](self, "_lostAllPeople");
  if (self->_activateCalled)
    -[RPRemoteDisplayDiscovery _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__RPRemoteDisplayDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__RPRemoteDisplayDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    v2 = result;
    *(_BYTE *)(v1 + 32) = 1;
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 40), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id dedicatedDeviceChangedHandler;
  RPRemoteDisplayDevice *dedicatedDevice;
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  id discoverySessionStateChangedHandler;
  NSMutableDictionary *discoveredDevices;
  NSMutableDictionary *discoveredPeople;
  id errorFlagsChangedHandler;
  id interruptionHandler;
  id v14;
  id personDeclinedHandler;
  id personFoundHandler;
  id personLostHandler;
  id personChangedHandler;
  RPRemoteDisplayPerson *personSelected;
  NSString *peerDeviceIdentifier;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    dedicatedDeviceChangedHandler = self->_dedicatedDeviceChangedHandler;
    self->_dedicatedDeviceChangedHandler = 0;

    dedicatedDevice = self->_dedicatedDevice;
    self->_dedicatedDevice = 0;

    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    deviceChangedHandler = self->_deviceChangedHandler;
    self->_deviceChangedHandler = 0;

    discoverySessionStateChangedHandler = self->_discoverySessionStateChangedHandler;
    self->_discoverySessionStateChangedHandler = 0;

    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0;

    discoveredPeople = self->_discoveredPeople;
    self->_discoveredPeople = 0;

    errorFlagsChangedHandler = self->_errorFlagsChangedHandler;
    self->_errorFlagsChangedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v14 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    personDeclinedHandler = self->_personDeclinedHandler;
    self->_personDeclinedHandler = 0;

    personFoundHandler = self->_personFoundHandler;
    self->_personFoundHandler = 0;

    personLostHandler = self->_personLostHandler;
    self->_personLostHandler = 0;

    personChangedHandler = self->_personChangedHandler;
    self->_personChangedHandler = 0;

    personSelected = self->_personSelected;
    self->_personSelected = 0;

    peerDeviceIdentifier = self->_peerDeviceIdentifier;
    self->_peerDeviceIdentifier = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteDisplayDiscovery <= 30
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)personCanceled:(id)a3
{
  id v4;
  NSXPCConnection *xpcCnx;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (v4)
  {
    -[RPRemoteDisplayDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
    xpcCnx = self->_xpcCnx;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__RPRemoteDisplayDiscovery_personCanceled___block_invoke;
    v8[3] = &unk_1E5F4ECD0;
    v6 = v4;
    v9 = v6;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteDisplayPersonCanceled:", v6);

  }
}

void __43__RPRemoteDisplayDiscovery_personCanceled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  id v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
  {
    v5 = v2;
    if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v5, v4))
    {
      LogPrintF();
      v3 = v5;
    }
  }

}

- (BOOL)_checkRSSIThresholdForDevice:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  objc_msgSend(a3, "bleDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bleDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rssi");

  return !v6 || v6 >= self->_rssiThreshold;
}

- (NSArray)discoveredDevices
{
  RPRemoteDisplayDiscovery *v2;
  NSMutableDictionary *discoveredDevices;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  discoveredDevices = v2->_discoveredDevices;
  if (discoveredDevices)
  {
    -[NSMutableDictionary allValues](discoveredDevices, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (NSArray)discoveredPeople
{
  RPRemoteDisplayDiscovery *v2;
  NSMutableDictionary *discoveredPeople;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  discoveredPeople = v2->_discoveredPeople;
  if (discoveredPeople)
  {
    -[NSMutableDictionary allValues](discoveredPeople, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setPersonSelected:(id)a3
{
  -[RPRemoteDisplayDiscovery setPersonSelected:forDedicatedPairing:](self, "setPersonSelected:forDedicatedPairing:", a3, 0);
}

- (void)setPersonSelected:(id)a3 forDedicatedPairing:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  RPRemoteDisplayDiscovery *v8;
  NSXPCConnection *xpcCnx;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  RPRemoteDisplayDiscovery *v17;

  v4 = a4;
  v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  objc_storeStrong((id *)&v8->_personSelected, a3);
  objc_sync_exit(v8);

  if (v7)
  {
    -[RPRemoteDisplayDiscovery _ensureXPCStarted](v8, "_ensureXPCStarted");
    xpcCnx = v8->_xpcCnx;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __66__RPRemoteDisplayDiscovery_setPersonSelected_forDedicatedPairing___block_invoke;
    v15 = &unk_1E5F4EC88;
    v10 = v7;
    v16 = v10;
    v17 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", &v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteDisplayPersonSelected:forDedicatedPairing:", v10, v4, v12, v13, v14, v15);

  }
}

void __66__RPRemoteDisplayDiscovery_setPersonSelected_forDedicatedPairing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = *(id *)(a1 + 40);
  objc_sync_enter(v3);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v4 + 176);
  *(_QWORD *)(v4 + 176) = 0;

  objc_sync_exit(v3);
}

- (void)remoteDisplayFoundDevice:(id)a3
{
  RPRemoteDisplayDiscovery *v4;
  NSMutableDictionary *discoveredDevices;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  NSMutableDictionary *discoveredPeople;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id personFoundHandler;
  uint64_t v17;
  void *v18;
  void (**deviceFoundHandler)(id, id);
  id v20;

  v20 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  discoveredDevices = v4->_discoveredDevices;
  if (!discoveredDevices)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v4->_discoveredDevices;
    v4->_discoveredDevices = v6;

    discoveredDevices = v4->_discoveredDevices;
  }
  objc_msgSend(v20, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v20, v8);

  objc_msgSend(v20, "accountAltDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_14;
  -[NSMutableDictionary valueForKey:](v4->_discoveredPeople, "valueForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "addDevice:", v20);
    v12 = 0;
    goto LABEL_15;
  }
  v11 = -[RPRemoteDisplayPerson initPersonWithDevice:]([RPRemoteDisplayPerson alloc], "initPersonWithDevice:", v20);
  if (!v11)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90
      && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_14:
    v12 = 0;
    v11 = 0;
    goto LABEL_15;
  }
  discoveredPeople = v4->_discoveredPeople;
  if (!discoveredPeople)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = v4->_discoveredPeople;
    v4->_discoveredPeople = v14;

    discoveredPeople = v4->_discoveredPeople;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", v11, v9);
  v12 = 1;
LABEL_15:

  objc_sync_exit(v4);
  if (v11)
  {
    if ((v12 & 1) != 0)
      personFoundHandler = v4->_personFoundHandler;
    else
      personFoundHandler = v4->_personChangedHandler;
    v17 = MEMORY[0x1AF45BE48](personFoundHandler);
    v18 = (void *)v17;
    if (v17)
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v11);

  }
  deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
  if (deviceFoundHandler)
    deviceFoundHandler[2](deviceFoundHandler, v20);

}

- (void)remoteDisplayLostDevice:(id)a3
{
  RPRemoteDisplayDiscovery *v4;
  NSMutableDictionary *discoveredDevices;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id personLostHandler;
  uint64_t v14;
  void *v15;
  void (**deviceLostHandler)(id, id);
  id v17;

  v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  discoveredDevices = v4->_discoveredDevices;
  objc_msgSend(v17, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", 0, v6);

  objc_msgSend(v17, "accountAltDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary valueForKey:](v4->_discoveredPeople, "valueForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8
      && (objc_msgSend(v8, "removeDevice:", v17),
          objc_msgSend(v9, "discoveredDevices"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          !v11))
    {
      -[NSMutableDictionary removeObjectForKey:](v4->_discoveredPeople, "removeObjectForKey:", v7);
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
    v9 = 0;
  }

  objc_sync_exit(v4);
  if (v9)
  {
    if ((v12 & 1) != 0)
      personLostHandler = v4->_personLostHandler;
    else
      personLostHandler = v4->_personChangedHandler;
    v14 = MEMORY[0x1AF45BE48](personLostHandler);
    v15 = (void *)v14;
    if (v14)
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v9);

  }
  deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
  if (deviceLostHandler)
    deviceLostHandler[2](deviceLostHandler, v17);

}

- (void)remoteDisplayChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  RPRemoteDisplayDiscovery *v6;
  NSMutableDictionary *discoveredDevices;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**personChangedHandler)(id, void *);
  void (**deviceChangedHandler)(id, id, _QWORD);
  id v17;

  v4 = *(_QWORD *)&a4;
  v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = self;
  objc_sync_enter(v6);
  discoveredDevices = v6->_discoveredDevices;
  objc_msgSend(v17, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](discoveredDevices, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v6->_discoveredDevices;
    objc_msgSend(v17, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, v11);

    objc_msgSend(v17, "accountAltDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NSMutableDictionary valueForKey:](v6->_discoveredPeople, "valueForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "removeDevice:", v17);
        objc_msgSend(v14, "addDevice:", v17);
      }
    }
    else
    {
      v14 = 0;
    }

    objc_sync_exit(v6);
    if (v14)
    {
      personChangedHandler = (void (**)(id, void *))v6->_personChangedHandler;
      if (personChangedHandler)
        personChangedHandler[2](personChangedHandler, v14);
    }
    deviceChangedHandler = (void (**)(id, id, _QWORD))v6->_deviceChangedHandler;
    if (deviceChangedHandler)
      deviceChangedHandler[2](deviceChangedHandler, v17, v4);
  }
  else
  {
    -[RPRemoteDisplayDiscovery remoteDisplayFoundDevice:](v6, "remoteDisplayFoundDevice:", v17);
    objc_sync_exit(v6);

    v14 = 0;
  }

}

- (void)remoteDisplayUpdateErrorFlags:(unint64_t)a3
{
  void (**v5)(void);
  void (**v6)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_errorFlags != a3)
  {
    self->_errorFlags = a3;
    v5 = (void (**)(void))MEMORY[0x1AF45BE48](self->_errorFlagsChangedHandler);
    if (v5)
    {
      v6 = v5;
      v5[2]();
      v5 = v6;
    }

  }
}

- (void)remoteDisplayDeviceSelected:(id)a3
{
  RPRemoteDisplayPerson *v4;
  RPRemoteDisplayPerson *personSelected;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    v4 = -[RPRemoteDisplayPerson initPersonWithDevice:]([RPRemoteDisplayPerson alloc], "initPersonWithDevice:", v8);
    personSelected = self->_personSelected;
    self->_personSelected = v4;
  }
  else
  {
    personSelected = self->_personSelected;
    self->_personSelected = 0;
  }

  v6 = MEMORY[0x1AF45BE48](self->_deviceSelectedHandler);
  v7 = (void *)v6;
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);

}

- (void)remoteDisplayNotifyDiscoverySessionState:(unsigned __int8)a3 forDevice:(id)a4 startReason:(unsigned __int8)a5
{
  uint64_t v7;
  void (**discoverySessionStateChangedHandler)(id, _QWORD, id);
  id v10;

  v7 = a3;
  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_currentState = v7;
  objc_storeStrong((id *)&self->_peerDeviceIdentifier, a4);
  self->_discoverySessionStartReason = a5;
  discoverySessionStateChangedHandler = (void (**)(id, _QWORD, id))self->_discoverySessionStateChangedHandler;
  if (discoverySessionStateChangedHandler)
    discoverySessionStateChangedHandler[2](discoverySessionStateChangedHandler, v7, v10);

}

- (void)remoteDisplayPersonDeclined
{
  void (**v3)(void);
  void (**v4)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void (**)(void))MEMORY[0x1AF45BE48](self->_personDeclinedHandler);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)_lostAllDevices
{
  id deviceLostHandler;
  NSMutableDictionary *discoveredDevices;
  void *v5;
  NSMutableDictionary *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void (**v11)(id, _QWORD);
  NSMutableDictionary *v12;
  RPRemoteDisplayDiscovery *obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_RPRemoteDisplayDiscovery <= 30
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceLostHandler = self->_deviceLostHandler;
  obj = self;
  objc_sync_enter(obj);
  discoveredDevices = obj->_discoveredDevices;
  if (deviceLostHandler)
  {
    -[NSMutableDictionary allValues](discoveredDevices, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeAllObjects](obj->_discoveredDevices, "removeAllObjects");
    v6 = obj->_discoveredDevices;
    obj->_discoveredDevices = 0;

    objc_sync_exit(obj);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          v11 = (void (**)(id, _QWORD))self->_deviceLostHandler;
          if (v11)
            v11[2](v11, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](discoveredDevices, "removeAllObjects");
    v12 = obj->_discoveredDevices;
    obj->_discoveredDevices = 0;

    objc_sync_exit(obj);
  }
}

- (void)_lostAllPeople
{
  void *v3;
  RPRemoteDisplayDiscovery *v4;
  NSMutableDictionary *discoveredPeople;
  RPRemoteDisplayPerson *personSelected;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_RPRemoteDisplayDiscovery <= 30
    && (gLogCategory_RPRemoteDisplayDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[RPRemoteDisplayDiscovery discoveredPeople](self, "discoveredPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeAllObjects](v4->_discoveredPeople, "removeAllObjects");
  discoveredPeople = v4->_discoveredPeople;
  v4->_discoveredPeople = 0;

  personSelected = v4->_personSelected;
  v4->_personSelected = 0;

  objc_sync_exit(v4);
  if (v4->_personLostHandler)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v7);
          (*((void (**)(id))v4->_personLostHandler + 2))(v4->_personLostHandler);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)shouldReportDevice:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = ((objc_msgSend(v4, "statusFlags") & 0x80000) != 0
     || (objc_msgSend(v4, "statusFlags") & 0x2000000000) != 0 && (self->_discoveryFlags & 1) != 0
     || (objc_msgSend(v4, "statusFlags") & 0x1000000000) != 0 && (self->_discoveryFlags & 2) != 0)
    && -[RPRemoteDisplayDiscovery _checkRSSIThresholdForDevice:](self, "_checkRSSIThresholdForDevice:", v4);

  return v5;
}

- (void)enterDiscoverySessionWithDevice:(id)a3 reason:(id)a4
{
  NSXPCConnection *xpcCnx;
  id v6;
  id v7;
  id v8;

  xpcCnx = self->_xpcCnx;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_12);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteDisplayChangeDiscoverySessionStateForDevice:reason:", v7, v6);

}

void __67__RPRemoteDisplayDiscovery_enterDiscoverySessionWithDevice_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && ((v5 = v2, gLogCategory_RPRemoteDisplayDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)exitDiscoverySessionWithReason:(id)a3
{
  NSXPCConnection *xpcCnx;
  id v4;
  id v5;

  xpcCnx = self->_xpcCnx;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_117);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteDisplayChangeDiscoverySessionStateForDevice:reason:", 0, v4);

}

void __59__RPRemoteDisplayDiscovery_exitDiscoverySessionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && ((v5 = v2, gLogCategory_RPRemoteDisplayDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)saveDedicatedDevice:(id)a3
{
  NSXPCConnection *xpcCnx;
  id v4;
  id v5;

  xpcCnx = self->_xpcCnx;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_119);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteDisplayChangeDedicatedDevice:", v4);

}

void __48__RPRemoteDisplayDiscovery_saveDedicatedDevice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && ((v5 = v2, gLogCategory_RPRemoteDisplayDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)remoteDisplayDedicatedDeviceChanged:(id)a3
{
  RPRemoteDisplayDiscovery *v5;
  BOOL v6;
  void (**dedicatedDeviceChangedHandler)(id, RPRemoteDisplayDevice *);
  RPRemoteDisplayDevice *v8;

  v8 = (RPRemoteDisplayDevice *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_dedicatedDevice == v8)
  {
    objc_storeStrong((id *)&v5->_dedicatedDevice, a3);
    objc_sync_exit(v5);

  }
  else
  {
    v6 = -[RPRemoteDisplayDevice isEqualToDevice:](v8, "isEqualToDevice:");
    objc_storeStrong((id *)&v5->_dedicatedDevice, a3);
    objc_sync_exit(v5);

    if (!v6)
    {
      dedicatedDeviceChangedHandler = (void (**)(id, RPRemoteDisplayDevice *))v5->_dedicatedDeviceChangedHandler;
      if (dedicatedDeviceChangedHandler)
        dedicatedDeviceChangedHandler[2](dedicatedDeviceChangedHandler, v8);
    }
  }

}

- (void)requestDedicatedDeviceConfirmationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[RPRemoteDisplayDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_xpcCnx, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_121);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke_2;
  v7[3] = &unk_1E5F4ED20;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteDisplayDedicatedDeviceConfirmationWithCompletion:", v7);

}

void __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_RPRemoteDisplayDiscovery <= 90
    && ((v5 = v2, gLogCategory_RPRemoteDisplayDiscovery != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

void __77__RPRemoteDisplayDiscovery_requestDedicatedDeviceConfirmationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_RPRemoteDisplayDiscovery <= 90)
    {
      if (gLogCategory_RPRemoteDisplayDiscovery != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)deviceSelectedHandler
{
  return self->_deviceSelectedHandler;
}

- (void)setDeviceSelectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

- (void)setErrorFlags:(unint64_t)a3
{
  self->_errorFlags = a3;
}

- (id)errorFlagsChangedHandler
{
  return self->_errorFlagsChangedHandler;
}

- (void)setErrorFlagsChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)personChangedHandler
{
  return self->_personChangedHandler;
}

- (void)setPersonChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)personDeclinedHandler
{
  return self->_personDeclinedHandler;
}

- (void)setPersonDeclinedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)personFoundHandler
{
  return self->_personFoundHandler;
}

- (void)setPersonFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)personLostHandler
{
  return self->_personLostHandler;
}

- (void)setPersonLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (RPRemoteDisplayPerson)personSelected
{
  return self->_personSelected;
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int64_t)a3
{
  self->_rssiThreshold = a3;
}

- (unsigned)currentState
{
  return self->_currentState;
}

- (NSString)peerDeviceIdentifier
{
  return self->_peerDeviceIdentifier;
}

- (RPRemoteDisplayDevice)dedicatedDevice
{
  return self->_dedicatedDevice;
}

- (id)dedicatedDeviceChangedHandler
{
  return self->_dedicatedDeviceChangedHandler;
}

- (void)setDedicatedDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (unsigned)discoverySessionStartReason
{
  return self->_discoverySessionStartReason;
}

- (id)discoverySessionStateChangedHandler
{
  return self->_discoverySessionStateChangedHandler;
}

- (void)setDiscoverySessionStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BOOL)triggerEnhancedDiscovery
{
  return self->_triggerEnhancedDiscovery;
}

- (void)setTriggerEnhancedDiscovery:(BOOL)a3
{
  self->_triggerEnhancedDiscovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoverySessionStateChangedHandler, 0);
  objc_storeStrong(&self->_dedicatedDeviceChangedHandler, 0);
  objc_storeStrong((id *)&self->_dedicatedDevice, 0);
  objc_storeStrong((id *)&self->_peerDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_personSelected, 0);
  objc_storeStrong(&self->_personLostHandler, 0);
  objc_storeStrong(&self->_personFoundHandler, 0);
  objc_storeStrong(&self->_personDeclinedHandler, 0);
  objc_storeStrong(&self->_personChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorFlagsChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceSelectedHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_discoveredPeople, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
}

@end
