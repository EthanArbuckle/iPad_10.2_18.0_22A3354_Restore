@implementation SKTRSession

- (SKTRSession)initWithDispatchQueue:(id)a3 messageSessionTemplate:(id)a4
{
  id v7;
  id v8;
  SKTRSession *v9;
  SKTRSession *v10;
  uint64_t v11;
  CUMessageSession *messageSession;
  SKTRSession *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SKTRSession;
  v9 = -[SKTRSession init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE297D0]), "initWithTemplate:", v8);
    messageSession = v10->_messageSession;
    v10->_messageSession = (CUMessageSession *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  logger_2457();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2147EE000, v3, OS_LOG_TYPE_DEBUG, "deinit", buf, 2u);
  }

  -[SKTRSession _cleanup](self, "_cleanup");
  v4.receiver = self;
  v4.super_class = (Class)SKTRSession;
  -[SKTRSession dealloc](&v4, sel_dealloc);
}

- (void)start
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__SKTRSession_start__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_start
{
  NSObject *v3;
  CUMessageSession *messageSession;
  uint64_t v5;
  CUMessageSession *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *, void *);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id buf[2];

  logger_2457();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2147EE000, v3, OS_LOG_TYPE_DEFAULT, "start", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  messageSession = self->_messageSession;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __21__SKTRSession__start__block_invoke;
  v12[3] = &unk_24D22AF78;
  objc_copyWeak(&v13, buf);
  -[CUMessageSession registerRequestID:options:handler:](messageSession, "registerRequestID:options:handler:", CFSTR("_trEvent"), 0, v12);
  v6 = self->_messageSession;
  v7 = v5;
  v8 = 3221225472;
  v9 = __21__SKTRSession__start__block_invoke_2;
  v10 = &unk_24D22AF78;
  objc_copyWeak(&v11, buf);
  -[CUMessageSession registerRequestID:options:handler:](v6, "registerRequestID:options:handler:", CFSTR("_trRequest"), 0, &v7);
  -[CUMessageSession activate](self->_messageSession, "activate", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

- (void)cancel
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__SKTRSession_cancel__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_cancel
{
  NSObject *v3;
  uint8_t v4[16];

  logger_2457();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2147EE000, v3, OS_LOG_TYPE_DEFAULT, "cancel", v4, 2u);
  }

  -[SKTRSession _cleanup](self, "_cleanup");
}

- (void)_cleanup
{
  id disconnectHandler;
  CUMessageSession *messageSession;
  NSMutableDictionary *eventHandlerMap;
  NSMutableDictionary *requestHandlerMap;

  disconnectHandler = self->_disconnectHandler;
  self->_disconnectHandler = 0;

  -[CUMessageSession invalidate](self->_messageSession, "invalidate");
  messageSession = self->_messageSession;
  self->_messageSession = 0;

  -[NSMutableDictionary removeAllObjects](self->_eventHandlerMap, "removeAllObjects");
  eventHandlerMap = self->_eventHandlerMap;
  self->_eventHandlerMap = 0;

  -[NSMutableDictionary removeAllObjects](self->_requestHandlerMap, "removeAllObjects");
  requestHandlerMap = self->_requestHandlerMap;
  self->_requestHandlerMap = 0;

}

- (void)_handleEvent:(id)a3
{
  id v4;
  int Int64Ranged;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  NSObject *v11;
  void (**v12)(_QWORD, _QWORD);
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  _DWORD v19[7];

  *(_QWORD *)&v19[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    logger_2457();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v15 = "### handleEvent failed: no data";
LABEL_15:
    _os_log_error_impl(&dword_2147EE000, v9, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_10;
  }
  getTREventMessageClass[0]();
  v7 = objc_opt_class();
  if (!v7)
  {
    logger_2457();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v15 = "### handleEvent failed: no message class";
    goto LABEL_15;
  }
  v17 = 0;
  -[SKTRSession _decodeTRMessageData:classType:error:](self, "_decodeTRMessageData:classType:error:", v6, v7, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_eventHandlerMap, "objectForKeyedSubscript:", v11);
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    logger_2457();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v19[0] = Int64Ranged;
        LOWORD(v19[1]) = 2112;
        *(_QWORD *)((char *)&v19[1] + 2) = v11;
        _os_log_impl(&dword_2147EE000, v14, OS_LOG_TYPE_DEFAULT, "handleEvent: xid=%d, className=%@", buf, 0x12u);
      }

      ((void (**)(_QWORD, void *))v12)[2](v12, v8);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v19 = v11;
        _os_log_error_impl(&dword_2147EE000, v14, OS_LOG_TYPE_ERROR, "### handleEvent failed: no handler, className=%@", buf, 0xCu);
      }

    }
  }
  else
  {
    logger_2457();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      CUPrintNSError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v19 = v16;
      _os_log_error_impl(&dword_2147EE000, v11, OS_LOG_TYPE_ERROR, "### handleEvent failed: decode, error=%@", buf, 0xCu);

    }
  }

LABEL_10:
}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SKTRSession *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __25__SKTRSession_sendEvent___block_invoke;
  v7[3] = &unk_24D22AFC8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_handleRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  _QWORD v18[4];
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    logger_2457();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v17 = "### handleRequest failed: no data";
LABEL_16:
    _os_log_error_impl(&dword_2147EE000, v11, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_11;
  }
  getTRRequestMessageClass[0]();
  v9 = objc_opt_class();
  if (!v9)
  {
    logger_2457();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v17 = "### handleRequest failed: no message class";
    goto LABEL_16;
  }
  v21 = 0;
  -[SKTRSession _decodeTRMessageData:classType:error:](self, "_decodeTRMessageData:classType:error:", v8, v9, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  if (v10)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requestHandlerMap, "objectForKeyedSubscript:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    logger_2457();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        _os_log_impl(&dword_2147EE000, v16, OS_LOG_TYPE_DEFAULT, "handleRequest: className=%@", buf, 0xCu);
      }

      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __46__SKTRSession__handleRequest_responseHandler___block_invoke;
      v18[3] = &unk_24D22AFF0;
      v20 = v6;
      v19 = v13;
      ((void (*)(NSObject *, void *, _QWORD *))v14[2].isa)(v14, v10, v18);

      v16 = v20;
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_error_impl(&dword_2147EE000, v16, OS_LOG_TYPE_ERROR, "### handleRequest failed: no handler, className=%@", buf, 0xCu);
    }

  }
  else
  {
    logger_2457();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    CUPrintNSError();
    v14 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = v14;
    _os_log_error_impl(&dword_2147EE000, v13, OS_LOG_TYPE_ERROR, "### handleRequest failed: decode, error=%@", buf, 0xCu);
  }

LABEL_10:
LABEL_11:

}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SKTRSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SKTRSession_sendRequest_withResponseHandler___block_invoke;
  block[3] = &unk_24D22B040;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)setEventHandler:(id)a3 forEventClass:(Class)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SKTRSession_setEventHandler_forEventClass___block_invoke;
  block[3] = &unk_24D22B068;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)setRequestHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SKTRSession_setRequestHandler_forRequestClass___block_invoke;
  block[3] = &unk_24D22B068;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (id)_decodeTRMessageData:(id)a3 classType:(Class)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDBCF20];
  v8 = a3;
  v9 = [v7 alloc];
  v14[0] = a4;
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  v14[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v11, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_requestHandlerMap, 0);
  objc_storeStrong((id *)&self->_messageSession, 0);
  objc_storeStrong((id *)&self->_eventHandlerMap, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __49__SKTRSession_setRequestHandler_forRequestClass___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(*(Class *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  logger_2457();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_2147EE000, v3, OS_LOG_TYPE_INFO, "setRequestHandler: className=%@", (uint8_t *)&v8, 0xCu);
  }

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

  }
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v7, v2);

}

void __45__SKTRSession_setEventHandler_forEventClass___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(*(Class *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  logger_2457();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_2147EE000, v3, OS_LOG_TYPE_INFO, "setEventHandler: className=%@", (uint8_t *)&v8, 0xCu);
  }

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

  }
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v7, v2);

}

void __47__SKTRSession_sendRequest_withResponseHandler___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  const __CFString *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 32), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  logger_2457();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 1024;
      v18 = objc_msgSend(v4, "length");
      _os_log_impl(&dword_2147EE000, v6, OS_LOG_TYPE_DEFAULT, "sendRequest start: className=%@, size=%d", buf, 0x12u);
    }

    v13 = CFSTR("data");
    v14 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__SKTRSession_sendRequest_withResponseHandler___block_invoke_17;
    v9[3] = &unk_24D22B018;
    v10 = v3;
    v8 = *(id *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = v8;
    objc_msgSend(v7, "sendRequestID:options:request:responseHandler:", CFSTR("_trRequest"), 0, v6, v9);

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_error_impl(&dword_2147EE000, v6, OS_LOG_TYPE_ERROR, "### encode request failed: className=%@", buf, 0xCu);
  }

}

void __47__SKTRSession_sendRequest_withResponseHandler___block_invoke_17(_QWORD *a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  getTRResponseMessageClass();
  v8 = objc_opt_class();
  if (!a2 && v7 && (v9 = v8) != 0)
  {
    v10 = (void *)a1[5];
    v23 = 0;
    objc_msgSend(v10, "_decodeTRMessageData:classType:error:", v7, v9, &v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v23;
    logger_2457();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = a1[4];
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_2147EE000, v14, OS_LOG_TYPE_DEFAULT, "sendRequest success: className=%@", buf, 0xCu);
      }

      (*(void (**)(_QWORD, _QWORD, void *))(a1[6] + 16))(a1[6], 0, v11);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v21 = a1[4];
        CUPrintNSError();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v21;
        v26 = 2112;
        v27 = v22;
        _os_log_error_impl(&dword_2147EE000, v14, OS_LOG_TYPE_ERROR, "### sendRequest failed: className=%@, error=%@", buf, 0x16u);

      }
      v18 = a1[6];
      if (v12)
      {
        (*(void (**)(uint64_t, id, _QWORD))(v18 + 16))(v18, v12, 0);
      }
      else
      {
        NSErrorF_safe();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v18 + 16))(v18, v19, 0);

      }
    }

  }
  else
  {
    logger_2457();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = a1[4];
      *(_DWORD *)buf = 138412546;
      v25 = v20;
      v26 = 1024;
      LODWORD(v27) = a2;
      _os_log_error_impl(&dword_2147EE000, v16, OS_LOG_TYPE_ERROR, "### sendRequest failed: className=%@, error=%d", buf, 0x12u);
    }

    v17 = a1[6];
    NSErrorF_safe();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v17 + 16))(v17, v12, 0);
  }

}

void __46__SKTRSession__handleRequest_responseHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (v5 || !a3)
  {
    logger_2457();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      CUPrintNSError();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_error_impl(&dword_2147EE000, v12, OS_LOG_TYPE_ERROR, "### handleRequest failed: handler, error=%@", buf, 0xCu);

    }
    v13 = *(_QWORD *)(a1 + 40);
    v14 = objc_msgSend(v5, "code");
    if (v14)
      v15 = v14;
    else
      v15 = 4294960596;
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v13 + 16))(v13, v15, 0, 0);
  }
  else
  {
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    logger_2457();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl(&dword_2147EE000, v9, OS_LOG_TYPE_DEFAULT, "handleRequest success: className=%@", buf, 0xCu);
      }

      v22 = CFSTR("data");
      v23 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        CUPrintNSError();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v20;
        _os_log_error_impl(&dword_2147EE000, v9, OS_LOG_TYPE_ERROR, "### handleRequest failed: encode, error=%@", buf, 0xCu);

      }
      v16 = *(_QWORD *)(a1 + 40);
      v17 = objc_msgSend(v7, "code");
      if (v17)
        v18 = v17;
      else
        v18 = 4294960596;
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v16 + 16))(v16, v18, 0, 0);
    }

  }
}

void __25__SKTRSession_sendEvent___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  _BYTE v15[14];
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CUNextID32();
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 32), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  logger_2457();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v15 = v4;
      *(_WORD *)&v15[4] = 2112;
      *(_QWORD *)&v15[6] = v3;
      v16 = 1024;
      v17 = objc_msgSend(v5, "length");
      _os_log_impl(&dword_2147EE000, v7, OS_LOG_TYPE_DEFAULT, "sendEvent start: xid=%d, className=%@, size=%d", buf, 0x18u);
    }

    v12[0] = CFSTR("xid");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = CFSTR("data");
    v13[0] = v8;
    v13[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v7 = objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __25__SKTRSession_sendEvent___block_invoke_14;
    v10[3] = &unk_24D22AFA0;
    v11 = v3;
    objc_msgSend(v9, "sendRequestID:options:request:responseHandler:", CFSTR("_trEvent"), 0, v7, v10);

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v15 = v3;
    _os_log_error_impl(&dword_2147EE000, v7, OS_LOG_TYPE_ERROR, "### encode event failed: className=%@", buf, 0xCu);
  }

}

void __25__SKTRSession_sendEvent___block_invoke_14(uint64_t a1, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  logger_2457();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v6;
      v10 = 1024;
      v11 = a2;
      _os_log_error_impl(&dword_2147EE000, v5, OS_LOG_TYPE_ERROR, "### sendEvent failed: className=%@, error=%d", (uint8_t *)&v8, 0x12u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_2147EE000, v5, OS_LOG_TYPE_DEFAULT, "sendEvent success: className=%@, completed", (uint8_t *)&v8, 0xCu);
  }

}

uint64_t __21__SKTRSession_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

void __21__SKTRSession__start__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;
  id v8;

  v5 = (id *)(a1 + 32);
  v8 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleEvent:", v6);

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v8 + 2))(v8, 0, 0, MEMORY[0x24BDBD1B8]);
}

void __21__SKTRSession__start__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleRequest:responseHandler:", v9, v6);
  else
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v6 + 2))(v6, 4294896148, 0, 0);

}

uint64_t __20__SKTRSession_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

@end
