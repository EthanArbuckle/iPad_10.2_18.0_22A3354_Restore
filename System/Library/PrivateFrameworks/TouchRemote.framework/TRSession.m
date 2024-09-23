@implementation TRSession

- (TRSession)init
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("-init is not a valid initializer for the class %@"), v4);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (TRSession)initWithNearbyDevice:(id)a3
{
  id v5;
  TRSession *v6;
  TRSession *v7;
  uint64_t v8;
  NSMutableDictionary *messageHandlerMap;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *messageHandlerMapQ;
  dispatch_queue_t v13;
  OS_dispatch_queue *connectionQ;
  TRAnisetteDataHandler *v15;
  TRAnisetteDataHandler *anisetteDataHandler;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TRSession;
  v6 = -[TRSession init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_nearbyDevice, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    messageHandlerMap = v7->_messageHandlerMap;
    v7->_messageHandlerMap = (NSMutableDictionary *)v8;

    v10 = MEMORY[0x24BDAC9C0];
    v11 = dispatch_queue_create("com.apple.TRSession.messageHandlerMapQ", MEMORY[0x24BDAC9C0]);
    messageHandlerMapQ = v7->_messageHandlerMapQ;
    v7->_messageHandlerMapQ = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_create("com.apple.TRSession.connectionQ", v10);
    connectionQ = v7->_connectionQ;
    v7->_connectionQ = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(TRAnisetteDataHandler);
    anisetteDataHandler = v7->_anisetteDataHandler;
    v7->_anisetteDataHandler = v15;

    -[TRAnisetteDataHandler registerForAnisetteDataRequestsFromSession:](v7->_anisetteDataHandler, "registerForAnisetteDataRequestsFromSession:", v7);
  }

  return v7;
}

- (void)setConnection:(id)a3
{
  id v4;
  NSObject *connectionQ;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQ = self->_connectionQ;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __27__TRSession_setConnection___block_invoke;
  v7[3] = &unk_24C2E4F30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(connectionQ, v7);

}

void __27__TRSession_setConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __27__TRSession_setConnection___block_invoke_2;
  v13[3] = &unk_24C2E5278;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v2, "setInvalidationHandler:", v13);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __27__TRSession_setConnection___block_invoke_2_8;
  v11[3] = &unk_24C2E5278;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v11);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __27__TRSession_setConnection___block_invoke_9;
  v9[3] = &unk_24C2E5878;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v5, "setEventMessageHandler:", v9);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __27__TRSession_setConnection___block_invoke_2_11;
  v7[3] = &unk_24C2E58A0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "setRequestMessageHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __27__TRSession_setConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[TRSession setConnection:]_block_invoke_2";
      _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "%s Connection invalidated", buf, 0xCu);
    }

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[7];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__TRSession_setConnection___block_invoke_6;
    block[3] = &unk_24C2E4F08;
    block[4] = v4;
    dispatch_barrier_async(v5, block);
    objc_msgSend(v4, "heartbeatRequestTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      dispatch_source_cancel(v6);
      objc_msgSend(v4, "setHeartbeatRequestTimer:", 0);
    }
    objc_msgSend(v4, "disconnectHandler");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      (*(void (**)(uint64_t))(v8 + 16))(v8);

  }
}

void __27__TRSession_setConnection___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

void __27__TRSession_setConnection___block_invoke_2_8(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[TRSession setConnection:]_block_invoke_2";
      _os_log_impl(&dword_20A2BF000, v2, OS_LOG_TYPE_DEFAULT, "%s Connection interrupted", (uint8_t *)&v4, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "disconnect");

}

void __27__TRSession_setConnection___block_invoke_9(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleEvent:", v3);

}

void __27__TRSession_setConnection___block_invoke_2_11(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleRequest:", v3);

}

- (TRConnection)connection
{
  NSObject *connectionQ;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  connectionQ = self->_connectionQ;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __23__TRSession_connection__block_invoke;
  v5[3] = &unk_24C2E58C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQ, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TRConnection *)v3;
}

void __23__TRSession_connection__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  -[TRSession connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)disconnect
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *messageHandlerMapQ;
  void *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[TRSession nearbyDevice](self, "nearbyDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v10 = "-[TRSession disconnect]";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Disconnect from device %@", buf, 0x16u);

    }
  }
  messageHandlerMapQ = self->_messageHandlerMapQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__TRSession_disconnect__block_invoke;
  block[3] = &unk_24C2E4F08;
  block[4] = self;
  dispatch_barrier_async(messageHandlerMapQ, block);
  -[TRSession connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

}

void __23__TRSession_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TRMessageEncoder encodeMessage:](TRMessageEncoder, "encodeMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[TRSession sendEvent:]";
      v15 = 2112;
      v16 = v8;
      v17 = 2048;
      v18 = objc_msgSend(v5, "length");
      _os_log_impl(&dword_20A2BF000, v6, OS_LOG_TYPE_DEFAULT, "%s Sending event of class %@ (%lu bytes).", (uint8_t *)&v13, 0x20u);

    }
  }
  -[TRSession connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BE90168]);
    -[NSObject setBodyData:](v10, "setBodyData:", v5);
    -[TRSession nearbyDevice](self, "nearbyDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "representedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPeerDevice:](v10, "setPeerDevice:", v12);

    objc_msgSend(v9, "sendEvent:", v10);
  }
  else
  {
    if (_TRLogEnabled != 1)
      goto LABEL_8;
    TRLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[TRSession sendEvent:]";
      _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "%s Unable to send event message. Session not connected.", (uint8_t *)&v13, 0xCu);
    }
  }

LABEL_8:
}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[TRMessageEncoder encodeMessage:](TRMessageEncoder, "encodeMessage:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v26 = "-[TRSession sendRequest:withResponseHandler:]";
      v27 = 2112;
      v28 = v11;
      v29 = 2048;
      v30 = objc_msgSend(v8, "length");
      _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, "%s Sending request of class %@ (%lu bytes).", buf, 0x20u);

    }
  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __45__TRSession_sendRequest_withResponseHandler___block_invoke;
  v21[3] = &unk_24C2E58F0;
  v12 = v7;
  v22 = v12;
  v13 = (void *)MEMORY[0x20BD22DF8](v21);
  -[TRSession connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_alloc_init(MEMORY[0x24BE90198]);
    objc_msgSend(v15, "setBodyData:", v8);
    objc_msgSend(v15, "setResponseHandler:", v13);
    -[TRSession nearbyDevice](self, "nearbyDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "representedDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPeerDevice:", v17);

    objc_msgSend(v14, "sendRequest:", v15);
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[TRSession sendRequest:withResponseHandler:]";
        _os_log_impl(&dword_20A2BF000, v18, OS_LOG_TYPE_DEFAULT, "%s Unable to send request message. Session not connected.", buf, 0xCu);
      }

    }
    v19 = *MEMORY[0x24BDD0FD8];
    v23[0] = *MEMORY[0x24BDD0FC8];
    v23[1] = v19;
    v24[0] = CFSTR("Unable to send request message.");
    v24[1] = CFSTR("The session must be connected before sending messages");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9101, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v20, 0);

  }
}

void __45__TRSession_sendRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void (*v23)(void);
  NSObject *v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  _QWORD v45[3];
  _QWORD v46[4];

  v46[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(v6, "bodyData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    +[TRMessageDecoder decodeMessage:error:](TRMessageDecoder, "decodeMessage:error:", v14, &v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v36;

    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (_TRLogEnabled == 1)
        {
          TRLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = (objc_class *)objc_opt_class();
            NSStringFromClass(v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v40 = "-[TRSession sendRequest:withResponseHandler:]_block_invoke";
            v41 = 2112;
            v42 = v26;
            v43 = 2112;
            v44 = (uint64_t)v15;
            _os_log_impl(&dword_20A2BF000, v24, OS_LOG_TYPE_DEFAULT, "%s Decoded something other than a subclass of %@: %@", buf, 0x20u);

          }
        }
        v27 = *MEMORY[0x24BDD0FC8];
        v38[0] = CFSTR("Invalid response message class.");
        v28 = *MEMORY[0x24BDD0FD8];
        v37[0] = v27;
        v37[1] = v28;
        v29 = (void *)MEMORY[0x24BDD17C8];
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("Decoded class is not a subclass of %@: %@."), v31, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v34;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9201, v35);
        v21 = objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        goto LABEL_27;
      }
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "bodyData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length");
          *(_DWORD *)buf = 136315650;
          v40 = "-[TRSession sendRequest:withResponseHandler:]_block_invoke";
          v41 = 2112;
          v42 = v18;
          v43 = 2048;
          v44 = v20;
          _os_log_impl(&dword_20A2BF000, v16, OS_LOG_TYPE_DEFAULT, "%s Received response message of class: %@ (%lu bytes).", buf, 0x20u);

        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "error");
        v21 = objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_27:
        v9 = (id)v21;
LABEL_30:

        goto LABEL_31;
      }
      v23 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "-[TRSession sendRequest:withResponseHandler:]_block_invoke";
          v41 = 2112;
          v42 = v9;
          _os_log_impl(&dword_20A2BF000, v22, OS_LOG_TYPE_DEFAULT, "%s Failed to decode response message: %@", buf, 0x16u);
        }

      }
      v23 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v23();
    goto LABEL_30;
  }
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[TRSession sendRequest:withResponseHandler:]_block_invoke";
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s Received empty response with error: %@", buf, 0x16u);
    }

  }
  v9 = v5;
  objc_msgSend(v9, "domain");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10 != CFSTR("TRNearbyDeviceErrorDomain"))
  {
    v11 = *MEMORY[0x24BDD0FD8];
    v45[0] = *MEMORY[0x24BDD0FC8];
    v45[1] = v11;
    v46[0] = CFSTR("Communication failure.");
    v46[1] = CFSTR("Received an error in response to a request.");
    v45[2] = *MEMORY[0x24BDD1398];
    v46[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9104, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v13;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_31:

}

- (void)_sendResponse:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[TRMessageEncoder encodeMessage:](TRMessageEncoder, "encodeMessage:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[TRSession _sendResponse:forRequest:]";
      v16 = 2112;
      v17 = v11;
      v18 = 2048;
      v19 = objc_msgSend(v8, "length");
      _os_log_impl(&dword_20A2BF000, v9, OS_LOG_TYPE_DEFAULT, "%s Sending response of class %@ (%lu bytes).", (uint8_t *)&v14, 0x20u);

    }
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE901A0]), "initWithRequestMessage:", v7);

  objc_msgSend(v12, "setBodyData:", v8);
  -[TRSession connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendResponse:", v12);

}

- (void)_respondToRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  TRErrorResponse *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(TRErrorResponse);
  -[TRErrorResponse setError:](v8, "setError:", v6);

  -[TRSession _sendResponse:forRequest:](self, "_sendResponse:forRequest:", v8, v7);
}

- (void)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  NSObject *v16;
  objc_class *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bodyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[TRMessageDecoder decodeMessage:error:](TRMessageDecoder, "decodeMessage:error:", v5, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bodyData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");
          *(_DWORD *)buf = 136315650;
          v21 = "-[TRSession _handleEvent:]";
          v22 = 2112;
          v23 = v10;
          v24 = 2048;
          v25 = v12;
          _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s Received event message of class: %@ (%lu bytes).", buf, 0x20u);

        }
      }
      -[TRSession _handlerForEventClass:](self, "_handlerForEventClass:", objc_opt_class());
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v6);
LABEL_19:

        goto LABEL_20;
      }
      if (_TRLogEnabled != 1)
        goto LABEL_19;
      TRLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v21 = "-[TRSession _handleEvent:]";
        v22 = 2112;
        v23 = v18;
        _os_log_impl(&dword_20A2BF000, v16, OS_LOG_TYPE_DEFAULT, "%s No handler registered for message class: %@", buf, 0x16u);

      }
LABEL_18:

      goto LABEL_19;
    }
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v21 = "-[TRSession _handleEvent:]";
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = (uint64_t)v6;
      _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "%s Unarchived something other than a subclass of %@: %@", buf, 0x20u);
      goto LABEL_18;
    }
  }
  else if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[TRSession _handleEvent:]";
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "%s Failed to decode event message: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
LABEL_20:

}

- (void)_handleRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bodyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  +[TRMessageDecoder decodeMessage:error:](TRMessageDecoder, "decodeMessage:error:", v5, &v38);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v38;

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (objc_class *)objc_opt_class();
          NSStringFromClass(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bodyData");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");
          *(_DWORD *)buf = 136315650;
          v42 = "-[TRSession _handleRequest:]";
          v43 = 2112;
          v44 = v10;
          v45 = 2048;
          v46 = v12;
          _os_log_impl(&dword_20A2BF000, v8, OS_LOG_TYPE_DEFAULT, "%s Received request message of class: %@ (%lu bytes).", buf, 0x20u);

        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __28__TRSession__handleRequest___block_invoke;
        v36[3] = &unk_24C2E5918;
        v36[4] = self;
        v37 = v4;
        -[TRSession _handleHeartbeatWithResponseHandler:](self, "_handleHeartbeatWithResponseHandler:", v36);

      }
      else
      {
        -[TRSession _handlerForRequestClass:](self, "_handlerForRequestClass:", objc_opt_class());
        v29 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __28__TRSession__handleRequest___block_invoke_41;
          v34[3] = &unk_24C2E5918;
          v34[4] = self;
          v35 = v4;
          ((void (**)(_QWORD, void *, _QWORD *))v29)[2](v29, v6, v34);

        }
        else
        {
          if (_TRLogEnabled == 1)
          {
            TRLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = (objc_class *)objc_opt_class();
              NSStringFromClass(v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v42 = "-[TRSession _handleRequest:]";
              v43 = 2112;
              v44 = v32;
              _os_log_impl(&dword_20A2BF000, v30, OS_LOG_TYPE_DEFAULT, "%s No handler registered for message class: %@", buf, 0x16u);

            }
          }
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9001, 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRSession _respondToRequest:withError:](self, "_respondToRequest:withError:", v4, v33);

        }
      }
    }
    else
    {
      if (_TRLogEnabled == 1)
      {
        TRLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_opt_class();
          NSStringFromClass(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v42 = "-[TRSession _handleRequest:]";
          v43 = 2112;
          v44 = v16;
          v45 = 2112;
          v46 = (uint64_t)v18;
          _os_log_impl(&dword_20A2BF000, v14, OS_LOG_TYPE_DEFAULT, "%s Decoded something other than a subclass of %@: %@", buf, 0x20u);

        }
      }
      v19 = *MEMORY[0x24BDD0FC8];
      v40[0] = CFSTR("Unknown message decoded.");
      v20 = *MEMORY[0x24BDD0FD8];
      v39[0] = v19;
      v39[1] = v20;
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Decoded class is not a subclass of %@: %@."), v23, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9200, v27);
      v28 = objc_claimAutoreleasedReturnValue();

      -[TRSession _respondToRequest:withError:](self, "_respondToRequest:withError:", v4, v28);
      v7 = (id)v28;
    }
  }
  else
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[TRSession _handleRequest:]";
        v43 = 2112;
        v44 = v7;
        _os_log_impl(&dword_20A2BF000, v13, OS_LOG_TYPE_DEFAULT, "%s Failed to decode request message: %@", buf, 0x16u);
      }

    }
    -[TRSession _respondToRequest:withError:](self, "_respondToRequest:withError:", v4, v7);
  }

}

uint64_t __28__TRSession__handleRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v4, "_sendResponse:forRequest:", a3, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v4, "_respondToRequest:withError:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __28__TRSession__handleRequest___block_invoke_41(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v4, "_sendResponse:forRequest:", a3, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v4, "_respondToRequest:withError:", *(_QWORD *)(a1 + 40), a2);
}

- (void)setEventHandler:(id)a3 forEventClass:(Class)a4
{
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a3;
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("msgClass must be a subclass of %@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v6 = (void *)MEMORY[0x20BD22DF8](v12);
  -[TRSession _setMessageHandler:forMessageClass:](self, "_setMessageHandler:forMessageClass:", v6, a4);

}

- (void)setRequestHandler:(id)a3 forRequestClass:(Class)a4
{
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a3;
  if ((-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("msgClass must be a subclass of %@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v6 = (void *)MEMORY[0x20BD22DF8](v12);
  -[TRSession _setMessageHandler:forMessageClass:](self, "_setMessageHandler:forMessageClass:", v6, a4);

}

- (void)_setMessageHandler:(id)a3 forMessageClass:(Class)a4
{
  id v6;
  NSObject *messageHandlerMapQ;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  messageHandlerMapQ = self->_messageHandlerMapQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__TRSession__setMessageHandler_forMessageClass___block_invoke;
  block[3] = &unk_24C2E5940;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_barrier_async(messageHandlerMapQ, block);

}

void __48__TRSession__setMessageHandler_forMessageClass___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  NSStringFromClass(*(Class *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, v3);

}

- (id)_messageHandlerForMessageClass:(Class)a3
{
  NSObject *messageHandlerMapQ;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  messageHandlerMapQ = self->_messageHandlerMapQ;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TRSession__messageHandlerForMessageClass___block_invoke;
  block[3] = &unk_24C2E5968;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(messageHandlerMapQ, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__TRSession__messageHandlerForMessageClass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  NSStringFromClass(*(Class *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_sendHeartbeats
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __28__TRSession__sendHeartbeats__block_invoke;
  v2[3] = &unk_24C2E5990;
  v2[4] = self;
  -[TRSession sendHeartbeatWithResponseHandler:](self, "sendHeartbeatWithResponseHandler:", v2);
}

void __28__TRSession__sendHeartbeats__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char isKindOfClass;
  void *v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v8 = *(void **)(a1 + 32);
    goto LABEL_6;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) == 0)
  {
LABEL_6:
    objc_msgSend(v8, "disconnect");
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isConnected"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9 = dispatch_time(0, 5000000000);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __28__TRSession__sendHeartbeats__block_invoke_2;
    v10[3] = &unk_24C2E5278;
    objc_copyWeak(&v11, &location);
    dispatch_after(v9, MEMORY[0x24BDAC9B8], v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
LABEL_7:

}

void __28__TRSession__sendHeartbeats__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendHeartbeats");

}

- (void)sendHeartbeatWithResponseHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  TRHeartbeatRequest *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  _QWORD handler[4];
  NSObject *v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v5);

  v7 = dispatch_time(0, 25000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __46__TRSession_sendHeartbeatWithResponseHandler___block_invoke;
  handler[3] = &unk_24C2E59B8;
  v9 = v6;
  v18 = v9;
  objc_copyWeak(&v20, &location);
  v10 = v4;
  v19 = v10;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(v9);
  v11 = objc_alloc_init(TRHeartbeatRequest);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __46__TRSession_sendHeartbeatWithResponseHandler___block_invoke_46;
  v14[3] = &unk_24C2E5698;
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  -[TRSession sendRequest:withResponseHandler:](self, "sendRequest:withResponseHandler:", v11, v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __46__TRSession_sendHeartbeatWithResponseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315394;
        v6 = "-[TRSession sendHeartbeatWithResponseHandler:]_block_invoke";
        v7 = 2048;
        v8 = 0x4039000000000000;
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Failed to receive heartbeat response within %f seconds.", (uint8_t *)&v5, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9103, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __46__TRSession_sendHeartbeatWithResponseHandler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = *MEMORY[0x24BDD0FC8];
      v18[0] = CFSTR("Invalid response message class.");
      v8 = *MEMORY[0x24BDD0FD8];
      v17[0] = v7;
      v17[1] = v8;
      v9 = (void *)MEMORY[0x24BDD17C8];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Response class is not a subclass of %@: %@."), v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9201, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v6 = 0;
      v5 = (id)v16;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_handleHeartbeatWithResponseHandler:(id)a3
{
  void (**v4)(id, _QWORD, TRHeartbeatResponse *);
  NSObject *v5;
  NSObject *v6;
  TRHeartbeatResponse *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  _QWORD handler[4];
  NSObject *v13;
  id v14;
  id location;

  v4 = (void (**)(id, _QWORD, TRHeartbeatResponse *))a3;
  -[TRSession heartbeatRequestTimer](self, "heartbeatRequestTimer");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    dispatch_source_cancel(v5);
    -[TRSession setHeartbeatRequestTimer:](self, "setHeartbeatRequestTimer:", 0);
  }
  v7 = objc_alloc_init(TRHeartbeatResponse);
  v4[2](v4, 0, v7);
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v8);

  v10 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__TRSession__handleHeartbeatWithResponseHandler___block_invoke;
  handler[3] = &unk_24C2E59E0;
  v11 = v9;
  v13 = v11;
  objc_copyWeak(&v14, &location);
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume(v11);
  -[TRSession setHeartbeatRequestTimer:](self, "setHeartbeatRequestTimer:", v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __49__TRSession__handleHeartbeatWithResponseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 136315394;
        v5 = "-[TRSession _handleHeartbeatWithResponseHandler:]_block_invoke";
        v6 = 2048;
        v7 = 0x403E000000000000;
        _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%s Failed to receive heartbeat request within %f seconds.", (uint8_t *)&v4, 0x16u);
      }

    }
    objc_msgSend(WeakRetained, "setHeartbeatRequestTimer:", 0);
    objc_msgSend(WeakRetained, "disconnect");
  }

}

- (TRNearbyDevice)nearbyDevice
{
  return self->_nearbyDevice;
}

- (void)setNearbyDevice:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDevice, a3);
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableDictionary)messageHandlerMap
{
  return self->_messageHandlerMap;
}

- (void)setMessageHandlerMap:(id)a3
{
  objc_storeStrong((id *)&self->_messageHandlerMap, a3);
}

- (TRAnisetteDataHandler)anisetteDataHandler
{
  return self->_anisetteDataHandler;
}

- (void)setAnisetteDataHandler:(id)a3
{
  objc_storeStrong((id *)&self->_anisetteDataHandler, a3);
}

- (OS_dispatch_queue)messageHandlerMapQ
{
  return self->_messageHandlerMapQ;
}

- (void)setMessageHandlerMapQ:(id)a3
{
  objc_storeStrong((id *)&self->_messageHandlerMapQ, a3);
}

- (OS_dispatch_queue)connectionQ
{
  return self->_connectionQ;
}

- (void)setConnectionQ:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQ, a3);
}

- (OS_dispatch_source)heartbeatRequestTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHeartbeatRequestTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatRequestTimer, 0);
  objc_storeStrong((id *)&self->_connectionQ, 0);
  objc_storeStrong((id *)&self->_messageHandlerMapQ, 0);
  objc_storeStrong((id *)&self->_anisetteDataHandler, 0);
  objc_storeStrong((id *)&self->_messageHandlerMap, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_nearbyDevice, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
