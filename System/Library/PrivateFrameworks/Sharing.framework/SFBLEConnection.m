@implementation SFBLEConnection

- (SFBLEConnection)initWithDevice:(id)a3 acceptor:(BOOL)a4
{
  id v7;
  SFBLEConnection *v8;
  SFBLEConnection *v9;
  uint64_t v10;
  OS_dispatch_queue *dispatchQueue;
  void *v12;
  SFBLEConnection *v13;
  objc_super v15;
  int v16;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v17 = 0;
  v18[0] = 0;
  v18[1] = 0;
  v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)SFBLEConnection;
  v8 = -[SFBLEConnection init](&v15, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_6;
  v8->_acceptor = a4;
  v8->_bleEncrypted = 1;
  SFMainQueue(v8);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatchQueue = v9->_dispatchQueue;
  v9->_dispatchQueue = (OS_dispatch_queue *)v10;

  objc_storeStrong((id *)&v9->_peerDevice, a3);
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getUUIDBytes:", v18);

  ASPrintF();
  if (v17)
  {
    v9->_ucat = (LogCategory *)LogCategoryCreateEx();
    free(v17);
    v13 = 0;
    if (!v16)
      v13 = v9;
  }
  else
  {
LABEL_6:
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  LogCategory *ucat;
  SFBLEConnection *v4;
  SEL v5;
  objc_super v6;

  if (self->_connectRetrier)
  {
    FatalErrorF();
    goto LABEL_8;
  }
  if (self->_wpNearby)
  {
LABEL_8:
    v4 = (SFBLEConnection *)FatalErrorF();
    -[SFBLEConnection description](v4, v5);
    return;
  }
  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SFBLEConnection;
  -[SFBLEConnection dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;

  -[SFBLEDevice identifier](self->_peerDevice, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet count](self->_clients, "count");
  NSPrintF();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setAcceptor:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __31__SFBLEConnection_setAcceptor___block_invoke;
  v4[3] = &unk_1E482E4B8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

void __31__SFBLEConnection_setAcceptor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const char *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  _QWORD v15[4];
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 80);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v6 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v6))
    {
      v4 = "yes";
      if (*(_BYTE *)(v2 + 8))
        v5 = "yes";
      else
        v5 = "no";
      if (!*(_BYTE *)(a1 + 40))
        v4 = "no";
      v13 = v5;
      v14 = v4;
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v2 + 8) = *(_BYTE *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 9))
  {
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*(id *)(v7 + 40), "invalidate");
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

    }
    else
    {
      if (!*(_QWORD *)(v7 + 40))
      {
        v10 = objc_alloc_init(MEMORY[0x1E0D1B430]);
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDispatchQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __31__SFBLEConnection_setAcceptor___block_invoke_2;
        v15[3] = &unk_1E482DF78;
        v16 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(v16 + 40), "setActionHandler:", v15);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setInterval:", 3.0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "startDirect");
        v7 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend((id)v7, "_processQueuedData", v13, v14);
    }
  }
}

uint64_t __31__SFBLEConnection_setAcceptor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectIfNeeded");
}

- (int64_t)connectionState
{
  if (self->_connected)
    return 1;
  else
    return 2;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  SFBLEConnection *obj;

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

- (void)activate
{
  SFBLEConnection *v2;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SFBLEConnection_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);

}

uint64_t __27__SFBLEConnection_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)activateDirect
{
  SFBLEConnection *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = self;
  objc_sync_enter(v3);
  v3->_activateCalled = 1;
  objc_sync_exit(v3);

  -[SFBLEConnection _activate](v3, "_activate");
}

- (void)_activate
{
  int var0;
  void *v4;
  WPNearby *v5;
  WPNearby *wpNearby;
  NSMutableArray *v7;
  NSMutableArray *dataSendQueue;
  void (**connectionStateChangedHandler)(id, uint64_t);
  CURetrier *v10;
  CURetrier *connectRetrier;
  _QWORD v12[5];

  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (!self->_wpNearby)
    {
      +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addNearbyDelegate:", self);
      v5 = (WPNearby *)objc_claimAutoreleasedReturnValue();
      wpNearby = self->_wpNearby;
      self->_wpNearby = v5;

    }
    if (!self->_dataSendQueue)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      dataSendQueue = self->_dataSendQueue;
      self->_dataSendQueue = v7;

    }
    if (self->_acceptor)
    {
      self->_connected = 1;
      connectionStateChangedHandler = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
      if (connectionStateChangedHandler)
        connectionStateChangedHandler[2](connectionStateChangedHandler, 1);
    }
    else if (!self->_connectRetrier)
    {
      v10 = (CURetrier *)objc_alloc_init(MEMORY[0x1E0D1B430]);
      connectRetrier = self->_connectRetrier;
      self->_connectRetrier = v10;

      -[CURetrier setDispatchQueue:](self->_connectRetrier, "setDispatchQueue:", self->_dispatchQueue);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __28__SFBLEConnection__activate__block_invoke;
      v12[3] = &unk_1E482DF78;
      v12[4] = self;
      -[CURetrier setActionHandler:](self->_connectRetrier, "setActionHandler:", v12);
      -[CURetrier setInterval:](self->_connectRetrier, "setInterval:", 3.0);
      -[CURetrier startDirect](self->_connectRetrier, "startDirect");
    }
    -[SFBLEConnection _processQueuedData](self, "_processQueuedData");
  }
}

uint64_t __28__SFBLEConnection__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectIfNeeded");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SFBLEConnection_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SFBLEConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;
  CURetrier *connectRetrier;
  NSMutableArray *dataSendQueue;
  int v6;
  WPNearby *wpNearby;
  void *v8;
  WPNearby *v9;
  void *v10;
  int v11;
  void (**invalidationHandler)(void);
  id bluetoothBandwidthChangedHandler;
  id bluetoothStateChangedHandler;
  NSMutableSet *clients;
  id connectionStateChangedHandler;
  id dataHandler;
  id v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_invalidateCalled = 1;
    -[CURetrier invalidateDirect](self->_connectRetrier, "invalidateDirect");
    connectRetrier = self->_connectRetrier;
    self->_connectRetrier = 0;

    -[SFBLEConnection _cleanupQueuedData:](self, "_cleanupQueuedData:", 4294960573);
    dataSendQueue = self->_dataSendQueue;
    self->_dataSendQueue = 0;

    if (self->_connected || self->_connecting)
    {
      *(_WORD *)&self->_connected = 0;
      v6 = self->_ucat->var0;
      if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      wpNearby = self->_wpNearby;
      -[SFBLEDevice identifier](self->_peerDevice, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPNearby disconnectFromPeer:](wpNearby, "disconnectFromPeer:", v8);

    }
    v9 = self->_wpNearby;
    if (v9)
    {
      +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeNearbyDelegate:", self);

      v9 = self->_wpNearby;
    }
    self->_wpNearby = 0;

    v11 = self->_ucat->var0;
    if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    bluetoothBandwidthChangedHandler = self->_bluetoothBandwidthChangedHandler;
    self->_bluetoothBandwidthChangedHandler = 0;

    bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_bluetoothStateChangedHandler = 0;

    clients = self->_clients;
    self->_clients = 0;

    connectionStateChangedHandler = self->_connectionStateChangedHandler;
    self->_connectionStateChangedHandler = 0;

    dataHandler = self->_dataHandler;
    self->_dataHandler = 0;

    v18 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
}

- (void)sendData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFBLEConnection_sendData_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __39__SFBLEConnection_sendData_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendDataDirect:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)sendDataDirect:(id)a3 completion:(id)a4
{
  id v6;
  SFBLEData *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v7 = objc_alloc_init(SFBLEData);
    -[SFBLEData setData:](v7, "setData:", v8);
    -[SFBLEData setCompletion:](v7, "setCompletion:", v6);
    -[NSMutableArray addObject:](self->_dataSendQueue, "addObject:", v7);
    -[SFBLEConnection _processQueuedData](self, "_processQueuedData");

  }
}

- (void)_connectIfNeeded
{
  int var0;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  WPNearby *wpNearby;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[CURetrier succeededDirect](self->_connectRetrier, "succeededDirect");
  if (!self->_connected && !self->_connecting && -[WPNearby state](self->_wpNearby, "state") == 3)
  {
    self->_connecting = 1;
    kdebug_trace();
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_bleEncrypted);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kCBConnectOptionEncryptionEnabled"));

    if ((self->_sessionFlags & 0x1000) != 0)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kCBConnectOptionDoNoDisconnectOnEncryptionFailure"));
    if (self->_latencyCritical)
    {
      getWPNearbyKeyConnectLatencyCritical[0]();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v6);

    }
    if (self->_lePipeCapable)
    {
      getWPNearbyLEPipeCapable[0]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);

    }
    if (self->_useCase)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      getWPNearbyKeyUseCaseList[0]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);

    }
    v11 = self->_ucat->var0;
    if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_connectStartTime = CFAbsoluteTimeGetCurrent();
    wpNearby = self->_wpNearby;
    -[SFBLEDevice identifier](self->_peerDevice, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WPNearby connectToPeer:withOptions:](wpNearby, "connectToPeer:withOptions:", v13, v4);

  }
}

- (void)_processQueuedData
{
  SFBLEData *v3;
  SFBLEData *currentData;
  int var0;
  void *v6;
  void *v7;
  void *v8;
  WPNearby *wpNearby;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_connected && !self->_currentData)
  {
    -[NSMutableArray firstObject](self->_dataSendQueue, "firstObject");
    v3 = (SFBLEData *)objc_claimAutoreleasedReturnValue();
    currentData = self->_currentData;
    self->_currentData = v3;

    if (self->_currentData)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_dataSendQueue, "removeObjectAtIndex:", 0);
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        -[SFBLEData data](self->_currentData, "data");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFBLEData data](self->_currentData, "data");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v6;
        v12 = objc_msgSend(v7, "length");
        LogPrintF();

      }
      -[SFBLEData data](self->_currentData, "data", v11, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "length");
      kdebug_trace();

      wpNearby = self->_wpNearby;
      -[SFBLEData data](self->_currentData, "data");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      -[SFBLEDevice identifier](self->_peerDevice, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WPNearby sendData:toPeer:](wpNearby, "sendData:toPeer:", v13, v10);

    }
  }
}

- (void)_cleanupQueuedData:(int)a3
{
  SFBLEData *currentData;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  SFBLEData *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  SFBLEConnection *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  const __CFString *v40;
  _BYTE v41[128];
  uint64_t v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  currentData = self->_currentData;
  if (currentData)
  {
    -[SFBLEData completion](currentData, "completion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SFBLEData completion](self->_currentData, "completion");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void (**)(_QWORD, _QWORD))v7;
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = *MEMORY[0x1E0CB2F90];
        v42 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = CFSTR("?");
        if (v11)
          v13 = (const __CFString *)v11;
        v43[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, a3, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v8)[2](v8, v15);

      }
      else
      {
        (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
      }

    }
    v16 = self->_currentData;
    self->_currentData = 0;

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = self;
  v17 = self->_dataSendQueue;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    v34 = *MEMORY[0x1E0CB2F90];
    v21 = *MEMORY[0x1E0CB2D50];
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v23, "completion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v23, "completion");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void (**)(_QWORD, _QWORD))v25;
          if (a3)
          {
            v27 = (void *)MEMORY[0x1E0CB35C8];
            v39 = v21;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v28;
            v30 = CFSTR("?");
            if (v28)
              v30 = (const __CFString *)v28;
            v40 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "errorWithDomain:code:userInfo:", v34, a3, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v26)[2](v26, v32);

          }
          else
          {
            (*(void (**)(uint64_t, _QWORD))(v25 + 16))(v25, 0);
          }

        }
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v19);
  }

  -[NSMutableArray removeAllObjects](v33->_dataSendQueue, "removeAllObjects");
}

- (void)addClient:(id)a3
{
  SFBLEConnection *v4;
  NSMutableSet *clients;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  clients = v4->_clients;
  if (!clients)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = v4->_clients;
    v4->_clients = v6;

    clients = v4->_clients;
  }
  -[NSMutableSet addObject:](clients, "addObject:", v8);
  objc_sync_exit(v4);

}

- (BOOL)removeClient:(id)a3
{
  id v4;
  SFBLEConnection *v5;
  BOOL v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableSet removeObject:](v5->_clients, "removeObject:", v4);
  v6 = -[NSMutableSet count](v5->_clients, "count") != 0;
  objc_sync_exit(v5);

  return v6;
}

- (void)nearbyDidChangeBluetoothBandwidthState:(id)a3
{
  WPNearby *wpNearby;
  BOOL v5;
  uint64_t v6;
  int var0;
  void (**bluetoothBandwidthChangedHandler)(id, uint64_t);
  WPNearby *v9;

  v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpNearby = self->_wpNearby;
  if (wpNearby)
    v5 = wpNearby == v9;
  else
    v5 = 0;
  if (v5)
  {
    v6 = -[WPNearby btBandwidthState](v9, "btBandwidthState");
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    bluetoothBandwidthChangedHandler = (void (**)(id, uint64_t))self->_bluetoothBandwidthChangedHandler;
    if (bluetoothBandwidthChangedHandler)
      bluetoothBandwidthChangedHandler[2](bluetoothBandwidthChangedHandler, v6);
  }

}

- (void)nearbyDidUpdateState:(id)a3
{
  WPNearby *wpNearby;
  BOOL v5;
  unint64_t v6;
  int var0;
  int v8;
  void (**bluetoothStateChangedHandler)(id, unint64_t);
  WPNearby *v10;

  v10 = (WPNearby *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpNearby = self->_wpNearby;
  if (wpNearby)
    v5 = wpNearby == v10;
  else
    v5 = 0;
  if (v5)
  {
    v6 = -[WPNearby state](v10, "state");
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v6 <= 5)
    {
      if (((1 << v6) & 0x36) != 0)
      {
        if (self->_connecting || self->_connected)
        {
          *(_WORD *)&self->_connected = 0;
          v8 = self->_ucat->var0;
          if (v8 <= 60 && (v8 != -1 || _LogCategory_Initialize()))
            LogPrintF();
        }
      }
      else if (v6 == 3 && !self->_acceptor)
      {
        -[SFBLEConnection _connectIfNeeded](self, "_connectIfNeeded");
      }
    }
    bluetoothStateChangedHandler = (void (**)(id, unint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler)
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
  }

}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v9;
  id v10;
  NSObject *dispatchQueue;
  WPNearby *v12;
  SFBLEDevice *v13;
  WPNearby *wpNearby;
  void *v15;
  int v16;
  int var0;
  double v18;
  int v19;
  int v20;
  int v21;
  void (**v22)(id, uint64_t);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(id, uint64_t);
  void (**connectionStateChangedHandler)(id, uint64_t);
  double v29;
  id v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  dispatchQueue = self->_dispatchQueue;
  v12 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v13 = self->_peerDevice;
  wpNearby = self->_wpNearby;

  if (wpNearby)
  {
    if (wpNearby == v12)
    {
      -[SFBLEDevice identifier](v13, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v9);

      if (v16)
      {
        self->_connecting = 0;
        if (self->_acceptor)
        {
          if (v10)
          {
            var0 = self->_ucat->var0;
            if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
              LogPrintF();
          }
          else
          {
            if (!self->_connected)
            {
              self->_connected = 1;
              v20 = self->_ucat->var0;
              if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
                LogPrintF();
            }
            connectionStateChangedHandler = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
            if (connectionStateChangedHandler)
              connectionStateChangedHandler[2](connectionStateChangedHandler, 1);
            -[SFBLEConnection _processQueuedData](self, "_processQueuedData");
          }
        }
        else
        {
          v18 = CFAbsoluteTimeGetCurrent() - self->_connectStartTime;
          self->_connected = v10 == 0;
          if (v10)
          {
            v19 = self->_ucat->var0;
            if (v19 <= 50 && (v19 != -1 || _LogCategory_Initialize()))
            {
              v30 = v10;
              v29 = v18;
              LogPrintF();
            }
            v22 = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
            if (v22)
              v22[2](v22, 2);
            -[CURetrier failedDirect](self->_connectRetrier, "failedDirect", *(_QWORD *)&v29, v30);
          }
          else
          {
            kdebug_trace();
            v21 = self->_ucat->var0;
            if (v21 <= 30 && (v21 != -1 || _LogCategory_Initialize()))
            {
              v29 = v18;
              LogPrintF();
            }
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", *(_QWORD *)&v29);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = CFSTR("SFBluetoothNotificationKeyConnectStart");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_connectStartTime);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v32[0] = v24;
            v31[1] = CFSTR("SFBluetoothNotificationKeyConnectTime");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v31[2] = CFSTR("SFBluetoothNotificationKeyPeerDevice");
            v32[1] = v25;
            v32[2] = v13;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "postNotificationName:object:userInfo:", CFSTR("SFBluetoothNotificationNameConnected"), self, v26);

            -[CURetrier succeededDirect](self->_connectRetrier, "succeededDirect");
            v27 = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
            if (v27)
              v27[2](v27, 1);
            -[SFBLEConnection _processQueuedData](self, "_processQueuedData");

          }
        }
      }
    }
  }

}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  WPNearby *v11;
  WPNearby *wpNearby;
  SFBLEDevice *v13;
  void *v14;
  int v15;
  int var0;
  void (**connectionStateChangedHandler)(id, uint64_t);
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v11 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  v13 = 0;
  if (!wpNearby)
    goto LABEL_17;
  if (wpNearby != v11)
    goto LABEL_17;
  v13 = self->_peerDevice;
  -[SFBLEDevice identifier](v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v8);

  if (!v15)
    goto LABEL_17;
  *(_WORD *)&self->_connected = 0;
  var0 = self->_ucat->var0;
  if (v9)
  {
    if (var0 > 50 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_14;
    v20 = v9;
  }
  else if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_14;
  }
  LogPrintF();
LABEL_14:
  -[SFBLEConnection _cleanupQueuedData:](self, "_cleanupQueuedData:", 4294960543, v20);
  connectionStateChangedHandler = (void (**)(id, uint64_t))self->_connectionStateChangedHandler;
  if (connectionStateChangedHandler)
    connectionStateChangedHandler[2](connectionStateChangedHandler, 2);
  -[CURetrier failedDirect](self->_connectRetrier, "failedDirect");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("SFBluetoothNotificationKeyPeerDevice");
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("SFBluetoothNotificationNameDisconnected"), self, v19);

LABEL_17:
}

- (void)nearby:(id)a3 didSendData:(id)a4 toPeer:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  NSObject *dispatchQueue;
  WPNearby *v13;
  WPNearby *wpNearby;
  void *v15;
  int v16;
  int var0;
  int v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  SFBLEData *currentData;
  id v22;
  uint64_t v23;
  id v24;
  id v25;

  v25 = a4;
  v10 = a5;
  v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  v13 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (!wpNearby)
    goto LABEL_24;
  if (wpNearby != v13)
    goto LABEL_24;
  -[SFBLEDevice identifier](self->_peerDevice, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", v10);

  if (!v16)
    goto LABEL_24;
  if (self->_currentData)
  {
    objc_msgSend(v25, "length");
    kdebug_trace();
    var0 = self->_ucat->var0;
    if (v11)
    {
      if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize())
        goto LABEL_21;
      v23 = objc_msgSend(v25, "length");
      v24 = v11;
      v22 = v25;
    }
    else
    {
      if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
        goto LABEL_21;
      v23 = objc_msgSend(v25, "length");
      v22 = v25;
    }
    LogPrintF();
LABEL_21:
    -[SFBLEData completion](self->_currentData, "completion", v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[SFBLEData completion](self->_currentData, "completion");
      v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v20)[2](v20, v11);

    }
    currentData = self->_currentData;
    self->_currentData = 0;

    goto LABEL_24;
  }
  v18 = self->_ucat->var0;
  if (v18 <= 50 && (v18 != -1 || _LogCategory_Initialize()))
  {
    v23 = objc_msgSend(v25, "length");
    v24 = v11;
    v22 = v25;
    LogPrintF();
  }
LABEL_24:
  -[SFBLEConnection _processQueuedData](self, "_processQueuedData", v22, v23, v24);

}

- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v8;
  NSObject *dispatchQueue;
  WPNearby *v10;
  WPNearby *wpNearby;
  void *v12;
  int v13;
  void (**dataHandler)(id, id);
  id v15;

  v15 = a4;
  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v10 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
  {
    if (wpNearby == v10)
    {
      -[SFBLEDevice identifier](self->_peerDevice, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v8);

      if (v13)
      {
        dataHandler = (void (**)(id, id))self->_dataHandler;
        if (dataHandler)
          dataHandler[2](dataHandler, v15);
      }
    }
  }
  -[SFBLEConnection _processQueuedData](self, "_processQueuedData");

}

- (BOOL)acceptor
{
  return self->_acceptor;
}

- (id)bluetoothBandwidthChangedHandler
{
  return self->_bluetoothBandwidthChangedHandler;
}

- (void)setBluetoothBandwidthChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)connectionStateChangedHandler
{
  return self->_connectionStateChangedHandler;
}

- (void)setConnectionStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)dataHandler
{
  return self->_dataHandler;
}

- (void)setDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (SFBLEDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (unsigned)sessionFlags
{
  return self->_sessionFlags;
}

- (void)setSessionFlags:(unsigned int)a3
{
  self->_sessionFlags = a3;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unsigned int)a3
{
  self->_useCase = a3;
}

- (BOOL)bleEncrypted
{
  return self->_bleEncrypted;
}

- (void)setBleEncrypted:(BOOL)a3
{
  self->_bleEncrypted = a3;
}

- (BOOL)latencyCritical
{
  return self->_latencyCritical;
}

- (void)setLatencyCritical:(BOOL)a3
{
  self->_latencyCritical = a3;
}

- (BOOL)lePipeCapable
{
  return self->_lePipeCapable;
}

- (void)setLePipeCapable:(BOOL)a3
{
  self->_lePipeCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_dataHandler, 0);
  objc_storeStrong(&self->_connectionStateChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothBandwidthChangedHandler, 0);
  objc_storeStrong((id *)&self->_wpNearby, 0);
  objc_storeStrong((id *)&self->_dataSendQueue, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_connectRetrier, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
