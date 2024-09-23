@implementation RMConnectionEndpoint

- (void)wrapReplyToXpcMessage:(void *)a3 withName:(void *)a4 data:
{
  id v7;
  xpc_object_t reply;
  id v9;
  const char *v10;
  id v11;
  xpc_object_t v12;
  id v13;

  v13 = a4;
  if (a1)
  {
    v7 = a3;
    reply = xpc_dictionary_create_reply(a2);
    v9 = objc_retainAutorelease(v7);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");

    xpc_dictionary_set_string(reply, "kRMConnectionMessageNameKey", v10);
    if (v13)
    {
      v11 = objc_retainAutorelease(v13);
      v12 = xpc_data_create((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
      xpc_dictionary_set_value(reply, "kRMConnectionMessageDataKey", v12);

    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);

  }
}

- (uint64_t)messagingConnection
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (BOOL)startServingStreamToEndpoint:(_QWORD *)a3 error:
{
  _xpc_endpoint_s *v5;
  _xpc_endpoint_s *v6;
  NSObject *v7;
  _BOOL4 v8;
  _xpc_endpoint_s *WeakRetained;
  xpc_connection_t v10;
  void **v11;
  NSObject *v12;
  void *v13;
  _xpc_endpoint_s *v14;
  uint64_t v15;
  _xpc_endpoint_s *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _BOOL8 v20;
  int v22;
  _xpc_endpoint_s *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v20 = 0;
    goto LABEL_30;
  }
  if (MEMORY[0x22E2AD88C](v5) != MEMORY[0x24BDACFB0])
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v7 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_228261000, v7, OS_LOG_TYPE_ERROR, "The client did not send streaming endpoint correctly", (uint8_t *)&v22, 2u);
    }
    v8 = 0;
    goto LABEL_29;
  }
  WeakRetained = (_xpc_endpoint_s *)objc_loadWeakRetained((id *)(a1 + 24));
  v10 = xpc_connection_create_from_endpoint(v6);
  if (v10)
  {
    v11 = (void **)(a1 + 32);
    objc_storeStrong((id *)(a1 + 32), v10);
    if ((-[RMConnectionEndpoint startServingStreamWithHandler:](a1, WeakRetained) & 1) == 0)
    {
      v8 = a3 != 0;
      if (a3)
      {
        if (onceToken_IPC_Default != -1)
          dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
        v12 = logObject_IPC_Default;
        if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
        {
          v22 = 138412290;
          v23 = WeakRetained;
          _os_log_impl(&dword_228261000, v12, OS_LOG_TYPE_ERROR, "Failed to start the streaming with handler %@", (uint8_t *)&v22, 0xCu);
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RMConnectionStreaming"), -2, 0);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v13 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_xpc_endpoint_s **)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 32);
        v22 = 134283777;
        v23 = v14;
        v24 = 2049;
        v25 = v15;
        v16 = v14;
        v17 = v13;
        _os_log_impl(&dword_228261000, v17, OS_LOG_TYPE_DEFAULT, "Cancelling the streaming server connection %{private}p.%{private}p", (uint8_t *)&v22, 0x16u);

      }
      xpc_connection_cancel(v10);
      v18 = *v11;
      *v11 = 0;

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (onceToken_IPC_Default != -1)
    dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
  v19 = logObject_IPC_Default;
  if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
  {
    v22 = 138412290;
    v23 = v6;
    _os_log_impl(&dword_228261000, v19, OS_LOG_TYPE_ERROR, "Failed to create connection from endpoint %@", (uint8_t *)&v22, 0xCu);
  }
  if (!a3)
  {
LABEL_27:
    v8 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RMConnectionStreaming"), -1, 0);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 1;
LABEL_28:

LABEL_29:
  v20 = !v8;
LABEL_30:

  return v20;
}

- (id)dataDelegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
  return WeakRetained;
}

- (void)setStreamingServerConnection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)startServingStreamWithHandler:(uint64_t)a1
{
  uint64_t v3;
  _xpc_connection_s *v4;
  id v5;
  NSObject *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  id v9;
  xpc_object_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  id v16;
  NSObject *v17;
  _QWORD v19[5];
  id v20;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = *(_xpc_connection_s **)(a1 + 32);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __54__RMConnectionEndpoint_startServingStreamWithHandler___block_invoke;
  handler[3] = &unk_24F0D4160;
  handler[4] = a1;
  v5 = a2;
  xpc_connection_set_event_handler(v4, handler);
  v6 = *(NSObject **)(a1 + 8);
  v7 = (_xpc_connection_s *)*(id *)(a1 + 32);
  xpc_connection_set_target_queue(v7, v6);

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 32));
  v8 = xpc_string_create("kRMConnectionMessageDataStream");
  keys[0] = "kRMConnectionMessageNameKey";
  v9 = v8;
  values = v9;
  v19[0] = v3;
  v19[1] = 3221225472;
  v19[2] = __54__RMConnectionEndpoint_startServingStreamWithHandler___block_invoke_77;
  v19[3] = &unk_24F0D41B0;
  v19[4] = a1;
  v10 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v20 = v10;
  v11 = objc_msgSend(v5, "endpoint:shouldStartStreamingDataToReceiver:", a1, v19);

  if (onceToken_IPC_Default != -1)
    dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
  v12 = (void *)logObject_IPC_Default;
  if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(void **)(a1 + 56);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = "NO";
    if ((_DWORD)v11)
      v15 = "YES";
    *(_DWORD *)buf = 134284035;
    v23 = v13;
    v24 = 2049;
    v25 = v14;
    v26 = 2080;
    v27 = v15;
    v16 = v13;
    v17 = v12;
    _os_log_impl(&dword_228261000, v17, OS_LOG_TYPE_DEBUG, "shouldStartStreamingDataToReceiver returned on streaming server connection %{private}p.%{private}p: %s", buf, 0x20u);

  }
  return v11;
}

- (void)handleXpcMessage:(void *)a3 replyBlock:
{
  id v5;
  void (**v6)(id, void *, void *);
  id WeakRetained;
  char *v8;
  void *v9;
  void *v10;
  void *bytes_ptr;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  void (**v22)(id, void *, void *);
  id v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  NSObject *v29;
  NSObject *v30;
  xpc_object_t reply;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(v5, "kRMConnectionMessageNameKey"));
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v5, "kRMConnectionMessageDataKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      bytes_ptr = (void *)xpc_data_get_bytes_ptr(v9);
      if (bytes_ptr)
        bytes_ptr = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v10));
    }
    else
    {
      bytes_ptr = 0;
    }
    xpc_dictionary_get_value(v5, "kRMConnectionRequestSteamingKey");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v8)
    {
      if (!v12)
      {
        if (v6)
        {
          v6[2](v6, v8, bytes_ptr);
          goto LABEL_31;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("kRMConnectionMessagePriorityBoost")))
        {
          if (onceToken_IPC_Default != -1)
            dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
          v30 = logObject_IPC_Default;
          if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v40 = v8;
            _os_log_impl(&dword_228261000, v30, OS_LOG_TYPE_INFO, "Creating reply to hold onto priority boost: %{private}@", buf, 0xCu);
          }
          reply = xpc_dictionary_create_reply(v5);
          v32 = *(void **)(a1 + 64);
          *(_QWORD *)(a1 + 64) = reply;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            if (onceToken_IPC_Default != -1)
              dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
            v33 = logObject_IPC_Default;
            if (!os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_FAULT))
              goto LABEL_31;
            *(_WORD *)buf = 0;
            v25 = "Message received but the handler doesn't implement the selector 'endpoint:didReceiveMessage:withData:replyBlock:'";
            v26 = v33;
            v27 = OS_LOG_TYPE_FAULT;
            v28 = 2;
            goto LABEL_14;
          }
          v35[0] = MEMORY[0x24BDAC760];
          v35[1] = 3221225472;
          v35[2] = __52__RMConnectionEndpoint_handleXpcMessage_replyBlock___block_invoke;
          v35[3] = &unk_24F0D4138;
          v35[4] = a1;
          v36 = v5;
          objc_msgSend(WeakRetained, "endpoint:didReceiveMessage:withData:replyBlock:", a1, v8, bytes_ptr, v35);
          v32 = v36;
        }

        goto LABEL_31;
      }
      v14 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_255975C68);
      if ((v14 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "endpoint:didReceiveStreamingRequest:withData:", a1, v8, bytes_ptr);
        v38 = 0;
        -[RMConnectionEndpoint startServingStreamToEndpoint:error:](a1, v13, &v38);
        v15 = v38;
        if (v15)
        {
          v16 = v15;
          v37 = v15;
          objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v37);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v10;
          v18 = v8;
          v19 = v13;
          v20 = bytes_ptr;
          v21 = WeakRetained;
          v22 = v6;
          v23 = v37;

          -[RMConnectionEndpoint wrapReplyToXpcMessage:withName:data:](a1, v5, CFSTR("kRMConnectionMessageError"), v17);
          v6 = v22;
          WeakRetained = v21;
          bytes_ptr = v20;
          v13 = v19;
          v8 = v18;
          v10 = v34;
        }
        else
        {
          if (onceToken_IPC_Default != -1)
            dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
          v29 = logObject_IPC_Default;
          if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_228261000, v29, OS_LOG_TYPE_INFO, "Streaming session started, sending acknowledgement", buf, 2u);
          }
          -[RMConnectionEndpoint wrapReplyToXpcMessage:withName:data:](a1, v5, CFSTR("kRMConnectionMessageSuccess"), 0);
        }
        goto LABEL_31;
      }
      -[RMConnectionEndpoint handleXpcMessage:replyBlock:].cold.1(v14);
    }
    else if (onceToken_IPC_Default == -1)
    {
LABEL_12:
      v24 = logObject_IPC_Default;
      if (!os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 136315138;
      v40 = "kRMConnectionMessageNameKey";
      v25 = "XPC message missing key \"%s\";
      v26 = v24;
      v27 = OS_LOG_TYPE_ERROR;
      v28 = 12;
LABEL_14:
      _os_log_impl(&dword_228261000, v26, v27, v25, buf, v28);
      goto LABEL_31;
    }
    dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    goto LABEL_12;
  }
LABEL_32:

}

- (void)setPriorityBoostReplyMessage:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

void __52__RMConnectionEndpoint_handleXpcMessage_replyBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  -[RMConnectionEndpoint wrapReplyToXpcMessage:withName:data:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), a2, a3);
}

- (id)initWithConnection:(void *)a3 queue:
{
  _xpc_connection_s *v6;
  NSObject *v7;
  id *v8;
  _QWORD handler[4];
  id *v11;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)RMConnectionEndpoint;
    v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 7, a2);
      objc_storeStrong(a1 + 1, a3);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __49__RMConnectionEndpoint_initWithConnection_queue___block_invoke;
      handler[3] = &unk_24F0D4160;
      a1 = a1;
      v11 = a1;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_set_target_queue(v6, v7);

    }
  }

  return a1;
}

- (void)setMessagingConnection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)setQueue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 8), a2);
}

void __49__RMConnectionEndpoint_initWithConnection_queue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x22E2AD88C]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (v3 == (id)MEMORY[0x24BDACF30])
    {
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v9 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
      {
        v10 = *(_QWORD *)(a1 + 32);
        if (v10)
          v10 = *(_QWORD *)(v10 + 56);
        v12 = 134283521;
        v13 = v10;
        v11 = v9;
        _os_log_impl(&dword_228261000, v11, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p interrupted!", (uint8_t *)&v12, 0xCu);

      }
      -[RMConnectionEndpoint handleInterruption](*(_QWORD *)(a1 + 32));
    }
    else if (v3 == (id)MEMORY[0x24BDACF38])
    {
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v6 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
      {
        v7 = *(_QWORD *)(a1 + 32);
        if (v7)
          v7 = *(_QWORD *)(v7 + 56);
        v12 = 134283521;
        v13 = v7;
        v8 = v6;
        _os_log_impl(&dword_228261000, v8, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p invalidated!", (uint8_t *)&v12, 0xCu);

      }
      -[RMConnectionEndpoint invalidate](*(_QWORD *)(a1 + 32));
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    -[RMConnectionEndpoint handleXpcMessage:replyBlock:](*(_QWORD *)(a1 + 32), v3, 0);
  }
  else
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v5 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_228261000, v5, OS_LOG_TYPE_ERROR, "Got unexpected xpc event", (uint8_t *)&v12, 2u);
    }
  }

}

- (void)handleInterruption
{
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "endpointWasInterrupted:", a1);

  }
}

- (void)invalidate
{
  void *v2;
  void *v3;
  id WeakRetained;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    if (*(_QWORD *)(a1 + 32))
      -[RMConnectionEndpoint stopServingStream](a1);
    if (*(_QWORD *)(a1 + 40))
      -[RMConnectionEndpoint stopReceivingStream](a1);
    if (*(_QWORD *)(a1 + 56))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
      v3 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = 0;

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(WeakRetained, "endpointWasInvalidated:", a1);

  }
}

- (void)start
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 56));
  }
}

- (uint64_t)queue
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void)pause
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    xpc_connection_suspend(*(xpc_connection_t *)(a1 + 56));
  }
}

- (void)sendMessage:(void *)a3 withData:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (!a1)
    goto LABEL_4;
  if (*(_QWORD *)(a1 + 56))
  {
    CreateXpcMessage(v9, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), v6);

LABEL_4:
    return;
  }
  v7 = (void *)-[RMConnectionEndpoint sendMessage:withData:].cold.1(v9);
  CreateXpcMessage(v7, v8);
}

- (void)sendMessage:(void *)a3 withData:(void *)a4 reply:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _xpc_connection_s *v13;
  uint64_t v14;
  void *v15;
  _QWORD handler[5];
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_4;
  if (*(_QWORD *)(a1 + 56))
  {
    CreateXpcMessage(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 56);
    v12 = *(NSObject **)(a1 + 8);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __51__RMConnectionEndpoint_sendMessage_withData_reply___block_invoke;
    handler[3] = &unk_24F0D4188;
    handler[4] = a1;
    v18 = v9;
    v17 = v7;
    v13 = v11;
    xpc_connection_send_message_with_reply(v13, v10, v12, handler);

LABEL_4:
    return;
  }
  v14 = -[RMConnectionEndpoint sendMessage:withData:reply:].cold.1();
  __51__RMConnectionEndpoint_sendMessage_withData_reply___block_invoke(v14, v15);
}

void __51__RMConnectionEndpoint_sendMessage_withData_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x22E2AD4E4]();
  v5 = MEMORY[0x22E2AD88C](v3);
  if (v5 == MEMORY[0x24BDACFB8])
  {
    if (v3 == (id)MEMORY[0x24BDACF30])
    {
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v10 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(_QWORD *)(a1 + 32);
        if (v11)
          v11 = *(_QWORD *)(v11 + 56);
        v13 = 134283521;
        v14 = v11;
        v12 = v10;
        _os_log_impl(&dword_228261000, v12, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p interrupted in sendMessageWithReply!", (uint8_t *)&v13, 0xCu);

      }
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      -[RMConnectionEndpoint handleInterruption](*(_QWORD *)(a1 + 32));
    }
    else if (v3 == (id)MEMORY[0x24BDACF38])
    {
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v7 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 32);
        if (v8)
          v8 = *(_QWORD *)(v8 + 56);
        v13 = 134283521;
        v14 = v8;
        v9 = v7;
        _os_log_impl(&dword_228261000, v9, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p invalidated!", (uint8_t *)&v13, 0xCu);

      }
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      -[RMConnectionEndpoint invalidate](*(_QWORD *)(a1 + 32));
    }
  }
  else if (v5 == MEMORY[0x24BDACFA0])
  {
    -[RMConnectionEndpoint handleXpcMessage:replyBlock:](*(_QWORD *)(a1 + 32), v3, *(void **)(a1 + 48));
  }
  else
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v6 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_228261000, v6, OS_LOG_TYPE_FAULT, "Got unexpected xpc event", (uint8_t *)&v13, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_autoreleasePoolPop(v4);

}

void __54__RMConnectionEndpoint_startServingStreamWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  _QWORD *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x22E2AD88C](a2) == MEMORY[0x24BDACFB8])
  {
    if (a2 == MEMORY[0x24BDACF30])
    {
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v10 = (void *)logObject_IPC_Default;
      if (!os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      v11 = *(_QWORD **)(a1 + 32);
      if (v11)
        v11 = (_QWORD *)v11[7];
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        v12 = *(_QWORD *)(v12 + 32);
      v13 = 134283777;
      v14 = v11;
      v15 = 2049;
      v16 = v12;
      v7 = v11;
      v8 = v10;
      v9 = "#Warning Streaming server connection %{private}p.%{private}p interrupted!";
    }
    else
    {
      if (a2 != MEMORY[0x24BDACF38])
        return;
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v4 = (void *)logObject_IPC_Default;
      if (!os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      v5 = *(_QWORD **)(a1 + 32);
      if (v5)
        v5 = (_QWORD *)v5[7];
      v6 = *(_QWORD *)(a1 + 32);
      if (v6)
        v6 = *(_QWORD *)(v6 + 32);
      v13 = 134283777;
      v14 = v5;
      v15 = 2049;
      v16 = v6;
      v7 = v5;
      v8 = v4;
      v9 = "#Warning Streaming server connection %{private}p.%{private}p invalidated!";
    }
    _os_log_impl(&dword_228261000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v13, 0x16u);

LABEL_21:
    -[RMConnectionEndpoint stopServingStream](*(_QWORD *)(a1 + 32));
  }
}

- (void)stopServingStream
{
  void *v2;
  id WeakRetained;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(_QWORD *)(a1 + 32))
    {
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 32), &__block_literal_global_2);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      v2 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      objc_msgSend(WeakRetained, "endpointShouldStopStreamingData:", a1);

    }
    else
    {
      -[RMConnectionEndpoint stopServingStream].cold.1();
    }
  }
}

void __54__RMConnectionEndpoint_startServingStreamWithHandler___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _xpc_connection_s *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v4 = *(_QWORD *)(v4 + 32);
  if (v4)
  {
    v5 = *(void **)(a1 + 40);
    v9 = v3;
    v6 = objc_retainAutorelease(v3);
    xpc_dictionary_set_data(v5, "kRMConnectionMessageDataStreamKey", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(_xpc_connection_s **)(v7 + 32);
    else
      v8 = 0;
    xpc_connection_send_message(v8, *(xpc_object_t *)(a1 + 40));
    v3 = v9;
  }

}

- (void)handleStreamXpcError:(void *)a3 withErrorHandler:
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!a1)
    goto LABEL_22;
  if (v5 == (id)MEMORY[0x24BDACF30])
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v9 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      v10 = "#Warning Streaming connection interrupted";
LABEL_19:
      _os_log_impl(&dword_228261000, v9, OS_LOG_TYPE_DEFAULT, v10, v12, 2u);
    }
LABEL_20:
    v8 = -3;
    if (!v6)
      goto LABEL_22;
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RMConnectionStreaming"), v8, 0, *(_QWORD *)v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

    goto LABEL_22;
  }
  if (v5 == (id)MEMORY[0x24BDACF38])
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v9 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      v10 = "#Warning Streaming connection dropped";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (v5 != (id)MEMORY[0x24BDACF48])
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v7 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 138412290;
      *(_QWORD *)&v12[4] = v5;
      _os_log_impl(&dword_228261000, v7, OS_LOG_TYPE_ERROR, "Unknown xpc error received %@", v12, 0xCu);
    }
    v8 = -4;
    if (v6)
      goto LABEL_21;
  }
LABEL_22:

}

- (void)startReceivingStreamOnConnection:(void *)a3 errorHandler:
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  _xpc_connection_s *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  v6 = a2;
  v7 = a3;
  if (!a1)
    goto LABEL_4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  v9 = objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_2559754A0);

  if ((v9 & 1) != 0)
  {
    objc_storeStrong((id *)(a1 + 40), a2);
    v10 = *(_xpc_connection_s **)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __70__RMConnectionEndpoint_startReceivingStreamOnConnection_errorHandler___block_invoke;
    v12[3] = &unk_24F0D4218;
    v12[4] = a1;
    v13 = v7;
    xpc_connection_set_event_handler(v10, v12);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 40));

LABEL_4:
    return;
  }
  v11 = -[RMConnectionEndpoint startReceivingStreamOnConnection:errorHandler:].cold.1();
  -[RMConnectionEndpoint setStreamingClientConnection:](v11);
}

- (void)setStreamingClientConnection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

void __70__RMConnectionEndpoint_startReceivingStreamOnConnection_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const void *bytes_ptr;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x22E2AD88C]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v8 = (void *)logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
        v9 = *(_QWORD *)(v9 + 40);
      v17 = 134283521;
      v18 = v9;
      v10 = v8;
      _os_log_impl(&dword_228261000, v10, OS_LOG_TYPE_DEBUG, "Error received on the streaming client connection %{private}p", (uint8_t *)&v17, 0xCu);

    }
    -[RMConnectionEndpoint handleStreamXpcError:withErrorHandler:](*(_QWORD *)(a1 + 32), v3, *(void **)(a1 + 40));
    -[RMConnectionEndpoint stopReceivingStream](*(_QWORD *)(a1 + 32));
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(v3, "kRMConnectionMessageDataStreamKey");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5
      && MEMORY[0x22E2AD88C](v5) == MEMORY[0x24BDACF90]
      && (bytes_ptr = xpc_data_get_bytes_ptr(v6)) != 0
      && (v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v6))) != 0)
    {
      v13 = (void *)v12;
      v14 = *(_QWORD *)(a1 + 32);
      if (v14)
      {
        WeakRetained = objc_loadWeakRetained((id *)(v14 + 24));
        v16 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v16 = 0;
        WeakRetained = 0;
      }
      objc_msgSend(WeakRetained, "endpoint:didReceiveStreamedData:", v16, v13);

    }
    else
    {
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v7 = logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_228261000, v7, OS_LOG_TYPE_ERROR, "Message without a payload received from the stream connection", (uint8_t *)&v17, 2u);
      }
    }

  }
}

- (void)stopReceivingStream
{
  void *v2;
  void *v3;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(_QWORD *)(a1 + 40))
    {
      xpc_connection_suspend(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &__block_literal_global_88);
      xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      v2 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

    }
    if (*(_QWORD *)(a1 + 48))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 48));
      v3 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
  }
}

- (void)handleStreamXpcReply:(void *)a3 withErrorHandler:
{
  void (**v5)(id, void *);
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *bytes_ptr;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    v7 = a2;
    objc_msgSend(v6, "stringWithUTF8String:", xpc_dictionary_get_string(v7, "kRMConnectionMessageNameKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v7, "kRMConnectionMessageError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && MEMORY[0x22E2AD88C](v9) == MEMORY[0x24BDACF90])
    {
      bytes_ptr = (void *)xpc_data_get_bytes_ptr(v9);
      if (bytes_ptr)
        bytes_ptr = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v9));
    }
    else
    {
      bytes_ptr = 0;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("kRMConnectionMessageError")))
    {
      if (bytes_ptr)
      {
        v11 = (void *)MEMORY[0x24BDD1620];
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v12, bytes_ptr, &v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v19;

        if (v13)
        {
          if (onceToken_IPC_Default != -1)
            dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
          v15 = logObject_IPC_Default;
          if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v13;
            _os_log_impl(&dword_228261000, v15, OS_LOG_TYPE_ERROR, "Error while receiving a stream : %@", buf, 0xCu);
          }
          if (v5)
            v5[2](v5, v13);
        }
        else
        {
          if (onceToken_IPC_Default != -1)
            dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
          v18 = logObject_IPC_Default;
          if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v14;
            _os_log_impl(&dword_228261000, v18, OS_LOG_TYPE_FAULT, "Can't decode the error returned to the streaming request. Unarchiver error: %@", buf, 0xCu);
          }
        }

      }
      else
      {
        if (onceToken_IPC_Default != -1)
          dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
        v17 = logObject_IPC_Default;
        if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v8;
          _os_log_impl(&dword_228261000, v17, OS_LOG_TYPE_FAULT, "No data in error message: %@", buf, 0xCu);
        }
      }
      -[RMConnectionEndpoint stopReceivingStream](a1);
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kRMConnectionMessageSuccess")))
    {
      if (onceToken_IPC_Default != -1)
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
      v16 = logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228261000, v16, OS_LOG_TYPE_DEFAULT, "Streaming connection acknowledged from remote endpoint", buf, 2u);
      }
    }

  }
}

- (void)requestStreamWithMessage:(void *)a3 data:(void *)a4 errorHandler:
{
  void *v4;
  id v8;
  xpc_endpoint_t v9;
  id v10;
  NSObject *v11;
  xpc_connection_t v12;
  void *v13;
  uint64_t v14;
  _xpc_connection_s *v15;
  id v16;
  void *v17;
  NSObject *v18;
  _xpc_connection_s *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  _xpc_endpoint_s *v25;
  _QWORD v26[5];
  id v27;
  _QWORD handler[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!a1)
    goto LABEL_7;
  if (*(_QWORD *)(a1 + 48))
  {
    -[RMConnectionEndpoint requestStreamWithMessage:data:errorHandler:].cold.1();
    goto LABEL_9;
  }
  v11 = *(id *)(a1 + 8);
  v12 = xpc_connection_create(0, v11);
  v13 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v12;

  v14 = MEMORY[0x24BDAC760];
  v15 = *(_xpc_connection_s **)(a1 + 48);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __67__RMConnectionEndpoint_requestStreamWithMessage_data_errorHandler___block_invoke;
  handler[3] = &unk_24F0D4218;
  handler[4] = a1;
  v16 = v10;
  v29 = v16;
  xpc_connection_set_event_handler(v15, handler);
  a3 = v8;
  v25 = v9;
  CreateXpcMessage(v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 48));
  v9 = xpc_endpoint_create(*(xpc_connection_t *)(a1 + 48));
  xpc_dictionary_set_value(v4, "kRMConnectionRequestSteamingKey", v9);
  v17 = *(void **)(a1 + 56);
  v18 = *(NSObject **)(a1 + 8);
  v26[0] = v14;
  v26[1] = 3221225472;
  v26[2] = __67__RMConnectionEndpoint_requestStreamWithMessage_data_errorHandler___block_invoke_93;
  v26[3] = &unk_24F0D4218;
  v26[4] = a1;
  v27 = v16;
  v19 = v17;
  xpc_connection_send_message_with_reply(v19, v4, v18, v26);

  if (onceToken_IPC_Default != -1)
LABEL_9:
    dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
  v20 = (void *)logObject_IPC_Default;
  v8 = a3;
  if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(a1 + 48);
    v21 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 134283777;
    v31 = v21;
    v32 = 2049;
    v33 = v22;
    v23 = v21;
    v24 = v20;
    _os_log_impl(&dword_228261000, v24, OS_LOG_TYPE_DEFAULT, "Streaming request sent on streaming listener %{private}p.%{private}p", buf, 0x16u);

  }
  v9 = v25;
LABEL_7:

}

void __67__RMConnectionEndpoint_requestStreamWithMessage_data_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _xpc_connection_s *v7;
  uint8_t v8[16];

  v3 = a2;
  if (MEMORY[0x22E2AD88C]() == MEMORY[0x24BDACF88])
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v4 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_228261000, v4, OS_LOG_TYPE_DEFAULT, "Peer connection detected", v8, 2u);
    }
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      v6 = *(NSObject **)(v5 + 8);
    else
      v6 = 0;
    v7 = (_xpc_connection_s *)v3;
    xpc_connection_set_target_queue(v7, v6);
    -[RMConnectionEndpoint startReceivingStreamOnConnection:errorHandler:](*(_QWORD *)(a1 + 32), v7, *(void **)(a1 + 40));

  }
}

void __67__RMConnectionEndpoint_requestStreamWithMessage_data_errorHandler___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = MEMORY[0x22E2AD88C]();
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (onceToken_IPC_Default != -1)
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_112);
    v5 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_228261000, v5, OS_LOG_TYPE_DEFAULT, "Error received while trying to start the streaming connection", v6, 2u);
    }
    -[RMConnectionEndpoint handleStreamXpcError:withErrorHandler:](*(_QWORD *)(a1 + 32), v3, *(void **)(a1 + 40));
    -[RMConnectionEndpoint stopReceivingStream](*(_QWORD *)(a1 + 32));
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    -[RMConnectionEndpoint handleStreamXpcReply:withErrorHandler:](*(_QWORD *)(a1 + 32), v3, *(void **)(a1 + 40));
  }

}

- (id)connectionDelegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
  return WeakRetained;
}

- (BOOL)isValid
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 8));
    return *(_QWORD *)(v1 + 56) != 0;
  }
  return result;
}

- (id)connection
{
  if (a1)
    a1 = (id *)a1[7];
  return a1;
}

- (id)setConnectionDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 2, a2);
  return result;
}

- (id)setDataDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 3, a2);
  return result;
}

- (uint64_t)priorityBoostReplyMessage
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityBoostReplyMessage, 0);
  objc_storeStrong((id *)&self->_messagingConnection, 0);
  objc_storeStrong((id *)&self->_streamingClientListener, 0);
  objc_storeStrong((id *)&self->_streamingClientConnection, 0);
  objc_storeStrong((id *)&self->_streamingServerConnection, 0);
  objc_destroyWeak((id *)&self->_dataDelegate);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
