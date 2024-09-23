@implementation SLDTaskManager

- (SLDTaskManager)initWithSerialQueue:(id)a3
{
  id v5;
  SLDTaskManager *v6;
  SLDTaskManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLDTaskManager;
  v6 = -[SLDTaskManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serialQueue, a3);

  return v7;
}

- (id)startAggregateTask:(id)a3 withTimeout:(double)a4 cancellationHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  double v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[3];
  char v40;

  v8 = a3;
  v9 = a5;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  -[SLDTaskManager serialQueue](self, "serialQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke;
  v29[3] = &unk_1E3794550;
  v31 = v39;
  v32 = a4;
  v12 = v9;
  v30 = v12;
  +[SLGracePeriodTimer timerWithQueue:delay:action:](SLGracePeriodTimer, "timerWithQueue:delay:action:", v10, v29, a4);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2;
  v25[3] = &unk_1E37945A0;
  v25[4] = self;
  v27 = v39;
  v28 = &v33;
  v14 = v12;
  v26 = v14;
  objc_msgSend(v13, "setCancellationHandler:", v25);
  objc_msgSend((id)v34[5], "arm");
  -[SLDTaskManager serialQueue](self, "serialQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_3;
  v21[3] = &unk_1E37945F0;
  v23 = v8;
  v16 = v13;
  v22 = v16;
  v24 = &v33;
  v17 = v8;
  dispatch_async(v15, v21);

  v18 = v22;
  v19 = v16;

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v39, 8);

  return v19;
}

uint64_t __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    SLDaemonLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_cold_1(v1, v2);

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2;
  block[3] = &unk_1E3794578;
  v7 = *(_QWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(v2, block);

}

uint64_t __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t result;
  NSObject *v3;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "isValid");
  if ((_DWORD)result)
  {
    SLDaemonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2_cold_1(v3);

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "suppress");
    return (*(uint64_t (**)(void))(a1[4] + 16))();
  }
  return result;
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2_4;
  v7[3] = &unk_1E37945C8;
  v5 = v2;
  v6 = a1[6];
  v8 = v5;
  v9 = v6;
  (*(void (**)(uint64_t, id, uint64_t, _QWORD *))(v3 + 16))(v3, v5, v4, v7);

}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2_4(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  int v5;
  id v6;

  if ((a2 & 1) == 0)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v6 = *(id *)(a1 + 32);
    v4 = v3;
    if ((objc_msgSend(v6, "isFinished") & 1) != 0 || objc_msgSend(v6, "isCancelled"))
    {

    }
    else
    {
      v5 = objc_msgSend(v4, "isValid");

      if (v5)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "suppress");
    }
  }
}

- (void)startSubtask:(id)a3 withProgress:(id)a4 timer:(id)a5
{
  void (**v7)(id, id, id, _QWORD *);
  id v8;
  id v9;
  int v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = (void (**)(id, id, id, _QWORD *))a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(v8, "isFinished") & 1) != 0 || objc_msgSend(v8, "isCancelled"))
  {

  }
  else
  {
    v10 = objc_msgSend(v9, "isValid");

    if (v10)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50__SLDTaskManager_startSubtask_withProgress_timer___block_invoke;
      v11[3] = &unk_1E3794618;
      v12 = v8;
      v13 = v9;
      v7[2](v7, v12, v13, v11);

    }
  }

}

void __50__SLDTaskManager_startSubtask_withProgress_timer___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  int v5;
  id v6;

  if ((a2 & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v4 = v3;
    if ((objc_msgSend(v6, "isFinished") & 1) != 0 || objc_msgSend(v6, "isCancelled"))
    {

    }
    else
    {
      v5 = objc_msgSend(v4, "isValid");

      if (v5)
        objc_msgSend(*(id *)(a1 + 40), "suppress");
    }
  }
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "[SLDTaskManager] aggregate task timeout timer fired after %f seconds", (uint8_t *)&v3, 0xCu);
}

void __69__SLDTaskManager_startAggregateTask_withTimeout_cancellationHandler___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "[SLDTaskManager] aggregate task progress was cancelled by our client", v1, 2u);
}

@end
