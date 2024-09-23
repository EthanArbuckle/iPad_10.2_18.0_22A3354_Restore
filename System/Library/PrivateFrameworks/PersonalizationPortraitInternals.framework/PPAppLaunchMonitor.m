@implementation PPAppLaunchMonitor

void __68__PPAppLaunchMonitor__registerForAppChangesIfNeededWithGuardedData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id obj;
  _QWORD block[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "appBundleIdKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v3;
    v28 = 2112;
    v29 = v6;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "_CDContextualChangeHandler called: %@ %@", buf, 0x16u);
  }

  v17 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v6);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (!v13 || (v14 = *(id *)(v13 + 16), (v15 = v14) == 0))
        {
          v14 = 0;
          v15 = *(void **)(*(_QWORD *)(v17 + 48) + 16);
        }
        v16 = v15;

        block[0] = v11;
        block[1] = 3221225472;
        block[2] = __68__PPAppLaunchMonitor__registerForAppChangesIfNeededWithGuardedData___block_invoke_87;
        block[3] = &unk_1E7E1FCE8;
        block[4] = v13;
        v20 = v6;
        dispatch_async(v16, block);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

}

- (id)_init
{
  PPAppLaunchMonitor *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *lock;
  uint64_t v7;
  OS_dispatch_queue *contextHandlerQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PPAppLaunchMonitor;
  v2 = -[PPAppLaunchMonitor init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.PersonalizationPortrait.appLaunchMonitorQueue", 17);
    v7 = objc_claimAutoreleasedReturnValue();
    contextHandlerQueue = v2->_contextHandlerQueue;
    v2->_contextHandlerQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)registerForAppLaunchWithBundleId:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  _PASLock *lock;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPAppLaunchMonitor.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v12)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPAppLaunchMonitor.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__9770;
  v30 = __Block_byref_object_dispose__9771;
  v31 = 0;
  lock = self->_lock;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__PPAppLaunchMonitor_registerForAppLaunchWithBundleId_queue_handler___block_invoke;
  v21[3] = &unk_1E7E18D40;
  v21[4] = self;
  v14 = v10;
  v22 = v14;
  v15 = v12;
  v24 = v15;
  v16 = v9;
  v23 = v16;
  v25 = &v26;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v21);
  v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

- (void)deregisterForAppLaunchWithToken:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    lock = self->_lock;
    v7[1] = 3221225472;
    v7[2] = __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke;
    v7[3] = &unk_1E7E18DB8;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextHandlerQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (*(_BYTE *)(a2 + 24))
  {
    v2 = *(void **)(a2 + 8);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke_2;
    v3[3] = &unk_1E7E18D90;
    v4 = *(id *)(a1 + 32);
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

  }
}

void __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke_3;
  v7[3] = &unk_1E7E18D68;
  v8 = *(id *)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "predicateWithBlock:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterUsingPredicate:", v6);

}

uint64_t __54__PPAppLaunchMonitor_deregisterForAppLaunchWithToken___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
    v2 = *(void **)(a2 + 8);
  else
    v2 = 0;
  return objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __69__PPAppLaunchMonitor_registerForAppLaunchWithBundleId_queue_handler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PPAppLaunchMonitorRegistrationContext *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  PPAppLaunchMonitorRegistrationContext *v24;
  void *v25;
  id handler;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_super aBlock;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  id v37;
  uint64_t v38;

  v3 = a2;
  v4 = a1[4];
  v5 = v3;
  v32 = v5;
  if (v4 && !*((_BYTE *)v5 + 24))
  {
    v6 = objc_opt_new();
    v7 = (void *)*((_QWORD *)v32 + 1);
    *((_QWORD *)v32 + 1) = v6;

    *((_QWORD *)v32 + 2) = 1;
    *((_BYTE *)v32 + 24) = 1;
    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v32 + 4);
    *((_QWORD *)v32 + 4) = v8;

    objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForAppDataDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D15C90], "predicateForChangeAtKeyPath:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock.receiver = (id)MEMORY[0x1E0C809B0];
    aBlock.super_class = (Class)3221225472;
    v34 = __68__PPAppLaunchMonitor__registerForAppChangesIfNeededWithGuardedData___block_invoke;
    v35 = &unk_1E7E18DE0;
    v36 = v32;
    v37 = v10;
    v38 = v4;
    v12 = v10;
    v13 = _Block_copy(&aBlock);
    objc_msgSend(MEMORY[0x1E0D15C70], "localNonWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", CFSTR("com.apple.proactive.PersonalizationPortrait.AppLaunch"), v11, CFSTR("com.apple.proactive.PersonalizationPortrait"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v32 + 4), "registerCallback:", v14);

  }
  v15 = (void *)MEMORY[0x1E0CB37E8];
  ++*((_QWORD *)v32 + 2);
  objc_msgSend(v15, "numberWithUnsignedInteger:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [PPAppLaunchMonitorRegistrationContext alloc];
  v18 = (void *)a1[5];
  v19 = (void *)a1[7];
  v20 = v16;
  v21 = v18;
  v22 = v19;
  v23 = v22;
  if (v17)
  {
    if (v20)
    {
      if (v22)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithToken_queue_handler_, v17, CFSTR("PPAppLaunchMonitor.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("token != nil"));

      if (v23)
        goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithToken_queue_handler_, v17, CFSTR("PPAppLaunchMonitor.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_7:
    aBlock.receiver = v17;
    aBlock.super_class = (Class)PPAppLaunchMonitorRegistrationContext;
    v24 = (PPAppLaunchMonitorRegistrationContext *)objc_msgSendSuper2(&aBlock, sel_init);
    v17 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_token, v16);
      objc_storeStrong((id *)&v17->_queue, v18);
      v25 = _Block_copy(v23);
      handler = v17->_handler;
      v17->_handler = v25;

    }
  }

  objc_msgSend(*((id *)v32 + 1), "objectForKeyedSubscript:", a1[6]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
    v27 = (void *)objc_opt_new();
  objc_msgSend(v27, "addObject:", v17);
  objc_msgSend(*((id *)v32 + 1), "setObject:forKeyedSubscript:", v27, a1[6]);
  v28 = *(_QWORD *)(a1[8] + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v20;

}

uint64_t __68__PPAppLaunchMonitor__registerForAppChangesIfNeededWithGuardedData___block_invoke_87(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v1 = *(_QWORD *)(v1 + 24);
  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(v1, *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PPAppLaunchMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken2_9800 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_9800, block);
  return (id)sharedInstance__pasExprOnceResult_9801;
}

void __36__PPAppLaunchMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  v3 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v4 = (void *)sharedInstance__pasExprOnceResult_9801;
  sharedInstance__pasExprOnceResult_9801 = v3;

  objc_autoreleasePoolPop(v2);
}

@end
