@implementation PFCoalescer

- (PFCoalescer)init
{
  PFCoalescer *v2;
  PFCoalescer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFCoalescer;
  v2 = -[PFCoalescer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PFCoalescer setState:](v2, "setState:", 0);
  return v3;
}

- (PFCoalescer)initWithLabel:(id)a3 target:(id)a4 buffer:(id)a5 queue:(id)a6 bufferDrainer:(id)a7 action:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  PFCoalescer *v22;
  PFCoalescer *v23;
  id v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  id v29;
  const char *v30;
  NSObject *v31;
  NSObject *v32;
  dispatch_queue_t v33;
  void *v34;
  NSObject *v35;
  dispatch_source_t v36;
  PFCoalescerContext *v37;
  PFStateCaptureHandler *v38;
  PFStateCaptureHandler *stateCaptureHandler;
  NSObject *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  id v45;
  _QWORD handler[4];
  id v47;
  id location;
  objc_super v49;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = v20;
  if (v15)
  {
    if (v20)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PFCoalescer.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("label"));

    if (v21)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PFCoalescer.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

LABEL_3:
  v49.receiver = self;
  v49.super_class = (Class)PFCoalescer;
  v22 = -[PFCoalescer init](&v49, sel_init);
  v23 = v22;
  if (v22)
  {
    -[PFCoalescer setTarget:](v22, "setTarget:", v16);
    -[PFCoalescer setUsesTarget:](v23, "setUsesTarget:", v16 != 0);
    v45 = v17;
    -[PFCoalescer setBuffer:](v23, "setBuffer:", v17);
    -[PFCoalescer setSnapshotAndDrainHandler:](v23, "setSnapshotAndDrainHandler:", v19);
    -[PFCoalescer setAction:](v23, "setAction:", v21);
    -[PFCoalescer setLabel:](v23, "setLabel:", v15);
    objc_msgSend(CFSTR("coalescer-"), "stringByAppendingString:", v15);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = (const char *)objc_msgSend(v24, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_BACKGROUND, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create(v25, v27);
    -[PFCoalescer setSourceQueue:](v23, "setSourceQueue:", v28);

    objc_msgSend(CFSTR("coalescer-buffer-"), "stringByAppendingString:", v15);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (const char *)objc_msgSend(v29, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_BACKGROUND, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = dispatch_queue_create(v30, v32);
    -[PFCoalescer setIsolationQueue:](v23, "setIsolationQueue:", v33);

    if (v18)
    {
      -[PFCoalescer setTargetQueue:](v23, "setTargetQueue:", v18);
    }
    else
    {
      dispatch_get_global_queue(9, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFCoalescer setTargetQueue:](v23, "setTargetQueue:", v34);

    }
    -[PFCoalescer sourceQueue](v23, "sourceQueue");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_source_create(MEMORY[0x1E0C80D70], 0, 0, v35);
    -[PFCoalescer setSource:](v23, "setSource:", v36);

    v37 = -[PFCoalescerContext initWithCoalescer:]([PFCoalescerContext alloc], "initWithCoalescer:", v23);
    -[PFCoalescer setContext:](v23, "setContext:", v37);

    v38 = -[PFStateCaptureHandler initWithProvider:]([PFStateCaptureHandler alloc], "initWithProvider:", v23);
    stateCaptureHandler = v23->_stateCaptureHandler;
    v23->_stateCaptureHandler = v38;

    objc_initWeak(&location, v23);
    -[PFCoalescer source](v23, "source");
    v40 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__PFCoalescer_initWithLabel_target_buffer_queue_bufferDrainer_action___block_invoke;
    handler[3] = &unk_1E6B77348;
    objc_copyWeak(&v47, &location);
    dispatch_source_set_event_handler(v40, handler);

    -[PFCoalescer source](v23, "source");
    v17 = v45;
    v41 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v41);

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
  }

  return v23;
}

- (void)performEventActionWithTarget:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  uint64_t v6;
  NSObject *targetQueue;
  PFCoalescerContext *context;
  OS_dispatch_queue *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD block[7];
  _QWORD v15[5];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  v16 = 0;
  isolationQueue = self->_isolationQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PFCoalescer_performEventActionWithTarget___block_invoke;
  block[3] = &unk_1E6B77370;
  block[4] = self;
  block[5] = &v17;
  block[6] = v15;
  dispatch_sync(isolationQueue, block);
  if (!*((_BYTE *)v18 + 24))
  {
    -[PFCoalescerContext setCoalescedUpdatesCount:](self->_context, "setCoalescedUpdatesCount:", dispatch_source_get_data((dispatch_source_t)self->_source));
    targetQueue = self->_targetQueue;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __44__PFCoalescer_performEventActionWithTarget___block_invoke_2;
    v11[3] = &unk_1E6B77398;
    v11[4] = self;
    v12 = v4;
    v13 = v15;
    dispatch_sync(targetQueue, v11);
    dispatch_suspend((dispatch_object_t)self->_source);
    context = self->_context;
    v9 = self->_isolationQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __44__PFCoalescer_performEventActionWithTarget___block_invoke_3;
    v10[3] = &unk_1E6B772D0;
    v10[4] = self;
    -[PFCoalescerContext notifyActivityTokenCompletionOnQueue:handler:](context, "notifyActivityTokenCompletionOnQueue:handler:", v9, v10);

  }
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
}

- (void)update:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  isolationQueue = self->_isolationQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__PFCoalescer_update___block_invoke;
  block[3] = &unk_1E6B773E8;
  block[4] = self;
  v14 = &v15;
  v7 = v4;
  v13 = v7;
  dispatch_sync(isolationQueue, block);
  if (!*((_BYTE *)v16 + 24))
  {
    if (self->_initialDelay != 0.0)
    {
      v8 = self->_isolationQueue;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __22__PFCoalescer_update___block_invoke_2;
      v11[3] = &unk_1E6B772D0;
      v11[4] = self;
      dispatch_sync(v8, v11);
    }
    v9 = self->_isolationQueue;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __22__PFCoalescer_update___block_invoke_4;
    v10[3] = &unk_1E6B772D0;
    v10[4] = self;
    dispatch_sync(v9, v10);
    dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)update
{
  -[PFCoalescer update:](self, "update:", 0);
}

- (void)reset
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__PFCoalescer_reset__block_invoke;
  block[3] = &unk_1E6B772D0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)resetAndShutDown
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PFCoalescer_resetAndShutDown__block_invoke;
  block[3] = &unk_1E6B772D0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)_resetWhileLocked
{
  uint64_t (**snapshotAndDrainHandler)(void);
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  ++self->_resetSequenceNumber;
  if (self->_buffer)
  {
    snapshotAndDrainHandler = (uint64_t (**)(void))self->_snapshotAndDrainHandler;
    if (snapshotAndDrainHandler)
      v4 = (id)snapshotAndDrainHandler[2]();
  }
  -[PFCoalescerContext cancelPendingActivityTokens](self->_context, "cancelPendingActivityTokens");
}

- (id)stateCaptureDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PFCoalescer *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_label, CFSTR("label"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_state);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("state"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = self;
  -[PFCoalescerContext pendingActivityTokensSnapshot](self->_context, "pendingActivityTokensSnapshot");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v26[0] = CFSTR("reason");
        objc_msgSend(v10, "reason");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v11;
        v26[1] = CFSTR("ageTimeInterval");
        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "creationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v14);
        objc_msgSend(v12, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v15;
        v26[2] = CFSTR("callStackReturnAddresses");
        objc_msgSend(v10, "callStackReturnAddresses");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v17);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v5, CFSTR("pendingActivityTokens"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19->_lastTransactionStartDate, CFSTR("lastTransactionStartDate"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19->_lastTransactionEndDate, CFSTR("lastTransactionEndDate"));

  return v20;
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (void)setInitialDelay:(double)a3
{
  self->_initialDelay = a3;
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (BOOL)usesTarget
{
  return self->_usesTarget;
}

- (void)setUsesTarget:(BOOL)a3
{
  self->_usesTarget = a3;
}

- (id)buffer
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OS_dispatch_queue)sourceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSourceQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_queue)targetQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTargetQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_dispatch_queue)isolationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIsolationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_source)source
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (id)snapshotAndDrainHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setSnapshotAndDrainHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (id)action
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (PFCoalescerContext)context
{
  return (PFCoalescerContext *)objc_getProperty(self, a2, 136, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)initialDelayTimerIsArmed
{
  return self->_initialDelayTimerIsArmed;
}

- (void)setInitialDelayTimerIsArmed:(BOOL)a3
{
  self->_initialDelayTimerIsArmed = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_snapshotAndDrainHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_sourceQueue, 0);
  objc_storeStrong(&self->_buffer, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_lastTransactionEndDate, 0);
  objc_storeStrong((id *)&self->_lastTransactionStartDate, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandler, 0);
}

_QWORD *__31__PFCoalescer_resetAndShutDown__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[18] != 3)
  {
    result = (_QWORD *)objc_msgSend(result, "_resetWhileLocked");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 3;
  }
  return result;
}

_QWORD *__20__PFCoalescer_reset__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[18] != 3)
  {
    result = (_QWORD *)objc_msgSend(result, "_resetWhileLocked");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0;
  }
  return result;
}

void __22__PFCoalescer_update___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (_QWORD *)a1[4];
  v3 = v2[18];
  if (v3 == 3)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    return;
  }
  v4 = a1[5];
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, v2[10]);
    v2 = (_QWORD *)a1[4];
    v3 = v2[18];
  }
  if (v3 != 2)
  {
    if (v3)
      return;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PFCoalescer %p %@"), v2, v2[8]);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "UTF8String");
    v6 = os_transaction_create();
    v7 = a1[4];
    v8 = *(void **)(v7 + 152);
    *(_QWORD *)(v7 + 152) = v6;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = a1[4];
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v9;

    v2 = (_QWORD *)a1[4];
  }
  v2[18] = 1;
}

void __22__PFCoalescer_update___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 49))
  {
    *(_BYTE *)(v1 + 49) = 1;
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 88);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __22__PFCoalescer_update___block_invoke_3;
    block[3] = &unk_1E6B772D0;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __22__PFCoalescer_update___block_invoke_4(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t __22__PFCoalescer_update___block_invoke_3(uint64_t a1)
{
  return usleep((*(double *)(*(_QWORD *)(a1 + 32) + 56) * 1000000.0));
}

void __44__PFCoalescer_performEventActionWithTarget___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (_QWORD *)a1[4];
  if (v2[2] == v2[1])
  {
    if (v2[10])
    {
      v3 = v2[15];
      if (v3)
      {
        (*(void (**)(void))(v3 + 16))();
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(a1[6] + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v4;

        v2 = (_QWORD *)a1[4];
      }
    }
    if (v2[18] == 1)
      v2[18] = 2;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
}

void __44__PFCoalescer_performEventActionWithTarget___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1BCCA2610]();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __44__PFCoalescer_performEventActionWithTarget___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 144) == 2)
  {
    *(_QWORD *)(v1 + 144) = 0;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 152);
    *(_QWORD *)(v3 + 152) = 0;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v1 = *(_QWORD *)(a1 + 32);
  }
  dispatch_resume(*(dispatch_object_t *)(v1 + 112));
}

void __70__PFCoalescer_initWithLabel_target_buffer_queue_bufferDrainer_action___block_invoke(uint64_t a1)
{
  void *v1;
  BOOL v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "usesTarget"))
  {
    objc_msgSend(WeakRetained, "target");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v1 == 0;

  }
  else
  {
    v2 = 0;
  }
  v3 = WeakRetained;
  if (WeakRetained && !v2)
  {
    objc_msgSend(WeakRetained, "target");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(WeakRetained, "usesTarget") || v4)
      objc_msgSend(WeakRetained, "performEventActionWithTarget:", v4);

    v3 = WeakRetained;
  }

}

+ (PFCoalescer)coalescerWithLabel:(id)a3 target:(id)a4 buffer:(id)a5 queue:(id)a6 bufferDrainer:(id)a7 action:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:target:buffer:queue:bufferDrainer:action:", v18, v17, v16, v15, v14, v13);

  return (PFCoalescer *)v19;
}

+ (PFCoalescer)coalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v18;
  _QWORD v19[4];
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFCoalescer.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__PFCoalescer_coalescerWithLabel_target_queue_action___block_invoke;
  v19[3] = &unk_1E6B773C0;
  v20 = v14;
  v15 = v14;
  objc_msgSend(a1, "coalescerWithLabel:target:buffer:queue:bufferDrainer:action:", v11, v12, 0, v13, 0, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFCoalescer *)v16;
}

+ (PFCoalescer)coalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__PFCoalescer_coalescerWithLabel_queue_action___block_invoke;
  v12[3] = &unk_1E6B773C0;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "coalescerWithLabel:target:buffer:queue:bufferDrainer:action:", a3, 0, 0, a4, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFCoalescer *)v10;
}

+ (id)mutableContainerCoalescerWithLabel:(id)a3 target:(id)a4 container:(id)a5 queue:(id)a6 action:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v13 = a5;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFCoalescer.m"), 333, CFSTR("Unsupported container, does not respond to removeAllObjects"));

  }
  if ((objc_msgSend(v13, "conformsToProtocol:", &unk_1EF154138) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFCoalescer.m"), 334, CFSTR("Unsupported container, does not conform to NSCopying"));

    if (v16)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFCoalescer.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("target"));

    goto LABEL_5;
  }
  if (!v16)
    goto LABEL_7;
LABEL_5:
  objc_msgSend((id)objc_opt_class(), "mutableCollectionBufferDrainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __80__PFCoalescer_mutableContainerCoalescerWithLabel_target_container_queue_action___block_invoke;
  v25[3] = &unk_1E6B773C0;
  v26 = v14;
  v19 = v14;
  objc_msgSend(a1, "coalescerWithLabel:target:buffer:queue:bufferDrainer:action:", v17, v16, v13, v15, v18, v25);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)mutableContainerCoalescerWithLabel:(id)a3 container:(id)a4 queue:(id)a5 action:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFCoalescer.m"), 347, CFSTR("Unsupported container, does not respond to removeAllObjects"));

  }
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EF154138) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PFCoalescer.m"), 348, CFSTR("Unsupported container, does not conform to NSCopying"));

  }
  objc_msgSend((id)objc_opt_class(), "mutableCollectionBufferDrainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__PFCoalescer_mutableContainerCoalescerWithLabel_container_queue_action___block_invoke;
  v21[3] = &unk_1E6B773C0;
  v22 = v12;
  v16 = v12;
  objc_msgSend(a1, "coalescerWithLabel:target:buffer:queue:bufferDrainer:action:", v14, 0, v11, v13, v15, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)setCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0C99E20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableContainerCoalescerWithLabel:container:queue:action:", v11, v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)setCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v10 = (void *)MEMORY[0x1E0C99E20];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableContainerCoalescerWithLabel:target:container:queue:action:", v14, v13, v15, v12, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)dictionaryCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableContainerCoalescerWithLabel:container:queue:action:", v11, v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)dictionaryCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableContainerCoalescerWithLabel:target:container:queue:action:", v14, v13, v15, v12, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)arrayCoalescerWithLabel:(id)a3 queue:(id)a4 action:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x1E0C99DE8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableContainerCoalescerWithLabel:container:queue:action:", v11, v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)arrayCoalescerWithLabel:(id)a3 target:(id)a4 queue:(id)a5 action:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mutableContainerCoalescerWithLabel:target:container:queue:action:", v14, v13, v15, v12, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)mutableCollectionBufferDrainer
{
  return &__block_literal_global_278;
}

id __45__PFCoalescer_mutableCollectionBufferDrainer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v2, "removeAllObjects");

  return v3;
}

uint64_t __73__PFCoalescer_mutableContainerCoalescerWithLabel_container_queue_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PFCoalescer_mutableContainerCoalescerWithLabel_target_container_queue_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __47__PFCoalescer_coalescerWithLabel_queue_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __54__PFCoalescer_coalescerWithLabel_target_queue_action___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
