@implementation PPAdaptiveCoalescer

- (PPAdaptiveCoalescer)init
{
  PPAdaptiveCoalescer *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  uint64_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PPAdaptiveCoalescer;
  v2 = -[PPAdaptiveCoalescer init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "PPAdaptiveCoalescer");
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)coalesceRequestKey:(id)a3 handler:(id)a4 executeRequestAndInvokeHandlersBlock:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0C99D68];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "date");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PPAdaptiveCoalescer coalesceRequestKey:handler:executeRequestAndInvokeHandlersBlock:nowDate:](self, "coalesceRequestKey:handler:executeRequestAndInvokeHandlersBlock:nowDate:", v11, v10, v9, v12);

}

- (void)coalesceRequestKey:(id)a3 handler:(id)a4 executeRequestAndInvokeHandlersBlock:(id)a5 nowDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  _PASLock *v15;
  uint64_t v16;
  _PASLock *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  _QWORD v24[4];
  id v25;
  PPAdaptiveCoalescer *v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[4];
  _PASLock *v37;
  id v38;
  PPAdaptiveCoalescer *v39;
  _QWORD *v40;
  SEL v41;
  _QWORD v42[5];
  id v43;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_msgSend(a3, "copyWithZone:", 0);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__1771;
  v42[4] = __Block_byref_object_dispose__1772;
  v43 = 0;
  v43 = (id)MEMORY[0x18D780768](v12);
  v15 = self->_lock;
  v16 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke;
  v36[3] = &unk_1E226A3F0;
  v17 = v15;
  v37 = v17;
  v18 = v14;
  v38 = v18;
  v39 = self;
  v40 = v42;
  v41 = a2;
  v19 = (void *)MEMORY[0x18D780768](v36);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke_40;
  v24[3] = &unk_1E226A418;
  v20 = v18;
  v25 = v20;
  v26 = self;
  v21 = v13;
  v27 = v21;
  v22 = v11;
  v28 = v22;
  v30 = &v32;
  v31 = v42;
  v23 = v19;
  v29 = v23;
  -[_PASLock runWithLockAcquired:](v17, "runWithLockAcquired:", v24);
  if (*((_BYTE *)v33 + 24))
    v23[2](v23);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v42, 8);

}

void __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *, void *);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__32;
  v21 = __Block_byref_object_dispose__33;
  v22 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke_34;
  v12 = &unk_1E226A3C8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 48);
  v13 = v3;
  v14 = v5;
  v15 = &v17;
  v16 = v4;
  objc_msgSend(v2, "runWithLockAcquired:", &v9);
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = objc_msgSend((id)v18[5], "count", v9, v10, v11, v12);
    *(_DWORD *)buf = 138412546;
    v24 = v7;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_DEFAULT, "PPAdaptiveCoalescer: executing request for key %@ (handlers: %tu)", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) + 16))();
  _Block_object_dispose(&v17, 8);

}

- (void)garbageCollectPendingKeysForNowDate:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PPAdaptiveCoalescer_garbageCollectPendingKeysForNowDate___block_invoke;
  v7[3] = &unk_1E226A3A0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

void __59__PPAdaptiveCoalescer_garbageCollectPendingKeysForNowDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PPAdaptiveCoalescer_garbageCollectPendingKeysForNowDate___block_invoke_2;
  v6[3] = &unk_1E226A378;
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  objc_msgSend(v3, "removeObjectsForKeys:", v5);

}

void __59__PPAdaptiveCoalescer_garbageCollectPendingKeysForNowDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "shouldGarbageCollectForNowDate:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  PPAdaptiveCoalescerPendingKeyState *v6;
  double v7;
  double v8;
  NSObject *v9;
  _BOOL4 v10;
  double v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  double v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "garbageCollectPendingKeysForNowDate:", *(_QWORD *)(a1 + 48));
    v6 = -[PPAdaptiveCoalescerPendingKeyState initWithKey:]([PPAdaptiveCoalescerPendingKeyState alloc], "initWithKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
  }

  -[PPAdaptiveCoalescerPendingKeyState addDate:](v6, "addDate:", *(_QWORD *)(a1 + 48));
  -[NSMutableArray addObject:](v6->_handlers, "addObject:", *(_QWORD *)(a1 + 56));
  if (-[NSMutableArray count](v6->_handlers, "count") == 1)
  {
    -[PPAdaptiveCoalescerPendingKeyState currentDelayForNowDate:](v6, "currentDelayForNowDate:", *(_QWORD *)(a1 + 48));
    v8 = v7;
    pp_default_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 == 0.0)
    {
      if (v10)
      {
        v11 = *(double *)(a1 + 32);
        v19 = 138412290;
        v20 = v11;
        _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEFAULT, "PPAdaptiveCoalescer: will run immediately for key %@ (handlers: 1)", (uint8_t *)&v19, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    else
    {
      if (v10)
      {
        v15 = *(_QWORD *)(a1 + 32);
        v19 = 134218242;
        v20 = v8;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEFAULT, "PPAdaptiveCoalescer: will delay %f for key %@ (handlers: 1)", (uint8_t *)&v19, 0x16u);
      }

      v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "copy");
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), *(_QWORD *)(a1 + 64), v8);
    }
  }
  else
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(double *)(a1 + 32);
      v14 = -[NSMutableArray count](v6->_handlers, "count");
      v19 = 138412546;
      v20 = v13;
      v21 = 2048;
      v22 = v14;
      _os_log_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_DEFAULT, "PPAdaptiveCoalescer: merging request for %@ into existing pending deferred request (handlers: %tu)", (uint8_t *)&v19, 0x16u);
    }

  }
}

void __95__PPAdaptiveCoalescer_coalesceRequestKey_handler_executeRequestAndInvokeHandlersBlock_nowDate___block_invoke_34(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id *v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v8 = (id *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[5], CFSTR("PPAdaptiveCoalescer.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pendingKeyState"));

    v3 = 0;
  }
  v4 = objc_msgSend(*(id *)(v3 + 16), "copy");
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v8[2], "removeAllObjects");
}

@end
