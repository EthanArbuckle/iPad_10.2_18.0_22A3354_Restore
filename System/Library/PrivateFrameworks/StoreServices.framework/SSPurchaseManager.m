@implementation SSPurchaseManager

uint64_t __44__SSPurchaseManager_getPurchasesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_sendCompletionBlock:forGetPurchasesReply:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __40__SSPurchaseManager__responseConnection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_handleMessage:fromConnection:", a2, a3);
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
  xpc_object_t v16;
  void *v17;
  void *v18;
  int *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v6 = v5;
    else
      v6 = v5 & 2;
    if (v6)
    {
      v21 = 136446210;
      v22 = "-[SSPurchaseManager _connectToDaemon]";
      LODWORD(v20) = 12;
      v19 = &v21;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v21, v20);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  v16 = SSXPCCreateMessageDictionary(104);
  SSXPCDictionarySetCFObject(v16, "1", (__CFString *)self->_managerIdentifier);
  v17 = (void *)objc_msgSend(-[SSPurchaseManager _responseConnection](self, "_responseConnection"), "createXPCEndpoint");
  if (v17)
  {
    v18 = v17;
    xpc_dictionary_set_value(v16, "2", v17);
    xpc_release(v18);
  }
  +[SSAuthenticateRequest localAuthenticationAvailable](SSAuthenticateRequest, "localAuthenticationAvailable", v19);
  xpc_dictionary_set_BOOL(v16, "3", 0);
  objc_msgSend(-[SSPurchaseManager _requestConnection](self, "_requestConnection"), "sendMessage:withReply:", v16, &__block_literal_global_29);
  xpc_release(v16);
}

void __44__SSPurchaseManager_getPurchasesUsingBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  SSWeakReference *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[6];

  v2 = SSXPCCreateMessageDictionary(100);
  v3 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_requestConnection");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SSPurchaseManager_getPurchasesUsingBlock___block_invoke_2;
  v6[3] = &unk_1E47BC4B8;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = v3;
  v6[5] = v5;
  objc_msgSend(v4, "sendMessage:withReply:", v2, v6);
  xpc_release(v2);
}

- (id)_requestConnection
{
  id result;

  result = self->_requestConnection;
  if (!result)
  {
    result = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    self->_requestConnection = (SSXPCConnection *)result;
  }
  return result;
}

- (id)_responseConnection
{
  id result;
  SSWeakReference *v4;
  SSXPCConnection *responseConnection;
  _QWORD v6[5];

  result = self->_responseConnection;
  if (!result)
  {
    self->_responseConnection = objc_alloc_init(SSXPCConnection);
    v4 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self);
    responseConnection = self->_responseConnection;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__SSPurchaseManager__responseConnection__block_invoke;
    v6[3] = &unk_1E47BD1E0;
    v6[4] = v4;
    -[SSXPCConnection setMessageBlock:](responseConnection, "setMessageBlock:", v6);
    return self->_responseConnection;
  }
  return result;
}

uint64_t __63__SSPurchaseManager__sendCompletionBlock_forGetPurchasesReply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __33__SSPurchaseManager_setDelegate___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)(result + 40);
  if (!v2)
    return objc_msgSend(*(id *)(result + 32), "_connectToDaemon");
  return result;
}

- (void)setDelegate:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SSPurchaseManager_setDelegate___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_handleMessage:(id)a3 fromConnection:(id)a4
{
  int64_t int64;

  int64 = xpc_dictionary_get_int64(a3, "0");
  if (int64 == 1101)
  {
    -[SSPurchaseManager _handlePurchasesFinished:fromConnection:](self, "_handlePurchasesFinished:fromConnection:", a3, a4);
  }
  else if (int64 == 1100)
  {
    -[SSPurchaseManager _handleAuthenticateRequest:fromConnection:](self, "_handleAuthenticateRequest:fromConnection:", a3, a4);
  }
}

- (void)_sendCompletionBlock:(id)a3 forGetPurchasesReply:(id)a4
{
  _BOOL4 v7;
  id v8;
  uint64_t v9;
  xpc_object_t value;
  void *v11;
  NSObject *completionBlockQueue;
  _QWORD block[7];
  _QWORD applier[5];
  uint64_t v15;

  if (a3)
  {
    v15 = 0;
    v7 = -[SSPurchaseManager _resultForReply:error:](self, "_resultForReply:error:", a4, &v15);
    v8 = 0;
    v9 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      value = xpc_dictionary_get_value(a4, "2");
      if (value && (v11 = value, MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812C8]))
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        applier[0] = v9;
        applier[1] = 3221225472;
        applier[2] = __63__SSPurchaseManager__sendCompletionBlock_forGetPurchasesReply___block_invoke;
        applier[3] = &unk_1E47B9F50;
        applier[4] = v8;
        xpc_array_apply(v11, applier);
      }
      else
      {
        v8 = 0;
      }
    }
    completionBlockQueue = self->_completionBlockQueue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __63__SSPurchaseManager__sendCompletionBlock_forGetPurchasesReply___block_invoke_2;
    block[3] = &unk_1E47B9E60;
    block[4] = v8;
    block[5] = v15;
    block[6] = a3;
    dispatch_async(completionBlockQueue, block);

  }
}

- (BOOL)_resultForReply:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  BOOL v8;
  id v9;

  if (a3 == (id)MEMORY[0x1E0C81258])
  {
    v6 = 121;
LABEL_6:
    v7 = (id)SSError((uint64_t)CFSTR("SSErrorDomain"), v6, 0, 0);
    v8 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (!a3 || MEMORY[0x1A85863E4](a3, a2) != MEMORY[0x1E0C812F8])
  {
    v6 = 111;
    goto LABEL_6;
  }
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
  v8 = xpc_dictionary_get_BOOL(a3, "0");
  if (!a4)
    goto LABEL_9;
LABEL_7:
  if (!v8)
    *a4 = v7;
LABEL_9:
  v9 = v7;
  return v8;
}

- (SSPurchaseManager)initWithManagerIdentifier:(id)a3
{
  SSPurchaseManager *v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSPurchaseManager;
  v4 = -[SSPurchaseManager init](&v9, sel_init);
  if (v4)
  {
    v4->_managerIdentifier = (NSString *)objc_msgSend(a3, "copy");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSPurchaseManager.%@.%p"), a3, v4);
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.SSPurchaseManager.completion.%@.%p"), a3, v4);
    v4->_completionBlockQueue = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)__DaemonLaunchNotification_4, CFSTR("com.apple.iTunesStore.daemon.launched"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v4;
}

- (void)getPurchasesUsingBlock:(id)a3
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
  NSObject *dispatchQueue;
  uint64_t v19;
  _QWORD block[6];
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      v21 = 136446210;
      v22 = "-[SSPurchaseManager getPurchasesUsingBlock:]";
      LODWORD(v19) = 12;
      v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v21, v19);
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SSPurchaseManager_getPurchasesUsingBlock___block_invoke;
  block[3] = &unk_1E47BBC58;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

- (SSPurchaseManager)init
{
  return -[SSPurchaseManager initWithManagerIdentifier:](self, "initWithManagerIdentifier:", 0);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *completionBlockQueue;
  NSObject *dispatchQueue;
  objc_super v6;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.iTunesStore.daemon.launched"), 0);
  completionBlockQueue = self->_completionBlockQueue;
  if (completionBlockQueue)
    dispatch_release(completionBlockQueue);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  -[SSXPCConnection setMessageBlock:](self->_responseConnection, "setMessageBlock:", 0);
  v6.receiver = self;
  v6.super_class = (Class)SSPurchaseManager;
  -[SSPurchaseManager dealloc](&v6, sel_dealloc);
}

- (void)addPurchases:(id)a3 withCompletionBlock:(id)a4
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
  NSObject *dispatchQueue;
  uint64_t v21;
  _QWORD block[7];
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v10 = v9;
    else
      v10 = v9 & 2;
    if (v10)
    {
      v23 = 136446210;
      v24 = "-[SSPurchaseManager addPurchases:withCompletionBlock:]";
      LODWORD(v21) = 12;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v23, v21);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSPurchaseManager_addPurchases_withCompletionBlock___block_invoke;
  block[3] = &unk_1E47BA838;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __54__SSPurchaseManager_addPurchases_withCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:withPurchases:afterPurchase:completionBlock:", 98, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (void)cancelPurchases:(id)a3 withCompletionBlock:(id)a4
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
  NSObject *dispatchQueue;
  uint64_t v21;
  _QWORD block[7];
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
    if (os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v10 = v9;
    else
      v10 = v9 & 2;
    if (v10)
    {
      v23 = 136446210;
      v24 = "-[SSPurchaseManager cancelPurchases:withCompletionBlock:]";
      LODWORD(v21) = 12;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v23, v21);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SSPurchaseManager_cancelPurchases_withCompletionBlock___block_invoke;
  block[3] = &unk_1E47BA838;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(dispatchQueue, block);
}

uint64_t __57__SSPurchaseManager_cancelPurchases_withCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:withPurchaseIdentifiers:afterPurchase:completionBlock:", 99, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (SSPurchaseManagerDelegate)delegate
{
  NSObject *dispatchQueue;
  SSPurchaseManagerDelegate *v3;
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
  v9 = __Block_byref_object_copy__63;
  v10 = __Block_byref_object_dispose__63;
  v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__SSPurchaseManager_delegate__block_invoke;
  v5[3] = &unk_1E47B8DF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (SSPurchaseManagerDelegate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __29__SSPurchaseManager_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)insertPurchases:(id)a3 afterPurchase:(id)a4 withCompletionBlock:(id)a5
{
  id v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *dispatchQueue;
  uint64_t v23;
  _QWORD block[8];
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v9 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v9)
      v9 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v12 = v11;
    else
      v12 = v11 & 2;
    if (v12)
    {
      v25 = 136446210;
      v26 = "-[SSPurchaseManager insertPurchases:afterPurchase:withCompletionBlock:]";
      LODWORD(v23) = 12;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v25, v23);
        free(v14);
        SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SSPurchaseManager_insertPurchases_afterPurchase_withCompletionBlock___block_invoke;
  block[3] = &unk_1E47BF380;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  dispatch_async(dispatchQueue, block);
}

uint64_t __71__SSPurchaseManager_insertPurchases_afterPurchase_withCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:withPurchases:afterPurchase:completionBlock:", 102, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (NSString)managerIdentifier
{
  return self->_managerIdentifier;
}

- (void)movePurchases:(id)a3 afterPurchase:(id)a4 withCompletionBlock:(id)a5
{
  id v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *dispatchQueue;
  uint64_t v23;
  _QWORD block[8];
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    v9 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v9)
      v9 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_FAULT))
      v12 = v11;
    else
      v12 = v11 & 2;
    if (v12)
    {
      v25 = 136446210;
      v26 = "-[SSPurchaseManager movePurchases:afterPurchase:withCompletionBlock:]";
      LODWORD(v23) = 12;
      v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v25, v23);
        free(v14);
        SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SSPurchaseManager_movePurchases_afterPurchase_withCompletionBlock___block_invoke;
  block[3] = &unk_1E47BF380;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  dispatch_async(dispatchQueue, block);
}

uint64_t __69__SSPurchaseManager_movePurchases_afterPurchase_withCompletionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:withPurchaseIdentifiers:afterPurchase:completionBlock:", 103, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_handleAuthenticateRequest:(id)a3 fromConnection:(id)a4
{
  xpc_object_t value;
  SSAuthenticationContext *v8;
  id v9;
  id v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  SSAuthenticateRequest *v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[8];
  int v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  value = xpc_dictionary_get_value(a3, "1");
  if (value)
  {
    v8 = -[SSAuthenticationContext initWithXPCEncoding:]([SSAuthenticationContext alloc], "initWithXPCEncoding:", value);
    v9 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v10 = v9;
    if (v8)
    {
      if (!v9)
        v10 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v12 &= 2u;
      if (v12)
      {
        v36 = 138543618;
        v37 = objc_opt_class();
        v38 = 2114;
        v39 = -[SSAuthenticationContext logUUID](v8, "logUUID");
        LODWORD(v34) = 22;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v36, v34);
          free(v14);
          SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, v15);
        }
      }
      v22 = -[SSAuthenticateRequest initWithAuthenticationContext:]([SSAuthenticateRequest alloc], "initWithAuthenticationContext:", v8);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __63__SSPurchaseManager__handleAuthenticateRequest_fromConnection___block_invoke;
      v35[3] = &unk_1E47BF3A8;
      v35[4] = self;
      v35[5] = v8;
      v35[6] = a3;
      v35[7] = a4;
      -[SSAuthenticateRequest startWithAuthenticateResponseBlock:](v22, "startWithAuthenticateResponseBlock:", v35);
    }
    else
    {
      if (!v9)
        v10 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v23 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v24 = v23 | 2;
      else
        v24 = v23;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_ERROR))
        v24 &= 2u;
      if (v24)
      {
        v36 = 138543362;
        v37 = objc_opt_class();
        LODWORD(v34) = 12;
        v25 = _os_log_send_and_compose_impl();
        if (v25)
        {
          v26 = (void *)v25;
          v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v36, v34);
          free(v26);
          SSFileLog(v10, CFSTR("%@"), v28, v29, v30, v31, v32, v33, v27);
        }
      }
    }
  }
}

void __63__SSPurchaseManager__handleAuthenticateRequest_fromConnection___block_invoke(uint64_t a1, SSAuthenticateResponse *a2, uint64_t a3)
{
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t reply;
  id v21;
  void *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v6)
    v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v8 &= 2u;
  if (v8)
  {
    v9 = objc_opt_class();
    v10 = objc_msgSend(*(id *)(a1 + 40), "logUUID");
    v24 = 138543874;
    v25 = v9;
    v26 = 2114;
    v27 = v10;
    v28 = 2114;
    v29 = a3;
    LODWORD(v23) = 32;
    v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v24, v23);
      free(v12);
      SSFileLog(v6, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
    }
  }
  if (!a2)
  {
    if (!a3)
      a3 = SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    a2 = objc_alloc_init(SSAuthenticateResponse);
    -[SSAuthenticateResponse setAuthenticateResponseType:](a2, "setAuthenticateResponseType:", 0);
    -[SSAuthenticateResponse setError:](a2, "setError:", a3);
  }
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  v21 = -[SSAuthenticateResponse copyXPCEncoding](a2, "copyXPCEncoding");
  if (v21)
  {
    v22 = v21;
    xpc_dictionary_set_value(reply, "0", v21);
    xpc_release(v22);
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  xpc_release(reply);
}

- (void)_handlePurchasesFinished:(id)a3 fromConnection:(id)a4
{
  SSPurchaseManagerDelegate *v6;
  xpc_object_t v7;
  id v8;
  xpc_object_t value;
  void *v10;
  NSObject *completionBlockQueue;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  xpc_object_t v26;
  uint64_t v27;
  _QWORD block[7];
  _QWORD applier[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  int v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = -[SSPurchaseManager delegate](self, "delegate", a3, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = xpc_array_create(0, 0);
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    value = xpc_dictionary_get_value(a3, "1");
    v10 = value;
    if (value && MEMORY[0x1A85863E4](value) == MEMORY[0x1E0C812C8])
    {
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __61__SSPurchaseManager__handlePurchasesFinished_fromConnection___block_invoke;
      applier[3] = &unk_1E47BF3D0;
      applier[4] = self;
      applier[5] = v7;
      applier[6] = v8;
      applier[7] = &v30;
      xpc_array_apply(v10, applier);
    }
    if (*((_BYTE *)v31 + 24))
      objc_msgSend(+[SSVSubscriptionStatusCoordinator _existingSharedCoordinator](SSVSubscriptionStatusCoordinator, "_existingSharedCoordinator"), "_invalidateLastKnownStatus");
    if (objc_msgSend(v8, "count"))
    {
      completionBlockQueue = self->_completionBlockQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__SSPurchaseManager__handlePurchasesFinished_fromConnection___block_invoke_2;
      block[3] = &unk_1E47B9E88;
      block[4] = v6;
      block[5] = self;
      block[6] = v8;
      dispatch_async(completionBlockQueue, block);
    }
    if (xpc_array_get_count(v7))
    {
      if (SSIsInternalBuild() && _os_feature_enabled_impl())
      {
        v12 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v12)
          v12 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v13 = objc_msgSend(v12, "shouldLog");
        v14 = objc_msgSend(v12, "shouldLogToDisk");
        v15 = objc_msgSend(v12, "OSLogObject");
        if (v14)
          v13 |= 2u;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          v16 = v13;
        else
          v16 = v13 & 2;
        if (v16)
        {
          v34 = 136446210;
          v35 = "-[SSPurchaseManager _handlePurchasesFinished:fromConnection:]";
          LODWORD(v27) = 12;
          v17 = _os_log_send_and_compose_impl();
          if (v17)
          {
            v18 = (void *)v17;
            v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v34, v27);
            free(v18);
            SSFileLog(v12, CFSTR("%@"), v20, v21, v22, v23, v24, v25, v19);
          }
        }
      }
      v26 = SSXPCCreateMessageDictionary(101);
      SSXPCDictionarySetCFObject(v26, "1", (__CFString *)self->_managerIdentifier);
      xpc_dictionary_set_value(v26, "2", v7);
      objc_msgSend(-[SSPurchaseManager _requestConnection](self, "_requestConnection"), "sendMessage:withReply:", v26, &__block_literal_global_28_0);
      xpc_release(v26);
    }

    xpc_release(v7);
    _Block_object_dispose(&v30, 8);
  }
}

uint64_t __61__SSPurchaseManager__handlePurchasesFinished_fromConnection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SSPurchaseResponse *v5;
  SSPurchaseResponse *v6;

  if (MEMORY[0x1A85863E4](a3) == MEMORY[0x1E0C812F8])
  {
    v5 = -[SSPurchaseResponse initWithXPCEncoding:]([SSPurchaseResponse alloc], "initWithXPCEncoding:", a3);
    if (v5)
    {
      v6 = v5;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_shouldInvalidateSubscriptionStatusForPurchaseResponse:", v5);
      xpc_array_set_int64(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, -[SSPurchase uniqueIdentifier](-[SSPurchaseResponse purchase](v6, "purchase"), "uniqueIdentifier"));
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

    }
  }
  return 1;
}

uint64_t __61__SSPurchaseManager__handlePurchasesFinished_fromConnection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "purchaseManager:didFinishPurchasesWithResponses:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_newEncodedArrayWithPurchaseIdentifiers:(id)a3
{
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = xpc_array_create(0, 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        xpc_array_set_int64(v4, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "uniqueIdentifier"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (id)_newEncodedArrayWithPurchases:(id)a3
{
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = xpc_array_create(0, 0);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "copyXPCEncoding");
        if (v9)
        {
          v10 = v9;
          xpc_array_append_value(v4, v9);
          xpc_release(v10);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v4;
}

- (void)_reconnectForDaemonLaunch
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SSPurchaseManager__reconnectForDaemonLaunch__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__SSPurchaseManager__reconnectForDaemonLaunch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToDaemon");
}

uint64_t __63__SSPurchaseManager__sendCompletionBlock_forGetPurchasesReply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SSPurchase *v4;
  SSPurchase *v5;

  v4 = -[SSPurchase initWithXPCEncoding:]([SSPurchase alloc], "initWithXPCEncoding:", a3);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  return 1;
}

- (void)_sendCompletionBlock:(id)a3 forStandardReply:(id)a4
{
  BOOL v6;
  NSObject *completionBlockQueue;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;

  if (a3)
  {
    v10 = 0;
    v6 = -[SSPurchaseManager _resultForReply:error:](self, "_resultForReply:error:", a4, &v10);
    completionBlockQueue = self->_completionBlockQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59__SSPurchaseManager__sendCompletionBlock_forStandardReply___block_invoke;
    v8[3] = &unk_1E47BE748;
    v9 = v6;
    v8[4] = v10;
    v8[5] = a3;
    dispatch_async(completionBlockQueue, v8);
  }
}

uint64_t __59__SSPurchaseManager__sendCompletionBlock_forStandardReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_sendMessage:(int64_t)a3 withPurchaseIdentifiers:(id)a4 afterPurchase:(id)a5 completionBlock:(id)a6
{
  xpc_object_t v10;
  id v11;
  SSWeakReference *v12;
  id v13;
  _QWORD v14[6];

  v10 = SSXPCCreateMessageDictionary(a3);
  SSXPCDictionarySetCFObject(v10, "1", (__CFString *)self->_managerIdentifier);
  if (a5)
    xpc_dictionary_set_int64(v10, "3", objc_msgSend(a5, "uniqueIdentifier"));
  v11 = -[SSPurchaseManager _newEncodedArrayWithPurchaseIdentifiers:](self, "_newEncodedArrayWithPurchaseIdentifiers:", a4);
  xpc_dictionary_set_value(v10, "2", v11);
  xpc_release(v11);
  v12 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self);
  v13 = -[SSPurchaseManager _requestConnection](self, "_requestConnection");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88__SSPurchaseManager__sendMessage_withPurchaseIdentifiers_afterPurchase_completionBlock___block_invoke;
  v14[3] = &unk_1E47BC4B8;
  v14[4] = v12;
  v14[5] = a6;
  objc_msgSend(v13, "sendMessage:withReply:", v10, v14);
  xpc_release(v10);
}

uint64_t __88__SSPurchaseManager__sendMessage_withPurchaseIdentifiers_afterPurchase_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_sendCompletionBlock:forStandardReply:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_sendMessage:(int64_t)a3 withPurchases:(id)a4 afterPurchase:(id)a5 completionBlock:(id)a6
{
  xpc_object_t v10;
  id v11;
  SSWeakReference *v12;
  id v13;
  _QWORD v14[6];

  v10 = SSXPCCreateMessageDictionary(a3);
  SSXPCDictionarySetCFObject(v10, "1", (__CFString *)self->_managerIdentifier);
  if (a5)
    xpc_dictionary_set_int64(v10, "3", objc_msgSend(a5, "uniqueIdentifier"));
  v11 = -[SSPurchaseManager _newEncodedArrayWithPurchases:](self, "_newEncodedArrayWithPurchases:", a4);
  xpc_dictionary_set_value(v10, "2", v11);
  xpc_release(v11);
  v12 = +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self);
  v13 = -[SSPurchaseManager _requestConnection](self, "_requestConnection");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__SSPurchaseManager__sendMessage_withPurchases_afterPurchase_completionBlock___block_invoke;
  v14[3] = &unk_1E47BC4B8;
  v14[4] = v12;
  v14[5] = a6;
  objc_msgSend(v13, "sendMessage:withReply:", v10, v14);
  xpc_release(v10);
}

uint64_t __78__SSPurchaseManager__sendMessage_withPurchases_afterPurchase_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_sendCompletionBlock:forStandardReply:", *(_QWORD *)(a1 + 40), a2);
}

- (BOOL)_shouldInvalidateSubscriptionStatusForPurchaseResponse:(id)a3
{
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a3, "error"))
    return 0;
  v5 = (void *)objc_msgSend(a3, "purchase");
  v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "requestProperties"), "URLBagKey");
  if (v6)
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("buyProduct")))
      return 0;
  }
  v7 = (void *)objc_msgSend(v5, "buyParameters");
  if (!v7)
    return 0;
  else
    return objc_msgSend(v7, "containsString:", CFSTR("STDQ"));
}

@end
