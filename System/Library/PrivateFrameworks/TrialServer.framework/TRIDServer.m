@implementation TRIDServer

- (void)start
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  TRIDServer *v30;
  SEL v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[TRIIntegrationTestLogHandler shouldUseOverrideLogHandler](TRIIntegrationTestLogHandler, "shouldUseOverrideLogHandler"))
  {
    +[TRIIntegrationTestLogHandler addTestLoggerInPlaceOnClient:](TRIIntegrationTestLogHandler, "addTestLoggerInPlaceOnClient:", v5);
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDServer.m"), 215, CFSTR("Failed to initialize TRIClient"));

  }
  +[TRIXPCServices registerAllServicesWithPromise:](TRIXPCServices, "registerAllServicesWithPromise:", self->_promise);
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
    v8 = CFSTR("class C unlocked");
    if (v7)
      v8 = CFSTR("class C locked");
    *(_DWORD *)buf = 138412290;
    v35 = v8;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "registered xpc service endpoints - device is %@", buf, 0xCu);
  }

  v9 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __19__TRIDServer_start__block_invoke;
  v32[3] = &unk_1E932F8C8;
  v32[4] = self;
  v33 = v5;
  v10 = v5;
  -[TRIDServer _dispatchWhenUnlocked:](self, "_dispatchWhenUnlocked:", v32);
  v26 = v9;
  v27 = 3221225472;
  v28 = __19__TRIDServer_start__block_invoke_234;
  v29 = &unk_1E932FA70;
  v30 = self;
  v31 = a2;
  if (start__pasOnceToken20 != -1)
    dispatch_once(&start__pasOnceToken20, &v26);

  objc_autoreleasePoolPop(v4);
  v19 = *MEMORY[0x1E0C99748];
  do
  {
    v20 = (void *)MEMORY[0x1D8232A5C](v11, v12, v13, v14, v15, v16, v17, v18, v26, v27, v28);
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "runMode:beforeDate:", v19, v22);

    objc_autoreleasePoolPop(v20);
  }
  while ((v23 & 1) != 0);
  TRILogCategory_Server();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEFAULT, "finished server run loop", buf, 2u);
  }

  self->_isRunning = 0;
}

+ (id)_triPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trialRootDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedServer
{
  id v4;
  void *v6;
  uint64_t block;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;

  block = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __26__TRIDServer_sharedServer__block_invoke;
  v10 = &__block_descriptor_40_e5_v8__0l;
  v11 = a1;
  if (qword_1EFC74468 != -1)
    dispatch_once(&qword_1EFC74468, &block);
  v4 = (id)_MergedGlobals_44;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDServer.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"), block, v8, v9, v10, v11);

  }
  return v4;
}

void __26__TRIDServer_sharedServer__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1D8232A5C]();
  v3 = objc_alloc(*(Class *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_triPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "initWithPath:", v4);
  v6 = (void *)_MergedGlobals_44;
  _MergedGlobals_44 = v5;

  objc_autoreleasePoolPop(v2);
}

- (TRIDServer)initWithPath:(id)a3
{
  id v5;
  TRIDServer *v6;
  uint64_t v7;
  OS_dispatch_queue *dispatchQueue;
  TRIXPCActivityManager *v9;
  TRIXPCActivityManager *xpcActivityManager;
  TRIXPCServerContextPromise *v11;
  TRIXPCServerContextPromise *promise;
  TRIServerContext *context;
  TRITaskQueue *taskQueue;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDServer.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v17.receiver = self;
  v17.super_class = (Class)TRIDServer;
  v6 = -[TRIDServer init](&v17, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.triald.taskQueue", 17);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = -[TRIXPCActivityManager initWithDispatchQueue:]([TRIXPCActivityManager alloc], "initWithDispatchQueue:", v6->_dispatchQueue);
    xpcActivityManager = v6->_xpcActivityManager;
    v6->_xpcActivityManager = v9;

    v11 = objc_alloc_init(TRIXPCServerContextPromise);
    promise = v6->_promise;
    v6->_promise = v11;

    context = v6->_context;
    v6->_context = 0;

    taskQueue = v6->_taskQueue;
    v6->_taskQueue = 0;

    v6->_isRunning = 0;
  }

  return v6;
}

- (void)_asyncStartWithMetrics:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Queuing up async start block", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__TRIDServer__asyncStartWithMetrics___block_invoke;
  v7[3] = &unk_1E932F8C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[TRIDServer _dispatchWhenUnlocked:](self, "_dispatchWhenUnlocked:", v7);

}

void __37__TRIDServer__asyncStartWithMetrics___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    objc_msgSend(v2, "_excludeUserLevelTrialFromTimeMachineBackups");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
    TRILogCategory_Server();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "populationType");
      if (v5 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E9335BB0[(int)v5];
      }
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "Device is in the %{public}@ population", buf, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resumeWithXPCActivityDescriptor:executeWhenSuspended:", 0, 0);
    objc_msgSend(MEMORY[0x1E0DC0F08], "metricWithName:integerValue:", CFSTR("triald_task_queue_length"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"));
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    +[TRIRotateSubjectIdTask task](TRIRotateSubjectIdTask, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTask:options:", v9, v10);

  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Server context not initialized. Skipping _asyncStartWithMetrics", buf, 2u);
    }
  }

}

void __19__TRIDServer_start__block_invoke(uint64_t a1)
{
  void *v2;
  TRIServerContext *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  TRITaskQueue *v11;
  uint64_t v12;
  void *v13;
  dispatch_group_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  TRIPushServiceConnectionMultiplexer *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint8_t *v26;
  NSObject *v27;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t buf[16];
  uint8_t v31[2];
  __int16 v32;

  v2 = (void *)objc_opt_new();
  if ((objc_msgSend(v2, "prepareTrialStorage") & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v32 = 0;
    v25 = "triald failed to prepare storage";
    v26 = (uint8_t *)&v32;
LABEL_16:
    _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, v25, v26, 2u);
    goto LABEL_11;
  }
  v3 = [TRIServerContext alloc];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TRIServerContext initWithPaths:client:storageManagement:xpcActivityManagement:](v3, "initWithPaths:client:storageManagement:xpcActivityManagement:", v4, *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Initialized server context", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setUseCKNative:", 1);
    v11 = [TRITaskQueue alloc];
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.triald.opQueue", 17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_group_create();
    v15 = -[TRITaskQueue initWithServerContext:operationQueue:operationGroup:asyncQueue:](v11, "initWithServerContext:operationQueue:operationGroup:asyncQueue:", v12, v13, v14, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 24);
    *(_QWORD *)(v16 + 24) = v15;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setTaskQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setTaskQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v18 = -[TRIPushServiceConnectionMultiplexer initWithServerContext:taskQueue:]([TRIPushServiceConnectionMultiplexer alloc], "initWithServerContext:taskQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setPushServiceMuxer:", v18);

    objc_msgSend(MEMORY[0x1E0DC0B90], "updateSystemInfoUsingContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    +[TRIMobileAssetUtil configureMobileAssetForTrialEnvironment:](TRIMobileAssetUtil, "configureMobileAssetForTrialEnvironment:", objc_msgSend(MEMORY[0x1E0DC09C0], "currentEnvironment"));
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "fullfilling server context ready promise", v29, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "fullfillWithContext:taskQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "paths");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "experimentDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "rolloutDatabase");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "taskQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "client");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRICacheDeleteCallbacks registerCallbacksWithPaths:experimentDatabase:rolloutDatabase:taskQueue:loggingClient:](TRICacheDeleteCallbacks, "registerCallbacksWithPaths:experimentDatabase:rolloutDatabase:taskQueue:loggingClient:", v20, v21, v22, v23, v24);

    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v31 = 0;
    v25 = "triald failed to initialize server context";
    v26 = v31;
    goto LABEL_16;
  }
LABEL_11:

  TRILogCategory_Server();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "rejecting server context ready promise", v28, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reject");
  dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8), &__block_literal_global_27);
LABEL_14:

}

uint64_t __19__TRIDServer_start__block_invoke_233()
{
  NSObject *v0;
  uint8_t v2[16];

  TRILogCategory_Server();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1D207F000, v0, OS_LOG_TYPE_ERROR, "triald failed to initialize - exiting", v2, 2u);
  }

  return xpc_transaction_exit_clean();
}

void __19__TRIDServer_start__block_invoke_234(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  dispatch_source_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[16];

  v2 = (void *)MEMORY[0x1D8232A5C]();
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "triald launched", buf, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  v4 = dispatch_source_create(MEMORY[0x1E0C80DC0], 0xFuLL, 0, MEMORY[0x1E0C80D38]);
  v5 = (void *)sTermSource;
  sTermSource = (uint64_t)v4;

  v6 = sTermSource;
  if (!sTermSource)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("TRIDServer.m"), 300, CFSTR("triald failed listening for SIGTERM"));

    v6 = sTermSource;
  }
  dispatch_source_set_event_handler(v6, &__block_literal_global_238);
  dispatch_resume((dispatch_object_t)sTermSource);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  objc_msgSend(*(id *)(a1 + 32), "_asyncStartWithMetrics:", v7);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__TRIDServer_start__block_invoke_240;
  block[3] = &unk_1E932F918;
  block[4] = v8;
  dispatch_async(v9, block);
  objc_msgSend(*(id *)(a1 + 32), "_registerXpcStreamEventHandler");
  objc_msgSend(*(id *)(a1 + 32), "_registerExternalParamChangeHandler");
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("TRIDServer.m"), 342, CFSTR("XPC Activity Manager not initialized"));

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  objc_msgSend(v10, "registerActivities");
  objc_msgSend(*(id *)(a1 + 32), "_logMetrics:", v7);

  objc_autoreleasePoolPop(v2);
}

void __19__TRIDServer_start__block_invoke_237()
{
  NSObject *v0;
  uint8_t v1[16];

  TRILogCategory_Server();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D207F000, v0, OS_LOG_TYPE_DEFAULT, "received SIGTERM, exiting", v1, 2u);
  }

  exit(0);
}

uint64_t __19__TRIDServer_start__block_invoke_240(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addBlockToExecuteAfterPromiseFullfillment:", &__block_literal_global_242);
}

void __19__TRIDServer_start__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  TRILimitedCarryProfileManager *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[TRILimitedCarryProfileManager initWithTaskQueue:context:]([TRILimitedCarryProfileManager alloc], "initWithTaskQueue:context:", v5, v4);
    objc_msgSend(v4, "setLimitedCarryManager:", v7);

    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Created Limited Carry manager", v9, 2u);
    }
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "failed to handle limited carry experiment setup - triald failed initialization", buf, 2u);
    }
  }

}

- (void)_logMetrics:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__TRIDServer__logMetrics___block_invoke;
  v6[3] = &unk_1E932F8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TRIDServer _dispatchWhenUnlocked:](self, "_dispatchWhenUnlocked:", v6);

}

void __26__TRIDServer__logMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldLogAtLevel:", 10);

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "client");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "client");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackingId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logWithTrackingId:metrics:dimensions:trialSystemTelemetry:", v6, *(_QWORD *)(a1 + 40), 0, 0);

  }
}

- (void)_dispatchWhenUnlocked:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (qword_1EFC74478 != -1)
    dispatch_once(&qword_1EFC74478, &__block_literal_global_350);
  v5 = qword_1EFC74470;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__TRIDServer__dispatchWhenUnlocked___block_invoke;
  v7[3] = &unk_1E9335A70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__TRIDServer__dispatchWhenUnlocked___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__TRIDServer__dispatchWhenUnlocked___block_invoke_2;
  block[3] = &unk_1E9330760;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __36__TRIDServer__dispatchWhenUnlocked___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_registerXpcStreamEventHandler
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD handler[5];
  uint8_t buf[16];

  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "set up xpc event stream handler for com.apple.notifyd.matching", buf, 2u);
  }

  v4 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke;
  handler[3] = &unk_1E932F7F8;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E0C80D38], handler);
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Set up ACXPCEventSubscriber for AppleAccount changes", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C8F2F8], "sharedSubscriber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_291;
  v7[3] = &unk_1E9335B50;
  v7[4] = self;
  objc_msgSend(v6, "registerAccountChangeEventHandler:", v7);

}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[4];
  NSObject *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__44;
  v22[4] = __Block_byref_object_dispose__44;
  v23 = (id)os_transaction_create();
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81298]);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v5 = objc_claimAutoreleasedReturnValue();
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v5;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "received xpc event %{public}@", buf, 0xCu);
    }

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:userInfo:", v5, 0, 0);

      if (objc_msgSend(&unk_1E93638A0, "containsObject:", v5))
      {
        objc_initWeak((id *)buf, *(id *)(a1 + 32));
        v8 = *(void **)(a1 + 32);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_254;
        v20[3] = &unk_1E9335AC0;
        v20[4] = v8;
        objc_copyWeak(&v21, (id *)buf);
        objc_msgSend(v8, "_dispatchWhenUnlocked:", v20);
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
      if (-[NSObject containsString:](v5, "containsString:", CFSTR("com.apple.ManagedConfiguration.profileListChanged")))
      {
        v9 = *(void **)(a1 + 32);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_260;
        v19[3] = &unk_1E932F918;
        v19[4] = v9;
        objc_msgSend(v9, "_dispatchWhenUnlocked:", v19);
      }
      if (objc_msgSend(&unk_1E93638B8, "containsObject:", v5))
      {
        TRILogCategory_Server();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v5;
          _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Received LaunchEvent: %@, adjusting opt-out status", buf, 0xCu);
        }

        v11 = *(void **)(a1 + 32);
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_269;
        v18[3] = &unk_1E932F918;
        v18[4] = v11;
        objc_msgSend(v11, "_dispatchWhenUnlocked:", v18);
      }
      if (objc_msgSend(&unk_1E93638D0, "containsObject:", v5))
      {
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_3;
        block[3] = &unk_1E9331828;
        v5 = v5;
        v13 = *(_QWORD *)(a1 + 32);
        v15 = v5;
        v16 = v13;
        v17 = v22;
        dispatch_async(v12, block);

      }
    }
  }
  else
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Handled event with no name, returning", buf, 2u);
    }
  }

  _Block_object_dispose(v22, 8);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_254(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2;
  v2[3] = &unk_1E9335A98;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_msgSend(v1, "addBlockToExecuteAfterPromiseFullfillment:", v2);
  objc_destroyWeak(&v3);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FC0]);

    objc_msgSend(v5, "keyValueStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIPersistentUserSettings settingsWithKeyValueStore:](TRIPersistentUserSettings, "settingsWithKeyValueStore:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "persistedDiagnosticsUsageEnabled");
    v13 = v12;
    if (!v12)
    {
      v14 = objc_alloc(MEMORY[0x1E0DC0B90]);
      objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithPaths:", v15);

      if (objc_msgSend(v16, "isDiagnosticsAndUsageEnabled"))
        v13 = 1;
      else
        v13 = 2;

    }
    if ((v9 == 1) == (v13 != 1))
    {
      objc_msgSend(MEMORY[0x1E0DC0B90], "updateSystemInfoUsingContext:", v5);
      if (v9 == 1)
        v17 = 1;
      else
        v17 = 2;
      objc_msgSend(v11, "persistDiagnosticsUsageEnabled:", v17);
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v9 == 1)
      {
        if (v19)
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Diagnostics and Usage enabled, will wait for regular retargeting", v21, 2u);
        }
      }
      else
      {
        if (v19)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Diagnostics and Usage disabled, queueing retargeting", buf, 2u);
        }

        +[TRIRetargetAllTask task](TRIRetargetAllTask, "task");
        v18 = objc_claimAutoreleasedReturnValue();
        +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addTask:options:", v18, v20);

      }
    }

  }
}

uint64_t __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_260(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addBlockToExecuteAfterPromiseFullfillment:", &__block_literal_global_262);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2_261(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = a2;
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "Received LaunchEvent: \"com.apple.ManagedConfiguration.profileListChanged\", creating transaction for Limited Carry manager", v5, 2u);
  }

  objc_msgSend(v2, "limitedCarryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "processLaunchEvent");
}

uint64_t __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_269(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addBlockToExecuteAfterPromiseFullfillment:", &__block_literal_global_271);
}

uint64_t __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2_270(uint64_t a1, uint64_t a2)
{
  return +[TRIUserAdjustableSettings updateExperimentOptOutStateWithServerContext:](TRIUserAdjustableSettings, "updateExperimentOptOutStateWithServerContext:", a2);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  id *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;

  v2 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_4;
  v11[3] = &unk_1E9335B28;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v12 = v3;
  v13 = v4;
  v5 = (void *)MEMORY[0x1D8232C48](v11);
  v6 = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
  v7 = *(id **)(a1 + 40);
  if (v6)
  {
    v9[0] = v2;
    v9[1] = 3221225472;
    v9[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_288;
    v9[3] = &unk_1E9335A70;
    v9[4] = v7;
    v10 = v5;
    objc_msgSend(v7, "_dispatchWhenUnlocked:", v9);

  }
  else
  {
    objc_msgSend(v7[4], "addBlockToExecuteAfterPromiseFullfillment:", v5);
  }
  v8 = (id)objc_opt_self();

}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  _BOOL4 v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint8_t buf[4];
  _BYTE v45[10];
  const __CFString *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "containsString:", CFSTR("kAFPreferencesDidChangeDarwinNotification")))goto LABEL_16;
    v42 = a1;
    objc_msgSend(v5, "keyValueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRIPersistentUserSettings settingsWithKeyValueStore:](TRIPersistentUserSettings, "settingsWithKeyValueStore:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0DC0B90]);
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithPaths:", v11);

    objc_msgSend(v12, "userSettingsSiriLocale");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
      v14 = (__CFString *)v13;
    else
      v14 = &stru_1E9336E60;
    if (objc_msgSend(v12, "userSettingsIsSiriEnabled"))
      v15 = 1;
    else
      v15 = 2;
    objc_msgSend(v9, "persistedSiriLocale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v14) ^ 1;

    v18 = objc_msgSend(v9, "persistedIsSiriEnabled");
    v19 = v18 != v15;
    if (v18 == v15)
      v20 = v17;
    else
      v20 = 1;
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v45 = v20;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v17;
      LOWORD(v46) = 1024;
      *(_DWORD *)((char *)&v46 + 2) = v19;
      _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "kAFPreferencesDidChange notification relevancy: %d. Siri locale changed: %d, Siri enablement changed: %d", buf, 0x14u);
    }

    objc_msgSend(v9, "persistSiriLocale:", v14);
    objc_msgSend(v9, "persistIsSiriEnabled:", v15);

    a1 = v42;
    if (!v20)
    {
      TRILogCategory_Server();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v40 = *(_QWORD *)(v42 + 32);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v45 = v40;
        _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEFAULT, "Ignoring xpc event: %{public}@, no relevant change found for notification", buf, 0xCu);
      }
    }
    else
    {
LABEL_16:
      TRILogCategory_Server();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v45 = v23;
        _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "Adding xpc event: %{public}@", buf, 0xCu);
      }

      +[TRIRetargetAllTask task](TRIRetargetAllTask, "task");
      v24 = objc_claimAutoreleasedReturnValue();
      +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addTask:options:", v24, v25);

    }
    v26 = objc_alloc(MEMORY[0x1E0DC0B90]);
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithPaths:", v27);

    TRILogCategory_Server();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(_QWORD *)(a1 + 32);
      if (-[NSObject userSettingsIsSiriEnabled](v28, "userSettingsIsSiriEnabled"))
        v31 = CFSTR("enabled");
      else
        v31 = CFSTR("disabled");
      -[NSObject userSettingsSiriLocale](v28, "userSettingsSiriLocale");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)v45 = v30;
      *(_WORD *)&v45[8] = 2114;
      v46 = v31;
      v47 = 2114;
      v48 = v32;
      _os_log_impl(&dword_1D207F000, v29, OS_LOG_TYPE_DEFAULT, "Xpc event: %{public}@, Siri is %{public}@, Siri Locale is: %{public}@", buf, 0x20u);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "containsString:", CFSTR("kAFPreferencesDidChangeDarwinNotification")))
    {
      if (-[NSObject userSettingsIsSiriEnabled](v28, "userSettingsIsSiriEnabled"))
      {
        -[NSObject userSettingsSiriLocale](v28, "userSettingsSiriLocale");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "length");

        if (v34)
        {
          TRILogCategory_Server();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D207F000, v35, OS_LOG_TYPE_DEFAULT, "Inside the OOBE flow with a possibility of triggering setup-assistant-fetch flow.", buf, 2u);
          }

          v43 = 0;
          v36 = +[TRISetupAssistantFetchUtils stopSetupAssistantFetchWithServerContext:namespaceNames:error:](TRISetupAssistantFetchUtils, "stopSetupAssistantFetchWithServerContext:namespaceNames:error:", v5, 0, &v43);
          v37 = v43;
          v38 = v37;
          if (v36)
          {
            TRILogCategory_Server();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D207F000, v39, OS_LOG_TYPE_DEFAULT, "Not registering setup-assistant-fetch activity to run", buf, 2u);
            }
          }
          else
          {
            if (!v37)
            {
              objc_msgSend(*(id *)(a1 + 40), "_registerSetupAssistantFetchActivityOnce");
              goto LABEL_34;
            }
            TRILogCategory_Server();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)v45 = v38;
              _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Error checking if the setup-assistant-fetch activity is needed to run in OOBE flow: %{public}@", buf, 0xCu);
            }
          }

        }
      }
    }
  }
  else
  {
    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v41 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v45 = v41;
      _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "failed to process %@ - triald failed initialization", buf, 0xCu);
    }
  }
LABEL_34:

}

uint64_t __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_288(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addBlockToExecuteAfterPromiseFullfillment:", *(_QWORD *)(a1 + 40));
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_291(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    v12 = 1024;
    v13 = a3;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Received account change event for: %@, with change type: %d", buf, 0x12u);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v7 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_292;
  v8[3] = &unk_1E9335AC0;
  v8[4] = v7;
  objc_copyWeak(&v9, (id *)buf);
  objc_msgSend(v7, "_dispatchWhenUnlocked:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_292(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2_293;
  v2[3] = &unk_1E9335A98;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  objc_msgSend(v1, "addBlockToExecuteAfterPromiseFullfillment:", v2);
  objc_destroyWeak(&v3);
}

void __44__TRIDServer__registerXpcStreamEventHandler__block_invoke_2_293(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC0B90], "updateSystemInfoUsingContext:", v5);
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Apple Account changed, retargeting", v11, 2u);
    }

    +[TRIRetargetAllTask task](TRIRetargetAllTask, "task");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTask:options:", v9, v10);

  }
}

- (void)_registerExternalParamChangeHandler
{
  NSObject *dispatchQueue;
  _QWORD v3[5];
  int out_token;

  out_token = 0;
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__TRIDServer__registerExternalParamChangeHandler__block_invoke;
  v3[3] = &unk_1E932F780;
  v3[4] = self;
  notify_register_dispatch("com.apple.trial.external-parameter-change", &out_token, dispatchQueue, v3);
}

void __49__TRIDServer__registerExternalParamChangeHandler__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  TRILogCategory_Server();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D207F000, v2, OS_LOG_TYPE_DEFAULT, "External parameter changed, updating system info and queueing retargeting", v6, 2u);
  }

  +[TRIRetargetAllTask task](TRIRetargetAllTask, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates](TRITaskQueuingOptions, "defaultOptionsWithIgnoreDuplicates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTask:options:", v3, v5);

}

- (void)_registerSetupAssistantFetchActivityOnce
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[TRIServerContext keyValueStore](self->_context, "keyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  +[TRISetupAssistantFetchUtils getValueInKeyValueStore:key:error:](TRISetupAssistantFetchUtils, "getValueInKeyValueStore:key:error:", v3, CFSTR("setup-assistant-fetch-activity-deadline-date"), &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v16;

  if (v4)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = (uint64_t)v4;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Deadline timestamp  for setup-assistant-fetch activity is: %@", buf, 0xCu);
    }
  }
  else if (v5)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = (uint64_t)CFSTR("setup-assistant-fetch-activity-deadline-date");
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Error reading data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject dateByAddingTimeInterval:](v6, "dateByAddingTimeInterval:", 21600.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v18 = 21600;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Setting deadline for setup-assistant-fetch activity to be %lld seconds from now, new deadline is at %@", buf, 0x16u);
    }

    objc_msgSend(v7, "timeIntervalSince1970");
    v10 = v9;
    -[TRIServerContext keyValueStore](self->_context, "keyValueStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v13 = +[TRISetupAssistantFetchUtils setValueInKeyValueStore:key:value:error:](TRISetupAssistantFetchUtils, "setValueInKeyValueStore:key:value:error:", v11, CFSTR("setup-assistant-fetch-activity-deadline-date"), v12, &v15);
    v5 = v15;

    if (v13)
    {
      -[TRIXPCActivityManager registerSetupAssistantFetchActivity](self->_xpcActivityManager, "registerSetupAssistantFetchActivity");
    }
    else
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = (uint64_t)CFSTR("setup-assistant-fetch-activity-deadline-date");
        v19 = 2114;
        v20 = v5;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Error writing data for %@ key in TRIKVStore: %{public}@. Not proceeding further", buf, 0x16u);
      }

    }
  }

}

- (unint64_t)_getDiskUsageInBytes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *context;

  context = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_triPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumeratorAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v4, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = 0;
    v9 = *MEMORY[0x1E0CB2AF0];
    do
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "_triPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@"), v11, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "attributesOfItemAtPath:error:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v8 += (int)objc_msgSend(v14, "intValue");
      objc_autoreleasePoolPop(v5);
      v5 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v4, "nextObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  objc_autoreleasePoolPop(v5);

  objc_autoreleasePoolPop(context);
  return v8;
}

- (void)_excludeUserLevelTrialFromTimeMachineBackups
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trialRootDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C999D8], 0);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
