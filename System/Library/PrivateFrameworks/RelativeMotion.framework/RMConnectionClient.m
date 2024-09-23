@implementation RMConnectionClient

- (id)initWithQueue:(void *)a3 serviceName:(void *)a4 messageHandler:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  SEL v12;
  uint64_t v13;
  id v14;
  objc_super v16;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)RMConnectionClient;
    v11 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 4, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_setProperty_nonatomic_copy(a1, v12, v10, 48);
      v13 = objc_opt_new();
      v14 = a1[7];
      a1[7] = (id)v13;

      *((_BYTE *)a1 + 8) = 1;
    }
  }

  return a1;
}

- (void)setMessageHandler:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
}

- (void)replayCache
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  id *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v2 = *(id *)(a1 + 56);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (!v3)
    {
      v5 = (id *)v2;
LABEL_31:

      return;
    }
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v7);
        if (v8 && *(_QWORD *)(v8 + 24))
        {
          v9 = (id *)(id)v8;
          v10 = v5;
          v5 = v9;
        }
        else
        {
          if (onceToken_ConnectionClient_Default != -1)
            dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
          v11 = (void *)logObject_ConnectionClient_Default;
          if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
          {
            if (v8)
              v12 = *(_QWORD *)(v8 + 8);
            else
              v12 = 0;
            *(_DWORD *)buf = 138412290;
            v28 = v12;
            v13 = v11;
            _os_log_impl(&dword_228261000, v13, OS_LOG_TYPE_DEFAULT, "Sending cached message %@", buf, 0xCu);

          }
          v14 = *(void **)(a1 + 16);
          if (v8)
          {
            v15 = *(id *)(v8 + 8);
            v16 = *(void **)(v8 + 16);
          }
          else
          {
            v15 = 0;
            v16 = 0;
          }
          v10 = v14;
          -[RMConnectionEndpoint sendMessage:withData:]((uint64_t)v10, v15, v16);

        }
        ++v7;
      }
      while (v4 != v7);
      v17 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      v4 = v17;
    }
    while (v17);

    if (v5)
    {
      if (onceToken_ConnectionClient_Default != -1)
        dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
      v18 = logObject_ConnectionClient_Default;
      if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228261000, v18, OS_LOG_TYPE_DEFAULT, "Restoring the streaming channel", buf, 2u);
      }
      v19 = v5[1];
      v20 = v5[3];
      v21 = v5[2];
      v22 = v19;
      -[RMConnectionClient requestStreamingWithMessage:data:callback:](a1, v22, v21, v20);

      goto LABEL_31;
    }
  }
}

- (void)requestStreamingWithMessage:(void *)a3 data:(void *)a4 callback:
{
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  id v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  uint64_t v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(_QWORD *)(a1 + 40))
  {
    objc_setProperty_nonatomic_copy((id)a1, v10, v9, 40);
    v11 = *(_QWORD *)(a1 + 16);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __64__RMConnectionClient_requestStreamingWithMessage_data_callback___block_invoke;
    v19 = &unk_24F0D4290;
    v20 = a1;
    v12 = v9;
    v21 = v12;
    -[RMConnectionEndpoint requestStreamWithMessage:data:errorHandler:](v11, v7, v8, &v16);
    v13 = *(id *)(a1 + 56);
    v14 = -[RMConnectionClientCachedMessage initWithName:data:streamingCallback:]((id *)[RMConnectionClientCachedMessage alloc], v7, v8, v12);
    objc_msgSend(v13, "addObject:", v14, v16, v17, v18, v19, v20);

LABEL_4:
    return;
  }
  v15 = -[RMConnectionClient requestStreamingWithMessage:data:callback:].cold.1();
  -[RMConnectionClient connect](v15);
}

- (void)connect
{
  void *v2;
  id v3;
  RMConnectionEndpoint *v4;
  id v5;
  id *v6;
  void *v7;
  NSObject *v8;
  xpc_connection_t mach_service;
  uint8_t buf[16];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (*(_BYTE *)(a1 + 8))
    {
      if (*(_QWORD *)(a1 + 16))
      {
        -[RMConnectionEndpoint setDataDelegate:](*(id **)(a1 + 16), 0);
        -[RMConnectionEndpoint setConnectionDelegate:](*(id **)(a1 + 16), 0);
        -[RMConnectionEndpoint invalidate](*(_QWORD *)(a1 + 16));
        v2 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;

      }
      v3 = objc_retainAutorelease(*(id *)(a1 + 24));
      mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(v3, "UTF8String"), *(dispatch_queue_t *)(a1 + 32), 0);

      v4 = [RMConnectionEndpoint alloc];
      v5 = *(id *)(a1 + 32);
      v6 = -[RMConnectionEndpoint initWithConnection:queue:]((id *)&v4->super.isa, mach_service, v5);
      v7 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v6;

      -[RMConnectionEndpoint setConnectionDelegate:](*(id **)(a1 + 16), (void *)a1);
      -[RMConnectionEndpoint setDataDelegate:](*(id **)(a1 + 16), (void *)a1);
      -[RMConnectionEndpoint start](*(_QWORD *)(a1 + 16));

    }
    else
    {
      if (onceToken_ConnectionClient_Default != -1)
        dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
      v8 = logObject_ConnectionClient_Default;
      if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228261000, v8, OS_LOG_TYPE_FAULT, "Trying to connect after invalidation", buf, 2u);
      }
    }
  }
}

- (void)setEndpoint:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (void)sendMessage:(void *)a3 withData:(void *)a4 reply:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    v10 = *(_QWORD *)(a1 + 16);
    if (v9)
      -[RMConnectionEndpoint sendMessage:withData:reply:](v10, v7, v8, v9);
    else
      -[RMConnectionEndpoint sendMessage:withData:](v10, v7, v8);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = *(id *)(a1 + 56);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        v17 = v14 + v13;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v11);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
          if (v18)
            v19 = *(void **)(v18 + 8);
          else
            v19 = 0;
          if ((objc_msgSend(v19, "isEqualToString:", v7, (_QWORD)v21) & 1) != 0)
          {

            objc_msgSend(*(id *)(a1 + 56), "removeObjectAtIndex:", (v14 + v16));
            goto LABEL_19;
          }
          ++v16;
        }
        while (v13 != v16);
        v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v13 = v20;
        v14 = v17;
      }
      while (v20);
    }

  }
LABEL_19:

}

- (void)sendCachedMessage:(void *)a3 withData:
{
  id v5;
  id v6;
  id v7;
  id *v8;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    -[RMConnectionClient sendMessage:withData:reply:](a1, v6, v5, 0);
    v7 = *(id *)(a1 + 56);
    v8 = -[RMConnectionClientCachedMessage initWithName:data:]((id *)[RMConnectionClientCachedMessage alloc], v6, v5);

    objc_msgSend(v7, "addObject:", v8);
  }
}

void __64__RMConnectionClient_requestStreamingWithMessage_data_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  -[RMConnectionClient stopStreamingInternal](*(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "code") == -3
    && ((v4 = *(_QWORD *)(a1 + 32)) == 0 ? (v5 = 0) : (v5 = *(_QWORD *)(v4 + 16)), -[RMConnectionEndpoint isValid](v5)))
  {
    if (onceToken_ConnectionClient_Default != -1)
      dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
    v6 = logObject_ConnectionClient_Default;
    if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_228261000, v6, OS_LOG_TYPE_DEFAULT, "#Warning The streaming connection has been interrupted", v7, 2u);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)stopStreamingInternal
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  SEL v5;
  uint8_t v6[16];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    v2 = *(id *)(a1 + 40);
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 16);

      if (v3)
      {
        if (onceToken_ConnectionClient_Default != -1)
          dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
        v4 = logObject_ConnectionClient_Default;
        if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_228261000, v4, OS_LOG_TYPE_DEBUG, "Stopping the streaming session", v6, 2u);
        }
        -[RMConnectionEndpoint stopReceivingStream](*(_QWORD *)(a1 + 16));
        objc_setProperty_nonatomic_copy((id)a1, v5, 0, 40);
      }
    }
  }
}

- (void)stopStreaming
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    -[RMConnectionClient stopStreamingInternal](a1);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(a1 + 56);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        v7 = 0;
        v8 = v5 + v4;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v2);
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          if (v9)
            v9 = *(_QWORD *)(v9 + 24);
          if (v9)
          {

            objc_msgSend(*(id *)(a1 + 56), "removeObjectAtIndex:", (v5 + v7), (_QWORD)v10);
            return;
          }
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v5 = v8;
        if (v4)
          continue;
        break;
      }
    }

  }
}

- (void)invalidate
{
  void *v2;
  SEL v3;
  void *v4;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    *(_BYTE *)(a1 + 8) = 0;
    if (*(_QWORD *)(a1 + 64))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
      v2 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = 0;

    }
    objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
    objc_setProperty_nonatomic_copy((id)a1, v3, 0, 48);
    -[RMConnectionClient stopStreaming](a1);
    -[RMConnectionEndpoint invalidate](*(_QWORD *)(a1 + 16));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

  }
}

- (void)handleDaemonStart
{
  NSObject *v2;
  _xpc_connection_s *v3;
  _QWORD barrier[5];
  uint8_t buf[16];

  if (a1)
  {
    if (onceToken_ConnectionClient_Default != -1)
      dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
    v2 = logObject_ConnectionClient_Default;
    if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228261000, v2, OS_LOG_TYPE_DEBUG, "Reconnection attempt", buf, 2u);
    }
    if (!*(_QWORD *)(a1 + 16))
    {
      -[RMConnectionClient connect](a1);
      -[RMConnectionClient replayCache](a1);
      -[RMConnectionEndpoint connection](*(id **)(a1 + 16));
      v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      barrier[0] = MEMORY[0x24BDAC760];
      barrier[1] = 3221225472;
      barrier[2] = __39__RMConnectionClient_handleDaemonStart__block_invoke;
      barrier[3] = &unk_24F0D3F68;
      barrier[4] = a1;
      xpc_connection_send_barrier(v3, barrier);

    }
  }
}

void __39__RMConnectionClient_handleDaemonStart__block_invoke(uint64_t a1)
{
  NSObject *isa;
  _QWORD block[5];

  isa = *(NSObject **)(a1 + 32);
  if (isa)
    isa = isa[4].isa;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__RMConnectionClient_handleDaemonStart__block_invoke_2;
  block[3] = &unk_24F0D3F68;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(isa, block);
}

void __39__RMConnectionClient_handleDaemonStart__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  int64_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v2 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    -[RMConnectionEndpoint setPriorityBoostReplyMessage:](v3, 0);
  }
  else
  {
    if (v3)
    {
      *(_QWORD *)(v3 + 72) *= 2;
      v4 = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        if (*(_QWORD *)(v4 + 72) >= 0x81uLL)
          *(_QWORD *)(v4 + 72) = 128;
      }
    }
    if (onceToken_ConnectionClient_Default != -1)
      dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
    v5 = logObject_ConnectionClient_Default;
    if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        v6 = *(_QWORD *)(v6 + 72);
      v12 = 134217984;
      v13 = v6;
      _os_log_impl(&dword_228261000, v5, OS_LOG_TYPE_DEBUG, "Connection stil invalid, next reconnection attempt will be in %lu seconds", (uint8_t *)&v12, 0xCu);
    }
    v7 = *(_QWORD **)(a1 + 32);
    if (v7)
      v7 = (_QWORD *)v7[8];
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
      v9 = 1000000000 * *(_QWORD *)(v8 + 72);
    else
      v9 = 0;
    v10 = v7;
    v11 = dispatch_time(0, v9);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);

  }
}

- (uint64_t)connectionTimerDelay
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)setConnectionTimerDelay:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 72) = a2;
  return result;
}

- (void)endpointWasInterrupted:(id)a3
{
  RMConnectionEndpoint *i;
  RMConnectionEndpoint *v5;

  v5 = (RMConnectionEndpoint *)a3;
  if (!self)
    goto LABEL_6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  for (i = self->_endpoint; i != v5; i = 0)
  {
    -[RMConnectionClient endpointWasInterrupted:].cold.1();
LABEL_6:
    dispatch_assert_queue_V2(0);
  }
  -[RMConnectionClient stopStreamingInternal]((uint64_t)self);
  -[RMConnectionClient replayCache]((uint64_t)self);

}

- (void)endpointWasInvalidated:(id)a3
{
  id *v4;
  RMConnectionEndpoint *endpoint;
  NSObject *v6;
  OS_dispatch_queue *v7;
  dispatch_source_t v8;
  OS_dispatch_source *v9;
  dispatch_time_t v10;
  NSObject *connectionTimer;
  _QWORD handler[5];
  uint8_t buf[16];

  v4 = (id *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    endpoint = self->_endpoint;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    endpoint = 0;
  }
  if (endpoint != (RMConnectionEndpoint *)v4)
  {
    -[RMConnectionClient endpointWasInvalidated:].cold.1();
LABEL_13:
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
    goto LABEL_8;
  }
  -[RMConnectionClient stopStreamingInternal]((uint64_t)self);
  -[RMConnectionEndpoint setDataDelegate:](v4, 0);
  -[RMConnectionEndpoint setConnectionDelegate:](v4, 0);
  -[RMConnectionClient setEndpoint:]((uint64_t)self, 0);
  if (!self || !self->_valid || self->_connectionTimer)
    goto LABEL_11;
  if (onceToken_ConnectionClient_Default != -1)
    goto LABEL_13;
LABEL_8:
  v6 = logObject_ConnectionClient_Default;
  if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228261000, v6, OS_LOG_TYPE_DEBUG, "Connection invalidated, setting up the reconnection timer", buf, 2u);
  }
  v7 = self->_queue;
  v8 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)v7);
  -[RMConnectionEndpoint setPriorityBoostReplyMessage:]((uint64_t)self, v8);

  self->_connectionTimerDelay = 4;
  v9 = self->_connectionTimer;
  v10 = dispatch_time(0, 4000000000);
  dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);

  connectionTimer = self->_connectionTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __45__RMConnectionClient_endpointWasInvalidated___block_invoke;
  handler[3] = &unk_24F0D3F68;
  handler[4] = self;
  dispatch_source_set_event_handler(connectionTimer, handler);
  dispatch_resume((dispatch_object_t)self->_connectionTimer);
LABEL_11:

}

void __45__RMConnectionClient_endpointWasInvalidated___block_invoke(uint64_t a1)
{
  -[RMConnectionClient handleDaemonStart](*(_QWORD *)(a1 + 32));
}

- (void)endpoint:(id)a3 didReceiveStreamedData:(id)a4
{
  (*((void (**)(void))self->_streamingDataCallback + 2))();
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  (*((void (**)(void))self->_messageHandler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_messageCache, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_streamingDataCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (uint64_t)requestStreamingWithMessage:data:callback:.cold.1()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27;

  _CLLogObjectForCategory_ConnectionClient_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_228261000, v2, v3, "{\"msg%{public}.0s\":\"Stream requested while one is already present\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_ConnectionClient_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_6(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_228261000, v9, v10, v11, "Stream requested while one is already present", "{\"msg%{public}.0s\":\"Stream requested while one is already present\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_ConnectionClient_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_228261000, v15, v16, "{\"msg%{public}.0s\":\"Stream requested while one is already present\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  v21 = abort_report_np();
  return -[RMConnectionClient endpointWasInterrupted:].cold.1(v21);
}

- (uint64_t)endpointWasInterrupted:.cold.1()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27;

  _CLLogObjectForCategory_ConnectionClient_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_228261000, v2, v3, "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_ConnectionClient_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_6(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_228261000, v9, v10, v11, "Received interruption event for an unmanaged endpoint", "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_ConnectionClient_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_228261000, v15, v16, "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  v21 = abort_report_np();
  return -[RMConnectionClient endpointWasInvalidated:].cold.1(v21);
}

- (uint64_t)endpointWasInvalidated:.cold.1()
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27;

  _CLLogObjectForCategory_ConnectionClient_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_228261000, v2, v3, "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_ConnectionClient_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_6(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_228261000, v9, v10, v11, "Received invalidation event for an unmanaged endpoint", "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_ConnectionClient_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_228261000, v15, v16, "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  v21 = abort_report_np();
  return __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke_cold_1(v21);
}

@end
