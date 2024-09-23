@implementation HVScheduledTasks

- (HVScheduledTasks)init
{
  HVScheduledTasks *v2;
  HVScheduledTasks *v3;
  void *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[16];
  _QWORD handler[6];

  v7.receiver = self;
  v7.super_class = (Class)HVScheduledTasks;
  v2 = -[HVScheduledTasks init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HVScheduledTasks _registerHarvestTaskWithMinimumLevelOfService:]((uint64_t)v2, 1);
    v4 = (void *)*MEMORY[0x24BDAC5A0];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __40__HVScheduledTasks__registerCleanupTask__block_invoke;
    handler[3] = &unk_24DD7F6B0;
    handler[4] = v3;
    handler[5] = sel__registerCleanupTask;
    xpc_activity_register("com.apple.proactive.ProactiveHarvesting.Cleanup", v4, handler);
    hv_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_INFO, "HVScheduledTasks: registered task Cleanup", buf, 2u);
    }

    atomic_store(0, (unsigned __int8 *)&v3->_delayedBudgetedTaskScheduled);
    -[HVScheduledTasks _delayedBudgetedContentAvailable]((uint64_t)v3);
  }
  return v3;
}

- (void)_registerHarvestTaskWithMinimumLevelOfService:(uint64_t)a1
{
  char v2;
  xpc_object_t v4;
  const __CFString *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  _QWORD handler[4];
  __CFString *v10;
  uint64_t v11;
  char *v12;
  char v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v2 = a2;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a2 == 2)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6B8], 0);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5F0], 0);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5B8], 0);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x24BDAC5D8], 900);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC598], 1);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC5B0], 1);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BDAC5E8], "com.apple.proactive.ProactiveHarvesting");
    xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x24BDAC5E0], 1uLL);
    v5 = CFSTR("Harvest.DelayedBudgeted");
  }
  else if (a2 == 1)
  {
    v4 = (id)*MEMORY[0x24BDAC5A0];
    v5 = CFSTR("Harvest.PeriodicBackground");
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.proactive.ProactiveHarvesting"), v5));
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke;
  handler[3] = &unk_24DD7F638;
  v13 = v2;
  v11 = a1;
  v12 = sel__registerHarvestTaskWithMinimumLevelOfService_;
  v10 = (__CFString *)v5;
  xpc_activity_register(v7, v4, handler);
  hv_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_INFO, "HVScheduledTasks: registered task %@", buf, 0xCu);
  }

}

- (void)_delayedBudgetedContentAvailable
{
  NSObject *v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (a1)
  {
    hv_default_log_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA1D000, v2, OS_LOG_TYPE_INFO, "HVScheduledTasks: periodicBudgetContentAvailable", buf, 2u);
    }

    v3 = (unsigned __int8 *)(a1 + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(1u, v3));
    if ((v4 & 1) == 0)
    {
      hv_default_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_INFO, "HVScheduledTasks: periodicBudgetContentAvailable: Re-registering CTS job", v6, 2u);
      }

      -[HVScheduledTasks _registerHarvestTaskWithMinimumLevelOfService:](a1, 2);
    }
  }
}

void __40__HVScheduledTasks__registerCleanupTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v4 = MEMORY[0x24BDAC760];
    v32 = 0;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __40__HVScheduledTasks__registerCleanupTask__block_invoke_2;
    v26[3] = &unk_24DD7F660;
    v28 = &v29;
    v5 = v3;
    v27 = v5;
    v20 = v4;
    v21 = 3221225472;
    v22 = __40__HVScheduledTasks__registerCleanupTask__block_invoke_27;
    v23 = &unk_24DD7F688;
    v6 = (id)MEMORY[0x22074FF64](v26);
    v24 = v6;
    v25 = &v29;
    v7 = (void (**)(_QWORD))MEMORY[0x22074FF64](&v20);
    v8 = objc_opt_self();
    +[HVNotifications _postNotificationWithName:](v8, "com.apple.proactive.ProactiveHarvesting.scheduledTask.started");
    hv_scheduled_task_signpost_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);

    hv_scheduled_task_signpost_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21AA1D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Cleanup", (const char *)&unk_21AA642BE, buf, 2u);
    }

    v7[2](v7);
    hv_scheduled_task_signpost_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v15 = *((unsigned __int8 *)v30 + 24);
      *(_DWORD *)buf = 67109120;
      v34 = v15;
      _os_signpost_emit_with_name_impl(&dword_21AA1D000, v14, OS_SIGNPOST_INTERVAL_END, v10, "Cleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
    }

    if (*((_BYTE *)v30 + 24))
    {
      v16 = objc_opt_self();
      v17 = "com.apple.proactive.ProactiveHarvesting.scheduledTask.deferred";
    }
    else
    {
      v16 = objc_opt_self();
      v17 = "com.apple.proactive.ProactiveHarvesting.scheduledTask.completed";
    }
    +[HVNotifications _postNotificationWithName:](v16, v17);
    if (*((_BYTE *)v30 + 24))
    {
      if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v20, v21, v22, v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HVScheduledTasks.m"), 232, CFSTR("HVScheduledTasks unexpected failure of deferral"));

      }
      hv_default_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA1D000, v18, OS_LOG_TYPE_DEFAULT, "HVScheduledTasks: Cleanup: deferred", buf, 2u);
      }

    }
    _Block_object_dispose(&v29, 8);
  }

}

uint64_t __40__HVScheduledTasks__registerCleanupTask__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  uint8_t v5[16];

  hv_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_21AA1D000, v2, OS_LOG_TYPE_DEBUG, "HVScheduledTasks: Cleanup: deferral check", v5, 2u);
  }

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
    goto LABEL_6;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_6:
    result = 0;
    *(_BYTE *)(v3 + 24) = 1;
    return result;
  }
  return 1;
}

void __40__HVScheduledTasks__registerCleanupTask__block_invoke_27(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[HVQueues defaultQueues](HVQueues, "defaultQueues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v3 = objc_msgSend(v2, "cleanupWithError:shouldContinueBlock:", &v8, *(_QWORD *)(a1 + 32));
  v4 = v8;

  LODWORD(v2) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  hv_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "HVScheduledTasks: Cleanup: deferring";
LABEL_7:
      _os_log_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
  }
  else if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "HVScheduledTasks: Cleanup: completed successfully";
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_error_impl(&dword_21AA1D000, v6, OS_LOG_TYPE_ERROR, "HVScheduledTasks: Cleanup: failed: %@", buf, 0xCu);
  }

}

void __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  char v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v4 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke_2;
    v27[3] = &unk_24DD7F5E8;
    v28 = *(id *)(a1 + 32);
    v30 = &v31;
    v5 = v3;
    v29 = v5;
    v6 = (void *)MEMORY[0x22074FF64](v27);
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke_18;
    v22[3] = &unk_24DD7F610;
    v26 = *(_BYTE *)(a1 + 56);
    v7 = v6;
    v24 = v7;
    v25 = &v31;
    v23 = *(id *)(a1 + 32);
    v8 = (void (**)(_QWORD))MEMORY[0x22074FF64](v22);
    v9 = objc_opt_self();
    +[HVNotifications _postNotificationWithName:](v9, "com.apple.proactive.ProactiveHarvesting.scheduledTask.started");
    hv_scheduled_task_signpost_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);

    hv_scheduled_task_signpost_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21AA1D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Harvest", (const char *)&unk_21AA642BE, buf, 2u);
    }

    v8[2](v8);
    hv_scheduled_task_signpost_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = *((unsigned __int8 *)v32 + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v16;
      _os_signpost_emit_with_name_impl(&dword_21AA1D000, v15, OS_SIGNPOST_INTERVAL_END, v11, "Harvest", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
    }

    if (*((_BYTE *)v32 + 24))
    {
      v17 = objc_opt_self();
      v18 = "com.apple.proactive.ProactiveHarvesting.scheduledTask.deferred";
    }
    else
    {
      v17 = objc_opt_self();
      v18 = "com.apple.proactive.ProactiveHarvesting.scheduledTask.completed";
    }
    +[HVNotifications _postNotificationWithName:](v17, v18);
    if (*((_BYTE *)v32 + 24))
    {
      if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("HVScheduledTasks.m"), 188, CFSTR("HVScheduledTasks unexpected failure of deferral"));

      }
      hv_default_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v36 = v20;
        _os_log_impl(&dword_21AA1D000, v19, OS_LOG_TYPE_DEFAULT, "HVScheduledTasks: %@: deferred", buf, 0xCu);
      }

    }
    else
    {
      atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8));
    }

    _Block_object_dispose(&v31, 8);
  }

}

uint64_t __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  hv_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_21AA1D000, v2, OS_LOG_TYPE_DEBUG, "HVScheduledTasks: %@: deferral check", (uint8_t *)&v6, 0xCu);
  }

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v3 + 24))
    goto LABEL_6;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
LABEL_6:
    result = 0;
    *(_BYTE *)(v3 + 24) = 1;
    return result;
  }
  return 1;
}

void __66__HVScheduledTasks__registerHarvestTaskWithMinimumLevelOfService___block_invoke_18(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[HVConsumerCoordinator defaultCoordinator](HVConsumerCoordinator, "defaultCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 56);
  v13 = 0;
  v4 = objc_msgSend(v2, "harvestContentWithMinimumLevelOfService:ignoringDiscretionaryPowerBudget:error:shouldContinueBlock:", v3, 0, &v13, *(_QWORD *)(a1 + 40));
  v5 = v13;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  hv_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      v10 = "HVScheduledTasks: %@: deferring";
LABEL_7:
      _os_log_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      v10 = "HVScheduledTasks: %@: completed successfully";
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v5;
    _os_log_error_impl(&dword_21AA1D000, v8, OS_LOG_TYPE_ERROR, "HVScheduledTasks: %@: failed: %@", buf, 0x16u);
  }

}

+ (void)registerScheduledTasks
{
  id v2;

  v2 = +[HVScheduledTasks sharedInstance]();
}

+ (void)delayedBudgetedContentAvailable
{
  id v2;

  +[HVScheduledTasks sharedInstance]();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HVScheduledTasks _delayedBudgetedContentAvailable]((uint64_t)v2);

}

+ (id)sharedInstance
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HVScheduledTasks_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedInstance__pasOnceToken2 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2, block);
  return (id)sharedInstance__pasExprOnceResult_2269;
}

void __34__HVScheduledTasks_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2269;
  sharedInstance__pasExprOnceResult_2269 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
