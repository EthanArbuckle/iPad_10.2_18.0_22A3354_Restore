@implementation TLAttentionAwarenessObserver

+ (TLAttentionAwarenessObserver)sharedAttentionAwarenessObserver
{
  if (sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstanceOnceToken != -1)
    dispatch_once(&sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstanceOnceToken, &__block_literal_global_10);
  return (TLAttentionAwarenessObserver *)(id)sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstance;
}

void __64__TLAttentionAwarenessObserver_sharedAttentionAwarenessObserver__block_invoke()
{
  TLAttentionAwarenessObserver *v0;
  void *v1;

  v0 = objc_alloc_init(TLAttentionAwarenessObserver);
  v1 = (void *)sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstance;
  sharedAttentionAwarenessObserver__TLAttentionAwarenessObserverSharedInstance = (uint64_t)v0;

}

- (TLAttentionAwarenessObserver)init
{
  TLAttentionAwarenessObserver *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *accessQueueLabel;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *pollingForAttentionEventHandlers;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *attentionAwarenessClientQueue;
  void *v16;
  char v17;
  NSObject *v18;
  _QWORD block[4];
  id v21;
  TLAttentionAwarenessObserver *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)TLAttentionAwarenessObserver;
  v2 = -[TLAttentionAwarenessObserver init](&v23, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@-%@"), v6, v4, CFSTR("AccessQueue"));
    v7 = objc_claimAutoreleasedReturnValue();
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v7;

    v9 = dispatch_queue_create(-[NSString UTF8String](v2->_accessQueueLabel, "UTF8String"), 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pollingForAttentionEventHandlers = v2->_pollingForAttentionEventHandlers;
    v2->_pollingForAttentionEventHandlers = v11;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@-%@"), v6, v4, CFSTR("AttentionAwarenessClientQueue"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    attentionAwarenessClientQueue = v2->_attentionAwarenessClientQueue;
    v2->_attentionAwarenessClientQueue = (OS_dispatch_queue *)v14;

    +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isHomePod");

    if ((v17 & 1) == 0)
    {
      v18 = v2->_attentionAwarenessClientQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__TLAttentionAwarenessObserver_init__block_invoke;
      block[3] = &unk_1E952A6A8;
      v21 = v6;
      v22 = v2;
      dispatch_async(v18, block);

    }
  }
  return v2;
}

void __36__TLAttentionAwarenessObserver_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  _QWORD *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  _QWORD *v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = objc_alloc_init((Class)getAWAttentionAwarenessConfigurationClass());
  objc_msgSend(v2, "setEventMask:", 128);
  objc_msgSend(v2, "setIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttentionLostTimeouts:", v3);

  objc_msgSend(v2, "setPollingFilter:", 1);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getAWAttentionAwarenessClientClass_softClass;
  v18 = getAWAttentionAwarenessClientClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getAWAttentionAwarenessClientClass_softClass)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getAWAttentionAwarenessClientClass_block_invoke;
    v14[3] = &unk_1E952AB10;
    v14[4] = &v15;
    __getAWAttentionAwarenessClientClass_block_invoke((uint64_t)v14);
    v4 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setConfiguration:", v2);
  v8 = *(_QWORD **)(a1 + 40);
  v9 = v8[1];
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __36__TLAttentionAwarenessObserver_init__block_invoke_2;
  block[3] = &unk_1E952A6A8;
  v12 = v8;
  v13 = v7;
  v10 = v7;
  dispatch_async(v9, block);

}

uint64_t __36__TLAttentionAwarenessObserver_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TLLogPlayback();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1D33D5000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: -init: Created %{public}@.", (uint8_t *)&v6, 0x16u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteInitialization");
}

- (void)dealloc
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *accessQueue;
  uint64_t v5;
  NSObject *attentionAwarenessClientQueue;
  objc_super v7;
  _QWORD v8[6];
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = self->_accessQueue;
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__TLAttentionAwarenessObserver_dealloc__block_invoke;
  block[3] = &unk_1E952B730;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync((dispatch_queue_t)v3, block);
  if (v17[5])
  {
    attentionAwarenessClientQueue = self->_attentionAwarenessClientQueue;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __39__TLAttentionAwarenessObserver_dealloc__block_invoke_2;
    v8[3] = &unk_1E952A6F8;
    v8[4] = self;
    v8[5] = &v16;
    dispatch_async(attentionAwarenessClientQueue, v8);
  }
  -[TLAttentionAwarenessObserver _invokePollingForAttentionEventHandlers:eventType:](self, "_invokePollingForAttentionEventHandlers:eventType:", v11[5], 0);
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  v7.receiver = self;
  v7.super_class = (Class)TLAttentionAwarenessObserver;
  -[TLAttentionAwarenessObserver dealloc](&v7, sel_dealloc);
}

uint64_t __39__TLAttentionAwarenessObserver_dealloc__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1[4];
  if (*(_BYTE *)(v2 + 33))
  {
    objc_msgSend((id)v2, "_endPollingForAttention");
    v2 = a1[4];
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(v2 + 40));
  objc_msgSend(*(id *)(a1[4] + 24), "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return objc_msgSend(*(id *)(a1[4] + 24), "removeAllObjects");
}

void __39__TLAttentionAwarenessObserver_dealloc__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v12 = 0;
  v3 = objc_msgSend(v2, "invalidateWithError:", &v12);
  v4 = v12;
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = v4 == 0;
  else
    v7 = 0;
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -dealloc: Successfully invalidated %{public}@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138544130;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    v17 = 1024;
    v18 = v3;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@: -dealloc: -invalidateWithError: on %{public}@ returned didSucceed = %{BOOL}d and error = %{public}@.", buf, 0x26u);
  }

}

+ (BOOL)supportsAttenuatingTonesForAttentionDetected
{
  void *v2;
  char v3;
  _BOOL8 v4;

  +[TLCapabilitiesManager sharedCapabilitiesManager](TLCapabilitiesManager, "sharedCapabilitiesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHomePod");

  if ((v3 & 1) != 0)
    LOBYTE(v4) = 0;
  else
    return ((unint64_t)objc_msgSend(getAWAttentionAwarenessConfigurationClass(), "supportedEvents") >> 7) & 1;
  return v4;
}

- (id)pollForAttentionWithEventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *accessQueue;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__TLAttentionAwarenessObserver_pollForAttentionWithEventHandler___block_invoke;
  block[3] = &unk_1E952B758;
  block[4] = self;
  v15 = v4;
  v8 = v6;
  v14 = v8;
  v9 = v4;
  dispatch_async(accessQueue, block);
  v10 = v14;
  v11 = v8;

  return v11;
}

_BYTE *__65__TLAttentionAwarenessObserver_pollForAttentionWithEventHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE *result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v4 = (void *)MEMORY[0x1D824F08C]();
  objc_msgSend(v2, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

  result = *(_BYTE **)(a1 + 32);
  if (result[32])
  {
    if (!result[33])
      return (_BYTE *)objc_msgSend(result, "_beginPollingForAttention");
  }
  return result;
}

- (void)cancelPollForAttentionWithToken:(id)a3
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
  v7[2] = __64__TLAttentionAwarenessObserver_cancelPollForAttentionWithToken___block_invoke;
  v7[3] = &unk_1E952A6A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

uint64_t __64__TLAttentionAwarenessObserver_cancelPollForAttentionWithToken___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 32) && *(_BYTE *)(v3 + 33))
  {
    result = objc_msgSend(*(id *)(v3 + 24), "count");
    if (!result)
      return objc_msgSend(*(id *)(a1 + 32), "_endPollingForAttention");
  }
  return result;
}

- (void)_beginPollingForAttention
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D33D5000, v0, v1, "%{public}@: -_beginPollingForAttention: Not fully initialized yet.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  int v20;
  NSObject *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  double v35;
  __int16 v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v31 = 0;
  v3 = objc_msgSend(v2, "resumeWithError:", &v31);
  v4 = v31;
  if (v4)
    v5 = 0;
  else
    v5 = v3;
  TLLogPlayback();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(double *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v33 = v8;
      v34 = 2114;
      v35 = v9;
      _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginPollingForAttention: Successfully resumed %{public}@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v25 = *(double *)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v33 = v24;
    v34 = 2114;
    v35 = v25;
    v36 = 1024;
    LODWORD(v37[0]) = v3;
    WORD2(v37[0]) = 2114;
    *(_QWORD *)((char *)v37 + 6) = v4;
    _os_log_error_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@: -_beginPollingForAttention: -resumeWithError: on %{public}@ returned didSucceed = %{BOOL}d and error = %{public}@.", buf, 0x26u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = v11;

  TLLogPlayback();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v33 = v14;
    v34 = 2048;
    v35 = v12;
    v36 = 2114;
    v37[0] = v15;
    _os_log_impl(&dword_1D33D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginPollingForAttention: Will begin polling for attention until distant future (%f) with %{public}@.", buf, 0x20u);
  }

  v16 = *(void **)(a1 + 32);
  dispatch_get_global_queue(2, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke_17;
  v29[3] = &unk_1E952B780;
  objc_copyWeak(&v30, (id *)(a1 + 48));
  v28 = 0;
  v18 = objc_msgSend(v16, "pollForAttentionWithTimeout:queue:block:error:", v17, v29, &v28, v12);
  v19 = v28;

  if (v19)
    v20 = 0;
  else
    v20 = v18;
  if (v20 == 1)
  {
    TLLogPlayback();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(double *)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v33 = v22;
      v34 = 2114;
      v35 = v23;
      _os_log_impl(&dword_1D33D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -_beginPollingForAttention: Did begin polling successfully from %{public}@.", buf, 0x16u);
    }
  }
  else
  {
    TLLogPlayback();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v27 = *(double *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v33 = v26;
      v34 = 2114;
      v35 = v27;
      v36 = 1024;
      LODWORD(v37[0]) = v18;
      WORD2(v37[0]) = 2114;
      *(_QWORD *)((char *)v37 + 6) = v19;
      _os_log_error_impl(&dword_1D33D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@: -_beginPollingForAttention: -pollForAttentionWithTimeout:error: on %{public}@ returned didSucceedInitializingPoll = %{BOOL}d and errorPolling = %{public}@.", buf, 0x26u);
    }
  }

  objc_destroyWeak(&v30);
}

void __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  uint64_t v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (void *)*((_QWORD *)WeakRetained + 1);
    if (v8)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke_2;
      block[3] = &unk_1E952AD98;
      block[4] = WeakRetained;
      v12 = a2;
      v11 = v5;
      v9 = v8;
      dispatch_async(v9, block);

    }
  }

}

uint64_t __57__TLAttentionAwarenessObserver__beginPollingForAttention__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveAttentionPollingEventOfType:attentionEvent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_endPollingForAttention
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D33D5000, v0, v1, "%{public}@: -_endPollingForAttention: Not fully initialized yet.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __55__TLAttentionAwarenessObserver__endPollingForAttention__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v22 = 0;
  v3 = objc_msgSend(v2, "cancelPollForAttentionWithError:", &v22);
  v4 = v22;
  TLLogPlayback();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = v4 == 0;
  else
    v7 = 0;
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPollingForAttention: Successfully cancelled poll for attention on %{public}@.", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    v24 = v8;
    v25 = 2114;
    v26 = v9;
    v27 = 1024;
    v28 = v3;
    v29 = 2114;
    v30 = v4;
    _os_log_error_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@: -_endPollingForAttention: -cancelPollForAttentionWithError: on %{public}@ returned didSucceed = %{BOOL}d and error = %{public}@.", buf, 0x26u);
  }

  v12 = *(void **)(a1 + 32);
  v21 = 0;
  v13 = objc_msgSend(v12, "suspendWithError:", &v21);
  v14 = v21;
  TLLogPlayback();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v13 || v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v24 = v19;
      v25 = 2114;
      v26 = v20;
      v27 = 1024;
      v28 = v13;
      v29 = 2114;
      v30 = v14;
      _os_log_error_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@: -_endPollingForAttention: -suspendWithError: on %{public}@ returned didSucceed = %{BOOL}d and error = %{public}@.", buf, 0x26u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v24 = v17;
    v25 = 2114;
    v26 = v18;
    _os_log_impl(&dword_1D33D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: -_endPollingForAttention: Successfully suspended %{public}@.", buf, 0x16u);
  }

}

- (void)_didReceiveAttentionPollingEventOfType:(unint64_t)a3 attentionEvent:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  TLAttentionAwarenessObserver *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TLAttentionAwarenessObserver _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  TLLogPlayback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543874;
    v14 = self;
    v15 = 2048;
    v16 = a3;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1D33D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: -_didReceiveAttentionPollingEventOfType:(%ld) attentionEvent:(%{public}@).", (uint8_t *)&v13, 0x20u);
  }

  if (a3 == 2)
  {
    v8 = 1;
    v9 = 1;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v8 = 0;
    v9 = 0;
LABEL_7:
    v10 = 1;
    goto LABEL_9;
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
LABEL_9:
  -[NSMutableDictionary allValues](self->_pollingForAttentionEventHandlers, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  if (v9)
  {
    if (self->_isPollingForAttention)
      -[TLAttentionAwarenessObserver _endPollingForAttention](self, "_endPollingForAttention");
    -[NSMutableDictionary removeAllObjects](self->_pollingForAttentionEventHandlers, "removeAllObjects");
  }
  if (v10)
    -[TLAttentionAwarenessObserver _invokePollingForAttentionEventHandlers:eventType:](self, "_invokePollingForAttentionEventHandlers:eventType:", v12, v8);

}

- (void)_didCompleteInitialization
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1D33D5000, v0, v1, "%{public}@: -_didCompleteInitialization: Already fully initialized.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_invokePollingForAttentionEventHandlers:(id)a3 eventType:(int64_t)a4
{
  id v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  int64_t v9;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __82__TLAttentionAwarenessObserver__invokePollingForAttentionEventHandlers_eventType___block_invoke;
    v7[3] = &unk_1E952AAA0;
    v8 = v5;
    v9 = a4;
    dispatch_async(v6, v7);

  }
}

void __82__TLAttentionAwarenessObserver__invokePollingForAttentionEventHandlers_eventType___block_invoke(uint64_t a1)
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

- (void)_assertRunningOnAccessQueue
{
  NSObject *accessQueue;
  const char *label;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  accessQueue = self->_accessQueue;
  if (accessQueue)
  {
    dispatch_assert_queue_V2(accessQueue);
  }
  else
  {
    label = dispatch_queue_get_label(0);
    if (strcmp(label, -[NSString UTF8String](self->_accessQueueLabel, "UTF8String")))
    {
      TLLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLAttentionAwarenessObserver.m");
        v7 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v7, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 136381443;
          v13 = "-[TLAttentionAwarenessObserver _assertRunningOnAccessQueue]";
          v14 = 2113;
          v15 = v9;
          v16 = 2049;
          v17 = 290;
          v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }

      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[TLAttentionAwarenessEffectProcessor _assertRunningOnAccessQueue].cold.1();

    }
  }
}

- (void)_assertNotRunningOnAccessQueue
{
  NSObject *accessQueue;
  const char *label;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  accessQueue = self->_accessQueue;
  if (accessQueue)
  {
    dispatch_assert_queue_not_V2(accessQueue);
  }
  else
  {
    label = dispatch_queue_get_label(0);
    if (!strcmp(label, -[NSString UTF8String](self->_accessQueueLabel, "UTF8String")))
    {
      TLLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibrary/Library/Utilities/TLAttentionAwarenessObserver.m");
        v7 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v7, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 136381443;
          v13 = "-[TLAttentionAwarenessObserver _assertNotRunningOnAccessQueue]";
          v14 = 2113;
          v15 = v9;
          v16 = 2049;
          v17 = 298;
          v18 = 2113;
          v19 = v10;
          _os_log_impl(&dword_1D33D5000, v8, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v12, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __85__TLVibrationPersistenceUtilities__objectIsValidUserGeneratedVibrationPattern_error___block_invoke_cold_2();
      }

      TLLogGeneral();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[TLAttentionAwarenessEffectProcessor _assertNotRunningOnAccessQueue].cold.1();

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_pollingForAttentionEventHandlers, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
