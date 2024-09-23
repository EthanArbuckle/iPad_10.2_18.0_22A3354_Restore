@implementation SFBluetoothPairingSession

- (SFBluetoothPairingSession)init
{
  SFBluetoothPairingSession *v2;
  SFBluetoothPairingSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFBluetoothPairingSession;
  v2 = -[SFBluetoothPairingSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_ucat = (LogCategory *)&gLogCategory_SFBluetoothPairingSession;
  }
  return v3;
}

- (void)dealloc
{
  SFBluetoothPairingSession *v2;
  SEL v3;
  objc_super v4;

  if (self->_btSession)
  {
    FatalErrorF();
    goto LABEL_6;
  }
  if (self->_btSessionAttaching)
  {
LABEL_6:
    FatalErrorF();
    goto LABEL_7;
  }
  if (!self->_completionHandler)
  {
    v4.receiver = self;
    v4.super_class = (Class)SFBluetoothPairingSession;
    -[SFBluetoothPairingSession dealloc](&v4, sel_dealloc);
    return;
  }
LABEL_7:
  v2 = (SFBluetoothPairingSession *)FatalErrorF();
  -[SFBluetoothPairingSession activate](v2, v3);
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFBluetoothPairingSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFBluetoothPairingSession_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  int var0;
  const char *v4;
  const char *v5;
  const char *v6;
  OS_os_transaction *v7;
  OS_os_transaction *transaction;
  int v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *timeoutTimer;
  NSObject *v12;
  WPClient *v13;
  WPClient *wpClient;
  uint64_t v15;
  int v16;
  NSString *deviceAddress;
  NSString *guestAddress;
  const char *v19;
  const char *v20;
  const char *v21;
  _QWORD handler[5];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v4 = "yes";
    if (self->_guestMode)
      v5 = "yes";
    else
      v5 = "no";
    if (self->_disconnectOnly)
      v6 = "yes";
    else
      v6 = "no";
    if (!self->_userNotInContacts)
      v4 = "no";
    v20 = v6;
    v21 = v4;
    guestAddress = self->_guestAddress;
    v19 = v5;
    deviceAddress = self->_deviceAddress;
    LogPrintF();
  }
  self->_startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_transaction)
  {
    v7 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v7;

    if (!self->_transaction)
    {
      v9 = self->_ucat->var0;
      if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
  if (self->_timeoutTimer)
  {
LABEL_22:
    v13 = (WPClient *)objc_msgSend(objc_alloc((Class)getWPClientClass[0]()), "initWithQueue:machName:", self->_dispatchQueue, 0);
    wpClient = self->_wpClient;
    self->_wpClient = v13;

    -[WPClient disableScanning](self->_wpClient, "disableScanning");
    v15 = -[SFBluetoothPairingSession _btEnsureStarted](self, "_btEnsureStarted");
    if (!(_DWORD)v15)
      return;
    goto LABEL_23;
  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v10;

  v12 = self->_timeoutTimer;
  if (v12)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __38__SFBluetoothPairingSession__activate__block_invoke;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    SFDispatchTimerSet(self->_timeoutTimer, 15.0, -1.0, -10.0);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    goto LABEL_22;
  }
  v16 = self->_ucat->var0;
  if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v15 = 4294960567;
LABEL_23:
  -[SFBluetoothPairingSession _completed:](self, "_completed:", v15, deviceAddress, guestAddress, v19, v20, v21);
}

uint64_t __38__SFBluetoothPairingSession__activate__block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[17];
  if (v3 <= 60)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_completed:", 4294960574);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFBluetoothPairingSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFBluetoothPairingSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_invalidateCalled = 1;
  -[SFBluetoothPairingSession _completed:](self, "_completed:", 4294960573);
}

- (void)_completed:(int)a3
{
  uint64_t v3;
  OS_dispatch_source *retryTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *timeoutTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  WPClient *wpClient;
  int var0;
  void (**completionHandler)(id, void *);
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  OS_os_transaction *transaction;
  double v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v3 = *(_QWORD *)&a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  -[SFBluetoothPairingSession _btEnsureStopped](self, "_btEnsureStopped");
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    v6 = retryTimer;
    dispatch_source_cancel(v6);
    v7 = self->_retryTimer;
    self->_retryTimer = 0;

  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    v10 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[WPClient invalidate](self->_wpClient, "invalidate");
  wpClient = self->_wpClient;
  self->_wpClient = 0;

  if (self->_completionHandler)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v25 = v3;
      v24 = CFAbsoluteTimeGetCurrent() - self->_startTime;
      LogPrintF();
    }
    completionHandler = (void (**)(id, void *))self->_completionHandler;
    if ((_DWORD)v3)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2F90];
      v16 = (int)v3;
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = CFSTR("?");
      if (v17)
        v19 = (const __CFString *)v17;
      v27[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, *(_QWORD *)&v24, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, v21);

    }
    else
    {
      completionHandler[2](self->_completionHandler, 0);
    }
    v22 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (int)_btEnsureStarted
{
  int v3;
  int var0;
  int v5;
  uint64_t *p_btDevice;
  __int128 v7;
  int v8;
  int v9;
  NSString *deviceAddress;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  NSString *guestAddress;
  int v16;
  int v17;
  LogCategory *ucat;
  SFBluetoothPairingSession *v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  const char *v25;
  int v26;
  NSString *v27;
  NSString *name;
  int v29;
  int v30;
  int v31;
  int v32;
  BOOL v33;
  int v34;
  _BOOL4 softwareVolume;
  int v36;
  const char *v37;
  const char *v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  BTDeviceImpl *btDevice;
  int v45;
  int v46;
  int v47;
  NSString *v48;
  NSUInteger v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  NSUInteger v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  NSUInteger v59;
  int v60;
  uint64_t v61;
  const char *v62;
  int v63;
  int v64;
  uint64_t v65;
  int v66;
  int v67;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  NSUInteger v80;
  const char *v81;
  NSUInteger v82;
  const char *v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  int v89;
  int v90;
  __int16 v91;
  _OWORD v92[2];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  self->_btStarted = 1;
  if (!self->_btSessionAttaching && !self->_btSession)
  {
    *(_QWORD *)&v92[0] = 0;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    *(_QWORD *)&v92[0] = _btSessionEventHandler_0;
    v19 = self;

    v20 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue_0[0])((uint64_t)self->_ucat->var4, (uint64_t)v92, (uint64_t)v19, v19->_dispatchQueue);
    if (v20)
    {
      v21 = v20;
      CFRelease(v19);
      v22 = (v21 + 310000);
      v23 = self->_ucat->var0;
      if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize())
        goto LABEL_98;
      v80 = v22;
      goto LABEL_45;
    }
    self->_btSessionAttaching = 1;
  }
  if (!self->_btSessionAddedServiceCallback && self->_btSession)
  {
    v3 = self->_ucat->var0;
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v5 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTServiceAddCallbacks[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler, (uint64_t)self);
    if (v5)
    {
      v22 = (v5 + 310000);
      v70 = self->_ucat->var0;
      if (v70 <= 60 && (v70 != -1 || _LogCategory_Initialize()))
      {
        v80 = v22;
        LogPrintF();
      }
      goto LABEL_98;
    }
    self->_btSessionAddedServiceCallback = 1;
  }
  p_btDevice = (uint64_t *)&self->_btDevice;
  if (self->_btDevice || !self->_btSession)
    goto LABEL_15;
  v9 = self->_ucat->var0;
  if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    v91 = 0;
    v90 = 0;
    v11 = -[NSString UTF8String](deviceAddress, "UTF8String");
    v12 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString_0[0])(v11, (uint64_t)&v90);
    if (v12)
    {
      v22 = (v12 + 310000);
      v72 = self->_ucat->var0;
      if (v72 > 60 || v72 == -1 && !_LogCategory_Initialize())
        goto LABEL_98;
      v80 = (NSUInteger)self->_deviceAddress;
      goto LABEL_45;
    }
    v13 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceFromAddress[0])((uint64_t)self->_btSession, (uint64_t)&v90, (uint64_t)&self->_btDevice);
    if (v13)
    {
      v22 = (v13 + 310000);
      v73 = self->_ucat->var0;
      if (v73 > 60 || v73 == -1 && !_LogCategory_Initialize())
        goto LABEL_98;
      v80 = (NSUInteger)self->_deviceAddress;
      v82 = v22;
      goto LABEL_45;
    }
    v14 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString_0[0])((uint64_t)self->_btDevice, (uint64_t)self->_btAddrStr, 32);
    if (v14)
    {
      v22 = (v14 + 310000);
      v74 = self->_ucat->var0;
      if (v74 > 60 || v74 == -1 && !_LogCategory_Initialize())
        goto LABEL_98;
      v80 = (NSUInteger)self->_deviceAddress;
      v82 = v22;
      goto LABEL_214;
    }
    guestAddress = self->_guestAddress;
    if (guestAddress)
    {
      v16 = self->_ucat->var0;
      if (v16 <= 30)
      {
        if (v16 == -1)
        {
          if (!_LogCategory_Initialize())
            goto LABEL_15;
          guestAddress = self->_guestAddress;
        }
        v80 = (NSUInteger)self->_deviceAddress;
        v82 = (NSUInteger)guestAddress;
        LogPrintF();
      }
LABEL_15:
      if (self->_connectOnly
        || self->_disconnectOnly
        || self->_guestAddress
        || self->_btPairingAgent
        || !self->_btSession)
      {
        goto LABEL_111;
      }
      v7 = 0uLL;
      v93 = 0u;
      memset(v92, 0, sizeof(v92));
      v8 = self->_ucat->var0;
      if (v8 <= 30)
      {
        if (v8 != -1 || (v40 = _LogCategory_Initialize(), v7 = 0uLL, v40))
        {
          LogPrintF();
          v7 = 0uLL;
        }
      }
      v93 = *((unint64_t *)&v7 + 1);
      *(_OWORD *)((char *)v92 + 8) = v7;
      *(_QWORD *)&v92[0] = _btPairingAgentStatusHandler;
      *((_QWORD *)&v92[1] + 1) = _btPairingAgentUserConfirmationHandler;
      v41 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTPairingAgentCreate[0])((uint64_t)self->_btSession, (uint64_t)v92, (uint64_t)self, (uint64_t)&self->_btPairingAgent);
      if (v41)
      {
        v22 = (v41 + 310000);
        v78 = self->_ucat->var0;
        if (v78 <= 60 && (v78 != -1 || _LogCategory_Initialize()))
        {
          v80 = v22;
          goto LABEL_45;
        }
        goto LABEL_98;
      }
      v42 = self->_ucat->var0;
      if (v42 <= 30 && (v42 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v43 = ((uint64_t (*)(uint64_t))softLinkBTPairingAgentStart[0])((uint64_t)self->_btPairingAgent);
      if (!v43)
      {
LABEL_111:
        btDevice = self->_btDevice;
        if (self->_unpairOnly)
        {
          if (!btDevice || self->_btDisconnected)
            goto LABEL_194;
          v45 = self->_ucat->var0;
          if (v45 <= 30 && (v45 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v53 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTPairingAgentDeletePairedDevice[0])((uint64_t)self->_btPairingAgent, (uint64_t)self->_btDevice);
          if (!(_DWORD)v53)
            goto LABEL_192;
          v54 = v53;
          v55 = self->_ucat->var0;
          if (v55 > 60 || v55 == -1 && !_LogCategory_Initialize())
            goto LABEL_192;
          v80 = v54;
          v82 = (v54 + 310000);
          goto LABEL_161;
        }
        if (!btDevice)
        {
LABEL_194:
          LODWORD(v22) = 0;
          return v22;
        }
        if ((self->_btConfigured || !self->_guestAddress)
          && (self->_btConnecting || !self->_btPairingAgentStarted && !self->_connectOnly))
        {
          if (self->_btDisconnected || !self->_disconnectOnly)
            goto LABEL_194;
          v46 = self->_ucat->var0;
          if (v46 <= 30 && (v46 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v58 = ((uint64_t (*)(uint64_t))softLinkBTDeviceDisconnect[0])(*p_btDevice);
          if (!(_DWORD)v58)
            goto LABEL_192;
          v59 = v58;
          v60 = self->_ucat->var0;
          if (v60 > 60 || v60 == -1 && !_LogCategory_Initialize())
            goto LABEL_192;
          v80 = v59;
          v82 = (v59 + 310000);
LABEL_161:
          LogPrintF();
LABEL_192:
          self->_btDisconnected = 1;
          goto LABEL_193;
        }
        if (!self->_guestAddress)
          goto LABEL_277;
        if (MobileBluetoothLibrary_sOnce_0 != -1)
          dispatch_once(&MobileBluetoothLibrary_sOnce_0, &__block_literal_global_307);
        if (!MobileBluetoothLibrary_sLib_0 || !dlsym((void *)MobileBluetoothLibrary_sLib_0, "BTDeviceConfigureLinkKey"))
        {
          if (!self->_guestMode)
            goto LABEL_278;
LABEL_277:
          if (MobileBluetoothLibrary_sOnce_0 != -1)
            dispatch_once(&MobileBluetoothLibrary_sOnce_0, &__block_literal_global_307);
          if (MobileBluetoothLibrary_sLib_0
            && dlsym((void *)MobileBluetoothLibrary_sLib_0, "BTDeviceConnectServicesWithParameters"))
          {
            v50 = self->_ucat->var0;
            if (v50 <= 30 && (v50 != -1 || _LogCategory_Initialize()))
            {
              v80 = -[NSData length](self->_guestKey, "length", v80, v82);
              LogPrintF();
            }
            v92[0] = 0uLL;
            if (-[NSData length](self->_guestKey, "length", v80) == 16)
            {
              v92[0] = *(_OWORD *)-[NSData bytes](self->_guestKey, "bytes");
              if (self->_userNotInContacts)
                v65 = 4;
              else
                v65 = 2;
            }
            else
            {
              v65 = 1;
            }
            v66 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConnectServicesWithParameters[0])(*p_btDevice, 4294959103, v65, (uint64_t)v92);
            if (v66)
            {
              v22 = (v66 + 310000);
              v67 = self->_ucat->var0;
              if (v67 > 60 || v67 == -1 && !_LogCategory_Initialize())
                goto LABEL_98;
              v80 = v22;
              goto LABEL_45;
            }
          }
          else
          {
            if (!self->_aggregate)
              goto LABEL_153;
LABEL_278:
            if (MobileBluetoothLibrary_sOnce_0 != -1)
              dispatch_once(&MobileBluetoothLibrary_sOnce_0, &__block_literal_global_307);
            if (MobileBluetoothLibrary_sLib_0
              && dlsym((void *)MobileBluetoothLibrary_sLib_0, "BTDeviceConnectServicesWithParameters"))
            {
              v51 = self->_ucat->var0;
              if (v51 <= 30 && (v51 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              v92[0] = 0uLL;
              v69 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConnectServicesWithParameters[0])(*p_btDevice, 4294959103, 0, (uint64_t)v92);
              if (v69)
              {
                v22 = (v69 + 310000);
                v77 = self->_ucat->var0;
                if (v77 <= 60 && (v77 != -1 || _LogCategory_Initialize()))
                {
                  v80 = v22;
                  goto LABEL_45;
                }
                goto LABEL_98;
              }
            }
            else
            {
LABEL_153:
              v52 = self->_ucat->var0;
              if (v52 <= 30 && (v52 != -1 || _LogCategory_Initialize()))
                LogPrintF();
              v56 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceConnectServices[0])(*p_btDevice, 4294959103);
              if (v56)
              {
                v22 = (v56 + 310000);
                v57 = self->_ucat->var0;
                if (v57 > 60 || v57 == -1 && !_LogCategory_Initialize())
                  goto LABEL_98;
                v80 = v22;
                goto LABEL_45;
              }
            }
          }
          LODWORD(v22) = 0;
          self->_btConnecting = 1;
          return v22;
        }
        v47 = self->_ucat->var0;
        if (v47 <= 30 && (v47 != -1 || _LogCategory_Initialize()))
        {
          v48 = self->_guestAddress;
          v49 = -[NSData length](self->_guestKey, "length", v80, v82);
          v80 = (NSUInteger)v48;
          v82 = v49;
          LogPrintF();
        }
        v92[0] = 0uLL;
        if (-[NSData length](self->_guestKey, "length", v80, v82) == 16)
        {
          v92[0] = *(_OWORD *)-[NSData bytes](self->_guestKey, "bytes");
          v61 = 0xFFFFFFFFLL;
        }
        else
        {
          v61 = 0;
        }
        WORD2(v86) = 0;
        LODWORD(v86) = 0;
        v62 = -[NSString UTF8String](self->_guestAddress, "UTF8String");
        v63 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString_0[0])((uint64_t)v62, (uint64_t)&v86);
        if (!v63)
        {
          v64 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceConfigureLinkKey[0])(*p_btDevice, (uint64_t)&v86, (uint64_t)v92, v61);
          if (!v64)
          {
            self->_btConfigured = 1;
LABEL_193:
            -[SFBluetoothPairingSession _completed:](self, "_completed:", 0, v80, v82);
            goto LABEL_194;
          }
          v22 = (v64 + 310000);
          v76 = self->_ucat->var0;
          if (v76 <= 60 && (v76 != -1 || _LogCategory_Initialize()))
          {
            v80 = v22;
            goto LABEL_45;
          }
LABEL_98:
          if (!(_DWORD)v22)
            return v22;
          goto LABEL_99;
        }
        v22 = (v63 + 310000);
        v75 = self->_ucat->var0;
        if (v75 > 60 || v75 == -1 && !_LogCategory_Initialize())
          goto LABEL_98;
        v80 = (NSUInteger)self->_guestAddress;
LABEL_45:
        LogPrintF();
        goto LABEL_98;
      }
      v22 = (v43 + 310000);
      v79 = self->_ucat->var0;
      if (v79 > 60 || v79 == -1 && !_LogCategory_Initialize())
        goto LABEL_98;
      v80 = v22;
LABEL_214:
      LogPrintF();
      goto LABEL_98;
    }
    v89 = 0;
    v17 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTDeviceGetPairingStatus_0[0])((uint64_t)self->_btDevice, (uint64_t)&v89);
    ucat = self->_ucat;
    if (v17)
    {
      if (ucat->var0 > 60)
        goto LABEL_59;
      if (ucat->var0 != -1 || (v24 = _LogCategory_Initialize(), ucat = self->_ucat, v24))
      {
        v80 = (v17 + 310000);
        LogPrintF();
        ucat = self->_ucat;
      }
    }
    if (ucat->var0 <= 30 && (ucat->var0 != -1 || _LogCategory_Initialize()))
    {
      if (v89)
        v25 = "already paired";
      else
        v25 = "not paired";
      v80 = (NSUInteger)self->_deviceAddress;
      v82 = (NSUInteger)v25;
      LogPrintF();
    }
LABEL_59:
    if (!v89 || !self->_connectOnly)
      goto LABEL_15;
    v26 = self->_ucat->var0;
    if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v106 = 0;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v97 = 0u;
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    memset(v92, 0, sizeof(v92));
    ((void (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetName_0[0])(*p_btDevice, (uint64_t)v92, 248);
    if (LOBYTE(v92[0]))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v92);
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v27;

    }
    v88 = 0;
    v87 = 0;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetDeviceId[0])((uint64_t)self->_btDevice, (uint64_t)&v88, (uint64_t)&v87 + 4, (uint64_t)&v87, (uint64_t)&self->_deviceVersion);
    v86 = 0;
    v22 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTAccessoryManagerGetDefault[0])((uint64_t)self->_btSession, (uint64_t)&v86);
    if ((_DWORD)v22)
    {
      v29 = self->_ucat->var0;
      if (v29 <= 60 && (v29 != -1 || _LogCategory_Initialize()))
      {
        v80 = (v22 + 310000);
        LogPrintF();
      }
    }
    if (v86)
    {
      v85 = 0;
      v30 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability[0])(v86, *p_btDevice, 1, (uint64_t)&v85);
      if (v30)
      {
        v31 = v30;
        v32 = self->_ucat->var0;
        if (v32 <= 60 && (v32 != -1 || _LogCategory_Initialize()))
        {
          v80 = (v31 + 310000);
          LogPrintF();
        }
        v33 = 0;
        v85 = 0;
      }
      else
      {
        v33 = v85 != 0;
      }
      self->_inEarDetection = v33;
      v84 = 0;
      v22 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLinkBTAccessoryManagerGetFeatureCapability[0])(v86, (uint64_t)self->_btDevice, 26, (uint64_t)&v84);
      if ((_DWORD)v22)
      {
        v34 = self->_ucat->var0;
        if (v34 <= 60 && (v34 != -1 || _LogCategory_Initialize()))
        {
          v80 = (v22 + 310000);
          LogPrintF();
        }
        softwareVolume = 0;
        v84 = 0;
      }
      else
      {
        softwareVolume = v84 != 0;
      }
      self->_softwareVolume = softwareVolume;
      v36 = self->_ucat->var0;
      if (v36 <= 30)
      {
        if (v36 != -1)
        {
LABEL_89:
          if (self->_inEarDetection)
            v37 = "yes";
          else
            v37 = "no";
          if (softwareVolume)
            v38 = "yes";
          else
            v38 = "no";
          v81 = v37;
          v83 = v38;
          LogPrintF();
          -[SFBluetoothPairingSession _completed:](self, "_completed:", 0, v81, v83);
          goto LABEL_98;
        }
        if (_LogCategory_Initialize())
        {
          softwareVolume = self->_softwareVolume;
          goto LABEL_89;
        }
      }
    }
    -[SFBluetoothPairingSession _completed:](self, "_completed:", 0, v80, v82);
    goto LABEL_98;
  }
  v71 = self->_ucat->var0;
  if (v71 <= 60 && (v71 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v22 = 4294960551;
LABEL_99:
  v39 = self->_ucat->var0;
  if (v39 <= 60 && (v39 != -1 || _LogCategory_Initialize()))
  {
    v80 = v22;
    LogPrintF();
  }
  -[SFBluetoothPairingSession _completed:](self, "_completed:", v22, v80, v82);
  return v22;
}

- (void)_btEnsureStopped
{
  int var0;
  int v4;
  int v5;
  int v6;
  int v7;

  if (self->_btConnecting)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTPairingAgentCancelPairing[0])((uint64_t)self->_btPairingAgent);
    self->_btConnecting = 0;
  }
  if (self->_btPairingAgentStarted)
  {
    v4 = self->_ucat->var0;
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTPairingAgentStop[0])((uint64_t)self->_btPairingAgent);
    self->_btPairingAgentStarted = 0;
  }
  if (self->_btPairingAgent)
  {
    v5 = self->_ucat->var0;
    if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTPairingAgentDestroy[0])((uint64_t)&self->_btPairingAgent);
    self->_btPairingAgent = 0;
  }
  if (self->_btSessionAddedServiceCallback)
  {
    if (self->_btSession)
    {
      v6 = self->_ucat->var0;
      if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      ((void (*)(uint64_t, uint64_t))softLinkBTServiceRemoveCallbacks[0])((uint64_t)self->_btSession, (uint64_t)_btServiceEventHandler);
    }
    self->_btSessionAddedServiceCallback = 0;
  }
  if (self->_btSession)
  {
    v7 = self->_ucat->var0;
    if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTSessionDetachWithQueue_0[0])((uint64_t)&self->_btSession);
    self->_btSession = 0;
  }
  self->_btDevice = 0;
  self->_btStarted = 0;
}

- (void)_btDeletePairingAndRetry
{
  unsigned int retryCount;
  int v4;
  uint64_t v5;
  int var0;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  OS_dispatch_source *retryTimer;
  NSObject *v14;
  OS_dispatch_source *v15;
  OS_dispatch_source *v16;
  OS_dispatch_source *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  _QWORD handler[5];

  retryCount = self->_retryCount;
  if (retryCount < 3)
  {
    v5 = retryCount + 1;
    self->_retryCount = v5;
    var0 = self->_ucat->var0;
    if (var0 <= 50)
    {
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_11;
        v5 = self->_retryCount;
      }
      v20 = v5;
      LogPrintF();
    }
LABEL_11:
    v7 = ((uint64_t (*)(uint64_t, uint64_t))softLinkBTPairingAgentDeletePairedDevice[0])((uint64_t)self->_btPairingAgent, (uint64_t)self->_btDevice);
    if (v7)
    {
      v8 = v7;
      v9 = self->_ucat->var0;
      if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
      {
        v20 = (v8 + 310000);
        LogPrintF();
      }
    }
    if (self->_timeoutTimer)
    {
      v10 = self->_ucat->var0;
      if (v10 <= 50 && (v10 != -1 || _LogCategory_Initialize()))
      {
        v20 = 15;
        LogPrintF();
      }
      SFDispatchTimerSet(self->_timeoutTimer, 15.0, -1.0, -10.0);
    }
    v11 = self->_ucat->var0;
    if (self->_btSession)
    {
      if (v11 <= 50 && (v11 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[SFBluetoothPairingSession _btEnsureStopped](self, "_btEnsureStopped", v20);
    }
    else if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v12 = self->_ucat->var0;
    if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    retryTimer = self->_retryTimer;
    if (retryTimer)
    {
      v14 = retryTimer;
      dispatch_source_cancel(v14);
      v15 = self->_retryTimer;
      self->_retryTimer = 0;

    }
    v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v17 = self->_retryTimer;
    self->_retryTimer = v16;

    v18 = self->_retryTimer;
    if (v18)
    {
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __53__SFBluetoothPairingSession__btDeletePairingAndRetry__block_invoke;
      handler[3] = &unk_1E482DF78;
      handler[4] = self;
      dispatch_source_set_event_handler(v18, handler);
      SFDispatchTimerSet(self->_retryTimer, 2.0, -1.0, -10.0);
      dispatch_resume((dispatch_object_t)self->_retryTimer);
    }
    else
    {
      v19 = self->_ucat->var0;
      if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
        goto LABEL_44;
    }
    return;
  }
  v4 = self->_ucat->var0;
  if (v4 <= 60 && (v4 != -1 || _LogCategory_Initialize()))
LABEL_44:
    LogPrintF();
}

uint64_t __53__SFBluetoothPairingSession__btDeletePairingAndRetry__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = 0;

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = **(_DWORD **)(v6 + 136);
  if (*(_QWORD *)(v6 + 80))
  {
    if (v7 <= 30)
    {
      if (v7 != -1 || (v8 = _LogCategory_Initialize(), v6 = *(_QWORD *)(a1 + 32), v8))
      {
        LogPrintF();
        v6 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v6 + 96) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "_btEnsureStopped");
  }
  else
  {
    if (v7 <= 30)
    {
      if (v7 != -1 || (v10 = _LogCategory_Initialize(), v6 = *(_QWORD *)(a1 + 32), v10))
      {
        LogPrintF();
        v6 = *(_QWORD *)(a1 + 32);
      }
    }
    *(_BYTE *)(v6 + 96) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "_btEnsureStarted");
  }
}

- (BOOL)aggregate
{
  return self->_aggregate;
}

- (void)setAggregate:(BOOL)a3
{
  self->_aggregate = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)connectOnly
{
  return self->_connectOnly;
}

- (void)setConnectOnly:(BOOL)a3
{
  self->_connectOnly = a3;
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unsigned)deviceVersion
{
  return self->_deviceVersion;
}

- (BOOL)disconnectOnly
{
  return self->_disconnectOnly;
}

- (void)setDisconnectOnly:(BOOL)a3
{
  self->_disconnectOnly = a3;
}

- (BOOL)unpairOnly
{
  return self->_unpairOnly;
}

- (void)setUnpairOnly:(BOOL)a3
{
  self->_unpairOnly = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)guestAddress
{
  return self->_guestAddress;
}

- (void)setGuestAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSData)guestKey
{
  return self->_guestKey;
}

- (void)setGuestKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (BOOL)guestMode
{
  return self->_guestMode;
}

- (void)setGuestMode:(BOOL)a3
{
  self->_guestMode = a3;
}

- (BOOL)inEarDetection
{
  return self->_inEarDetection;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)softwareVolume
{
  return self->_softwareVolume;
}

- (BOOL)userNotInContacts
{
  return self->_userNotInContacts;
}

- (void)setUserNotInContacts:(BOOL)a3
{
  self->_userNotInContacts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guestKey, 0);
  objc_storeStrong((id *)&self->_guestAddress, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_wpClient, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
}

@end
