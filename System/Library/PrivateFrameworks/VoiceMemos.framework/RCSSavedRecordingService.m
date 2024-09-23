@implementation RCSSavedRecordingService

- (void)_onQueueRemovePendingServiceMessageReplyBlockInvalidationHandlerForToken:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_pendingServiceCompletionHandlers, "removeObjectForKey:", a3);
}

+ (id)sharedService
{
  if (sharedService___once != -1)
    dispatch_once(&sharedService___once, &__block_literal_global_14);
  return (id)sharedService___sharedService;
}

void __40__RCSSavedRecordingService_serviceProxy__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "openServiceConnection");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__RCSSavedRecordingService_serviceProxy__block_invoke_2;
    v6[3] = &unk_1E769D2E0;
    objc_copyWeak(&v8, &location);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_3;
  v6[3] = &unk_1E769D470;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_onQueueAddPendingServiceMessageReplyBlockInvalidationHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_destroyWeak(&v8);
}

- (id)_onQueueAddPendingServiceMessageReplyBlockInvalidationHandler:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *pendingServiceCompletionHandlers;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    pendingServiceCompletionHandlers = self->_pendingServiceCompletionHandlers;
    v7 = (void *)MEMORY[0x1C3B76918](v4);
    -[NSMutableDictionary setObject:forKey:](pendingServiceCompletionHandlers, "setObject:forKey:", v7, v5);

  }
  return v5;
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  double v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = RCTestSlowMessageServiceSleepAmount();
    if (v5 > 0.0)
    {
      v6 = v5;
      OSLogForCategory(CFSTR("Service"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5_cold_2(a1, v7);

      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v6);
      OSLogForCategory(CFSTR("Service"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5_cold_1(a1);

    }
    v9 = WeakRetained[1];
    v10 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_167;
    block[3] = &unk_1E769BF08;
    v11 = WeakRetained;
    v12 = *(_QWORD *)(a1 + 40);
    v18 = v11;
    v19 = v12;
    dispatch_sync(v9, block);
    v13 = v11[2];
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_2_168;
    v14[3] = &unk_1E769C808;
    v16 = *(id *)(a1 + 32);
    v15 = v3;
    dispatch_async(v13, v14);

  }
}

- (RCSSavedRecordingService)init
{
  RCSSavedRecordingService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serialQueue;
  uint64_t v6;
  NSMutableDictionary *pendingServiceCompletionHandlers;
  uint64_t v8;
  NSMutableDictionary *pendingSynchronousServiceCompletionHandlers;
  uint64_t v10;
  NSHashTable *interruptionObservers;
  void *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  const char *v16;
  _QWORD v18[4];
  id v19;
  _QWORD handler[4];
  id v21;
  _QWORD v22[4];
  id v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)RCSSavedRecordingService;
  v2 = -[RCSSavedRecordingService init](&v24, sel_init);
  if (v2)
  {
    OSLogForCategory(CFSTR("Default"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[RCSSavedRecordingService init]";
      _os_log_impl(&dword_1BD830000, v3, OS_LOG_TYPE_DEFAULT, "%s -- Opening RCSSavedRecordingService connection", buf, 0xCu);
    }

    v4 = dispatch_queue_create("com.apple.VoiceMemos.RCSSavedRecordingServiceSerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    objc_storeStrong((id *)&v2->_completionQueue, MEMORY[0x1E0C80D38]);
    v6 = objc_opt_new();
    pendingServiceCompletionHandlers = v2->_pendingServiceCompletionHandlers;
    v2->_pendingServiceCompletionHandlers = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    pendingSynchronousServiceCompletionHandlers = v2->_pendingSynchronousServiceCompletionHandlers;
    v2->_pendingSynchronousServiceCompletionHandlers = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    interruptionObservers = v2->_interruptionObservers;
    v2->_interruptionObservers = (NSHashTable *)v10;

    -[RCSSavedRecordingService openServiceConnection](v2, "openServiceConnection");
    objc_initWeak((id *)buf, v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __32__RCSSavedRecordingService_init__block_invoke;
    v22[3] = &unk_1E769C858;
    objc_copyWeak(&v23, (id *)buf);
    v14 = (id)objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillTerminateNotification"), 0, 0, v22);

    -[NSXPCConnection resume](v2->_xpcConnection, "resume");
    v15 = (const char *)objc_msgSend(CFSTR("RCSavedRecordingServiceDidChangeCompositionAVURLsBeingExportedDistributedNotification"), "UTF8String");
    handler[0] = v13;
    handler[1] = 3221225472;
    handler[2] = __32__RCSSavedRecordingService_init__block_invoke_2;
    handler[3] = &unk_1E769CDA0;
    objc_copyWeak(&v21, (id *)buf);
    notify_register_dispatch(v15, &v2->_compositionAVURLsBeingExportedDistributedNotificationToken, MEMORY[0x1E0C80D38], handler);

    v16 = (const char *)objc_msgSend(CFSTR("RCSavedRecordingServiceDidChangeCompositionAVURLsBeingModifiedDistributedNotification"), "UTF8String");
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __32__RCSSavedRecordingService_init__block_invoke_3;
    v18[3] = &unk_1E769CDA0;
    objc_copyWeak(&v19, (id *)buf);
    notify_register_dispatch(v16, &v2->_compositionAVURLsBeingModifiedDistributedNotificationToken, MEMORY[0x1E0C80D38], v18);

    -[RCSSavedRecordingService _handleCompositionAVURLsBeingExportedDidChange](v2, "_handleCompositionAVURLsBeingExportedDidChange");
    -[RCSSavedRecordingService _handleCompositionAVURLsBeingModifiedDidChange](v2, "_handleCompositionAVURLsBeingModifiedDidChange");
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)openServiceConnection
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!self->_xpcConnection)
  {
    v3 = +[RCSSavedRecordingServiceConnection newConnection](RCSSavedRecordingServiceConnection, "newConnection");
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v3;

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    +[RCSSavedRecordingServiceConnection clientInterface](RCSSavedRecordingServiceConnection, "clientInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v5);

    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__RCSSavedRecordingService_openServiceConnection__block_invoke;
    v9[3] = &unk_1E769CEA0;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v9);
    v7[0] = v6;
    v7[1] = 3221225472;
    v7[2] = __49__RCSSavedRecordingService_openServiceConnection__block_invoke_2;
    v7[3] = &unk_1E769CEA0;
    objc_copyWeak(&v8, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)enableOrphanHandlingWithCompletionBlock:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  OSLogForCategory(CFSTR("Service"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService enableOrphanHandlingWithCompletionBlock:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v5, &__block_literal_global_136);
}

- (void)fetchCompositionAVURLsBeingExported:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v5 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__9;
  v21[4] = __Block_byref_object_dispose__9;
  v22 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke;
  v18[3] = &unk_1E769D138;
  v20 = v21;
  v18[4] = self;
  v7 = v5;
  v19 = v7;
  v8 = (void *)MEMORY[0x1C3B76918](v18);
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService fetchCompositionAVURLsBeingExported:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke_137;
  v17[3] = &unk_1E769D188;
  v17[4] = v21;
  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v8, v17);

  _Block_object_dispose(v21, 8);
}

- (void)fetchCompositionAVURLsBeingModified:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v5 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__9;
  v21[4] = __Block_byref_object_dispose__9;
  v22 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke;
  v18[3] = &unk_1E769D138;
  v20 = v21;
  v18[4] = self;
  v7 = v5;
  v19 = v7;
  v8 = (void *)MEMORY[0x1C3B76918](v18);
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService fetchCompositionAVURLsBeingModified:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke_139;
  v17[3] = &unk_1E769D188;
  v17[4] = v21;
  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v8, v17);

  _Block_object_dispose(v21, 8);
}

- (void)_sendServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 messagingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[RCSSavedRecordingService serviceProxy](self, "serviceProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:withServiceProxy:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:withServiceProxy:messagingBlock:", a3, v9, v10, v8);

}

- (id)serviceProxy
{
  OS_dispatch_queue *v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  OS_dispatch_queue *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  v15 = 0;
  v3 = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__RCSSavedRecordingService_serviceProxy__block_invoke;
  block[3] = &unk_1E769BF58;
  v8 = v3;
  v9 = &v10;
  block[4] = self;
  v4 = v3;
  dispatch_sync(v4, block);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)_sendServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 withServiceProxy:(id)a5 messagingBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, _QWORD *);
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  NSObject *serialQueue;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD);
  _QWORD *v21;
  id v22[2];
  _QWORD block[5];
  id v24;
  _QWORD *v25;
  id v26;
  id location;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, id, _QWORD *))a6;
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke;
  v30[3] = &unk_1E769D448;
  v14 = v10;
  v31 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x1C3B76918](v30);
  if (v11)
  {
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__9;
    v28[4] = __Block_byref_object_dispose__9;
    v29 = 0;
    objc_initWeak(&location, self);
    serialQueue = self->_serialQueue;
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_2;
    block[3] = &unk_1E769D498;
    v25 = v28;
    block[4] = self;
    objc_copyWeak(&v26, &location);
    v17 = v15;
    v24 = v17;
    dispatch_sync(serialQueue, block);
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5;
    v19[3] = &unk_1E769D4C0;
    objc_copyWeak(v22, &location);
    v22[1] = (id)a3;
    v21 = v28;
    v20 = v17;
    v12[2](v12, v11, v19);

    objc_destroyWeak(v22);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(v28, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSSavedRecordingServiceErrorDomain"), 201, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v18);

  }
}

uint64_t __68__RCSSavedRecordingService_enableOrphanHandlingWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableOrphanHandlingWithCompletionBlock:");
}

- (void)_handleCompositionAVURLsBeingModifiedDidChange
{
  -[RCSSavedRecordingService fetchCompositionAVURLsBeingModified:](self, "fetchCompositionAVURLsBeingModified:", 0);
}

- (void)_handleCompositionAVURLsBeingExportedDidChange
{
  -[RCSSavedRecordingService fetchCompositionAVURLsBeingExported:](self, "fetchCompositionAVURLsBeingExported:", 0);
}

uint64_t __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSSet)compositionAVURLsBeingExported
{
  return self->_compositionAVURLsBeingExported;
}

void __41__RCSSavedRecordingService_sharedService__block_invoke()
{
  RCSSavedRecordingService *v0;
  void *v1;

  v0 = objc_alloc_init(RCSSavedRecordingService);
  v1 = (void *)sharedService___sharedService;
  sharedService___sharedService = (uint64_t)v0;

}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "setCompositionAVURLsBeingExported:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)setCompositionAVURLsBeingExported:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[NSSet isEqual:](self->_compositionAVURLsBeingExported, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_compositionAVURLsBeingExported, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("RCSavedRecordingServiceCompositionAVURLsBeingExportedDidChangeNotification"), self);

  }
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "setCompositionAVURLsBeingModified:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)setCompositionAVURLsBeingModified:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[NSSet isEqual:](self->_compositionAVURLsBeingModified, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_compositionAVURLsBeingModified, a3);
    +[RCComposition _markCompositionAVURLsBeingModified:](RCComposition, "_markCompositionAVURLsBeingModified:", self->_compositionAVURLsBeingModified);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("RCSavedRecordingServiceCompositionAVURLsBeingModifiedDidChangeNotification"), self);

  }
}

- (id)observeFinalizingRecordings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke;
  v23[3] = &unk_1E769D200;
  v7 = v4;
  v25 = v7;
  v8 = v5;
  v24 = v8;
  v9 = (void *)MEMORY[0x1C3B76918](v23);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "compositionAVURLsBeingExported");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_152;
  v19[3] = &unk_1E769D228;
  v20 = v8;
  v21 = v7;
  v11 = v9;
  v22 = v11;
  v12 = v7;
  v13 = v8;
  RCObserveChangesToKeyPath(self, v10, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2_154;
  block[3] = &unk_1E769CC78;
  block[4] = self;
  v18 = v11;
  v15 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return v14;
}

- (void)addInterruptionObserver:(id)a3
{
  -[NSHashTable addObject:](self->_interruptionObservers, "addObject:", a3);
}

- (void)removeInterruptionObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_interruptionObservers, "removeObject:", a3);
}

void __32__RCSSavedRecordingService_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "closeServiceConnection");

}

void __32__RCSSavedRecordingService_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleCompositionAVURLsBeingExportedDidChange");

}

void __32__RCSSavedRecordingService_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleCompositionAVURLsBeingModifiedDidChange");

}

- (void)dealloc
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Deallocating", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

+ (NSPersistentHistoryToken)changeToken
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForKey:", CFSTR("RCSavedRecordingsChangeToken"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSPersistentHistoryToken *)v4;
}

+ (void)setChangeToken:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("RCSavedRecordingsChangeToken"));
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("RCSavedRecordingsChangeToken"));

LABEL_5:
    v3 = v5;
  }

}

void __49__RCSSavedRecordingService_openServiceConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id *v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  OSLogForCategory(CFSTR("Service"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[RCSSavedRecordingService openServiceConnection]_block_invoke";
    _os_log_impl(&dword_1BD830000, v2, OS_LOG_TYPE_DEFAULT, "%s -- service connection closed.", buf, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[7], "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "completionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__RCSSavedRecordingService_openServiceConnection__block_invoke_98;
  v7[3] = &unk_1E769BEE0;
  v8 = v4;
  v9 = WeakRetained;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __49__RCSSavedRecordingService_openServiceConnection__block_invoke_98(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "serviceWasInterrupted:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __49__RCSSavedRecordingService_openServiceConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OSLogForCategory(CFSTR("Service"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[RCSSavedRecordingService openServiceConnection]_block_invoke_2";
    _os_log_impl(&dword_1BD830000, v2, OS_LOG_TYPE_DEFAULT, "%s -- service connection invalidated.", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "closeServiceConnection");

}

- (void)closeServiceConnection
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RCSSavedRecordingService_closeServiceConnection__block_invoke;
  block[3] = &unk_1E769BF30;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __50__RCSSavedRecordingService_closeServiceConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueCloseServiceConnection");
}

- (void)importRecordingWithSourceAudioURL:(id)a3 name:(id)a4 date:(id)a5 userInfo:(id)a6 importCompletionBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  OSLogForCategory(CFSTR("Service"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v13, "url");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v30 = "-[RCSSavedRecordingService importRecordingWithSourceAudioURL:name:date:userInfo:importCompletionBlock:]";
    v31 = 2112;
    v32 = v23;
    v33 = 2112;
    v34 = v14;
    v35 = 2112;
    v36 = v15;
    _os_log_debug_impl(&dword_1BD830000, v18, OS_LOG_TYPE_DEBUG, "%s -- Sending service request to importRecordingWithSourceAudioURL:%@ name:%@ date:%@", buf, 0x2Au);

  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke;
  v24[3] = &unk_1E769CEF0;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  -[RCSSavedRecordingService _sendServiceMessage:importRequestReplyBlock:messagingBlock:](self, "_sendServiceMessage:importRequestReplyBlock:messagingBlock:", a2, v17, v24);

}

void __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = (void *)a1[4];
  v7 = a1[5];
  v9 = a1[6];
  v8 = a1[7];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E769CEC8;
  v12 = v6;
  v13 = v5;
  v10 = v5;
  objc_msgSend(a2, "importRecordingWithSourceAudioURL:name:date:userInfo:importCompletionBlock:", v12, v7, v9, v8, v11);

}

void __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)enableCloudRecordingsWithCompletionBlock:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  OSLogForCategory(CFSTR("Service"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService enableCloudRecordingsWithCompletionBlock:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v5, &__block_literal_global_103);
}

uint64_t __69__RCSSavedRecordingService_enableCloudRecordingsWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableCloudRecordingsWithCompletionBlock:");
}

- (void)importRecordingsFromCloud:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  OSLogForCategory(CFSTR("Service"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService importRecordingsFromCloud:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[RCSSavedRecordingService _sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", a2, 0, v5, &__block_literal_global_105_0);
}

void __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2;
  v6[3] = &unk_1E769CF98;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "importRecordingsFromCloud:", v6);

}

void __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)exportRecordingsToCloud:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  OSLogForCategory(CFSTR("Service"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService exportRecordingsToCloud:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[RCSSavedRecordingService _sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", a2, 0, v5, &__block_literal_global_108);
}

void __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2;
  v6[3] = &unk_1E769CF98;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "exportRecordingsToCloud:", v6);

}

void __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)expungeRecordingsFromCloud:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  OSLogForCategory(CFSTR("Service"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService expungeRecordingsFromCloud:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[RCSSavedRecordingService _sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", a2, 0, v5, &__block_literal_global_110);
}

void __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2;
  v6[3] = &unk_1E769CF98;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "expungeRecordingsFromCloud:", v6);

}

void __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (id)prepareToCaptureToCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke;
  v17[3] = &unk_1E769D000;
  v9 = v7;
  v18 = v9;
  v19 = &v27;
  v20 = &v21;
  v10 = (void *)MEMORY[0x1C3B76918](v17);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_115;
  v15[3] = &unk_1E769D028;
  v11 = v9;
  v16 = v11;
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v10, v15);
  v12 = (void *)v28[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v12 = (void *)v28[5];
  }
  v13 = v12;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_cold_2();
  }
  else if (v8)
  {
    __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

uint64_t __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_115(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepareToCaptureToCompositionAVURL:accessRequestHandler:", *(_QWORD *)(a1 + 32), a3);
}

- (void)prepareToCaptureToCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a4;
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService prepareToCaptureToCompositionAVURL:accessRequestHandler:].cold.1(v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke;
  v11[3] = &unk_1E769D028;
  v12 = v7;
  v10 = v7;
  -[RCSSavedRecordingService _sendServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v8, v11);

}

void __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2;
  v8[3] = &unk_1E769D050;
  v9 = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "prepareToCaptureToCompositionAVURL:accessRequestHandler:", v9, v8);

}

void __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (id)openAudioFile:(id)a3 settings:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__9;
  v40 = __Block_byref_object_dispose__9;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__9;
  v34 = __Block_byref_object_dispose__9;
  v35 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke;
  v26[3] = &unk_1E769D000;
  v15 = v11;
  v27 = v15;
  v28 = &v36;
  v29 = &v30;
  v16 = (void *)MEMORY[0x1C3B76918](v26);
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_120;
  v22[3] = &unk_1E769D078;
  v17 = v15;
  v23 = v17;
  v18 = v12;
  v24 = v18;
  v19 = v13;
  v25 = v19;
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v16, v22);
  if (v37[5])
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setFileToken:", v37[5]);
  }
  else
  {
    v20 = 0;
    if (a6)
      *a6 = objc_retainAutorelease((id)v31[5]);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v20;
}

void __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_cold_2();
  }
  else if (v8)
  {
    __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

uint64_t __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_120(_QWORD *a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "openAudioFile:settings:metadata:accessRequestHandler:", a1[4], a1[5], a1[6], a3);
}

- (void)openAudioFile:(id)a3 settings:(id)a4 metadata:(id)a5 accessRequestHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  OSLogForCategory(CFSTR("Service"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService openAudioFile:settings:metadata:accessRequestHandler:].cold.1(v11);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke;
  v19[3] = &unk_1E769D078;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  -[RCSSavedRecordingService _sendServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v14, v19);

}

void __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2;
  v10[3] = &unk_1E769D050;
  v11 = v6;
  v12 = v5;
  v9 = v5;
  objc_msgSend(a2, "openAudioFile:settings:metadata:accessRequestHandler:", v11, v7, v8, v10);

}

void __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (BOOL)closeAudioFile:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  objc_msgSend(v7, "fileToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__9;
    v21 = __Block_byref_object_dispose__9;
    v22 = 0;
    OSLogForCategory(CFSTR("Service"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[RCSSavedRecordingService closeAudioFile:error:].cold.1();

    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__RCSSavedRecordingService_closeAudioFile_error___block_invoke;
    v16[3] = &unk_1E769D0A0;
    v16[4] = &v17;
    v11 = (void *)MEMORY[0x1C3B76918](v16);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __49__RCSSavedRecordingService_closeAudioFile_error___block_invoke_2;
    v14[3] = &unk_1E769D0C8;
    v15 = v8;
    -[RCSSavedRecordingService _sendSynchronousServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendSynchronousServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v11, v14);
    if (a4)
      *a4 = objc_retainAutorelease((id)v18[5]);
    v12 = v18[5] == 0;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __49__RCSSavedRecordingService_closeAudioFile_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __49__RCSSavedRecordingService_closeAudioFile_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "closeAudioFile:completionBlock:", *(_QWORD *)(a1 + 32), a3);
}

- (void)closeAudioFile:(id)a3 completionBlock:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  NSObject *v9;
  _QWORD v10[4];
  id v11;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService closeAudioFile:completionBlock:].cold.1();

  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__RCSSavedRecordingService_closeAudioFile_completionBlock___block_invoke;
    v10[3] = &unk_1E769D0C8;
    v11 = v7;
    -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v8, v10);

  }
  else
  {
    v8[2](v8, 0);
  }

}

uint64_t __59__RCSSavedRecordingService_closeAudioFile_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "closeAudioFile:completionBlock:", *(_QWORD *)(a1 + 32), a3);
}

- (void)writeAudioFile:(id)a3 buffer:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v9 = a3;
  v10 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__RCSSavedRecordingService_writeAudioFile_buffer_completionBlock___block_invoke;
  v13[3] = &unk_1E769D0F0;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, a5, v13);

}

uint64_t __66__RCSSavedRecordingService_writeAudioFile_buffer_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "writeAudioFile:buffer:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (id)prepareToPreviewCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke;
  v17[3] = &unk_1E769D000;
  v9 = v7;
  v18 = v9;
  v19 = &v27;
  v20 = &v21;
  v10 = (void *)MEMORY[0x1C3B76918](v17);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_126;
  v15[3] = &unk_1E769D028;
  v11 = v9;
  v16 = v11;
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v10, v15);
  v12 = (void *)v28[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v12 = (void *)v28[5];
  }
  v13 = v12;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_cold_2();
  }
  else if (v8)
  {
    __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

uint64_t __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_126(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepareToPreviewCompositionAVURL:accessRequestHandler:", *(_QWORD *)(a1 + 32), a3);
}

- (void)prepareToPreviewCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a4;
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService prepareToPreviewCompositionAVURL:accessRequestHandler:].cold.1(v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke;
  v11[3] = &unk_1E769D028;
  v12 = v7;
  v10 = v7;
  -[RCSSavedRecordingService _sendServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v8, v11);

}

void __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2;
  v8[3] = &unk_1E769D050;
  v9 = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "prepareToPreviewCompositionAVURL:accessRequestHandler:", v9, v8);

}

void __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (id)prepareToExportCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke;
  v17[3] = &unk_1E769D000;
  v9 = v7;
  v18 = v9;
  v19 = &v27;
  v20 = &v21;
  v10 = (void *)MEMORY[0x1C3B76918](v17);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_130;
  v15[3] = &unk_1E769D028;
  v11 = v9;
  v16 = v11;
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v10, v15);
  v12 = (void *)v28[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v12 = (void *)v28[5];
  }
  v13 = v12;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_cold_2();
  }
  else if (v8)
  {
    __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

uint64_t __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_130(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepareToExportCompositionAVURL:accessRequestHandler:", *(_QWORD *)(a1 + 32), a3);
}

- (void)prepareToExportCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a4;
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService prepareToExportCompositionAVURL:accessRequestHandler:].cold.1(v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke;
  v11[3] = &unk_1E769D028;
  v12 = v7;
  v10 = v7;
  -[RCSSavedRecordingService _sendServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v8, v11);

}

void __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2;
  v8[3] = &unk_1E769D050;
  v9 = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "prepareToExportCompositionAVURL:accessRequestHandler:", v9, v8);

}

void __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (id)prepareToTrimCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__9;
  v31 = __Block_byref_object_dispose__9;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke;
  v17[3] = &unk_1E769D000;
  v9 = v7;
  v18 = v9;
  v19 = &v27;
  v20 = &v21;
  v10 = (void *)MEMORY[0x1C3B76918](v17);
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_134;
  v15[3] = &unk_1E769D028;
  v11 = v9;
  v16 = v11;
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendSynchronousServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v10, v15);
  v12 = (void *)v28[5];
  if (a4 && !v12)
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v12 = (void *)v28[5];
  }
  v13 = v12;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

void __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_cold_2();
  }
  else if (v8)
  {
    __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_cold_1();
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;

}

uint64_t __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_134(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "prepareToTrimCompositionAVURL:accessRequestHandler:", *(_QWORD *)(a1 + 32), a3);
}

- (void)prepareToTrimCompositionAVURL:(id)a3 accessRequestHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a4;
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService prepareToTrimCompositionAVURL:accessRequestHandler:].cold.1(v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke;
  v11[3] = &unk_1E769D028;
  v12 = v7;
  v10 = v7;
  -[RCSSavedRecordingService _sendServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, v8, v11);

}

void __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2;
  v8[3] = &unk_1E769D050;
  v9 = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "prepareToTrimCompositionAVURL:accessRequestHandler:", v9, v8);

}

void __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  OSLogForCategory(CFSTR("Service"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2();
  }
  else if (v8)
  {
    __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1();
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (BOOL)endAccessSessionWithToken:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v8 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__RCSSavedRecordingService_endAccessSessionWithToken_error___block_invoke;
  v15[3] = &unk_1E769D0A0;
  v15[4] = &v16;
  v9 = (void *)MEMORY[0x1C3B76918](v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __60__RCSSavedRecordingService_endAccessSessionWithToken_error___block_invoke_2;
  v13[3] = &unk_1E769D0C8;
  v10 = v7;
  v14 = v10;
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendSynchronousServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v9, v13);
  v11 = (void *)v17[5];
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  _Block_object_dispose(&v16, 8);
  return v11 == 0;
}

void __60__RCSSavedRecordingService_endAccessSessionWithToken_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __60__RCSSavedRecordingService_endAccessSessionWithToken_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "endAccessSessionWithToken:completionBlock:", *(_QWORD *)(a1 + 32), a3);
}

- (void)endAccessSessionWithToken:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;

  v7 = a3;
  if (v7)
  {
    v8 = a4;
    OSLogForCategory(CFSTR("Service"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[RCSSavedRecordingService endAccessSessionWithToken:completionBlock:].cold.1();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__RCSSavedRecordingService_endAccessSessionWithToken_completionBlock___block_invoke;
    v10[3] = &unk_1E769D0C8;
    v11 = v7;
    -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v8, v10);

  }
}

uint64_t __70__RCSSavedRecordingService_endAccessSessionWithToken_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "endAccessSessionWithToken:completionBlock:", *(_QWORD *)(a1 + 32), a3);
}

- (BOOL)disableOrphanedFragmentCleanupForCompositionAVURL:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  v8 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_error___block_invoke;
  v15[3] = &unk_1E769D0A0;
  v15[4] = &v16;
  v9 = (void *)MEMORY[0x1C3B76918](v15);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __84__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_error___block_invoke_2;
  v13[3] = &unk_1E769D0C8;
  v10 = v7;
  v14 = v10;
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendSynchronousServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v9, v13);
  v11 = (void *)v17[5];
  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  _Block_object_dispose(&v16, 8);
  return v11 == 0;
}

void __84__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __84__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "disableOrphanedFragmentCleanupForCompositionAVURL:completionBlock:", *(_QWORD *)(a1 + 32), a3);
}

- (void)disableOrphanedFragmentCleanupForCompositionAVURL:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a4;
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService disableOrphanedFragmentCleanupForCompositionAVURL:completionBlock:].cold.1(v7);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __94__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_completionBlock___block_invoke;
  v11[3] = &unk_1E769D0C8;
  v12 = v7;
  v10 = v7;
  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v8, v11);

}

uint64_t __94__RCSSavedRecordingService_disableOrphanedFragmentCleanupForCompositionAVURL_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "disableOrphanedFragmentCleanupForCompositionAVURL:completionBlock:", *(_QWORD *)(a1 + 32), a3);
}

- (void)enableOrphanedFragmentCleanupForCompositionAVURL:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  OSLogForCategory(CFSTR("Service"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService enableOrphanedFragmentCleanupForCompositionAVURL:].cold.1(v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__RCSSavedRecordingService_enableOrphanedFragmentCleanupForCompositionAVURL___block_invoke;
  v8[3] = &unk_1E769D028;
  v9 = v5;
  v7 = v5;
  -[RCSSavedRecordingService _sendServiceMessage:accessRequestReplyBlock:messagingBlock:](self, "_sendServiceMessage:accessRequestReplyBlock:messagingBlock:", a2, 0, v8);

}

uint64_t __77__RCSSavedRecordingService_enableOrphanedFragmentCleanupForCompositionAVURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enableOrphanedFragmentCleanupForCompositionAVURL:", *(_QWORD *)(a1 + 32));
}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingExported___block_invoke_2;
  v8[3] = &unk_1E769D160;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a2, "fetchCompositionAVURLsBeingExported:", v8);

}

void __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke_139(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__RCSSavedRecordingService_fetchCompositionAVURLsBeingModified___block_invoke_2;
  v8[3] = &unk_1E769D160;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a2, "fetchCompositionAVURLsBeingModified:", v8);

}

- (void)_fetchAllAccessTokens:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *completionQueue;
  _QWORD block[4];
  id v15;

  v4 = a3;
  OSLogForCategory(CFSTR("Service"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService _fetchAllAccessTokens:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  if (v4)
  {
    completionQueue = self->_completionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__RCSSavedRecordingService__fetchAllAccessTokens___block_invoke;
    block[3] = &unk_1E769C228;
    v15 = v4;
    dispatch_async(completionQueue, block);

  }
}

void __50__RCSSavedRecordingService__fetchAllAccessTokens___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)__fetchAllAccessTokens:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v5 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__9;
  v21[4] = __Block_byref_object_dispose__9;
  v6 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke;
  v18[3] = &unk_1E769D1B0;
  v20 = v21;
  v7 = v5;
  v19 = v7;
  v8 = (void *)MEMORY[0x1C3B76918](v18);
  OSLogForCategory(CFSTR("Service"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService __fetchAllAccessTokens:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke_141;
  v17[3] = &unk_1E769D188;
  v17[4] = v21;
  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v8, v17);

  _Block_object_dispose(v21, 8);
}

void __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke_2;
  v8[3] = &unk_1E769D160;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a2, "_fetchAllAccessTokens:", v8);

}

void __51__RCSSavedRecordingService___fetchAllAccessTokens___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  void *v14;
  void *v15;
  id obj;
  _QWORD handler[4];
  id v18;
  id v19;
  int out_token;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        +[RCComposition compositionLoadedForComposedAVURL:createIfNeeded:](RCComposition, "compositionLoadedForComposedAVURL:createIfNeeded:", v7, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "savedRecordingUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("RCFinalizationProgressNotificationName"), v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          out_token = 0;
          v11 = objc_retainAutorelease(v10);
          v12 = (const char *)objc_msgSend(v11, "UTF8String");
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2;
          handler[3] = &unk_1E769D1D8;
          v13 = v9;
          v18 = v13;
          v19 = *(id *)(a1 + 40);
          if (!notify_register_dispatch(v12, &out_token, MEMORY[0x1E0C80D38], handler))
          {
            v25[0] = CFSTR("recordingID");
            v25[1] = CFSTR("token");
            v26[0] = v13;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v26[1] = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v15, v7);

          }
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v4);
  }

}

uint64_t __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2(uint64_t a1, int token)
{
  NSObject *v3;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  OSLogForCategory(CFSTR("Service"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2_cold_1();

  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 40) + 16))(*(float *)&state64);
}

void __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_152(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getChange(v5, *MEMORY[0x1E0CB2CC8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getChange(v5, *MEMORY[0x1E0CB2CB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v22 = v6;
    v23 = v5;
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    v21 = v7;
    objc_msgSend(v8, "minusSet:", v7);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("recordingID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(float))(*(_QWORD *)(a1 + 40) + 16))(1.0);
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("token"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "intValue");

            notify_cancel(v19);
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, v14);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v6 = v22;
    v5 = v23;
    v7 = v21;
  }
  if (objc_msgSend(v7, "count"))
  {
    v20 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v20, "minusSet:", v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2_154(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "compositionAVURLsBeingExported");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)checkRecordingAvailability:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__RCSSavedRecordingService_checkRecordingAvailability___block_invoke;
  v6[3] = &unk_1E769D250;
  v7 = v4;
  v5 = v4;
  -[RCSSavedRecordingService __fetchAllAccessTokens:](self, "__fetchAllAccessTokens:", v6);

}

void __55__RCSSavedRecordingService_checkRecordingAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
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
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "accessName", (_QWORD)v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("capture"));

      if ((v9 & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reloadExistingSearchMetadataWithCompletionBlock:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  OSLogForCategory(CFSTR("Service"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService reloadExistingSearchMetadataWithCompletionBlock:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v5, &__block_literal_global_155);
}

uint64_t __76__RCSSavedRecordingService_reloadExistingSearchMetadataWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadExistingSearchMetadataWithCompletionBlock:");
}

- (void)clearAndReloadSearchMetadataWithCompletionBlock:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  OSLogForCategory(CFSTR("Service"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RCSSavedRecordingService clearAndReloadSearchMetadataWithCompletionBlock:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v5, &__block_literal_global_156);
}

uint64_t __76__RCSSavedRecordingService_clearAndReloadSearchMetadataWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearAndReloadSearchMetadataWithCompletionBlock:");
}

- (void)updateSearchMetadataWithRecordingURIsToInsert:(id)a3 recordingURIsToUpdate:(id)a4 recordingURIsToDelete:(id)a5 completionBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, _QWORD))a6;
  v15 = objc_msgSend(v11, "count");
  v16 = objc_msgSend(v12, "count") + v15;
  if (v16 + objc_msgSend(v13, "count"))
  {
    OSLogForCategory(CFSTR("Service"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = (void *)MEMORY[0x1C3B76918](v14);
      *(_DWORD *)buf = 136316162;
      v24 = "-[RCSSavedRecordingService updateSearchMetadataWithRecordingURIsToInsert:recordingURIsToUpdate:recordingURIs"
            "ToDelete:completionBlock:]";
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v13;
      v31 = 2112;
      v32 = v18;
      _os_log_debug_impl(&dword_1BD830000, v17, OS_LOG_TYPE_DEBUG, "%s -- Sending service request to updateSearchMetadataWithRecordingURIsToInsert:%@ recordingURIsToUpdate:%@ recordingURIsToDelete:%@ completionBlock:%@", buf, 0x34u);

    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __134__RCSSavedRecordingService_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock___block_invoke;
    v19[3] = &unk_1E769D298;
    v20 = v11;
    v21 = v12;
    v22 = v13;
    -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, v14, v19);

  }
  else if (v14)
  {
    v14[2](v14, 0);
  }

}

uint64_t __134__RCSSavedRecordingService_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "updateSearchMetadataWithRecordingURIsToInsert:recordingURIsToUpdate:recordingURIsToDelete:completionBlock:", a1[4], a1[5], a1[6], a3);
}

- (void)removeAllUserDataWithCompletion:(id)a3
{
  -[RCSSavedRecordingService _sendServiceMessage:withBasicReplyBlock:messagingBlock:](self, "_sendServiceMessage:withBasicReplyBlock:messagingBlock:", a2, a3, &__block_literal_global_157_0);
}

uint64_t __60__RCSSavedRecordingService_removeAllUserDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllUserDataWithCompletion:");
}

void __40__RCSSavedRecordingService_serviceProxy__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  OSLogForCategory(CFSTR("Service"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __40__RCSSavedRecordingService_serviceProxy__block_invoke_2_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = *(NSObject **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__RCSSavedRecordingService_serviceProxy__block_invoke_158;
  v9[3] = &unk_1E769BEE0;
  v10 = WeakRetained;
  v11 = v3;
  v7 = v3;
  v8 = WeakRetained;
  dispatch_async(v6, v9);

}

uint64_t __40__RCSSavedRecordingService_serviceProxy__block_invoke_158(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueInvalidatePendingCompletionHandlersWithError:", *(_QWORD *)(a1 + 40));
}

- (id)synchronousServiceProxy
{
  OS_dispatch_queue *serialQueue;
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke;
  v6[3] = &unk_1E769BF80;
  v6[4] = self;
  v6[5] = &v7;
  v3 = serialQueue;
  dispatch_sync(v3, v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "openServiceConnection");
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke_2;
    v6[3] = &unk_1E769D308;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  OSLogForCategory(CFSTR("Service"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke_2_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidatePendingSynchronousCompletionHandlersWithError:", v3);

}

- (void)_onQueueCloseServiceConnection
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

  -[RCSSavedRecordingService _onQueueInvalidatePendingCompletionHandlersWithError:](self, "_onQueueInvalidatePendingCompletionHandlersWithError:", 0);
}

- (void)_sendServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 withServiceProxy:(id)a6 messagingBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, id, _QWORD *);
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  NSObject *serialQueue;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD *v24;
  id v25[2];
  _QWORD block[5];
  id v27;
  id v28;
  _QWORD *v29;
  id v30;
  id location;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, id, _QWORD *))a7;
  v16 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke;
  v34[3] = &unk_1E769D330;
  v17 = v13;
  v35 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B76918](v34);
  if (v14)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__9;
    v32[4] = __Block_byref_object_dispose__9;
    v33 = 0;
    objc_initWeak(&location, self);
    serialQueue = self->_serialQueue;
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_2;
    block[3] = &unk_1E769D3A8;
    v29 = v32;
    block[4] = self;
    objc_copyWeak(&v30, &location);
    v20 = v18;
    v28 = v20;
    v27 = v12;
    dispatch_sync(serialQueue, block);
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5;
    v22[3] = &unk_1E769D3D0;
    objc_copyWeak(v25, &location);
    v25[1] = (id)a3;
    v24 = v32;
    v23 = v20;
    v15[2](v15, v14, v22);

    objc_destroyWeak(v25);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    _Block_object_dispose(v32, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSSavedRecordingServiceErrorDomain"), 201, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v18)[2](v18, 0, v21);

  }
}

uint64_t __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_3;
  v6[3] = &unk_1E769D380;
  objc_copyWeak(&v9, (id *)(a1 + 64));
  v8 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_onQueueAddPendingServiceMessageReplyBlockInvalidationHandler:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_destroyWeak(&v9);
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_3(id *a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSSavedRecordingServiceErrorDomain"), 202, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_4;
    block[3] = &unk_1E769D358;
    v9 = a1[5];
    v7 = a1[4];
    v3 = v3;
    v8 = v3;
    dispatch_async(v5, block);

  }
}

uint64_t __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  uint64_t v23;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = RCTestSlowMessageServiceSleepAmount();
    if (v8 > 0.0)
    {
      v9 = v8;
      OSLogForCategory(CFSTR("Service"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5_cold_2(a1, v10);

      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v9);
      OSLogForCategory(CFSTR("Service"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5_cold_1(a1);

    }
    v12 = WeakRetained[1];
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_163;
    block[3] = &unk_1E769BF08;
    v14 = WeakRetained;
    v15 = *(_QWORD *)(a1 + 40);
    v22 = v14;
    v23 = v15;
    dispatch_sync(v12, block);
    v16 = v14[2];
    v17[0] = v13;
    v17[1] = 3221225472;
    v17[2] = __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_2_164;
    v17[3] = &unk_1E769D358;
    v20 = *(id *)(a1 + 32);
    v18 = v5;
    v19 = v6;
    dispatch_async(v16, v17);

  }
}

uint64_t __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_163(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueRemovePendingServiceMessageReplyBlockInvalidationHandlerForToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_2_164(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_sendServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 messagingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[RCSSavedRecordingService serviceProxy](self, "serviceProxy");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[RCSSavedRecordingService _sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:withServiceProxy:messagingBlock:](self, "_sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:withServiceProxy:messagingBlock:", a3, v12, v11, v13, v10);

}

- (void)_sendSynchronousServiceMessage:(SEL)a3 connectionFailureReplyInfo:(id)a4 infoAndErrorReplyHandler:(id)a5 messagingBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *, _QWORD *);
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  id v25[2];
  id location;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;

  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, _QWORD *))a6;
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke;
  v30[3] = &unk_1E769D330;
  v14 = v11;
  v31 = v14;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B76918](v30);
  -[RCSSavedRecordingService synchronousServiceProxy](self, "synchronousServiceProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_2;
    v27[3] = &unk_1E769D3F8;
    v18 = v15;
    v29 = v18;
    v21 = v10;
    v28 = v10;
    v19 = (void *)MEMORY[0x1C3B76918](v27);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingSynchronousServiceCompletionHandlers, "setObject:forKeyedSubscript:", v19, v17);

    objc_initWeak(&location, self);
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3;
    v22[3] = &unk_1E769D420;
    objc_copyWeak(v25, &location);
    v25[1] = (id)a3;
    v22[4] = self;
    v20 = v17;
    v23 = v20;
    v24 = v18;
    v12[2](v12, v16, v22);

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);

    v10 = v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSSavedRecordingServiceErrorDomain"), 201, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v15)[2](v15, 0, v20);
  }

}

uint64_t __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSSavedRecordingServiceErrorDomain"), 202, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = RCTestSlowMessageServiceSleepAmount();
    if (v8 > 0.0)
    {
      v9 = v8;
      OSLogForCategory(CFSTR("Service"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3_cold_2(a1, v10);

      objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", v9);
      OSLogForCategory(CFSTR("Service"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3_cold_1(a1);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)_sendServiceMessage:(SEL)a3 accessRequestReplyBlock:(id)a4 messagingBlock:(id)a5
{
  -[RCSSavedRecordingService _sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", a3, 0, a4, a5);
}

- (void)_sendSynchronousServiceMessage:(SEL)a3 accessRequestReplyBlock:(id)a4 messagingBlock:(id)a5
{
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendSynchronousServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", a3, 0, a4, a5);
}

- (void)_sendServiceMessage:(SEL)a3 importRequestReplyBlock:(id)a4 messagingBlock:(id)a5
{
  -[RCSSavedRecordingService _sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", a3, 0, a4, a5);
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RCSSavedRecordingServiceErrorDomain"), 202, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = WeakRetained[2];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_4;
    v6[3] = &unk_1E769C808;
    v8 = *(id *)(a1 + 32);
    v3 = v3;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueueRemovePendingServiceMessageReplyBlockInvalidationHandlerForToken:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_2_168(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_sendSynchronousServiceMessage:(SEL)a3 withBasicReplyBlock:(id)a4 messagingBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke;
  v20[3] = &unk_1E769D330;
  v21 = v8;
  v11 = v8;
  v12 = (void *)MEMORY[0x1C3B76918](v20);
  v15 = v10;
  v16 = 3221225472;
  v17 = __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke_2;
  v18 = &unk_1E769D4E8;
  v19 = v9;
  v13 = v9;
  v14 = (void *)MEMORY[0x1C3B76918](&v15);
  -[RCSSavedRecordingService _sendSynchronousServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendSynchronousServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", a3, 0, v12, v14, v15, v16, v17, v18);

}

uint64_t __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

void __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, _QWORD *);
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke_3;
  v9[3] = &unk_1E769D448;
  v10 = v5;
  v7 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v6 + 16);
  v8 = v5;
  v7(v6, a2, v9);

}

uint64_t __94__RCSSavedRecordingService__sendSynchronousServiceMessage_withBasicReplyBlock_messagingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_onQueueInvalidatePendingCompletionHandlersWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *completionQueue;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[NSMutableDictionary allValues](self->_pendingServiceCompletionHandlers, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[NSMutableDictionary removeAllObjects](self->_pendingServiceCompletionHandlers, "removeAllObjects");
  if (objc_msgSend(v6, "count"))
  {
    OSLogForCategory(CFSTR("Service"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[RCSSavedRecordingService _onQueueInvalidatePendingCompletionHandlersWithError:].cold.1(v6);

    completionQueue = self->_completionQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__RCSSavedRecordingService__onQueueInvalidatePendingCompletionHandlersWithError___block_invoke;
    v9[3] = &unk_1E769BEE0;
    v10 = v6;
    v11 = v4;
    dispatch_async(completionQueue, v9);

  }
}

void __81__RCSSavedRecordingService__onQueueInvalidatePendingCompletionHandlersWithError___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_onQueueInvalidatePendingCompletionHandlerWithToken:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *completionQueue;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_pendingServiceCompletionHandlers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_pendingServiceCompletionHandlers, "removeObjectForKey:", v6);
    completionQueue = self->_completionQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __90__RCSSavedRecordingService__onQueueInvalidatePendingCompletionHandlerWithToken_withError___block_invoke;
    v10[3] = &unk_1E769C808;
    v12 = v8;
    v11 = v7;
    dispatch_async(completionQueue, v10);

  }
}

uint64_t __90__RCSSavedRecordingService__onQueueInvalidatePendingCompletionHandlerWithToken_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_invalidatePendingSynchronousCompletionHandlersWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary allValues](self->_pendingSynchronousServiceCompletionHandlers, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[NSMutableDictionary removeAllObjects](self->_pendingSynchronousServiceCompletionHandlers, "removeAllObjects");
  if (objc_msgSend(v6, "count"))
  {
    OSLogForCategory(CFSTR("Service"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[RCSSavedRecordingService _invalidatePendingSynchronousCompletionHandlersWithError:].cold.1(v6);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)valueForServiceKey:(id)a3 completion:(id)a4
{
  -[RCSSavedRecordingService _valueForServiceKey:synchronous:completion:](self, "_valueForServiceKey:synchronous:completion:", a3, 0, a4);
}

- (void)_valueForServiceKey:(id)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  v6 = a4;
  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__RCSSavedRecordingService__valueForServiceKey_synchronous_completion___block_invoke;
  v11[3] = &unk_1E769D510;
  v11[4] = v8;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3B76918](v11);
  if (v6)
    -[RCSSavedRecordingService _sendSynchronousServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendSynchronousServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", sel_valueForServiceKey_completion_, 0, v9, v10);
  else
    -[RCSSavedRecordingService _sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:](self, "_sendServiceMessage:connectionFailureReplyInfo:infoAndErrorReplyHandler:messagingBlock:", sel_valueForServiceKey_completion_, 0, v9, v10);

}

void __71__RCSSavedRecordingService__valueForServiceKey_synchronous_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__RCSSavedRecordingService__valueForServiceKey_synchronous_completion___block_invoke_2;
  v8[3] = &unk_1E769D330;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "valueForServiceKey:completion:", v6, v8);

}

uint64_t __71__RCSSavedRecordingService__valueForServiceKey_synchronous_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)valueForServiceKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__9;
  v12 = __Block_byref_object_dispose__9;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__RCSSavedRecordingService_valueForServiceKey___block_invoke;
  v7[3] = &unk_1E769D538;
  v7[4] = v4;
  v7[5] = &v8;
  -[RCSSavedRecordingService _valueForServiceKey:synchronous:completion:](self, "_valueForServiceKey:synchronous:completion:", v4, 1, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __47__RCSSavedRecordingService_valueForServiceKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 && v6)
  {
    OSLogForCategory(CFSTR("Service"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __47__RCSSavedRecordingService_valueForServiceKey___block_invoke_cold_1();

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;

}

- (id)encryptedAccountStatus
{
  return -[RCSSavedRecordingService valueForServiceKey:](self, "valueForServiceKey:", CFSTR("accountStatus"));
}

- (id)encryptedFieldsStatus
{
  return -[RCSSavedRecordingService valueForServiceKey:](self, "valueForServiceKey:", CFSTR("encryptedFieldsStatus"));
}

- (BOOL)firstImportIsComplete
{
  void *v2;
  char v3;

  -[RCSSavedRecordingService valueForServiceKey:](self, "valueForServiceKey:", CFSTR("firstImportIsComplete"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSSet)compositionAVURLsBeingModified
{
  return self->_compositionAVURLsBeingModified;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositionAVURLsBeingModified, 0);
  objc_storeStrong((id *)&self->_compositionAVURLsBeingExported, 0);
  objc_storeStrong((id *)&self->_pendingSynchronousServiceCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_pendingServiceCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_interruptionObservers, 0);
  objc_storeStrong((id *)&self->_synchronousServiceProxy, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2_cold_1()
{
  NSObject *v0;
  int v1[10];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  v1[0] = 136315650;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10(&dword_1BD830000, v0, (uint64_t)v0, "%s -- Failed to import %@, error = %@", (uint8_t *)v1);
  OUTLINED_FUNCTION_8();
}

void __103__RCSSavedRecordingService_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  v2[0] = 136315394;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Imported %@ successfully", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

- (void)enableCloudRecordingsWithCompletionBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to enableRecordingsInCloudWithCompletionBlock:", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)importRecordingsFromCloud:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to importRecordingsFromCloud", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Imported from iCloud successfully, changesMade = %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void __54__RCSSavedRecordingService_importRecordingsFromCloud___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Failed to import from iCloud, error = %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

- (void)exportRecordingsToCloud:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to exportRecordingsToCloud", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Exported from iCloud successfully, changesMade = %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void __52__RCSSavedRecordingService_exportRecordingsToCloud___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Failed to export to iCloud, error = %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

- (void)expungeRecordingsFromCloud:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to expungeCompletionBlock", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Exported from iCloud successfully, changesMade = %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void __55__RCSSavedRecordingService_expungeRecordingsFromCloud___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Failed to expunge to iCloud, error = %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __69__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_error___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)prepareToCaptureToCompositionAVURL:(void *)a1 accessRequestHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- Sending service request to begin capture session for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

void __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __84__RCSSavedRecordingService_prepareToCaptureToCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __66__RCSSavedRecordingService_openAudioFile_settings_metadata_error___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)openAudioFile:(void *)a1 settings:metadata:accessRequestHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- Sending service request to open audio file %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

void __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __81__RCSSavedRecordingService_openAudioFile_settings_metadata_accessRequestHandler___block_invoke_2_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)closeAudioFile:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Sending service request to close audio file: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

- (void)closeAudioFile:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Sending service request to close audio file: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __67__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_error___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)prepareToPreviewCompositionAVURL:(void *)a1 accessRequestHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- Sending service request to begin preview session for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

void __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __82__RCSSavedRecordingService_prepareToPreviewCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __66__RCSSavedRecordingService_prepareToExportCompositionAVURL_error___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)prepareToExportCompositionAVURL:(void *)a1 accessRequestHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- Sending service request to begin export session for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

void __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __81__RCSSavedRecordingService_prepareToExportCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __64__RCSSavedRecordingService_prepareToTrimCompositionAVURL_error___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)prepareToTrimCompositionAVURL:(void *)a1 accessRequestHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- Sending service request to begin trimming session for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

void __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Failed to acquire %@ session for '%@', error = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

void __79__RCSSavedRecordingService_prepareToTrimCompositionAVURL_accessRequestHandler___block_invoke_2_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_10_0();
  objc_msgSend((id)OUTLINED_FUNCTION_9_0(v0, *MEMORY[0x1E0C80C00]), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1BD830000, v2, v3, "%s -- Acquired %@ session for '%@' with token = %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_0();
}

- (void)endAccessSessionWithToken:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BD830000, v0, v1, "%s -- Sending service request to end session: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

- (void)disableOrphanedFragmentCleanupForCompositionAVURL:(void *)a1 completionBlock:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- Sending service request to disableOrphanedFragmentCleanupForCompositionAVURL: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

- (void)enableOrphanedFragmentCleanupForCompositionAVURL:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- Sending service request to enableOrphanedFragmentCleanupForCompositionAVURL: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

- (void)enableOrphanHandlingWithCompletionBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to enableOrphanHandlingWithCompletionBlock", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)fetchCompositionAVURLsBeingExported:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to fetchCompositionAVURLsBeingExported", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)fetchCompositionAVURLsBeingModified:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to fetchCompositionAVURLsBeingModified", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)_fetchAllAccessTokens:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Illegal call to _fetchAllAccessTokens from outside VoiceMemos.framework", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)__fetchAllAccessTokens:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to _fetchAllAccessTokens", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __56__RCSSavedRecordingService_observeFinalizingRecordings___block_invoke_2_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  int v2[5];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_7();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_10(&dword_1BD830000, v1, (uint64_t)v1, "%s -- recordingID = %@, progress = %f", (uint8_t *)v2);
  OUTLINED_FUNCTION_8();
}

- (void)reloadExistingSearchMetadataWithCompletionBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to reloadExistingSearchMetadataWithCompletionBlock", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

- (void)clearAndReloadSearchMetadataWithCompletionBlock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1BD830000, a1, a3, "%s -- Sending service request to clearAndReloadSearchMetadataWithCompletionBlock", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __40__RCSSavedRecordingService_serviceProxy__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- An error occurred while waiting for a reply from the service. Error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __51__RCSSavedRecordingService_synchronousServiceProxy__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1BD830000, v0, v1, "%s -- An error occurred while waiting for a reply from the service. Error = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_0();
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(*(SEL *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- WARNING: finished delay of %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

void __132__RCSSavedRecordingService__sendServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_withServiceProxy_messagingBlock___block_invoke_5_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1BD830000, a2, v4, "%s -- WARNING: begin delay of %@ %.2fs to simulate slow processing…", (uint8_t *)v5);

  OUTLINED_FUNCTION_15();
}

void __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(*(SEL *)(a1 + 64));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- WARNING: finished delay of %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

void __126__RCSSavedRecordingService__sendSynchronousServiceMessage_connectionFailureReplyInfo_infoAndErrorReplyHandler_messagingBlock___block_invoke_3_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1BD830000, a2, v4, "%s -- WARNING: begin delay of %@ %.2fs to simulate slow processing…", (uint8_t *)v5);

  OUTLINED_FUNCTION_15();
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(*(SEL *)(a1 + 56));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v2, v3, "%s -- WARNING: finished delay of %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

void __100__RCSSavedRecordingService__sendServiceMessage_withBasicReplyBlock_withServiceProxy_messagingBlock___block_invoke_5_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315650;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1BD830000, a2, v4, "%s -- WARNING: begin delay of %@ %.2fs to simulate slow processing…", (uint8_t *)v5);

  OUTLINED_FUNCTION_15();
}

- (void)_onQueueInvalidatePendingCompletionHandlersWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v1, v2, "%s -- invalidating %ld reply blocks ...", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

- (void)_invalidatePendingSynchronousCompletionHandlersWithError:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_5_0(&dword_1BD830000, v1, v2, "%s -- invalidating %ld synchronous reply blocks ...", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_7_0();
}

void __47__RCSSavedRecordingService_valueForServiceKey___block_invoke_cold_1()
{
  os_log_t v0;
  int v1[10];

  OUTLINED_FUNCTION_20(*MEMORY[0x1E0C80C00]);
  v1[0] = 136315650;
  OUTLINED_FUNCTION_16();
  _os_log_error_impl(&dword_1BD830000, v0, OS_LOG_TYPE_ERROR, "%s -- failed to get value for %@, error = %@", (uint8_t *)v1, 0x20u);
  OUTLINED_FUNCTION_8();
}

@end
