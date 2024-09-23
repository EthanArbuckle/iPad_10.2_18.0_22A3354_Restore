@implementation WRM_UCMInterface

- (void)registerClient:(int)a3 queue:(id)a4
{
  id v6;
  void *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *mQueue;
  OS_dispatch_queue **p_mQueue;
  OS_dispatch_queue *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id mNotificationBlock;
  void *v16;
  id v17;
  OS_xpc_object *mach_service;
  OS_xpc_object *mConnection;
  OS_xpc_object *v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  id v24;
  xpc_object_t v25;
  uint64_t i;
  _QWORD handler[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  xpc_object_t v32[2];
  char *v33[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (OS_dispatch_queue *)v6;
    p_mQueue = &self->mQueue;
    mQueue = self->mQueue;
    self->mQueue = v8;
  }
  else
  {
    v11 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC9B8];
    p_mQueue = &self->mQueue;
    mQueue = self->mQueue;
    self->mQueue = v11;
  }

  self->mProcessId = a3;
  objc_initWeak(&location, self);
  v13 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __41__WRM_UCMInterface_registerClient_queue___block_invoke;
  v29[3] = &unk_24C30CFE0;
  objc_copyWeak(&v30, &location);
  v14 = (void *)MEMORY[0x20BD2502C](v29);
  mNotificationBlock = self->mNotificationBlock;
  if (mNotificationBlock)
  {
    self->mNotificationBlock = 0;

  }
  v16 = (void *)objc_msgSend(v14, "copy");
  v17 = self->mNotificationBlock;
  self->mNotificationBlock = v16;

  if (!self->mConnection)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", (dispatch_queue_t)*p_mQueue, 0);
    mConnection = self->mConnection;
    self->mConnection = mach_service;

    v20 = self->mConnection;
    if (v20)
    {
      handler[0] = v13;
      handler[1] = 3221225472;
      handler[2] = __41__WRM_UCMInterface_registerClient_queue___block_invoke_2;
      handler[3] = &unk_24C30D3C0;
      objc_copyWeak(&v28, &location);
      xpc_connection_set_event_handler(v20, handler);
      xpc_connection_resume(self->mConnection);
      keys[0] = "kWCMRegisterProcess_ProcessId";
      v21 = xpc_uint64_create(a3);
      values = v21;
      v22 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
      *(_OWORD *)v33 = xmmword_24C30D4B8;
      v23 = xpc_uint64_create(1uLL);
      v32[0] = v23;
      v24 = v22;
      v32[1] = v24;
      v25 = xpc_dictionary_create((const char *const *)v33, v32, 2uLL);
      xpc_connection_send_message(self->mConnection, v25);

      for (i = 1; i != -1; --i)
      objc_destroyWeak(&v28);
    }

    v14 = 0;
  }
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

- (void)unregisterClient
{
  OS_xpc_object *mConnection;
  id mNotificationBlock;
  id mBtConnectedLinksObserver;

  mConnection = self->mConnection;
  if (mConnection)
  {
    self->mConnection = 0;

  }
  mNotificationBlock = self->mNotificationBlock;
  if (mNotificationBlock)
  {
    self->mNotificationBlock = 0;

  }
  mBtConnectedLinksObserver = self->mBtConnectedLinksObserver;
  if (mBtConnectedLinksObserver)
  {
    self->mBtConnectedLinksObserver = 0;

  }
  if (self->mNRFrequencyUpdateForMicFuncPtr)
    self->mNRFrequencyUpdateForMicFuncPtr = 0;
}

- (void)subscribeBtConnectedLinksNotification:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__WRM_UCMInterface_subscribeBtConnectedLinksNotification___block_invoke;
  v7[3] = &unk_24C30D0B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (void)setCriticalAirPlayEnabled:(BOOL)a3 estimatedDuration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5
{
  unsigned int v5;
  const char *v9;
  unsigned int mProcessId;
  const char *v11;
  xpc_object_t v12;
  xpc_object_t v13;
  id v14;
  id v15;
  xpc_object_t v16;
  uint64_t i;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x24BDAC8D0];
  v9 = "disable";
  if (a3)
    v9 = "enable";
  mProcessId = self->mProcessId;
  if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
  {
    v11 = (&off_24C30D4F0)[mProcessId];
  }
  else if (mProcessId == 42)
  {
    v11 = "WRMSOS";
  }
  else
  {
    v11 = "INVALID_PROC_ID!!!";
  }
  NSLog(CFSTR("Received critical AirPlay %s from %s"), a2, v9, v11);
  v12 = xpc_uint64_create(0x76CuLL);
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v13, "kWCMAirplayCritical", a3);
  xpc_dictionary_set_uint64(v13, "kWCMAirplayDuration", a4);
  xpc_dictionary_set_uint64(v13, "kWCMAirplayCriticalityPercentage", v5);
  *(_OWORD *)keys = xmmword_24C30D4B8;
  v14 = v12;
  values[0] = v14;
  v15 = v13;
  values[1] = v15;
  v16 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  xpc_connection_send_message(self->mConnection, v16);

  for (i = 1; i != -1; --i)
}

- (void)setAWDLEnabled:(BOOL)a3
{
  const char *v5;
  unsigned int mProcessId;
  const char *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  id v11;
  xpc_object_t v12;
  uint64_t i;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->mIsAwdlEnabled != a3)
  {
    v5 = "disable";
    if (a3)
      v5 = "enable";
    mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      v7 = (&off_24C30D4F0)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      v7 = "WRMSOS";
    }
    else
    {
      v7 = "INVALID_PROC_ID!!!";
    }
    NSLog(CFSTR("Sending AWDL %s from %s"), a2, v5, v7);
    v8 = xpc_uint64_create(0xA8CuLL);
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v9, "kWCMP2PAWDLOn", a3);
    *(_OWORD *)keys = xmmword_24C30D4B8;
    v10 = v8;
    values[0] = v10;
    v11 = v9;
    values[1] = v11;
    v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_connection_send_message(self->mConnection, v12);
    self->mIsAwdlEnabled = a3;

    for (i = 1; i != -1; --i)
  }
}

- (void)setNANEnabled:(BOOL)a3
{
  const char *v5;
  unsigned int mProcessId;
  const char *v7;
  xpc_object_t v8;
  xpc_object_t v9;
  id v10;
  id v11;
  xpc_object_t v12;
  uint64_t i;
  xpc_object_t values[2];
  char *keys[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->mIsNanEnabled != a3)
  {
    v5 = "disable";
    if (a3)
      v5 = "enable";
    mProcessId = self->mProcessId;
    if (mProcessId < 0x2A && ((0x3EEEFFFFFFFuLL >> mProcessId) & 1) != 0)
    {
      v7 = (&off_24C30D4F0)[mProcessId];
    }
    else if (mProcessId == 42)
    {
      v7 = "WRMSOS";
    }
    else
    {
      v7 = "INVALID_PROC_ID!!!";
    }
    NSLog(CFSTR("Sending NAN %s from %s"), a2, v5, v7);
    v8 = xpc_uint64_create(0xA8DuLL);
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v9, "kWCMP2PNANOn", a3);
    *(_OWORD *)keys = xmmword_24C30D4B8;
    v10 = v8;
    values[0] = v10;
    v11 = v9;
    values[1] = v11;
    v12 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_connection_send_message(self->mConnection, v12);
    self->mIsNanEnabled = a3;

    for (i = 1; i != -1; --i)
  }
}

- (WRM_UCMInterface)init
{
  WRM_UCMInterface *v2;
  WRM_UCMInterface *v3;
  id mBtConnectedLinksObserver;
  OS_xpc_object *mConnection;
  OS_dispatch_queue *mQueue;
  id mNotificationBlock;
  WRM_UCMInterface *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WRM_UCMInterface;
  v2 = -[WRM_UCMInterface init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    mBtConnectedLinksObserver = v2->mBtConnectedLinksObserver;
    v2->mBtConnectedLinksObserver = 0;

    mConnection = v3->mConnection;
    v3->mConnection = 0;

    mQueue = v3->mQueue;
    v3->mQueue = 0;

    v3->mProcessId = 0;
    mNotificationBlock = v3->mNotificationBlock;
    v3->mNotificationBlock = 0;

    *(_WORD *)&v3->mIsAwdlEnabled = 0;
    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WRM_UCMInterface unregisterClient](self, "unregisterClient");
  v3.receiver = self;
  v3.super_class = (Class)WRM_UCMInterface;
  -[WRM_UCMInterface dealloc](&v3, sel_dealloc);
}

- (void)reConnect
{
  int mProcessId;

  -[WRM_UCMInterface unregisterClient](self, "unregisterClient");
  -[WRM_UCMInterface registerClient:queue:](self, "registerClient:queue:", self->mProcessId, self->mQueue);
  NSLog(CFSTR("Re-sending state to WRM due to reConnect!"));
  mProcessId = self->mProcessId;
  if (mProcessId == 39)
  {
    -[WRM_UCMInterface setNANEnabled:](self, "setNANEnabled:", self->mIsNanEnabled);
  }
  else if (mProcessId == 38)
  {
    -[WRM_UCMInterface setAWDLEnabled:](self, "setAWDLEnabled:", self->mIsAwdlEnabled);
  }
}

- (void)handleNotification:(id)a3 :(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int64_t uint64;
  void *v8;
  xpc_object_t v9;
  xpc_object_t xdict;

  v4 = a4;
  v6 = a3;
  xdict = v6;
  if (!v4)
  {
    uint64 = xpc_dictionary_get_uint64(v6, "kMessageId");
    xpc_dictionary_get_value(xdict, "kMessageArgs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (uint64 > 2805)
    {
      v9 = xdict;
      if (uint64 == 2806)
      {
        -[WRM_UCMInterface sendNRFrequencyUpdateForMic:](self, "sendNRFrequencyUpdateForMic:", v8);
        goto LABEL_13;
      }
      if (uint64 == 2808)
      {
        -[WRM_UCMInterface sendULFrequencyUpdate:](self, "sendULFrequencyUpdate:", v8);
        goto LABEL_13;
      }
    }
    else
    {
      v9 = xdict;
      if (uint64 == 1429)
      {
        -[WRM_UCMInterface processBTConnectedLinksNotification:](self, "processBTConnectedLinksNotification:", v8);
        goto LABEL_13;
      }
      if (uint64 == 2803)
      {
        -[WRM_UCMInterface sendBtLoad:](self, "sendBtLoad:", v8);
LABEL_13:

        goto LABEL_14;
      }
    }
    NSLog(CFSTR("Received unknown message:%@"), v9);
    goto LABEL_13;
  }
  NSLog(CFSTR("Invoking reConnect"));
  -[WRM_UCMInterface reConnect](self, "reConnect");
LABEL_14:

}

- (void)processBTConnectedLinksNotification:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRM_UCMInterface *v9;

  v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__WRM_UCMInterface_processBTConnectedLinksNotification___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (BOOL)checkConnection:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  if (v3 == (id)MEMORY[0x24BDACF30])
  {
    NSLog(CFSTR("XPC error: Connection interrupted."));
LABEL_8:
    v5 = 0;
    goto LABEL_9;
  }
  if (v3 == (id)MEMORY[0x24BDACF38])
  {
    NSLog(CFSTR("XPC error: Connection is invalid."));
    goto LABEL_8;
  }
  if (v3 == (id)MEMORY[0x24BDACF48])
  {
    NSLog(CFSTR("XPC error: Termination is imminent."));
    goto LABEL_8;
  }
  v5 = 1;
LABEL_9:

  return v5;
}

- (void)sendBtLoad:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRM_UCMInterface *v9;

  v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__WRM_UCMInterface_sendBtLoad___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (unsigned)getInstantLoad
{
  dispatch_semaphore_t v3;
  NSObject *mQueue;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  WRM_UCMInterface *v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[5];
  OS_xpc_object *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  v14 = self->mConnection;
  mQueue = self->mQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__WRM_UCMInterface_getInstantLoad__block_invoke;
  v8[3] = &unk_24C30D420;
  v9 = v3;
  v10 = self;
  v11 = v13;
  v12 = &v15;
  v5 = v3;
  dispatch_async(mQueue, v8);
  v6 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v5, v6);
  LODWORD(v3) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  return v3;
}

- (unsigned)stopTimer
{
  dispatch_semaphore_t v3;
  NSObject *mQueue;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v8[4];
  dispatch_semaphore_t v9;
  WRM_UCMInterface *v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[5];
  OS_xpc_object *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v3 = dispatch_semaphore_create(0);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  v14 = self->mConnection;
  mQueue = self->mQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__WRM_UCMInterface_stopTimer__block_invoke;
  v8[3] = &unk_24C30D420;
  v9 = v3;
  v10 = self;
  v11 = v13;
  v12 = &v15;
  v5 = v3;
  dispatch_async(mQueue, v8);
  v6 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v5, v6);
  LODWORD(v3) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  return v3;
}

- (unsigned)startTimer:(double)a3
{
  dispatch_semaphore_t v5;
  NSObject *mQueue;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD block[4];
  dispatch_semaphore_t v11;
  WRM_UCMInterface *v12;
  _QWORD *v13;
  uint64_t *v14;
  double v15;
  _QWORD v16[5];
  OS_xpc_object *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v5 = dispatch_semaphore_create(0);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = self->mConnection;
  mQueue = self->mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WRM_UCMInterface_startTimer___block_invoke;
  block[3] = &unk_24C30D448;
  v15 = a3;
  v11 = v5;
  v12 = self;
  v13 = v16;
  v14 = &v18;
  v7 = v5;
  dispatch_async(mQueue, block);
  v8 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v7, v8);
  LODWORD(v5) = *((_DWORD *)v19 + 6);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  return v5;
}

- (int64_t)getWirelessRadioManagerReportLoad:(int)a3 loadDuration:(double)a4 callback:(void *)a5
{
  int64_t result;

  NSLog(CFSTR("Received getWirelessRadioManagerReportLoad"), a2);
  if (a3 == 2)
  {
    LODWORD(result) = -[WRM_UCMInterface stopTimer](self, "stopTimer");
    self->mHomeKitBTLoadFunctionPointer = 0;
  }
  else if (a3 == 1)
  {
    self->mHomeKitBTLoadFunctionPointer = a5;
    if (a4 <= 0.0)
    {
      NSLog(CFSTR("Duration is not Valid"));
      LODWORD(result) = 0;
    }
    else
    {
      LODWORD(result) = -[WRM_UCMInterface startTimer:](self, "startTimer:", a4);
    }
  }
  else
  {
    if (a3)
      return 0;
    LODWORD(result) = -[WRM_UCMInterface getInstantLoad](self, "getInstantLoad");
  }
  return result;
}

- (void)sendNRFrequencyUpdateForMic:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRM_UCMInterface *v9;

  v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__WRM_UCMInterface_sendNRFrequencyUpdateForMic___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (id)getWirelessFrequencyBandUpdatesForMIC:(void *)a3
{
  dispatch_semaphore_t v5;
  NSObject *mQueue;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  NSObject *v17;
  WRM_UCMInterface *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[5];
  OS_xpc_object *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("Received getWirelessFrequencyBandUpdatesForMIC"), a2);
  self->mNRFrequencyUpdateForMicFuncPtr = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v5 = dispatch_semaphore_create(0);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v23 = self->mConnection;
  mQueue = self->mQueue;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __58__WRM_UCMInterface_getWirelessFrequencyBandUpdatesForMIC___block_invoke;
  v16 = &unk_24C30D498;
  v19 = v22;
  v7 = v5;
  v17 = v7;
  v18 = self;
  v20 = &v28;
  v21 = &v24;
  dispatch_async(mQueue, &v13);
  v8 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v7, v8);
  v32[0] = CFSTR("NRBand41Enabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v29 + 24), v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = CFSTR("NRBand7xEnabled");
  v33[0] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v25 + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v11;
}

- (void)sendULFrequencyUpdate:(id)a3
{
  id v4;
  NSObject *mQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WRM_UCMInterface *v9;

  v4 = a3;
  mQueue = self->mQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__WRM_UCMInterface_sendULFrequencyUpdate___block_invoke;
  v7[3] = &unk_24C30D040;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(mQueue, v7);

}

- (id)getWirelessULFrequencyBandUpdates:(id)a3
{
  id v4;
  void *v5;
  id mULFrequencyUpdatesObserver;
  NSObject *mQueue;
  void *v8;
  _QWORD block[5];
  _QWORD v11[5];
  OS_xpc_object *v12;

  v4 = a3;
  NSLog(CFSTR("Received getWirelessULFrequencyBandUpdates"));
  v5 = (void *)MEMORY[0x20BD2502C](v4);
  mULFrequencyUpdatesObserver = self->mULFrequencyUpdatesObserver;
  self->mULFrequencyUpdatesObserver = v5;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  v12 = self->mConnection;
  mQueue = self->mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WRM_UCMInterface_getWirelessULFrequencyBandUpdates___block_invoke;
  block[3] = &unk_24C30D4D0;
  block[4] = v11;
  dispatch_async(mQueue, block);
  v8 = (void *)objc_msgSend(&unk_24C30F790, "copy");
  _Block_object_dispose(v11, 8);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mQueue, 0);
  objc_storeStrong((id *)&self->mConnection, 0);
  objc_storeStrong(&self->mULFrequencyUpdatesObserver, 0);
  objc_storeStrong(&self->mNotificationBlock, 0);
  objc_storeStrong(&self->mBtConnectedLinksObserver, 0);
}

@end
