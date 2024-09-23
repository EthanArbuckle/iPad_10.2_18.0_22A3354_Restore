@implementation SCSharingReminderDeliveryTask

+ (id)taskRequestScheduledAfter:(double)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0B710]), "initWithIdentifier:", CFSTR("com.apple.safetycheckd.reminder_delivery"));
  objc_msgSend(v4, "setRequiresNetworkConnectivity:", 1);
  objc_msgSend(v4, "setPriority:", 2);
  objc_msgSend(v4, "setScheduleAfter:", a3);
  return v4;
}

- (id)identifier
{
  return CFSTR("com.apple.safetycheckd.reminder_delivery");
}

- (BOOL)isRepeating
{
  return 0;
}

- (id)nonRepeatingTaskHandler
{
  return &__block_literal_global_2;
}

void __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_2;
  v9[3] = &unk_2516628C0;
  v9[4] = &v10;
  objc_msgSend(v2, "setExpirationHandler:", v9);
  SCLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v2;
    _os_log_impl(&dword_2454C0000, v3, OS_LOG_TYPE_INFO, "\"SCSharingReminderDeliveryTask handling underlying task: %@\", buf, 0xCu);
  }

  +[SCUtils registerDarwinNotification:](SCUtils, "registerDarwinNotification:", CFSTR("com.apple.springboard.lockNotificationListEmptyAtScreenOn"));
  if (*((_BYTE *)v11 + 24))
  {
    v8 = 0;
    v4 = objc_msgSend(v2, "setTaskExpiredWithRetryAfter:error:", &v8, 300.0);
    v5 = v8;
    if ((v4 & 1) == 0)
    {
      SCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v2, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_cold_1(v7, (uint64_t)v5, buf, v6);
      }

      objc_msgSend(v2, "setTaskCompleted");
    }

  }
  else
  {
    objc_msgSend(v2, "setTaskCompleted");
  }
  _Block_object_dispose(&v10, 8);

}

uint64_t __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __56__SCSharingReminderDeliveryTask_nonRepeatingTaskHandler__block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_2454C0000, log, OS_LOG_TYPE_FAULT, "\"Failed to expire task: %@ with error: %@\", buf, 0x16u);

}

@end
