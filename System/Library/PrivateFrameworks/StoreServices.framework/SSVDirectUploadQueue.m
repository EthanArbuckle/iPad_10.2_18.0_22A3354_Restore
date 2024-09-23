@implementation SSVDirectUploadQueue

- (SSVDirectUploadQueue)init
{
  return -[SSVDirectUploadQueue initWithUploadKinds:](self, "initWithUploadKinds:", 0);
}

- (SSVDirectUploadQueue)initWithUploadKinds:(id)a3
{
  id v4;
  SSVDirectUploadQueue *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *observerQueue;
  uint64_t v10;
  NSHashTable *observers;
  uint64_t v12;
  NSArray *uploadKinds;
  const char *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must have upload kinds"));
  v20.receiver = self;
  v20.super_class = (Class)SSVDirectUploadQueue;
  v5 = -[SSVDirectUploadQueue init](&v20, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.StoreServices.SSVDirectUploadQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.StoreServices.SSVDirectUploadQueue.observers", 0);
    observerQueue = v5->_observerQueue;
    v5->_observerQueue = (OS_dispatch_queue *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v10;

    v12 = objc_msgSend(v4, "copy");
    uploadKinds = v5->_uploadKinds;
    v5->_uploadKinds = (NSArray *)v12;

    objc_initWeak(&location, v5);
    v14 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(CFSTR("com.apple.iTunesStore.daemon.launched")), "UTF8String");
    v15 = v5->_accessQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__SSVDirectUploadQueue_initWithUploadKinds___block_invoke;
    v17[3] = &unk_1E47B9768;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch(v14, &v5->_daemonLaunchToken, v15, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __44__SSVDirectUploadQueue_initWithUploadKinds___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  uint64_t v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained[5], "count");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4, "_establishInboundConnection");
      v2 = v4;
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_daemonLaunchToken);
  v3.receiver = self;
  v3.super_class = (Class)SSVDirectUploadQueue;
  -[SSVDirectUploadQueue dealloc](&v3, sel_dealloc);
}

- (void)addUploadObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SSVDirectUploadQueue_addUploadObserver___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __42__SSVDirectUploadQueue_addUploadObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_establishInboundConnection");
}

- (void)cancelAllUploadsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *accessQueue;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v22 = 136446210;
      v23 = "-[SSVDirectUploadQueue cancelAllUploadsWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v19);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SSVDirectUploadQueue_cancelAllUploadsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v21 = v4;
  v18 = v4;
  dispatch_async(accessQueue, block);

}

void __60__SSVDirectUploadQueue_cancelAllUploadsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;

  v2 = SSXPCCreateMessageDictionary(154);
  xpc_dictionary_set_BOOL(v2, "2", 1);
  objc_msgSend(*(id *)(a1 + 32), "_sendSimpleMessage:completionBlock:", v2, *(_QWORD *)(a1 + 40));

}

- (void)cancelUploads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *accessQueue;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  SSVDirectUploadQueue *v26;
  id v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v28 = 136446210;
      v29 = "-[SSVDirectUploadQueue cancelUploads:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v28, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSVDirectUploadQueue_cancelUploads_completionBlock___block_invoke;
  block[3] = &unk_1E47B8740;
  v25 = v6;
  v26 = self;
  v27 = v7;
  v21 = v7;
  v22 = v6;
  dispatch_async(accessQueue, block);

}

void __54__SSVDirectUploadQueue_cancelUploads_completionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = SSXPCCreateMessageDictionary(154);
  v3 = xpc_array_create(0, 0);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "persistentIdentifier", (_QWORD)v9));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "1", v3);
  objc_msgSend(*(id *)(a1 + 40), "_sendSimpleMessage:completionBlock:", v2, *(_QWORD *)(a1 + 48));

}

- (void)getUploadsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *accessQueue;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v22 = 136446210;
      v23 = "-[SSVDirectUploadQueue getUploadsWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v19);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v21 = v4;
  v18 = v4;
  dispatch_async(accessQueue, block);

}

void __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id location;

  v2 = SSXPCCreateMessageDictionary(155);
  SSXPCDictionarySetCFObject(v2, "1", *(__CFString **)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_outboundConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E47BF978;
  objc_copyWeak(&v10, &location);
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "sendMessage:withReply:", v2, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  int isValidReply;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  uint64_t v24;
  id v25;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v25 = 0;
  isValidReply = _isValidReply(v3, &v25);
  v6 = v25;
  v7 = v6;
  if (isValidReply)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    xpc_dictionary_get_value(v3, "1");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithXPCEncoding:", v9);

    xpc_dictionary_get_value(v3, "2");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    v13 = SSXPCCreateNSArrayFromXPCEncodedArray(v11, v12);

    if (WeakRetained && v13)
    {
      v14 = WeakRetained[1];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_3;
      block[3] = &unk_1E47B8768;
      v13 = v13;
      v15 = *(_QWORD *)(a1 + 32);
      v23 = v13;
      v24 = v15;
      dispatch_async(v14, block);

    }
  }
  else
  {
    v13 = 0;
    v10 = v6;
  }
  v16 = *(void **)(a1 + 48);
  if (v16)
  {
    v17 = *(NSObject **)(a1 + 40);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_4;
    v18[3] = &unk_1E47B8608;
    v21 = v16;
    v19 = v13;
    v20 = v10;
    dispatch_async(v17, v18);

  }
}

void __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
        if (v9
          && (v10 = objc_msgSend(v9, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7), (_QWORD)v14),
              v10 != 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectAtIndex:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_adoptStatusFromUpload:", v8);
          objc_msgSend(v2, "addObject:", v11);

        }
        else
        {
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v14);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(void **)(v12 + 64);
  *(_QWORD *)(v12 + 64) = v2;

}

uint64_t __54__SSVDirectUploadQueue_getUploadsWithCompletionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)pauseAllUploadsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *accessQueue;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v22 = 136446210;
      v23 = "-[SSVDirectUploadQueue pauseAllUploadsWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v19);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SSVDirectUploadQueue_pauseAllUploadsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v21 = v4;
  v18 = v4;
  dispatch_async(accessQueue, block);

}

void __59__SSVDirectUploadQueue_pauseAllUploadsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;

  v2 = SSXPCCreateMessageDictionary(156);
  xpc_dictionary_set_BOOL(v2, "2", 1);
  objc_msgSend(*(id *)(a1 + 32), "_sendSimpleMessage:completionBlock:", v2, *(_QWORD *)(a1 + 40));

}

- (void)pauseUploads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *accessQueue;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  SSVDirectUploadQueue *v26;
  id v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v28 = 136446210;
      v29 = "-[SSVDirectUploadQueue pauseUploads:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v28, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SSVDirectUploadQueue_pauseUploads_completionBlock___block_invoke;
  block[3] = &unk_1E47B8740;
  v25 = v6;
  v26 = self;
  v27 = v7;
  v21 = v7;
  v22 = v6;
  dispatch_async(accessQueue, block);

}

void __53__SSVDirectUploadQueue_pauseUploads_completionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = SSXPCCreateMessageDictionary(156);
  v3 = xpc_array_create(0, 0);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "persistentIdentifier", (_QWORD)v9));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "1", v3);
  objc_msgSend(*(id *)(a1 + 40), "_sendSimpleMessage:completionBlock:", v2, *(_QWORD *)(a1 + 48));

}

- (void)removeUploadObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SSVDirectUploadQueue_removeUploadObserver___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __45__SSVDirectUploadQueue_removeUploadObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)resumeAllUploadsWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *accessQueue;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v22 = 136446210;
      v23 = "-[SSVDirectUploadQueue resumeAllUploadsWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v22, v19);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SSVDirectUploadQueue_resumeAllUploadsWithCompletionBlock___block_invoke;
  block[3] = &unk_1E47B8AC0;
  block[4] = self;
  v21 = v4;
  v18 = v4;
  dispatch_async(accessQueue, block);

}

void __60__SSVDirectUploadQueue_resumeAllUploadsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;

  v2 = SSXPCCreateMessageDictionary(158);
  xpc_dictionary_set_BOOL(v2, "2", 1);
  objc_msgSend(*(id *)(a1 + 32), "_sendSimpleMessage:completionBlock:", v2, *(_QWORD *)(a1 + 40));

}

- (void)resumeUploads:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *accessQueue;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD block[4];
  id v25;
  SSVDirectUploadQueue *v26;
  id v27;
  int v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v28 = 136446210;
      v29 = "-[SSVDirectUploadQueue resumeUploads:completionBlock:]";
      LODWORD(v23) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v28, v23);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSVDirectUploadQueue_resumeUploads_completionBlock___block_invoke;
  block[3] = &unk_1E47B8740;
  v25 = v6;
  v26 = self;
  v27 = v7;
  v21 = v7;
  v22 = v6;
  dispatch_async(accessQueue, block);

}

void __54__SSVDirectUploadQueue_resumeUploads_completionBlock___block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = SSXPCCreateMessageDictionary(158);
  v3 = xpc_array_create(0, 0);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "persistentIdentifier", (_QWORD)v9));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  xpc_dictionary_set_value(v2, "1", v3);
  objc_msgSend(*(id *)(a1 + 40), "_sendSimpleMessage:completionBlock:", v2, *(_QWORD *)(a1 + 48));

}

- (NSArray)uploadKinds
{
  return (NSArray *)(id)-[NSArray copy](self->_uploadKinds, "copy");
}

- (void)_establishInboundConnection
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SSXPCConnection *v16;
  SSXPCConnection *inboundConnection;
  OS_dispatch_queue *v18;
  SSXPCConnection *v19;
  OS_dispatch_queue *v20;
  xpc_object_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  OS_dispatch_queue *v26;
  id v27;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
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
      LODWORD(location[0]) = 136446210;
      *(id *)((char *)location + 4) = "-[SSVDirectUploadQueue _establishInboundConnection]";
      LODWORD(v24) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, location, v24);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);

      }
    }
    else
    {

    }
  }
  if (!self->_inboundConnection)
  {
    if (-[NSHashTable count](self->_observers, "count"))
    {
      v16 = objc_alloc_init(SSXPCConnection);
      inboundConnection = self->_inboundConnection;
      self->_inboundConnection = v16;

      v18 = self->_accessQueue;
      objc_initWeak(location, self);
      v19 = self->_inboundConnection;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __51__SSVDirectUploadQueue__establishInboundConnection__block_invoke;
      v25[3] = &unk_1E47BF9A0;
      v20 = v18;
      v26 = v20;
      objc_copyWeak(&v27, location);
      -[SSXPCConnection setMessageBlock:](v19, "setMessageBlock:", v25);
      v21 = SSXPCCreateMessageDictionary(157);
      SSXPCDictionarySetCFObject(v21, "1", (__CFString *)self->_uploadKinds);
      v22 = -[SSXPCConnection createXPCEndpoint](self->_inboundConnection, "createXPCEndpoint");
      xpc_dictionary_set_value(v21, "2", v22);
      -[SSVDirectUploadQueue _outboundConnection](self, "_outboundConnection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sendMessage:", v21);

      objc_destroyWeak(&v27);
      objc_destroyWeak(location);

    }
  }
}

void __51__SSVDirectUploadQueue__establishInboundConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSVDirectUploadQueue__establishInboundConnection__block_invoke_2;
  block[3] = &unk_1E47BAB90;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __51__SSVDirectUploadQueue__establishInboundConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleInboundMessage:connection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleAddUploadsMessage:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *v16;
  NSMutableArray *uploads;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  SSVDirectUploadQueue *v22;
  _QWORD applier[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = self->_uploads;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v11, "persistentIdentifier"));
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  xpc_dictionary_get_value(v4, "2");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = MEMORY[0x1E0C812C8];
  if (v13 && MEMORY[0x1A85863E4](v13) == v15)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __49__SSVDirectUploadQueue__handleAddUploadsMessage___block_invoke;
    applier[3] = &unk_1E47B8B38;
    v24 = v5;
    xpc_array_apply(v14, applier);

  }
  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  uploads = self->_uploads;
  self->_uploads = v16;

  xpc_dictionary_get_value(v4, "1");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18 && MEMORY[0x1A85863E4](v18) == v15)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__SSVDirectUploadQueue__handleAddUploadsMessage___block_invoke_2;
    v20[3] = &unk_1E47BD008;
    v21 = v5;
    v22 = self;
    xpc_array_apply(v19, v20);

  }
  if (-[NSHashTable count](self->_observers, "count"))
    -[SSVDirectUploadQueue _sendObserversUploadsDidChange](self, "_sendObserversUploadsDidChange");

}

uint64_t __49__SSVDirectUploadQueue__handleAddUploadsMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SSVDirectUpload *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[SSVDirectUpload initWithXPCEncoding:]([SSVDirectUpload alloc], "initWithXPCEncoding:", v4);

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", -[SSVDirectUpload persistentIdentifier](v5, "persistentIdentifier"));
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "_adoptStatusFromUpload:", v5);
    else
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

  }
  return 1;
}

uint64_t __49__SSVDirectUploadQueue__handleAddUploadsMessage___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C81328])
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", xpc_int64_get_value(v4));
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "addObject:", v6);

  }
  return 1;
}

- (void)_handleChangeUploadsMessage:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *observerQueue;
  id v10;
  _QWORD block[4];
  id v12;
  SSVDirectUploadQueue *v13;
  id v14;
  _QWORD applier[5];
  id v16;

  v4 = a3;
  if (-[NSMutableArray count](self->_uploads, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    xpc_dictionary_get_value(v4, "1");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6 && MEMORY[0x1A85863E4](v6) == MEMORY[0x1E0C812C8])
    {
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __52__SSVDirectUploadQueue__handleChangeUploadsMessage___block_invoke;
      applier[3] = &unk_1E47BD008;
      applier[4] = self;
      v16 = v5;
      xpc_array_apply(v7, applier);

    }
    if (objc_msgSend(v5, "count") && -[NSHashTable count](self->_observers, "count"))
    {
      v8 = (void *)-[NSHashTable copy](self->_observers, "copy");
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__SSVDirectUploadQueue__handleChangeUploadsMessage___block_invoke_2;
      block[3] = &unk_1E47B87B8;
      v12 = v8;
      v13 = self;
      v14 = v5;
      v10 = v8;
      dispatch_async(observerQueue, block);

    }
  }

}

uint64_t __52__SSVDirectUploadQueue__handleChangeUploadsMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SSVDirectUpload *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[SSVDirectUpload initWithXPCEncoding:]([SSVDirectUpload alloc], "initWithXPCEncoding:", v4);

  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "indexOfObject:", v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_adoptStatusFromUpload:", v5);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

  }
  return 1;
}

void __52__SSVDirectUploadQueue__handleChangeUploadsMessage___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "uploadQueue:statusDidChangeForUploads:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_handleInboundMessage:(id)a3 connection:(id)a4
{
  int64_t int64;
  int64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  int64 = xpc_dictionary_get_int64(v8, "0");
  v6 = int64;
  if (int64 > 1013)
  {
    if (int64 == 1014)
    {
      -[SSVDirectUploadQueue _handleChangeUploadsMessage:](self, "_handleChangeUploadsMessage:", v8);
      goto LABEL_10;
    }
    if (int64 == 1015)
    {
      -[SSVDirectUploadQueue _handleRemoveUploadsMessage:](self, "_handleRemoveUploadsMessage:", v8);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (int64)
  {
    if (int64 == 1013)
    {
      -[SSVDirectUploadQueue _handleAddUploadsMessage:](self, "_handleAddUploadsMessage:", v8);
      goto LABEL_10;
    }
LABEL_8:
    v7 = objc_opt_class();
    NSLog(CFSTR("%@: Unrecognized message: %lld"), v7, v6);
  }
LABEL_10:

}

- (void)_handleRemoveUploadsMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  xpc_dictionary_get_value(v4, "1");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && MEMORY[0x1A85863E4](v5) == MEMORY[0x1E0C812C8])
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SSVDirectUploadQueue__handleRemoveUploadsMessage___block_invoke;
    v7[3] = &unk_1E47BF9E8;
    v7[4] = self;
    v7[5] = &v8;
    xpc_array_apply(v6, v7);
  }
  if (*((_BYTE *)v9 + 24) && -[NSHashTable count](self->_observers, "count"))
    -[SSVDirectUploadQueue _sendObserversUploadsDidChange](self, "_sendObserversUploadsDidChange");

  _Block_object_dispose(&v8, 8);
}

uint64_t __52__SSVDirectUploadQueue__handleRemoveUploadsMessage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int64_t value;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];

  v4 = a3;
  if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C81328])
  {
    value = xpc_int64_get_value(v4);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__SSVDirectUploadQueue__handleRemoveUploadsMessage___block_invoke_2;
    v9[3] = &__block_descriptor_40_e32_B32__0__SSVDirectUpload_8Q16_B24l;
    v9[4] = value;
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v9);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectAtIndex:", v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

  return 1;
}

BOOL __52__SSVDirectUploadQueue__handleRemoveUploadsMessage___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "persistentIdentifier") == *(_QWORD *)(a1 + 32);
}

- (id)_outboundConnection
{
  SSXPCConnection *outboundConnection;
  SSXPCConnection *v4;
  SSXPCConnection *v5;

  outboundConnection = self->_outboundConnection;
  if (!outboundConnection)
  {
    v4 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v5 = self->_outboundConnection;
    self->_outboundConnection = v4;

    outboundConnection = self->_outboundConnection;
  }
  return outboundConnection;
}

- (void)_sendObserversUploadsDidChange
{
  void *v3;
  void *v4;
  NSObject *observerQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  SSVDirectUploadQueue *v10;
  id v11;

  v3 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v4 = (void *)-[NSMutableArray copy](self->_uploads, "copy");
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SSVDirectUploadQueue__sendObserversUploadsDidChange__block_invoke;
  block[3] = &unk_1E47B87B8;
  v9 = v3;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(observerQueue, block);

}

void __54__SSVDirectUploadQueue__sendObserversUploadsDidChange__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "uploadQueue:uploadsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_sendSimpleMessage:(id)a3 completionBlock:(id)a4
{
  id v6;
  OS_dispatch_queue *v7;
  id v8;
  void *v9;
  OS_dispatch_queue *v10;
  id v11;
  _QWORD v12[4];
  OS_dispatch_queue *v13;
  id v14;

  v6 = a4;
  v7 = self->_observerQueue;
  v8 = a3;
  -[SSVDirectUploadQueue _outboundConnection](self, "_outboundConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__SSVDirectUploadQueue__sendSimpleMessage_completionBlock___block_invoke;
  v12[3] = &unk_1E47B8630;
  v13 = v7;
  v14 = v6;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "sendMessage:withReply:", v8, v12);

}

void __59__SSVDirectUploadQueue__sendSimpleMessage_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  char v15;
  id v16;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 40))
  {
    v16 = 0;
    LODWORD(v5) = _isValidReply(v3, &v16);
    v6 = v16;
    if ((_DWORD)v5)
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      xpc_dictionary_get_value(v4, "1");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "initWithXPCEncoding:", v7);

      LOBYTE(v5) = xpc_dictionary_get_BOOL(v4, "2");
      v6 = (id)v8;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__SSVDirectUploadQueue__sendSimpleMessage_completionBlock___block_invoke_2;
    v12[3] = &unk_1E47BD240;
    v9 = *(NSObject **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v15 = (char)v5;
    v13 = v6;
    v14 = v10;
    v11 = v6;
    dispatch_async(v9, v12);

  }
}

uint64_t __59__SSVDirectUploadQueue__sendSimpleMessage_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploads, 0);
  objc_storeStrong((id *)&self->_uploadKinds, 0);
  objc_storeStrong((id *)&self->_outboundConnection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_inboundConnection, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
