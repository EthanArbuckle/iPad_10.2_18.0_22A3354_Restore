@implementation B2PEngine

- (B2PEngine)initWithDelegate:(id)a3
{
  id v4;
  B2PEngine *v5;
  B2PEngine *v6;
  void **p_client_context;
  uint64_t v8;
  NSMutableArray *scheduledTimers;
  NSLock *v10;
  NSLock *b2pLock;
  os_log_t v12;
  OS_os_log *log;
  int v15;
  __int16 v16;
  _QWORD v17[4];
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)B2PEngine;
  v5 = -[B2PEngine init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    p_client_context = &v5->_b2pContext.client_context;
    v18 = 0u;
    v19 = 0u;
    v17[0] = 0x4000000010000;
    v17[1] = v5->_b2pReceiveBuffer;
    v17[2] = v5->_b2pLinkLinearBuffer;
    v17[3] = v5->_b2pTransmitBuffer;
    b2p_init((uint64_t)&v5->_b2pContext, (uint64_t)v17);
    *p_client_context = v6;
    v15 = 131072050;
    v16 = 1;
    b2p_enable((__int16 *)&v6->_b2pContext, (uint64_t)&v15);
    b2p_set_max_attempts((uint64_t)&v6->_b2pContext, 6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    scheduledTimers = v6->_scheduledTimers;
    v6->_scheduledTimers = (NSMutableArray *)v8;

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    b2pLock = v6->_b2pLock;
    v6->_b2pLock = v10;

    objc_storeWeak((id *)&v6->_delegate, v4);
    v12 = os_log_create("com.apple.accessoryupdater.uarp", "b2pEngine");
    log = v6->_log;
    v6->_log = (OS_os_log *)v12;

    *(_QWORD *)&v6->_category = 0x1000000FFLL;
  }

  return v6;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_scheduledTimers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)B2PEngine;
  -[B2PEngine dealloc](&v8, sel_dealloc);
}

- (void)setMaxTransmitAttempts:(unsigned __int8)a3
{
  b2p_set_max_attempts((uint64_t)&self->_b2pContext, a3);
}

- (BOOL)startPacketDumperWithFileName:(id)a3 productID:(unsigned __int16)a4 dataSessionProtocol:(unsigned __int8)a5
{
  return 0;
}

- (void)receiveData:(id)a3
{
  $B0A435CEAA173DAC85F86EADA8768106 *p_b2pContext;
  id v4;
  unsigned __int8 *v5;
  unsigned __int16 v6;

  p_b2pContext = &self->_b2pContext;
  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned __int8 *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  b2p_recv_bytes(p_b2pContext, v5, v6);
}

- (BOOL)sendCommand:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "opCode");

  v7 = objc_retainAutorelease(v5);
  LOBYTE(self) = b2p_send_command((uint64_t)&self->_b2pContext, v6, (char *)objc_msgSend(v7, "bytes"), (unsigned __int16)objc_msgSend(v7, "length")) == 0;

  return (char)self;
}

- (BOOL)sendResponse:(id)a3
{
  id v4;
  void *v5;
  __int16 v6;
  char v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "opCodeField");
  v7 = objc_msgSend(v4, "status");

  v8 = objc_retainAutorelease(v5);
  LOBYTE(self) = b2p_send_response((uint64_t)&self->_b2pContext, v6, v7, (const void *)objc_msgSend(v8, "bytes"), (unsigned __int16)objc_msgSend(v8, "length")) == 0;

  return (char)self;
}

- (id)inputCommandWithOpCode:(unsigned __int16)a3 data:(id)a4
{
  unsigned int v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  B2PDataSessionDataCommand *v9;
  id WeakRetained;
  char v11;
  B2PResponse *v12;

  v4 = a3;
  v6 = a4;
  v7 = v4 & 0xFFF;
  v8 = v4 >> 12;
  if ((_DWORD)v7 != 18)
  {
    v9 = 0;
LABEL_6:
    v12 = -[B2PResponse initWithOpCode:route:status:]([B2PResponse alloc], "initWithOpCode:route:status:", v7, v8, 2);
    goto LABEL_7;
  }
  v9 = -[B2PCommand initWithOpCode:route:data:]([B2PDataSessionDataCommand alloc], "initWithOpCode:route:data:", 18, v8, v6);
  if (!v9)
    goto LABEL_6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_msgSend(WeakRetained, "receivedCommand:", v9);

  if ((v11 & 1) == 0)
    goto LABEL_6;
  v12 = 0;
LABEL_7:

  return v12;
}

- (void)inputCommandResponseWithOpCode:(unsigned __int16)a3 status:(int)a4 data:(id)a5
{
  uint64_t v5;
  unsigned int v6;
  id v8;
  int v9;
  uint64_t v10;
  B2PDataSessionConnectResponse *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  B2PResponse *v16;
  NSObject *v17;
  id WeakRetained;
  NSObject *log;
  _DWORD v20[2];
  uint64_t v21;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = v6 & 0xFFF;
  if (!objc_msgSend(v8, "length"))
  {
    v11 = [B2PResponse alloc];
    v12 = v6 & 0xFFF;
    v13 = v6 >> 12;
    v14 = v5;
    v15 = 0;
    goto LABEL_25;
  }
  if ((v6 & 0xFFF) <= 0x26)
  {
    if ((v6 & 0xFFF) > 0x10)
    {
      if (v9 == 17)
      {
        v10 = v6 >> 12;
        v11 = [B2PDataSessionConnectResponse alloc];
        v12 = 17;
        goto LABEL_24;
      }
      if (v9 == 19)
      {
        v10 = v6 >> 12;
        v11 = [B2PDataSessionDataResponse alloc];
        v12 = 19;
        goto LABEL_24;
      }
    }
    else
    {
      if (v9 == 1)
      {
        v10 = v6 >> 12;
        v11 = [B2PPingResponse alloc];
        v12 = 1;
        goto LABEL_24;
      }
      if (v9 == 3)
      {
        v10 = v6 >> 12;
        v11 = [B2PIdentificationResponse alloc];
        v12 = 3;
        goto LABEL_24;
      }
    }
LABEL_30:
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v20[0] = 67109120;
      v20[1] = v6 & 0xFFF;
      _os_log_impl(&dword_24BC99000, log, OS_LOG_TYPE_INFO, "Command response with op code 0x%04x is not supported", (uint8_t *)v20, 8u);
    }
    goto LABEL_28;
  }
  if ((v6 & 0xFFF) <= 0x128)
  {
    if (v9 == 39)
    {
      v10 = v6 >> 12;
      v11 = [B2PDataSessionDiscoveryResponse alloc];
      v12 = 39;
      goto LABEL_24;
    }
    if (v9 == 277)
    {
      v10 = v6 >> 12;
      v11 = [B2PSerialNumberGetResponse alloc];
      v12 = 277;
      goto LABEL_24;
    }
    goto LABEL_30;
  }
  if (v9 == 297)
  {
    v10 = v6 >> 12;
    v11 = [B2PBudVersionGetResponse alloc];
    v12 = 297;
    goto LABEL_24;
  }
  if (v9 == 313)
  {
    v10 = v6 >> 12;
    v11 = [B2PProductCategoryGetResponse alloc];
    v12 = 313;
    goto LABEL_24;
  }
  if (v9 != 375)
    goto LABEL_30;
  v10 = v6 >> 12;
  v11 = [B2PAutoHealGetResponse alloc];
  v12 = 375;
LABEL_24:
  v13 = v10;
  v14 = v5;
  v15 = v8;
LABEL_25:
  v16 = -[B2PResponse initWithOpCode:route:status:data:](v11, "initWithOpCode:route:status:data:", v12, v13, v14, v15);
  if (!v16)
  {
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[B2PEngine inputCommandResponseWithOpCode:status:data:].cold.1(v6 & 0xFFF, v17);
LABEL_28:
    v16 = -[B2PResponse initWithOpCode:route:status:]([B2PResponse alloc], "initWithOpCode:route:status:", v6 & 0xFFF, v6 >> 12, 5);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "receivedResponse:", v16);

}

- (void)resetWithReason:(int)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "b2pReset:", v3);

}

- (int)sendData:(id)a3
{
  B2PEngineDelegate **p_delegate;
  id v4;
  id WeakRetained;
  int v6;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_msgSend(WeakRetained, "sendData:", v4);

  return v6 ^ 1;
}

- (void)startTimerType:(int)a3 deadlineMS:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  B2PTimer *v7;
  id WeakRetained;
  void *v9;
  B2PTimer *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  objc_initWeak(&location, self);
  v7 = [B2PTimer alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __39__B2PEngine_startTimerType_deadlineMS___block_invoke;
  v14 = &unk_251CE3BB8;
  objc_copyWeak(&v15, &location);
  v10 = -[B2PTimer initWithDeadlineMS:type:queue:block:](v7, "initWithDeadlineMS:type:queue:block:", v4, v5, v9, &v11);

  -[B2PTimer start](v10, "start", v11, v12, v13, v14);
  -[NSMutableArray addObject:](self->_scheduledTimers, "addObject:", v10);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __39__B2PEngine_startTimerType_deadlineMS___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "timerFired:", v3);

}

- (void)stopTimerType:(int)a3
{
  NSMutableArray **p_scheduledTimers;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  p_scheduledTimers = &self->_scheduledTimers;
  v5 = self->_scheduledTimers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v11) == a3)
        {
          objc_msgSend(v10, "cancel");
          -[NSMutableArray removeObject:](*p_scheduledTimers, "removeObject:", v10);
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)b2pTimerForNSTimer:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_scheduledTimers;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "timer", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)timerFired:(id)a3
{
  if (a3)
    ((void (*)($B0A435CEAA173DAC85F86EADA8768106 *, uint64_t))sTimerCallback)(&self->_b2pContext, objc_msgSend(a3, "type"));
}

- (void)lock
{
  -[NSLock lock](self->_b2pLock, "lock");
}

- (void)unlock
{
  -[NSLock unlock](self->_b2pLock, "unlock");
}

- (int)debugLevel
{
  return self->_debugLevel;
}

- (void)setDebugLevel:(int)a3
{
  self->_debugLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_b2pLock, 0);
  objc_storeStrong((id *)&self->_scheduledTimers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)inputCommandResponseWithOpCode:(unsigned __int16)a1 status:(NSObject *)a2 data:.cold.1(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_24BC99000, a2, OS_LOG_TYPE_ERROR, "Unable to parse command response for op code 0x%04x", (uint8_t *)v2, 8u);
}

@end
