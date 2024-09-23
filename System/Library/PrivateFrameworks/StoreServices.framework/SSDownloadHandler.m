@implementation SSDownloadHandler

- (SSDownloadHandler)init
{
  SSDownloadHandler *v2;
  SSDownloadHandler *v3;
  void *v4;
  void *v5;
  const __CFUUID *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *dispatchQueue;
  _QWORD block[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SSDownloadHandler;
  v2 = -[SSDownloadHandler init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_sessionsNeedPowerAssertion = 257;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.storeservices.SSDownloadHandler.%p"), v2);
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.storeservices.SSDownloadHandler.delegate.%p"), v3);
    v3->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);

    v6 = CFUUIDCreate(0);
    v3->_handlerID = *(_OWORD *)&CFUUIDGetUUIDBytes(v6);
    CFRelease(v6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)__DaemonLaunchNotification_0, CFSTR("com.apple.iTunesStore.daemon.launched"), 0, CFNotificationSuspensionBehaviorCoalesce);
    dispatchQueue = v3->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__SSDownloadHandler_init__block_invoke;
    block[3] = &unk_1E47B8B68;
    block[4] = v3;
    dispatch_async(dispatchQueue, block);
  }
  return v3;
}

uint64_t __25__SSDownloadHandler_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToDaemon");
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *delegateQueue;
  NSObject *dispatchQueue;
  objc_super v6;
  _QWORD block[5];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.iTunesStore.daemon.launched"), 0);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__SSDownloadHandler_dealloc__block_invoke;
    block[3] = &unk_1E47B8B68;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadHandler;
  -[SSDownloadHandler dealloc](&v6, sel_dealloc);
}

void __28__SSDownloadHandler_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setMessageBlock:", 0);

}

- (SSDownloadHandlerDelegate)delegate
{
  NSObject *dispatchQueue;
  SSDownloadHandlerDelegate *v3;
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__SSDownloadHandler_delegate__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSDownloadHandlerDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __29__SSDownloadHandler_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)downloadPhasesToIgnore
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SSDownloadHandler_downloadPhasesToIgnore__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __43__SSDownloadHandler_downloadPhasesToIgnore__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (int64_t)handlerIdentifier
{
  return self->_handlerID;
}

- (void)resetDisavowedSessions
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v18 = 136446210;
      v19 = "-[SSDownloadHandler resetDisavowedSessions]";
      LODWORD(v17) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v18, v17);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 40);
  xpc_dictionary_set_int64(v16, "1", self->_handlerID);
  -[SSXPCConnection sendMessage:](self->_controlConnection, "sendMessage:", v16);
  xpc_release(v16);
}

- (BOOL)sessionsNeedPowerAssertion
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SSDownloadHandler_sessionsNeedPowerAssertion__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__SSDownloadHandler_sessionsNeedPowerAssertion__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

- (BOOL)sessionsShouldBlockOtherDownloads
{
  NSObject *dispatchQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SSDownloadHandler_sessionsShouldBlockOtherDownloads__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__SSDownloadHandler_sessionsShouldBlockOtherDownloads__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 65);
  return result;
}

- (void)setDelegate:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SSDownloadHandler_setDelegate___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __33__SSDownloadHandler_setDelegate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setDownloadPhasesToIgnore:(id)a3
{
  NSObject *dispatchQueue;
  xpc_object_t v6;
  void *v7;
  _QWORD v8[6];

  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SSDownloadHandler_setDownloadPhasesToIgnore___block_invoke;
  v8[3] = &unk_1E47B8BB8;
  v8[4] = self;
  v8[5] = a3;
  dispatch_sync(dispatchQueue, v8);
  if (a3)
    v6 = SSXPCCreateXPCObjectFromCFObject((__CFString *)a3);
  else
    v6 = xpc_null_create();
  v7 = v6;
  -[SSDownloadHandler _setValue:forProperty:](self, "_setValue:forProperty:", v6, "1");
  xpc_release(v7);
}

uint64_t __47__SSDownloadHandler_setDownloadPhasesToIgnore___block_invoke(uint64_t result)
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

- (void)setSessionsNeedPowerAssertion:(BOOL)a3
{
  NSObject *dispatchQueue;
  xpc_object_t v6;
  _QWORD v7[5];
  BOOL v8;

  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SSDownloadHandler_setSessionsNeedPowerAssertion___block_invoke;
  v7[3] = &unk_1E47B9C78;
  v7[4] = self;
  v8 = a3;
  dispatch_sync(dispatchQueue, v7);
  v6 = xpc_BOOL_create(a3);
  -[SSDownloadHandler _setValue:forProperty:](self, "_setValue:forProperty:", v6, "0");
  xpc_release(v6);
}

uint64_t __51__SSDownloadHandler_setSessionsNeedPowerAssertion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setSessionsShouldBlockOtherDownloads:(BOOL)a3
{
  NSObject *dispatchQueue;
  xpc_object_t v6;
  _QWORD v7[5];
  BOOL v8;

  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SSDownloadHandler_setSessionsShouldBlockOtherDownloads___block_invoke;
  v7[3] = &unk_1E47B9C78;
  v7[4] = self;
  v8 = a3;
  dispatch_sync(dispatchQueue, v7);
  v6 = xpc_BOOL_create(a3);
  -[SSDownloadHandler _setValue:forProperty:](self, "_setValue:forProperty:", v6, "2");
  xpc_release(v6);
}

uint64_t __58__SSDownloadHandler_setSessionsShouldBlockOtherDownloads___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 65) = *(_BYTE *)(result + 40);
  return result;
}

- (id)description
{
  NSObject *dispatchQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SSDownloadHandler_description__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSDownloadHandler_description__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t result;
  objc_super v4;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)SSDownloadHandler;
  result = objc_msgSend(v2, "initWithFormat:", CFSTR("%@: Blocks: %d, Ignores: (%@)"), objc_msgSendSuper2(&v4, sel_description), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 65), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_connectToDaemon
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SSWeakReference *v16;
  SSXPCConnection *v17;
  uint64_t v18;
  SSXPCConnection *v19;
  uint64_t v20;
  id v21;
  int v22;
  int v23;
  uint64_t v24;
  int64_t handlerID;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  xpc_object_t v35;
  id v36;
  int *v37;
  uint64_t v38;
  _QWORD v39[5];
  _QWORD v40[5];
  int v41;
  const char *v42;
  __int16 v43;
  int64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v3)
      v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v41 = 136446210;
      v42 = "-[SSDownloadHandler _connectToDaemon]";
      LODWORD(v38) = 12;
      v37 = &v41;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v41, v38);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  v16 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self, v37);
  if (!self->_controlConnection)
  {
    v17 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v18 = MEMORY[0x1E0C809B0];
    self->_controlConnection = v17;
    v40[0] = v18;
    v40[1] = 3221225472;
    v40[2] = __37__SSDownloadHandler__connectToDaemon__block_invoke;
    v40[3] = &unk_1E47B8B68;
    v40[4] = v16;
    -[SSXPCConnection setDisconnectBlock:](v17, "setDisconnectBlock:", v40);
  }
  if (!self->_observerConnection)
  {
    v19 = objc_alloc_init(SSXPCConnection);
    v20 = MEMORY[0x1E0C809B0];
    self->_observerConnection = v19;
    v39[0] = v20;
    v39[1] = 3221225472;
    v39[2] = __37__SSDownloadHandler__connectToDaemon__block_invoke_2;
    v39[3] = &unk_1E47BD1E0;
    v39[4] = v16;
    -[SSXPCConnection setMessageBlock:](v19, "setMessageBlock:", v39);
  }
  v21 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v21)
    v21 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v22 = objc_msgSend(v21, "shouldLog");
  if (objc_msgSend(v21, "shouldLogToDisk"))
    v23 = v22 | 2;
  else
    v23 = v22;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v21, "OSLogObject"), OS_LOG_TYPE_INFO))
    v23 &= 2u;
  if (v23)
  {
    v24 = objc_opt_class();
    handlerID = self->_handlerID;
    v41 = 138412546;
    v42 = (const char *)v24;
    v43 = 2048;
    v44 = handlerID;
    LODWORD(v38) = 22;
    v26 = _os_log_send_and_compose_impl();
    if (v26)
    {
      v27 = (void *)v26;
      v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v41, v38);
      free(v27);
      SSFileLog(v21, CFSTR("%@"), v29, v30, v31, v32, v33, v34, v28);
    }
  }
  v35 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v35, "0", 3);
  xpc_dictionary_set_int64(v35, "1", self->_handlerID);
  xpc_dictionary_set_BOOL(v35, "3", self->_sessionsShouldBlockOtherDownloads);
  SSXPCDictionarySetCFObject(v35, "4", (__CFString *)self->_downloadPhasesToIgnore);
  xpc_dictionary_set_BOOL(v35, "5", self->_sessionsNeedPowerAssertion);
  v36 = -[SSXPCConnection createXPCEndpoint](self->_observerConnection, "createXPCEndpoint");
  xpc_dictionary_set_value(v35, "2", v36);
  xpc_release(v36);
  -[SSXPCConnection sendMessage:](self->_controlConnection, "sendMessage:", v35);
  xpc_release(v35);
}

uint64_t __37__SSDownloadHandler__connectToDaemon__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_sendDisconnectMessage");
}

uint64_t __37__SSDownloadHandler__connectToDaemon__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_handleMessage:fromServerConnection:", a2, a3);
}

- (id)_controlConnection
{
  NSObject *dispatchQueue;
  id v3;
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__SSDownloadHandler__controlConnection__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __39__SSDownloadHandler__controlConnection__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  xpc_retain(a3);
  xpc_retain(a4);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SSDownloadHandler__handleMessage_fromServerConnection___block_invoke;
  block[3] = &unk_1E47B9E88;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

void __57__SSDownloadHandler__handleMessage_fromServerConnection___block_invoke(uint64_t a1)
{
  int64_t int64;
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  NSObject *v19;
  xpc_object_t reply;
  uint64_t v21;
  _QWORD block[5];
  __int128 v23;
  int64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "0");
  v3 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v3)
    v3 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
    v25 = 138412802;
    v26 = v6;
    v27 = 2048;
    v28 = v7;
    v29 = 2048;
    v30 = int64;
    LODWORD(v21) = 32;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v25, v21);
      free(v9);
      SSFileLog(v3, CFSTR("%@"), v11, v12, v13, v14, v15, v16, v10);
    }
  }
  if ((unint64_t)(int64 - 1000) <= 5 && ((1 << (int64 + 24)) & 0x27) != 0)
  {
    xpc_retain(*(xpc_object_t *)(a1 + 32));
    xpc_retain(*(xpc_object_t *)(a1 + 48));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(_OWORD *)(a1 + 40);
    v19 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    block[2] = __57__SSDownloadHandler__handleMessage_fromServerConnection___block_invoke_24;
    block[3] = &unk_1E47BD208;
    block[4] = v17;
    v24 = int64;
    v23 = v18;
    dispatch_async(v19, block);
  }
  else if (int64)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), reply);
    xpc_release(reply);
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

void __57__SSDownloadHandler__handleMessage_fromServerConnection___block_invoke_24(uint64_t a1)
{
  xpc_object_t reply;
  BOOL v3;
  char v4;

  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  v3 = 0;
  switch(*(_QWORD *)(a1 + 56))
  {
    case 0x3E8:
      v4 = objc_msgSend(*(id *)(a1 + 40), "_sendSessionHandleWithMessage:", *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    case 0x3E9:
      v4 = objc_msgSend(*(id *)(a1 + 40), "_sendSessionCancelWithMessage:", *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    case 0x3EALL:
      v4 = objc_msgSend(*(id *)(a1 + 40), "_sendSessionPauseWithMessage:", *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    case 0x3EDLL:
      v4 = objc_msgSend(*(id *)(a1 + 40), "_sendAuthenticationSessionWithMessage:", *(_QWORD *)(a1 + 32));
LABEL_6:
      v3 = v4;
      break;
    default:
      break;
  }
  xpc_dictionary_set_BOOL(reply, "0", v3);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 48));
}

- (id)_newSessionWithMessage:(id)a3
{
  return -[SSDownloadHandlerSession _initWithMessage:controlConnection:]([SSDownloadHandlerSession alloc], "_initWithMessage:controlConnection:", a3, -[SSDownloadHandler _controlConnection](self, "_controlConnection"));
}

- (BOOL)_sendAuthenticationSessionWithMessage:(id)a3
{
  SSDownloadHandlerDelegate *v5;
  char v6;
  id v7;
  SSDownloadHandler *v8;

  v5 = -[SSDownloadHandler delegate](self, "delegate");
  v6 = objc_opt_respondsToSelector();
  if ((v6 & 1) != 0)
  {
    v7 = -[SSDownloadSession _initWithMessage:controlConnection:]([SSDownloadAuthenticationSession alloc], "_initWithMessage:controlConnection:", a3, -[SSDownloadHandler _controlConnection](self, "_controlConnection"));
    v8 = self;
    -[SSDownloadHandlerDelegate downloadHandler:handleAuthenticationSession:](v5, "downloadHandler:handleAuthenticationSession:", self, v7);

  }
  return v6 & 1;
}

- (void)_sendDisconnectMessage
{
  SSDownloadHandlerDelegate *v3;
  SSDownloadHandler *v4;

  v3 = -[SSDownloadHandler delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = self;
    -[SSDownloadHandlerDelegate downloadHandlerDidDisconnect:](v3, "downloadHandlerDidDisconnect:", self);
  }
}

- (BOOL)_sendSessionCancelWithMessage:(id)a3
{
  SSDownloadHandlerDelegate *v5;
  char v6;
  id v7;
  SSDownloadHandler *v8;

  v5 = -[SSDownloadHandler delegate](self, "delegate");
  v6 = objc_opt_respondsToSelector();
  if ((v6 & 1) != 0)
  {
    v7 = -[SSDownloadHandler _newSessionWithMessage:](self, "_newSessionWithMessage:", a3);
    v8 = self;
    -[SSDownloadHandlerDelegate downloadHandler:cancelSession:](v5, "downloadHandler:cancelSession:", self, v7);

  }
  return v6 & 1;
}

- (BOOL)_sendSessionHandleWithMessage:(id)a3
{
  SSDownloadHandlerDelegate *v5;
  char v6;
  id v7;
  SSDownloadHandler *v8;

  v5 = -[SSDownloadHandler delegate](self, "delegate");
  v6 = objc_opt_respondsToSelector();
  if ((v6 & 1) != 0)
  {
    v7 = -[SSDownloadHandler _newSessionWithMessage:](self, "_newSessionWithMessage:", a3);
    v8 = self;
    -[SSDownloadHandlerDelegate downloadHandler:handleSession:](v5, "downloadHandler:handleSession:", self, v7);

  }
  return v6 & 1;
}

- (BOOL)_sendSessionPauseWithMessage:(id)a3
{
  SSDownloadHandlerDelegate *v5;
  id v6;
  SSDownloadHandler *v7;
  char v8;

  v5 = -[SSDownloadHandler delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v6 = -[SSDownloadHandler _newSessionWithMessage:](self, "_newSessionWithMessage:", a3);
  v7 = self;
  v8 = -[SSDownloadHandlerDelegate downloadHandler:pauseSession:](v5, "downloadHandler:pauseSession:", self, v6);

  return v8;
}

- (void)_setValue:(id)a3 forProperty:(const char *)a4
{
  id v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v7)
      v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v10 = v9;
    else
      v10 = v9 & 2;
    if (v10)
    {
      v23 = 136446210;
      v24 = "-[SSDownloadHandler _setValue:forProperty:]";
      LODWORD(v22) = 12;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v23, v22);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 31);
  xpc_dictionary_set_int64(v20, "1", self->_handlerID);
  v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v21, a4, a3);
  xpc_dictionary_set_value(v20, "2", v21);
  xpc_release(v21);
  -[SSXPCConnection sendMessage:](self->_controlConnection, "sendMessage:", v20);
  xpc_release(v20);
}

@end
