@implementation RPLegacyDeviceDiscovery

- (RPLegacyDeviceDiscovery)init
{
  RPLegacyDeviceDiscovery *v2;
  RPLegacyDeviceDiscovery *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPLegacyDeviceDiscovery;
  v2 = -[RPLegacyDeviceDiscovery init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_wifiScanFlags = 3;
  }
  return v3;
}

- (void)dealloc
{
  RPLegacyDeviceDiscovery *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (RPLegacyDeviceDiscovery *)FatalErrorF();
    -[RPLegacyDeviceDiscovery _cleanup](v3, v4);
  }
  else
  {
    -[RPLegacyDeviceDiscovery _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)RPLegacyDeviceDiscovery;
    -[RPLegacyDeviceDiscovery dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  id interruptionHandler;
  id invalidationHandler;
  id scanStateChangedHandler;
  id timeoutHandler;

  deviceFoundHandler = self->_deviceFoundHandler;
  self->_deviceFoundHandler = 0;

  deviceLostHandler = self->_deviceLostHandler;
  self->_deviceLostHandler = 0;

  deviceChangedHandler = self->_deviceChangedHandler;
  self->_deviceChangedHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  scanStateChangedHandler = self->_scanStateChangedHandler;
  self->_scanStateChangedHandler = 0;

  timeoutHandler = self->_timeoutHandler;
  self->_timeoutHandler = 0;

}

- (id)description
{
  NSAppendPrintF();
  return 0;
}

- (void)setBLEPayloadFilterData:(id)a3 mask:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    v15 = v6;
    v16 = v7;
    LogPrintF();
  }
  v8 = objc_msgSend(v6, "length", v15, v16);
  if (v8 == objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_msgSend(v6, "copy");
    v10 = (void *)objc_msgSend(v7, "copy");
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke;
    block[3] = &unk_1E5F4FB10;
    block[4] = self;
    v18 = v9;
    v19 = v10;
    v12 = v10;
    v13 = v9;
    dispatch_async(dispatchQueue, block);

  }
  else
  {
    objc_msgSend(v6, "length");
    objc_msgSend(v7, "length");
    v14 = FatalErrorF();
    __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke(v14);
  }
}

void __56__RPLegacyDeviceDiscovery_setBLEPayloadFilterData_mask___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 48));
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
  v7[2] = __50__RPLegacyDeviceDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __50__RPLegacyDeviceDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  NSString *serviceType;
  int v5;
  NSString *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_invalidateCalled && !self->_activateCalled)
  {
    serviceType = self->_serviceType;
    if (serviceType)
    {
      self->_activateCalled = 1;
      self->_verifyDevices = -[NSString isEqual:](serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeSystem"));
      if (*-[NSString UTF8String](self->_serviceType, "UTF8String") == 95)
      {
        v5 = -[RPLegacyDeviceDiscovery _bonjourStart](self, "_bonjourStart");
        goto LABEL_15;
      }
      v6 = self->_serviceType;
      if ((-[NSString isEqual:](v6, "isEqual:", CFSTR("RPLegacyServiceTypeNearbyAction")) & 1) != 0
        || (-[NSString isEqual:](v6, "isEqual:", CFSTR("RPLegacyServiceTypeNearbyInfo")) & 1) != 0
        || -[NSString isEqual:](v6, "isEqual:", CFSTR("RPLegacyServiceTypeProximityPairing")))
      {

LABEL_14:
        v5 = -[RPLegacyDeviceDiscovery _bleStart](self, "_bleStart");
        goto LABEL_15;
      }
      v9 = -[NSString isEqual:](v6, "isEqual:", CFSTR("RPLegacyServiceTypeSystem"));

      if (v9)
        goto LABEL_14;
      if (-[NSString isEqual:](self->_serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeMobileDevice")))
      {
        v5 = -[RPLegacyDeviceDiscovery _mdStart](self, "_mdStart");
        goto LABEL_15;
      }
      if ((-[NSString isEqual:](self->_serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeWACAirPlay")) & 1) != 0
        || -[NSString isEqual:](self->_serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeWACGeneric")))
      {
        v5 = -[RPLegacyDeviceDiscovery _wifiStart](self, "_wifiStart");
LABEL_15:
        if (!v5)
          goto LABEL_20;
        goto LABEL_16;
      }
      if (gLogCategory_RPLegacySupport > 90)
        goto LABEL_20;
      if (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize())
        LogPrintF();
    }
  }
LABEL_16:
  if (gLogCategory_RPLegacySupport <= 60
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_20:
  v7 = v10;
  if (v10)
  {
    RPErrorF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v8);

    v7 = v10;
  }

}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
  -[RPLegacyDeviceDiscovery _lostAllDevices](self, "_lostAllDevices");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__RPLegacyDeviceDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__RPLegacyDeviceDiscovery_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFDeviceDiscovery invalidate](self->_bleDiscovery, "invalidate");
    if (self->_bonjourBrowser)
      BonjourBrowser_Stop();
    -[CUMobileDeviceDiscovery invalidate](self->_mdDiscovery, "invalidate");
    -[CUWiFiScanner invalidate](self->_wifiScanner, "invalidate");
    -[RPLegacyDeviceDiscovery _lostAllDevices](self, "_lostAllDevices");
    -[RPLegacyDeviceDiscovery _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPLegacySupport <= 50
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_bleDiscovery && !self->_bonjourBrowser && !self->_mdDiscovery && !self->_wifiScanner)
    {
      invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler)
        invalidationHandler[2]();
      -[RPLegacyDeviceDiscovery _cleanup](self, "_cleanup");
      self->_invalidateDone = 1;
      if (gLogCategory_RPLegacySupport <= 10
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_foundDevice:(id)a3
{
  int v4;
  void (**deviceFoundHandler)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "reported") & 1) == 0)
  {
    if (!self->_verifyDevices || (v4 = objc_msgSend(v7, "state"), v4 == 4) || v4 == 2)
    {
      objc_msgSend(v7, "setReported:", 1);
      deviceFoundHandler = (void (**)(id, void *))self->_deviceFoundHandler;
      if (deviceFoundHandler)
      {
        objc_msgSend(v7, "device");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        deviceFoundHandler[2](deviceFoundHandler, v6);

      }
    }
    else
    {
      objc_msgSend(v7, "pairVerify");
    }
  }

}

- (void)_lostDeviceByIdentifier:(id)a3
{
  void *v4;
  void (**deviceLostHandler)(id, void *);
  void *v6;
  id v7;

  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v7);
    if (objc_msgSend(v4, "reported"))
    {
      deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
      if (deviceLostHandler)
      {
        objc_msgSend(v4, "device");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        deviceLostHandler[2](deviceLostHandler, v6);

      }
    }
    objc_msgSend(v4, "invalidate");
  }

}

- (void)_lostAllDevices
{
  NSMutableDictionary *devices;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_devices, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_9);
  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0;

}

uint64_t __42__RPLegacyDeviceDiscovery__lostAllDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (int)_bleStart
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *bleDiscovery;
  unsigned int v5;
  uint64_t v6;
  uint64_t scanRate;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  -[SFDeviceDiscovery invalidate](self->_bleDiscovery, "invalidate");
  v3 = (SFDeviceDiscovery *)objc_alloc_init((Class)getSFDeviceDiscoveryClass[0]());
  bleDiscovery = self->_bleDiscovery;
  self->_bleDiscovery = v3;

  -[SFDeviceDiscovery setDeviceFilter:](self->_bleDiscovery, "setDeviceFilter:", self->_deviceFilter);
  -[SFDeviceDiscovery setDispatchQueue:](self->_bleDiscovery, "setDispatchQueue:", self->_dispatchQueue);
  -[SFDeviceDiscovery setRssiThreshold:](self->_bleDiscovery, "setRssiThreshold:", self->_rssiThreshold);
  -[SFDeviceDiscovery setScanCache:](self->_bleDiscovery, "setScanCache:", self->_scanCache);
  -[SFDeviceDiscovery setTargetUserSession:](self->_bleDiscovery, "setTargetUserSession:", self->_targetUserSession);
  -[SFDeviceDiscovery setTimeout:](self->_bleDiscovery, "setTimeout:", self->_timeout);
  v5 = self->_changeFlags & 1 | (8 * ((self->_changeFlags >> 1) & 1)) | (self->_changeFlags >> 1) & 2 | (self->_changeFlags >> 3) & 4;
  if (self->_changeFlags == -1)
    v5 = -1;
  -[SFDeviceDiscovery setChangeFlags:](self->_bleDiscovery, "setChangeFlags:", v5 | (self->_deviceActionType != 0));
  if (self->_deviceActionType
    || (-[NSString isEqual:](self->_serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeNearbyAction")) & 1) != 0)
  {
    v6 = 16;
    goto LABEL_6;
  }
  if ((-[NSString isEqual:](self->_serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeNearbyInfo")) & 1) != 0)
    goto LABEL_17;
  if ((-[NSString isEqual:](self->_serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeProximityPairing")) & 1) != 0)
  {
    v6 = 2;
LABEL_6:
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_bleDiscovery, "setDiscoveryFlags:", v6);
    scanRate = self->_scanRate;
    if ((int)scanRate > 39)
    {
      if ((_DWORD)scanRate == 40)
      {
        scanRate = 40;
        goto LABEL_14;
      }
      if ((_DWORD)scanRate == 50)
      {
        scanRate = 50;
        goto LABEL_14;
      }
    }
    else
    {
      if ((_DWORD)scanRate == 10)
      {
LABEL_14:
        -[SFDeviceDiscovery setScanRate:](self->_bleDiscovery, "setScanRate:", scanRate);
        goto LABEL_15;
      }
      if ((_DWORD)scanRate == 20)
      {
        scanRate = 20;
        goto LABEL_14;
      }
    }
LABEL_15:
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke;
    v15[3] = &unk_1E5F50780;
    v15[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleDiscovery, "setDeviceFoundHandler:", v15);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_2;
    v14[3] = &unk_1E5F50780;
    v14[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleDiscovery, "setDeviceLostHandler:", v14);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_3;
    v13[3] = &unk_1E5F507A8;
    v13[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleDiscovery, "setDeviceChangedHandler:", v13);
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_4;
    v12[3] = &unk_1E5F4EC60;
    v12[4] = self;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_bleDiscovery, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_5;
    v11[3] = &unk_1E5F4EC60;
    v11[4] = self;
    -[SFDeviceDiscovery setInvalidationHandler:](self->_bleDiscovery, "setInvalidationHandler:", v11);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_6;
    v10[3] = &unk_1E5F4EC60;
    v10[4] = self;
    -[SFDeviceDiscovery setTimeoutHandler:](self->_bleDiscovery, "setTimeoutHandler:", v10);
    -[SFDeviceDiscovery activateWithCompletion:](self->_bleDiscovery, "activateWithCompletion:", &__block_literal_global_66);
    return 0;
  }
  if ((-[NSString isEqual:](self->_serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeSystem")) & 1) != 0)
  {
LABEL_17:
    v6 = 1;
    goto LABEL_6;
  }
  if (gLogCategory_RPLegacySupport <= 60
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return -6762;
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bleHandleDeviceFound:", a2);
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bleHandleDeviceLost:", a2);
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bleHandleDeviceChanged:changes:", a2, a3);
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_4(uint64_t a1)
{
  if (gLogCategory_RPLegacySupport <= 50
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

uint64_t __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_6(uint64_t a1)
{
  uint64_t result;

  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_RPLegacySupport <= 60)
    {
      v6 = v2;
      if (gLogCategory_RPLegacySupport != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_RPLegacySupport <= 30)
  {
    v6 = 0;
    if (gLogCategory_RPLegacySupport != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5)
      goto LABEL_7;
  }

}

- (void)_bleHandleDeviceFound:(id)a3
{
  void *v4;
  uint64_t v5;
  RPDevice *v6;
  RPDeviceContext *v7;
  NSMutableDictionary *devices;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_14;
  }
  if (self->_deviceActionType && objc_msgSend(v11, "deviceActionType") != self->_deviceActionType)
  {
LABEL_14:
    v7 = 0;
    goto LABEL_8;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = (RPDeviceContext *)v5;
  }
  else
  {
    v6 = objc_alloc_init(RPDevice);
    -[RPDevice setIdentifierUUID:](v6, "setIdentifierUUID:", v4);
    -[RPDevice updateWithSFDevice:changes:](v6, "updateWithSFDevice:changes:", v11, 0xFFFFFFFFLL);
    v7 = objc_alloc_init(RPDeviceContext);
    -[RPDeviceContext setDevice:](v7, "setDevice:", v6);
    -[RPDeviceContext setDiscovery:](v7, "setDiscovery:", self);
    devices = self->_devices;
    if (!devices)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = self->_devices;
      self->_devices = v9;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v7, v4);
    -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7);

  }
LABEL_8:

}

- (void)_bleHandleDeviceLost:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RPLegacyDeviceDiscovery _lostDeviceByIdentifier:](self, "_lostDeviceByIdentifier:", v4);
  }
  else if (gLogCategory_RPLegacySupport <= 90
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_bleHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**deviceChangedHandler)(id, void *, _QWORD);
  id v11;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  objc_msgSend(v11, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_11;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (self->_deviceActionType && objc_msgSend(v11, "deviceActionType") == self->_deviceActionType)
      -[RPLegacyDeviceDiscovery _bleHandleDeviceFound:](self, "_bleHandleDeviceFound:", v11);
LABEL_11:
    v8 = 0;
    v9 = 0;
    goto LABEL_13;
  }
  v8 = v7;
  objc_msgSend(v7, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithSFDevice:changes:", v11, v4);
  if (self->_deviceActionType && objc_msgSend(v11, "deviceActionType") != self->_deviceActionType)
  {
    -[RPLegacyDeviceDiscovery _bleHandleDeviceLost:](self, "_bleHandleDeviceLost:", v11);
  }
  else if (objc_msgSend(v8, "reported"))
  {
    deviceChangedHandler = (void (**)(id, void *, _QWORD))self->_deviceChangedHandler;
    if (deviceChangedHandler)
      deviceChangedHandler[2](deviceChangedHandler, v9, v4 & 1 | (2 * ((v4 >> 3) & 1)) & 0xFFFFFFDB | (4 * ((v4 >> 1) & 1)) & 0xFFFFFFDF | (32 * ((v4 >> 2) & 1)));
  }
LABEL_13:

}

- (int)_bonjourStart
{
  BonjourBrowser **p_bonjourBrowser;
  int v4;

  p_bonjourBrowser = &self->_bonjourBrowser;
  if (self->_bonjourBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(*p_bonjourBrowser);
    *p_bonjourBrowser = 0;
  }
  v4 = BonjourBrowser_Create();
  if (v4
    || (BonjourBrowser_SetDispatchQueue(),
        BonjourBrowser_SetEventHandlerBlock(),
        -[NSString UTF8String](self->_serviceType, "UTF8String"),
        (v4 = BonjourBrowser_Start()) != 0))
  {
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (*p_bonjourBrowser)
    {
      BonjourBrowser_Stop();
      CFRelease(*p_bonjourBrowser);
      *p_bonjourBrowser = 0;
    }
  }
  return v4;
}

uint64_t __40__RPLegacyDeviceDiscovery__bonjourStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bonjourHandleEventType:info:", a2, a3);
}

- (void)_bonjourHandleEventType:(unsigned int)a3 info:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 1u:
      -[RPLegacyDeviceDiscovery _bonjourHandleAddOrUpdateDevice:](self, "_bonjourHandleAddOrUpdateDevice:", v6);
      goto LABEL_12;
    case 2u:
      -[RPLegacyDeviceDiscovery _bonjourHandleRemoveDevice:](self, "_bonjourHandleRemoveDevice:", v6);
      goto LABEL_12;
    case 3u:
      if (self->_bonjourBrowser)
      {
        BonjourBrowser_Stop();
        CFRelease(self->_bonjourBrowser);
        self->_bonjourBrowser = 0;
      }
      -[RPLegacyDeviceDiscovery _invalidated](self, "_invalidated");
      goto LABEL_12;
    case 4u:
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[RPLegacyDeviceDiscovery _interrupted](self, "_interrupted");
LABEL_12:
      v6 = v7;
      break;
    default:
      break;
  }

}

- (void)_bonjourHandleAddOrUpdateDevice:(id)a3
{
  id v4;
  void *v5;
  RPDeviceContext *v6;
  RPDeviceContext *v7;
  RPDevice *v8;
  uint64_t v9;
  NSMutableDictionary *devices;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void (**deviceChangedHandler)(id, RPDevice *, uint64_t);
  uint64_t v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15[0] = 0;
  v15[1] = 0;
  BonjourDevice_GetDeviceID();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v15);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v5);
  v6 = (RPDeviceContext *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[RPDeviceContext device](v6, "device");
    v8 = (RPDevice *)objc_claimAutoreleasedReturnValue();
    v9 = -[RPDevice updateWithBonjourDevice:](v8, "updateWithBonjourDevice:", v4);
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    deviceChangedHandler = (void (**)(id, RPDevice *, uint64_t))self->_deviceChangedHandler;
    if (deviceChangedHandler)
      deviceChangedHandler[2](deviceChangedHandler, v8, v9);
  }
  else
  {
    v8 = objc_alloc_init(RPDevice);
    -[RPDevice setIdentifierUUID:](v8, "setIdentifierUUID:", v5);
    v7 = objc_alloc_init(RPDeviceContext);
    -[RPDeviceContext setDevice:](v7, "setDevice:", v8);
    -[RPDeviceContext setDiscovery:](v7, "setDiscovery:", self);
    devices = self->_devices;
    if (!devices)
    {
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = self->_devices;
      self->_devices = v11;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v7, v5);
    -[RPDevice updateWithBonjourDevice:](v8, "updateWithBonjourDevice:", v4);
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7, v8);
    }
    else
    {
      -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7, v14);
    }
  }

}

- (void)_bonjourHandleRemoveDevice:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = 0;
  v6[1] = 0;
  BonjourDevice_GetDeviceID();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v6);
  -[RPLegacyDeviceDiscovery _lostDeviceByIdentifier:](self, "_lostDeviceByIdentifier:", v5);

}

- (int)_mdStart
{
  CUMobileDeviceDiscovery *v3;
  CUMobileDeviceDiscovery *mdDiscovery;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  -[CUMobileDeviceDiscovery invalidate](self->_mdDiscovery, "invalidate");
  v3 = (CUMobileDeviceDiscovery *)objc_alloc_init(MEMORY[0x1E0D1B3B0]);
  mdDiscovery = self->_mdDiscovery;
  self->_mdDiscovery = v3;

  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke;
  v10[3] = &unk_1E5F50838;
  v10[4] = self;
  -[CUMobileDeviceDiscovery setDeviceFoundHandler:](self->_mdDiscovery, "setDeviceFoundHandler:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_2;
  v9[3] = &unk_1E5F50838;
  v9[4] = self;
  -[CUMobileDeviceDiscovery setDeviceLostHandler:](self->_mdDiscovery, "setDeviceLostHandler:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_3;
  v8[3] = &unk_1E5F50860;
  v8[4] = self;
  -[CUMobileDeviceDiscovery setDeviceChangedHandler:](self->_mdDiscovery, "setDeviceChangedHandler:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_4;
  v7[3] = &unk_1E5F4EC60;
  v7[4] = self;
  -[CUMobileDeviceDiscovery setInvalidationHandler:](self->_mdDiscovery, "setInvalidationHandler:", v7);
  -[CUMobileDeviceDiscovery activate](self->_mdDiscovery, "activate");
  return 0;
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mdHandleDeviceFound:", a2);
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mdHandleDeviceLost:", a2);
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mdHandleDeviceChanged:changes:", a2, a3);
}

uint64_t __35__RPLegacyDeviceDiscovery__mdStart__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_mdHandleDeviceFound:(id)a3
{
  void *v4;
  uint64_t v5;
  RPDevice *v6;
  RPDeviceContext *v7;
  NSMutableDictionary *devices;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v7 = (RPDeviceContext *)v5;
    }
    else
    {
      v6 = objc_alloc_init(RPDevice);
      -[RPDevice setIdentifierUUID:](v6, "setIdentifierUUID:", v4);
      -[RPDevice updateWithMobileDevice:](v6, "updateWithMobileDevice:", v11);
      v7 = objc_alloc_init(RPDeviceContext);
      -[RPDeviceContext setDevice:](v7, "setDevice:", v6);
      -[RPDeviceContext setDiscovery:](v7, "setDiscovery:", self);
      devices = self->_devices;
      if (!devices)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v10 = self->_devices;
        self->_devices = v9;

        devices = self->_devices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v7, v4);
      -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v7);

    }
  }
  else
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 0;
  }

}

- (void)_mdHandleDeviceLost:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RPLegacyDeviceDiscovery _lostDeviceByIdentifier:](self, "_lostDeviceByIdentifier:", v4);
  }
  else if (gLogCategory_RPLegacySupport <= 90
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_mdHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**deviceChangedHandler)(id, void *, _QWORD);
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }
LABEL_11:
    LogPrintF();
LABEL_15:
    v7 = 0;
    v8 = 0;
    goto LABEL_5;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  v7 = v6;
  objc_msgSend(v6, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "updateWithMobileDevice:", v13);
  deviceChangedHandler = (void (**)(id, void *, _QWORD))self->_deviceChangedHandler;
  if (deviceChangedHandler)
  {
    v11 = v9;
    objc_msgSend(v7, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    deviceChangedHandler[2](deviceChangedHandler, v12, v11);

  }
LABEL_5:

}

- (int)_wifiStart
{
  CUWiFiScanner *v3;
  CUWiFiScanner *wifiScanner;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  -[CUWiFiScanner invalidate](self->_wifiScanner, "invalidate");
  v3 = (CUWiFiScanner *)objc_alloc_init(MEMORY[0x1E0D1B480]);
  wifiScanner = self->_wifiScanner;
  self->_wifiScanner = v3;

  -[CUWiFiScanner setDispatchQueue:](self->_wifiScanner, "setDispatchQueue:", self->_dispatchQueue);
  -[CUWiFiScanner setScanFlags:](self->_wifiScanner, "setScanFlags:", self->_wifiScanFlags);
  -[CUWiFiScanner setSsid:](self->_wifiScanner, "setSsid:", self->_wifiSSID);
  self->_wifiAirPlayWAC = -[NSString isEqual:](self->_serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeWACAirPlay"));
  if (self->_changeFlags == -1)
    v5 = 0xFFFFFFFFLL;
  else
    v5 = (self->_changeFlags >> 4) & 6 | ((self->_changeFlags & 0xA) != 0);
  -[CUWiFiScanner setChangeFlags:](self->_wifiScanner, "setChangeFlags:", v5);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke;
  v11[3] = &unk_1E5F50888;
  v11[4] = self;
  -[CUWiFiScanner setDeviceFoundHandler:](self->_wifiScanner, "setDeviceFoundHandler:", v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_2;
  v10[3] = &unk_1E5F50888;
  v10[4] = self;
  -[CUWiFiScanner setDeviceLostHandler:](self->_wifiScanner, "setDeviceLostHandler:", v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_3;
  v9[3] = &unk_1E5F508B0;
  v9[4] = self;
  -[CUWiFiScanner setDeviceChangedHandler:](self->_wifiScanner, "setDeviceChangedHandler:", v9);
  -[CUWiFiScanner setErrorHandler:](self->_wifiScanner, "setErrorHandler:", &__block_literal_global_93);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_5;
  v8[3] = &unk_1E5F4EC60;
  v8[4] = self;
  -[CUWiFiScanner setInvalidationHandler:](self->_wifiScanner, "setInvalidationHandler:", v8);
  -[CUWiFiScanner activate](self->_wifiScanner, "activate");
  return 0;
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wifiHandleDeviceFound:", a2);
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wifiHandleDeviceLost:", a2);
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_wifiHandleDeviceChanged:changes:", a2, a3);
}

void __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_RPLegacySupport <= 60
    && ((v5 = v2, gLogCategory_RPLegacySupport != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

uint64_t __37__RPLegacyDeviceDiscovery__wifiStart__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_wifiHandleDeviceFound:(id)a3
{
  void *v4;
  RPDeviceContext *v5;
  void *v6;
  void *v7;
  int v8;
  RPDevice *v9;
  NSMutableDictionary *devices;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (gLogCategory_RPLegacySupport <= 90
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_15;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v4);
  v5 = (RPDeviceContext *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deviceIEDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    if (self->_wifiAirPlayWAC)
    {
      v8 = objc_msgSend(v13, "deviceIEFlags");

      if ((v8 & 0x80000000) == 0)
        goto LABEL_5;
    }
    else
    {

    }
    if (v5)
    {
      -[RPDeviceContext device](v5, "device");
      v9 = (RPDevice *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_alloc_init(RPDevice);
      -[RPDevice setIdentifierUUID:](v9, "setIdentifierUUID:", v4);
      v5 = objc_alloc_init(RPDeviceContext);
      -[RPDeviceContext setDevice:](v5, "setDevice:", v9);
      -[RPDeviceContext setDiscovery:](v5, "setDiscovery:", self);
      devices = self->_devices;
      if (!devices)
      {
        v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v12 = self->_devices;
        self->_devices = v11;

        devices = self->_devices;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v5, v4);
    }
    -[RPDevice updateWithWiFiDevice:changes:](v9, "updateWithWiFiDevice:changes:", v13, 0xFFFFFFFFLL);
    -[RPLegacyDeviceDiscovery _foundDevice:](self, "_foundDevice:", v5);

    goto LABEL_14;
  }
LABEL_5:
  if (v5)
  {
    -[RPLegacyDeviceDiscovery _wifiHandleDeviceLost:](self, "_wifiHandleDeviceLost:", v13);
LABEL_14:

  }
LABEL_15:

}

- (void)_wifiHandleDeviceLost:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RPLegacyDeviceDiscovery _lostDeviceByIdentifier:](self, "_lostDeviceByIdentifier:", v4);
  }
  else if (gLogCategory_RPLegacySupport <= 90
         && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_wifiHandleDeviceChanged:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**deviceChangedHandler)(id, void *, _QWORD);
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v12 = a3;
  objc_msgSend(v12, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }
LABEL_11:
    LogPrintF();
LABEL_15:
    v8 = 0;
    v9 = 0;
    goto LABEL_5;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  v8 = v7;
  objc_msgSend(v7, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateWithWiFiDevice:changes:", v12, v4);
  deviceChangedHandler = (void (**)(id, void *, _QWORD))self->_deviceChangedHandler;
  if (deviceChangedHandler)
  {
    objc_msgSend(v8, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    deviceChangedHandler[2](deviceChangedHandler, v11, ((int)((_DWORD)v4 << 31) >> 31) & ((2 * (v4 & 1)) | 8) & 0xFFFFFF9F | (32 * ((v4 >> 1) & 3)));

  }
LABEL_5:

}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_deviceActionType = a3;
}

- (NSSet)deviceFilter
{
  return self->_deviceFilter;
}

- (void)setDeviceFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (int)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(int)a3
{
  self->_rssiThreshold = a3;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (void)setScanCache:(BOOL)a3
{
  self->_scanCache = a3;
}

- (unsigned)scanRate
{
  return self->_scanRate;
}

- (void)setScanRate:(unsigned int)a3
{
  self->_scanRate = a3;
}

- (unsigned)scanState
{
  return self->_scanState;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
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

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unsigned)wifiScanFlags
{
  return self->_wifiScanFlags;
}

- (void)setWifiScanFlags:(unsigned int)a3
{
  self->_wifiScanFlags = a3;
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)scanStateChangedHandler
{
  return self->_scanStateChangedHandler;
}

- (void)setScanStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_scanStateChangedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong((id *)&self->_wifiScanner, 0);
  objc_storeStrong((id *)&self->_mdDiscovery, 0);
  objc_storeStrong((id *)&self->_bleDiscovery, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_blePayloadFilterMask, 0);
  objc_storeStrong((id *)&self->_blePayloadFilterData, 0);
}

@end
