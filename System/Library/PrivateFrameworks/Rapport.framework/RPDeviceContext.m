@implementation RPDeviceContext

- (void)invalidate
{
  RPLegacyDeviceDiscovery *discovery;
  RPLegacySession *session;

  discovery = self->_discovery;
  self->_discovery = 0;

  -[RPLegacySession invalidate](self->_session, "invalidate");
  session = self->_session;
  self->_session = 0;

}

- (void)pairVerify
{
  RPLegacySession *v3;
  RPLegacySession *session;
  uint64_t v5;
  RPLegacySession *v6;
  RPLegacySession *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  -[RPLegacySession invalidate](self->_session, "invalidate");
  v3 = objc_alloc_init(RPLegacySession);
  session = self->_session;
  self->_session = v3;

  -[RPLegacySession setPeerDevice:](self->_session, "setPeerDevice:", self->_device);
  -[RPLegacySession setSecurityFlags:](self->_session, "setSecurityFlags:", 3);
  -[RPLegacySession setServiceType:](self->_session, "setServiceType:", CFSTR("RPLegacyServiceTypeSystem"));
  v5 = MEMORY[0x1E0C809B0];
  v6 = self->_session;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29__RPDeviceContext_pairVerify__block_invoke;
  v9[3] = &unk_1E5F4ECD0;
  v9[4] = self;
  -[RPLegacySession activateWithCompletion:](v6, "activateWithCompletion:", v9);
  v7 = self->_session;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __29__RPDeviceContext_pairVerify__block_invoke_2;
  v8[3] = &unk_1E5F4ECD0;
  v8[4] = self;
  -[RPLegacySession pairVerifyWithFlags:completion:](v7, "pairVerifyWithFlags:completion:", 8, v8);
}

void __29__RPDeviceContext_pairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      v6 = v7;
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate", v6);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

    v3 = v7;
  }

}

void __29__RPDeviceContext_pairVerify__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];

  v3 = a2;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = v3;
    LogPrintF();
  }
  if (!v3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setSystemPairState:", 30);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__RPDeviceContext_pairVerify__block_invoke_3;
  v8[3] = &unk_1E5F508F8;
  v8[4] = v4;
  objc_msgSend(v5, "requestSystemInfoWithCompletion:", v8, v6, v7);

}

uint64_t __29__RPDeviceContext_pairVerify__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemInfoResponse:error:", a2, a3);
}

- (void)systemInfoResponse:(id)a3 error:(id)a4
{
  id v6;
  RPLegacySession *session;
  RPDevice *device;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    -[RPDevice updateWithSystemInfo:](self->_device, "updateWithSystemInfo:");
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      device = self->_device;
      LogPrintF();
    }
    self->_state = 4;
    -[RPLegacyDeviceDiscovery _foundDevice:](self->_discovery, "_foundDevice:", self, device);
  }
  else
  {
    self->_state = 3;
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      device = self->_device;
      v9 = v6;
      LogPrintF();
    }
  }
  -[RPLegacySession invalidate](self->_session, "invalidate", device, v9);
  session = self->_session;
  self->_session = 0;

}

- (RPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (RPLegacyDeviceDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_discovery, a3);
}

- (BOOL)reported
{
  return self->_reported;
}

- (void)setReported:(BOOL)a3
{
  self->_reported = a3;
}

- (RPLegacySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
