@implementation SSErrorHandler

- (SSErrorHandler)init
{
  SSErrorHandler *v2;
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSErrorHandler;
  v2 = -[SSErrorHandler init](&v7, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSErrorHandler.%p"), v2);
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSErrorHandler.delegate.%p"), v2);
    v2->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__DaemonLaunchNotification_3, CFSTR("com.apple.iTunesStore.daemon.launched"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *delegateQueue;
  NSObject *dispatchQueue;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.iTunesStore.daemon.launched"), 0);
  -[SSErrorHandler _tearDownConnections](self, "_tearDownConnections");
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  v6.receiver = self;
  v6.super_class = (Class)SSErrorHandler;
  -[SSErrorHandler dealloc](&v6, sel_dealloc);
}

- (SSErrorHandlerDelegate)delegate
{
  NSObject *dispatchQueue;
  SSErrorHandlerDelegate *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__52;
  v10 = __Block_byref_object_dispose__52;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__SSErrorHandler_delegate__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSErrorHandlerDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __26__SSErrorHandler_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)failureTypes
{
  NSObject *dispatchQueue;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__52;
  v10 = __Block_byref_object_dispose__52;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__SSErrorHandler_failureTypes__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__SSErrorHandler_failureTypes__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__SSErrorHandler_setDelegate___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __30__SSErrorHandler_setDelegate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setFailureTypes:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SSErrorHandler_setFailureTypes___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SSErrorHandler_setFailureTypes___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 32) + 40);
  if (v1 != *(void **)(result + 40))
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 40), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 40) = result;
  }
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__SSErrorHandler_startWithCompletionBlock___block_invoke;
  v4[3] = &unk_1E47BBC58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __43__SSErrorHandler_startWithCompletionBlock___block_invoke(uint64_t a1)
{
  SSWeakReference *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD **)(a1 + 32);
  if (!v3[1])
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__SSErrorHandler_startWithCompletionBlock___block_invoke_2;
    v8[3] = &unk_1E47B8B68;
    v8[4] = v2;
    objc_msgSend(v4, "setDisconnectBlock:", v8);
    v3 = *(_QWORD **)(a1 + 32);
  }
  if (!v3[6])
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = objc_alloc_init(SSXPCConnection);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__SSErrorHandler_startWithCompletionBlock___block_invoke_3;
    v7[3] = &unk_1E47BD1E0;
    v7[4] = v2;
    objc_msgSend(v5, "setMessageBlock:", v7);
    v3 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v3, "_reconnectToDaemonWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__SSErrorHandler_startWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_sendDisconnectMessage");
}

uint64_t __43__SSErrorHandler_startWithCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_handleMessage:fromServerConnection:", a2, a3);
}

- (void)stopWithCompletionBlock:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SSErrorHandler_stopWithCompletionBlock___block_invoke;
  v4[3] = &unk_1E47BBC58;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __42__SSErrorHandler_stopWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_tearDownConnections");
  v2 = *(void **)(a1 + 40);
  if (v2)
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24), v2);
}

- (void)_dispatchToDelegate:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_delegateQueue, a3);
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  xpc_retain(a4);
  xpc_retain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSErrorHandler__handleMessage_fromServerConnection___block_invoke;
  block[3] = &unk_1E47B9E88;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __54__SSErrorHandler__handleMessage_fromServerConnection___block_invoke(xpc_object_t *a1)
{
  if (xpc_dictionary_get_int64(a1[4], "0") == 1012)
    objc_msgSend(a1[5], "_openSessionWithMessage:", a1[4]);
  xpc_release(a1[4]);
  xpc_release(a1[6]);
}

- (void)_openSessionWithMessage:(id)a3
{
  SSErrorHandlerSession *v5;
  CFArrayRef v6;
  SSErrorHandlerDelegate *delegate;
  NSObject *delegateQueue;
  _QWORD block[7];

  v5 = objc_alloc_init(SSErrorHandlerSession);
  -[SSErrorHandlerSession _setControlConnection:](v5, "_setControlConnection:", self->_controlConnection);
  -[SSErrorHandlerSession _setSessionID:](v5, "_setSessionID:", xpc_dictionary_get_int64(a3, "1"));
  objc_opt_class();
  v6 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
  -[SSErrorHandlerSession _setErrorProperties:](v5, "_setErrorProperties:", v6);

  delegate = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SSErrorHandler__openSessionWithMessage___block_invoke;
    block[3] = &unk_1E47B9E88;
    block[4] = delegate;
    block[5] = self;
    block[6] = v5;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    -[SSErrorHandlerSession performDefaultHandling](v5, "performDefaultHandling");
  }

}

uint64_t __42__SSErrorHandler__openSessionWithMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "errorHandler:handleSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_reconnectToDaemonWithCompletionBlock:(id)a3
{
  id v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_object_t v18;
  id v19;
  SSWeakReference *v20;
  SSXPCConnection *controlConnection;
  uint64_t v22;
  _QWORD v23[6];
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v5 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v5)
      v5 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v8 = v7;
    else
      v8 = v7 & 2;
    if (v8)
    {
      v24 = 136446210;
      v25 = "-[SSErrorHandler _reconnectToDaemonWithCompletionBlock:]";
      LODWORD(v22) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v24, v22);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 96);
  SSXPCDictionarySetCFObject(v18, "2", (__CFString *)self->_failureTypes);
  v19 = -[SSXPCConnection createXPCEndpoint](self->_observerConnection, "createXPCEndpoint");
  xpc_dictionary_set_value(v18, "1", v19);
  xpc_release(v19);
  v20 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self);
  controlConnection = self->_controlConnection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__SSErrorHandler__reconnectToDaemonWithCompletionBlock___block_invoke;
  v23[3] = &unk_1E47BC4B8;
  v23[4] = v20;
  v23[5] = a3;
  -[SSXPCConnection sendMessage:withReply:](controlConnection, "sendMessage:withReply:", v18, v23);
  xpc_release(v18);
}

void __56__SSErrorHandler__reconnectToDaemonWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  _QWORD v10[6];
  BOOL v11;

  v4 = objc_msgSend(*(id *)(a1 + 32), "object");
  if (*(_QWORD *)(a1 + 40))
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = (void *)v4;
    if (a2 == (void *)MEMORY[0x1E0C81258])
    {
      v7 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 121, 0, 0);
      v8 = 0;
    }
    else
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a2, "2"));
      v8 = xpc_dictionary_get_BOOL(a2, "1");
      if (v8)
      {
LABEL_11:
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __56__SSErrorHandler__reconnectToDaemonWithCompletionBlock___block_invoke_2;
        v10[3] = &unk_1E47BE748;
        v9 = *(_QWORD *)(a1 + 40);
        v11 = v8;
        v10[4] = v7;
        v10[5] = v9;
        objc_msgSend(v6, "_dispatchToDelegate:", v10);

        return;
      }
    }
    if (!v7)
      v7 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    goto LABEL_11;
  }
}

uint64_t __56__SSErrorHandler__reconnectToDaemonWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_sendDisconnectMessage
{
  SSErrorHandlerDelegate *v3;
  NSObject *delegateQueue;
  _QWORD v5[6];

  v3 = -[SSErrorHandler delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __40__SSErrorHandler__sendDisconnectMessage__block_invoke;
    v5[3] = &unk_1E47B8BB8;
    v5[4] = v3;
    v5[5] = self;
    dispatch_async(delegateQueue, v5);
  }
}

uint64_t __40__SSErrorHandler__sendDisconnectMessage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "errorHandlerDidDisconnect:", *(_QWORD *)(a1 + 40));
}

- (void)_tearDownConnections
{
  -[SSXPCConnection setDisconnectBlock:](self->_controlConnection, "setDisconnectBlock:", 0);

  self->_controlConnection = 0;
  -[SSXPCConnection setMessageBlock:](self->_observerConnection, "setMessageBlock:", 0);

  self->_observerConnection = 0;
}

@end
