@implementation SSRequest

- (id)_initSSRequest
{
  SSRequest *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSRequest;
  v2 = -[SSRequest init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.StoreServices.%@.%p"), objc_opt_class(), v2));
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_callState = 0;
  }
  return v2;
}

- (void)dealloc
{
  BKSProcessAssertion *taskAssertion;
  BKSProcessAssertion *v4;
  NSObject *backgroundTaskExpirationTimer;
  objc_super v6;

  taskAssertion = self->_taskAssertion;
  if (taskAssertion)
  {
    -[BKSProcessAssertion invalidate](taskAssertion, "invalidate");
    v4 = self->_taskAssertion;
    self->_taskAssertion = 0;

  }
  backgroundTaskExpirationTimer = self->_backgroundTaskExpirationTimer;
  if (backgroundTaskExpirationTimer)
    dispatch_source_cancel(backgroundTaskExpirationTimer);
  -[SSXPCConnection setDisconnectBlock:](self->_requestConnection, "setDisconnectBlock:", 0);
  -[SSXPCConnection setMessageBlock:](self->_responseConnection, "setMessageBlock:", 0);
  v6.receiver = self;
  v6.super_class = (Class)SSRequest;
  -[SSRequest dealloc](&v6, sel_dealloc);
}

- (void)cancel
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *dispatchQueue;
  uint64_t v16;
  _QWORD block[5];
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      v7 = v5;
    else
      v7 = v5 & 2;
    if (v7)
    {
      v18 = 136446210;
      v19 = "-[SSRequest cancel]";
      LODWORD(v16) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v18, v16);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__SSRequest_cancel__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __19__SSRequest_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequestWithMessageID:", 63);
}

- (void)disconnect
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *dispatchQueue;
  uint64_t v16;
  _QWORD block[5];
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      v7 = v5;
    else
      v7 = v5 & 2;
    if (v7)
    {
      v18 = 136446210;
      v19 = "-[SSRequest disconnect]";
      LODWORD(v16) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v18, v16);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SSRequest_disconnect__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __23__SSRequest_disconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequestWithMessageID:", 64);
}

- (BOOL)start
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __18__SSRequest_start__block_invoke;
  v3[3] = &unk_1E47B9F78;
  v3[4] = self;
  -[SSRequest startWithCompletionBlock:](self, "startWithCompletionBlock:", v3);
  return 1;
}

void __18__SSRequest_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __18__SSRequest_start__block_invoke_2;
  v5[3] = &unk_1E47B8768;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __18__SSRequest_start__block_invoke_2(uint64_t a1)
{
  char v2;
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v2 & 1) != 0)
    {
      objc_msgSend(v5, "request:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_6:
      v3 = v5;
    }
  }
  else
  {
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "requestDidFinish:", *(_QWORD *)(a1 + 32));
      goto LABEL_6;
    }
  }

}

- (void)startWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v4, v5);

  }
}

- (void)setShouldCancelAfterTaskExpiration:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SSRequest_setShouldCancelAfterTaskExpiration___block_invoke;
  v4[3] = &unk_1E47B9850;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(dispatchQueue, v4);
}

uint64_t __48__SSRequest_setShouldCancelAfterTaskExpiration___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)shouldCancelAfterTaskExpiration
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
  v5[2] = __44__SSRequest_shouldCancelAfterTaskExpiration__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__SSRequest_shouldCancelAfterTaskExpiration__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

+ (BOOL)_allowMultipleCallbacks
{
  return 0;
}

- (void)_beginBackgroundTask
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSRequest__beginBackgroundTask__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

uint64_t __33__SSRequest__beginBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__beginBackgroundTask");
}

- (void)_endBackgroundTask
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SSRequest__endBackgroundTask__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SSRequest__endBackgroundTask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__endBackgroundTask");
}

- (void)_shutdownRequest
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SSRequest__shutdownRequest__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SSRequest__shutdownRequest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownRequestWithMessageID:", 0);
}

- (void)_startWithMessageID:(int64_t)a3 messageBlock:(id)a4
{
  id v6;
  void *v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint64_t *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v7 = (void *)-[SSRequest copyXPCEncoding](self, "copyXPCEncoding");
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke;
  block[3] = &unk_1E47BA040;
  block[4] = self;
  v14 = &v16;
  v9 = v6;
  v13 = v9;
  v15 = a3;
  v10 = v7;
  v12 = v10;
  dispatch_sync(dispatchQueue, block);
  if (*((_BYTE *)v17 + 24))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Request already started"));

  _Block_object_dispose(&v16, 8);
}

void __46__SSRequest__startWithMessageID_messageBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  char v3;
  SSXPCConnection *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SSXPCConnection *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  xpc_object_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[5] || v2[6])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v2, "__beginBackgroundTask");
    v3 = objc_msgSend((id)objc_opt_class(), "_allowMultipleCallbacks");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke_2;
    v19[3] = &unk_1E47B9FC8;
    objc_copyWeak(&v21, &location);
    v22 = v3;
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v7, "setDisconnectBlock:", v19);
    v9 = objc_alloc_init(SSXPCConnection);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 48);
    *(_QWORD *)(v10 + 48) = v9;

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke_4;
    v15[3] = &unk_1E47BA018;
    objc_copyWeak(&v17, &location);
    v18 = v3;
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v12, "setMessageBlock:", v15);
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v13, "0", *(_QWORD *)(a1 + 64));
    xpc_dictionary_set_value(v13, "1", *(xpc_object_t *)(a1 + 40));
    v14 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "createXPCEndpoint");
    xpc_dictionary_set_value(v13, "2", v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "sendMessage:", v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __46__SSRequest__startWithMessageID_messageBlock___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  _QWORD *v6;
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke_3;
    block[3] = &unk_1E47B9FA0;
    v6 = WeakRetained;
    v8 = *(_BYTE *)(a1 + 48);
    v7 = *(id *)(a1 + 32);
    dispatch_async(v4, block);

  }
}

void __46__SSRequest__startWithMessageID_messageBlock___block_invoke_3(uint64_t a1)
{
  unint64_t *v2;
  void *v4;
  uint64_t v5;

  v2 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 64);
  while (!__ldxr(v2))
  {
    if (!__stxr(1uLL, v2))
      goto LABEL_6;
  }
  __clrex();
  if (!*(_BYTE *)(a1 + 48))
    return;
LABEL_6:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "messageBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);

    if (v5)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __46__SSRequest__startWithMessageID_messageBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;
  id v10;
  char v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SSRequest__startWithMessageID_messageBlock___block_invoke_5;
    v7[3] = &unk_1E47B9FF0;
    v8 = WeakRetained;
    v11 = *(_BYTE *)(a1 + 48);
    v10 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __46__SSRequest__startWithMessageID_messageBlock___block_invoke_5(uint64_t result)
{
  uint64_t v1;
  unint64_t *v2;

  v1 = result;
  v2 = (unint64_t *)(*(_QWORD *)(result + 32) + 64);
  while (!__ldxr(v2))
  {
    if (!__stxr(1uLL, v2))
      goto LABEL_6;
  }
  __clrex();
  if (!*(_BYTE *)(result + 56))
    return result;
LABEL_6:
  if (*(_QWORD *)(result + 48))
  {
    result = *(_QWORD *)(result + 40);
    if (result)
    {
      result = MEMORY[0x1A85863E4]();
      if (result == MEMORY[0x1E0C812F8])
        return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
    }
  }
  return result;
}

- (void)__beginBackgroundTask
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BKSProcessAssertion *v16;
  BKSProcessAssertion *taskAssertion;
  void *v18;
  OS_dispatch_source *v19;
  OS_dispatch_source *backgroundTaskExpirationTimer;
  NSObject *v21;
  dispatch_time_t v22;
  NSObject *v23;
  id v24;
  int *v25;
  uint64_t v26;
  _QWORD handler[4];
  id v28;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!self->_taskAssertion)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.itunesstored.%@.%p"), objc_opt_class(), self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    objc_msgSend(v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      v6 &= 2u;
    if (v6)
    {
      v29 = 138412290;
      v30 = (id)objc_opt_class();
      v8 = v30;
      LODWORD(v26) = 12;
      v25 = &v29;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_13:

        v16 = (BKSProcessAssertion *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE308]), "initWithPID:flags:reason:name:withHandler:", getpid(), 5, 4, v3, 0);
        taskAssertion = self->_taskAssertion;
        self->_taskAssertion = v16;

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v29, v26);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_13;
  }
LABEL_14:
  -[SSRequest _cancelBackgroundTaskExpirationTimer](self, "_cancelBackgroundTaskExpirationTimer", v25);
  +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  backgroundTaskExpirationTimer = self->_backgroundTaskExpirationTimer;
  self->_backgroundTaskExpirationTimer = v19;

  v21 = self->_backgroundTaskExpirationTimer;
  v22 = dispatch_time(0, 25000000000);
  dispatch_source_set_timer(v21, v22, 0xFFFFFFFFFFFFFFFFLL, 0);
  v23 = self->_backgroundTaskExpirationTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __34__SSRequest___beginBackgroundTask__block_invoke;
  handler[3] = &unk_1E47B8790;
  v28 = v18;
  v24 = v18;
  dispatch_source_set_event_handler(v23, handler);
  dispatch_resume((dispatch_object_t)self->_backgroundTaskExpirationTimer);

}

void __34__SSRequest___beginBackgroundTask__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  LODWORD(v15) = 138412290;
  *(_QWORD *)((char *)&v15 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v15 + 4);
  LODWORD(v14) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v15, v14, v15);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:

  }
  objc_msgSend(v1, "_endBackgroundTask");

}

- (void)_cancelBackgroundTaskExpirationTimer
{
  NSObject *backgroundTaskExpirationTimer;
  OS_dispatch_source *v4;

  backgroundTaskExpirationTimer = self->_backgroundTaskExpirationTimer;
  if (backgroundTaskExpirationTimer)
  {
    dispatch_source_cancel(backgroundTaskExpirationTimer);
    v4 = self->_backgroundTaskExpirationTimer;
    self->_backgroundTaskExpirationTimer = 0;

  }
}

- (void)__endBackgroundTask
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BKSProcessAssertion *taskAssertion;
  __int128 *v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_taskAssertion)
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      v5 &= 2u;
    if (v5)
    {
      LODWORD(v18) = 138412290;
      *(_QWORD *)((char *)&v18 + 4) = objc_opt_class();
      v7 = *(id *)((char *)&v18 + 4);
      LODWORD(v17) = 12;
      v16 = &v18;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_13:

        -[BKSProcessAssertion invalidate](self->_taskAssertion, "invalidate");
        taskAssertion = self->_taskAssertion;
        self->_taskAssertion = 0;

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v18, v17, v18);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_13;
  }
LABEL_14:
  -[SSRequest _cancelBackgroundTaskExpirationTimer](self, "_cancelBackgroundTaskExpirationTimer", v16);
}

- (void)_expireBackgroundTask
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  _QWORD block[5];
  id v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  v21 = 138412290;
  v22 = (id)objc_opt_class();
  v7 = v22;
  LODWORD(v18) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v21, v18);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_11:

  }
  -[SSXPCConnection disconnectBlock](self->_requestConnection, "disconnectBlock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSRequest__expireBackgroundTask__block_invoke;
  block[3] = &unk_1E47B8A98;
  block[4] = self;
  v20 = v15;
  v17 = v15;
  dispatch_async(v16, block);

  -[SSRequest _cancelBackgroundTaskExpirationTimer](self, "_cancelBackgroundTaskExpirationTimer");
}

void __34__SSRequest__expireBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SSRequest__expireBackgroundTask__block_invoke_2;
  block[3] = &unk_1E47B8790;
  block[4] = v3;
  dispatch_async(v4, block);
}

uint64_t __34__SSRequest__expireBackgroundTask__block_invoke_2(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[16])
    v2 = 63;
  else
    v2 = 64;
  return objc_msgSend(v1, "_shutdownRequestWithMessageID:", v2);
}

- (void)_shutdownRequestWithMessageID:(int64_t)a3
{
  SSXPCConnection *requestConnection;
  xpc_object_t v6;
  SSXPCConnection *v7;
  SSXPCConnection *responseConnection;

  requestConnection = self->_requestConnection;
  if (requestConnection)
  {
    if (a3)
    {
      v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v6, "0", a3);
      -[SSXPCConnection sendMessage:](self->_requestConnection, "sendMessage:", v6);

      requestConnection = self->_requestConnection;
    }
    -[SSXPCConnection setDisconnectBlock:](requestConnection, "setDisconnectBlock:", 0);
    v7 = self->_requestConnection;
    self->_requestConnection = 0;

  }
  -[SSXPCConnection setMessageBlock:](self->_responseConnection, "setMessageBlock:", 0);
  responseConnection = self->_responseConnection;
  self->_responseConnection = 0;

  -[SSRequest __endBackgroundTask](self, "__endBackgroundTask");
}

- (SSRequestDelegate)delegate
{
  return (SSRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)usesTaskCompletionAssertions
{
  return self->_usesTaskCompletionAssertions;
}

- (void)setUsesTaskCompletionAssertions:(BOOL)a3
{
  self->_usesTaskCompletionAssertions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_backgroundTaskExpirationTimer, 0);
  objc_storeStrong((id *)&self->_responseConnection, 0);
  objc_storeStrong((id *)&self->_requestConnection, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
