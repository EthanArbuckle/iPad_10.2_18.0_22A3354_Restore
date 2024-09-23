@implementation SFBLEPipe

- (SFBLEPipe)init
{
  return -[SFBLEPipe initWithPriority:](self, "initWithPriority:", 2);
}

- (SFBLEPipe)initWithPriority:(int64_t)a3
{
  SFBLEPipe *v4;
  SFBLEPipe *v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFBLEPipe;
  v4 = -[SFBLEPipe init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    SFMainQueue(v4);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    v5->_ucat = (LogCategory *)&gLogCategory_SFBLEPipe;
    v5->_btPipePriority = a3;
  }
  return v5;
}

- (void)dealloc
{
  LogCategory *ucat;
  SFBLEPipe *v4;
  SEL v5;
  objc_super v6;

  if (self->_btPipe)
  {
    v4 = (SFBLEPipe *)FatalErrorF();
    -[SFBLEPipe description](v4, v5);
  }
  else
  {
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
    v6.super_class = (Class)SFBLEPipe;
    -[SFBLEPipe dealloc](&v6, sel_dealloc);
  }
}

- (NSString)description
{
  return (NSString *)NSPrintF();
}

- (int64_t)connectionState
{
  if (self->_btConnected)
    return 1;
  else
    return 2;
}

- (id)getPeerUUID
{
  CBScalablePipe *btPipe;
  void *v3;
  void *v4;

  btPipe = self->_btPipe;
  if (btPipe)
  {
    -[CBScalablePipe peer](btPipe, "peer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  SFBLEPipe *obj;

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

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

  -[NSString UTF8String](self->_identifier, "UTF8String");
  ASPrintF();
}

- (void)activate
{
  SFBLEPipe *v2;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__SFBLEPipe_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);

}

uint64_t __21__SFBLEPipe_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  int var0;
  NSMutableArray *v4;
  NSMutableArray *btWriteQueue;
  CBCentralManager *v6;
  CBCentralManager *btCentral;
  CBScalablePipeManager *v8;
  CBScalablePipeManager *btPipeManager;

  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (!self->_btWriteQueue)
    {
      v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      btWriteQueue = self->_btWriteQueue;
      self->_btWriteQueue = v4;

    }
    if (!self->_btCentral)
    {
      v6 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)getCBCentralManagerClass[0]()), "initWithDelegate:queue:", self, self->_dispatchQueue);
      btCentral = self->_btCentral;
      self->_btCentral = v6;

    }
    if (!self->_btPipeManager)
    {
      v8 = (CBScalablePipeManager *)objc_msgSend(objc_alloc((Class)getCBScalablePipeManagerClass[0]()), "initWithDelegate:queue:", self, self->_dispatchQueue);
      btPipeManager = self->_btPipeManager;
      self->_btPipeManager = v8;

    }
    -[SFBLEPipe _setupIfNeeded](self, "_setupIfNeeded");
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SFBLEPipe_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__SFBLEPipe_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSMutableArray *btWriteQueue;
  NSString *v21;
  CBScalablePipeManager *btPipeManager;
  CBScalablePipe *btPipe;
  CBCentralManager *btCentral;
  NSMutableDictionary *frameHandlers;
  int v26;
  void (**invalidationHandler)(void);
  id bluetoothStateChangedHandler;
  id connectionStateChangedHandler;
  id frameHandler;
  id v31;
  SFBLEPipe *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_invalidateCalled = 1;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = self;
    v4 = self->_btWriteQueue;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v34;
      v8 = *MEMORY[0x1E0CB2F90];
      v9 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v11, "completion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "completion");
            v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0CB35C8];
            v37 = v9;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            v17 = CFSTR("?");
            if (v15)
              v17 = (const __CFString *)v15;
            v38 = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "errorWithDomain:code:userInfo:", v8, -6723, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v13)[2](v13, v19);

          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v6);
    }

    -[NSMutableArray removeAllObjects](v32->_btWriteQueue, "removeAllObjects");
    btWriteQueue = v32->_btWriteQueue;
    v32->_btWriteQueue = 0;

    v21 = v32->_identifier;
    -[SFBLEPipe _tearDownPipe](v32, "_tearDownPipe");
    if (v21 && (v32->_btEndpointRegistered || v32->_btEndpointRegistering))
      -[CBScalablePipeManager unregisterEndpoint:](v32->_btPipeManager, "unregisterEndpoint:", v21);
    *(_WORD *)&v32->_btEndpointRegistering = 0;
    -[CBScalablePipeManager setDelegate:](v32->_btPipeManager, "setDelegate:", 0);
    btPipeManager = v32->_btPipeManager;
    v32->_btPipeManager = 0;

    btPipe = v32->_btPipe;
    v32->_btPipe = 0;

    btCentral = v32->_btCentral;
    v32->_btCentral = 0;

    -[NSMutableDictionary removeAllObjects](v32->_frameHandlers, "removeAllObjects");
    frameHandlers = v32->_frameHandlers;
    v32->_frameHandlers = 0;

    v26 = v32->_ucat->var0;
    if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    invalidationHandler = (void (**)(void))v32->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    bluetoothStateChangedHandler = v32->_bluetoothStateChangedHandler;
    v32->_bluetoothStateChangedHandler = 0;

    connectionStateChangedHandler = v32->_connectionStateChangedHandler;
    v32->_connectionStateChangedHandler = 0;

    frameHandler = v32->_frameHandler;
    v32->_frameHandler = 0;

    v31 = v32->_invalidationHandler;
    v32->_invalidationHandler = 0;

  }
}

- (void)addFrameHandlerForType:(unsigned __int8)a3 handler:(id)a4
{
  uint64_t v4;
  SFBLEPipe *v6;
  const void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *frameHandlers;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id aBlock;

  v4 = a3;
  aBlock = a4;
  v6 = self;
  objc_sync_enter(v6);
  v7 = aBlock;
  if (!v6->_frameHandlers)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    frameHandlers = v6->_frameHandlers;
    v6->_frameHandlers = v8;

    v7 = aBlock;
  }
  v10 = _Block_copy(v7);
  v11 = v6->_frameHandlers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  objc_sync_exit(v6);
}

- (void)removeFrameHandlerForType:(unsigned __int8)a3
{
  uint64_t v3;
  NSMutableDictionary *frameHandlers;
  void *v5;
  SFBLEPipe *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  frameHandlers = obj->_frameHandlers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](frameHandlers, "removeObjectForKey:", v5);

  objc_sync_exit(obj);
}

- (void)sendFrameType:(unsigned __int8)a3 payload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a4;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__SFBLEPipe_sendFrameType_payload_completion___block_invoke;
  v13[3] = &unk_1E4831200;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __46__SFBLEPipe_sendFrameType_payload_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendFrameTypeDirect:payload:completion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendFrameType:(unsigned __int8)a3 payload:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  int var0;
  unint64_t v11;
  unint64_t v12;
  int v13;
  void *v14;
  SFBLEData *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  v29 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v9)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2F90];
      v32 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v18 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v18;
      v19 = CFSTR("?");
      if (v18)
        v19 = (const __CFString *)v18;
      v33[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v15 = (SFBLEData *)objc_claimAutoreleasedReturnValue();
      v20 = v16;
      v21 = v17;
      v22 = -6709;
LABEL_20:
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v27);

      goto LABEL_21;
    }
  }
  else
  {
    v11 = objc_msgSend(v8, "length");
    v12 = v11;
    if (v11 < 0x989681)
    {
      LOBYTE(v29) = a3;
      BYTE1(v29) = BYTE2(v11);
      BYTE2(v29) = BYTE1(v11);
      HIBYTE(v29) = v11;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", &v29, 4);
      objc_msgSend(v14, "appendData:", v8);
      v15 = objc_alloc_init(SFBLEData);
      -[SFBLEData setData:](v15, "setData:", v14);
      -[SFBLEData setCompletion:](v15, "setCompletion:", v9);
      -[NSMutableArray addObject:](self->_btWriteQueue, "addObject:", v15);
      -[SFBLEPipe _writeHandler](self, "_writeHandler");
LABEL_21:

      goto LABEL_22;
    }
    v13 = self->_ucat->var0;
    if (v13 <= 50 && (v13 != -1 || _LogCategory_Initialize()))
    {
      v28 = v12;
      LogPrintF();
    }
    if (v9)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2F90];
      v30 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v25 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v25;
      v26 = CFSTR("?");
      if (v25)
        v26 = (const __CFString *)v25;
      v31 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, v28);
      v15 = (SFBLEData *)objc_claimAutoreleasedReturnValue();
      v20 = v23;
      v21 = v24;
      v22 = -6743;
      goto LABEL_20;
    }
  }
LABEL_22:

}

- (void)_setupIfNeeded
{
  int var0;
  NSString *v4;
  NSString *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CBCentralManager *btCentral;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!self->_btEndpointRegistered
    && !self->_btEndpointRegistering
    && -[CBScalablePipeManager state](self->_btPipeManager, "state") == 5)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = self->_identifier;
    if (!v4)
    {
      v16 = self->_ucat->var0;
      if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      return;
    }
    v5 = v4;
    v6 = self->_btCentral == 0;
    getCBScalablePipeOptionTransport[0]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7;
    v20[0] = &unk_1E4890898;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CBScalablePipeManager registerEndpoint:type:priority:options:](self->_btPipeManager, "registerEndpoint:type:priority:options:", v5, v6, self->_btPipePriority, v8);
    self->_btEndpointRegistering = 1;

  }
  if (self->_manualConnect
    && self->_btEndpointRegistered
    && self->_btCentral
    && !self->_btConnected
    && !self->_btConnecting)
  {
    -[SFBLEPipe _defaultPairedDeviceBluetoothIdentifier](self, "_defaultPairedDeviceBluetoothIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      btCentral = self->_btCentral;
      v18 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBCentralManager retrievePeripheralsWithIdentifiers:](btCentral, "retrievePeripheralsWithIdentifiers:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = self->_ucat->var0;
      if (v14)
      {
        if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        kdebug_trace();
        -[CBCentralManager connectPeripheral:options:](self->_btCentral, "connectPeripheral:options:", v14, 0);
        self->_btConnecting = 1;

        goto LABEL_22;
      }
      if (v15 > 90 || v15 == -1 && !_LogCategory_Initialize())
      {
LABEL_22:

        return;
      }
    }
    else
    {
      v17 = self->_ucat->var0;
      if (v17 > 90 || v17 == -1 && !_LogCategory_Initialize())
        goto LABEL_22;
    }
    LogPrintF();
    goto LABEL_22;
  }
}

- (void)_setupPipe:(id)a3
{
  id v5;
  channel *v6;
  channel_ring_desc *v7;
  channel_ring_desc *v8;
  unsigned int fd;
  OS_dispatch_source *v10;
  OS_dispatch_source *btReadSource;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  NSMutableData *btReadPayload;
  OS_dispatch_source *v17;
  OS_dispatch_source *btWriteSource;
  NSObject *v19;
  NSObject *v20;
  int v21;
  int var0;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  _QWORD handler[5];

  v5 = a3;
  -[SFBLEPipe _tearDownPipe](self, "_tearDownPipe");
  objc_storeStrong((id *)&self->_btPipe, a3);
  v6 = (channel *)objc_msgSend(v5, "channel");
  self->_btChannel = v6;
  if (!v6)
  {
    var0 = self->_ucat->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_25;
LABEL_24:
    LogPrintF();
    goto LABEL_25;
  }
  os_channel_ring_id();
  v7 = (channel_ring_desc *)os_channel_rx_ring();
  self->_btReadRing = v7;
  if (!v7)
  {
    v23 = self->_ucat->var0;
    if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize())
      goto LABEL_25;
    goto LABEL_24;
  }
  os_channel_ring_id();
  v8 = (channel_ring_desc *)os_channel_tx_ring();
  self->_btWriteRing = v8;
  if (!v8)
  {
    v24 = self->_ucat->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize())
      goto LABEL_25;
    goto LABEL_24;
  }
  fd = os_channel_get_fd();
  self->_btFD = fd;
  if ((fd & 0x80000000) != 0)
  {
    v25 = self->_ucat->var0;
    if (v25 > 60 || v25 == -1 && !_LogCategory_Initialize())
      goto LABEL_25;
    goto LABEL_24;
  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], fd, 0, (dispatch_queue_t)self->_dispatchQueue);
  btReadSource = self->_btReadSource;
  self->_btReadSource = v10;

  v12 = self->_btReadSource;
  if (v12)
  {
    v13 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __24__SFBLEPipe__setupPipe___block_invoke;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    v14 = self->_btReadSource;
    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __24__SFBLEPipe__setupPipe___block_invoke_2;
    v31[3] = &unk_1E482DF78;
    v15 = v5;
    v32 = v15;
    dispatch_source_set_cancel_handler(v14, v31);

    dispatch_resume((dispatch_object_t)self->_btReadSource);
    *(_OWORD *)&self->_btReadLen = xmmword_1A2AF7A00;
    btReadPayload = self->_btReadPayload;
    self->_btReadPayload = 0;

    v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DF0], self->_btFD, 0, (dispatch_queue_t)self->_dispatchQueue);
    btWriteSource = self->_btWriteSource;
    self->_btWriteSource = v17;

    v19 = self->_btWriteSource;
    if (v19)
    {
      v30[0] = v13;
      v30[1] = 3221225472;
      v30[2] = __24__SFBLEPipe__setupPipe___block_invoke_3;
      v30[3] = &unk_1E482DF78;
      v30[4] = self;
      dispatch_source_set_event_handler(v19, v30);
      v20 = self->_btWriteSource;
      v28[0] = v13;
      v28[1] = 3221225472;
      v28[2] = __24__SFBLEPipe__setupPipe___block_invoke_4;
      v28[3] = &unk_1E482DF78;
      v29 = v15;
      dispatch_source_set_cancel_handler(v20, v28);

      self->_btWriteSuspended = 1;
      v21 = self->_ucat->var0;
      if (v21 <= 50 && (v21 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[SFBLEPipe _writeHandler](self, "_writeHandler");
      goto LABEL_12;
    }
  }
LABEL_25:
  v26 = self->_ucat->var0;
  if (v26 <= 60 && (v26 != -1 || _LogCategory_Initialize()))
  {
    v27 = 4294960596;
    LogPrintF();
  }
  -[SFBLEPipe _tearDownPipe](self, "_tearDownPipe", v27);
LABEL_12:

}

uint64_t __24__SFBLEPipe__setupPipe___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readHandler");
}

uint64_t __24__SFBLEPipe__setupPipe___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeHandler");
}

- (void)_tearDownPipe
{
  int var0;
  CBScalablePipe *btPipe;
  NSMutableData *btReadPayload;
  OS_dispatch_source *btReadSource;
  NSObject *v7;
  OS_dispatch_source *v8;
  NSData *btWriteData;
  SFBLEData *btWriteItem;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  SFBLEData *v20;
  NSObject *btWriteSource;
  OS_dispatch_source *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (self->_btPipe)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  self->_btChannel = 0;
  self->_btFD = -1;
  btPipe = self->_btPipe;
  self->_btPipe = 0;

  btReadPayload = self->_btReadPayload;
  self->_btReadPayload = 0;

  self->_btReadRing = 0;
  btReadSource = self->_btReadSource;
  if (btReadSource)
  {
    v7 = btReadSource;
    dispatch_source_cancel(v7);
    v8 = self->_btReadSource;
    self->_btReadSource = 0;

  }
  btWriteData = self->_btWriteData;
  self->_btWriteData = 0;

  btWriteItem = self->_btWriteItem;
  if (btWriteItem)
  {
    -[SFBLEData completion](btWriteItem, "completion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SFBLEData completion](self->_btWriteItem, "completion");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2F90];
      v23 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("?");
      if (v15)
        v17 = (const __CFString *)v15;
      v24[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -6723, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v12)[2](v12, v19);

    }
    v20 = self->_btWriteItem;
    self->_btWriteItem = 0;

  }
  self->_btWritePtr = 0;
  self->_btWriteRing = 0;
  btWriteSource = self->_btWriteSource;
  if (btWriteSource)
  {
    dispatch_source_cancel(btWriteSource);
    if (self->_btWriteSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_btWriteSource);
      self->_btWriteSuspended = 0;
    }
    v22 = self->_btWriteSource;
    self->_btWriteSource = 0;

  }
}

- (void)_readHandler
{
  int var0;
  int v4;
  int v5;

  if (os_channel_get_next_slot())
  {
    while (os_channel_get_next_slot())
      ;
    if (os_channel_advance_slot())
    {
      var0 = self->_ucat->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    if (os_channel_sync())
    {
      v4 = self->_ucat->var0;
      if (v4 <= 60 && (v4 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
  v5 = self->_ucat->var0;
  if (v5 <= 10 && (v5 != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

- (void)_writeHandler
{
  uint64_t v3;
  SFBLEData *v4;
  SFBLEData *btWriteItem;
  NSData *v6;
  NSData *btWriteData;
  unint64_t btWriteLen;
  unint64_t btWriteOffset;
  unint64_t v10;
  size_t v11;
  const char *v12;
  int v13;
  int v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  SFBLEData *v17;
  int v18;
  int var0;
  unsigned __int16 v20;

  if (!self->_btWriteRing)
  {
    var0 = self->_ucat->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize())
      return;
LABEL_40:
    LogPrintF();
    return;
  }
  v3 = 0;
  while (1)
  {
    v20 = 0;
    if (!self->_btWriteItem)
    {
      -[NSMutableArray firstObject](self->_btWriteQueue, "firstObject");
      v4 = (SFBLEData *)objc_claimAutoreleasedReturnValue();
      btWriteItem = self->_btWriteItem;
      self->_btWriteItem = v4;

      if (!self->_btWriteItem)
        goto LABEL_32;
      -[NSMutableArray removeObjectAtIndex:](self->_btWriteQueue, "removeObjectAtIndex:", 0);
      -[SFBLEData data](self->_btWriteItem, "data");
      v6 = (NSData *)objc_claimAutoreleasedReturnValue();
      btWriteData = self->_btWriteData;
      self->_btWriteData = v6;

      self->_btWritePtr = (const char *)-[NSData bytes](self->_btWriteData, "bytes");
      self->_btWriteLen = -[NSData length](self->_btWriteData, "length");
      self->_btWriteOffset = 0;
      kdebug_trace();
    }
    btWriteLen = self->_btWriteLen;
    btWriteOffset = self->_btWriteOffset;
    v10 = btWriteLen - btWriteOffset;
    if (btWriteLen == btWriteOffset)
      break;
    if (!os_channel_get_next_slot())
      goto LABEL_46;
    do
    {
      if (v10 >= v20)
        v11 = v20;
      else
        v11 = v10;
      memcpy(0, self->_btWritePtr, v11);
      v20 = v11;
      os_channel_set_slot_properties();
      v12 = &self->_btWritePtr[v11];
      self->_btWriteOffset += v11;
      self->_btWritePtr = v12;
      v3 += v11;
      v10 -= v11;
    }
    while (v10 && os_channel_get_next_slot());
    if (os_channel_advance_slot())
    {
      v13 = self->_ucat->var0;
      if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    if (os_channel_sync())
    {
      v14 = self->_ucat->var0;
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    if (v10)
    {
LABEL_46:
      if (self->_btWriteSuspended)
      {
        self->_btWriteSuspended = 0;
        dispatch_resume((dispatch_object_t)self->_btWriteSource);
      }
      break;
    }
    kdebug_trace();
    -[SFBLEData completion](self->_btWriteItem, "completion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SFBLEData completion](self->_btWriteItem, "completion");
      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v16[2](v16, 0);

    }
    v17 = self->_btWriteItem;
    self->_btWriteItem = 0;

  }
  if (self->_btWriteItem)
    goto LABEL_34;
LABEL_32:
  if (!self->_btWriteSuspended)
  {
    self->_btWriteSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_btWriteSource);
  }
LABEL_34:
  v18 = self->_ucat->var0;
  if (v18 <= 10 && (v18 != -1 || _LogCategory_Initialize()))
    goto LABEL_40;
}

- (void)_frameHandler:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4;
  id v6;
  void (**frameHandler)(id, _QWORD, id);
  SFBLEPipe *v8;
  NSMutableDictionary *frameHandlers;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;

  v4 = a3;
  v6 = a4;
  frameHandler = (void (**)(id, _QWORD, id))self->_frameHandler;
  v12 = v6;
  if (frameHandler)
    frameHandler[2](frameHandler, v4, v6);
  v8 = self;
  objc_sync_enter(v8);
  frameHandlers = v8->_frameHandlers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](frameHandlers, "objectForKeyedSubscript:", v10);
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v11)
    ((void (**)(_QWORD, uint64_t, id))v11)[2](v11, v4, v12);

  objc_sync_exit(v8);
}

- (id)_defaultPairedDeviceBluetoothIdentifier
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc((Class)getIDSServiceClass[0]()), "initWithService:", CFSTR("com.apple.private.alloy.nearby"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v2, "devices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isDefaultPairedDevice"))
        {
          objc_msgSend(v8, "nsuuid");
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  CBCentralManager *btCentral;
  BOOL v5;
  int v6;
  int var0;
  CBCentralManager *v8;

  v8 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btCentral = self->_btCentral;
  if (btCentral)
    v5 = btCentral == v8;
  else
    v5 = 0;
  if (v5)
  {
    switch(-[CBCentralManager state](v8, "state"))
    {
      case 1:
        v6 = 0;
        break;
      case 2:
        v6 = 0;
        break;
      case 3:
        v6 = 0;
        break;
      case 4:
        v6 = 0;
        break;
      case 5:
        v6 = 1;
        break;
      default:
        v6 = 0;
        break;
    }
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v6)
      -[SFBLEPipe _setupIfNeeded](self, "_setupIfNeeded");
  }

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  NSObject *dispatchQueue;
  CBCentralManager *v7;
  CBCentralManager *btCentral;
  BOOL v9;
  int var0;
  id v11;

  v11 = a4;
  dispatchQueue = self->_dispatchQueue;
  v7 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  btCentral = self->_btCentral;

  if (btCentral)
    v9 = btCentral == v7;
  else
    v9 = 0;
  if (v9)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  NSObject *dispatchQueue;
  CBCentralManager *v10;
  CBCentralManager *btCentral;
  int var0;
  id v13;
  id v14;
  id v15;

  v15 = a4;
  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v10 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  btCentral = self->_btCentral;

  if (btCentral && btCentral == v10)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v13 = v15;
      v14 = v8;
      LogPrintF();
    }
    *(_WORD *)&self->_btConnected = 0;
    -[SFBLEPipe _setupIfNeeded](self, "_setupIfNeeded", v13, v14);
  }

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  __CFString *v8;
  NSObject *dispatchQueue;
  CBCentralManager *v10;
  CBCentralManager *btCentral;
  int var0;
  const __CFString *v13;
  id v14;
  const __CFString *v15;
  id v16;

  v16 = a4;
  v8 = (__CFString *)a5;
  dispatchQueue = self->_dispatchQueue;
  v10 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  btCentral = self->_btCentral;

  if (btCentral && btCentral == v10)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v13 = CFSTR("success");
      if (v8)
        v13 = v8;
      v14 = v16;
      v15 = v13;
      LogPrintF();
    }
    *(_WORD *)&self->_btConnected = 0;
    -[SFBLEPipe _setupIfNeeded](self, "_setupIfNeeded", v14, v15);
  }

}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  CBScalablePipeManager *v4;
  CBScalablePipeManager *btPipeManager;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  int var0;
  const char *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  NSString *v32;
  void (**bluetoothStateChangedHandler)(id, unint64_t);
  const char *v34;
  unint64_t v35;
  SFBLEPipe *v36;
  CBScalablePipeManager *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  const __CFString *v43;
  _BYTE v44[128];
  const __CFString *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = (CBScalablePipeManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  btPipeManager = self->_btPipeManager;
  if (btPipeManager)
    v6 = btPipeManager == v4;
  else
    v6 = 0;
  if (v6)
  {
    v7 = -[CBScalablePipeManager state](v4, "state");
    if ((unint64_t)(v7 - 1) > 4)
      v8 = 0;
    else
      v8 = qword_1A2AF7A20[v7 - 1];
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (v8 > 5)
        v10 = "?";
      else
        v10 = off_1E4831220[v8];
      v34 = v10;
      LogPrintF();
    }
    v11 = v8 - 1;
    switch(v8)
    {
      case 1uLL:
      case 4uLL:
      case 5uLL:
        goto LABEL_19;
      case 2uLL:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = CFSTR("SFNotificationKeyConnectionState");
        v46[0] = &unk_1E48908B0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("SFNotificationNameBTPoweredOff"), self, v13);

LABEL_19:
        v14 = self->_ucat->var0;
        if (v14 <= 50 && (v14 != -1 || _LogCategory_Initialize()))
        {
          if (v11 > 4)
            v15 = "?";
          else
            v15 = off_1E4831250[v11];
          v34 = v15;
          LogPrintF();
        }
        v35 = v8;
        v36 = self;
        v37 = v4;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v16 = self->_btWriteQueue;
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v39;
          v20 = *MEMORY[0x1E0CB2F90];
          v21 = *MEMORY[0x1E0CB2D50];
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v39 != v19)
                objc_enumerationMutation(v16);
              v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v23, "completion", v34);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                objc_msgSend(v23, "completion");
                v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                v26 = (void *)MEMORY[0x1E0CB35C8];
                v42 = v21;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
                v27 = objc_claimAutoreleasedReturnValue();
                v28 = (void *)v27;
                v29 = CFSTR("?");
                if (v27)
                  v29 = (const __CFString *)v27;
                v43 = v29;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "errorWithDomain:code:userInfo:", v20, -6753, v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *))v25)[2](v25, v31);

              }
            }
            v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          }
          while (v18);
        }

        self = v36;
        -[NSMutableArray removeAllObjects](v36->_btWriteQueue, "removeAllObjects");
        -[SFBLEPipe _tearDownPipe](v36, "_tearDownPipe");
        v32 = v36->_identifier;
        if (v32 && (v36->_btEndpointRegistered || v36->_btEndpointRegistering))
          -[CBScalablePipeManager unregisterEndpoint:](v36->_btPipeManager, "unregisterEndpoint:", v32, v34);
        *(_DWORD *)&v36->_btConnected = 0;

        v4 = v37;
        v8 = v35;
        break;
      case 3uLL:
        -[SFBLEPipe _setupIfNeeded](self, "_setupIfNeeded");
        break;
      default:
        break;
    }
    bluetoothStateChangedHandler = (void (**)(id, unint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler)
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v8);
  }

}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  int var0;
  CBScalablePipeManager *v11;

  v11 = (CBScalablePipeManager *)a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v11 && self->_btPipeManager == v11 && objc_msgSend(v8, "isEqual:", self->_identifier))
  {
    self->_btEndpointRegistering = 0;
    var0 = self->_ucat->var0;
    if (v9)
    {
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    else
    {
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      self->_btEndpointRegistered = 1;
      -[SFBLEPipe _setupIfNeeded](self, "_setupIfNeeded");
    }
  }

}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v6;
  int var0;
  CBScalablePipeManager *v8;

  v8 = (CBScalablePipeManager *)a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8 && self->_btPipeManager == v8 && objc_msgSend(v6, "isEqual:", self->_identifier))
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    *(_WORD *)&self->_btEndpointRegistering = 0;
  }

}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  CBScalablePipeManager *v6;
  id v7;
  int var0;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (CBScalablePipeManager *)a3;
  v7 = a4;
  var0 = self->_ucat->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6 && self->_btPipeManager == v6)
  {
    kdebug_trace();
    *(_WORD *)&self->_btConnected = 1;
    -[SFBLEPipe _setupPipe:](self, "_setupPipe:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("SFNotificationKeyConnectionState");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFBLEPipe connectionState](self, "connectionState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("SFNotificationNamePipeConnectionStateChanged"), self, v11);

  }
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  CBScalablePipeManager *v8;
  id v9;
  __CFString *v10;
  void *v11;
  int v12;
  int var0;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = (CBScalablePipeManager *)a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    if (self->_btPipeManager == v8)
    {
      objc_msgSend(v9, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", self->_identifier);

      if (v12)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v14 = CFSTR("success");
          if (v10)
            v14 = v10;
          v18 = v9;
          v19 = v14;
          LogPrintF();
        }
        -[SFBLEPipe _tearDownPipe](self, "_tearDownPipe", v18, v19);
        *(_WORD *)&self->_btConnected = 0;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("SFNotificationKeyConnectionState");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SFBLEPipe connectionState](self, "connectionState"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("SFNotificationNamePipeConnectionStateChanged"), self, v17);

      }
    }
  }

}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)connectionStateChangedHandler
{
  return self->_connectionStateChangedHandler;
}

- (void)setConnectionStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)frameHandler
{
  return self->_frameHandler;
}

- (void)setFrameHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)manualConnect
{
  return self->_manualConnect;
}

- (void)setManualConnect:(BOOL)a3
{
  self->_manualConnect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_frameHandler, 0);
  objc_storeStrong(&self->_connectionStateChangedHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_lastDisconnectDate, 0);
  objc_storeStrong((id *)&self->_frameHandlers, 0);
  objc_storeStrong((id *)&self->_btPipeManager, 0);
  objc_storeStrong((id *)&self->_btPipe, 0);
  objc_storeStrong((id *)&self->_btWriteSource, 0);
  objc_storeStrong((id *)&self->_btWriteQueue, 0);
  objc_storeStrong((id *)&self->_btWriteItem, 0);
  objc_storeStrong((id *)&self->_btWriteData, 0);
  objc_storeStrong((id *)&self->_btReadSource, 0);
  objc_storeStrong((id *)&self->_btReadPayload, 0);
  objc_storeStrong((id *)&self->_btCentral, 0);
}

@end
