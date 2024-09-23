@implementation RBPowerAssertionManager

- (void)didUpdateProcessStates:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  RBPowerAssertionManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__RBPowerAssertionManager_didUpdateProcessStates___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __50__RBPowerAssertionManager_didUpdateProcessStates___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "identity", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updatedState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setValue:forIdentity:", v9, v8);
        v11 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(v11 + 16), "valueForIdentity:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBPowerAssertionManager _queue_updateProcessAssertion:withState:](v11, v12, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (void)_queue_updateProcessAssertion:(void *)a3 withState:
{
  id v5;
  SEL v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (a1)
  {
    if (a2)
    {
      v5 = a2;
      objc_setProperty_nonatomic_copy(v5, v6, a3, 48);
      v7[4] = a1;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __67__RBPowerAssertionManager__queue_updateProcessAssertion_withState___block_invoke;
      v8[3] = &unk_24DD46160;
      v8[4] = a1;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __67__RBPowerAssertionManager__queue_updateProcessAssertion_withState___block_invoke_2;
      v7[3] = &unk_24DD46160;
      -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:]((uint64_t)v5, v8, v7);

    }
  }
}

void __67__RBPowerAssertionManager__queue_updateProcessAssertion_withState___block_invoke(uint64_t a1)
{
  -[RBPowerAssertionManager _queue_didAcquireAssertion](*(_QWORD *)(a1 + 32));
}

- (void)_queue_didAcquireAssertion
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v2 + 1;
    if (!v2)
    {
      rbs_power_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_21A8B4000, v3, OS_LOG_TYPE_DEFAULT, "Acquired first power assertion", v5, 2u);
      }

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "powerAssertionManagerDidPreventIdleSleep:", a1);

    }
  }
}

void __67__RBPowerAssertionManager__queue_updateProcessAssertion_withState___block_invoke_2(uint64_t a1)
{
  -[RBPowerAssertionManager _queue_willInvalidateAssertion](*(_QWORD *)(a1 + 32));
}

- (void)_queue_willInvalidateAssertion
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  uint8_t v7[16];

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (!v2)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_willInvalidateAssertion, a1, CFSTR("RBPowerAssertionManager.m"), 461, CFSTR("Unbalanced attempt to release a power assertion"));

      v2 = *(_QWORD *)(a1 + 32);
    }
    v3 = v2 - 1;
    *(_QWORD *)(a1 + 32) = v3;
    if (!v3)
    {
      rbs_power_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "Released last power assertion", v7, 2u);
      }

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "powerAssertionManagerDidAllowIdleSleep:", a1);

    }
  }
}

- (void)addProcess:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  RBPowerAssertionManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__RBPowerAssertionManager_addProcess___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __57__RBPowerAssertionManager_removeStateForProcessIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v2 + 16), "valueForIdentity:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBPowerAssertionManager _queue_invalidateAssertion:](v2, (uint64_t)v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeIdentity:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeIdentity:", *(_QWORD *)(a1 + 40));
}

void __41__RBPowerAssertionManager_removeProcess___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "identity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__RBPowerAssertionManager_removeProcess___block_invoke_2;
  v6[3] = &unk_24DD46188;
  v7 = v2;
  objc_msgSend(v3, "removeValueForIdentity:withPredicate:", v5, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBPowerAssertionManager _queue_invalidateAssertion:](*(_QWORD *)(a1 + 40), (uint64_t)v4);

}

void __38__RBPowerAssertionManager_addProcess___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "identity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[RBProcessPowerAssertion initWithProcess:]((id *)[RBProcessPowerAssertion alloc], *(void **)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setValue:forIdentity:", v2, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(v4 + 8), "valueForIdentity:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBPowerAssertionManager _queue_updateProcessAssertion:withState:](v4, v2, v5);

  -[RBPowerAssertionManager _queue_invalidateAssertion:](*(_QWORD *)(a1 + 40), (uint64_t)v3);
}

- (void)_queue_invalidateAssertion:(uint64_t)a1
{
  _QWORD v2[5];

  if (a1)
  {
    if (a2)
    {
      v2[0] = MEMORY[0x24BDAC760];
      v2[1] = 3221225472;
      v2[2] = __54__RBPowerAssertionManager__queue_invalidateAssertion___block_invoke;
      v2[3] = &unk_24DD46160;
      v2[4] = a1;
      -[RBPowerAssertion invalidateWithHandler:](a2, v2);
    }
  }
}

BOOL __41__RBPowerAssertionManager_removeProcess___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 56);
  else
    v2 = 0;
  return v2 == *(_QWORD *)(a1 + 32);
}

- (void)removeProcess:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  RBPowerAssertionManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__RBPowerAssertionManager_removeProcess___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)removeStateForProcessIdentity:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__RBPowerAssertionManager_removeStateForProcessIdentity___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (RBPowerAssertionManager)init
{
  RBPowerAssertionManager *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  RBProcessMap *v5;
  RBProcessMap *stateMap;
  RBProcessMap *v7;
  RBProcessMap *assertionMap;
  RBSystemPowerAssertion *v9;
  RBSystemPowerAssertion *systemAssertion;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RBPowerAssertionManager;
  v2 = -[RBPowerAssertionManager init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x24BE80D58], "createBackgroundQueue:", CFSTR("RBPowerAssertionManager"));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(RBProcessMap);
    stateMap = v2->_stateMap;
    v2->_stateMap = v5;

    v7 = objc_alloc_init(RBProcessMap);
    assertionMap = v2->_assertionMap;
    v2->_assertionMap = v7;

    v9 = objc_alloc_init(RBSystemPowerAssertion);
    systemAssertion = v2->_systemAssertion;
    v2->_systemAssertion = v9;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[RBPowerAssertion invalidateWithHandler:]((uint64_t)self->_systemAssertion, 0);
  -[RBProcessMap enumerateWithBlock:](self->_assertionMap, "enumerateWithBlock:", &__block_literal_global_64);
  -[RBProcessMap removeAllObjects](self->_assertionMap, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)RBPowerAssertionManager;
  -[RBPowerAssertionManager dealloc](&v3, sel_dealloc);
}

void __34__RBPowerAssertionManager_dealloc__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[RBPowerAssertion invalidateWithHandler:](a3, 0);
}

- (NSString)debugDescription
{
  NSObject *queue;
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  _QWORD block[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__RBPowerAssertionManager_debugDescription__block_invoke;
  block[3] = &unk_24DD46138;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  block[7] = &v22;
  dispatch_sync(queue, block);
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("system=");
  v8 = &stru_24DD48378;
  if (*((_BYTE *)v19 + 24))
    v8 = (const __CFString *)v13[5];
  else
    v7 = &stru_24DD48378;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@| assertiond:[\n\t%@%@%@\n\t]>"), v5, v7, v8, v23[5]);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return (NSString *)v9;
}

uint64_t __43__RBPowerAssertionManager_debugDescription__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1[4] + 24);
  if (v2)
    LOBYTE(v2) = *(_DWORD *)(v2 + 8) != 0;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 24));
  v3 = *(void **)(a1[4] + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__RBPowerAssertionManager_debugDescription__block_invoke_2;
  v5[3] = &unk_24DD46110;
  v5[4] = a1[7];
  return objc_msgSend(v3, "enumerateWithBlock:", v5);
}

void __43__RBPowerAssertionManager_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;

  v4 = a3;
  if (v4 && *((_DWORD *)v4 + 2))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v4;
    v6 = v4[7];
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@=%@\n\t"), v7, v8);

    v4 = v8;
  }

}

- (void)applySystemState:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__RBPowerAssertionManager_applySystemState___block_invoke;
  v7[3] = &unk_24DD45FF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __44__RBPowerAssertionManager_applySystemState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  uint8_t buf[16];

  rbs_power_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A8B4000, v2, OS_LOG_TYPE_INFO, "Received a system state change", buf, 2u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v3, *(id *)(a1 + 40), 48);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
  }
  v6[4] = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__RBPowerAssertionManager_applySystemState___block_invoke_72;
  v7[3] = &unk_24DD46160;
  v7[4] = v4;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__RBPowerAssertionManager_applySystemState___block_invoke_2;
  v6[3] = &unk_24DD46160;
  -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:]((uint64_t)v5, v7, v6);
}

void __44__RBPowerAssertionManager_applySystemState___block_invoke_72(uint64_t a1)
{
  -[RBPowerAssertionManager _queue_didAcquireAssertion](*(_QWORD *)(a1 + 32));
}

void __44__RBPowerAssertionManager_applySystemState___block_invoke_2(uint64_t a1)
{
  -[RBPowerAssertionManager _queue_willInvalidateAssertion](*(_QWORD *)(a1 + 32));
}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

void __54__RBPowerAssertionManager__queue_invalidateAssertion___block_invoke(uint64_t a1)
{
  -[RBPowerAssertionManager _queue_willInvalidateAssertion](*(_QWORD *)(a1 + 32));
}

- (BOOL)_unitTest_hasSystemPowerAssertion
{
  NSObject *queue;
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__RBPowerAssertionManager__unitTest_hasSystemPowerAssertion__block_invoke;
  v5[3] = &unk_24DD461B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__RBPowerAssertionManager__unitTest_hasSystemPowerAssertion__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  if (v1)
    LOBYTE(v1) = *(_DWORD *)(v1 + 8) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (BOOL)_unitTest_hasPowerAssertionForProcess:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__RBPowerAssertionManager__unitTest_hasPowerAssertionForProcess___block_invoke;
  block[3] = &unk_24DD461D8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __65__RBPowerAssertionManager__unitTest_hasPowerAssertionForProcess___block_invoke(uint64_t a1)
{
  void *v2;
  _DWORD *v3;
  BOOL v4;
  id v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForIdentity:");
  v3 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3[2] != 0;
  else
    v4 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;

}

- (id)_unitTest_nameOfPowerAssertionForSystem
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__RBPowerAssertionManager__unitTest_nameOfPowerAssertionForSystem__block_invoke;
  v5[3] = &unk_24DD461B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __66__RBPowerAssertionManager__unitTest_nameOfPowerAssertionForSystem__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (v1)
    v2 = *(void **)(v1 + 24);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (id)_unitTest_nameOfPowerAssertionForProcess:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__RBPowerAssertionManager__unitTest_nameOfPowerAssertionForProcess___block_invoke;
  block[3] = &unk_24DD461D8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __68__RBPowerAssertionManager__unitTest_nameOfPowerAssertionForProcess___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForIdentity:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 24);
  else
    v5 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);

}

- (RBPowerAssertionManagerDelegate)delegate
{
  return (RBPowerAssertionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemAssertion, 0);
  objc_storeStrong((id *)&self->_assertionMap, 0);
  objc_storeStrong((id *)&self->_stateMap, 0);
}

@end
