@implementation SFApproveDiscovery

- (SFApproveDiscovery)init
{
  SFApproveDiscovery *v2;
  uint64_t v3;
  NSMutableDictionary *deviceDictionary;
  SFApproveDiscovery *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFApproveDiscovery;
  v2 = -[SFApproveDiscovery init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    deviceDictionary = v2->_deviceDictionary;
    v2->_deviceDictionary = (NSMutableDictionary *)v3;

    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v5 = v2;
  }

  return v2;
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
  v7[2] = __45__SFApproveDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __45__SFApproveDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  if (gLogCategory_SFApproveDiscovery <= 50
    && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  void *v6;
  id activateHandler;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v6 = _Block_copy(v5);

  activateHandler = self->_activateHandler;
  self->_activateHandler = v6;

  -[SFApproveDiscovery _discoveryEnsureStarted](self, "_discoveryEnsureStarted");
}

- (void)_activatedWithError:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  (*((void (**)(void))self->_activateHandler + 2))();

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SFApproveDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__SFApproveDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_SFApproveDiscovery <= 50
      && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(v2 + 32), "_discoveryEnsureStopped");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      v4 = self->_invalidationHandler;
    }
    else
    {
      v4 = 0;
    }
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFApproveDiscovery <= 50
      && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (NSArray)devices
{
  SFApproveDiscovery *v2;
  NSArray *devices;
  NSArray *v4;

  v2 = self;
  objc_sync_enter(v2);
  devices = v2->_devices;
  if (!devices)
    devices = (NSArray *)MEMORY[0x1E0C9AA60];
  v4 = devices;
  objc_sync_exit(v2);

  return v4;
}

- (void)_discoveryEnsureStarted
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *deviceDiscovery;
  uint64_t v5;
  SFDeviceDiscovery *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_deviceDiscovery)
  {
    v3 = (SFDeviceDiscovery *)objc_opt_new();
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_deviceDiscovery, "setChangeFlags:", 1);
    -[SFDeviceDiscovery setDispatchQueue:](self->_deviceDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_deviceDiscovery, "setDiscoveryFlags:", 16777217);
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke;
    v11[3] = &unk_1E482F938;
    v11[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_deviceDiscovery, "setDeviceFoundHandler:", v11);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_2;
    v10[3] = &unk_1E482F938;
    v10[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_deviceDiscovery, "setDeviceLostHandler:", v10);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_3;
    v9[3] = &unk_1E482F960;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_deviceDiscovery, "setDeviceChangedHandler:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_4;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[SFDeviceDiscovery setInvalidationHandler:](self->_deviceDiscovery, "setInvalidationHandler:", v8);
    v6 = self->_deviceDiscovery;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_5;
    v7[3] = &unk_1E482DFF0;
    v7[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoveryFoundDevice:", a2);
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoveryLostDevice:", a2);
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoveryDeviceChanged:", a2);
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_SFApproveDiscovery <= 90
    && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __45__SFApproveDiscovery__discoveryEnsureStarted__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activatedWithError:", a2);
}

- (void)_discoveryEnsureStopped
{
  SFDeviceDiscovery *deviceDiscovery;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SFDeviceDiscovery setInvalidationHandler:](self->_deviceDiscovery, "setInvalidationHandler:", 0);
  -[SFDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;

}

- (void)_discoveryFoundDevice:(id)a3
{
  void *v4;
  void *v5;
  SFApproveDiscovery *v6;
  uint64_t v7;
  NSArray *devices;
  void (**deviceFoundHandler)(id, id);
  id v10;
  id v11;

  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDictionary, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (gLogCategory_SFApproveDiscovery <= 60
        && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
      {
LABEL_15:
        LogPrintF();
      }
    }
    else if ((objc_msgSend(v11, "autoUnlockEnabled") & 1) != 0)
    {
      if (gLogCategory_SFApproveDiscovery <= 50
        && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
      {
        v10 = v11;
        LogPrintF();
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceDictionary, "setObject:forKeyedSubscript:", v11, v4, v10);
      v6 = self;
      objc_sync_enter(v6);
      -[NSMutableDictionary allValues](self->_deviceDictionary, "allValues");
      v7 = objc_claimAutoreleasedReturnValue();
      devices = v6->_devices;
      v6->_devices = (NSArray *)v7;

      objc_sync_exit(v6);
      deviceFoundHandler = (void (**)(id, id))v6->_deviceFoundHandler;
      if (deviceFoundHandler)
        deviceFoundHandler[2](deviceFoundHandler, v11);
    }
    else if (gLogCategory_SFApproveDiscovery <= 50
           && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }
  else if (gLogCategory_SFApproveDiscovery <= 90
         && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_15;
  }

}

- (void)_discoveryDeviceChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  SFApproveDiscovery *v9;
  uint64_t v10;
  NSArray *v11;
  void (**deviceFoundHandler)(id, id);
  SFApproveDiscovery *v13;
  uint64_t v14;
  NSArray *devices;
  id v16;
  id v17;

  v17 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v17, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (gLogCategory_SFApproveDiscovery <= 90
      && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_21;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else if (objc_msgSend(v17, "autoUnlockEnabled"))
  {
    if (gLogCategory_SFApproveDiscovery <= 50
      && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
    {
      v16 = v17;
      LogPrintF();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceDictionary, "setObject:forKeyedSubscript:", v17, v4, v16);
    v13 = self;
    objc_sync_enter(v13);
    -[NSMutableDictionary allValues](self->_deviceDictionary, "allValues");
    v14 = objc_claimAutoreleasedReturnValue();
    devices = v13->_devices;
    v13->_devices = (NSArray *)v14;

    objc_sync_exit(v13);
    deviceFoundHandler = (void (**)(id, id))v13->_deviceFoundHandler;
    if (deviceFoundHandler)
      goto LABEL_20;
    goto LABEL_21;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDictionary, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v17, "autoUnlockEnabled");

    if ((v8 & 1) == 0)
    {
      if (gLogCategory_SFApproveDiscovery <= 50
        && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
      {
        v16 = v17;
        LogPrintF();
      }
      -[NSMutableDictionary removeObjectForKey:](self->_deviceDictionary, "removeObjectForKey:", v4, v16);
      v9 = self;
      objc_sync_enter(v9);
      -[NSMutableDictionary allValues](self->_deviceDictionary, "allValues");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v9->_devices;
      v9->_devices = (NSArray *)v10;

      objc_sync_exit(v9);
      deviceFoundHandler = (void (**)(id, id))v9->_deviceLostHandler;
      if (deviceFoundHandler)
LABEL_20:
        deviceFoundHandler[2](deviceFoundHandler, v17);
    }
  }
LABEL_21:

}

- (void)_discoveryLostDevice:(id)a3
{
  void *v4;
  void *v5;
  SFApproveDiscovery *v6;
  uint64_t v7;
  NSArray *devices;
  void (**deviceLostHandler)(id, id);
  id v10;
  id v11;

  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (gLogCategory_SFApproveDiscovery > 90
      || gLogCategory_SFApproveDiscovery == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
LABEL_11:
    LogPrintF();
    goto LABEL_18;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (gLogCategory_SFApproveDiscovery > 50
      || gLogCategory_SFApproveDiscovery == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  if (gLogCategory_SFApproveDiscovery <= 50
    && (gLogCategory_SFApproveDiscovery != -1 || _LogCategory_Initialize()))
  {
    v10 = v11;
    LogPrintF();
  }
  -[NSMutableDictionary removeObjectForKey:](self->_deviceDictionary, "removeObjectForKey:", v4, v10);
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary allValues](self->_deviceDictionary, "allValues");
  v7 = objc_claimAutoreleasedReturnValue();
  devices = v6->_devices;
  v6->_devices = (NSArray *)v7;

  objc_sync_exit(v6);
  deviceLostHandler = (void (**)(id, id))v6->_deviceLostHandler;
  if (deviceLostHandler)
    deviceLostHandler[2](deviceLostHandler, v11);
LABEL_18:

}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
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

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong(&self->_activateHandler, 0);
}

@end
