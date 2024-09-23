@implementation VCVoiceShortcutClient

void __39__VCVoiceShortcutClient_standardClient__block_invoke()
{
  VCVoiceShortcutClient *v0;
  void *v1;

  v0 = -[VCVoiceShortcutClient initWithMachServiceName:options:interfaceSetupBlock:]([VCVoiceShortcutClient alloc], "initWithMachServiceName:options:interfaceSetupBlock:", CFSTR("com.apple.siri.VoiceShortcuts.xpc"), 0, 0);
  v1 = (void *)standardClient_standardClient;
  standardClient_standardClient = (uint64_t)v0;

}

- (VCVoiceShortcutClient)initWithMachServiceName:(id)a3 options:(unint64_t)a4 interfaceSetupBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCVoiceShortcutClient *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceName"));

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__VCVoiceShortcutClient_initWithMachServiceName_options_interfaceSetupBlock___block_invoke;
  v15[3] = &unk_1E5FC8410;
  v16 = v9;
  v17 = a4;
  v11 = v9;
  v12 = -[VCVoiceShortcutClient initWithXPCConnectionCreationBlock:XPCInterfaceSetupBlock:](self, "initWithXPCConnectionCreationBlock:XPCInterfaceSetupBlock:", v15, v10);

  return v12;
}

- (VCVoiceShortcutClient)initWithXPCConnectionCreationBlock:(id)a3 XPCInterfaceSetupBlock:(id)a4
{
  id v7;
  id v8;
  VCVoiceShortcutClient *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("creationBlock"));

  }
  v9 = -[VCVoiceShortcutClient initWithXPCConnection:XPCConnectionCreationBlock:XPCInterfaceSetupBlock:](self, "initWithXPCConnection:XPCConnectionCreationBlock:XPCInterfaceSetupBlock:", 0, v7, v8);

  return v9;
}

- (VCVoiceShortcutClient)initWithXPCConnection:(id)a3 XPCConnectionCreationBlock:(id)a4 XPCInterfaceSetupBlock:(id)a5
{
  unint64_t v10;
  unint64_t v11;
  id v12;
  VCVoiceShortcutClient *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *xpcQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *internalStateQueue;
  uint64_t v20;
  NSHashTable *errorHandlers;
  uint64_t v22;
  id creationBlock;
  uint64_t v24;
  id interfaceSetupBlock;
  WFSystemSurfaceWorkflowStatusRegistry *v26;
  WFSystemSurfaceWorkflowStatusRegistry *systemSurfaceStatus;
  WFVoiceShortcutCache *v28;
  WFVoiceShortcutCache *voiceShortcutCache;
  NSObject *v30;
  VCVoiceShortcutClient *v31;
  void *v33;
  _QWORD block[4];
  id v35;
  id location;
  objc_super v37;

  v10 = (unint64_t)a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  if (!(v10 | v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection || creationBlock"));

  }
  v37.receiver = self;
  v37.super_class = (Class)VCVoiceShortcutClient;
  v13 = -[VCVoiceShortcutClient init](&v37, sel_init);
  if (v13)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.shortcuts.VCVoiceShortcutClient.XPC", v14);
    xpcQueue = v13->_xpcQueue;
    v13->_xpcQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.shortcuts.VCVoiceShortcutClient.InternalState", v17);
    internalStateQueue = v13->_internalStateQueue;
    v13->_internalStateQueue = (OS_dispatch_queue *)v18;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v20 = objc_claimAutoreleasedReturnValue();
    errorHandlers = v13->_errorHandlers;
    v13->_errorHandlers = (NSHashTable *)v20;

    objc_storeStrong((id *)&v13->_xpcConnection, a3);
    v22 = objc_msgSend((id)v11, "copy");
    creationBlock = v13->_creationBlock;
    v13->_creationBlock = (id)v22;

    v24 = objc_msgSend(v12, "copy");
    interfaceSetupBlock = v13->_interfaceSetupBlock;
    v13->_interfaceSetupBlock = (id)v24;

    v26 = objc_alloc_init(WFSystemSurfaceWorkflowStatusRegistry);
    systemSurfaceStatus = v13->_systemSurfaceStatus;
    v13->_systemSurfaceStatus = v26;

    v28 = objc_alloc_init(WFVoiceShortcutCache);
    voiceShortcutCache = v13->_voiceShortcutCache;
    v13->_voiceShortcutCache = v28;

    -[VCVoiceShortcutClient subscribeToVoiceShortcutDataUpdateNotifications](v13, "subscribeToVoiceShortcutDataUpdateNotifications");
    objc_initWeak(&location, v13);
    v30 = v13->_internalStateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__VCVoiceShortcutClient_initWithXPCConnection_XPCConnectionCreationBlock_XPCInterfaceSetupBlock___block_invoke;
    block[3] = &unk_1E5FC83E8;
    objc_copyWeak(&v35, &location);
    dispatch_async(v30, block);
    v31 = v13;
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)subscribeToVoiceShortcutDataUpdateNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)VCVoiceShortcutDataDidUpdateNotificationHandler, CFSTR("com.apple.siri.VoiceShortcuts.DataDidUpdateNotification"), 0, (CFNotificationSuspensionBehavior)0);
  getWFVoiceShortcutClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[VCVoiceShortcutClient subscribeToVoiceShortcutDataUpdateNotifications]";
    v7 = 2112;
    v8 = CFSTR("com.apple.siri.VoiceShortcuts.DataDidUpdateNotification");
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_DEBUG, "%s Subscribed to notification: (%@)", (uint8_t *)&v5, 0x16u);
  }

}

+ (VCVoiceShortcutClient)standardClient
{
  if (standardClient_onceToken != -1)
    dispatch_once(&standardClient_onceToken, &__block_literal_global_18178);
  return (VCVoiceShortcutClient *)(id)standardClient_standardClient;
}

void __97__VCVoiceShortcutClient_initWithXPCConnection_XPCConnectionCreationBlock_XPCInterfaceSetupBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "xpcConnection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    objc_msgSend(WeakRetained, "unsafeSetupXPCConnection");

}

void __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD aBlock[5];
  id v25;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "errorHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _Block_copy(v2);
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "creationBlock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "creationBlock");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", v8);

      objc_msgSend(*(id *)(a1 + 32), "unsafeSetupXPCConnection");
    }
  }
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke_2;
  aBlock[3] = &unk_1E5FC8698;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v25 = v10;
  v11 = _Block_copy(aBlock);
  v12 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  else
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v15);

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__18050;
    v22[4] = __Block_byref_object_dispose__18051;
    objc_msgSend(*(id *)(a1 + 32), "unsafePopConnectionErrorHandlers");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke_3;
    v19[3] = &unk_1E5FC8710;
    v20 = v16;
    v21 = v22;
    v18 = v16;
    dispatch_async(v17, v19);

    _Block_object_dispose(v22, 8);
  }

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (id)creationBlock
{
  return self->_creationBlock;
}

- (NSHashTable)errorHandlers
{
  return self->_errorHandlers;
}

id __77__VCVoiceShortcutClient_initWithMachServiceName_options_interfaceSetupBlock___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)unsafeSetupXPCConnection
{
  NSXPCConnection *xpcConnection;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  NSObject *v9;
  NSXPCConnection *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  VCVoiceShortcutClient *v19;
  __int16 v20;
  NSXPCConnection *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  xpcConnection = self->_xpcConnection;
  -[VCVoiceShortcutClient xpcQueue](self, "xpcQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection _setQueue:](xpcConnection, "_setQueue:", v4);

  VCVoiceShortcutManagerXPCInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCVoiceShortcutClient interfaceSetupBlock](self, "interfaceSetupBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VCVoiceShortcutClient interfaceSetupBlock](self, "interfaceSetupBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v5);

  }
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__VCVoiceShortcutClient_unsafeSetupXPCConnection__block_invoke;
  v13[3] = &unk_1E5FC83E8;
  objc_copyWeak(&v14, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __49__VCVoiceShortcutClient_unsafeSetupXPCConnection__block_invoke_138;
  v11[3] = &unk_1E5FC83E8;
  objc_copyWeak(&v12, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v11);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  getWFVoiceShortcutClientLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_xpcConnection;
    *(_DWORD *)buf = 136315906;
    v17 = "-[VCVoiceShortcutClient unsafeSetupXPCConnection]";
    v18 = 2112;
    v19 = self;
    v20 = 2112;
    v21 = v10;
    v22 = 2114;
    v23 = CFSTR("com.apple.siri.VoiceShortcuts.xpc");
    _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_DEFAULT, "%s %@ XPCConnection=%@ resumed to machServiceName=%{public}@", buf, 0x2Au);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (id)interfaceSetupBlock
{
  return self->_interfaceSetupBlock;
}

- (void)fetchAvailableStaccatoActions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFStaccatoLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VCVoiceShortcutClient(Staccato) fetchAvailableStaccatoActions:]";
    _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_DEFAULT, "%s Client requesting all available staccato actions.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__VCVoiceShortcutClient_Staccato__fetchAvailableStaccatoActions___block_invoke;
  v8[3] = &unk_1E5FC88A0;
  v9 = v4;
  v6 = v4;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAvailableStaccatoActions:", v6);

}

- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_Suggestions.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcutSuggestions"));

  }
  getWFVoiceShortcutClientLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[VCVoiceShortcutClient(Suggestions) setShortcutSuggestions:forAppWithBundleIdentifier:]";
    v16 = 2112;
    v17 = (uint64_t)v7;
    _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_DEBUG, "%s Setting shortcut suggestions: %@", buf, 0x16u);
  }

  if ((unint64_t)objc_msgSend(v7, "count") >= 0x65)
  {
    getWFVoiceShortcutClientLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[VCVoiceShortcutClient(Suggestions) setShortcutSuggestions:forAppWithBundleIdentifier:]";
      v16 = 2050;
      v17 = 100;
      _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEFAULT, "%s Limiting to the first %{public}lu suggestions", buf, 0x16u);
    }

    objc_msgSend(v7, "subarrayWithRange:", 0, 100);
    v11 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v11;
  }
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", &__block_literal_global_17307);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShortcutSuggestions:forAppWithBundleIdentifier:", v7, v8);

}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  getWFVoiceShortcutClientLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[VCVoiceShortcutClient setInteger:forKey:inDomain:completionHandler:]";
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1AF681000, v14, OS_LOG_TYPE_DEBUG, "%s Setting preference object for key=%@ in doamin=%@", buf, 0x20u);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __70__VCVoiceShortcutClient_setInteger_forKey_inDomain_completionHandler___block_invoke;
  v20[3] = &unk_1E5FC88A0;
  v21 = v13;
  v15 = v13;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setInteger:forKey:inDomain:completionHandler:", a3, v11, v12, v15);

}

- (void)fetchAllValueSectionsForStaccatoParameter:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFStaccatoLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[VCVoiceShortcutClient(Staccato) fetchAllValueSectionsForStaccatoParameter:completion:]";
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1AF681000, v8, OS_LOG_TYPE_DEFAULT, "%s Client requesting all values for parameter: %@", buf, 0x16u);
  }

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__VCVoiceShortcutClient_Staccato__fetchAllValueSectionsForStaccatoParameter_completion___block_invoke;
  v11[3] = &unk_1E5FC88A0;
  v12 = v7;
  v9 = v7;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAllValueSectionsForStaccatoParameter:completion:", v6, v9);

}

- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3 synchronous:(BOOL)a4
{
  id v6;
  NSObject *internalStateQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18050;
  v19 = __Block_byref_object_dispose__18051;
  v20 = 0;
  internalStateQueue = self->_internalStateQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke;
  v11[3] = &unk_1E5FC86C0;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(internalStateQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)asynchronousRemoteDataStoreWithErrorHandler:(id)a3
{
  return -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:synchronous:](self, "asynchronousRemoteDataStoreWithErrorHandler:synchronous:", a3, 0);
}

- (id)menuBarWorkflowsWithGlyphSize:(CGSize)a3 error:(id *)a4
{
  double height;
  double width;
  WFWorkflowQuery *v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  v7 = -[WFWorkflowQuery initWithWorkflowType:]([WFWorkflowQuery alloc], "initWithWorkflowType:", CFSTR("MenuBar"));
  +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v7, objc_opt_class(), a4, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)observableStingWorkflowsWithError:(id *)a3
{
  WFWorkflowQuery *v4;
  void *v5;

  v4 = -[WFWorkflowQuery initWithWorkflowType:]([WFWorkflowQuery alloc], "initWithWorkflowType:", CFSTR("Watch"));
  +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v4, objc_opt_class(), a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)observableStingWorkflowWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  WFDatabaseObjectDescriptor *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:]([WFDatabaseObjectDescriptor alloc], "initWithIdentifier:objectType:", v5, 0);
    +[WFObservableObjectResult getResultWithDescriptor:valueType:glyphSize:error:](WFObservableObjectResult, "getResultWithDescriptor:valueType:glyphSize:error:", v6, objc_opt_class(), a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315138;
      v11 = "-[VCVoiceShortcutClient(Sting) observableStingWorkflowWithIdentifier:error:]";
    }

    v7 = 0;
  }

  return v7;
}

- (id)stingWorkflowsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[VCVoiceShortcutClient observableStingWorkflowsWithError:](self, "observableStingWorkflowsWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stingWorkflowWithIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[VCVoiceShortcutClient observableStingWorkflowWithIdentifier:error:](self, "observableStingWorkflowWithIdentifier:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)archiveAction:(id)a3 withActionMetadata:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1651;
  v27 = __Block_byref_object_dispose__1652;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1651;
  v21 = __Block_byref_object_dispose__1652;
  v22 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_error___block_invoke;
  v16[3] = &unk_1E5FC4ED0;
  v16[4] = &v23;
  v16[5] = &v17;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __76__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_error___block_invoke_2;
  v15[3] = &unk_1E5FC87D0;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v11, "archiveAction:withActionMetadata:completion:", v8, v9, v15);

  v12 = (void *)v24[5];
  if (a5 && !v12)
  {
    *a5 = objc_retainAutorelease((id)v18[5]);
    v12 = (void *)v24[5];
  }
  v13 = v12;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (id)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1651;
  v27 = __Block_byref_object_dispose__1652;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1651;
  v21 = __Block_byref_object_dispose__1652;
  v22 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_error___block_invoke;
  v16[3] = &unk_1E5FC4ED0;
  v16[4] = &v23;
  v16[5] = &v17;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __86__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_error___block_invoke_2;
  v15[3] = &unk_1E5FC4EF8;
  v15[4] = &v23;
  v15[5] = &v17;
  objc_msgSend(v11, "unarchiveActionFromData:withActionMetadata:completion:", v8, v9, v15);

  v12 = (void *)v24[5];
  if (a5 && !v12)
  {
    *a5 = objc_retainAutorelease((id)v18[5]);
    v12 = (void *)v24[5];
  }
  v13 = v12;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_completion___block_invoke;
  v13[3] = &unk_1E5FC88A0;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "archiveAction:withActionMetadata:completion:", v11, v10, v9);

}

- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_completion___block_invoke;
  v13[3] = &unk_1E5FC88A0;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unarchiveActionFromData:withActionMetadata:completion:", v11, v10, v9);

}

- (id)linkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[6];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__1651;
  v30 = __Block_byref_object_dispose__1652;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1651;
  v24 = __Block_byref_object_dispose__1652;
  v13 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __123__VCVoiceShortcutClient_AppIntents__linkActionWithAppBundleIdentifier_appIntentIdentifier_serializedParameterStates_error___block_invoke;
  v19[3] = &unk_1E5FC8460;
  v19[4] = &v26;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __123__VCVoiceShortcutClient_AppIntents__linkActionWithAppBundleIdentifier_appIntentIdentifier_serializedParameterStates_error___block_invoke_2;
  v18[3] = &unk_1E5FC4EF8;
  v18[4] = &v20;
  v18[5] = &v26;
  objc_msgSend(v14, "getLinkActionWithAppBundleIdentifier:appIntentIdentifier:serializedParameterStates:completion:", v10, v11, v12, v18);

  v15 = (void *)v21[5];
  if (a6 && !v15)
  {
    *a6 = objc_retainAutorelease((id)v27[5]);
    v15 = (void *)v21[5];
  }
  v16 = v15;
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (id)migratedAppIntentWithINIntent:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1651;
  v24 = __Block_byref_object_dispose__1652;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1651;
  v18 = __Block_byref_object_dispose__1652;
  v7 = MEMORY[0x1E0C809B0];
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__VCVoiceShortcutClient_AppIntents__migratedAppIntentWithINIntent_error___block_invoke;
  v13[3] = &unk_1E5FC8460;
  v13[4] = &v20;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __73__VCVoiceShortcutClient_AppIntents__migratedAppIntentWithINIntent_error___block_invoke_2;
  v12[3] = &unk_1E5FC4F20;
  v12[4] = &v14;
  v12[5] = &v20;
  objc_msgSend(v8, "getMigratedAppIntentWithINIntent:completion:", v6, v12);

  v9 = (void *)v15[5];
  if (a4 && !v9)
  {
    *a4 = objc_retainAutorelease((id)v21[5]);
    v9 = (void *)v15[5];
  }
  v10 = v9;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

- (id)serializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1651;
  v27 = __Block_byref_object_dispose__1652;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1651;
  v21 = __Block_byref_object_dispose__1652;
  v10 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __92__VCVoiceShortcutClient_AppIntents__serializedParametersForLinkAction_actionMetadata_error___block_invoke;
  v16[3] = &unk_1E5FC8460;
  v16[4] = &v23;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __92__VCVoiceShortcutClient_AppIntents__serializedParametersForLinkAction_actionMetadata_error___block_invoke_2;
  v15[3] = &unk_1E5FC4F48;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend(v11, "getSerializedParametersForLinkAction:actionMetadata:completion:", v8, v9, v15);

  v12 = (void *)v18[5];
  if (a5 && !v12)
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v12 = (void *)v18[5];
  }
  v13 = v12;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (void)loadFileURLWithItemProviderRequestMetadata:(id)a3 type:(id)a4 openInPlace:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a5;
  v10 = a6;
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __108__VCVoiceShortcutClient_AppIntents__loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke;
  v19[3] = &unk_1E5FC88A0;
  v12 = v10;
  v20 = v12;
  v13 = a4;
  v14 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __108__VCVoiceShortcutClient_AppIntents__loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke_2;
  v17[3] = &unk_1E5FC8530;
  v18 = v12;
  v16 = v12;
  objc_msgSend(v15, "loadFileURLWithItemProviderRequestMetadata:type:openInPlace:completion:", v14, v13, v6, v17);

}

- (void)loadDataWithItemProviderRequestMetadata:(id)a3 type:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__VCVoiceShortcutClient_AppIntents__loadDataWithItemProviderRequestMetadata_type_completion___block_invoke;
  v17[3] = &unk_1E5FC88A0;
  v10 = v8;
  v18 = v10;
  v11 = a4;
  v12 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __93__VCVoiceShortcutClient_AppIntents__loadDataWithItemProviderRequestMetadata_type_completion___block_invoke_2;
  v15[3] = &unk_1E5FC6C28;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v13, "loadDataWithItemProviderRequestMetadata:type:completion:", v12, v11, v15);

}

uint64_t __93__VCVoiceShortcutClient_AppIntents__loadDataWithItemProviderRequestMetadata_type_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__VCVoiceShortcutClient_AppIntents__loadDataWithItemProviderRequestMetadata_type_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __108__VCVoiceShortcutClient_AppIntents__loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __108__VCVoiceShortcutClient_AppIntents__loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__VCVoiceShortcutClient_AppIntents__serializedParametersForLinkAction_actionMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __92__VCVoiceShortcutClient_AppIntents__serializedParametersForLinkAction_actionMetadata_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __73__VCVoiceShortcutClient_AppIntents__migratedAppIntentWithINIntent_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __73__VCVoiceShortcutClient_AppIntents__migratedAppIntentWithINIntent_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __123__VCVoiceShortcutClient_AppIntents__linkActionWithAppBundleIdentifier_appIntentIdentifier_serializedParameterStates_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __123__VCVoiceShortcutClient_AppIntents__linkActionWithAppBundleIdentifier_appIntentIdentifier_serializedParameterStates_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __91__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __86__VCVoiceShortcutClient_AppIntents__unarchiveActionFromData_withActionMetadata_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __76__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

}

void __76__VCVoiceShortcutClient_AppIntents__archiveAction_withActionMetadata_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)getSuggestedShortcutsWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__VCVoiceShortcutClient_TopHitContextual__getSuggestedShortcutsWithLimit_completion___block_invoke;
  v9[3] = &unk_1E5FC88A0;
  v10 = v6;
  v7 = v6;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getSuggestedShortcutsWithLimit:completion:", a3, v7);

}

- (void)getRecentsCallWithTelephony:(BOOL)a3 limit:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__VCVoiceShortcutClient_TopHitContextual__getRecentsCallWithTelephony_limit_completion___block_invoke;
  v11[3] = &unk_1E5FC88A0;
  v12 = v8;
  v9 = v8;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getRecentsCallWithTelephony:limit:completion:", v6, a4, v9);

}

- (void)getFavoriteContactsWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__VCVoiceShortcutClient_TopHitContextual__getFavoriteContactsWithLimit_completion___block_invoke;
  v9[3] = &unk_1E5FC88A0;
  v10 = v6;
  v7 = v6;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getFavoriteContactsWithLimit:completion:", a3, v7);

}

- (void)getUpcomingMediaForBundleIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__VCVoiceShortcutClient_TopHitContextual__getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke;
  v12[3] = &unk_1E5FC88A0;
  v13 = v8;
  v9 = v8;
  v10 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getUpcomingMediaForBundleIdentifier:limit:completion:", v10, a4, v9);

}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v12 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __140__VCVoiceShortcutClient_TopHitContextual__getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke;
  v18[3] = &unk_1E5FC88A0;
  v19 = v12;
  v13 = v12;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:limit:completion:", v16, v15, v14, a6, v13);

}

- (id)colorsForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  WFAppShortcutColorFetcher *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(WFAppShortcutColorFetcher);
  -[WFAppShortcutColorFetcher colorsForBundleIdentifier:error:](v6, "colorsForBundleIdentifier:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __140__VCVoiceShortcutClient_TopHitContextual__getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__VCVoiceShortcutClient_TopHitContextual__getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__VCVoiceShortcutClient_TopHitContextual__getFavoriteContactsWithLimit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __88__VCVoiceShortcutClient_TopHitContextual__getRecentsCallWithTelephony_limit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__VCVoiceShortcutClient_TopHitContextual__getSuggestedShortcutsWithLimit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getNumberOfVoiceShortcutsWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__VCVoiceShortcutClient_VoiceShortcuts__getNumberOfVoiceShortcutsWithCompletion___block_invoke;
  v9[3] = &unk_1E5FC88A0;
  v10 = v5;
  v6 = v5;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getNumberOfVoiceShortcutsWithCompletion:", v6);

}

- (void)getVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("voiceShortcutIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v15 = v9;
  v10 = v9;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getVoiceShortcutWithIdentifier:completion:", v7, v10);

}

- (void)getVoiceShortcutWithPhrase:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phrase"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutWithPhrase_completion___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v15 = v9;
  v10 = v9;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getVoiceShortcutWithPhrase:completion:", v7, v10);

}

- (void)getVoiceShortcutsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  objc_initWeak(&location, self);
  -[VCVoiceShortcutClient voiceShortcutCache](self, "voiceShortcutCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke;
  v9[3] = &unk_1E5FC6568;
  objc_copyWeak(&v11, &location);
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "getCachedVoiceShortcuts:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)getVoiceShortcutsForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsForAppWithBundleIdentifier_completion___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v15 = v9;
  v10 = v9;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getVoiceShortcutsForAppWithBundleIdentifier:completion:", v7, v10);

}

- (void)deleteVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("voiceShortcutIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[VCVoiceShortcutClient(VoiceShortcuts) deleteVoiceShortcutWithIdentifier:completion:]";
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEBUG, "%s Deleting VoiceShortcut with id=%@", buf, 0x16u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithIdentifier_completion___block_invoke;
  v19[3] = &unk_1E5FC88A0;
  v12 = v9;
  v20 = v12;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __86__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithIdentifier_completion___block_invoke_2;
  v17[3] = &unk_1E5FC6590;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  objc_msgSend(v13, "deleteVoiceShortcutWithIdentifier:name:completion:", v7, 0, v17);

}

- (void)deleteVoiceShortcutWithName:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("voiceShortcutName"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_VoiceShortcuts.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[VCVoiceShortcutClient(VoiceShortcuts) deleteVoiceShortcutWithName:completion:]";
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEBUG, "%s Deleting VoiceShortcut with name=%@", buf, 0x16u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithName_completion___block_invoke;
  v19[3] = &unk_1E5FC88A0;
  v12 = v9;
  v20 = v12;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __80__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithName_completion___block_invoke_2;
  v17[3] = &unk_1E5FC6590;
  v17[4] = self;
  v18 = v12;
  v14 = v12;
  objc_msgSend(v13, "deleteVoiceShortcutWithIdentifier:name:completion:", 0, v7, v17);

}

- (void)importTopLevelShortcutFromURL:(id)a3 withName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91__VCVoiceShortcutClient_VoiceShortcuts__importTopLevelShortcutFromURL_withName_completion___block_invoke;
  v10[3] = &unk_1E5FC65B8;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:](self, "importSharedShortcutFromURL:withName:shortcutSource:completion:", a3, a4, CFSTR("ShortcutSourceSiriTopLevelShortcut"), v10);

}

void __91__VCVoiceShortcutClient_VoiceShortcuts__importTopLevelShortcutFromURL_withName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "voiceShortcutCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clear");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __80__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithName_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "voiceShortcutCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clear");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __86__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__VCVoiceShortcutClient_VoiceShortcuts__deleteVoiceShortcutWithIdentifier_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "voiceShortcutCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clear");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __96__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsForAppWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    getWFVoiceShortcutClientLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[VCVoiceShortcutClient(VoiceShortcuts) getVoiceShortcutsWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1AF681000, v6, OS_LOG_TYPE_INFO, "%s Returning cached voice shortcuts.", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "voiceShortcutCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_42;
    v8[3] = &unk_1E5FC6540;
    v8[4] = v5;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v7, "setCachedVoiceShortcuts:", v8);

  }
}

void __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_2;
  v11[3] = &unk_1E5FC88A0;
  v5 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v5, "asynchronousRemoteDataStoreWithErrorHandler:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E5FC6518;
  v9 = v3;
  v10 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v6, "getVoiceShortcutsWithCompletion:", v8);

}

uint64_t __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __79__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutWithPhrase_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__VCVoiceShortcutClient_VoiceShortcuts__getVoiceShortcutWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__VCVoiceShortcutClient_VoiceShortcuts__getNumberOfVoiceShortcutsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__VCVoiceShortcutClient_AutoShortcuts__getSiriAutoShortcutsEnablementForBundleIdentifier_completion___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __101__VCVoiceShortcutClient_AutoShortcuts__getSiriAutoShortcutsEnablementForBundleIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E5FC6C00;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "getSiriAutoShortcutsEnablementForBundleIdentifier:completion:", v9, v12);

}

- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__VCVoiceShortcutClient_AutoShortcuts__setSiriAutoShortcutsEnablement_forBundleIdentifier_completion___block_invoke;
  v16[3] = &unk_1E5FC88A0;
  v10 = v8;
  v17 = v10;
  v11 = a4;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __102__VCVoiceShortcutClient_AutoShortcuts__setSiriAutoShortcutsEnablement_forBundleIdentifier_completion___block_invoke_2;
  v14[3] = &unk_1E5FC88A0;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "setSiriAutoShortcutsEnablement:forBundleIdentifier:completion:", v6, v11, v14);

}

- (void)getSpotlightAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4
{
  (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

- (void)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  void *v5;
  void (**v6)(id, id);
  id v7;

  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = (void (**)(id, id))a5;
  objc_msgSend(v5, "vc_voiceShortcutErrorWithCode:reason:", 1014, CFSTR("This setting is now managed by the global Show Content in Search setting."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

- (void)getSpotlightAutoShortcutsEnablementForBundleIdentifier:(id)a3 phraseSignature:(id)a4 completion:(id)a5
{
  (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

- (void)setSpotlightAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 phraseSignature:(id)a5 completion:(id)a6
{
  void *v6;
  void (**v7)(id, id);
  id v8;

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = (void (**)(id, id))a6;
  objc_msgSend(v6, "vc_voiceShortcutErrorWithCode:reason:", 1014, CFSTR("Individual App Shortcuts can no longer be hidden from Spotlight."));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

}

- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__VCVoiceShortcutClient_AutoShortcuts__serializedParametersForAppEntityIdentifier_completion___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __94__VCVoiceShortcutClient_AutoShortcuts__serializedParametersForAppEntityIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E5FC6C28;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "serializedParametersForAppEntityIdentifier:completion:", v9, v12);

}

- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7
{
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v12 = a7;
  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __120__VCVoiceShortcutClient_AutoShortcuts__storeSerializedParameters_forAppEntityIdentifier_queryName_badgeType_completion___block_invoke;
  v22[3] = &unk_1E5FC88A0;
  v14 = v12;
  v23 = v14;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __120__VCVoiceShortcutClient_AutoShortcuts__storeSerializedParameters_forAppEntityIdentifier_queryName_badgeType_completion___block_invoke_2;
  v20[3] = &unk_1E5FC88A0;
  v21 = v14;
  v19 = v14;
  objc_msgSend(v18, "storeSerializedParameters:forAppEntityIdentifier:queryName:badgeType:completion:", v17, v16, v15, a6, v20);

}

- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__VCVoiceShortcutClient_AutoShortcuts__removeAllSerializedParametersForQueryName_completion___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v8 = v6;
  v15 = v8;
  v9 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __93__VCVoiceShortcutClient_AutoShortcuts__removeAllSerializedParametersForQueryName_completion___block_invoke_2;
  v12[3] = &unk_1E5FC88A0;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "removeAllSerializedParametersForQueryName:completion:", v9, v12);

}

- (void)updateAppShortcutsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__VCVoiceShortcutClient_AutoShortcuts__updateAppShortcutsWithCompletion___block_invoke;
  v11[3] = &unk_1E5FC88A0;
  v6 = v4;
  v12 = v6;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __73__VCVoiceShortcutClient_AutoShortcuts__updateAppShortcutsWithCompletion___block_invoke_2;
  v9[3] = &unk_1E5FC88A0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "updateAppShortcutsWithCompletion:", v9);

}

uint64_t __73__VCVoiceShortcutClient_AutoShortcuts__updateAppShortcutsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__VCVoiceShortcutClient_AutoShortcuts__updateAppShortcutsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__VCVoiceShortcutClient_AutoShortcuts__removeAllSerializedParametersForQueryName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __93__VCVoiceShortcutClient_AutoShortcuts__removeAllSerializedParametersForQueryName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __120__VCVoiceShortcutClient_AutoShortcuts__storeSerializedParameters_forAppEntityIdentifier_queryName_badgeType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __120__VCVoiceShortcutClient_AutoShortcuts__storeSerializedParameters_forAppEntityIdentifier_queryName_badgeType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__VCVoiceShortcutClient_AutoShortcuts__serializedParametersForAppEntityIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __94__VCVoiceShortcutClient_AutoShortcuts__serializedParametersForAppEntityIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__VCVoiceShortcutClient_AutoShortcuts__setSiriAutoShortcutsEnablement_forBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __102__VCVoiceShortcutClient_AutoShortcuts__setSiriAutoShortcutsEnablement_forBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__VCVoiceShortcutClient_AutoShortcuts__getSiriAutoShortcutsEnablementForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__VCVoiceShortcutClient_AutoShortcuts__getSiriAutoShortcutsEnablementForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)accessibilityWorkflowsForSurface:(unint64_t)a3 error:(id *)a4
{
  WFWorkflowQuery *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = [WFWorkflowQuery alloc];
  if (a3 == 1)
    v7 = -[WFWorkflowQuery initWithWorkflowType:](v6, "initWithWorkflowType:", CFSTR("Watch"));
  else
    v7 = -[WFWorkflowQuery initWithLocation:](v6, "initWithLocation:", 0);
  v8 = (void *)v7;
  +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v7, objc_opt_class(), a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)accessibilityWorkflowForIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  WFDatabaseObjectDescriptor *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:]([WFDatabaseObjectDescriptor alloc], "initWithIdentifier:objectType:", v5, 0);
    +[WFObservableObjectResult getResultWithDescriptor:valueType:glyphSize:error:](WFObservableObjectResult, "getResultWithDescriptor:valueType:glyphSize:error:", v6, objc_opt_class(), a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315138;
      v11 = "-[VCVoiceShortcutClient(Accessibility) accessibilityWorkflowForIdentifier:error:]";
    }

    v7 = 0;
  }

  return v7;
}

- (id)accessibilityWorkflowsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[VCVoiceShortcutClient accessibilityWorkflowsForSurface:error:](self, "accessibilityWorkflowsForSurface:error:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityWatchWorkflowsWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[VCVoiceShortcutClient accessibilityWorkflowsForSurface:error:](self, "accessibilityWorkflowsForSurface:error:", 1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityWorkflowWithIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  -[VCVoiceShortcutClient accessibilityWorkflowForIdentifier:error:](self, "accessibilityWorkflowForIdentifier:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)fetchAllValuesForStaccatoParameter:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__VCVoiceShortcutClient_Staccato__fetchAllValuesForStaccatoParameter_completion___block_invoke;
  v8[3] = &unk_1E5FC8248;
  v9 = v6;
  v7 = v6;
  -[VCVoiceShortcutClient fetchAllValueSectionsForStaccatoParameter:completion:](self, "fetchAllValueSectionsForStaccatoParameter:completion:", a3, v8);

}

- (void)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFStaccatoLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[VCVoiceShortcutClient(Staccato) configuredStaccatoActionFromTemplate:valuesByParameterKey:completion:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_DEFAULT, "%s Client requesting configured system action from template: %@ with parameters by key: %@.", buf, 0x20u);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__VCVoiceShortcutClient_Staccato__configuredStaccatoActionFromTemplate_valuesByParameterKey_completion___block_invoke;
  v14[3] = &unk_1E5FC88A0;
  v15 = v10;
  v12 = v10;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuredStaccatoActionFromTemplate:valuesByParameterKey:completion:", v8, v9, v12);

}

- (void)defaultStaccatoActionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFStaccatoLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VCVoiceShortcutClient(Staccato) defaultStaccatoActionWithCompletion:]";
    _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_DEFAULT, "%s Client requesting default system action.", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__VCVoiceShortcutClient_Staccato__defaultStaccatoActionWithCompletion___block_invoke;
  v8[3] = &unk_1E5FC88A0;
  v9 = v4;
  v6 = v4;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultStaccatoActionWithCompletion:", v6);

}

uint64_t __71__VCVoiceShortcutClient_Staccato__defaultStaccatoActionWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __104__VCVoiceShortcutClient_Staccato__configuredStaccatoActionFromTemplate_valuesByParameterKey_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__VCVoiceShortcutClient_Staccato__fetchAllValuesForStaccatoParameter_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  if (!a2 || a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "if_flatMap:", &__block_literal_global_10133);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __81__VCVoiceShortcutClient_Staccato__fetchAllValuesForStaccatoParameter_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "values");
}

uint64_t __88__VCVoiceShortcutClient_Staccato__fetchAllValueSectionsForStaccatoParameter_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VCVoiceShortcutClient_Staccato__fetchAvailableStaccatoActions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)userHasAutomationsWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11402;
  v19 = __Block_byref_object_dispose__11403;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__VCVoiceShortcutClient_Automations__userHasAutomationsWithError___block_invoke;
  v10[3] = &unk_1E5FC8460;
  v10[4] = &v15;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __66__VCVoiceShortcutClient_Automations__userHasAutomationsWithError___block_invoke_2;
  v9[3] = &unk_1E5FC8488;
  v9[4] = &v11;
  v9[5] = &v15;
  objc_msgSend(v5, "userHasAutomationsWithCompletion:", v9);

  if (a3)
  {
    v6 = (void *)v16[5];
    if (v6)
      *a3 = objc_retainAutorelease(v6);
  }
  v7 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (BOOL)resetAutomationConfirmationStatusWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__11402;
  v15 = __Block_byref_object_dispose__11403;
  v4 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__VCVoiceShortcutClient_Automations__resetAutomationConfirmationStatusWithError___block_invoke;
  v10[3] = &unk_1E5FC8460;
  v10[4] = &v11;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __81__VCVoiceShortcutClient_Automations__resetAutomationConfirmationStatusWithError___block_invoke_2;
  v9[3] = &unk_1E5FC8460;
  v9[4] = &v11;
  objc_msgSend(v5, "resetAutomationConfirmationStatusWithCompletion:", v9);

  v6 = (void *)v12[5];
  if (a3 && v6)
  {
    *a3 = objc_retainAutorelease(v6);
    v6 = (void *)v12[5];
  }
  v7 = v6 == 0;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __81__VCVoiceShortcutClient_Automations__resetAutomationConfirmationStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __81__VCVoiceShortcutClient_Automations__resetAutomationConfirmationStatusWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __66__VCVoiceShortcutClient_Automations__userHasAutomationsWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __66__VCVoiceShortcutClient_Automations__userHasAutomationsWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)getContextualActionsForContext:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD);
  id v6;

  v5 = (void (**)(id, id, _QWORD))a4;
  WFStaticContextualActionDefinitionsForSurface(objc_msgSend(a3, "surface"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 0);

}

- (id)contextualActionsForContext:(id)a3 error:(id *)a4
{
  return WFStaticContextualActionDefinitionsForSurface(objc_msgSend(a3, "surface"));
}

- (void)filterContextualActions:(id)a3 forContext:(id)a4 byType:(unint64_t)a5 completion:(id)a6
{
  void (**v8)(id, id, _QWORD);
  id v9;

  v8 = (void (**)(id, id, _QWORD))a6;
  WFLocallyFilterActions(a4, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9, 0);

}

- (id)filteredContextualActions:(id)a3 forContext:(id)a4 byType:(unint64_t)a5 error:(id *)a6
{
  WFLocallyFilterActions(a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)logRunOfContextualAction:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void **v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_ContextualActions.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  objc_msgSend(v5, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "surface");
  if (v7 > 0x12)
    v8 = 0;
  else
    v8 = off_1E5FC6A50[v7];
  v9 = v8;
  if (v9)
    v10 = v9;
  else
    v10 = CFSTR("Unknown");
  objc_msgSend(v5, "contentTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_map:", &__block_literal_global_13033);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v6, "correspondingSystemActionType");
  if (v13 == 2)
  {
    v14 = (void *)objc_msgSend(objc_alloc((Class)getBMContextualActionParameterClass()), "initWithType:metadata:", CFSTR("WFNumberContentItem"), &unk_1E6004328);
    v37 = v14;
    v15 = &v37;
    goto LABEL_13;
  }
  if (v13 == 1)
  {
    v14 = (void *)objc_msgSend(objc_alloc((Class)getBMContextualActionParameterClass()), "initWithType:metadata:", CFSTR("WFNumberContentItem"), &unk_1E6004300);
    v38[0] = v14;
    v15 = (void **)v38;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v16 = 0;
LABEL_15:
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v17 = (void *)getBMContextualActionEventClass_softClass;
  v36 = getBMContextualActionEventClass_softClass;
  if (!getBMContextualActionEventClass_softClass)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __getBMContextualActionEventClass_block_invoke;
    v31 = &unk_1E5FC8858;
    v32 = &v33;
    __getBMContextualActionEventClass_block_invoke((uint64_t)&v28);
    v17 = (void *)v34[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v33, 8);
  v19 = [v18 alloc];
  objc_msgSend(v6, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithIdentifier:appName:actionName:contents:parameters:", v20, v10, v21, v12, v16);

  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v23 = (void *)getBMStreamsClass_softClass;
  v36 = getBMStreamsClass_softClass;
  if (!getBMStreamsClass_softClass)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __getBMStreamsClass_block_invoke;
    v31 = &unk_1E5FC8858;
    v32 = &v33;
    __getBMStreamsClass_block_invoke((uint64_t)&v28);
    v23 = (void *)v34[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v33, 8);
  objc_msgSend(v24, "contextualActions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "source");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendEvent:", v22);

}

- (void)computeRepresentativeSizesForFinderResizingImages:(id)a3 toSizes:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = v8;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSArray * _Nonnull WFDrawRandomly(NSArray * _Nonnull __strong, NSUInteger)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("VCVoiceShortcutClient_ContextualActions.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array"));

    }
    v12 = objc_msgSend(v11, "count");
    if (v12 >= 3)
      v13 = 3;
    else
      v13 = v12;
    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_msgSend(v11, "mutableCopy");
    while (objc_msgSend(v14, "count") < v13)
    {
      v16 = arc4random_uniform(objc_msgSend(v15, "count"));
      objc_msgSend(v15, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v17);

      objc_msgSend(v15, "removeObjectAtIndex:", v16);
    }
    v18 = (void *)objc_msgSend(v14, "copy");

    v19 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke;
    v26[3] = &unk_1E5FC88A0;
    v20 = v10;
    v27 = v20;
    -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    v24[1] = 3221225472;
    v24[2] = __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke_2;
    v24[3] = &unk_1E5FC77B0;
    v25 = v20;
    objc_msgSend(v21, "computeFinderResizedSizesForImages:inSizes:completion:", v18, v9, v24);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0);
  }

}

uint64_t __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[6];
  _QWORD v8[5];
  id v9;
  _QWORD v10[3];
  char v11;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x3032000000;
    v8[3] = __Block_byref_object_copy__13017;
    v8[4] = __Block_byref_object_dispose__13018;
    v9 = (id)objc_opt_new();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke_55;
    v7[3] = &unk_1E5FC7788;
    v7[4] = v10;
    v7[5] = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    _Block_object_dispose(v8, 8);

    _Block_object_dispose(v10, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __113__VCVoiceShortcutClient_ContextualActions__computeRepresentativeSizesForFinderResizingImages_toSizes_completion___block_invoke_55(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  long double v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a2;
  if ((unint64_t)objc_msgSend(v17, "count") < 2)
  {
    objc_msgSend(v17, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "unsignedIntValue");

  }
  else
  {
    WFEvaluateMathematicalFunction(CFSTR("average:"), v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    WFEvaluateMathematicalFunction(CFSTR("stddev:"), v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    if (v11 > 0.0)
    {
      v12 = log10(v11);
      v13 = __exp10(floor(v12));
      v8 = ceil(v8 / (double)(unint64_t)v13) * (double)(unint64_t)v13;
    }
    v14 = (unint64_t)v8;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v16, v5);

}

id __69__VCVoiceShortcutClient_ContextualActions__logRunOfContextualAction___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getBMContextualActionContentClass_softClass;
  v13 = getBMContextualActionContentClass_softClass;
  if (!getBMContextualActionContentClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getBMContextualActionContentClass_block_invoke;
    v9[3] = &unk_1E5FC8858;
    v9[4] = &v10;
    __getBMContextualActionContentClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  v5 = [v4 alloc];
  objc_msgSend(v2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithType:metadata:", v6, MEMORY[0x1E0C9AA70]);

  return v7;
}

- (id)shareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 resolvedActivityItems:(id)a4 hostBundleIdentifier:(id)a5 iconSize:(CGSize)a6 iconScale:(double)a7 error:(id *)a8
{
  double height;
  double width;
  uint64_t (*v15)(uint64_t, uint64_t);
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_time_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  CGColorSpaceRef DeviceRGB;
  void (**v29)(_QWORD);
  WFRemoteImageDrawingContext *v30;
  WFRemoteImageDrawingContext *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  id v41;
  _QWORD v42[4];
  WFRemoteImageDrawingContext *v43;
  _QWORD aBlock[5];
  _QWORD v45[6];
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD handler[4];
  NSObject *v54;
  VCVoiceShortcutClient *v55;
  uint8_t v56[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  _BYTE buf[24];
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  height = a6.height;
  width = a6.width;
  v64 = *MEMORY[0x1E0C80C00];
  v15 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v41 = a4;
  v16 = a5;
  getWFVoiceShortcutClientLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolve"
                         "dActivityItems:hostBundleIdentifier:iconSize:iconScale:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2114;
    v61 = v15;
    _os_log_impl(&dword_1AF681000, v17, OS_LOG_TYPE_DEBUG, "%s Loading share sheet shortcuts for %{public}@ with extension matching dictionaries %{public}@", buf, 0x20u);
  }

  -[VCVoiceShortcutClient systemSurfaceStatus](self, "systemSurfaceStatus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "statusForSystemSurface:", 0);

  if (v19 == 2)
  {
    getWFVoiceShortcutClientLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resol"
                           "vedActivityItems:hostBundleIdentifier:iconSize:iconScale:error:]";
      v21 = "%s User has share sheet shortcuts. Proceeding with an XPC query to siriactionsd.";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (v19 != 1)
  {
    if (v19)
    {
LABEL_12:
      -[VCVoiceShortcutClient xpcQueue](self, "xpcQueue", v41);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v22);

      v24 = dispatch_time(0, 4000000000);
      dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
      v25 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke;
      handler[3] = &unk_1E5FC7AC0;
      v26 = v23;
      v54 = v26;
      v55 = self;
      dispatch_source_set_event_handler(v26, handler);
      dispatch_resume(v26);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v61 = __Block_byref_object_copy__14021;
      v62 = __Block_byref_object_dispose__14022;
      v63 = 0;
      v47 = 0;
      v48 = &v47;
      v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__14021;
      v51 = __Block_byref_object_dispose__14022;
      v52 = 0;
      v46[0] = v25;
      v46[1] = 3221225472;
      v46[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_34;
      v46[3] = &unk_1E5FC8460;
      v46[4] = buf;
      -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v46);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v25;
      v45[1] = 3221225472;
      v45[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_2;
      v45[3] = &unk_1E5FC7AE8;
      v45[4] = &v47;
      v45[5] = buf;
      objc_msgSend(v27, "getShareSheetWorkflowsForExtensionMatchingDictionaries:hostBundleIdentifier:completion:", v15, v16, v45);
      if (v48[5])
      {
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        aBlock[0] = v25;
        aBlock[1] = 3221225472;
        aBlock[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_37;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = DeviceRGB;
        v29 = (void (**)(_QWORD))_Block_copy(aBlock);
        v30 = [WFRemoteImageDrawingContext alloc];
        v31 = -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:](v30, "initWithImageCount:singleImageSize:scale:colorSpace:", objc_msgSend((id)v48[5], "count"), DeviceRGB, width, height, a7);
        if (v31)
        {
          objc_msgSend((id)v48[5], "if_map:", &__block_literal_global_14025);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "drawGlyphs:withBackgroundColorValues:padding:intoContext:completion:", v32, 0, v31, &__block_literal_global_42_14026, 0.0);
          v33 = (void *)v48[5];
          v42[0] = v25;
          v42[1] = 3221225472;
          v42[2] = __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_3;
          v42[3] = &unk_1E5FC7B70;
          v43 = v31;
          objc_msgSend(v33, "enumerateObjectsUsingBlock:", v42);
          getWFVoiceShortcutClientLogObject();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            v35 = objc_msgSend((id)v48[5], "count");
            *(_DWORD *)v56 = 136315394;
            v57 = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivi"
                  "tyItems:hostBundleIdentifier:iconSize:iconScale:error:]";
            v58 = 2050;
            v59 = v35;
            _os_log_impl(&dword_1AF681000, v34, OS_LOG_TYPE_DEBUG, "%s Loading share sheet shortcuts completed with %{public}lu shortcuts", v56, 0x16u);
          }

          dispatch_source_cancel(v26);
          v36 = (id)v48[5];

        }
        else
        {
          getWFVoiceShortcutClientLogObject();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v56 = 136315138;
            v57 = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivi"
                  "tyItems:hostBundleIdentifier:iconSize:iconScale:error:]";
            _os_log_impl(&dword_1AF681000, v39, OS_LOG_TYPE_ERROR, "%s Could not create remote image drawing context for widget workflow glyphs", v56, 0xCu);
          }

          v36 = (id)v48[5];
        }

        v29[2](v29);
      }
      else
      {
        getWFVoiceShortcutClientLogObject();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v56 = 136315394;
          v57 = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivity"
                "Items:hostBundleIdentifier:iconSize:iconScale:error:]";
          v58 = 2114;
          v59 = v38;
          _os_log_impl(&dword_1AF681000, v37, OS_LOG_TYPE_ERROR, "%s Could not fetch share sheet shortcuts: %{public}@", v56, 0x16u);
        }

        v36 = 0;
        if (a8)
          *a8 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      }

      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_29;
    }
    getWFVoiceShortcutClientLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resol"
                           "vedActivityItems:hostBundleIdentifier:iconSize:iconScale:error:]";
      v21 = "%s Unable to determine in-client whether or not there are share sheet shortcuts to show. Proceeding with an "
            "XPC query to siriactionsd";
LABEL_10:
      _os_log_impl(&dword_1AF681000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  getWFVoiceShortcutClientLogObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolve"
                         "dActivityItems:hostBundleIdentifier:iconSize:iconScale:error:]";
    _os_log_impl(&dword_1AF681000, v26, OS_LOG_TYPE_INFO, "%s User has no share sheet shortcuts present, returning early in share sheet shortcuts request", buf, 0xCu);
  }
  v36 = (id)MEMORY[0x1E0C9AA60];
LABEL_29:

  return v36;
}

- (void)generateSingleUseTokenForWorkflowIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_ShareSheet.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_ShareSheet.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[VCVoiceShortcutClient(ShareSheet) generateSingleUseTokenForWorkflowIdentifier:completion:]";
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEBUG, "%s Generating a single-use token for workflow identifier %{public}@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__VCVoiceShortcutClient_ShareSheet__generateSingleUseTokenForWorkflowIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5FC88A0;
  v16 = v9;
  v11 = v9;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "generateSingleUseTokenForWorkflowIdentifier:completion:", v7, v11);

}

uint64_t __92__VCVoiceShortcutClient_ShareSheet__generateSingleUseTokenForWorkflowIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  getWFVoiceShortcutClientLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v4 = 136315138;
    v5 = "-[VCVoiceShortcutClient(ShareSheet) shareSheetWorkflowsForExtensionMatchingDictionaries:resolvedActivityItems:h"
         "ostBundleIdentifier:iconSize:iconScale:error:]_block_invoke";
    _os_log_impl(&dword_1AF681000, v2, OS_LOG_TYPE_FAULT, "%s Loading share sheet shortcuts timed out", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_34(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_37(uint64_t a1)
{
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 32));
}

void __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = (void *)MEMORY[0x1B5DFC064]();
  v6 = objc_msgSend(*(id *)(a1 + 32), "imageAtIndex:", a3);
  objc_msgSend(*(id *)(a1 + 32), "scale");
  objc_msgSend(v7, "setIconImage:scale:", v6);
  objc_autoreleasePoolPop(v5);

}

uint64_t __157__VCVoiceShortcutClient_ShareSheet__shareSheetWorkflowsForExtensionMatchingDictionaries_resolvedActivityItems_hostBundleIdentifier_iconSize_iconScale_error___block_invoke_38(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(a2, "glyphCharacter"));
}

- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_Suggestions.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_Suggestions.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[VCVoiceShortcutClient(Suggestions) getShortcutSuggestionsForAppWithBundleIdentifier:completion:]";
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEBUG, "%s Getting shortcut suggestions for app with bundleID: %{public}@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__VCVoiceShortcutClient_Suggestions__getShortcutSuggestionsForAppWithBundleIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5FC88A0;
  v16 = v9;
  v11 = v9;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getShortcutSuggestionsForAppWithBundleIdentifier:completion:", v7, v11);

}

- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 completion:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient_Suggestions.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  getWFVoiceShortcutClientLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VCVoiceShortcutClient(Suggestions) getShortcutSuggestionsForAllAppsWithLimit:completion:]";
    _os_log_impl(&dword_1AF681000, v8, OS_LOG_TYPE_DEBUG, "%s Getting shortcut suggestions for all apps", buf, 0xCu);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__VCVoiceShortcutClient_Suggestions__getShortcutSuggestionsForAllAppsWithLimit_completion___block_invoke;
  v12[3] = &unk_1E5FC88A0;
  v13 = v7;
  v9 = v7;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getShortcutSuggestionsForAllAppsWithLimit:completion:", a3, v9);

}

uint64_t __91__VCVoiceShortcutClient_Suggestions__getShortcutSuggestionsForAllAppsWithLimit_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __98__VCVoiceShortcutClient_Suggestions__getShortcutSuggestionsForAppWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (VCVoiceShortcutClient)initWithListenerEndpoint:(id)a3
{
  id v5;
  id v6;
  VCVoiceShortcutClient *v7;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__VCVoiceShortcutClient_initWithListenerEndpoint___block_invoke;
  v10[3] = &unk_1E5FC8438;
  v11 = v5;
  v6 = v5;
  v7 = -[VCVoiceShortcutClient initWithXPCConnectionCreationBlock:XPCInterfaceSetupBlock:](self, "initWithXPCConnectionCreationBlock:XPCInterfaceSetupBlock:", v10, 0);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[VCVoiceShortcutClient unsubscribeFromVoiceShortcutDataUpdateNotifications](self, "unsubscribeFromVoiceShortcutDataUpdateNotifications");
  v3.receiver = self;
  v3.super_class = (Class)VCVoiceShortcutClient;
  -[VCVoiceShortcutClient dealloc](&v3, sel_dealloc);
}

- (BOOL)requestDataMigration:(id *)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  _QWORD v8[6];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__18050;
  v14 = __Block_byref_object_dispose__18051;
  v4 = MEMORY[0x1E0C809B0];
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__VCVoiceShortcutClient_requestDataMigration___block_invoke;
  v9[3] = &unk_1E5FC8460;
  v9[4] = &v10;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __46__VCVoiceShortcutClient_requestDataMigration___block_invoke_2;
  v8[3] = &unk_1E5FC8488;
  v8[4] = &v16;
  v8[5] = &v10;
  objc_msgSend(v5, "requestDataMigration:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  v6 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

- (void)createVoiceShortcut:(id)a3 phrase:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phrase"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcut"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_4:
  getWFVoiceShortcutClientLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315395;
    v27 = "-[VCVoiceShortcutClient createVoiceShortcut:phrase:completion:]";
    v28 = 2113;
    v29 = v10;
    _os_log_impl(&dword_1AF681000, v12, OS_LOG_TYPE_DEBUG, "%s Creating VoiceShortcut for %{private}@", buf, 0x16u);
  }

  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke;
  v24[3] = &unk_1E5FC84D8;
  v25 = v9;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_72;
  v20[3] = &unk_1E5FC8500;
  v20[4] = self;
  v21 = v25;
  v22 = v10;
  v23 = v11;
  v14 = v10;
  v15 = v25;
  v16 = v11;
  objc_msgSend(v15, "_injectProxiesForImages:completion:", v24, v20);

}

- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 completion:(id)a6
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (unint64_t)a4;
  v13 = (unint64_t)a5;
  v14 = a6;
  v15 = v14;
  if (v11)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("voiceShortcutIdentifier"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  if (!(v12 | v13))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 178, CFSTR("Pass at least one parameter to update"));

  }
  getWFVoiceShortcutClientLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[VCVoiceShortcutClient updateVoiceShortcutWithIdentifier:phrase:shortcut:completion:]";
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1AF681000, v16, OS_LOG_TYPE_DEBUG, "%s Updating VoiceShortcut with id=%@", buf, 0x16u);
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __86__VCVoiceShortcutClient_updateVoiceShortcutWithIdentifier_phrase_shortcut_completion___block_invoke;
  v22[3] = &unk_1E5FC88A0;
  v23 = v15;
  v17 = v15;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateVoiceShortcutWithIdentifier:phrase:shortcut:completion:", v11, v12, v13, v17);

}

- (void)unsubscribeFromVoiceShortcutDataUpdateNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.siri.VoiceShortcuts.DataDidUpdateNotification"), 0);
  getWFVoiceShortcutClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[VCVoiceShortcutClient unsubscribeFromVoiceShortcutDataUpdateNotifications]";
    v7 = 2112;
    v8 = CFSTR("com.apple.siri.VoiceShortcuts.DataDidUpdateNotification");
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_DEBUG, "%s Unsubscribed from notification: (%@)", (uint8_t *)&v5, 0x16u);
  }

}

- (void)getSiriPodcastsDatabaseURLWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__VCVoiceShortcutClient_getSiriPodcastsDatabaseURLWithCompletion___block_invoke;
  v11[3] = &unk_1E5FC88A0;
  v6 = v4;
  v12 = v6;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __66__VCVoiceShortcutClient_getSiriPodcastsDatabaseURLWithCompletion___block_invoke_85;
  v9[3] = &unk_1E5FC8530;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getSiriPodcastsDatabaseURLWithCompletion:", v9);

}

- (void)refreshTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  getWFVoiceShortcutClientLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[VCVoiceShortcutClient refreshTriggerWithIdentifier:completion:]";
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_DEBUG, "%s [Triggers] Refreshing trigger (id: %@)", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__VCVoiceShortcutClient_refreshTriggerWithIdentifier_completion___block_invoke;
  v13[3] = &unk_1E5FC88A0;
  v14 = v8;
  v10 = v8;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "refreshTriggerWithIdentifier:completion:", v7, v10);

}

- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  getWFVoiceShortcutClientLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[VCVoiceShortcutClient unregisterTriggerWithIdentifier:triggerBacking:completion:]";
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_DEBUG, "%s [Triggers] Unregistering trigger (id: %@)", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__VCVoiceShortcutClient_unregisterTriggerWithIdentifier_triggerBacking_completion___block_invoke;
  v15[3] = &unk_1E5FC88A0;
  v16 = v10;
  v12 = v10;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unregisterTriggerWithIdentifier:triggerBacking:completion:", v9, a4, v12);

}

- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  getWFVoiceShortcutClientLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[VCVoiceShortcutClient getConfiguredTriggerDescriptionsWithCompletion:]";
    _os_log_impl(&dword_1AF681000, v6, OS_LOG_TYPE_DEBUG, "%s [Triggers] Getting trigger IDs", buf, 0xCu);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__VCVoiceShortcutClient_getConfiguredTriggerDescriptionsWithCompletion___block_invoke;
  v10[3] = &unk_1E5FC88A0;
  v11 = v5;
  v7 = v5;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getConfiguredTriggerDescriptionsWithCompletion:", v7);

}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerIdentifier"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[VCVoiceShortcutClient fireTriggerWithIdentifier:force:completion:]";
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1AF681000, v12, OS_LOG_TYPE_DEBUG, "%s [Triggers] Running trigger (id: %@)", buf, 0x16u);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__VCVoiceShortcutClient_fireTriggerWithIdentifier_force_completion___block_invoke;
  v17[3] = &unk_1E5FC88A0;
  v18 = v11;
  v13 = v11;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fireTriggerWithIdentifier:force:completion:", v9, v6, v13);

}

- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[VCVoiceShortcutClient checkTriggerStateWithIdentifier:completion:]";
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEBUG, "%s [Triggers] Checking state for trigger (id: %@)", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__VCVoiceShortcutClient_checkTriggerStateWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5FC88A0;
  v16 = v9;
  v11 = v9;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "checkTriggerStateWithIdentifier:completion:", v7, v11);

}

- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 296, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[VCVoiceShortcutClient checkTriggerStateWithKeyPath:completion:]";
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEBUG, "%s [Triggers] Checking state for keyPath: %@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__VCVoiceShortcutClient_checkTriggerStateWithKeyPath_completion___block_invoke;
  v15[3] = &unk_1E5FC88A0;
  v16 = v9;
  v11 = v9;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "checkTriggerStateWithKeyPath:completion:", v7, v11);

}

- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("triggerIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[VCVoiceShortcutClient deleteTriggerWithIdentifier:completion:]";
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1AF681000, v10, OS_LOG_TYPE_DEBUG, "%s [Triggers] Deleting trigger (id: %@)", buf, 0x16u);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__VCVoiceShortcutClient_deleteTriggerWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E5FC88A0;
  v16 = v9;
  v11 = v9;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deleteTriggerWithIdentifier:completion:", v7, v11);

}

- (id)getVaultItemsAccessForBackgroundRunner
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18050;
  v12 = __Block_byref_object_dispose__18051;
  v2 = MEMORY[0x1E0C809B0];
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__VCVoiceShortcutClient_getVaultItemsAccessForBackgroundRunner__block_invoke;
  v7[3] = &unk_1E5FC8460;
  v7[4] = &v8;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __63__VCVoiceShortcutClient_getVaultItemsAccessForBackgroundRunner__block_invoke_2;
  v6[3] = &unk_1E5FC8558;
  v6[4] = &v8;
  objc_msgSend(v3, "getVaultItemsAccessForBackgroundRunner:", v6);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__VCVoiceShortcutClient_getOnScreenContentWithOptions_completion___block_invoke;
  v10[3] = &unk_1E5FC88A0;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getOnScreenContentWithOptions:completion:", v8, v7);

}

- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__VCVoiceShortcutClient_getOnScreenContentWithOptions_completionHandler___block_invoke;
  v10[3] = &unk_1E5FC88A0;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getOnScreenContentWithOptions:completionHandler:", v8, v7);

}

- (void)obliterateShortcuts:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__VCVoiceShortcutClient_obliterateShortcuts___block_invoke;
  v7[3] = &unk_1E5FC88A0;
  v8 = v4;
  v5 = v4;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "obliterateShortcuts:", v5);

}

- (void)importSharedShortcutFromURL:(id)a3 withName:(id)a4 shortcutSource:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  id v36;
  VCVoiceShortcutClient *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE buf[24];
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v11)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 352, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFVoiceShortcutClientLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1AF681000, v16, OS_LOG_TYPE_DEBUG, "%s Importing shared shortcut at URL %@", buf, 0x16u);
  }

  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v17 = (void *)getWFGallerySessionManagerClass_softClass;
  v43 = getWFGallerySessionManagerClass_softClass;
  v18 = MEMORY[0x1E0C809B0];
  if (!getWFGallerySessionManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getWFGallerySessionManagerClass_block_invoke;
    v45 = &unk_1E5FC8858;
    v46 = &v40;
    __getWFGallerySessionManagerClass_block_invoke((uint64_t)buf);
    v17 = (void *)v41[3];
  }
  v19 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v19, "performSelector:", sel_sharedManager);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v41 = &v40;
  v42 = 0x2050000000;
  v21 = (void *)get_ICURLRequestClass_softClass;
  v43 = get_ICURLRequestClass_softClass;
  if (!get_ICURLRequestClass_softClass)
  {
    *(_QWORD *)buf = v18;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __get_ICURLRequestClass_block_invoke;
    v45 = &unk_1E5FC8858;
    v46 = &v40;
    __get_ICURLRequestClass_block_invoke((uint64_t)buf);
    v21 = (void *)v41[3];
  }
  v22 = objc_retainAutorelease(v21);
  _Block_object_dispose(&v40, 8);
  objc_msgSend(v22, "performSelector:withObject:", sel_requestWithURL_, v11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "performSelector:", sel_subAction);
  aBlock[0] = v18;
  aBlock[1] = 3221225472;
  aBlock[2] = __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke;
  aBlock[3] = &unk_1E5FC85D0;
  v34 = v11;
  v35 = v20;
  v36 = v12;
  v37 = self;
  v38 = v13;
  v39 = v15;
  v25 = v13;
  v26 = v12;
  v27 = v20;
  v28 = v15;
  v29 = v11;
  v30 = _Block_copy(aBlock);
  objc_msgSend(v27, "performSelector:withObject:withObject:", sel_getWorkflowForIdentifier_completionHandler_, v24, v30);

}

- (void)importSharedShortcutFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__VCVoiceShortcutClient_importSharedShortcutFromURL_completion___block_invoke;
  v8[3] = &unk_1E5FC85F8;
  v9 = v6;
  v7 = v6;
  -[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:](self, "importSharedShortcutFromURL:withName:shortcutSource:completion:", a3, 0, 0, v8);

}

- (void)importShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowRecordData"));

    if (v15)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCVoiceShortcutClient.m"), 405, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v14)
    goto LABEL_5;
LABEL_3:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__VCVoiceShortcutClient_importShortcutWithRecordData_name_shortcutSource_completion___block_invoke;
  v20[3] = &unk_1E5FC88A0;
  v21 = v15;
  v16 = v15;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createShortcutWithRecordData:name:shortcutSource:completion:", v11, v12, v13, v16);

}

- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__VCVoiceShortcutClient_sendAceCommandDictionary_completion___block_invoke;
  v10[3] = &unk_1E5FC88A0;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendAceCommandDictionary:completion:", v8, v7);

}

- (id)foldersWithError:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v4, objc_opt_class(), a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)shortcutWithIdentifier:(id)a3 glyphSize:(CGSize)a4 error:(id *)a5
{
  double height;
  double width;
  id v8;
  WFDatabaseObjectDescriptor *v9;
  void *v10;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v9 = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:]([WFDatabaseObjectDescriptor alloc], "initWithIdentifier:objectType:", v8, 0);

  +[WFObservableObjectResult getResultWithDescriptor:valueType:glyphSize:error:](WFObservableObjectResult, "getResultWithDescriptor:valueType:glyphSize:error:", v9, objc_opt_class(), a5, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)shortcutWithIdentifier:(id)a3 error:(id *)a4
{
  return -[VCVoiceShortcutClient shortcutWithIdentifier:glyphSize:error:](self, "shortcutWithIdentifier:glyphSize:error:", a3, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (id)shortcutsInCollectionWithIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  WFWorkflowQuery *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  v7 = [WFWorkflowQuery alloc];
  if (v6)
    v8 = -[WFWorkflowQuery initWithFolderIdentifier:](v7, "initWithFolderIdentifier:", v5);
  else
    v8 = -[WFWorkflowQuery initWithLocation:](v7, "initWithLocation:", 1);
  v9 = (void *)v8;
  +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v8, objc_opt_class(), a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)visibleShortcutsWithError:(id *)a3
{
  WFWorkflowQuery *v4;
  void *v5;

  v4 = -[WFWorkflowQuery initWithLocation:]([WFWorkflowQuery alloc], "initWithLocation:", 0);
  +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:error:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:error:", v4, objc_opt_class(), a3, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)getWidgetWorkflowWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  WFDatabaseObjectDescriptor *v8;

  v5 = a4;
  v6 = a3;
  v8 = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:]([WFDatabaseObjectDescriptor alloc], "initWithIdentifier:objectType:", v6, 0);

  v7 = objc_opt_class();
  +[VCWidgetWorkflow largeGlyphSize](VCWidgetWorkflow, "largeGlyphSize");
  +[WFObservableObjectResult getResultWithDescriptor:valueType:glyphSize:completionHandler:](WFObservableObjectResult, "getResultWithDescriptor:valueType:glyphSize:completionHandler:", v8, v7, v5);

}

- (void)getWidgetWorkflowsInCollectionWithIdentifier:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  WFWorkflowQuery *v9;
  WFWorkflowQuery *v10;
  WFWorkflowQuery *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v7 = a5;
  v8 = objc_msgSend(v13, "length");
  v9 = [WFWorkflowQuery alloc];
  if (v8)
    v10 = -[WFWorkflowQuery initWithFolderIdentifier:](v9, "initWithFolderIdentifier:", v13);
  else
    v10 = -[WFWorkflowQuery initWithLocation:](v9, "initWithLocation:", 0);
  v11 = v10;
  -[WFWorkflowQuery setResultsLimit:](v10, "setResultsLimit:", a4);
  v12 = objc_opt_class();
  +[VCWidgetWorkflow smallGlyphSize](VCWidgetWorkflow, "smallGlyphSize");
  +[WFObservableArrayResult getResultWithQuery:valueType:glyphSize:completionHandler:](WFObservableArrayResult, "getResultWithQuery:valueType:glyphSize:completionHandler:", v11, v12, v7);

}

- (id)firstUnsortedWorkflowWithBackgroundColorValue:(id *)a3 error:(id *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[7];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
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
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__18050;
  v31 = __Block_byref_object_dispose__18051;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__18050;
  v25 = __Block_byref_object_dispose__18051;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18050;
  v19 = __Block_byref_object_dispose__18051;
  v6 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__VCVoiceShortcutClient_firstUnsortedWorkflowWithBackgroundColorValue_error___block_invoke;
  v14[3] = &unk_1E5FC8460;
  v14[4] = &v15;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __77__VCVoiceShortcutClient_firstUnsortedWorkflowWithBackgroundColorValue_error___block_invoke_2;
  v13[3] = &unk_1E5FC8620;
  v13[4] = &v27;
  v13[5] = &v21;
  v13[6] = &v15;
  objc_msgSend(v7, "getFirstUnsortedWorkflowWithCompletion:", v13);
  v8 = (void *)v22[5];
  if (v8)
    *a3 = objc_retainAutorelease(v8);
  if (v16[5])
  {
    getWFVoiceShortcutClientLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = v16[5];
      *(_DWORD *)buf = 136315394;
      v34 = "-[VCVoiceShortcutClient firstUnsortedWorkflowWithBackgroundColorValue:error:]";
      v35 = 2114;
      v36 = v10;
      _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_ERROR, "%s Could not fetch first unsorted shortcut: %{public}@", buf, 0x16u);
    }

    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v16[5]);
  }
  else
  {
    v11 = (id)v28[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

- (void)getResultsForQuery:(id)a3 resultClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__VCVoiceShortcutClient_getResultsForQuery_resultClass_completion___block_invoke;
  v13[3] = &unk_1E5FC88A0;
  v14 = v8;
  v9 = v8;
  v10 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getResultsForQuery:resultClassName:completion:", v10, v12, v9);

}

- (id)getResultsForQuery:(id)a3 resultClass:(Class)a4 resultState:(id *)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[7];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__18050;
  v36 = __Block_byref_object_dispose__18051;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__18050;
  v30 = __Block_byref_object_dispose__18051;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__18050;
  v24 = __Block_byref_object_dispose__18051;
  v11 = MEMORY[0x1E0C809B0];
  v25 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__VCVoiceShortcutClient_getResultsForQuery_resultClass_resultState_error___block_invoke;
  v19[3] = &unk_1E5FC8460;
  v19[4] = &v32;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __74__VCVoiceShortcutClient_getResultsForQuery_resultClass_resultState_error___block_invoke_2;
  v18[3] = &unk_1E5FC8648;
  v18[4] = &v20;
  v18[5] = &v26;
  v18[6] = &v32;
  objc_msgSend(v12, "getResultsForQuery:resultClassName:completion:", v10, v13, v18);

  v14 = (void *)v33[5];
  if (v14)
  {
    v15 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v14);
  }
  else
  {
    if (a5)
    {
      v16 = (void *)v27[5];
      if (v16)
        *a5 = objc_retainAutorelease(v16);
    }
    v15 = (id)v21[5];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v15;
}

- (void)getValueForDescriptor:(id)a3 resultClass:(Class)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__VCVoiceShortcutClient_getValueForDescriptor_resultClass_completion___block_invoke;
  v13[3] = &unk_1E5FC88A0;
  v14 = v8;
  v9 = v8;
  v10 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getValueForDescriptor:resultClassName:completion:", v10, v12, v9);

}

- (id)getValueForDescriptor:(id)a3 resultClass:(Class)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18050;
  v27 = __Block_byref_object_dispose__18051;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__18050;
  v21 = __Block_byref_object_dispose__18051;
  v9 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__VCVoiceShortcutClient_getValueForDescriptor_resultClass_error___block_invoke;
  v16[3] = &unk_1E5FC8460;
  v16[4] = &v23;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __65__VCVoiceShortcutClient_getValueForDescriptor_resultClass_error___block_invoke_2;
  v15[3] = &unk_1E5FC8670;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend(v10, "getValueForDescriptor:resultClassName:completion:", v8, v11, v15);

  v12 = (void *)v24[5];
  if (v12)
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  else
  {
    v13 = (id)v18[5];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v10 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__VCVoiceShortcutClient_setPerWorkflowStateData_forSmartPromptWithActionUUID_reference_completion___block_invoke;
  v16[3] = &unk_1E5FC88A0;
  v17 = v10;
  v11 = v10;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPerWorkflowStateData:forSmartPromptWithActionUUID:reference:completion:", v14, v13, v12, v11);

}

- (id)synchronousRemoteDataStoreWithErrorHandler:(id)a3
{
  return -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:synchronous:](self, "asynchronousRemoteDataStoreWithErrorHandler:synchronous:", a3, 1);
}

- (void)callErrorHandlerIfNeeded:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *internalStateQueue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  internalStateQueue = self->_internalStateQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__VCVoiceShortcutClient_callErrorHandlerIfNeeded_withError___block_invoke;
  v11[3] = &unk_1E5FC86E8;
  v11[4] = self;
  v9 = v6;
  v13 = v9;
  v10 = v7;
  v12 = v10;
  v14 = &v15;
  dispatch_sync(internalStateQueue, v11);
  if (*((_BYTE *)v16 + 24))
    (*((void (**)(id, id))v9 + 2))(v9, v10);

  _Block_object_dispose(&v15, 8);
}

- (id)unsafePopConnectionErrorHandlers
{
  void *v3;
  void *v4;
  void *v5;

  -[VCVoiceShortcutClient errorHandlers](self, "errorHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VCVoiceShortcutClient errorHandlers](self, "errorHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  return v4;
}

- (void)handleXPCConnectionInterruption
{
  NSObject *internalStateQueue;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18050;
  v17 = __Block_byref_object_dispose__18051;
  v18 = 0;
  internalStateQueue = self->_internalStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCVoiceShortcutClient_handleXPCConnectionInterruption__block_invoke;
  block[3] = &unk_1E5FC8710;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(internalStateQueue, block);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v14[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

- (void)handleXPCConnectionInvalidation
{
  NSObject *internalStateQueue;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18050;
  v17 = __Block_byref_object_dispose__18051;
  v18 = 0;
  internalStateQueue = self->_internalStateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__VCVoiceShortcutClient_handleXPCConnectionInvalidation__block_invoke;
  block[3] = &unk_1E5FC8710;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(internalStateQueue, block);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4099, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)v14[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v19, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

- (id)drawGlyphs:(id)a3 atSize:(CGSize)a4 withBackgroundColorValues:(id)a5 error:(id *)a6
{
  return -[VCVoiceShortcutClient drawGlyphs:atSize:withBackgroundColorValues:padding:error:](self, "drawGlyphs:atSize:withBackgroundColorValues:padding:error:", a3, a5, a6, a4.width, a4.height, 0.0);
}

- (id)drawGlyphs:(id)a3 atSize:(CGSize)a4 withBackgroundColorValues:(id)a5 padding:(double)a6 error:(id *)a7
{
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  CGColorSpace *DeviceRGB;
  WFRemoteImageDrawingContext *v20;
  unint64_t i;
  NSObject *v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  height = a4.height;
  width = a4.width;
  v35 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__18050;
  v29 = __Block_byref_object_dispose__18051;
  v30 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __83__VCVoiceShortcutClient_drawGlyphs_atSize_withBackgroundColorValues_padding_error___block_invoke;
  v24[3] = &unk_1E5FC8460;
  v24[4] = &v25;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26[5])
  {
    getWFVoiceShortcutClientLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v26[5];
      *(_DWORD *)buf = 136315394;
      v32 = "-[VCVoiceShortcutClient drawGlyphs:atSize:withBackgroundColorValues:padding:error:]";
      v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_1AF681000, v16, OS_LOG_TYPE_ERROR, "%s Could not fetch first unsorted shortcut: %{public}@", buf, 0x16u);
    }

    if (a7)
    {
      v18 = 0;
      *a7 = objc_retainAutorelease((id)v26[5]);
      goto LABEL_16;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_16;
  }
  if (!objc_msgSend(v13, "count"))
    goto LABEL_11;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v20 = -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:]([WFRemoteImageDrawingContext alloc], "initWithImageCount:singleImageSize:scale:colorSpace:", objc_msgSend(v13, "count"), DeviceRGB, width, height, 0.0);
  CGColorSpaceRelease(DeviceRGB);
  if (v20)
  {
    objc_msgSend(v15, "drawGlyphs:withBackgroundColorValues:padding:intoContext:completion:", v13, v14, v20, &__block_literal_global_141, a6);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i < objc_msgSend(v13, "count"); ++i)
      objc_msgSend(v18, "addObject:", -[WFRemoteImageDrawingContext imageAtIndex:](v20, "imageAtIndex:", i));
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[VCVoiceShortcutClient drawGlyphs:atSize:withBackgroundColorValues:padding:error:]";
      _os_log_impl(&dword_1AF681000, v22, OS_LOG_TYPE_FAULT, "%s Couldn't create image drawing context on the client side. Not drawing glyphs. See logs from WFRemoteImageDrawingContext", buf, 0xCu);
    }

    v18 = 0;
  }

LABEL_16:
  _Block_object_dispose(&v25, 8);

  return v18;
}

- (void)showSingleStepCompletionForWebClip:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__VCVoiceShortcutClient_showSingleStepCompletionForWebClip_completion___block_invoke;
  v10[3] = &unk_1E5FC88A0;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showSingleStepCompletionForWebClip:completion:", v8, v7);

}

- (id)resolveFilePath:(id)a3 workflowID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__18050;
  v26 = __Block_byref_object_dispose__18051;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__18050;
  v20 = __Block_byref_object_dispose__18051;
  v10 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__VCVoiceShortcutClient_resolveFilePath_workflowID_error___block_invoke;
  v15[3] = &unk_1E5FC8460;
  v15[4] = &v22;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __58__VCVoiceShortcutClient_resolveFilePath_workflowID_error___block_invoke_2;
  v14[3] = &unk_1E5FC8758;
  v14[4] = &v22;
  v14[5] = &v16;
  objc_msgSend(v11, "resolveFilePath:workflowID:completion:", v8, v9, v14);

  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);
  v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (id)resolveBookmarkData:(id)a3 updatedData:(id *)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[7];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
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

  v8 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__18050;
  v31 = __Block_byref_object_dispose__18051;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__18050;
  v25 = __Block_byref_object_dispose__18051;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18050;
  v19 = __Block_byref_object_dispose__18051;
  v9 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__VCVoiceShortcutClient_resolveBookmarkData_updatedData_error___block_invoke;
  v14[3] = &unk_1E5FC8460;
  v14[4] = &v27;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __63__VCVoiceShortcutClient_resolveBookmarkData_updatedData_error___block_invoke_2;
  v13[3] = &unk_1E5FC8780;
  v13[4] = &v27;
  v13[5] = &v15;
  v13[6] = &v21;
  objc_msgSend(v10, "resolveBookmarkData:completion:", v8, v13);

  if (a5)
    *a5 = objc_retainAutorelease((id)v28[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v11 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

- (id)resolveCrossDeviceItemID:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18050;
  v23 = __Block_byref_object_dispose__18051;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18050;
  v17 = __Block_byref_object_dispose__18051;
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__VCVoiceShortcutClient_resolveCrossDeviceItemID_error___block_invoke;
  v12[3] = &unk_1E5FC8460;
  v12[4] = &v19;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __56__VCVoiceShortcutClient_resolveCrossDeviceItemID_error___block_invoke_2;
  v11[3] = &unk_1E5FC87A8;
  v11[4] = &v13;
  v11[5] = &v19;
  objc_msgSend(v8, "resolveCrossDeviceItemID:completion:", v6, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (id)createBookmarkWithURL:(id)a3 workflowID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__18050;
  v26 = __Block_byref_object_dispose__18051;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__18050;
  v20 = __Block_byref_object_dispose__18051;
  v10 = MEMORY[0x1E0C809B0];
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__VCVoiceShortcutClient_createBookmarkWithURL_workflowID_error___block_invoke;
  v15[3] = &unk_1E5FC8460;
  v15[4] = &v22;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __64__VCVoiceShortcutClient_createBookmarkWithURL_workflowID_error___block_invoke_2;
  v14[3] = &unk_1E5FC87D0;
  v14[4] = &v16;
  v14[5] = &v22;
  objc_msgSend(v11, "createBookmarkWithURL:workflowID:completion:", v8, v9, v14);

  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);
  v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (id)createBookmarkWithBookmarkableString:(id)a3 path:(id)a4 workflowID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__18050;
  v29 = __Block_byref_object_dispose__18051;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18050;
  v23 = __Block_byref_object_dispose__18051;
  v13 = MEMORY[0x1E0C809B0];
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__VCVoiceShortcutClient_createBookmarkWithBookmarkableString_path_workflowID_error___block_invoke;
  v18[3] = &unk_1E5FC8460;
  v18[4] = &v25;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __84__VCVoiceShortcutClient_createBookmarkWithBookmarkableString_path_workflowID_error___block_invoke_2;
  v17[3] = &unk_1E5FC87D0;
  v17[4] = &v19;
  v17[5] = &v25;
  objc_msgSend(v14, "createBookmarkWithBookmarkableString:path:workflowID:completion:", v10, v11, v12, v17);

  if (a6)
    *a6 = objc_retainAutorelease((id)v26[5]);
  v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (id)fetchURLForFPItem:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__18050;
  v23 = __Block_byref_object_dispose__18051;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__18050;
  v17 = __Block_byref_object_dispose__18051;
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__VCVoiceShortcutClient_fetchURLForFPItem_error___block_invoke;
  v12[3] = &unk_1E5FC8460;
  v12[4] = &v19;
  -[VCVoiceShortcutClient synchronousRemoteDataStoreWithErrorHandler:](self, "synchronousRemoteDataStoreWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __49__VCVoiceShortcutClient_fetchURLForFPItem_error___block_invoke_2;
  v11[3] = &unk_1E5FC87A8;
  v11[4] = &v19;
  v11[5] = &v13;
  objc_msgSend(v8, "fetchURLForFPItem:completion:", v6, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", &__block_literal_global_147);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationWithRequest:presentationMode:runningContext:", v9, a4, v8);

}

- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", &__block_literal_global_148_18049);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  WFEncodableError(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "postNotificationAboutFailure:inWorkflow:dialogAttribution:runningContext:", v14, v12, v11, v10);
}

- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__VCVoiceShortcutClient_toastSessionKitSessionWithIdentifier_forDuration_completion___block_invoke;
  v13[3] = &unk_1E5FC88A0;
  v14 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "toastSessionKitSessionWithIdentifier:forDuration:completion:", v11, v10, v9);

}

- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__VCVoiceShortcutClient_dismissToastedSessionKitSessionsWithReason_completion___block_invoke;
  v10[3] = &unk_1E5FC88A0;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissToastedSessionKitSessionsWithReason:completion:", v8, v7);

}

- (OS_dispatch_queue)internalStateQueue
{
  return self->_internalStateQueue;
}

- (WFSystemSurfaceWorkflowStatusRegistry)systemSurfaceStatus
{
  return self->_systemSurfaceStatus;
}

- (WFVoiceShortcutCache)voiceShortcutCache
{
  return self->_voiceShortcutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceShortcutCache, 0);
  objc_storeStrong((id *)&self->_systemSurfaceStatus, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong(&self->_interfaceSetupBlock, 0);
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_internalStateQueue, 0);
}

uint64_t __79__VCVoiceShortcutClient_dismissToastedSessionKitSessionsWithReason_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__VCVoiceShortcutClient_toastSessionKitSessionWithIdentifier_forDuration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__VCVoiceShortcutClient_fetchURLForFPItem_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__VCVoiceShortcutClient_fetchURLForFPItem_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __84__VCVoiceShortcutClient_createBookmarkWithBookmarkableString_path_workflowID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __84__VCVoiceShortcutClient_createBookmarkWithBookmarkableString_path_workflowID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __64__VCVoiceShortcutClient_createBookmarkWithURL_workflowID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __64__VCVoiceShortcutClient_createBookmarkWithURL_workflowID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __56__VCVoiceShortcutClient_resolveCrossDeviceItemID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __56__VCVoiceShortcutClient_resolveCrossDeviceItemID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __63__VCVoiceShortcutClient_resolveBookmarkData_updatedData_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __63__VCVoiceShortcutClient_resolveBookmarkData_updatedData_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = a2;
  v8 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a4);
  v14 = a4;
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;
  v11 = v8;

  v12 = *(_QWORD *)(a1[6] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;

}

void __58__VCVoiceShortcutClient_resolveFilePath_workflowID_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__VCVoiceShortcutClient_resolveFilePath_workflowID_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __71__VCVoiceShortcutClient_showSingleStepCompletionForWebClip_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__VCVoiceShortcutClient_drawGlyphs_atSize_withBackgroundColorValues_padding_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__VCVoiceShortcutClient_unsafeSetupXPCConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFVoiceShortcutClientLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[VCVoiceShortcutClient unsafeSetupXPCConnection]_block_invoke";
    _os_log_impl(&dword_1AF681000, v2, OS_LOG_TYPE_ERROR, "%s Client connection to VCVoiceShortcut XPC server interrupted", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "handleXPCConnectionInterruption");
}

void __49__VCVoiceShortcutClient_unsafeSetupXPCConnection__block_invoke_138(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFVoiceShortcutClientLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[VCVoiceShortcutClient unsafeSetupXPCConnection]_block_invoke";
    _os_log_impl(&dword_1AF681000, v2, OS_LOG_TYPE_ERROR, "%s Client connection invalidated to VoiceShortcut server XPC interface", (uint8_t *)&v3, 0xCu);
  }

  objc_msgSend(WeakRetained, "handleXPCConnectionInvalidation");
}

void __56__VCVoiceShortcutClient_handleXPCConnectionInvalidation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
  objc_msgSend(*(id *)(a1 + 32), "unsafePopConnectionErrorHandlers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__VCVoiceShortcutClient_handleXPCConnectionInterruption__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "unsafePopConnectionErrorHandlers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __60__VCVoiceShortcutClient_callErrorHandlerIfNeeded_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "errorHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _Block_copy(*(const void **)(a1 + 48));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(*(const void **)(a1 + 48));
    objc_msgSend(v5, "removeObject:", v6);

    getWFVoiceShortcutClientLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "xpcConnection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 136315906;
      v12 = "-[VCVoiceShortcutClient callErrorHandlerIfNeeded:withError:]_block_invoke";
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1AF681000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@ received error from connection %{public}@ during remote call: %{public}@", (uint8_t *)&v11, 0x2Au);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

uint64_t __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callErrorHandlerIfNeeded:withError:", *(_QWORD *)(a1 + 40), a2);
}

void __81__VCVoiceShortcutClient_asynchronousRemoteDataStoreWithErrorHandler_synchronous___block_invoke_3(uint64_t a1)
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
  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
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

void __99__VCVoiceShortcutClient_setPerWorkflowStateData_forSmartPromptWithActionUUID_reference_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFVoiceShortcutClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[VCVoiceShortcutClient setPerWorkflowStateData:forSmartPromptWithActionUUID:reference:completion:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_ERROR, "%s Error occured with remote connection: %{public}@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__VCVoiceShortcutClient_getValueForDescriptor_resultClass_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__VCVoiceShortcutClient_getValueForDescriptor_resultClass_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

uint64_t __70__VCVoiceShortcutClient_getValueForDescriptor_resultClass_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__VCVoiceShortcutClient_getResultsForQuery_resultClass_resultState_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__VCVoiceShortcutClient_getResultsForQuery_resultClass_resultState_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

uint64_t __67__VCVoiceShortcutClient_getResultsForQuery_resultClass_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__VCVoiceShortcutClient_firstUnsortedWorkflowWithBackgroundColorValue_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__VCVoiceShortcutClient_firstUnsortedWorkflowWithBackgroundColorValue_error___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1[4] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;
  v17 = v7;

  v12 = *(_QWORD *)(a1[5] + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v8;
  v14 = v8;

  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v9;

}

uint64_t __61__VCVoiceShortcutClient_sendAceCommandDictionary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__VCVoiceShortcutClient_importShortcutWithRecordData_name_shortcutSource_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__VCVoiceShortcutClient_importSharedShortcutFromURL_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

void __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (**v8)(void *, id, _QWORD *);
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke_107;
    aBlock[3] = &unk_1E5FC8580;
    v23 = *(id *)(a1 + 40);
    v8 = (void (**)(void *, id, _QWORD *))_Block_copy(aBlock);
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke_2;
    v16[3] = &unk_1E5FC85A8;
    v17 = v5;
    v21 = *(id *)(a1 + 72);
    v9 = *(id *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(void **)(a1 + 64);
    v18 = v9;
    v19 = v10;
    v20 = v11;
    v8[2](v8, v17, v16);

    v12 = v23;
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v25 = "-[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:]_block_invoke";
      v26 = 2114;
      v27 = v14;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_1AF681000, v13, OS_LOG_TYPE_ERROR, "%s Error downloading CloudKit record from URL %{public}@: %{public}@", buf, 0x20u);
    }

    v15 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 8001, CFSTR("Error downloading CloudKit record"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v12);
  }

}

void __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v7 = (void *)getWFSharedShortcutClass_softClass;
  v21 = getWFSharedShortcutClass_softClass;
  if (!getWFSharedShortcutClass_softClass)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getWFSharedShortcutClass_block_invoke;
    v16 = &unk_1E5FC8858;
    v17 = &v18;
    __getWFSharedShortcutClass_block_invoke((uint64_t)&v13);
    v7 = (void *)v19[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v18, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[2](v6, objc_msgSend(v5, "performSelector:", sel_workflowRecord), 0);
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v9 = (void *)getWFGalleryWorkflowClass_softClass;
    v21 = getWFGalleryWorkflowClass_softClass;
    if (!getWFGalleryWorkflowClass_softClass)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __getWFGalleryWorkflowClass_block_invoke;
      v16 = &unk_1E5FC8858;
      v17 = &v18;
      __getWFGalleryWorkflowClass_block_invoke((uint64_t)&v13);
      v9 = (void *)v19[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v18, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = *(void **)(a1 + 32);
      v12 = _Block_copy(v6);
      objc_msgSend(v11, "performSelector:withObject:withObject:", sel_loadWorkflowInGalleryWorkflow_completionHandler_, v5, v12);

    }
    else
    {
      v6[2](v6, 0, 0);
    }
  }

}

void __88__VCVoiceShortcutClient_importSharedShortcutFromURL_withName_shortcutSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v14 = 0;
    objc_msgSend((id)objc_msgSend(v3, "performSelector:", sel_fileRepresentation), sel_fileDataWithError_, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 40);
      if (!v7)
        v7 = objc_msgSend(v4, "performSelector:", sel_name);
      objc_msgSend(*(id *)(a1 + 48), "importShortcutWithRecordData:name:shortcutSource:completion:", v5, v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    }
    else
    {
      getWFVoiceShortcutClientLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:]_block_invoke";
        v17 = 2114;
        v18 = v6;
        _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_ERROR, "%s Failed to serialize workflow record %{public}@", buf, 0x16u);
      }

      v12 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 8001, CFSTR("Failed to serialize workflow record"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v16 = "-[VCVoiceShortcutClient importSharedShortcutFromURL:withName:shortcutSource:completion:]_block_invoke_2";
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1AF681000, v8, OS_LOG_TYPE_ERROR, "%s Failed to extract workflow record from downloaded CloudKit record %{public}@", buf, 0x16u);
    }

    v10 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 8001, CFSTR("Failed to extract workflow record from downloaded CloudKit record"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v6);
  }

}

uint64_t __45__VCVoiceShortcutClient_obliterateShortcuts___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__VCVoiceShortcutClient_getOnScreenContentWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__VCVoiceShortcutClient_getOnScreenContentWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__VCVoiceShortcutClient_getVaultItemsAccessForBackgroundRunner__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__VCVoiceShortcutClient_getVaultItemsAccessForBackgroundRunner__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __64__VCVoiceShortcutClient_deleteTriggerWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VCVoiceShortcutClient_checkTriggerStateWithKeyPath_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__VCVoiceShortcutClient_checkTriggerStateWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__VCVoiceShortcutClient_fireTriggerWithIdentifier_force_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__VCVoiceShortcutClient_getConfiguredTriggerDescriptionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__VCVoiceShortcutClient_unregisterTriggerWithIdentifier_triggerBacking_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __65__VCVoiceShortcutClient_refreshTriggerWithIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__VCVoiceShortcutClient_getSiriPodcastsDatabaseURLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getWFVoiceShortcutClientLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315394;
    v6 = "-[VCVoiceShortcutClient getSiriPodcastsDatabaseURLWithCompletion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_DEBUG, "%s Error getting async proxy %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__VCVoiceShortcutClient_getSiriPodcastsDatabaseURLWithCompletion___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "startAccessingSecurityScopedResource");

  if (v5 && (v8 & 1) != 0)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D20]);
    objc_msgSend(v5, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
    v11 = (void *)objc_msgSend(v9, "initWithContentsOfURL:error:", v10, &v15);
    v12 = v15;

    objc_msgSend(v5, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopAccessingSecurityScopedResource");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = v12;
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[VCVoiceShortcutClient getSiriPodcastsDatabaseURLWithCompletion:]_block_invoke";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1AF681000, v14, OS_LOG_TYPE_DEBUG, "%s Error getting sirir db %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __70__VCVoiceShortcutClient_setInteger_forKey_inDomain_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__VCVoiceShortcutClient_updateVoiceShortcutWithIdentifier_phrase_shortcut_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_keyImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_2;
    v9[3] = &unk_1E5FC84B0;
    v10 = v5;
    v11 = *(id *)(a1 + 32);
    v12 = v6;
    objc_msgSend(v10, "_retrieveImageDataWithReply:", v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_72(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_2_73;
  v4[3] = &unk_1E5FC88A0;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "asynchronousRemoteDataStoreWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addVoiceShortcut:phrase:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_2_73(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__VCVoiceShortcutClient_createVoiceShortcut_phrase_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    getWFVoiceShortcutClientLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      v10 = 136315906;
      v11 = "-[VCVoiceShortcutClient createVoiceShortcut:phrase:completion:]_block_invoke_2";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1AF681000, v7, OS_LOG_TYPE_ERROR, "%s Failed to retrieve key image data from proxy %@ for shortcut %@ due to error: %@", (uint8_t *)&v10, 0x2Au);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __46__VCVoiceShortcutClient_requestDataMigration___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __46__VCVoiceShortcutClient_requestDataMigration___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

id __50__VCVoiceShortcutClient_initWithListenerEndpoint___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", *(_QWORD *)(a1 + 32));
}

- (void)triggerFullContextualActionReindexWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__VCVoiceShortcutClient_Spotlight__triggerFullContextualActionReindexWithCompletion___block_invoke;
  v7[3] = &unk_1E5FC88A0;
  v8 = v4;
  v5 = v4;
  -[VCVoiceShortcutClient asynchronousRemoteDataStoreWithErrorHandler:](self, "asynchronousRemoteDataStoreWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerFullContextualActionReindexWithCompletion:", v5);

}

uint64_t __85__VCVoiceShortcutClient_Spotlight__triggerFullContextualActionReindexWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

@end
