@implementation W5Client

void __16__W5Client_init__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __16__W5Client_init__block_invoke_2;
  block[3] = &unk_24C23D0C8;
  block[4] = v1;
  dispatch_async(v1, block);
}

void __16__W5Client_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *OSLog;
  void *context;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315650;
    v20 = "-[W5Client init]_block_invoke_2";
    v21 = 2080;
    v22 = "W5Client.m";
    v23 = 1024;
    v24 = 92;
    LODWORD(v13) = 28;
    v12 = &v19;
    _os_log_send_and_compose_impl();
  }
  context = dispatch_get_context(*(dispatch_object_t *)(a1 + 32));
  if (context)
  {
    v5 = context;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    if (v6 - *((double *)v5 + 3) >= 10.0)
    {
      *((double *)v5 + 3) = v6;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = (void *)*((_QWORD *)v5 + 8);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v5, "startMonitoringFaultEventsForPeer:eventHandler:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), objc_msgSend(*((id *)v5 + 6), "objectForKeyedSubscript:", objc_msgSend(v5, "__eventCallbackSignatureForEventID:peer:", 38, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v12, v13)), 0);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }
      if (objc_msgSend(*((id *)v5 + 4), "count", v12, v13))
        objc_msgSend(v5, "__startMonitoringEvents:reply:", (id)objc_msgSend(*((id *)v5 + 4), "copy"), 0);
    }
  }
  objc_autoreleasePoolPop(v2);
}

+ (id)sharedClient
{
  if (qword_253D89D80 != -1)
    dispatch_once(&qword_253D89D80, &__block_literal_global_2);
  return (id)_MergedGlobals_2;
}

W5Client *__24__W5Client_sharedClient__block_invoke()
{
  W5Client *result;

  result = objc_alloc_init(W5Client);
  _MergedGlobals_2 = (uint64_t)result;
  return result;
}

- (W5Client)init
{
  W5Client *v2;
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMutableSet *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  uint64_t v13;
  _QWORD v15[5];
  _QWORD v16[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)W5Client;
  v2 = -[W5Client init](&v17, sel_init);
  if (!v2)
    goto LABEL_11;
  v3 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.wifivelocity.client.%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1880], "UUID"), "UUIDString")), "UTF8String");
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = dispatch_queue_create(v3, v4);
  v2->_queue = (OS_dispatch_queue *)v5;
  if (!v5)
    goto LABEL_11;
  dispatch_queue_set_specific(v5, &v2->_queue, (void *)1, 0);
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v2->_mutableEventIDs = v6;
  if (!v6)
    goto LABEL_11;
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v2->_mutableUUIDs = v7;
  if (!v7)
    goto LABEL_11;
  v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v2->_mutableFaultEventMonitoringPeers = v8;
  if (!v8)
    goto LABEL_11;
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  v2->_mutableEventCallbackMap = v9;
  if (v9
    && (v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]),
        (v2->_mutablePeerEventCallbackMap = v10) != 0)
    && (v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.wifivelocityd"), 4096), (v2->_conn = (NSXPCConnection *)v11) != 0))
  {
    -[NSXPCConnection setRemoteObjectInterface:](v2->_conn, "setRemoteObjectInterface:", W5XPCRequestDelegateInterface());
    -[NSXPCConnection setExportedInterface:](v2->_conn, "setExportedInterface:", W5XPCEventDelegateInterface());
    dispatch_set_context((dispatch_object_t)v2->_queue, v2);
    queue = v2->_queue;
    v13 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __16__W5Client_init__block_invoke;
    v16[3] = &unk_24C23D0C8;
    v16[4] = queue;
    -[NSXPCConnection setInterruptionHandler:](v2->_conn, "setInterruptionHandler:", v16);
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __16__W5Client_init__block_invoke_12;
    v15[3] = &unk_24C23D0C8;
    v15[4] = queue;
    -[NSXPCConnection setInvalidationHandler:](v2->_conn, "setInvalidationHandler:", v15);
    -[NSXPCConnection resume](v2->_conn, "resume");
  }
  else
  {
LABEL_11:

    return 0;
  }
  return v2;
}

void __16__W5Client_init__block_invoke_12(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), &__block_literal_global_14);
}

void __16__W5Client_init__block_invoke_2_13()
{
  void *v0;
  NSObject *OSLog;

  v0 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
    _os_log_send_and_compose_impl();
  objc_autoreleasePoolPop(v0);
}

- (void)dealloc
{
  NSObject *queue;
  const char *label;
  const char *v5;
  NSObject *v6;
  objc_super v7;
  _QWORD block[5];

  -[NSXPCConnection setInvalidationHandler:](self->_conn, "setInvalidationHandler:", 0);
  -[NSXPCConnection setInterruptionHandler:](self->_conn, "setInterruptionHandler:", 0);
  -[NSXPCConnection invalidate](self->_conn, "invalidate");

  queue = self->_queue;
  if (queue)
  {
    label = dispatch_queue_get_label(0);
    v5 = dispatch_queue_get_label(queue);
    if (label && v5 && !strcmp(label, v5))
    {
      dispatch_set_context(queue, 0);
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __19__W5Client_dealloc__block_invoke_3;
      block[3] = &unk_24C23D0C8;
      block[4] = self;
      dispatch_sync(queue, block);
    }
  }

  v6 = self->_queue;
  if (v6)
    dispatch_release(v6);
  v7.receiver = self;
  v7.super_class = (Class)W5Client;
  -[W5Client dealloc](&v7, sel_dealloc);
}

void __19__W5Client_dealloc__block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD17D48]();
  dispatch_set_context(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16), 0);
  objc_autoreleasePoolPop(v2);
}

- (void)setEventCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_eventCallback = (id)objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __29__W5Client_setEventCallback___block_invoke;
    v6[3] = &unk_24C23D110;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

void __29__W5Client_setEventCallback___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD17D48]();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_autoreleasePoolPop(v2);
}

- (void)__startMonitoringEvents:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke;
  block[3] = &unk_24C23D1B0;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(queue, block);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  uint64_t v11;
  _QWORD v12[7];

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (objc_msgSend(*(id *)(a1 + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setExportedObject:");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 8);
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_2;
  v12[3] = &unk_24C23D138;
  v12[4] = v3;
  v12[5] = v4;
  v12[6] = *(_QWORD *)(a1 + 48);
  v7 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_5;
  v9[3] = &unk_24C23D138;
  v8 = *(int8x16_t *)(a1 + 32);
  v10 = vextq_s8(v8, v8, 8uLL);
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "startMonitoringEvents:reply:", v8.i64[0], v9);
  objc_autoreleasePoolPop(v2);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_2(int8x16_t *a1, uint64_t a2)
{
  int8x16_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[1] = 3221225472;
  v2 = vextq_s8(a1[2], a1[2], 8uLL);
  v3 = a1[2].i64[0];
  v6[0] = MEMORY[0x24BDAC760];
  v4 = *(NSObject **)(v3 + 16);
  v6[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v5 = a1[3].i64[0];
  v8 = a2;
  v9 = v5;
  dispatch_async(v4, v6);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *global_queue;
  _QWORD v9[4];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_4;
  v9[3] = &unk_24C23D110;
  v10 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v9);
  objc_autoreleasePoolPop(v2);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_5(int8x16_t *a1, uint64_t a2)
{
  int8x16_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  int8x16_t v6;
  uint64_t v7;

  v5[1] = 3221225472;
  v2 = vextq_s8(a1[2], a1[2], 8uLL);
  v3 = a1[2].i64[0];
  v5[0] = MEMORY[0x24BDAC760];
  v4 = *(NSObject **)(v3 + 16);
  v5[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_6;
  v5[3] = &unk_24C23D250;
  v5[4] = a2;
  v6 = v2;
  v7 = a1[3].i64[0];
  dispatch_async(v4, v5);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_6(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *OSLog;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *global_queue;
  uint64_t v13;
  _QWORD block[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  if (a1[4])
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = (void *)a1[5];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(a1[6] + 32), "removeObjectIdenticalTo:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v5);
    }
    if (!objc_msgSend(*(id *)(a1[6] + 32), "count") && !objc_msgSend(*(id *)(a1[6] + 40), "count"))
      objc_msgSend(*(id *)(a1[6] + 8), "setExportedObject:", 0);
    OSLog = W5GetOSLog();
    v9 = os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT);
    v10 = a1[4];
    if (v9)
    {
      v11 = a1[5];
      v19 = 138543618;
      v20 = v11;
      v21 = 2114;
      v22 = v10;
      _os_log_send_and_compose_impl();
      v10 = a1[4];
    }
  }
  else
  {
    v10 = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__W5Client___startMonitoringEvents_reply___block_invoke_18;
  block[3] = &unk_24C23D110;
  v13 = a1[7];
  block[4] = v10;
  block[5] = v13;
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __42__W5Client___startMonitoringEvents_reply___block_invoke_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (void)startMonitoringEvents:(id)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__W5Client_startMonitoringEvents___block_invoke;
  v7[3] = &unk_24C23D160;
  v7[4] = v5;
  -[W5Client __startMonitoringEvents:reply:](self, "__startMonitoringEvents:reply:", a3, v7);
  v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v9 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __34__W5Client_startMonitoringEvents___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)__stopMonitoringEvents:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke;
  block[3] = &unk_24C23D1B0;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  __int128 v7;
  _QWORD v8[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_2;
  v8[3] = &unk_24C23D188;
  v8[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_4;
  v6[3] = &unk_24C23D138;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v5, "stopMonitoringEvents:reply:", (_QWORD)v7, v6);
  objc_autoreleasePoolPop(v2);
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

__n128 __41__W5Client___stopMonitoringEvents_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_5;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke_5(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__W5Client___stopMonitoringEvents_reply___block_invoke_6;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __41__W5Client___stopMonitoringEvents_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (void)stopMonitoringEvents:(id)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__W5Client_stopMonitoringEvents___block_invoke;
  v7[3] = &unk_24C23D160;
  v7[4] = v5;
  -[W5Client __stopMonitoringEvents:reply:](self, "__stopMonitoringEvents:reply:", a3, v7);
  v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v9 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __33__W5Client_stopMonitoringEvents___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)__queryLocalPeerAndReply:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke;
  v4[3] = &unk_24C23D110;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = MEMORY[0x24BDAC760];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke_2;
  v8[3] = &unk_24C23D188;
  v8[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke_4;
  v7[3] = &unk_24C23D1D8;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "queryLocalPeerAndReply:", v7);
  objc_autoreleasePoolPop(v2);
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__W5Client___queryLocalPeerAndReply___block_invoke_5;
  block[3] = &unk_24C23D1B0;
  v7 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

void __37__W5Client___queryLocalPeerAndReply___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (id)localPeer
{
  NSObject *v3;
  dispatch_time_t v4;
  id v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v3 = dispatch_semaphore_create(0);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __21__W5Client_localPeer__block_invoke;
  v8[3] = &unk_24C23D200;
  v8[4] = v3;
  v8[5] = &v9;
  -[W5Client __queryLocalPeerAndReply:](self, "__queryLocalPeerAndReply:", v8);
  v4 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v3, v4) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v16 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v5 = (id)v10[5];
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

intptr_t __21__W5Client_localPeer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a3, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)peers
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)queryStatusForPeer:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke;
  block[3] = &unk_24C23D1B0;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[6];

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(a1[4] + 32), "count") && !objc_msgSend(*(id *)(a1[4] + 40), "count"))
    objc_msgSend(*(id *)(a1[4] + 8), "setExportedObject:");
  v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_2;
  v11[3] = &unk_24C23D228;
  v6 = a1[6];
  v11[4] = v3;
  v11[5] = v6;
  v7 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v11);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_5;
  v10[3] = &unk_24C23D278;
  v8 = a1[5];
  v9 = a1[6];
  v10[4] = a1[4];
  v10[5] = v9;
  objc_msgSend(v7, "queryStatusForPeer:reply:", v8, v10);
  objc_autoreleasePoolPop(v2);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_3;
  block[3] = &unk_24C23D1B0;
  block[5] = a2;
  block[6] = v3;
  block[4] = v2;
  dispatch_async(v4, block);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[8];

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_6;
  v6[3] = &unk_24C23D250;
  v6[4] = v3;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = v4;
  dispatch_async(v5, v6);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__W5Client_queryStatusForPeer_reply___block_invoke_7;
  block[3] = &unk_24C23D1B0;
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __37__W5Client_queryStatusForPeer_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (id)queryStatusForPeer:(id)a3 error:(id *)a4
{
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __37__W5Client_queryStatusForPeer_error___block_invoke;
  v14[3] = &unk_24C23D2A0;
  v14[5] = &v15;
  v14[6] = &v21;
  v14[4] = v7;
  -[W5Client queryStatusForPeer:reply:](self, "queryStatusForPeer:reply:", a3, v14);
  v8 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v7, v8) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v28 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v9 = (id)v16[5];
  v10 = (id)v22[5];
  if (a4)
  {
    v11 = (void *)v16[5];
    if (v11)
      *a4 = v11;
  }
  v12 = (void *)v22[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

intptr_t __37__W5Client_queryStatusForPeer_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)queryDatabaseForPeer:(id)a3 fetch:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke;
  v6[3] = &unk_24C23D250;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(void **)(a1[4] + 8);
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_2;
  v9[3] = &unk_24C23D188;
  v9[4] = a1[7];
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v6 = a1[5];
  v7 = a1[6];
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_4;
  v8[3] = &unk_24C23D2C8;
  v8[4] = a1[7];
  objc_msgSend(v5, "queryDatabaseForPeer:fetch:reply:", v6, v7, v8);
  objc_autoreleasePoolPop(v2);
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_5;
  block[3] = &unk_24C23D1B0;
  v7 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

void __45__W5Client_queryDatabaseForPeer_fetch_reply___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (void)requestFileFromPeer:(id)a3 remoteFilePath:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke;
  v6[3] = &unk_24C23D250;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[6];

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(a1[4] + 40), "count") && !objc_msgSend(*(id *)(a1[4] + 32), "count"))
    objc_msgSend(*(id *)(a1[4] + 8), "setExportedObject:");
  v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_2;
  v12[3] = &unk_24C23D228;
  v6 = a1[7];
  v12[4] = v3;
  v12[5] = v6;
  v7 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v12);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_5;
  v11[3] = &unk_24C23D558;
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11[4] = a1[4];
  v11[5] = v10;
  objc_msgSend(v7, "requestFileFromPeer:remoteFilePath:reply:", v8, v9, v11);
  objc_autoreleasePoolPop(v2);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_3;
  block[3] = &unk_24C23D1B0;
  block[5] = a2;
  block[6] = v3;
  block[4] = v2;
  dispatch_async(v4, block);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[8];

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_6;
  v6[3] = &unk_24C23D250;
  v6[4] = v3;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = v4;
  dispatch_async(v5, v6);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_7;
  block[3] = &unk_24C23D1B0;
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __53__W5Client_requestFileFromPeer_remoteFilePath_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (void)listFilesFromPeer:(id)a3 remoteDirPath:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke;
  v6[3] = &unk_24C23D250;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[6];

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(a1[4] + 40), "count") && !objc_msgSend(*(id *)(a1[4] + 32), "count"))
    objc_msgSend(*(id *)(a1[4] + 8), "setExportedObject:");
  v3 = a1[4];
  v4 = *(void **)(v3 + 8);
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_2;
  v12[3] = &unk_24C23D228;
  v6 = a1[7];
  v12[4] = v3;
  v12[5] = v6;
  v7 = (void *)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v12);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_5;
  v11[3] = &unk_24C23D2F0;
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11[4] = a1[4];
  v11[5] = v10;
  objc_msgSend(v7, "listFilesFromPeer:remoteDirPath:reply:", v8, v9, v11);
  objc_autoreleasePoolPop(v2);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[7];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_3;
  block[3] = &unk_24C23D1B0;
  block[5] = a2;
  block[6] = v3;
  block[4] = v2;
  dispatch_async(v4, block);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[8];

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_6;
  v6[3] = &unk_24C23D250;
  v6[4] = v3;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = v4;
  dispatch_async(v5, v6);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_7;
  block[3] = &unk_24C23D1B0;
  v6 = *(_QWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 40);
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __50__W5Client_listFilesFromPeer_remoteDirPath_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (void)queryDebugConfigurationForPeer:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke;
  block[3] = &unk_24C23D1B0;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(void **)(a1[4] + 8);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_2;
  v8[3] = &unk_24C23D188;
  v8[4] = a1[6];
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_4;
  v7[3] = &unk_24C23D318;
  v6 = a1[5];
  v7[4] = a1[6];
  objc_msgSend(v5, "queryDebugConfigurationForPeer:reply:", v6, v7);
  objc_autoreleasePoolPop(v2);
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_5;
  block[3] = &unk_24C23D1B0;
  v7 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

void __49__W5Client_queryDebugConfigurationForPeer_reply___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (id)queryDebugConfigurationForPeer:(id)a3 error:(id *)a4
{
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v7 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__W5Client_queryDebugConfigurationForPeer_error___block_invoke;
  v14[3] = &unk_24C23D340;
  v14[5] = &v15;
  v14[6] = &v21;
  v14[4] = v7;
  -[W5Client queryDebugConfigurationForPeer:reply:](self, "queryDebugConfigurationForPeer:reply:", a3, v14);
  v8 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v7, v8) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v28 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v9 = (id)v16[5];
  v10 = (id)v22[5];
  if (a4)
  {
    v11 = (void *)v16[5];
    if (v11)
      *a4 = v11;
  }
  v12 = (void *)v22[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v12;
}

intptr_t __49__W5Client_queryDebugConfigurationForPeer_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setDebugConfiguration:(id)a3 peer:(id)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[8];

  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke;
  v6[3] = &unk_24C23D250;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_async(queue, v6);
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(void **)(a1[4] + 8);
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_2;
  v9[3] = &unk_24C23D188;
  v9[4] = a1[7];
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v6 = a1[5];
  v7 = a1[6];
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_4;
  v8[3] = &unk_24C23D188;
  v8[4] = a1[7];
  objc_msgSend(v5, "setDebugConfiguration:peer:reply:", v6, v7, v8);
  objc_autoreleasePoolPop(v2);
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_5;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __45__W5Client_setDebugConfiguration_peer_reply___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (BOOL)setDebugConfiguration:(id)a3 peer:(id)a4 error:(id *)a5
{
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  uint64_t *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v9 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __45__W5Client_setDebugConfiguration_peer_error___block_invoke;
  v16[3] = &unk_24C23D368;
  v16[4] = v9;
  v16[5] = &v17;
  -[W5Client setDebugConfiguration:peer:reply:](self, "setDebugConfiguration:peer:reply:", a3, a4, v16);
  v10 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v9, v10) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v24 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v11 = (id)v18[5];
  v12 = v18;
  v13 = (void *)v18[5];
  if (a5 && v13)
  {
    *a5 = v13;
    v13 = (void *)v12[5];
  }
  v14 = v13 == 0;
  _Block_object_dispose(&v17, 8);
  return v14;
}

intptr_t __45__W5Client_setDebugConfiguration_peer_error___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)runDiagnostics:(id)a3 configuration:(id)a4 update:(id)a5 reply:(id)a6
{
  void *v11;
  NSObject *queue;
  _QWORD v14[10];

  v11 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke;
  v14[3] = &unk_24C23D5F8;
  v14[4] = self;
  v14[5] = v11;
  v14[8] = a5;
  v14[9] = a6;
  v14[6] = a4;
  v14[7] = a3;
  dispatch_async(queue, v14);
  return v11;
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  __int128 v8;
  void *v9;
  _QWORD v10[4];
  __int128 v11;
  uint64_t v12;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v4, objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    if (!objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("IncludeEvents")))
    {
      v5 = *(void **)(a1 + 48);
      if (v5)
        v6 = (id)objc_msgSend(v5, "mutableCopy");
      else
        v6 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v7 = v6;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IncludeEvents"));
      v3 = (id)objc_msgSend(v7, "copy");
    }
  }
  v10[0] = MEMORY[0x24BDAC760];
  v8 = *(_OWORD *)(a1 + 32);
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v10[1] = 3221225472;
  v10[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_2;
  v10[3] = &unk_24C23D138;
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 72);
  objc_msgSend((id)objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v10), "runDiagnostics:configuration:uuid:reply:", *(_QWORD *)(a1 + 56), v3, MEMORY[0x24BDAC760], 3221225472, __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_5, &unk_24C23D390, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  objc_autoreleasePoolPop(v2);
}

__n128 __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

__n128 __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_6;
  block[3] = &unk_24C23D728;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v5;
  v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_7;
  block[3] = &unk_24C23D1B0;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __54__W5Client_runDiagnostics_configuration_update_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (id)runDiagnostics:(id)a3 configuration:(id)a4 update:(id)a5 error:(id *)a6
{
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v11 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__W5Client_runDiagnostics_configuration_update_error___block_invoke;
  v18[3] = &unk_24C23D3B8;
  v18[5] = &v19;
  v18[6] = &v25;
  v18[4] = v11;
  -[W5Client runDiagnostics:configuration:update:reply:](self, "runDiagnostics:configuration:update:reply:", a3, a4, a5, v18);
  v12 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v11, v12) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v32 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v13 = (id)v20[5];
  v14 = (id)v26[5];
  if (a6)
  {
    v15 = (void *)v20[5];
    if (v15)
      *a6 = v15;
  }
  v16 = (void *)v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

intptr_t __54__W5Client_runDiagnostics_configuration_update_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)runDiagnosticsForPeer:(id)a3 diagnostics:(id)a4 configuration:(id)a5 reply:(id)a6
{
  void *v11;
  NSObject *queue;
  _QWORD v14[10];

  v11 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke;
  v14[3] = &unk_24C23D3E0;
  v14[4] = self;
  v14[5] = v11;
  v14[6] = a3;
  v14[7] = a4;
  v14[8] = a5;
  v14[9] = a6;
  dispatch_async(queue, v14);
  return v11;
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v5[0] = MEMORY[0x24BDAC760];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[1] = 3221225472;
  v5[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_2;
  v5[3] = &unk_24C23D138;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 72);
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5), "runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), MEMORY[0x24BDAC760], 3221225472, __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_5, &unk_24C23D390, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  objc_autoreleasePoolPop(v2);
}

__n128 __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

__n128 __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_6;
  block[3] = &unk_24C23D728;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v5;
  v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_7;
  block[3] = &unk_24C23D1B0;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __66__W5Client_runDiagnosticsForPeer_diagnostics_configuration_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (BOOL)registerRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v9;
  NSObject *queue;
  NSXPCConnection *conn;
  id v12;
  uint64_t *v13;
  NSObject *v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD block[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v9 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke;
  block[3] = &unk_24C23D0C8;
  block[4] = self;
  dispatch_async(queue, block);
  conn = self->_conn;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_2;
  v19[3] = &unk_24C23D408;
  v19[4] = &v21;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_3;
  v18[3] = &unk_24C23D408;
  v18[4] = &v21;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v19), "registerRemoteDiagnosticEventsForPeer:configuration:reply:", a3, a4, v18);
  v12 = (id)v22[5];
  v13 = v22;
  if (v22[5])
  {
    v14 = self->_queue;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_4;
    v17[3] = &unk_24C23D0C8;
    v17[4] = self;
    dispatch_async(v14, v17);
    v13 = v22;
    if (a5)
      *a5 = (id)v22[5];
  }
  v15 = v13[5] == 0;
  _Block_object_dispose(&v21, 8);
  return v15;
}

void __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __70__W5Client_registerRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_4(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)unregisterRemoteDiagnosticEventsForPeer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v9;
  NSObject *queue;
  NSXPCConnection *conn;
  id v12;
  uint64_t *v13;
  NSObject *v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD block[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v9 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke;
  block[3] = &unk_24C23D0C8;
  block[4] = self;
  dispatch_async(queue, block);
  conn = self->_conn;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_2;
  v19[3] = &unk_24C23D408;
  v19[4] = &v21;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_3;
  v18[3] = &unk_24C23D408;
  v18[4] = &v21;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v19), "unregisterRemoteDiagnosticEventsForPeer:configuration:reply:", a3, a4, v18);
  v12 = (id)v22[5];
  v13 = v22;
  if (v22[5])
  {
    v14 = self->_queue;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_4;
    v17[3] = &unk_24C23D0C8;
    v17[4] = self;
    dispatch_async(v14, v17);
    v13 = v22;
    if (a5)
      *a5 = (id)v22[5];
  }
  v15 = v13[5] == 0;
  _Block_object_dispose(&v21, 8);
  return v15;
}

void __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __72__W5Client_unregisterRemoteDiagnosticEventsForPeer_configuration_error___block_invoke_4(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_autoreleasePoolPop(v2);
}

- (void)queryRegisteredDiagnosticsPeersWithReply:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke;
  v4[3] = &unk_24C23D110;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = MEMORY[0x24BDAC760];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_2;
  v8[3] = &unk_24C23D188;
  v8[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_4;
  v7[3] = &unk_24C23D2C8;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "queryRegisteredDiagnosticsPeersWithReply:", v7);
  objc_autoreleasePoolPop(v2);
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *global_queue;
  uint64_t v7;
  _QWORD block[7];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_5;
  block[3] = &unk_24C23D1B0;
  v7 = *(_QWORD *)(a1 + 32);
  block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

void __53__W5Client_queryRegisteredDiagnosticsPeersWithReply___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (id)startDiagnosticsModeWithConfiguration:(id)a3 reply:(id)a4
{
  void *v7;
  NSObject *queue;
  _QWORD v10[8];

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke;
  v10[3] = &unk_24C23D250;
  v10[4] = self;
  v10[5] = v7;
  v10[6] = a3;
  v10[7] = a4;
  dispatch_async(queue, v10);
  return v7;
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  _QWORD v11[4];
  __int128 v12;
  uint64_t v13;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v3 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11[1] = 3221225472;
  v11[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_2;
  v11[3] = &unk_24C23D138;
  v12 = v4;
  v13 = *(_QWORD *)(a1 + 56);
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v11);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_5;
  v8[3] = &unk_24C23D430;
  v9 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v6, "startDiagnosticsModeWithConfiguration:reply:", v7, v8);
  objc_autoreleasePoolPop(v2);
}

__n128 __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, 0, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

__n128 __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_6;
  block[3] = &unk_24C23D728;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v5;
  v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_7;
  block[3] = &unk_24C23D1B0;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __56__W5Client_startDiagnosticsModeWithConfiguration_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (id)stopDiagnosticsModeWithUUID:(id)a3 info:(id)a4 reply:(id)a5
{
  uint64_t v9;
  NSObject *queue;
  _QWORD block[9];

  v9 = objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke;
  block[3] = &unk_24C23D728;
  block[4] = self;
  block[5] = v9;
  block[7] = a4;
  block[8] = a5;
  block[6] = a3;
  dispatch_async(queue, block);
  return a3;
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v3 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12[1] = 3221225472;
  v12[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_2;
  v12[3] = &unk_24C23D138;
  v13 = v4;
  v14 = *(_QWORD *)(a1 + 64);
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_5;
  v9[3] = &unk_24C23D138;
  v10 = *(_OWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v6, "stopDiagnosticsModeWithUUID:info:reply:", v7, v8, v9);
  objc_autoreleasePoolPop(v2);
}

__n128 __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

__n128 __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_5(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_6;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_7;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __51__W5Client_stopDiagnosticsModeWithUUID_info_reply___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (id)queryDiagnosticsModeForPeer:(id)a3 info:(id)a4 reply:(id)a5
{
  void *v9;
  NSObject *queue;
  _QWORD block[9];

  v9 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke;
  block[3] = &unk_24C23D728;
  block[4] = self;
  block[5] = v9;
  block[7] = a4;
  block[8] = a5;
  block[6] = a3;
  dispatch_async(queue, block);
  return v9;
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  __int128 v13;
  uint64_t v14;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v3 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12[1] = 3221225472;
  v12[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_2;
  v12[3] = &unk_24C23D138;
  v13 = v4;
  v14 = *(_QWORD *)(a1 + 64);
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_5;
  v9[3] = &unk_24C23D390;
  v10 = *(_OWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v6, "queryDiagnosticsModeForPeer:info:reply:", v7, v8, v9);
  objc_autoreleasePoolPop(v2);
}

__n128 __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

__n128 __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_6;
  block[3] = &unk_24C23D728;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v5;
  v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_7;
  block[3] = &unk_24C23D1B0;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __51__W5Client_queryDiagnosticsModeForPeer_info_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (void)__purgeFilesInDirectory:(id)a3 matching:(id)a4 maxAge:(unint64_t)a5 maxCount:(unint64_t)a6
{
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  NSObject *OSLog;
  int *v30;
  uint64_t v31;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  uint64_t v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v11 = v10;
  v33 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "contentsOfDirectoryAtPath:error:", a3, 0);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    v16 = (double)a5;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", v18), 0), "fileCreationDate"), "timeIntervalSinceReferenceDate");
        v20 = v19;
        if (!a4
          || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v18, 0, 0, objc_msgSend(v18, "length")))
        {
          v21 = objc_msgSend(a3, "stringByAppendingPathComponent:", v18);
          if (v11 - v20 <= v16)
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v21, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20));
          else
            objc_msgSend(v9, "addObject:", v21);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v14);
  }
  v22 = (id)objc_msgSend((id)objc_msgSend(v33, "allKeys"), "mutableCopy");
  objc_msgSend(v22, "sortUsingComparator:", &__block_literal_global_30);
  if (objc_msgSend(v22, "count") > a6 && objc_msgSend(v22, "count") != a6)
  {
    v23 = 0;
    do
      objc_msgSend(v9, "addObject:", objc_msgSend(v33, "objectForKeyedSubscript:", objc_msgSend(v22, "objectAtIndexedSubscript:", v23++)));
    while (v23 < objc_msgSend(v22, "count") - a6);
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(v9);
        v28 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        OSLog = W5GetOSLog();
        if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
        {
          v42 = 138543362;
          v43 = v28;
          LODWORD(v31) = 12;
          v30 = &v42;
          _os_log_send_and_compose_impl();
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v30, v31), "removeItemAtPath:error:", v28, 0);
      }
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v25);
  }
}

uint64_t __61__W5Client___purgeFilesInDirectory_matching_maxAge_maxCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)__mostRecentInDirectories:(id)a3 include:(id)a4 exclude:(id)a5 maxAge:(double)a6
{
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *context;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v31 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v11 = v10;
  v37 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v38 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = a3;
  v34 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v44;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(obj);
        v36 = v12;
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
        context = (void *)MEMORY[0x20BD17D48]();
        v14 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "contentsOfDirectoryAtPath:error:", v13, 0);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v40 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              v20 = (void *)MEMORY[0x20BD17D48]();
              v21 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(v13, "stringByAppendingPathComponent:", v19), 0);
              objc_msgSend((id)objc_msgSend(v21, "fileCreationDate"), "timeIntervalSinceReferenceDate");
              v23 = v22;
              objc_msgSend((id)objc_msgSend(v21, "fileModificationDate"), "timeIntervalSinceReferenceDate");
              v25 = v24;
              v26 = v11 - v23;
              v27 = v11 - v25;
              v28 = v11 - v23 > a6 && v27 > a6;
              if (!v28
                && (!a4
                 || objc_msgSend(a4, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length", v26, v27)))&& (!a5|| !objc_msgSend(a5, "numberOfMatchesInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length", v26, v27)))&& (objc_msgSend(v38, "containsObject:", v19, v26, v27) & 1) == 0)
              {
                if (v23 <= v25)
                  v29 = v25;
                else
                  v29 = v23;
                objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29), objc_msgSend(v13, "stringByAppendingPathComponent:", v19));
                objc_msgSend(v38, "addObject:", v19);
              }
              objc_autoreleasePoolPop(v20);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          }
          while (v16);
        }
        objc_autoreleasePoolPop(context);
        v12 = v36 + 1;
      }
      while (v36 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v34);
  }
  objc_msgSend(v31, "addObjectsFromArray:", objc_msgSend(v37, "keysSortedByValueUsingComparator:", &__block_literal_global_31));
  return (id)objc_msgSend(v31, "copy");
}

uint64_t __61__W5Client___mostRecentInDirectories_include_exclude_maxAge___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (BOOL)__tarballWithSource:(id)a3 destination:(id)a4 error:(id *)a5
{
  return W5CreateTarball(a3, a4, a5);
}

- (id)__collectJetsamFallbackLogsWithReason:(id)a3 compress:(BOOL)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t i;
  unint64_t v15;
  void *v16;
  id v17;
  unint64_t j;
  unint64_t v19;
  void *v20;
  id v21;
  unint64_t k;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  dispatch_time_t v26;
  NSObject *global_queue;
  _QWORD block[5];

  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd_HH.mm.ss.SSS"));
  v8 = objc_msgSend(v7, "stringFromDate:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));
  if (!a3)
    a3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.WiFiVelocity")), "localizedStringForKey:value:table:", CFSTR("kW5LocWiFiDiagnosticsName"), CFSTR("WiFiDiagnostics"), 0);
  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), a3, v8);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("com.apple.wifivelocity")), "stringByAppendingPathComponent:", v9));
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = 0;
  if (objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v10, "path"), 1, 0, 0))
  {
    objc_msgSend(v11, "createFileAtPath:contents:attributes:", objc_msgSend((id)objc_msgSend(v10, "path"), "stringByAppendingPathComponent:", CFSTR("__CRASH__")), objc_msgSend(CFSTR("This file was generated because the XPC call to collect WiFi diagnostics/logs was interrupted or invalidated (most likely jetsam'd). When we detect this condition, we will collect basic WiFi logs inline and try to capture the corresponding crash report for wifivelocityd."), "dataUsingEncoding:", 4), 0);
    -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Logs/wifi.log")), objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("wifi.log")), "URLByAppendingPathExtension:", CFSTR("tgz")), 0);
    v13 = -[W5Client __mostRecentInDirectories:include:exclude:maxAge:](self, "__mostRecentInDirectories:include:exclude:maxAge:", &unk_24C24E170, 0, 0, 86400.0);
    for (i = 0; ; ++i)
    {
      v15 = (unint64_t)objc_msgSend(v13, "count") > 5 ? 6 : objc_msgSend(v13, "count");
      if (i >= v15)
        break;
      v16 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16), objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v16, "lastPathComponent")), "URLByAppendingPathExtension:", CFSTR("tgz")), 0);
    }
    v17 = -[W5Client __mostRecentInDirectories:include:exclude:maxAge:](self, "__mostRecentInDirectories:include:exclude:maxAge:", &unk_24C24E188, 0, 0, 86400.0);
    for (j = 0; ; ++j)
    {
      v19 = (unint64_t)objc_msgSend(v17, "count") > 5 ? 6 : objc_msgSend(v17, "count");
      if (j >= v19)
        break;
      v20 = (void *)objc_msgSend(v17, "objectAtIndexedSubscript:", j);
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v20), objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v20, "lastPathComponent")), "URLByAppendingPathExtension:", CFSTR("tgz")), 0);
    }
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi.plist")), objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi.plist")), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist")), objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("LEGACY_com.apple.wifi-networks.plist")), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist")), objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi-private-mac-networks.plist")), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Preferences/com.apple.wifi.known-networks.plist")), objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi.known-networks.plist")), 0);
    v21 = -[W5Client __mostRecentInDirectories:include:exclude:maxAge:](self, "__mostRecentInDirectories:include:exclude:maxAge:", &unk_24C24E1A0, objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", objc_msgSend(MEMORY[0x24BDD1798], "escapedPatternForString:", CFSTR("wifivelocityd")), 0, 0), 0, 86400.0);
    for (k = 0; ; ++k)
    {
      v23 = (unint64_t)objc_msgSend(v21, "count") > 2 ? 3 : objc_msgSend(v21, "count");
      if (k >= v23)
        break;
      v24 = (void *)objc_msgSend(v21, "objectAtIndexedSubscript:", k);
      objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v24), objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v24, "lastPathComponent")), 0);
    }
    if (a4)
    {
      v25 = objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("tgz"));
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", v10, v25, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v10, 0);
      v10 = (void *)v25;
    }
    v26 = dispatch_time(0, 120000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__W5Client___collectJetsamFallbackLogsWithReason_compress___block_invoke;
    block[3] = &unk_24C23D0C8;
    block[4] = v10;
    dispatch_after(v26, global_queue, block);
    v12 = v10;
  }
  -[W5Client __purgeFilesInDirectory:matching:maxAge:maxCount:](self, "__purgeFilesInDirectory:matching:maxAge:maxCount:", -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("com.apple.wifivelocity")), 0, 28800, 10);
  return v12;
}

void __59__W5Client___collectJetsamFallbackLogsWithReason_compress___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *OSLog;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "path");
    v7[0] = 67109378;
    v7[1] = 120;
    v8 = 2114;
    v9 = v4;
    LODWORD(v6) = 18;
    v5 = v7;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v5, v6), "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

- (id)__collectBusyFallbackLogsWithReason:(id)a3 compress:(BOOL)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t i;
  unint64_t v15;
  void *v16;
  id v17;
  unint64_t j;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  dispatch_time_t v22;
  NSObject *global_queue;
  _QWORD block[5];

  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd_HH.mm.ss.SSS"));
  v8 = objc_msgSend(v7, "stringFromDate:", objc_msgSend(MEMORY[0x24BDBCE60], "date"));
  if (!a3)
    a3 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.WiFiVelocity")), "localizedStringForKey:value:table:", CFSTR("kW5LocWiFiDiagnosticsName"), CFSTR("WiFiDiagnostics"), 0);
  v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), a3, v8);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("com.apple.wifivelocity")), "stringByAppendingPathComponent:", v9));
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = 0;
  if (objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v10, "path"), 1, 0, 0))
  {
    objc_msgSend(v11, "createFileAtPath:contents:attributes:", objc_msgSend((id)objc_msgSend(v10, "path"), "stringByAppendingPathComponent:", CFSTR("__BUSY__")), objc_msgSend(CFSTR("This file was generated because a log collection request is already in progress. When we detect this condition, we will attempt to collect basic WiFi logs inline."), "dataUsingEncoding:", 4), 0);
    -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Logs/wifi.log")), objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("wifi.log")), "URLByAppendingPathExtension:", CFSTR("tgz")), 0);
    v13 = -[W5Client __mostRecentInDirectories:include:exclude:maxAge:](self, "__mostRecentInDirectories:include:exclude:maxAge:", &unk_24C24E1B8, 0, 0, 86400.0);
    for (i = 0; ; ++i)
    {
      v15 = (unint64_t)objc_msgSend(v13, "count") > 5 ? 6 : objc_msgSend(v13, "count");
      if (i >= v15)
        break;
      v16 = (void *)objc_msgSend(v13, "objectAtIndexedSubscript:", i);
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16), objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v16, "lastPathComponent")), "URLByAppendingPathExtension:", CFSTR("tgz")), 0);
    }
    v17 = -[W5Client __mostRecentInDirectories:include:exclude:maxAge:](self, "__mostRecentInDirectories:include:exclude:maxAge:", &unk_24C24E1D0, 0, 0, 86400.0);
    for (j = 0; ; ++j)
    {
      v19 = (unint64_t)objc_msgSend(v17, "count") > 5 ? 6 : objc_msgSend(v17, "count");
      if (j >= v19)
        break;
      v20 = (void *)objc_msgSend(v17, "objectAtIndexedSubscript:", j);
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v20), objc_msgSend((id)objc_msgSend(v10, "URLByAppendingPathComponent:", objc_msgSend(v20, "lastPathComponent")), "URLByAppendingPathExtension:", CFSTR("tgz")), 0);
    }
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi.plist")), objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi.plist")), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi-networks.plist")), objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("LEGACY_com.apple.wifi-networks.plist")), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Preferences/SystemConfiguration/com.apple.wifi-private-mac-networks.plist")), objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi-private-mac-networks.plist")), 0);
    objc_msgSend(v11, "copyItemAtURL:toURL:error:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/Library/Preferences/com.apple.wifi.known-networks.plist")), objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("com.apple.wifi.known-networks.plist")), 0);
    if (a4)
    {
      v21 = objc_msgSend(v10, "URLByAppendingPathExtension:", CFSTR("tgz"));
      -[W5Client __tarballWithSource:destination:error:](self, "__tarballWithSource:destination:error:", v10, v21, 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v10, 0);
      v10 = (void *)v21;
    }
    v22 = dispatch_time(0, 120000000000);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__W5Client___collectBusyFallbackLogsWithReason_compress___block_invoke;
    block[3] = &unk_24C23D0C8;
    block[4] = v10;
    dispatch_after(v22, global_queue, block);
    v12 = v10;
  }
  -[W5Client __purgeFilesInDirectory:matching:maxAge:maxCount:](self, "__purgeFilesInDirectory:matching:maxAge:maxCount:", -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("com.apple.wifivelocity")), 0, 28800, 10);
  return v12;
}

void __57__W5Client___collectBusyFallbackLogsWithReason_compress___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *OSLog;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "path");
    v7[0] = 67109378;
    v7[1] = 120;
    v8 = 2114;
    v9 = v4;
    LODWORD(v6) = 18;
    v5 = v7;
    _os_log_send_and_compose_impl();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v5, v6), "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

- (void)__logsCollectedWithTemporaryURL:(id)a3 outputURL:(id)a4 keepParent:(BOOL)a5 compress:(BOOL)a6 reply:(id)a7
{
  _BOOL4 v8;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *OSLog;
  uint64_t v27;
  uint64_t v28;
  id v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  _BYTE v43[128];
  int v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v8 = a6;
  v50 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  v12 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v39 = 0;
  if ((objc_msgSend(v12, "fileExistsAtPath:isDirectory:", objc_msgSend(a4, "path"), &v39) & 1) == 0)
  {
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", a4, 1, 0, &v40);
    if (!objc_msgSend(v12, "fileExistsAtPath:isDirectory:", objc_msgSend(a4, "path"), &v39))
    {
      if (!a7)
        return;
      v25 = v40;
      goto LABEL_22;
    }
  }
  if (!v39)
  {
    if (!a7)
      return;
    v24 = *MEMORY[0x24BDD1128];
    v41 = *MEMORY[0x24BDD0FD8];
    v42 = CFSTR("ENOENT");
    v25 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v24, 2, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
LABEL_22:
    (*((void (**)(id, uint64_t, _QWORD))a7 + 2))(a7, v25, 0);
    return;
  }
  if (a5 || v8)
  {
    a4 = (id)objc_msgSend(a4, "URLByAppendingPathComponent:", objc_msgSend(a3, "lastPathComponent"));
    v15 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", a3, a4, &v40);
    if (v40)
    {
      OSLog = W5GetOSLog();
      if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_msgSend(a3, "path");
        v28 = objc_msgSend(a4, "path");
        v44 = 138543874;
        v45 = v27;
        v46 = 2114;
        v47 = v28;
        v48 = 2114;
        v49 = v40;
        _os_log_send_and_compose_impl();
      }
    }
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", objc_msgSend(a3, "path"), &v40);
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v13)
    {
      v14 = v13;
      v33 = a7;
      v15 = 0;
      v16 = *(_QWORD *)v36;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v17);
          v19 = a4;
          v20 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", objc_msgSend(a3, "URLByAppendingPathComponent:", v18, v30, v31), objc_msgSend(a4, "URLByAppendingPathComponent:", v18), &v40);
          if (v40)
          {
            v21 = W5GetOSLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v32 = objc_msgSend((id)objc_msgSend(a3, "URLByAppendingPathComponent:", v18), "path");
              v22 = objc_msgSend((id)objc_msgSend(v19, "URLByAppendingPathComponent:", v18), "path");
              v44 = 138543874;
              v45 = v32;
              v46 = 2114;
              v47 = v22;
              v48 = 2114;
              v49 = v40;
              LODWORD(v31) = 32;
              v30 = &v44;
              _os_log_send_and_compose_impl();
            }
          }
          v15 |= v20;
          ++v17;
          a4 = v19;
        }
        while (v14 != v17);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        v14 = v23;
      }
      while (v23);
      a7 = v33;
    }
    else
    {
      v15 = 0;
    }
  }
  if (a7)
  {
    if ((v15 & 1) != 0)
      v29 = a4;
    else
      v29 = 0;
    (*((void (**)(id, uint64_t, id))a7 + 2))(a7, v40, v29);
  }
}

- (id)collectLogs:(id)a3 configuration:(id)a4 update:(id)a5 reply:(id)a6
{
  void *v11;
  NSObject *OSLog;
  NSObject *queue;
  _QWORD block[10];
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316418;
    v17 = "-[W5Client collectLogs:configuration:update:reply:]";
    v18 = 2080;
    v19 = "W5Client.m";
    v20 = 1024;
    v21 = 1488;
    v22 = 2114;
    v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "processName");
    v24 = 1024;
    v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "processIdentifier");
    v26 = 2114;
    v27 = objc_msgSend((id)objc_msgSend(v11, "UUIDString"), "substringToIndex:", 5);
    _os_log_send_and_compose_impl();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke;
  block[3] = &unk_24C23D5F8;
  block[4] = self;
  block[5] = v11;
  block[6] = a4;
  block[7] = a3;
  block[8] = a5;
  block[9] = a6;
  dispatch_async(queue, block);
  return v11;
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  _QWORD v26[4];
  __int128 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v3 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("KeepParent")), "BOOLValue");
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v6 = *(void **)(a1 + 48);
  if (v6)
    v7 = (id)objc_msgSend(v6, "mutableCopy");
  else
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = v7;
  v9 = objc_msgSend(*(id *)(a1 + 56), "count") == 1
    && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 54;
  v10 = objc_msgSend(*(id *)(a1 + 56), "count") == 1
     && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 60;
  v11 = objc_msgSend(*(id *)(a1 + 56), "count") == 1
     && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 59;
  if (objc_msgSend(*(id *)(a1 + 56), "count") == 1
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 56
     || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "firstObject"), "itemID") == 79))
  {
    if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Timeout")), "integerValue") < 1)
      goto LABEL_25;
    v12 = CFSTR("AllowCachedSysdiagnose");
  }
  else
  {
    if (!v10 && !v11 && !v9)
      goto LABEL_25;
    v12 = CFSTR("CacheSysdiagnose");
  }
  if (!objc_msgSend(v8, "objectForKeyedSubscript:", v12))
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v12);
LABEL_25:
  v13 = *(_QWORD *)(a1 + 64);
  if (v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v13, objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    if (!objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IncludeEvents")))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IncludeEvents"));
  }
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v15 = *(_OWORD *)(a1 + 32);
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v26[1] = 3221225472;
  v26[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_2;
  v26[3] = &unk_24C23D530;
  v27 = v15;
  v31 = v5;
  v28 = v8;
  v29 = v3;
  v32 = v4;
  v30 = *(_QWORD *)(a1 + 72);
  v17 = (void *)objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v26);
  v18 = *(_QWORD *)(a1 + 56);
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_6;
  v20[3] = &unk_24C23D5D0;
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = *(_OWORD *)(a1 + 40);
  v24 = v5;
  v25 = v4;
  v19 = *(_QWORD *)(a1 + 72);
  v22 = v3;
  v23 = v19;
  objc_msgSend(v17, "collectLogs:configuration:uuid:reply:", v18, v8, (_QWORD)v21, v20);
  objc_autoreleasePoolPop(v2);
}

__n128 __51__W5Client_collectLogs_configuration_update_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 48);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_3;
  block[3] = &unk_24C23D508;
  v12 = *(_WORD *)(a1 + 72);
  v8 = v2;
  v9 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  v10 = a2;
  v11 = v5;
  dispatch_async(v4, block);
  return result;
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int16 v8;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v5[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_4;
  v5[3] = &unk_24C23D4E0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_WORD *)(a1 + 80);
  v7 = v4;
  dispatch_async(global_queue, v5);
  objc_autoreleasePoolPop(v2);
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__collectJetsamFallbackLogsWithReason:compress:", objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Reason")), *(unsigned __int8 *)(a1 + 72));
  if (v3 && (v4 = *(_QWORD *)(a1 + 48)) != 0)
  {
    v5 = v3;
    v6 = *(void **)(a1 + 32);
    v7 = *(unsigned __int8 *)(a1 + 73);
    v8 = *(unsigned __int8 *)(a1 + 72);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_5;
    v10[3] = &unk_24C23D4B8;
    v10[4] = *(_QWORD *)(a1 + 64);
    objc_msgSend(v6, "__logsCollectedWithTemporaryURL:outputURL:keepParent:compress:reply:", v5, v4, v7, v8, v10);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 64);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 56), 0, 0);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __51__W5Client_collectLogs_configuration_update_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result + 16))(result, a2, 0, a3);
  return result;
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;

  block[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = *(_OWORD *)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_7;
  block[3] = &unk_24C23D5A8;
  v9 = a4;
  v10 = a2;
  v14 = *(_WORD *)(a1 + 72);
  v11 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  v12 = a3;
  v13 = v6;
  dispatch_async(v5, block);
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_7(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int16 v10;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v5[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_8;
  v5[3] = &unk_24C23D580;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(_WORD *)(a1 + 96);
  v8 = v4;
  v9 = *(_OWORD *)(a1 + 80);
  dispatch_async(global_queue, v5);
  objc_autoreleasePoolPop(v2);
}

void __51__W5Client_collectLogs_configuration_update_reply___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    goto LABEL_2;
  if (objc_msgSend(*(id *)(a1 + 40), "code") != 16)
  {
    v3 = 0;
    goto LABEL_8;
  }
  v3 = objc_msgSend(*(id *)(a1 + 48), "__collectBusyFallbackLogsWithReason:compress:", objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("Reason")), *(unsigned __int8 *)(a1 + 88));
  if (v3)
  {
LABEL_2:
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
    {
      v5 = *(void **)(a1 + 48);
      v6 = *(unsigned __int8 *)(a1 + 89);
      v7 = *(unsigned __int8 *)(a1 + 88);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __51__W5Client_collectLogs_configuration_update_reply___block_invoke_9;
      v9[3] = &unk_24C23D558;
      v10 = *(_OWORD *)(a1 + 72);
      objc_msgSend(v5, "__logsCollectedWithTemporaryURL:outputURL:keepParent:compress:reply:", v3, v4, v6, v7, v9);
      goto LABEL_10;
    }
  }
LABEL_8:
  v8 = *(_QWORD *)(a1 + 80);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v8 + 16))(v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v3);
LABEL_10:
  objc_autoreleasePoolPop(v2);
}

uint64_t __51__W5Client_collectLogs_configuration_update_reply___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result + 16))(result, a2, *(_QWORD *)(a1 + 32), a3);
  return result;
}

- (id)collectLogs:(id)a3 configuration:(id)a4 update:(id)a5 receipts:(id *)a6 error:(id *)a7
{
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v13 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __60__W5Client_collectLogs_configuration_update_receipts_error___block_invoke;
  v22[3] = &unk_24C23D620;
  v22[6] = &v29;
  v22[7] = &v35;
  v22[4] = v13;
  v22[5] = &v23;
  -[W5Client collectLogs:configuration:update:reply:](self, "collectLogs:configuration:update:reply:", a3, a4, a5, v22);
  v14 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v13, v14) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v42 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v15 = (id)v24[5];
  v16 = (id)v30[5];
  v17 = (id)v36[5];
  if (a7)
  {
    v18 = (void *)v24[5];
    if (v18)
      *a7 = v18;
  }
  if (a6)
  {
    v19 = (void *)v30[5];
    if (v19)
      *a6 = v19;
  }
  v20 = (void *)v36[5];
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v20;
}

intptr_t __60__W5Client_collectLogs_configuration_update_receipts_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(a4, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)collectLogsDiagnosticMode:(id)a3 update:(id)a4 reply:(id)a5
{
  void *v9;
  NSObject *OSLog;
  NSObject *queue;
  _QWORD block[9];
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136316418;
    v15 = "-[W5Client collectLogsDiagnosticMode:update:reply:]";
    v16 = 2080;
    v17 = "W5Client.m";
    v18 = 1024;
    v19 = 1659;
    v20 = 2114;
    v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "processName");
    v22 = 1024;
    v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo"), "processIdentifier");
    v24 = 2114;
    v25 = objc_msgSend((id)objc_msgSend(v9, "UUIDString"), "substringToIndex:", 5);
    _os_log_send_and_compose_impl();
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke;
  block[3] = &unk_24C23D648;
  block[4] = self;
  block[5] = v9;
  block[6] = a3;
  block[7] = a4;
  block[8] = a5;
  dispatch_async(queue, block);
  return v9;
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  _QWORD v21[4];
  __int128 v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v3 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("OutputDirectory"));
  v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("KeepParent")), "BOOLValue");
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("Compress")), "BOOLValue");
  v6 = *(void **)(a1 + 48);
  if (v6)
    v7 = (id)objc_msgSend(v6, "mutableCopy");
  else
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v9, objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
    if (!objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IncludeEvents")))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IncludeEvents"));
  }
  v10 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v11 = *(_OWORD *)(a1 + 32);
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v21[1] = 3221225472;
  v21[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_2;
  v21[3] = &unk_24C23D530;
  v22 = v11;
  v26 = v5;
  v23 = v8;
  v24 = v3;
  v27 = v4;
  v25 = *(_QWORD *)(a1 + 64);
  v13 = (void *)objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v21);
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_6;
  v15[3] = &unk_24C23D5D0;
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_OWORD *)(a1 + 40);
  v19 = v5;
  v20 = v4;
  v14 = *(_QWORD *)(a1 + 64);
  v17 = v3;
  v18 = v14;
  objc_msgSend(v13, "collectLogsDiagnosticMode:uuid:reply:", v8, (_QWORD)v16, v15);
  objc_autoreleasePoolPop(v2);
}

__n128 __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 48);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_3;
  block[3] = &unk_24C23D508;
  v12 = *(_WORD *)(a1 + 72);
  v8 = v2;
  v9 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  v10 = a2;
  v11 = v5;
  dispatch_async(v4, block);
  return result;
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int16 v8;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v5[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_4;
  v5[3] = &unk_24C23D4E0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_WORD *)(a1 + 80);
  v7 = v4;
  dispatch_async(global_queue, v5);
  objc_autoreleasePoolPop(v2);
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "__collectJetsamFallbackLogsWithReason:compress:", objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("Reason")), *(unsigned __int8 *)(a1 + 72));
  if (v3 && (v4 = *(_QWORD *)(a1 + 48)) != 0)
  {
    v5 = v3;
    v6 = *(void **)(a1 + 32);
    v7 = *(unsigned __int8 *)(a1 + 73);
    v8 = *(unsigned __int8 *)(a1 + 72);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_5;
    v10[3] = &unk_24C23D4B8;
    v10[4] = *(_QWORD *)(a1 + 64);
    objc_msgSend(v6, "__logsCollectedWithTemporaryURL:outputURL:keepParent:compress:reply:", v5, v4, v7, v8, v10);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 64);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 56), 0, 0);
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result + 16))(result, a2, 0, a3);
  return result;
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;

  block[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = *(_OWORD *)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_7;
  block[3] = &unk_24C23D5A8;
  v9 = a4;
  v10 = a2;
  v14 = *(_WORD *)(a1 + 72);
  v11 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  v12 = a3;
  v13 = v6;
  dispatch_async(v5, block);
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_7(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int16 v10;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v5[1] = 3221225472;
  v4 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_8;
  v5[3] = &unk_24C23D580;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(_WORD *)(a1 + 96);
  v8 = v4;
  v9 = *(_OWORD *)(a1 + 80);
  dispatch_async(global_queue, v5);
  objc_autoreleasePoolPop(v2);
}

void __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    goto LABEL_2;
  if (objc_msgSend(*(id *)(a1 + 40), "code") != 16)
  {
    v3 = 0;
    goto LABEL_8;
  }
  v3 = objc_msgSend(*(id *)(a1 + 48), "__collectBusyFallbackLogsWithReason:compress:", objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("Reason")), *(unsigned __int8 *)(a1 + 88));
  if (v3)
  {
LABEL_2:
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
    {
      v5 = *(void **)(a1 + 48);
      v6 = *(unsigned __int8 *)(a1 + 89);
      v7 = *(unsigned __int8 *)(a1 + 88);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_9;
      v9[3] = &unk_24C23D558;
      v10 = *(_OWORD *)(a1 + 72);
      objc_msgSend(v5, "__logsCollectedWithTemporaryURL:outputURL:keepParent:compress:reply:", v3, v4, v6, v7, v9);
      goto LABEL_10;
    }
  }
LABEL_8:
  v8 = *(_QWORD *)(a1 + 80);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t))(v8 + 16))(v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), v3);
LABEL_10:
  objc_autoreleasePoolPop(v2);
}

uint64_t __51__W5Client_collectLogsDiagnosticMode_update_reply___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result + 16))(result, a2, *(_QWORD *)(a1 + 32), a3);
  return result;
}

- (id)collectLogsDiagnosticMode:(id)a3 update:(id)a4 receipts:(id *)a5 error:(id *)a6
{
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v34 = &v33;
  v35 = 0x3052000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v11 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__W5Client_collectLogsDiagnosticMode_update_receipts_error___block_invoke;
  v20[3] = &unk_24C23D620;
  v20[6] = &v27;
  v20[7] = &v33;
  v20[4] = v11;
  v20[5] = &v21;
  -[W5Client collectLogsDiagnosticMode:update:reply:](self, "collectLogsDiagnosticMode:update:reply:", a3, a4, v20);
  v12 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v11, v12) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v40 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v13 = (id)v22[5];
  v14 = (id)v28[5];
  v15 = (id)v34[5];
  if (a6)
  {
    v16 = (void *)v22[5];
    if (v16)
      *a6 = v16;
  }
  if (a5)
  {
    v17 = (void *)v28[5];
    if (v17)
      *a5 = v17;
  }
  v18 = (void *)v34[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v18;
}

intptr_t __60__W5Client_collectLogsDiagnosticMode_update_receipts_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(a4, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)startPeerDiscoveryWithConfiguration:(id)a3 reply:(id)a4
{
  void *v7;
  NSObject *queue;
  _QWORD v10[8];

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke;
  v10[3] = &unk_24C23D250;
  v10[4] = self;
  v10[5] = v7;
  v10[6] = a3;
  v10[7] = a4;
  dispatch_async(queue, v10);
  return v7;
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setObject:forKey:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v5[0] = MEMORY[0x24BDAC760];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[1] = 3221225472;
  v5[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_2;
  v5[3] = &unk_24C23D138;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5), "startPeerDiscoveryWithConfiguration:uuid:reply:", *(_QWORD *)(a1 + 48), MEMORY[0x24BDAC760], 3221225472, __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_5, &unk_24C23D138, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v2);
}

__n128 __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

__n128 __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_5(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  __n128 result;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_6;
  v5[3] = &unk_24C23D250;
  v5[4] = a2;
  v6 = v2;
  v7 = *(_QWORD *)(a1 + 48);
  dispatch_async(v3, v5);
  return result;
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  uint64_t v4;
  _QWORD v5[6];

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 48), "UUIDString"));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count")
      && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setExportedObject:", 0);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 48), "UUIDString"));
    global_queue = dispatch_get_global_queue(0, 0);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_7;
    v5[3] = &unk_24C23D110;
    v4 = *(_QWORD *)(a1 + 56);
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v4;
    dispatch_async(global_queue, v5);
  }
  objc_autoreleasePoolPop(v2);
}

void __54__W5Client_startPeerDiscoveryWithConfiguration_reply___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

- (void)stopPeerDiscoveryWithUUID:(id)a3
{
  id v5;
  _QWORD v6[6];

  if (a3)
  {
    v5 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_conn, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_122);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__W5Client_stopPeerDiscoveryWithUUID___block_invoke_2;
    v6[3] = &unk_24C23D6D8;
    v6[4] = self;
    v6[5] = a3;
    objc_msgSend(v5, "stopPeerDiscoveryWithUUID:reply:", a3, v6);
  }
}

void __38__W5Client_stopPeerDiscoveryWithUUID___block_invoke_2(uint64_t a1)
{
  __int128 v1;
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v3[2] = __38__W5Client_stopPeerDiscoveryWithUUID___block_invoke_3;
  v3[3] = &unk_24C23D6B0;
  v4 = v1;
  dispatch_async(v2, v3);
}

void __38__W5Client_stopPeerDiscoveryWithUUID___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  objc_autoreleasePoolPop(v2);
}

- (id)runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6
{
  uint64_t v11;
  _QWORD v13[6];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v14[0] = a3;
  v11 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__W5Client_runWiFiSnifferOnChannel_duration_peer_reply___block_invoke;
  v13[3] = &unk_24C23D700;
  v13[4] = a3;
  v13[5] = a6;
  return -[W5Client runWiFiSnifferOnChannels:duration:peer:reply:](self, "runWiFiSnifferOnChannels:duration:peer:reply:", v11, a5, v13, a4);
}

uint64_t __56__W5Client_runWiFiSnifferOnChannel_duration_peer_reply___block_invoke(uint64_t result, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(result + 40);
  if (a2)
  {
    if (v4)
      return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v4 + 16))(*(_QWORD *)(result + 40), a2, 0);
  }
  else if (v4)
  {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(a3, "objectForKey:", *(_QWORD *)(result + 32)), objc_msgSend(a4, "objectForKey:", *(_QWORD *)(result + 32)));
  }
  return result;
}

- (id)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6
{
  void *v11;
  NSObject *queue;
  _QWORD v14[10];

  v11 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke;
  v14[3] = &unk_24C23D7A0;
  v14[4] = self;
  v14[5] = v11;
  v14[7] = a5;
  v14[8] = a6;
  *(double *)&v14[9] = a4;
  v14[6] = a3;
  dispatch_async(queue, v14);
  return v11;
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v5[0] = MEMORY[0x24BDAC760];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[1] = 3221225472;
  v5[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_2;
  v5[3] = &unk_24C23D138;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5), "runWiFiSnifferOnChannels:duration:peer:uuid:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), MEMORY[0x24BDAC760], 3221225472, __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_5, &unk_24C23D778, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  objc_autoreleasePoolPop(v2);
}

__n128 __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0, 0, 0);
  objc_autoreleasePoolPop(v2);
}

__n128 __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int128 v5;
  NSObject *v6;
  uint64_t v7;
  __n128 result;
  _QWORD block[4];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_6;
  block[3] = &unk_24C23D750;
  v10 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v14 = a5;
  v15 = v7;
  v11 = a2;
  v12 = a3;
  v13 = a4;
  dispatch_async(v6, block);
  return result;
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_7;
  block[3] = &unk_24C23D728;
  v8 = *(_QWORD *)(a1 + 80);
  v4 = *(_OWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = v4;
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __57__W5Client_runWiFiSnifferOnChannels_duration_peer_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[8];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5], a1[6], a1[7]);
  objc_autoreleasePoolPop(v2);
}

- (id)runWiFiSnifferOnChannel:(id)a3 duration:(double)a4 peer:(id)a5 error:(id *)a6
{
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v8[0] = a3;
  return (id)objc_msgSend(-[W5Client runWiFiSnifferOnChannels:duration:peer:snifferErrors:error:](self, "runWiFiSnifferOnChannels:duration:peer:snifferErrors:error:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1), a5, &v7, a6, a4), "objectForKey:", a3);
}

- (id)runWiFiSnifferOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 snifferErrors:(id *)a6 error:(id *)a7
{
  NSObject *v12;
  dispatch_time_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  uint64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v34 = &v33;
  v35 = 0x3052000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v12 = dispatch_semaphore_create(0);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __71__W5Client_runWiFiSnifferOnChannels_duration_peer_snifferErrors_error___block_invoke;
  v20[3] = &unk_24C23D7C8;
  v20[6] = &v33;
  v20[7] = &v21;
  v20[4] = v12;
  v20[5] = &v27;
  -[W5Client runWiFiSnifferOnChannels:duration:peer:reply:](self, "runWiFiSnifferOnChannels:duration:peer:reply:", a3, a5, v20, a4);
  v13 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v12, v13) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v40 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v14 = (id)v28[5];
  v15 = (id)v34[5];
  v16 = (id)v22[5];
  if (a7)
  {
    v17 = (void *)v28[5];
    if (v17)
      *a7 = v17;
  }
  v18 = (void *)v34[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v18;
}

intptr_t __71__W5Client_runWiFiSnifferOnChannels_duration_peer_snifferErrors_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a4, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(a3, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 reply:(id)a6
{
  void *v11;
  NSObject *queue;
  _QWORD v14[10];

  v11 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke;
  v14[3] = &unk_24C23D7A0;
  v14[4] = self;
  v14[5] = v11;
  v14[7] = a5;
  v14[8] = a6;
  *(double *)&v14[9] = a4;
  v14[6] = a3;
  dispatch_async(queue, v14);
  return v11;
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v5[0] = MEMORY[0x24BDAC760];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[1] = 3221225472;
  v5[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_2;
  v5[3] = &unk_24C23D138;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5), "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), MEMORY[0x24BDAC760], 3221225472, __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_5, &unk_24C23D390, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  objc_autoreleasePoolPop(v2);
}

__n128 __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  objc_autoreleasePoolPop(v2);
}

__n128 __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __n128 result;
  _QWORD block[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_6;
  block[3] = &unk_24C23D728;
  v8 = v3;
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a3;
  v11 = v5;
  v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_7;
  block[3] = &unk_24C23D1B0;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, block);
  objc_autoreleasePoolPop(v2);
}

void __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_reply___block_invoke_7(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = a1[6];
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, a1[4], a1[5]);
  objc_autoreleasePoolPop(v2);
}

- (id)runWiFiSnifferWithTCPDumpOnChannels:(id)a3 duration:(double)a4 peer:(id)a5 error:(id *)a6
{
  NSObject *v11;
  dispatch_time_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v11 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_error___block_invoke;
  v18[3] = &unk_24C23D3B8;
  v18[5] = &v19;
  v18[6] = &v25;
  v18[4] = v11;
  -[W5Client runWiFiSnifferWithTCPDumpOnChannels:duration:peer:reply:](self, "runWiFiSnifferWithTCPDumpOnChannels:duration:peer:reply:", a3, a5, v18, a4);
  v12 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v11, v12) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v32 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v13 = (id)v20[5];
  v14 = (id)v26[5];
  if (a6)
  {
    v15 = (void *)v20[5];
    if (v15)
      *a6 = v15;
  }
  v16 = (void *)v26[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v16;
}

intptr_t __68__W5Client_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a3, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)runWiFiPerformanceLoggingWithConfiguration:(id)a3 reply:(id)a4
{
  void *v7;
  NSObject *queue;
  _QWORD v10[8];

  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke;
  v10[3] = &unk_24C23D250;
  v10[4] = self;
  v10[5] = v7;
  v10[6] = a3;
  v10[7] = a4;
  dispatch_async(queue, v10);
  return v7;
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") == 1
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  v5[0] = MEMORY[0x24BDAC760];
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[1] = 3221225472;
  v5[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_2;
  v5[3] = &unk_24C23D138;
  v6 = v3;
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend((id)objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v5), "runWiFiPerformanceLoggingWithConfiguration:uuid:reply:", *(_QWORD *)(a1 + 48), MEMORY[0x24BDAC760], 3221225472, __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_5, &unk_24C23D138, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  objc_autoreleasePoolPop(v2);
}

__n128 __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_3;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_4;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

__n128 __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_5(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  NSObject *v3;
  uint64_t v4;
  __n128 result;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_6;
  v6[3] = &unk_24C23D250;
  v7 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v8 = a2;
  v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;

  v2 = (void *)MEMORY[0x20BD17D48]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", 0);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_7;
  v4[3] = &unk_24C23D110;
  v5 = *(_OWORD *)(a1 + 48);
  dispatch_async(global_queue, v4);
  objc_autoreleasePoolPop(v2);
}

void __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_reply___block_invoke_7(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (id)runWiFiPerformanceLoggingWithConfiguration:(id)a3 error:(id *)a4
{
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  id v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  v7 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_error___block_invoke;
  v16[3] = &unk_24C23D368;
  v16[4] = v7;
  v16[5] = &v17;
  v8 = -[W5Client runWiFiPerformanceLoggingWithConfiguration:reply:](self, "runWiFiPerformanceLoggingWithConfiguration:reply:", a3, v16);
  v9 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v7, v9) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v24 = 0x4082C00000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  v10 = (id)v18[5];
  v11 = v8;
  v12 = v18;
  v13 = (void *)v18[5];
  if (a4 && v13)
  {
    *a4 = v13;
    v13 = (void *)v12[5];
  }
  if (v13)
    v14 = 0;
  else
    v14 = v8;
  _Block_object_dispose(&v17, 8);
  return v14;
}

intptr_t __61__W5Client_runWiFiPerformanceLoggingWithConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)__cancelRequestWithUUID:(id)a3 reply:(id)a4
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke;
  block[3] = &unk_24C23D1B0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *global_queue;
  _QWORD block[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (objc_msgSend(*(id *)(a1[4] + 40), "containsObject:", objc_msgSend((id)a1[5], "UUIDString")))
  {
    v3 = *(void **)(a1[4] + 8);
    v4 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_2;
    v10[3] = &unk_24C23D188;
    v10[4] = a1[6];
    v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_4;
    v9[3] = &unk_24C23D188;
    v6 = a1[5];
    v9[4] = a1[6];
    objc_msgSend(v5, "cancelRequestWithUUID:reply:", v6, v9);
  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_6;
    block[3] = &unk_24C23D7F0;
    block[4] = a1[6];
    dispatch_async(global_queue, block);
  }
  objc_autoreleasePoolPop(v2);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__W5Client___cancelRequestWithUUID_reply___block_invoke_5;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __42__W5Client___cancelRequestWithUUID_reply___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = *MEMORY[0x24BDD0FD8];
    v5[0] = CFSTR("W5ParamErr");
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.wifivelocity.error"), 1, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1)));
  }
  objc_autoreleasePoolPop(v2);
}

- (void)cancelRequestWithUUID:(id)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = dispatch_semaphore_create(0);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__W5Client_cancelRequestWithUUID___block_invoke;
  v7[3] = &unk_24C23D160;
  v7[4] = v5;
  -[W5Client __cancelRequestWithUUID:reply:](self, "__cancelRequestWithUUID:reply:", a3, v7);
  v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v9 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __34__W5Client_cancelRequestWithUUID___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)__cancelAllRequestsAndReply:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke;
  v4[3] = &unk_24C23D110;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = MEMORY[0x24BDAC760];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke_2;
  v8[3] = &unk_24C23D188;
  v8[4] = v4;
  v6 = (void *)objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke_4;
  v7[3] = &unk_24C23D188;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "cancelAllRequestsAndReply:", v7);
  objc_autoreleasePoolPop(v2);
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__W5Client___cancelAllRequestsAndReply___block_invoke_5;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __40__W5Client___cancelAllRequestsAndReply___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (void)cancelAllRequests
{
  NSObject *v3;
  dispatch_time_t v4;
  _QWORD v5[5];
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__W5Client_cancelAllRequests__block_invoke;
  v5[3] = &unk_24C23D160;
  v5[4] = v3;
  -[W5Client __cancelAllRequestsAndReply:](self, "__cancelAllRequestsAndReply:", v5);
  v4 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v3, v4) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v7 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __29__W5Client_cancelAllRequests__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)cancelRequestWithUUID:(id)a3 peer:(id)a4 type:(int64_t)a5 reply:(id)a6
{
  NSObject *queue;
  _QWORD block[9];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke;
  block[3] = &unk_24C23D818;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a6;
  block[8] = a5;
  dispatch_async(queue, block);
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(void **)(a1[4] + 8);
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_2;
  v10[3] = &unk_24C23D188;
  v10[4] = a1[7];
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = a1[5];
  v7 = a1[6];
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_4;
  v9[3] = &unk_24C23D188;
  v8 = a1[8];
  v9[4] = a1[7];
  objc_msgSend(v5, "cancelRequestWithUUID:OnPeer:OfType:reply:", v6, v7, v8, v9);
  objc_autoreleasePoolPop(v2);
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_5;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __50__W5Client_cancelRequestWithUUID_peer_type_reply___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (void)__log:(id)a3 timestamp:(BOOL)a4 reply:(id)a5
{
  NSObject *queue;
  _QWORD v6[7];
  BOOL v7;

  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__W5Client___log_timestamp_reply___block_invoke;
  v6[3] = &unk_24C23D840;
  v6[5] = a3;
  v6[6] = a5;
  v6[4] = self;
  v7 = a4;
  dispatch_async(queue, v6);
}

void __34__W5Client___log_timestamp_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__W5Client___log_timestamp_reply___block_invoke_2;
  v9[3] = &unk_24C23D188;
  v9[4] = *(_QWORD *)(a1 + 48);
  v5 = (void *)objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v9);
  v6 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __34__W5Client___log_timestamp_reply___block_invoke_4;
  v8[3] = &unk_24C23D188;
  v7 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v5, "log:timestamp:reply:", v7, v6, v8);
  objc_autoreleasePoolPop(v2);
}

void __34__W5Client___log_timestamp_reply___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__W5Client___log_timestamp_reply___block_invoke_3;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __34__W5Client___log_timestamp_reply___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __34__W5Client___log_timestamp_reply___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *global_queue;
  uint64_t v5;
  _QWORD v6[6];

  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__W5Client___log_timestamp_reply___block_invoke_5;
  v6[3] = &unk_24C23D110;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  dispatch_async(global_queue, v6);
}

void __34__W5Client___log_timestamp_reply___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (void)log:(id)a3 timestamp:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v7 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __26__W5Client_log_timestamp___block_invoke;
  v9[3] = &unk_24C23D160;
  v9[4] = v7;
  -[W5Client __log:timestamp:reply:](self, "__log:timestamp:reply:", a3, v4, v9);
  v8 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v7, v8) >= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    v11 = 0x4010000000000000;
    _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
}

intptr_t __26__W5Client_log_timestamp___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)__eventCallbackSignatureForEventID:(int64_t)a3 peer:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld/%@"), a3, objc_msgSend(a4, "peerID"));
}

- (BOOL)startMonitoringFaultEventsForPeer:(id)a3 eventHandler:(id)a4 error:(id *)a5
{
  NSObject *queue;
  uint64_t v9;
  NSXPCConnection *conn;
  id v11;
  uint64_t *v12;
  NSObject *v13;
  BOOL v14;
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD block[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  queue = self->_queue;
  v9 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke;
  block[3] = &unk_24C23D1B0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
  conn = self->_conn;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_132;
  v18[3] = &unk_24C23D408;
  v18[4] = &v20;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_2;
  v17[3] = &unk_24C23D408;
  v17[4] = &v20;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v18), "startMonitoringFaultEventsForPeer:reply:", a3, v17);
  v11 = (id)v21[5];
  v12 = v21;
  if (v21[5])
  {
    v13 = self->_queue;
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_3;
    v16[3] = &unk_24C23D6B0;
    v16[4] = a3;
    v16[5] = self;
    dispatch_async(v13, v16);
    v12 = v21;
    if (a5)
      *a5 = (id)v21[5];
  }
  v14 = v12[5] == 0;
  _Block_object_dispose(&v20, 8);
  return v14;
}

void __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", &unk_24C24E100);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:");
    v3 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "__eventCallbackSignatureForEventID:peer:", 38, v3));
  objc_autoreleasePoolPop(v2);
}

uint64_t __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_132(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __65__W5Client_startMonitoringFaultEventsForPeer_eventHandler_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "removeObject:");
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", 0, objc_msgSend(*(id *)(a1 + 40), "__eventCallbackSignatureForEventID:peer:", 38, v3));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", &unk_24C24E100);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setExportedObject:", 0);
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)stopMonitoringFaultEventsForPeer:(id)a3 error:(id *)a4
{
  uint64_t v7;
  NSXPCConnection *conn;
  NSObject *queue;
  id v10;
  uint64_t *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v7 = MEMORY[0x24BDAC760];
  conn = self->_conn;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke;
  v17[3] = &unk_24C23D408;
  v17[4] = &v18;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke_2;
  v16[3] = &unk_24C23D408;
  v16[4] = &v18;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v17), "stopMonitoringFaultEventsForPeer:reply:", a3, v16);
  queue = self->_queue;
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke_3;
  v15[3] = &unk_24C23D6B0;
  v15[4] = a3;
  v15[5] = self;
  dispatch_async(queue, v15);
  v10 = (id)v19[5];
  v11 = v19;
  v12 = (void *)v19[5];
  if (a4 && v12)
  {
    *a4 = v12;
    v12 = (void *)v11[5];
  }
  v13 = v12 == 0;
  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void __51__W5Client_stopMonitoringFaultEventsForPeer_error___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x20BD17D48]();
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "removeObject:");
    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "setObject:forKeyedSubscript:", 0, objc_msgSend(*(id *)(a1 + 40), "__eventCallbackSignatureForEventID:peer:", 38, v3));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", &unk_24C24E100);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setExportedObject:", 0);
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)submitFaultEvent:(id)a3 error:(id *)a4
{
  NSXPCConnection *conn;
  id v6;
  uint64_t *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  conn = self->_conn;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __35__W5Client_submitFaultEvent_error___block_invoke;
  v12[3] = &unk_24C23D408;
  v12[4] = &v13;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __35__W5Client_submitFaultEvent_error___block_invoke_2;
  v11[3] = &unk_24C23D408;
  v11[4] = &v13;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v12), "submitFaultEvent:reply:", a3, v11);
  v6 = (id)v14[5];
  v7 = v14;
  v8 = (void *)v14[5];
  if (a4 && v8)
  {
    *a4 = v8;
    v8 = (void *)v7[5];
  }
  v9 = v8 == 0;
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t __35__W5Client_submitFaultEvent_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __35__W5Client_submitFaultEvent_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)faultEventCacheForPeer:(id)a3 error:(id *)a4
{
  NSXPCConnection *conn;
  id v6;
  id v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  conn = self->_conn;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__W5Client_faultEventCacheForPeer_error___block_invoke;
  v13[3] = &unk_24C23D408;
  v13[4] = &v14;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__W5Client_faultEventCacheForPeer_error___block_invoke_2;
  v12[3] = &unk_24C23D868;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(-[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](conn, "synchronousRemoteObjectProxyWithErrorHandler:", v13), "queryFaultEventCacheForPeer:reply:", a3, v12);
  v6 = (id)v15[5];
  v7 = (id)v21[5];
  v8 = v15;
  v9 = (void *)v15[5];
  if (a4 && v9)
  {
    *a4 = v9;
    v9 = (void *)v8[5];
  }
  if (v9)
    v10 = 0;
  else
    v10 = (void *)v21[5];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v10;
}

uint64_t __41__W5Client_faultEventCacheForPeer_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __41__W5Client_faultEventCacheForPeer_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(a2, "copy");
  result = objc_msgSend(a3, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)receivedEvent:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __26__W5Client_receivedEvent___block_invoke;
  v4[3] = &unk_24C23D6B0;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

void __26__W5Client_receivedEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x20BD17D48]();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "info"), "objectForKeyedSubscript:", CFSTR("UUID")), "UUIDString"));
  if (v3
    || (v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "__eventCallbackSignatureForEventID:peer:", objc_msgSend(*(id *)(a1 + 32), "eventID"), objc_msgSend(*(id *)(a1 + 32), "peer")))) != 0)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v4 + 72)
    && objc_msgSend(*(id *)(v4 + 32), "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "eventID"))))
  {
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) + 16))();
  }
  objc_autoreleasePoolPop(v2);
}

- (void)receivedPeerDiscoveryEvent:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__W5Client_receivedPeerDiscoveryEvent___block_invoke;
  v4[3] = &unk_24C23D6B0;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

void __39__W5Client_receivedPeerDiscoveryEvent___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *OSLog;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x20BD17D48]();
  OSLog = W5GetOSLog();
  if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v8 = 136315906;
    v9 = "-[W5Client receivedPeerDiscoveryEvent:]_block_invoke";
    v10 = 2080;
    v11 = "W5Client.m";
    v12 = 1024;
    v13 = 2478;
    v14 = 2114;
    v15 = v4;
    LODWORD(v7) = 38;
    v6 = &v8;
    _os_log_send_and_compose_impl();
  }
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "info", v6, v7), "objectForKeyedSubscript:", CFSTR("UUID")), "UUIDString"));
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

- (id)eventCallback
{
  return self->_eventCallback;
}

@end
