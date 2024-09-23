@implementation SSDownloadManager

void __39__SSDownloadManager__connectAsObserver__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_handleMessage:fromServerConnection:", v6, v5);

}

- (void)_handleMessage:(id)a3 fromServerConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  SSDownloadManager *v14;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SSDownloadManager__handleMessage_fromServerConnection___block_invoke;
  block[3] = &unk_1E47B87B8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

uint64_t __33__SSDownloadManager_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __44__SSDownloadManager_getDownloadsUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyDownloads");
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SSDownloadManager_getDownloadsUsingBlock___block_invoke_2;
  v6[3] = &unk_1E47B8A98;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

void __30__SSDownloadManager_downloads__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyDownloads");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_copyDownloads
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
  id v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  NSMutableSet *removedDownloads;
  void *v20;
  NSArray *v21;
  NSArray *v22;
  NSArray *downloads;
  int *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      v27 = 136446210;
      v28 = "-[SSDownloadManager _copyDownloads]";
      LODWORD(v26) = 12;
      v25 = &v27;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v27, v26);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  if (!self->_downloadsChanged)
  {
    downloads = self->_downloads;
    if (downloads)
      return downloads;
  }
  v15 = -[SSDownloadManager _copyDownloadsForMessage:downloadIDs:](self, "_copyDownloadsForMessage:downloadIDs:", 14, 0, v25);
  v16 = v15;
  if (self->_removedDownloads)
  {
    v17 = objc_msgSend(v15, "count");
    if (v17 >= 1)
    {
      v18 = v17 + 1;
      do
      {
        removedDownloads = self->_removedDownloads;
        objc_msgSend(v16, "objectAtIndex:", v18 - 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(removedDownloads) = -[NSMutableSet containsObject:](removedDownloads, "containsObject:", v20);

        if ((_DWORD)removedDownloads)
          objc_msgSend(v16, "removeObjectAtIndex:", v18 - 2);
        --v18;
      }
      while (v18 > 1);
    }
  }
  if (self->_downloadsChanged || !-[NSArray isEqualToArray:](self->_downloads, "isEqualToArray:", v16))
  {
    v21 = (NSArray *)objc_msgSend(v16, "copy");
    v22 = self->_downloads;
    self->_downloads = v21;

  }
  self->_downloadsChanged = 0;

  return self->_downloads;
}

- (id)_copyDownloadsForMessage:(int64_t)a3 downloadIDs:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  dispatch_semaphore_t v9;
  SSXPCConnection *connection;
  id v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  id v14;
  _QWORD v16[5];
  id v17;
  dispatch_semaphore_t v18;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, "0", a3);
  xpc_dictionary_set_BOOL(v8, "1", -[SSDownloadManagerOptions shouldFilterExternalOriginatedDownloads](self->_options, "shouldFilterExternalOriginatedDownloads"));
  if (v6)
    xpc_dictionary_set_value(v8, "2", v6);
  v9 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__SSDownloadManager__copyDownloadsForMessage_downloadIDs___block_invoke;
  v16[3] = &unk_1E47BD030;
  v16[4] = self;
  v11 = v7;
  v17 = v11;
  v18 = v9;
  v12 = v9;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v8, v16);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v13 = v18;
  v14 = v11;

  return v14;
}

- (void)_sendObserverConnection
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
  xpc_object_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
    goto LABEL_16;
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
  if (!v7)
    goto LABEL_14;
  v20 = 136446210;
  v21 = "-[SSDownloadManager _sendObserverConnection]";
  LODWORD(v19) = 12;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v20, v19);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
LABEL_14:

  }
LABEL_16:
  if (self->_observerConnection)
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v15, "0", 18);
    -[SSDownloadManagerOptions downloadKinds](self->_options, "downloadKinds");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SSXPCDictionarySetObject(v15, "1", v16);

    v17 = -[SSXPCConnection createXPCEndpoint](self->_observerConnection, "createXPCEndpoint");
    xpc_dictionary_set_value(v15, "2", v17);
    v18 = -[SSDownloadManager _newOptionsDictionary](self, "_newOptionsDictionary");
    xpc_dictionary_set_value(v15, "3", v18);
    -[SSXPCConnection sendMessage:](self->_connection, "sendMessage:", v15);

  }
}

- (SSDownloadManager)initWithManagerOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  __objc2_class *v14;
  void *v15;
  int v16;
  SSDownloadManager *v17;

  v4 = a3;
  objc_msgSend(v4, "downloadKinds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must have download kinds"));
    self = 0;
    goto LABEL_17;
  }
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    objc_msgSend(v4, "downloadKinds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = SSDownloadKindsContainsBookToShimKind(v10);

    objc_msgSend(v4, "downloadKinds");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", CFSTR("software"));

    if (!v11 || (v13 & 1) != 0)
    {
      if (v11)
      {
        v14 = SSDownloadManagerBookShim;
      }
      else
      {
        objc_msgSend(v4, "downloadKinds");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsObject:", CFSTR("software"));

        if (!v16)
        {
LABEL_16:
          self = -[SSDownloadManager _initSSDownloadManagerWithOptions:](self, "_initSSDownloadManagerWithOptions:", v4);
          goto LABEL_17;
        }
        v14 = SSDownloadManagerAppShim;
      }
    }
    else
    {
      v14 = SSDownloadManagerBookShim2;
    }
    v17 = (SSDownloadManager *)objc_msgSend([v14 alloc], "initWithManagerOptions:", v4);

    self = v17;
    goto LABEL_17;
  }
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
    goto LABEL_16;
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
    goto LABEL_16;
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Subclassing of SSDownloadManager is not supported"));
LABEL_17:

  return self;
}

- (id)_newOptionsDictionary
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[SSDownloadManagerOptions persistenceIdentifier](self->_options, "persistenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "0", v4);

  xpc_dictionary_set_BOOL(v3, "1", -[SSDownloadManagerOptions shouldFilterExternalOriginatedDownloads](self->_options, "shouldFilterExternalOriginatedDownloads"));
  -[SSDownloadManagerOptions prefetchedDownloadProperties](self->_options, "prefetchedDownloadProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "2", v5);

  -[SSDownloadManagerOptions prefetchedDownloadExternalProperties](self->_options, "prefetchedDownloadExternalProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "3", v6);

  return v3;
}

- (void)_connectAsObserver
{
  SSXPCConnection *v3;
  SSXPCConnection *connection;
  void *v5;
  SSXPCConnection *v6;
  SSXPCConnection *observerConnection;
  SSXPCConnection *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  connection = self->_connection;
  self->_connection = v3;

  +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(SSXPCConnection);
  observerConnection = self->_observerConnection;
  self->_observerConnection = v6;

  v8 = self->_observerConnection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__SSDownloadManager__connectAsObserver__block_invoke;
  v10[3] = &unk_1E47BCFB8;
  v11 = v5;
  v9 = v5;
  -[SSXPCConnection setMessageBlock:](v8, "setMessageBlock:", v10);
  -[SSDownloadManager _sendObserverConnection](self, "_sendObserverConnection");

}

- (id)_initSSDownloadManagerWithOptions:(id)a3
{
  id v4;
  SSDownloadManager *v5;
  uint64_t v6;
  SSDownloadManagerOptions *options;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *backgroundQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *observerQueue;
  void *v14;
  const char *v15;
  NSObject *v16;
  id v17;
  _QWORD handler[4];
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SSDownloadManager;
  v5 = -[SSDownloadManager init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (SSDownloadManagerOptions *)v6;

    v8 = dispatch_queue_create("com.apple.storeservices.SSDownloadManager.access", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.storeservices.SSDownloadManager.background", 0);
    backgroundQueue = v5->_backgroundQueue;
    v5->_backgroundQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.storeservices.SSDownloadManager.observer", 0);
    observerQueue = v5->_observerQueue;
    v5->_observerQueue = (OS_dispatch_queue *)v12;

    +[SSWeakReference weakReferenceWithObject:](SSWeakReference, "weakReferenceWithObject:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (const char *)-[__CFString UTF8String](objc_retainAutorelease(CFSTR("com.apple.iTunesStore.daemon.launched")), "UTF8String");
    v16 = v5->_accessQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __55__SSDownloadManager__initSSDownloadManagerWithOptions___block_invoke;
    handler[3] = &unk_1E47BAE80;
    v20 = v14;
    v17 = v14;
    notify_register_dispatch(v15, &v5->_launchNotificationToken, v16, handler);
    -[SSDownloadManager _connectAsObserver](v5, "_connectAsObserver");

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_launchNotificationToken);
  -[SSXPCConnection setDisconnectBlock:](self->_connection, "setDisconnectBlock:", 0);
  -[SSXPCConnection setMessageBlock:](self->_observerConnection, "setMessageBlock:", 0);
  -[NSArray makeObjectsPerformSelector:withObject:](self->_activeDownloads, "makeObjectsPerformSelector:withObject:", sel__becomeManagedOnConnection_, 0);
  -[NSArray makeObjectsPerformSelector:withObject:](self->_downloads, "makeObjectsPerformSelector:withObject:", sel__becomeManagedOnConnection_, 0);
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadManager;
  -[SSDownloadManager dealloc](&v3, sel_dealloc);
}

uint64_t __44__SSDownloadManager_getDownloadsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedDownloads, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observerConnection, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __57__SSDownloadManager__handleMessage_fromServerConnection___block_invoke(uint64_t a1)
{
  int64_t int64;
  int64_t v3;
  id reply;

  int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "0");
  if (int64)
  {
    v3 = int64;
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
    switch(v3)
    {
      case 1003:
        objc_msgSend(*(id *)(a1 + 48), "_handleDownloadsChanged:", *(_QWORD *)(a1 + 32));
        break;
      case 1004:
        objc_msgSend(*(id *)(a1 + 48), "_handleDownloadStatesChanged:", *(_QWORD *)(a1 + 32));
        break;
      case 1006:
        objc_msgSend(*(id *)(a1 + 48), "_handleDownloadKindsUsingNetworkChanged:", *(_QWORD *)(a1 + 32));
        break;
      case 1008:
        objc_msgSend(*(id *)(a1 + 48), "_handleDownloadsRemoved:", *(_QWORD *)(a1 + 32));
        break;
      default:
        break;
    }

  }
}

+ (id)IPodDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("book"), CFSTR("coached-audio"), CFSTR("document"), CFSTR("feature-movie"), CFSTR("song"), CFSTR("music-video"), CFSTR("podcast"), CFSTR("ringtone"), CFSTR("tv-episode"), CFSTR("tone"), CFSTR("videoPodcast"), 0);
}

+ (id)ITunesDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("book"), CFSTR("feature-movie"), CFSTR("song"), CFSTR("music-video"), CFSTR("ringtone"), CFSTR("tv-episode"), CFSTR("tone"), 0);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSDownloadManager_addObserver___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

void __58__SSDownloadManager__copyDownloadsForMessage_downloadIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  xpc_object_t xdict;
  _QWORD applier[5];
  id v8;

  xdict = a2;
  if (xdict && MEMORY[0x1A85863E4](xdict) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(xdict, "0");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812C8])
    {
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __58__SSDownloadManager__copyDownloadsForMessage_downloadIDs___block_invoke_2;
      applier[3] = &unk_1E47BD008;
      v5 = *(void **)(a1 + 40);
      applier[4] = *(_QWORD *)(a1 + 32);
      v8 = v5;
      xpc_array_apply(v4, applier);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)getDownloadsUsingBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("nil block"));
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SSDownloadManager_getDownloadsUsingBlock___block_invoke;
  v7[3] = &unk_1E47B8AC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (NSArray)downloads
{
  NSObject *accessQueue;
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
  v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__SSDownloadManager_downloads__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __55__SSDownloadManager__initSSDownloadManagerWithOptions___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_connectAfterDaemonLaunch");

}

- (SSDownloadManager)initWithDownloadKinds:(id)a3
{
  id v4;
  SSDownloadManagerOptions *v5;
  SSDownloadManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(SSDownloadManagerOptions);
  -[SSDownloadManagerOptions setDownloadKinds:](v5, "setDownloadKinds:", v4);

  v6 = -[SSDownloadManager initWithManagerOptions:](self, "initWithManagerOptions:", v5);
  return v6;
}

+ (void)reconnectToLSApplicationWorkspace
{
  xpc_object_t v2;
  SSXPCConnection *v3;

  v3 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v2 = SSXPCCreateMessageDictionary(120);
  -[SSXPCConnection sendMessage:](v3, "sendMessage:", v2);

}

+ (void)removePersistenceIdentifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SSXPCConnection *v16;
  xpc_object_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
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
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      v8 = v6;
    else
      v8 = v6 & 2;
    if (v8)
    {
      v19 = 136446210;
      v20 = "+[SSDownloadManager removePersistenceIdentifier:]";
      LODWORD(v18) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v19, v18);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_15;
  }
LABEL_16:
  v16 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v17, "0", 6);
  SSXPCDictionarySetObject(v17, "1", v3);

  -[SSXPCConnection sendMessage:](v16, "sendMessage:", v17);
}

+ (void)setDownloadHandler:(id)a3
{
  id v5;

  v5 = a3;
  pthread_mutex_lock(&__GlobalHandlerLock);
  if ((id)__GlobalHandler != v5)
  {
    objc_storeStrong((id *)&__GlobalHandler, a3);
    objc_msgSend(a1, "_sendGlobalHandler:", __GlobalHandler);
  }
  pthread_mutex_unlock(&__GlobalHandlerLock);

}

- (NSArray)activeDownloads
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
  NSObject *accessQueue;
  id v16;
  uint64_t v18;
  _QWORD block[6];
  __int128 v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
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
      LODWORD(v20) = 136446210;
      *(_QWORD *)((char *)&v20 + 4) = "-[SSDownloadManager activeDownloads]";
      LODWORD(v18) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v20, v18);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  *(_QWORD *)&v20 = 0;
  *((_QWORD *)&v20 + 1) = &v20;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__30;
  v23 = __Block_byref_object_dispose__30;
  v24 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SSDownloadManager_activeDownloads__block_invoke;
  block[3] = &unk_1E47B8718;
  block[4] = self;
  block[5] = &v20;
  dispatch_sync(accessQueue, block);
  v16 = *(id *)(*((_QWORD *)&v20 + 1) + 40);
  _Block_object_dispose(&v20, 8);

  return (NSArray *)v16;
}

void __36__SSDownloadManager_activeDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24) || (v3 = *(void **)(v2 + 16)) == 0)
  {
    v4 = (void *)objc_msgSend((id)v2, "_copyDownloadsForMessage:downloadIDs:", 8, 0);
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqualToArray:", v4) & 1) == 0)
    {
      v5 = objc_msgSend(v4, "copy");
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 16);
      *(_QWORD *)(v6 + 16) = v5;

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "makeObjectsPerformSelector:", sel__resetStatus);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;

    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)addDownloads:(id)a3 completionBlock:(id)a4
{
  -[SSDownloadManager _insertDownloads:before:after:completionBlock:](self, "_insertDownloads:before:after:completionBlock:", a3, 0, 0, a4);
}

- (BOOL)canCancelDownload:(id)a3
{
  return objc_msgSend(a3, "isCancelable");
}

- (void)cancelAllDownloadsWithCompletionBlock:(id)a3
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
  xpc_object_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      v19 = 136446210;
      v20 = "-[SSDownloadManager cancelAllDownloadsWithCompletionBlock:]";
      LODWORD(v18) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v19, v18);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v17, "0", 0);
  xpc_dictionary_set_BOOL(v17, "1", -[SSDownloadManagerOptions shouldFilterExternalOriginatedDownloads](self->_options, "shouldFilterExternalOriginatedDownloads"));
  -[SSDownloadManager _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v17, v4);

}

- (void)cancelDownloads:(id)a3 completionBlock:(id)a4
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
  xpc_object_t v20;
  xpc_object_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  int *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  int v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      v12 = v10;
    else
      v12 = v10 & 2;
    if (v12)
    {
      v34 = 136446210;
      v35 = "-[SSDownloadManager cancelDownloads:completionBlock:]";
      LODWORD(v28) = 12;
      v27 = &v34;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v34, v28);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 1);
  v21 = xpc_array_create(0, 0);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v6;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        xpc_array_set_int64(v21, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "persistentIdentifier", v27));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
  }

  xpc_dictionary_set_value(v20, "1", v21);
  -[SSDownloadManager _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v20, v7);

}

- (void)finishDownloads:(id)a3
{
  id v4;

  v4 = a3;
  -[SSDownloadManager _willFinishDownloads:](self, "_willFinishDownloads:", v4);
  -[SSDownloadManager _finishDownloads:](self, "_finishDownloads:", v4);

}

- (void)insertDownloads:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5
{
  -[SSDownloadManager _insertDownloads:before:after:completionBlock:](self, "_insertDownloads:before:after:completionBlock:", a3, 0, a4, a5);
}

- (void)insertDownloads:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5
{
  -[SSDownloadManager _insertDownloads:before:after:completionBlock:](self, "_insertDownloads:before:after:completionBlock:", a3, a4, 0, a5);
}

- (BOOL)isUsingNetwork
{
  NSObject *accessQueue;
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
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SSDownloadManager_isUsingNetwork__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__SSDownloadManager_isUsingNetwork__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 57);
  return result;
}

- (SSDownloadManagerOptions)managerOptions
{
  return (SSDownloadManagerOptions *)(id)-[SSDownloadManagerOptions copy](self->_options, "copy");
}

- (void)moveDownload:(id)a3 afterDownload:(id)a4 completionBlock:(id)a5
{
  -[SSDownloadManager _moveDownload:before:after:completionBlock:](self, "_moveDownload:before:after:completionBlock:", a3, 0, a4, a5);
}

- (void)moveDownload:(id)a3 beforeDownload:(id)a4 completionBlock:(id)a5
{
  -[SSDownloadManager _moveDownload:before:after:completionBlock:](self, "_moveDownload:before:after:completionBlock:", a3, a4, 0, a5);
}

- (void)pauseDownloads:(id)a3 completionBlock:(id)a4
{
  -[SSDownloadManager _pauseDownloads:forced:completionBlock:](self, "_pauseDownloads:forced:completionBlock:", a3, 0, a4);
}

- (void)resumeDownloads:(id)a3 completionBlock:(id)a4
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
  xpc_object_t v20;
  xpc_object_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  int *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  int v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
      v34 = 136446210;
      v35 = "-[SSDownloadManager resumeDownloads:completionBlock:]";
      LODWORD(v28) = 12;
      v27 = &v34;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v34, v28);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 19);
  v21 = xpc_array_create(0, 0);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v6;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        xpc_array_set_int64(v21, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "persistentIdentifier", v27));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
  }

  xpc_dictionary_set_value(v20, "1", v21);
  -[SSDownloadManager _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v20, v7);

}

- (void)restartDownloads:(id)a3 completionBlock:(id)a4
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
  xpc_object_t v20;
  xpc_object_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  int *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  int v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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
      v34 = 136446210;
      v35 = "-[SSDownloadManager restartDownloads:completionBlock:]";
      LODWORD(v28) = 12;
      v27 = &v34;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v34, v28);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v11);
    }

    goto LABEL_15;
  }
LABEL_16:
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 20);
  v21 = xpc_array_create(0, 0);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v6;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        xpc_array_set_int64(v21, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "persistentIdentifier", v27));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v24);
  }

  xpc_dictionary_set_value(v20, "1", v21);
  -[SSDownloadManager _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v20, v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SSDownloadManager_removeObserver___block_invoke;
  block[3] = &unk_1E47B8768;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

uint64_t __36__SSDownloadManager_removeObserver___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 80))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 80), "removeObject:", *(_QWORD *)(result + 40));
  return result;
}

- (void)setDownloads:(id)a3 completionBlock:(id)a4
{
  -[SSDownloadManager setDownloads:forKinds:completionBlock:](self, "setDownloads:forKinds:completionBlock:", a3, 0, a4);
}

+ (id)EBookDownloadManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSDownloadManager_EBookDownloadManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (EBookDownloadManager_sOnce != -1)
    dispatch_once(&EBookDownloadManager_sOnce, block);
  return (id)EBookDownloadManager_sEBookManager;
}

void __41__SSDownloadManager_EBookDownloadManager__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "EBookDownloadKinds");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithDownloadKinds:", v5);
  v4 = (void *)EBookDownloadManager_sEBookManager;
  EBookDownloadManager_sEBookManager = v3;

}

+ (id)IPodDownloadManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SSDownloadManager_IPodDownloadManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (IPodDownloadManager_sOnce != -1)
    dispatch_once(&IPodDownloadManager_sOnce, block);
  return (id)IPodDownloadManager_sIPodManager;
}

void __40__SSDownloadManager_IPodDownloadManager__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "IPodDownloadKinds");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithDownloadKinds:", v5);
  v4 = (void *)IPodDownloadManager_sIPodManager;
  IPodDownloadManager_sIPodManager = v3;

}

+ (id)softwareDownloadManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SSDownloadManager_softwareDownloadManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (softwareDownloadManager_sOnce != -1)
    dispatch_once(&softwareDownloadManager_sOnce, block);
  return (id)softwareDownloadManager_sSoftwareManager;
}

void __44__SSDownloadManager_softwareDownloadManager__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "softwareDownloadKinds");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithDownloadKinds:", v5);
  v4 = (void *)softwareDownloadManager_sSoftwareManager;
  softwareDownloadManager_sSoftwareManager = v3;

}

+ (id)allStoreDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("book"), CFSTR("coached-audio"), CFSTR("document"), CFSTR("ebook"), CFSTR("feature-movie"), CFSTR("song"), CFSTR("music-video"), CFSTR("podcast"), CFSTR("ringtone"), CFSTR("tv-episode"), CFSTR("tone"), CFSTR("videoPodcast"), 0);
}

+ (id)EBookDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("ebook"), 0);
}

+ (void)retryAllRestoreDownloads
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SSXPCConnection *v14;
  xpc_object_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (SSIsDaemon())
  {
    -[objc_class retryAllRestoreDownloads](NSClassFromString(CFSTR("DownloadManager")), "retryAllRestoreDownloads");
    return;
  }
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
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
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      v6 = v4;
    else
      v6 = v4 & 2;
    if (v6)
    {
      v17 = 136446210;
      v18 = "+[SSDownloadManager retryAllRestoreDownloads]";
      LODWORD(v16) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v17, v16);
      v5 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
    }

    goto LABEL_17;
  }
LABEL_18:
  v14 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v15, "0", 37);
  -[SSXPCConnection sendMessage:](v14, "sendMessage:", v15);

}

+ (id)softwareDownloadKinds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("software"), 0);
}

- (void)_pauseDownloads:(id)a3 completionBlock:(id)a4
{
  -[SSDownloadManager _pauseDownloads:forced:completionBlock:](self, "_pauseDownloads:forced:completionBlock:", a3, 1, a4);
}

- (void)reloadFromServer
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
  xpc_object_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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
      v17 = 136446210;
      v18 = "-[SSDownloadManager reloadFromServer]";
      LODWORD(v16) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v17, v16);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_15;
  }
LABEL_16:
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v15, "0", 5);
  -[SSXPCConnection sendMessage:](self->_connection, "sendMessage:", v15);

}

- (void)setDownloads:(id)a3 forKinds:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  SSXPCConnection *connection;
  id v32;
  id v33;
  id v34;
  int *v35;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  int v46;
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      v15 = v13;
    else
      v15 = v13 & 2;
    if (v15)
    {
      v46 = 136446210;
      v47 = "-[SSDownloadManager setDownloads:forKinds:completionBlock:]";
      LODWORD(v36) = 12;
      v35 = &v46;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v46, v36);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v11, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
    }

    goto LABEL_15;
  }
LABEL_16:
  v23 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v23, "0", 39);
  xpc_dictionary_set_BOOL(v23, "1", 1);
  if (v9)
    SSXPCDictionarySetObject(v23, "3", v9);
  v24 = xpc_array_create(0, 0);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v25 = v8;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v42 != v28)
          objc_enumerationMutation(v25);
        v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "copyXPCEncoding", v35);
        if (v30)
          xpc_array_append_value(v24, v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v27);
  }

  xpc_dictionary_set_value(v23, "2", v24);
  objc_msgSend(v25, "makeObjectsPerformSelector:withObject:", sel__becomeManagedOnConnection_, self->_connection);
  connection = self->_connection;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __59__SSDownloadManager_setDownloads_forKinds_completionBlock___block_invoke;
  v37[3] = &unk_1E47BCF90;
  v37[4] = self;
  v38 = v25;
  v39 = v23;
  v40 = v10;
  v32 = v10;
  v33 = v23;
  v34 = v25;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v33, v37);

}

uint64_t __59__SSDownloadManager_setDownloads_forKinds_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReply:forDownloads:message:isRetry:block:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

+ (void)_triggerDownloads
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  SSXPCConnection *v15;
  xpc_object_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
    goto LABEL_16;
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    v6 = v4;
  else
    v6 = v4 & 2;
  if (!v6)
    goto LABEL_14;
  v18 = 136446210;
  v19 = "+[SSDownloadManager _triggerDownloads]";
  LODWORD(v17) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v18, v17);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_14:

  }
LABEL_16:
  if (SSIsDaemon())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.itunesstored.triggerdownloads"), 0, 0, 1u);
  }
  else
  {
    v15 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
    v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v16, "0", 41);
    -[SSXPCConnection sendMessage:](v15, "sendMessage:", v16);

  }
}

- (void)_finishDownloads:(id)a3
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
  xpc_object_t v17;
  xpc_object_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  SSXPCConnection *connection;
  int *v25;
  uint64_t v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  int v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (v9)
    {
      v33 = 136446210;
      v34 = "-[SSDownloadManager _finishDownloads:]";
      LODWORD(v26) = 12;
      v25 = &v33;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v33, v26);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_15;
  }
LABEL_16:
  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v17, "0", 7);
  v18 = xpc_array_create(0, 0);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v4;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        xpc_array_set_int64(v18, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "persistentIdentifier", v25));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v21);
  }

  xpc_dictionary_set_value(v17, "1", v18);
  connection = self->_connection;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __38__SSDownloadManager__finishDownloads___block_invoke;
  v27[3] = &unk_1E47BB6F0;
  v27[4] = self;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v17, v27);

}

void __38__SSDownloadManager__finishDownloads___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SSDownloadManager__finishDownloads___block_invoke_2;
  block[3] = &unk_1E47B8790;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __38__SSDownloadManager__finishDownloads___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 96);
  *(_QWORD *)(v1 + 96) = 0;

}

- (void)_willFinishDownloads:(id)a3
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
  v7[2] = __42__SSDownloadManager__willFinishDownloads___block_invoke;
  v7[3] = &unk_1E47B8768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __42__SSDownloadManager__willFinishDownloads___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  }
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v16 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  if (v6 >= 1)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 96);
      objc_msgSend(*(id *)(v9 + 48), "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

      if ((_DWORD)v10)
        objc_msgSend(v16, "addIndex:", i);
    }
  }
  if (objc_msgSend(v16, "count"))
  {
    v12 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "mutableCopy");
    objc_msgSend(v12, "removeObjectsAtIndexes:", v16);
    v13 = objc_msgSend(v12, "copy");
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 48);
    *(_QWORD *)(v14 + 48) = v13;

  }
}

- (id)_XPCConnection
{
  return self->_connection;
}

+ (void)_sendGlobalHandler:(id)a3
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  int64_t v17;
  SSXPCConnection *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!SSIsInternalBuild() || !_os_feature_enabled_impl())
    goto LABEL_16;
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (!v8)
    goto LABEL_14;
  v20 = 136446210;
  v21 = "+[SSDownloadManager _sendGlobalHandler:]";
  LODWORD(v19) = 12;
  v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v20, v19);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v9);
    SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
LABEL_14:

  }
LABEL_16:
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 22);
  if (v3)
    v17 = objc_msgSend(v3, "handlerIdentifier");
  else
    v17 = 0;
  xpc_dictionary_set_int64(v16, "1", v17);
  v18 = -[SSXPCConnection initWithServiceName:]([SSXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.itunesstored.xpc"));
  -[SSXPCConnection sendMessage:](v18, "sendMessage:", v16);

}

- (void)_connectAfterDaemonLaunch
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
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SSDownloadManager _sendObserverConnection](self, "_sendObserverConnection");
  -[SSDownloadManager _loadDownloadKindsUsingNetwork](self, "_loadDownloadKindsUsingNetwork");
  -[SSDownloadManager _resetAllDownloads](self, "_resetAllDownloads");
  -[SSDownloadManager _sendDownloadsChanged:](self, "_sendDownloadsChanged:", 0);
  pthread_mutex_lock(&__GlobalHandlerLock);
  if (__GlobalHandler)
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
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      v7 = v5;
    else
      v7 = v5 & 2;
    if (v7)
    {
      v16 = 138412290;
      v17 = __GlobalHandler;
      LODWORD(v15) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_14:

        +[SSDownloadManager _sendGlobalHandler:](SSDownloadManager, "_sendGlobalHandler:", __GlobalHandler);
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v16, v15);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }

    goto LABEL_14;
  }
LABEL_15:
  pthread_mutex_unlock(&__GlobalHandlerLock);
}

- (id)_copyDownloadKindsUsingNetwork
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
  xpc_object_t v16;
  dispatch_semaphore_t v17;
  SSXPCConnection *connection;
  NSObject *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  NSObject *v24;
  __int128 *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
      LODWORD(v26) = 136446210;
      *(_QWORD *)((char *)&v26 + 4) = "-[SSDownloadManager _copyDownloadKindsUsingNetwork]";
      LODWORD(v22) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v26, v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        free(v8);
        SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);

      }
    }
    else
    {

    }
  }
  *(_QWORD *)&v26 = 0;
  *((_QWORD *)&v26 + 1) = &v26;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__30;
  v29 = __Block_byref_object_dispose__30;
  v30 = 0;
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v16, "0", 29);
  v17 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __51__SSDownloadManager__copyDownloadKindsUsingNetwork__block_invoke;
  v23[3] = &unk_1E47BCFE0;
  v25 = &v26;
  v19 = v17;
  v24 = v19;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v16, v23);
  dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  v20 = *(id *)(*((_QWORD *)&v26 + 1) + 40);

  _Block_object_dispose(&v26, 8);
  return v20;
}

void __51__SSDownloadManager__copyDownloadKindsUsingNetwork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const __CFDictionary *v4;
  CFArrayRef v5;
  uint64_t v6;
  void *v7;
  xpc_object_t xdict;

  xdict = a2;
  if (xdict && MEMORY[0x1A85863E4](xdict) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(xdict, "0");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (const __CFDictionary *)v3;
    if (v3 && MEMORY[0x1A85863E4](v3) == MEMORY[0x1E0C812C8])
    {
      v5 = SSXPCCreateCFObjectFromXPCObject(v4);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __58__SSDownloadManager__copyDownloadsForMessage_downloadIDs___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C81328])
  {
    v5 = -[SSEntity _initWithPersistentIdentifier:]([SSDownload alloc], "_initWithPersistentIdentifier:", xpc_int64_get_value(v4));
  }
  else
  {
    if (MEMORY[0x1A85863E4](v4) != MEMORY[0x1E0C812F8])
      goto LABEL_7;
    v5 = -[SSDownload _initWithLocalPropertyValues:]([SSDownload alloc], "_initWithLocalPropertyValues:", v4);
  }
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_becomeManagedOnConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
LABEL_7:

  return 1;
}

- (BOOL)_supportsSoftwareKind
{
  return 1;
}

- (void)_handleDownloadKindsUsingNetworkChanged:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = (id)SSXPCDictionaryCopyObjectWithClass(v4, "1", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SSDownloadManager _reloadIsUsingNetworkWithDownloadKinds:](self, "_reloadIsUsingNetworkWithDownloadKinds:", v6);
  else
    -[SSDownloadManager _loadDownloadKindsUsingNetwork](self, "_loadDownloadKindsUsingNetwork");

}

- (void)_handleDownloadsChanged:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  SSDownloadManager *v44;
  void *v45;
  void *v46;
  SSDownloadManager *v47;
  id v48;
  uint64_t v49;
  int *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD applier[4];
  id v63;
  id v64;
  _BYTE v65[128];
  int v66;
  const char *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v55 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  xpc_dictionary_get_value(v4, "1");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_downloads, "count"))
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6 || MEMORY[0x1A85863E4](v5) != MEMORY[0x1E0C812C8] || !xpc_array_get_count(v5))
    goto LABEL_44;
  v53 = v4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 0x7FFFFFFFFFFFFFFFLL);
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __45__SSDownloadManager__handleDownloadsChanged___block_invoke;
  applier[3] = &unk_1E47BD008;
  v9 = v7;
  v63 = v9;
  v52 = v8;
  v64 = v52;
  xpc_array_apply(v5, applier);
  v10 = -[NSArray count](self->_downloads, "count");
  v56 = v9;
  v11 = objc_msgSend(v9, "count");
  v12 = v11;
  v54 = v5;
  if (v10 >= 1 && v11 >= 1)
  {
    v13 = 1;
    do
    {
      -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", v13 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v14, "persistentIdentifier"));
      objc_msgSend(v56, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", v13 - 1);
        objc_msgSend(v56, "setObject:forKey:", v17, v15);
        --v12;

      }
      if (v13 >= v10)
        break;
      ++v13;
    }
    while (v12 > 0);
  }
  if (v12)
  {

    v5 = v54;
LABEL_43:
    v4 = v53;
LABEL_44:
    -[SSDownloadManager _resetAllDownloads](self, "_resetAllDownloads");
    v47 = self;
    v48 = 0;
    goto LABEL_45;
  }
  v5 = v54;
  v18 = 0x1E0CB3000uLL;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v19, "shouldLog");
    if (objc_msgSend(v19, "shouldLogToDisk"))
      v20 |= 2u;
    objc_msgSend(v19, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      v22 = v20;
    else
      v22 = v20 & 2;
    if (v22)
    {
      v66 = 136446210;
      v67 = "-[SSDownloadManager _handleDownloadsChanged:]";
      LODWORD(v51) = 12;
      v50 = &v66;
      v23 = (void *)_os_log_send_and_compose_impl();

      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, &v66, v51, v52);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        free(v23);
        SSFileLog(v19, CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v24);

      }
    }
    else
    {

    }
  }
  v31 = -[SSDownloadManager _copyDownloadsForMessage:downloadIDs:](self, "_copyDownloadsForMessage:downloadIDs:", 14, v54, v50);
  v32 = objc_msgSend(v31, "count");
  v33 = v56;
  if (v32 != objc_msgSend(v56, "count"))
  {

    goto LABEL_43;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v31;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  if (v34)
  {
    v35 = v34;
    v36 = 0;
    v37 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v59 != v37)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v40 = (void *)objc_msgSend(objc_alloc(*(Class *)(v18 + 2024)), "initWithLongLong:", objc_msgSend(v39, "persistentIdentifier"));
        objc_msgSend(v33, "objectForKey:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v41 && objc_msgSend(v41, "integerValue") != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSArray objectAtIndex:](self->_downloads, "objectAtIndex:", objc_msgSend(v42, "integerValue"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_localExternalValues");
          v44 = self;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "_setLocalExternalValues:", v45);

          objc_msgSend(v39, "_localValues");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "_setLocalValues:", v46);

          self = v44;
          v33 = v56;
          objc_msgSend(v55, "addObject:", v43);
          ++v36;

        }
        v18 = 0x1E0CB3000;
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v35);
  }
  else
  {
    v36 = 0;
  }

  v49 = objc_msgSend(obj, "count");
  v6 = v36 == v49;
  v4 = v53;
  v5 = v54;
  if (!v6)
    goto LABEL_44;
  if (!self->_observers)
    goto LABEL_46;
  v47 = self;
  v48 = v55;
LABEL_45:
  -[SSDownloadManager _sendDownloadsChanged:](v47, "_sendDownloadsChanged:", v48);
LABEL_46:

}

uint64_t __45__SSDownloadManager__handleDownloadsChanged___block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  CFArrayRef v4;

  v4 = SSXPCCreateCFObjectFromXPCObject(a3);
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), v4);

  return 1;
}

- (void)_handleDownloadsRemoved:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *downloads;
  SSDownloadManager *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD applier[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_value(a3, "1");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812C8] && -[NSArray count](self->_downloads, "count"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __45__SSDownloadManager__handleDownloadsRemoved___block_invoke;
    applier[3] = &unk_1E47B8B38;
    v7 = v6;
    v25 = v7;
    xpc_array_apply(v5, applier);
    if (objc_msgSend(v7, "count"))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v19 = self;
      v9 = self->_downloads;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v14, "persistentIdentifier"));
            if ((objc_msgSend(v7, "containsObject:", v15) & 1) == 0)
              objc_msgSend(v8, "addObject:", v14);

          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
        }
        while (v11);
      }

      v16 = -[NSArray count](v19->_downloads, "count");
      if (v16 != objc_msgSend(v8, "count"))
      {
        v17 = objc_msgSend(v8, "copy");
        downloads = v19->_downloads;
        v19->_downloads = (NSArray *)v17;

        -[SSDownloadManager _sendDownloadsChanged:](v19, "_sendDownloadsChanged:", 0);
      }

    }
  }

}

uint64_t __45__SSDownloadManager__handleDownloadsRemoved___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C81328])
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", xpc_int64_get_value(v4));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  return 1;
}

- (void)_handleDownloadStatesChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  SSDownloadManager *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  CFArrayRef v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  id v32;
  CFArrayRef v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  NSObject *observerQueue;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _BOOL4 v53;
  void *v54;
  id obj;
  SSDownloadManager *v56;
  xpc_object_t xdict;
  void *v58;
  _QWORD block[4];
  id v60;
  SSDownloadManager *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD applier[4];
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_observers)
  {
    xdict = v4;
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v56 = self;
    v7 = self->_observers;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v78 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      }
      while (v9);
    }

    v13 = v56;
    v56->_activeDownloadsChanged = 1;
    v5 = xdict;
    if (objc_msgSend(v6, "count"))
    {
      xpc_dictionary_get_value(xdict, "1");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14 && MEMORY[0x1A85863E4](v14) == MEMORY[0x1E0C812C8])
      {
        v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[SSDownloadManagerOptions prefetchedDownloadExternalProperties](v56->_options, "prefetchedDownloadExternalProperties");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSDownloadManagerOptions prefetchedDownloadProperties](v56->_options, "prefetchedDownloadProperties");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __50__SSDownloadManager__handleDownloadStatesChanged___block_invoke;
        applier[3] = &unk_1E47B8B38;
        v20 = v16;
        v76 = v20;
        xpc_array_apply(v15, applier);
        v58 = v20;
        v51 = v19;
        v52 = objc_msgSend(v20, "count");
        v49 = v15;
        v50 = v18;
        v54 = v17;
        if (v52 == 1)
        {
          v21 = objc_msgSend(v18, "count");
          v53 = v21 == 0;
          v22 = 0x1E0C99000uLL;
          if (v21)
          {
            v23 = SSXPCDictionaryCopyCFObject(xdict, "2");
            v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v25 = v18;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v72;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v72 != v28)
                    objc_enumerationMutation(v25);
                  v30 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
                  -[__CFArray objectForKey:](v23, "objectForKey:", v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v31)
                    objc_msgSend(v24, "setObject:forKey:", v31, v30);

                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
              }
              while (v27);
            }

            v13 = v56;
            v5 = xdict;
            v19 = v51;
            v22 = 0x1E0C99000;
          }
          else
          {
            v24 = 0;
          }
          if (objc_msgSend(v19, "count"))
          {
            v33 = SSXPCDictionaryCopyCFObject(v5, "3");
            v32 = objc_alloc_init(*(Class *)(v22 + 3592));
            v67 = 0u;
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            v34 = v19;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v68;
              do
              {
                for (k = 0; k != v36; ++k)
                {
                  if (*(_QWORD *)v68 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * k);
                  -[__CFArray objectForKey:](v33, "objectForKey:", v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                    objc_msgSend(v32, "setObject:forKey:", v40, v39);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
              }
              while (v36);
            }

            v53 = 0;
            v13 = v56;
          }
          else
          {
            v32 = 0;
          }
        }
        else
        {
          v32 = 0;
          v24 = 0;
          v53 = 1;
        }
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        obj = -[SSDownloadManager _copyDownloads](v13, "_copyDownloads");
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v64;
          v44 = v52;
          do
          {
            for (m = 0; m != v42; ++m)
            {
              if (*(_QWORD *)v64 != v43)
                objc_enumerationMutation(obj);
              v46 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * m);
              v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v46, "persistentIdentifier"));
              if (objc_msgSend(v58, "containsObject:", v47))
              {
                if (objc_msgSend(v24, "count"))
                {
                  objc_msgSend(v46, "_addCachedExternalValues:", v24);
                  if (!objc_msgSend(v32, "count"))
                  {
                    if (v52 < 2)
                      goto LABEL_55;
LABEL_52:
                    objc_msgSend(v46, "_setDirtyCachedProperties:", v51);
LABEL_55:
                    if (v53)
                      objc_msgSend(v46, "_resetStatus");
                    objc_msgSend(v54, "addObject:", v46);
                    --v44;
                    goto LABEL_58;
                  }
                }
                else if (v52 <= 1)
                {
                  if (!objc_msgSend(v32, "count"))
                    goto LABEL_55;
                }
                else
                {
                  objc_msgSend(v46, "_setDirtyCachedExternalProperties:", v50);
                  if (!objc_msgSend(v32, "count"))
                    goto LABEL_52;
                }
                objc_msgSend(v46, "_addCachedPropertyValues:", v32);
                goto LABEL_55;
              }
LABEL_58:

              if (!v44)
                goto LABEL_61;
            }
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
          }
          while (v42);
        }
LABEL_61:

        if (objc_msgSend(v54, "count"))
        {
          observerQueue = v56->_observerQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __50__SSDownloadManager__handleDownloadStatesChanged___block_invoke_2;
          block[3] = &unk_1E47B87B8;
          v60 = v6;
          v61 = v56;
          v62 = v54;
          dispatch_async(observerQueue, block);

        }
        v5 = xdict;
        v15 = v49;
      }

    }
  }

}

uint64_t __50__SSDownloadManager__handleDownloadStatesChanged___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;

  v4 = a3;
  if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C81328])
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", xpc_int64_get_value(v4));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
  return 1;
}

void __50__SSDownloadManager__handleDownloadStatesChanged___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 40);
        v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy", (_QWORD)v10);
        objc_msgSend(v7, "downloadManager:downloadStatesDidChange:", v8, v9);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)_handleReply:(id)a3 forDownloads:(id)a4 message:(id)a5 isRetry:(BOOL)a6 block:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SSXPCConnection *connection;
  void *v18;
  int64_t int64;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (v12 && MEMORY[0x1A85863E4](v12) == MEMORY[0x1E0C812F8])
  {
    if (xpc_dictionary_get_BOOL(v12, "0"))
    {
      v16 = 0;
      goto LABEL_10;
    }
    int64 = xpc_dictionary_get_int64(v12, "1");
    SSError((uint64_t)CFSTR("SSErrorDomain"), int64, 0, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 111, 0, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!a6)
    {
      connection = self->_connection;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __69__SSDownloadManager__handleReply_forDownloads_message_isRetry_block___block_invoke;
      v24[3] = &unk_1E47BCF90;
      v24[4] = self;
      v25 = v13;
      v26 = v14;
      v27 = v15;
      -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v26, v24);

      v18 = v25;
LABEL_12:

      goto LABEL_13;
    }
  }
  if (v16)
    objc_msgSend(v13, "makeObjectsPerformSelector:withObject:", sel__becomeManagedOnConnection_, 0);
LABEL_10:
  if (v15)
  {
    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__SSDownloadManager__handleReply_forDownloads_message_isRetry_block___block_invoke_2;
    v21[3] = &unk_1E47B8A98;
    v23 = v15;
    v16 = v16;
    v22 = v16;
    dispatch_async(v20, v21);

    v18 = v23;
    goto LABEL_12;
  }
LABEL_13:

}

uint64_t __69__SSDownloadManager__handleReply_forDownloads_message_isRetry_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReply:forDownloads:message:isRetry:block:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 56));
}

uint64_t __69__SSDownloadManager__handleReply_forDownloads_message_isRetry_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_insertDownloads:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  xpc_object_t v26;
  const char *v27;
  void *v28;
  void *v29;
  xpc_object_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  SSXPCConnection *connection;
  id v39;
  id v40;
  id v41;
  int *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  int v54;
  const char *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      v18 = v16;
    else
      v18 = v16 & 2;
    if (v18)
    {
      v54 = 136446210;
      v55 = "-[SSDownloadManager _insertDownloads:before:after:completionBlock:]";
      LODWORD(v43) = 12;
      v42 = &v54;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v54, v43);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog(v14, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v17);
    }

    goto LABEL_15;
  }
LABEL_16:
  v26 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v26, "0", 15);
  if (v11)
  {
    v27 = "1";
    v28 = v11;
  }
  else
  {
    if (!v12)
      goto LABEL_21;
    v27 = "2";
    v28 = v12;
  }
  xpc_dictionary_set_int64(v26, v27, objc_msgSend(v28, "persistentIdentifier", v42));
LABEL_21:
  v44 = v11;
  v29 = v12;
  v30 = xpc_array_create(0, 0);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v31 = v10;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v50 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if ((objc_msgSend(v36, "_isManaged", v42) & 1) == 0)
        {
          v37 = (void *)objc_msgSend(v36, "copyXPCEncoding");
          if (v37)
            xpc_array_append_value(v30, v37);

        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v33);
  }

  xpc_dictionary_set_value(v26, "3", v30);
  objc_msgSend(v31, "makeObjectsPerformSelector:withObject:", sel__becomeManagedOnConnection_, self->_connection);
  connection = self->_connection;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __67__SSDownloadManager__insertDownloads_before_after_completionBlock___block_invoke;
  v45[3] = &unk_1E47BCF90;
  v45[4] = self;
  v46 = v31;
  v47 = v26;
  v48 = v13;
  v39 = v13;
  v40 = v26;
  v41 = v31;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", v40, v45);

}

uint64_t __67__SSDownloadManager__insertDownloads_before_after_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReply:forDownloads:message:isRetry:block:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

- (void)_loadDownloadKindsUsingNetwork
{
  NSObject *backgroundQueue;
  _QWORD block[5];

  backgroundQueue = self->_backgroundQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SSDownloadManager__loadDownloadKindsUsingNetwork__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(backgroundQueue, block);
}

void __51__SSDownloadManager__loadDownloadKindsUsingNetwork__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyDownloadKindsUsingNetwork");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SSDownloadManager__loadDownloadKindsUsingNetwork__block_invoke_2;
  v6[3] = &unk_1E47B8768;
  v6[4] = v3;
  v7 = v2;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __51__SSDownloadManager__loadDownloadKindsUsingNetwork__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadIsUsingNetworkWithDownloadKinds:", *(_QWORD *)(a1 + 40));
}

- (void)_moveDownload:(id)a3 before:(id)a4 after:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  xpc_object_t v26;
  int64_t v27;
  const char *v28;
  void *v29;
  int *v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      v18 = v16;
    else
      v18 = v16 & 2;
    if (v18)
    {
      v32 = 136446210;
      v33 = "-[SSDownloadManager _moveDownload:before:after:completionBlock:]";
      LODWORD(v31) = 12;
      v30 = &v32;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v32, v31);
      v17 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog(v14, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v17);
    }

    goto LABEL_15;
  }
LABEL_16:
  v26 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v26, "0", 16);
  v27 = objc_msgSend(v13, "persistentIdentifier");

  xpc_dictionary_set_int64(v26, "1", v27);
  if (v10)
  {
    v28 = "2";
    v29 = v10;
LABEL_20:
    xpc_dictionary_set_int64(v26, v28, objc_msgSend(v29, "persistentIdentifier", v30));
    goto LABEL_21;
  }
  if (v11)
  {
    v28 = "3";
    v29 = v11;
    goto LABEL_20;
  }
LABEL_21:
  -[SSDownloadManager _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v26, v12, v30);

}

- (void)_pauseDownloads:(id)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  int *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  int v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      v14 = v12;
    else
      v14 = v12 & 2;
    if (v14)
    {
      v36 = 136446210;
      v37 = "-[SSDownloadManager _pauseDownloads:forced:completionBlock:]";
      LODWORD(v30) = 12;
      v29 = &v36;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v36, v30);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_16:
  v22 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v22, "0", 17);
  xpc_dictionary_set_BOOL(v22, "2", a4);
  v23 = xpc_array_create(0, 0);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = v8;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        xpc_array_set_int64(v23, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "persistentIdentifier", v29));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v26);
  }

  xpc_dictionary_set_value(v22, "1", v23);
  -[SSDownloadManager _sendMessage:withCompletionBlock:](self, "_sendMessage:withCompletionBlock:", v22, v9);

}

- (void)_reloadIsUsingNetworkWithDownloadKinds:(id)a3
{
  SSDownloadManagerOptions *options;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;

  options = self->_options;
  v5 = a3;
  -[SSDownloadManagerOptions downloadKinds](options, "downloadKinds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObjectCommonWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7 != 0;
  if (self->_isUsingNetwork != v8)
  {
    self->_isUsingNetwork = v8;
    -[SSDownloadManager _sendMessageToObservers:](self, "_sendMessageToObservers:", sel_downloadManagerNetworkUsageDidChange_);
  }
}

- (void)_resetAllDownloads
{
  self->_downloadsChanged = 1;
}

- (void)_sendDownloadsChanged:(id)a3
{
  id v4;
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  char v14;
  char v15;
  id v16;
  SSDownloadManager *v17;
  NSObject *observerQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  SSDownloadManager *v23;
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  SSDownloadManager *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_observers)
  {
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = self;
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = self->_observers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v10);
          if (v4 && (v12 = objc_opt_respondsToSelector(), v13 = v25, (v12 & 1) != 0)
            || (v14 = objc_opt_respondsToSelector(), v13 = v5, (v14 & 1) != 0)
            || (v15 = objc_opt_respondsToSelector(), v13 = v24, (v15 & 1) != 0))
          {
            objc_msgSend(v13, "addObject:", v11);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v24, "count"))
    {
      objc_msgSend(v4, "allObjects");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v23;
      if (!v16)
        v16 = -[SSDownloadManager _copyDownloads](v23, "_copyDownloads");
    }
    else
    {
      v16 = 0;
      v17 = v23;
    }
    observerQueue = v17->_observerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SSDownloadManager__sendDownloadsChanged___block_invoke;
    block[3] = &unk_1E47BD058;
    v27 = v25;
    v28 = v17;
    v29 = v4;
    v30 = v5;
    v31 = v24;
    v32 = v16;
    v19 = v16;
    v20 = v24;
    v21 = v5;
    v22 = v25;
    dispatch_async(observerQueue, block);

  }
}

void __43__SSDownloadManager__sendDownloadsChanged___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v6++), "downloadManager:downloadsDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v4);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = *(id *)(a1 + 56);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "downloadManagerDownloadsDidChange:", *(_QWORD *)(a1 + 40));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *(id *)(a1 + 64);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "downloadManager:downloadStatesDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    }
    while (v14);
  }

}

- (void)_sendMessage:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  SSXPCConnection *connection;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__SSDownloadManager__sendMessage_withCompletionBlock___block_invoke;
  v9[3] = &unk_1E47BAB40;
  v10 = v6;
  v8 = v6;
  -[SSXPCConnection sendMessage:withReply:](connection, "sendMessage:withReply:", a3, v9);

}

void __54__SSDownloadManager__sendMessage_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = v3;
  if (!v3 || MEMORY[0x1A85863E4](v3) != MEMORY[0x1E0C812F8])
  {
    v5 = 111;
LABEL_4:
    SSError((uint64_t)CFSTR("SSErrorDomain"), v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!xpc_dictionary_get_BOOL(v4, "0"))
  {
    v5 = 100;
    goto LABEL_4;
  }
  v6 = 0;
LABEL_5:
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__SSDownloadManager__sendMessage_withCompletionBlock___block_invoke_2;
    v9[3] = &unk_1E47B8A98;
    v11 = v7;
    v10 = v6;
    dispatch_async(v8, v9);

  }
}

uint64_t __54__SSDownloadManager__sendMessage_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_sendMessageToObservers:(SEL)a3
{
  id v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *observerQueue;
  _QWORD block[4];
  id v13;
  SSDownloadManager *v14;
  SEL v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_observers)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = self->_observers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      observerQueue = self->_observerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__SSDownloadManager__sendMessageToObservers___block_invoke;
      block[3] = &unk_1E47B9F28;
      v14 = self;
      v15 = a3;
      v13 = v5;
      dispatch_async(observerQueue, block);

    }
  }
}

void __45__SSDownloadManager__sendMessageToObservers___block_invoke(uint64_t a1)
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
          objc_msgSend(v7, "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

@end
