@implementation SFBLEAdvertiser

- (SFBLEAdvertiser)initWithType:(int64_t)a3
{
  SFBLEAdvertiser *v4;
  SFBLEAdvertiser *v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  SFBLEAdvertiser *v8;
  objc_super v10;
  int v11;
  void *v12;

  v12 = 0;
  v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)SFBLEAdvertiser;
  v4 = -[SFBLEAdvertiser init](&v10, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  v4->_advertiseRate = 40;
  SFMainQueue(v4);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5->_dispatchQueue;
  v5->_dispatchQueue = (OS_dispatch_queue *)v6;

  v5->_payloadType = a3;
  ASPrintF();
  if (v12)
  {
    v5->_ucat = (LogCategory *)LogCategoryCreateEx();
    free(v12);
    v8 = 0;
    if (!v11)
      v8 = v5;
  }
  else
  {
LABEL_6:
    v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  id advertiseStateChangedHandler;
  id bluetoothStateChangedHandler;
  id connectionHandler;
  OS_dispatch_queue *dispatchQueue;
  id invalidationHandler;
  NSData *payloadDataCurrent;
  NSData *payloadDataPrevious;
  NSDictionary *payloadFields;
  NSString *payloadIdentifier;
  LogCategory *ucat;
  SFBLEAdvertiser *v13;
  SEL v14;
  objc_super v15;

  if (self->_startRetrier)
  {
    FatalErrorF();
    goto LABEL_10;
  }
  if (self->_wpNearby)
  {
LABEL_10:
    v13 = (SFBLEAdvertiser *)FatalErrorF();
    -[SFBLEAdvertiser description](v13, v14);
    return;
  }
  advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
  self->_advertiseStateChangedHandler = 0;

  bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_bluetoothStateChangedHandler = 0;

  connectionHandler = self->_connectionHandler;
  self->_connectionHandler = 0;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    self->_dispatchQueue = 0;

  }
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  payloadDataCurrent = self->_payloadDataCurrent;
  self->_payloadDataCurrent = 0;

  payloadDataPrevious = self->_payloadDataPrevious;
  self->_payloadDataPrevious = 0;

  payloadFields = self->_payloadFields;
  self->_payloadFields = 0;

  payloadIdentifier = self->_payloadIdentifier;
  self->_payloadIdentifier = 0;

  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SFBLEAdvertiser;
  -[SFBLEAdvertiser dealloc](&v15, sel_dealloc);
}

- (NSString)description
{
  unint64_t v3;
  const char *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  int64_t advertiseRate;
  const char *v10;
  id v11;
  id v12;
  const char *v14;
  const char *v15;
  void *v16;

  v3 = self->_payloadType + 1;
  if (v3 > 0x12)
    v4 = "?";
  else
    v4 = off_1E4830F30[v3];
  v15 = v4;
  NSAppendPrintF();
  v5 = 0;
  v6 = v5;
  if (self->_invalidateCalled)
  {
    v16 = v5;
    NSAppendPrintF();
    v7 = v16;

    v6 = v7;
  }
  NSAppendPrintF();
  v8 = v6;

  advertiseRate = self->_advertiseRate;
  if (advertiseRate > 39)
  {
    if (advertiseRate > 59)
    {
      if (advertiseRate == 60)
      {
        v10 = "Aggressive";
        goto LABEL_26;
      }
      if (advertiseRate == 70)
      {
        v10 = "Max";
        goto LABEL_26;
      }
    }
    else
    {
      if (advertiseRate == 40)
      {
        v10 = "Normal";
        goto LABEL_26;
      }
      if (advertiseRate == 50)
      {
        v10 = "High";
        goto LABEL_26;
      }
    }
LABEL_25:
    v10 = "?";
    goto LABEL_26;
  }
  if (advertiseRate > 19)
  {
    if (advertiseRate == 20)
    {
      v10 = "LowBackground";
      goto LABEL_26;
    }
    if (advertiseRate == 30)
    {
      v10 = "Background";
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (!advertiseRate)
  {
    v10 = "Invalid";
    goto LABEL_26;
  }
  if (advertiseRate != 10)
    goto LABEL_25;
  v10 = "Infrequent";
LABEL_26:
  v14 = v10;
  NSAppendPrintF();
  v11 = v8;

  -[NSData bytes](self->_payloadDataCurrent, "bytes", v14, v15);
  -[NSData length](self->_payloadDataCurrent, "length");
  -[NSData length](self->_payloadDataCurrent, "length");
  NSAppendPrintF();
  v12 = v11;

  return (NSString *)v12;
}

- (void)setAdvertiseRate:(int64_t)a3
{
  SFBLEAdvertiser *v4;
  NSObject *dispatchQueue;
  _QWORD v6[6];

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__SFBLEAdvertiser_setAdvertiseRate___block_invoke;
    v6[3] = &unk_1E482E018;
    v6[4] = v4;
    v6[5] = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_advertiseRate = a3;
  }
  objc_sync_exit(v4);

}

uint64_t __36__SFBLEAdvertiser_setAdvertiseRate___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  v1 = *(_QWORD *)(result + 40);
  if (v1 != *(_QWORD *)(v2 + 104))
  {
    *(_QWORD *)(v2 + 104) = v1;
    return objc_msgSend(*(id *)(result + 32), "_restartIfNeeded:", 1);
  }
  return result;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  SFBLEAdvertiser *obj;

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

- (void)setLePipeDevices:(id)a3
{
  void *v4;
  SFBLEAdvertiser *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__SFBLEAdvertiser_setLePipeDevices___block_invoke;
    v7[3] = &unk_1E482D3A0;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    objc_storeStrong((id *)&v5->_lePipeDevices, v4);
  }
  objc_sync_exit(v5);

}

uint64_t __36__SFBLEAdvertiser_setLePipeDevices___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_restartIfNeeded:", 1);
}

- (void)setPayloadData:(id)a3
{
  id v4;
  void *v5;
  SFBLEAdvertiser *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *dispatchQueue;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  _QWORD aBlock[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__SFBLEAdvertiser_setPayloadData___block_invoke;
  aBlock[3] = &unk_1E482D3A0;
  aBlock[4] = v6;
  v8 = v5;
  v15 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = v9;
  if (v6->_activateCalled)
  {
    dispatchQueue = v6->_dispatchQueue;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __34__SFBLEAdvertiser_setPayloadData___block_invoke_2;
    v12[3] = &unk_1E482E0F0;
    v12[4] = v6;
    v13 = v9;
    dispatch_async(dispatchQueue, v12);

  }
  else
  {
    v9[2](v9);
  }

  objc_sync_exit(v6);
}

void __34__SFBLEAdvertiser_setPayloadData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = 0;

}

uint64_t __34__SFBLEAdvertiser_setPayloadData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_restartIfNeeded:", 0);
}

- (void)setPayloadFields:(id)a3
{
  id v4;
  void *v5;
  SFBLEAdvertiser *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  NSObject *dispatchQueue;
  _QWORD v12[5];
  void (**v13)(_QWORD);
  _QWORD aBlock[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  v6 = self;
  objc_sync_enter(v6);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__SFBLEAdvertiser_setPayloadFields___block_invoke;
  aBlock[3] = &unk_1E482D3A0;
  aBlock[4] = v6;
  v8 = v5;
  v15 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = v9;
  if (v6->_activateCalled)
  {
    dispatchQueue = v6->_dispatchQueue;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __36__SFBLEAdvertiser_setPayloadFields___block_invoke_2;
    v12[3] = &unk_1E482E0F0;
    v12[4] = v6;
    v13 = v9;
    dispatch_async(dispatchQueue, v12);

  }
  else
  {
    v9[2](v9);
  }

  objc_sync_exit(v6);
}

void __36__SFBLEAdvertiser_setPayloadFields___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = 0;

}

uint64_t __36__SFBLEAdvertiser_setPayloadFields___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_restartIfNeeded:", 0);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  SFBLEAdvertiser *v5;
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
  v8[2] = __42__SFBLEAdvertiser_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __42__SFBLEAdvertiser_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  int64_t payloadType;
  void *v6;
  WPNearby *v7;
  WPNearby *wpNearby;
  CURetrier *v9;
  CURetrier *startRetrier;
  CURetrier *v11;
  int var0;
  const char *v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int64_t v24;
  const char *v25;
  _QWORD v26[5];
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    v14 = 4294960572;
    goto LABEL_18;
  }
  if (self->_startRetrier)
  {
    v14 = 4294960575;
    goto LABEL_18;
  }
  payloadType = self->_payloadType;
  if ((unint64_t)(payloadType - 15) > 1)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90)
    {
      if (var0 != -1)
      {
LABEL_11:
        if ((unint64_t)(payloadType + 1) > 0x12)
          v13 = "?";
        else
          v13 = off_1E4830F30[payloadType + 1];
        v24 = payloadType;
        v25 = v13;
        LogPrintF();
        goto LABEL_17;
      }
      if (_LogCategory_Initialize())
      {
        payloadType = self->_payloadType;
        goto LABEL_11;
      }
    }
LABEL_17:
    v14 = 4294960561;
    goto LABEL_18;
  }
  self->_wpNearbyType = payloadType != 15;
  if (self->_wpNearby)
    goto LABEL_33;
  +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addNearbyDelegate:", self);
  v7 = (WPNearby *)objc_claimAutoreleasedReturnValue();
  wpNearby = self->_wpNearby;
  self->_wpNearby = v7;

  if (self->_wpNearby)
  {
LABEL_33:
    v9 = (CURetrier *)objc_alloc_init(MEMORY[0x1E0D1B430]);
    startRetrier = self->_startRetrier;
    self->_startRetrier = v9;

    v11 = self->_startRetrier;
    if (v11)
    {
      -[CURetrier setDispatchQueue:](v11, "setDispatchQueue:", self->_dispatchQueue);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __43__SFBLEAdvertiser__activateWithCompletion___block_invoke;
      v26[3] = &unk_1E482DF78;
      v26[4] = self;
      -[CURetrier setActionHandler:](self->_startRetrier, "setActionHandler:", v26);
      -[CURetrier startDirect](self->_startRetrier, "startDirect");
      if (v4)
        v4[2](v4, 0);
      goto LABEL_26;
    }
  }
  v14 = 4294960567;
LABEL_18:
  v15 = self->_ucat->var0;
  if (v15 <= 60 && (v15 != -1 || _LogCategory_Initialize()))
  {
    v24 = v14;
    LogPrintF();
  }
  if (v4)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2F90];
    v18 = (int)v14;
    v27 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = CFSTR("?");
    if (v19)
      v21 = (const __CFString *)v19;
    v28[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v24, v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v23);

  }
LABEL_26:

}

uint64_t __43__SFBLEAdvertiser__activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartIfNeeded:", 1);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SFBLEAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SFBLEAdvertiser_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  int var0;
  CURetrier *startRetrier;
  uint64_t v5;
  int64_t payloadType;
  WPNearby *wpNearby;
  uint64_t v8;
  WPNearby *v9;
  void *v10;
  int v11;
  int v12;
  void (**invalidationHandler)(id, _QWORD);
  id advertiseStateChangedHandler;
  id bluetoothStateChangedHandler;
  id connectionHandler;
  id v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    return;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_invalidateCalled = 1;
  -[CURetrier invalidateDirect](self->_startRetrier, "invalidateDirect");
  startRetrier = self->_startRetrier;
  self->_startRetrier = 0;

  payloadType = self->_payloadType;
  if (payloadType == 16)
  {
    wpNearby = self->_wpNearby;
    v8 = 1;
  }
  else
  {
    if (payloadType != 15)
    {
      v11 = self->_ucat->var0;
      if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      goto LABEL_17;
    }
    wpNearby = self->_wpNearby;
    v8 = 0;
  }
  -[WPNearby stopAdvertisingOfType:](wpNearby, "stopAdvertisingOfType:", v8);
  v9 = self->_wpNearby;
  if (v9)
  {
    +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeNearbyDelegate:", self);

    v9 = self->_wpNearby;
  }
  self->_wpNearby = 0;

LABEL_17:
  v12 = self->_ucat->var0;
  if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  invalidationHandler = (void (**)(id, _QWORD))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2](invalidationHandler, v5);
  advertiseStateChangedHandler = self->_advertiseStateChangedHandler;
  self->_advertiseStateChangedHandler = 0;

  bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_bluetoothStateChangedHandler = 0;

  connectionHandler = self->_connectionHandler;
  self->_connectionHandler = 0;

  v17 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

}

- (void)_restartIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  int var0;
  const char *v6;
  WPNearby *wpNearby;
  int v8;
  NSData *payloadDataCurrent;
  int64_t advertiseRate;
  uint64_t v11;
  int v12;
  int v13;
  _BOOL8 v14;
  int v15;
  const char *v16;
  void *v17;
  double v18;
  const char *v19;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v6 = "";
    if (v3)
      v6 = "(force)";
    v17 = (void *)v6;
    LogPrintF();
  }
  if ((unint64_t)(self->_payloadType - 15) > 1)
  {
    v12 = self->_ucat->var0;
    if (v12 <= 90 && (v12 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    wpNearby = self->_wpNearby;
    if (!wpNearby || -[WPNearby state](wpNearby, "state") != 3)
      return;
    v8 = -[SFBLEAdvertiser _preparePayload:](self, "_preparePayload:", v3);
    if (v8 == -6757)
    {
LABEL_43:
      -[CURetrier succeededDirect](self->_startRetrier, "succeededDirect");
      return;
    }
    if (!v8)
    {
      payloadDataCurrent = self->_payloadDataCurrent;
      if (payloadDataCurrent)
      {
        advertiseRate = self->_advertiseRate;
        if (advertiseRate <= 69)
        {
          if (advertiseRate <= 49)
          {
            if (advertiseRate <= 39)
            {
              if (advertiseRate <= 29)
              {
                if (advertiseRate <= 19)
                {
                  if (advertiseRate <= 14)
                    v11 = 0x4000;
                  else
                    v11 = 1636;
                }
                else
                {
                  v11 = 560;
                }
              }
              else
              {
                v11 = 432;
              }
            }
            else
            {
              v11 = 290;
            }
          }
          else
          {
            v11 = 48;
          }
        }
        else
        {
          v11 = 32;
        }
        v14 = advertiseRate > 40;
        v15 = self->_ucat->var0;
        if (v15 > 20)
          goto LABEL_42;
        if (v15 == -1)
        {
          if (!_LogCategory_Initialize())
          {
LABEL_42:
            -[WPNearby stopAdvertisingOfType:](self->_wpNearby, "stopAdvertisingOfType:", self->_wpNearbyType, v17, *(_QWORD *)&v18, v19);
            -[WPNearby startAdvertisingOfType:data:priority:mode:](self->_wpNearby, "startAdvertisingOfType:data:priority:mode:", self->_wpNearbyType, self->_payloadDataCurrent, v14, v11);
            goto LABEL_43;
          }
          payloadDataCurrent = self->_payloadDataCurrent;
        }
        v16 = "no";
        if (v3)
          v16 = "yes";
        v17 = payloadDataCurrent;
        v19 = v16;
        v18 = (double)v11 * 625.0 / 1000.0;
        LogPrintF();
        goto LABEL_42;
      }
    }
  }
  v13 = self->_ucat->var0;
  if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

- (int)_preparePayload:(BOOL)a3
{
  int v5;
  int result;
  int64_t payloadType;
  NSData *v8;
  NSData *payloadDataCurrent;
  int var0;
  int v11;

  v11 = 0;
  if (!self->_payloadDataCurrent)
  {
    payloadType = self->_payloadType;
    if (payloadType == 16)
    {
      -[SFBLEAdvertiser _preparePayloadNearbyInfo:](self, "_preparePayloadNearbyInfo:", &v11);
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (payloadType != 15)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        v11 = -6757;
        goto LABEL_2;
      }
      -[SFBLEAdvertiser _preparePayloadNearbyAction:](self, "_preparePayloadNearbyAction:", &v11);
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    payloadDataCurrent = self->_payloadDataCurrent;
    self->_payloadDataCurrent = v8;

    result = v11;
    if (v11)
      return result;
  }
LABEL_2:
  if (!a3 && self->_payloadDataPrevious && (-[NSData isEqual:](self->_payloadDataCurrent, "isEqual:") & 1) != 0)
  {
    v5 = self->_ucat->var0;
    if (v5 <= 9 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    return -6757;
  }
  else
  {
    objc_storeStrong((id *)&self->_payloadDataPrevious, self->_payloadDataCurrent);
    return 0;
  }
}

- (id)_preparePayloadNearbyAction:(int *)a3
{
  id v4;
  char Int64Ranged;
  void *v6;
  unsigned int v7;
  char v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t Int64;
  void *v14;
  char v16;
  unsigned __int8 v17;
  char v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v18 = Int64Ranged;
  if (CFDictionaryGetInt64())
  {
    Int64Ranged |= 0x20u;
    v18 = Int64Ranged;
  }
  if (CFDictionaryGetInt64())
  {
    Int64Ranged |= 0x40u;
    v18 = Int64Ranged;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") == 3)
    v18 = Int64Ranged | 0x80;
  v19 = 0;
  objc_msgSend(v4, "appendBytes:length:", &v18, 1);
  v17 = CFDictionaryGetInt64Ranged();
  objc_msgSend(v4, "appendBytes:length:", &v17, 1);
  if (v18 < 0)
    objc_msgSend(v4, "appendData:", v6);
  v7 = v17;
  if (v17 <= 0x24u && ((1 << v17) & 0x1200480A00) != 0 || v17 == 84)
  {
    v8 = CFDictionaryGetInt64Ranged();
    v19 = CFDictionaryGetInt64Ranged() & 0x1F | (32 * v8);
    objc_msgSend(v4, "appendBytes:length:", &v19, 1);
    v7 = v17;
  }
  if (v7 - 33 <= 0x33 && ((1 << (v7 - 33)) & 0x8000000000009) != 0 || v7 - 9 < 3)
  {
    LOBYTE(v20) = 0;
    LOBYTE(v20) = CFDictionaryGetInt64Ranged();
    objc_msgSend(v4, "appendBytes:length:", &v20, 1);
    v7 = v17;
  }
  if (v7 <= 0x2B && ((1 << v7) & 0x81300000A42) != 0 || v7 == 84)
  {
    LOBYTE(v20) = 13;
    objc_msgSend(v4, "appendBytes:length:", &v20, 1);
    v7 = v17;
  }
  if (v7 == 8)
  {
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    if (v10)
    {
      v11 = v10;
      v21 = 0;
      v20 = 0;
      objc_msgSend(objc_retainAutorelease(v9), "bytes");
      __memcpy_chk();
      if (v11 <= 8)
        bzero((char *)&v20 + v11, 9 - v11);
      objc_msgSend(v4, "appendBytes:length:", &v20, 9);
    }

    v7 = v17;
    if (v17 == 8)
    {
      CFDataGetTypeID();
      CFDictionaryGetTypedValue();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length") == 3)
        objc_msgSend(v4, "appendData:", v12);

      v7 = v17;
    }
  }
  if (v7 == 10)
  {
    Int64 = CFDictionaryGetInt64();
    v19 = (Int64 >> 15) & 0x80 | (Int64 >> 1) & 8 | (Int64 >> 11) & 0x20 | (Int64 >> 14) & 0x10 | (Int64 >> 11) & 0x40 | ((Int64 & 0xFE) >> 1) & 7;
    objc_msgSend(v4, "appendBytes:length:", &v19, 1);
    v7 = v17;
    if (v17 == 10)
    {
      LOBYTE(v20) = 13;
      objc_msgSend(v4, "appendBytes:length:", &v20, 1);
      v7 = v17;
    }
  }
  LOBYTE(v20) = 0;
  if (v7 <= 0x33 && ((1 << v7) & 0x8001000000200) != 0)
  {
    LOBYTE(v20) = CFDictionaryGetInt64Ranged();
    objc_msgSend(v4, "appendBytes:length:", &v20, 1);
    if ((v20 & 4) != 0)
    {
      CFDataGetTypeID();
      CFDictionaryGetTypedValue();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v4, "appendData:", v14);

    }
  }
  if (v17 == 1)
  {
    v16 = CFDictionaryGetInt64Ranged();
    objc_msgSend(v4, "appendBytes:length:", &v16, 1);
  }
  if (a3)
    *a3 = 0;

  return v4;
}

- (id)_preparePayloadNearbyInfo:(int *)a3
{
  id v4;
  char Int64Ranged;
  char v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  char v13;
  char v14;
  char v15;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v15 = Int64Ranged;
  if (CFDictionaryGetInt64())
  {
    Int64Ranged |= 0x10u;
    v15 = Int64Ranged;
  }
  if (CFDictionaryGetInt64())
  {
    Int64Ranged |= 0x20u;
    v15 = Int64Ranged;
  }
  if (CFDictionaryGetInt64())
    v15 = Int64Ranged | 0x40;
  objc_msgSend(v4, "appendBytes:length:", &v15, 1);
  v14 = 0;
  if (CFDictionaryGetInt64())
  {
    v6 = 0x80;
    v14 = 0x80;
  }
  else
  {
    v6 = 0;
  }
  if (CFDictionaryGetInt64())
  {
    v6 |= 0x40u;
    v14 = v6;
  }
  if (CFDictionaryGetInt64())
  {
    v6 |= 8u;
    v14 = v6;
  }
  if (CFDictionaryGetInt64())
  {
    v6 |= 0x20u;
    v14 = v6;
  }
  if (CFDictionaryGetInt64())
  {
    v6 |= 4u;
    v14 = v6;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") == 3)
  {
    v6 |= 0x10u;
    v14 = v6;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v6 |= 2u;
    v14 = v6;
  }
  v13 = 0;
  if (CFDictionaryGetInt64())
  {
    v9 = 2;
    v13 = 2;
  }
  else
  {
    v9 = 0;
  }
  if (CFDictionaryGetInt64())
  {
    v9 |= 4u;
    v13 = v9;
  }
  if ((CFDictionaryGetInt64Ranged() & 0x800) != 0)
  {
    v9 |= 0xFFFFFF80;
    v13 = v9;
  }
  if (CFDictionaryGetInt64Ranged() == 1)
  {
    v9 |= 1u;
    v13 = v9;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    v13 = v9 | (16 * (*(_BYTE *)objc_msgSend(objc_retainAutorelease(v10), "bytes") & 7)) | 8;
  }
  else if (!v9)
  {
    goto LABEL_35;
  }
  v14 = v6 | 1;
LABEL_35:
  objc_msgSend(v4, "appendBytes:length:", &v14, 1);
  v11 = v14;
  if ((v14 & 0x10) != 0)
  {
    objc_msgSend(v4, "appendData:", v7);
    v11 = v14;
    if ((v14 & 2) == 0)
    {
LABEL_37:
      if ((v11 & 1) == 0)
        goto LABEL_38;
LABEL_43:
      objc_msgSend(v4, "appendBytes:length:", &v13, 1);
      if (!a3)
        goto LABEL_40;
      goto LABEL_39;
    }
  }
  else if ((v14 & 2) == 0)
  {
    goto LABEL_37;
  }
  objc_msgSend(v4, "appendBytes:length:", objc_msgSend(objc_retainAutorelease(v8), "bytes"), 1);
  if ((v14 & 1) != 0)
    goto LABEL_43;
LABEL_38:
  if (a3)
LABEL_39:
    *a3 = 0;
LABEL_40:

  return v4;
}

- (void)nearbyDidUpdateState:(id)a3
{
  WPNearby *wpNearby;
  BOOL v5;
  uint64_t v6;
  int var0;
  void (**bluetoothStateChangedHandler)(id, uint64_t);
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
    v6 = -[WPNearby state](v9, "state");
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v6 == 3)
      -[SFBLEAdvertiser _restartIfNeeded:](self, "_restartIfNeeded:", 1);
    bluetoothStateChangedHandler = (void (**)(id, uint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler)
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
  }

}

- (void)nearby:(id)a3 didStartAdvertisingType:(int64_t)a4
{
  NSObject *dispatchQueue;
  WPNearby *v7;
  WPNearby *wpNearby;
  BOOL v9;
  int var0;
  void (**advertiseStateChangedHandler)(id, uint64_t);

  dispatchQueue = self->_dispatchQueue;
  v7 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
    v9 = wpNearby == v7;
  else
    v9 = 0;
  if (!v9 || self->_wpNearbyType != a4)
    return;
  var0 = self->_ucat->var0;
  if (self->_advertiseState == 2)
  {
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_13:
      LogPrintF();
  }
  else if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_13;
  }
  if (self->_advertiseState != 1)
  {
    self->_advertiseState = 1;
    advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler)
      advertiseStateChangedHandler[2](advertiseStateChangedHandler, 1);
  }
}

- (void)nearby:(id)a3 didStopAdvertisingType:(int64_t)a4 withError:(id)a5
{
  id v8;
  NSObject *dispatchQueue;
  WPNearby *v10;
  WPNearby *wpNearby;
  BOOL v12;
  int var0;
  void (**advertiseStateChangedHandler)(id, _QWORD);
  uint32_t v15;
  int v16;
  dispatch_time_t v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];

  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v10 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
    v12 = wpNearby == v10;
  else
    v12 = 0;
  if (v12 && self->_wpNearbyType == a4)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v19 = v8;
      LogPrintF();
    }
    if (self->_advertiseState)
    {
      self->_advertiseState = 0;
      advertiseStateChangedHandler = (void (**)(id, _QWORD))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler)
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 0);
    }
    if (objc_msgSend(v8, "code", v19) == 28)
    {
      v15 = arc4random() % 0x123 + 10;
      v16 = self->_ucat->var0;
      if (v16 <= 50 && (v16 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v17 = dispatch_time(0, 1000000 * v15);
      v18 = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__SFBLEAdvertiser_nearby_didStopAdvertisingType_withError___block_invoke;
      block[3] = &unk_1E482DF78;
      block[4] = self;
      dispatch_after(v17, v18, block);
    }
  }

}

_BYTE *__59__SFBLEAdvertiser_nearby_didStopAdvertisingType_withError___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[24])
    return (_BYTE *)objc_msgSend(result, "_restartIfNeeded:", 1);
  return result;
}

- (void)nearby:(id)a3 didDeferAdvertisingType:(int64_t)a4
{
  NSObject *dispatchQueue;
  WPNearby *v7;
  WPNearby *wpNearby;
  BOOL v9;
  int var0;
  void (**advertiseStateChangedHandler)(id, uint64_t);

  dispatchQueue = self->_dispatchQueue;
  v7 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
    v9 = wpNearby == v7;
  else
    v9 = 0;
  if (v9 && self->_wpNearbyType == a4 && self->_advertiseState != 2)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_advertiseState = 2;
    advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
    if (advertiseStateChangedHandler)
      advertiseStateChangedHandler[2](advertiseStateChangedHandler, 2);
  }
}

- (void)nearby:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  NSObject *dispatchQueue;
  WPNearby *v9;
  WPNearby *wpNearby;
  BOOL v11;
  int var0;
  void (**advertiseStateChangedHandler)(id, uint64_t);
  id v14;
  id v15;

  v15 = a5;
  dispatchQueue = self->_dispatchQueue;
  v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
    v11 = wpNearby == v9;
  else
    v11 = 0;
  if (v11 && self->_wpNearbyType == a4)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v14 = v15;
      LogPrintF();
    }
    -[CURetrier failedDirect](self->_startRetrier, "failedDirect", v14);
    if (self->_advertiseState != 3)
    {
      self->_advertiseState = 3;
      advertiseStateChangedHandler = (void (**)(id, uint64_t))self->_advertiseStateChangedHandler;
      if (advertiseStateChangedHandler)
        advertiseStateChangedHandler[2](advertiseStateChangedHandler, 3);
    }
  }

}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v9;
  NSObject *dispatchQueue;
  WPNearby *v11;
  WPNearby *wpNearby;
  int var0;
  SFBLEDevice *v14;
  int v15;
  id v16;

  v16 = a4;
  v9 = a6;
  dispatchQueue = self->_dispatchQueue;
  v11 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby && wpNearby == v11 && self->_connectionHandler)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v9)
    {
      v15 = self->_ucat->var0;
      if (v15 <= 50 && (v15 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    else
    {
      v14 = objc_alloc_init(SFBLEDevice);
      -[SFBLEDevice setIdentifier:](v14, "setIdentifier:", v16);
      (*((void (**)(id, SFBLEDevice *))self->_connectionHandler + 2))(self->_connectionHandler, v14);

    }
  }

}

- (int64_t)advertiseRate
{
  return self->_advertiseRate;
}

- (id)advertiseStateChangedHandler
{
  return self->_advertiseStateChangedHandler;
}

- (void)setAdvertiseStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
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

- (NSArray)lePipeDevices
{
  return self->_lePipeDevices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lePipeDevices, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong(&self->_advertiseStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_wpNearby, 0);
  objc_storeStrong((id *)&self->_startRetrier, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadFields, 0);
  objc_storeStrong((id *)&self->_payloadDataPrevious, 0);
  objc_storeStrong((id *)&self->_payloadDataCurrent, 0);
}

@end
