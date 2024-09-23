@implementation SSPreorderManager

- (SSPreorderManager)init
{
  return -[SSPreorderManager initWithItemKinds:](self, "initWithItemKinds:", 0);
}

- (SSPreorderManager)initWithItemKinds:(id)a3
{
  SSPreorderManager *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSPreorderManager;
  v4 = -[SSPreorderManager init](&v7, sel_init);
  if (v4)
  {
    v4->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSPreorderManager", 0);
    v4->_observerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.StoreServices.SSPreorderManager.observerQueue", 0);
    v4->_itemKinds = (NSArray *)objc_msgSend(a3, "copy");
    v4->_observers = CFArrayCreateMutable(0, 0, 0);
    -[SSPreorderManager _connectAsObserver](v4, "_connectAsObserver");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)__DaemonLaunchNotification_1, CFSTR("com.apple.iTunesStore.daemon.launched"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }
  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.iTunesStore.daemon.launched"), 0);
  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  dispatch_release((dispatch_object_t)self->_observerQueue);
  -[SSXPCConnection setMessageBlock:](self->_observerConnection, "setMessageBlock:", 0);

  CFRelease(self->_observers);
  v4.receiver = self;
  v4.super_class = (Class)SSPreorderManager;
  -[SSPreorderManager dealloc](&v4, sel_dealloc);
}

+ (id)bookStoreItemKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("eBook"), 0);
}

+ (id)musicStoreItemKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("album"), CFSTR("audiobook"), CFSTR("mix"), CFSTR("movie"), CFSTR("movie"), CFSTR("music-video"), CFSTR("ringtone"), CFSTR("song"), CFSTR("tone"), CFSTR("tv-episode"), CFSTR("tv-season"), CFSTR("wemix"), 0);
}

- (void)addObserver:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SSPreorderManager_addObserver___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void __33__SSPreorderManager_addObserver___block_invoke(uint64_t a1)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 48), *(const void **)(a1 + 40));
}

- (void)cancelPreorders:(id)a3 withCompletionBlock:(id)a4
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
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  SSXPCConnection *connection;
  int *v27;
  uint64_t v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  int v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
      v35 = 136446210;
      v36 = "-[SSPreorderManager cancelPreorders:withCompletionBlock:]";
      LODWORD(v28) = 12;
      v27 = &v35;
      v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v35, v28);
        free(v12);
        SSFileLog(v7, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 35);
  v21 = xpc_array_create(0, 0);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(a3);
        xpc_array_set_int64(v21, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "persistentIdentifier", v27));
      }
      v23 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v23);
  }
  xpc_dictionary_set_value(v20, "1", v21);
  xpc_release(v21);
  connection = self->_connection;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __57__SSPreorderManager_cancelPreorders_withCompletionBlock___block_invoke;
  v29[3] = &unk_1E47B8FA0;
  v29[4] = a4;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v20, v29);
  xpc_release(v20);
}

void __57__SSPreorderManager_cancelPreorders_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *global_queue;
  _QWORD v7[6];

  if (a2 && MEMORY[0x1A85863E4](a2) == MEMORY[0x1E0C812F8] && xpc_dictionary_get_BOOL(a2, "0"))
    v4 = 0;
  else
    v4 = SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SSPreorderManager_cancelPreorders_withCompletionBlock___block_invoke_2;
    v7[3] = &unk_1E47B8EB8;
    v7[4] = v4;
    v7[5] = v5;
    dispatch_async(global_queue, v7);
  }
}

uint64_t __57__SSPreorderManager_cancelPreorders_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSArray)itemKinds
{
  return self->_itemKinds;
}

- (NSArray)preorders
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
  NSObject *dispatchQueue;
  NSArray *v17;
  uint64_t v19;
  _QWORD block[6];
  __int128 v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      LODWORD(v21) = 136446210;
      *(_QWORD *)((char *)&v21 + 4) = "-[SSPreorderManager preorders]";
      LODWORD(v19) = 12;
      v7 = _os_log_send_and_compose_impl();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v21, v19);
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, v9);
      }
    }
  }
  *(_QWORD *)&v21 = 0;
  *((_QWORD *)&v21 + 1) = &v21;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__36;
  v24 = __Block_byref_object_dispose__36;
  v25 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SSPreorderManager_preorders__block_invoke;
  block[3] = &unk_1E47BBA20;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(dispatchQueue, block);
  v17 = (NSArray *)*(id *)(*((_QWORD *)&v21 + 1) + 40);
  _Block_object_dispose(&v21, 8);
  return v17;
}

id __30__SSPreorderManager_preorders__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  xpc_object_t v4;
  NSObject *v5;
  void *v6;
  id result;
  _QWORD v8[6];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "0", 34);
    v5 = dispatch_semaphore_create(0);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__SSPreorderManager_preorders__block_invoke_2;
    v8[3] = &unk_1E47BD580;
    v8[4] = v3;
    v8[5] = v5;
    objc_msgSend(v6, "sendMessage:withReply:", v4, v8);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
    xpc_release(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = objc_msgSend(v3, "copy");

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  result = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

intptr_t __30__SSPreorderManager_preorders__block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  int64_t count;
  int64_t v6;
  size_t i;
  SSPreorder *v8;

  value = xpc_dictionary_get_value(xdict, "0");
  if (value)
  {
    v4 = value;
    if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812C8])
    {
      count = xpc_array_get_count(v4);
      if (count >= 1)
      {
        v6 = count;
        for (i = 0; i != v6; ++i)
        {
          v8 = -[SSPreorder initWithXPCEncoding:]([SSPreorder alloc], "initWithXPCEncoding:", xpc_array_get_value(v4, i));
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

        }
      }
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)reloadFromServer
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
      v19 = "-[SSPreorderManager reloadFromServer]";
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
  xpc_dictionary_set_int64(v16, "0", 36);
  -[SSXPCConnection sendMessage:](self->_connection, "sendMessage:", v16);
  xpc_release(v16);
}

- (void)removeObserver:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SSPreorderManager_removeObserver___block_invoke;
  v4[3] = &unk_1E47B8BB8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dispatchQueue, v4);
}

void __36__SSPreorderManager_removeObserver___block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex FirstIndexOfValue;
  CFRange v4;

  v2 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 48);
  v4.length = CFArrayGetCount(v2);
  v4.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v4, *(const void **)(a1 + 40));
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 48), FirstIndexOfValue);
}

- (void)_connectAsObserver
{
  SSXPCConnection *v3;
  _QWORD v4[6];
  _QWORD v5[6];

  self->_connection = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = __Block_byref_object_copy__36;
  v5[4] = __Block_byref_object_dispose__36;
  v5[5] = self;
  v3 = objc_alloc_init(SSXPCConnection);
  self->_observerConnection = v3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SSPreorderManager__connectAsObserver__block_invoke;
  v4[3] = &unk_1E47BD5A8;
  v4[4] = self;
  v4[5] = v5;
  -[SSXPCConnection setMessageBlock:](v3, "setMessageBlock:", v4);
  -[SSPreorderManager _registerAsObserver](self, "_registerAsObserver");
  _Block_object_dispose(v5, 8);
}

void __39__SSPreorderManager__connectAsObserver__block_invoke(uint64_t a1, xpc_object_t object, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  _QWORD block[7];

  xpc_retain(object);
  xpc_retain(a3);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SSPreorderManager__connectAsObserver__block_invoke_2;
  block[3] = &unk_1E47BA7E8;
  block[5] = a3;
  block[6] = v6;
  block[4] = object;
  dispatch_async(v7, block);
}

void __39__SSPreorderManager__connectAsObserver__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "_handleMessage:fromServerConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  int64_t int64;
  int64_t v8;
  xpc_object_t reply;

  int64 = xpc_dictionary_get_int64(a3, "0");
  if (int64)
  {
    v8 = int64;
    reply = xpc_dictionary_create_reply(a3);
    xpc_connection_send_message((xpc_connection_t)a4, reply);
    xpc_release(reply);
    if (v8 == 1007)
    {

      self->_preorders = 0;
      -[SSPreorderManager _sendMessageToObservers:](self, "_sendMessageToObservers:", sel_preorderManagerPreordersDidChange_);
    }
  }
}

- (void)_registerAsObserver
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
  id v16;
  void *v17;
  xpc_object_t v18;
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
      v22 = "-[SSPreorderManager _registerAsObserver]";
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
  v16 = -[SSXPCConnection createXPCEndpoint](self->_observerConnection, "createXPCEndpoint", v19);
  if (v16)
  {
    v17 = v16;
    v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v18, "0", 33);
    SSXPCDictionarySetCFObject(v18, "1", (__CFString *)self->_itemKinds);
    xpc_dictionary_set_value(v18, "2", v17);
    -[SSXPCConnection sendMessage:](self->_connection, "sendMessage:", v18);
    xpc_release(v18);
    xpc_release(v17);
  }
}

- (void)_sendMessageToObservers:(SEL)a3
{
  id v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  NSObject *observerQueue;
  _QWORD block[7];

  if (self->_observers)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    Count = CFArrayGetCount(self->_observers);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v5, "addObject:", CFArrayGetValueAtIndex(self->_observers, i));
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__SSPreorderManager__sendMessageToObservers___block_invoke;
      block[3] = &unk_1E47BBA98;
      block[4] = self;
      block[5] = v5;
      block[6] = a3;
      dispatch_async(observerQueue, block);
    }

  }
}

uint64_t __45__SSPreorderManager__sendMessageToObservers___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(a1 + 40);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

@end
