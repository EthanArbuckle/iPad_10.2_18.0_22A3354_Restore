@implementation SCSharingReminderMaintenanceTask

- (id)identifier
{
  return CFSTR("com.apple.sc_reminder_task_scheduler");
}

- (BOOL)isRepeating
{
  return 1;
}

- (id)repeatingTaskHandler
{
  return &__block_literal_global_4;
}

void __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  SCSharingReminderManager *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  id v20;
  uint8_t v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v3 = MEMORY[0x24BDAC760];
  v18 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke_2;
  v14[3] = &unk_2516628C0;
  v14[4] = &v15;
  objc_msgSend(v2, "setExpirationHandler:", v14);
  if (*((_BYTE *)v16 + 24))
  {
    v13 = 0;
    v4 = objc_msgSend(v2, "setTaskExpiredWithRetryAfter:error:", &v13, 300.0);
    v5 = v13;
    if ((v4 & 1) == 0)
    {
      SCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v2, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_cold_1(v7, (uint64_t)v5, v21, v6);
      }

      objc_msgSend(v2, "setTaskCompleted");
    }

  }
  SCLogger();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v2;
    _os_log_impl(&dword_2454C0000, v8, OS_LOG_TYPE_INFO, "\"SCSharingReminderMaintenanceTask handling underlying task: %@\", buf, 0xCu);
  }

  v9 = objc_alloc_init(SCSharingReminderManager);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke_3;
  v11[3] = &unk_2516624E8;
  v10 = v2;
  v12 = v10;
  -[SCSharingReminderManager validateCacheWithCompletion:](v9, "validateCacheWithCompletion:", v11);

  _Block_object_dispose(&v15, 8);
}

uint64_t __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __56__SCSharingReminderMaintenanceTask_repeatingTaskHandler__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    SCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = CFSTR("Unknown");
      if (v5)
        v8 = v5;
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_2454C0000, v6, OS_LOG_TYPE_ERROR, "\"Error handling task %@, error: %@\", (uint8_t *)&v9, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setTaskCompleted");

}

@end
