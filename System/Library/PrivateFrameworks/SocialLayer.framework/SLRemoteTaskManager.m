@implementation SLRemoteTaskManager

- (SLRemoteTaskManager)initWithDelegate:(id)a3 targetSerialQueue:(id)a4 synchronous:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  SLRemoteTaskManager *v10;
  NSObject *v11;
  const __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *backgroundConcurrentQueue;
  objc_super v18;
  uint8_t buf[4];
  SLRemoteTaskManager *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SLRemoteTaskManager;
  v10 = -[SLRemoteTaskManager init](&v18, sel_init);
  if (v10)
  {
    SLFrameworkLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      *(_DWORD *)buf = 134218754;
      v20 = v10;
      if (v5)
        v12 = CFSTR("YES");
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_199EFF000, v11, OS_LOG_TYPE_INFO, "[%p] initWithDelegate: %@ targetSerialQueue: %@ synchronous: %@", buf, 0x2Au);
    }

    objc_storeWeak((id *)&v10->_delegate, v8);
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INTERACTIVE, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("com.apple.SocialLayer.SLRemoteTaskManager", v14);
    backgroundConcurrentQueue = v10->_backgroundConcurrentQueue;
    v10->_backgroundConcurrentQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v10->_targetSerialQueue, a4);
    v10->_synchronous = v5;

  }
  return v10;
}

- (void)startTask:(id)a3 withTimeout:(double)a4 timeoutHandler:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  double v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[SLRemoteTaskManager synchronous](self, "synchronous"))
    -[SLRemoteTaskManager targetSerialQueue](self, "targetSerialQueue");
  else
    -[SLRemoteTaskManager backgroundConcurrentQueue](self, "backgroundConcurrentQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke;
  block[3] = &unk_1E3796090;
  v21 = a4;
  block[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = v10;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  dispatch_async(v13, block);

}

void __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
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
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__14;
  v30 = __Block_byref_object_dispose__14;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14;
  v24 = __Block_byref_object_dispose__14;
  objc_msgSend(*(id *)(a1 + 32), "targetSerialQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 64);
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_4;
  v17[3] = &unk_1E37948C8;
  v19 = &v26;
  v18 = *(id *)(a1 + 40);
  +[SLGracePeriodTimer timerWithQueue:delay:action:](SLGracePeriodTimer, "timerWithQueue:delay:action:", v2, v17, v3);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_2;
  v13[3] = &unk_1E3796040;
  v15 = &v26;
  v16 = &v20;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v5, "_serviceWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend((id)v21[5], "arm");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v27[5];
    v27[5] = v7;

    objc_msgSend(*(id *)(a1 + 32), "targetSerialQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_3;
    v12[3] = &unk_1E3796068;
    v12[4] = &v26;
    v12[5] = &v20;
    dispatch_async(v9, v12);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0CB2938];
    v33[0] = CFSTR("XPC connection error. We were unable to retrieve a connection to the handshake service in sociallayerd");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLRemoteTaskManager"), 1, v11);
    v9 = objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

}

uint64_t __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancel");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "cancel");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "isValid"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "suppress");
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *MEMORY[0x1E0CB2938];
    v6[0] = CFSTR("XPC connection error. sociallayerd may have crashed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.SocialLayer.SLRemoteTaskManager"), 1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(a1[4] + 16))();
  }
}

uint64_t __73__SLRemoteTaskManager_startTask_withTimeout_timeoutHandler_errorHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "isCancelled");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "isValid");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "cancel");
  }
  return result;
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SLRemoteTaskManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SLRemoteTaskManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "taskServiceWithErrorHandler:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SLRemoteTaskManagerDelegate)delegate
{
  return (SLRemoteTaskManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)targetSerialQueue
{
  return self->_targetSerialQueue;
}

- (void)setTargetSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetSerialQueue, a3);
}

- (OS_dispatch_queue)backgroundConcurrentQueue
{
  return self->_backgroundConcurrentQueue;
}

- (void)setBackgroundConcurrentQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundConcurrentQueue, a3);
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_targetSerialQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
