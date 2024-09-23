@implementation SCSharingReminderManager

- (SCSharingReminderManager)init
{
  SCSharingReminderManager *v2;
  dispatch_queue_t v3;
  SCArchivingService *v4;
  SCUNNotificationService *v5;
  SCLockdownService *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCSharingReminderManager;
  v2 = -[SCSharingReminderManager init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.safetycheckd.SCSharingReminderManager", 0);
    -[SCSharingReminderManager setWorkQueue:](v2, "setWorkQueue:", v3);

    v4 = objc_alloc_init(SCArchivingService);
    -[SCSharingReminderManager setArchiverService:](v2, "setArchiverService:", v4);

    v5 = -[SCUNNotificationService initWithDelegate:]([SCUNNotificationService alloc], "initWithDelegate:", v2);
    -[SCSharingReminderManager setUserNotificationService:](v2, "setUserNotificationService:", v5);

    v6 = objc_alloc_init(SCLockdownService);
    -[SCSharingReminderManager setWifiSyncService:](v2, "setWifiSyncService:", v6);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCSharingReminderManager setNotificationsToRequest:](v2, "setNotificationsToRequest:", v7);

    -[SCSharingReminderManager loadOrMakeCache](v2, "loadOrMakeCache");
  }
  return v2;
}

- (SCSharingReminderManager)initWithCache:(id)a3 notificationService:(id)a4
{
  id v6;
  id v7;
  SCSharingReminderManager *v8;
  dispatch_queue_t v9;
  SCArchivingService *v10;
  SCLockdownService *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCSharingReminderManager;
  v8 = -[SCSharingReminderManager init](&v14, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.safetycheckd.SCSharingReminderManager", 0);
    -[SCSharingReminderManager setWorkQueue:](v8, "setWorkQueue:", v9);

    -[SCSharingReminderManager setSharingReminderCache:](v8, "setSharingReminderCache:", v6);
    -[SCSharingReminderManager setUserNotificationService:](v8, "setUserNotificationService:", v7);
    v10 = objc_alloc_init(SCArchivingService);
    -[SCSharingReminderManager setArchiverService:](v8, "setArchiverService:", v10);

    v11 = objc_alloc_init(SCLockdownService);
    -[SCSharingReminderManager setWifiSyncService:](v8, "setWifiSyncService:", v11);

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCSharingReminderManager setNotificationsToRequest:](v8, "setNotificationsToRequest:", v12);

    -[SCSharingReminderManager archiveCache:completion:](v8, "archiveCache:completion:", v6, 0);
  }

  return v8;
}

- (void)loadOrMakeCache
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  -[SCSharingReminderManager archiverService](self, "archiverService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SCSharingReminderManager_loadOrMakeCache__block_invoke;
  v5[3] = &unk_251662470;
  v5[4] = self;
  objc_msgSend(v3, "getObjectOfClass:atKey:completion:", v4, CFSTR("SharingReminderCache"), v5);

}

void __43__SCSharingReminderManager_loadOrMakeCache__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    SCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_2454C0000, v7, OS_LOG_TYPE_DEFAULT, "\"Error [%@] retrieving cache. Creating new cache and saving it-- this shouldn't happen again!\", (uint8_t *)&v11, 0xCu);
    }

    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setSharingReminderCache:", v8);

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "sharingReminderCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "archiveCache:completion:", v10, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSharingReminderCache:", a2);
  }

}

- (void)getNeededNotificationsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  if (-[SCSharingReminderManager cacheHasDueReminders](self, "cacheHasDueReminders")
    && (-[SCSharingReminderManager notificationsToRequest](self, "notificationsToRequest"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SCSharingReminderManager notificationDeliveryKey](self, "notificationDeliveryKey"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "containsObject:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__SCSharingReminderManager_getNeededNotificationsWithCompletion___block_invoke;
    v10[3] = &unk_251662498;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    -[SCSharingReminderManager checkNotificationAvailabilityWithCompletion:](self, "checkNotificationAvailabilityWithCompletion:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SCSharingReminderManager notificationsToRequest](self, "notificationsToRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v9, 0);

  }
}

void __65__SCSharingReminderManager_getNeededNotificationsWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && a2)
  {
    objc_msgSend(WeakRetained, "notificationsToRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationDeliveryKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "notificationsToRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v11, v12);

  }
}

- (void)handleNotificationEventWithName:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  -[SCSharingReminderManager notificationDeliveryKey](self, "notificationDeliveryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__SCSharingReminderManager_handleNotificationEventWithName___block_invoke;
    v11[3] = &unk_2516624C0;
    objc_copyWeak(&v12, &location);
    -[SCSharingReminderManager checkNotificationAvailabilityWithCompletion:](self, "checkNotificationAvailabilityWithCompletion:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SCSharingReminderManager wifiSyncService](self, "wifiSyncService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interestedNotifications");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
    {
      -[SCSharingReminderManager handleWifiSyncNotificationEventWithName:](self, "handleWifiSyncNotificationEventWithName:", v4);
    }
    else
    {
      SCLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SCSharingReminderManager handleNotificationEventWithName:].cold.1();

    }
  }

}

void __60__SCSharingReminderManager_handleNotificationEventWithName___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      SCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = CFSTR("N");
        if (a2)
          v9 = CFSTR("Y");
        v10 = 138412546;
        v11 = v9;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_2454C0000, v8, OS_LOG_TYPE_INFO, "\"Skipping posting because of notification availability %@ and/or error %@\", (uint8_t *)&v10, 0x16u);
      }

    }
    else
    {
      objc_msgSend(WeakRetained, "postDueSharingReminders");
    }
  }

}

- (void)handleWifiSyncNotificationEventWithName:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[SCSharingReminderManager wifiSyncService](self, "wifiSyncService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke;
  v6[3] = &unk_251662538;
  v6[4] = self;
  objc_msgSend(v5, "hostForIdentifier:completion:", v4, v6);

}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "sharingReminderCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ignoredIdentifiersForType:", CFSTR("com.apple.safetycheckd.wifi"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5
      && (objc_msgSend(v3, "lockdownFrameworkKey"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "containsObject:", v6),
          v6,
          v7))
    {
      SCLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v3;
        _os_log_impl(&dword_2454C0000, v8, OS_LOG_TYPE_INFO, "\"Ignoring WiFi Sync activity with host %@\", buf, 0xCu);
      }

    }
    else
    {
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "archiverService");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_12;
      v10[3] = &unk_251662510;
      objc_copyWeak(&v12, (id *)buf);
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = v3;
      objc_msgSend(v9, "getIntAtKey:completion:", 3, v10);

      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  NSObject *v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_12_cold_1();
    }
    else
    {
      +[SCSharingReminderKVStoreValue defaultForKey:](SCSharingReminderKVStoreValue, "defaultForKey:", 3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "integerValue");

      if (v9 == a2)
      {
        do
        {
          a2 += arc4random_uniform(0x4D59u) + 1800;
          v10 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v10) = objc_msgSend(v10, "isWithinDeliveryWindow:", v11);

        }
        while ((v10 & 1) == 0);
      }
      else
      {
        SCLogger();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v23 = a2;
          _os_log_impl(&dword_2454C0000, v12, OS_LOG_TYPE_INFO, "\"Skipping time randomization for FeatureControlling value %ld\", buf, 0xCu);
        }

      }
      v13 = (double)a2;
      objc_msgSend(WeakRetained, "reminderForPairedComputer:delay:", *(_QWORD *)(a1 + 40), (double)a2);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "sharingReminderCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSharingReminders:", v15);

      objc_msgSend(WeakRetained, "sharingReminderCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "archiveCache:completion:", v16, 0);

      +[SCSharingReminderDeliveryTask taskRequestScheduledAfter:](SCSharingReminderDeliveryTask, "taskRequestScheduledAfter:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SCLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = (uint64_t)v17;
        _os_log_impl(&dword_2454C0000, v18, OS_LOG_TYPE_INFO, "\"Submitting task request %@ for reminder delivery\", buf, 0xCu);
      }

      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_18;
      v19[3] = &unk_2516624E8;
      v20 = 0;
      +[SCUtils submitTaskRequest:completion:](SCUtils, "submitTaskRequest:completion:", v17, v19);

    }
  }

}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_18(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!a2 || *(_QWORD *)(a1 + 32))
  {
    SCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_18_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (id)reminderForPairedComputer:(id)a3 delay:(double)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  int v10;
  SCSharingReminder *v11;
  void *v12;
  SCSharingReminder *v13;

  v5 = a3;
  objc_msgSend(v5, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(v5, "deviceName");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "marketingName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Windows PC"));

    if (v10)
      v8 = CFSTR("Windows PC");
    else
      v8 = &stru_251662C40;
  }
  v11 = [SCSharingReminder alloc];
  objc_msgSend(v5, "lockdownFrameworkKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SCSharingReminder initWithIdentifier:displayName:type:deliverAfter:](v11, "initWithIdentifier:displayName:type:deliverAfter:", v12, v8, CFSTR("com.apple.safetycheckd.wifi"), a4);

  return v13;
}

- (void)postDueSharingReminders
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"SharingReminderManager could not form a request: %@ from the given sharing reminders: %@\");
  OUTLINED_FUNCTION_3();
}

void __51__SCSharingReminderManager_postDueSharingReminders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      SCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __51__SCSharingReminderManager_postDueSharingReminders__block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(WeakRetained, "notificationsToRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notificationDeliveryKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v8);

      objc_msgSend(v5, "notificationDeliveryKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCUtils unregisterDarwinNotification:](SCUtils, "unregisterDarwinNotification:", v9);

      objc_msgSend(v5, "sharingReminderCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeSharingReminders:wereDelivered:", *(_QWORD *)(a1 + 32), 1);

      objc_msgSend(v5, "sharingReminderCache");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "archiveCache:completion:", v6, 0);
    }

  }
}

- (void)postWifiSyncNotificationWithCompletion:(id)a3
{
  id v4;
  SCSharingReminder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SCSharingReminder initWithIdentifier:displayName:type:deliverAfter:]([SCSharingReminder alloc], "initWithIdentifier:displayName:type:deliverAfter:", CFSTR("id"), CFSTR("Windows PC"), CFSTR("com.apple.safetycheckd.wifi"), 0.0);
  -[SCSharingReminderManager userNotificationService](self, "userNotificationService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "toUNNotificationRequest:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SCSharingReminderManager userNotificationService](self, "userNotificationService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __67__SCSharingReminderManager_postWifiSyncNotificationWithCompletion___block_invoke;
    v11[3] = &unk_251662588;
    v12 = v4;
    objc_msgSend(v9, "addNotificationRequest:withCompletionHandler:", v8, v11);

    v10 = v12;
  }
  else
  {
    SCLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCSharingReminderManager postWifiSyncNotificationWithCompletion:].cold.1((uint64_t)v5, v10);
  }

}

uint64_t __67__SCSharingReminderManager_postWifiSyncNotificationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

- (void)checkNotificationAvailabilityWithCompletion:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (-[SCSharingReminderManager cacheHasDueReminders](self, "cacheHasDueReminders")
    && (objc_msgSend(MEMORY[0x24BDBCE60], "now"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = -[SCSharingReminderManager isWithinDeliveryWindow:](self, "isWithinDeliveryWindow:", v5),
        v5,
        v6))
  {
    objc_initWeak(&location, self);
    -[SCSharingReminderManager archiverService](self, "archiverService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke;
    v8[3] = &unk_2516625D8;
    objc_copyWeak(&v10, &location);
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v7, "getIntAtKey:completion:", 0, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void (*v8)(void);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[6];
  id v15;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_cold_1();

      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_msgSend(WeakRetained, "sharingReminderCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "consecutiveNotificationCount");

      objc_msgSend(v6, "sharingReminderCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastFiredDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "archiverService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_31;
        v14[3] = &unk_2516625B0;
        v13 = *(id *)(a1 + 40);
        v14[5] = v6;
        v15 = v13;
        v14[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v12, "getIntAtKey:completion:", 1, v14);

        goto LABEL_9;
      }
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v8();
  }
LABEL_9:

}

void __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_31(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  double v7;
  void *v8;
  long double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  if (v5)
  {
    SCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_31_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = (double)a2;
    objc_msgSend(*(id *)(a1 + 32), "sharingReminderCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = exp2((double)objc_msgSend(v8, "consecutiveNotificationCount")) * v7;

    objc_msgSend(*(id *)(a1 + 40), "sharingReminderCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastFiredDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingTimeInterval:", (double)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "earlierDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "isEqualToDate:", v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)validRemindersDueBy:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v4 = a3;
  -[SCSharingReminderManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SCSharingReminderManager_validRemindersDueBy___block_invoke;
  block[3] = &unk_251662640;
  block[4] = self;
  dispatch_sync(v5, block);

  -[SCSharingReminderManager sharingReminderCache](self, "sharingReminderCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remindersDueBy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __48__SCSharingReminderManager_validRemindersDueBy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "validateCacheWithCompletion:", &__block_literal_global_0);
}

void __48__SCSharingReminderManager_validRemindersDueBy___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  __CFString *v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    SCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = CFSTR("Unknown");
      if (v4)
        v6 = v4;
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_2454C0000, v5, OS_LOG_TYPE_ERROR, "\"Error validating cache, error: %@\", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (void)validateCacheWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminderManager wifiSyncService](self, "wifiSyncService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__SCSharingReminderManager_validateCacheWithCompletion___block_invoke;
  v9[3] = &unk_251662668;
  v9[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "fetchWifiSyncIdentifiersWithCompletion:", v9);

}

void __56__SCSharingReminderManager_validateCacheWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sharingReminderCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduledReminders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v27 = *(_QWORD *)v31;
    v28 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "type");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.safetycheckd.wifi"));

        if (!v12)
        {
          SCLogger();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            __56__SCSharingReminderManager_validateCacheWithCompletion___block_invoke_cold_1((uint64_t)v36, (uint64_t)v10);
LABEL_13:

LABEL_14:
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
          continue;
        }
        if (!_os_feature_enabled_impl())
          goto LABEL_14;
        objc_msgSend(v10, "identifier");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "containsObject:", v13))
          goto LABEL_13;
        objc_msgSend(*(id *)(a1 + 32), "sharingReminderCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ignoredIdentifiersForType:", v15);
        v16 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v18 = v7;
        v19 = a1;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v17, "containsObject:", v20);

        a1 = v19;
        v7 = v18;

        v3 = v16;
        v8 = v27;

        v5 = v28;
        if ((v29 & 1) != 0)
          goto LABEL_14;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v7);
  }

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    SCLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v35 = v22;
      _os_log_impl(&dword_2454C0000, v21, OS_LOG_TYPE_INFO, "\"Removing reminders after validation check: %@\", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "sharingReminderCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeSharingReminders:wereDelivered:", v24, 0);

    v25 = *(void **)(a1 + 32);
    objc_msgSend(v25, "sharingReminderCache");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "archiveCache:completion:", v26, *(_QWORD *)(a1 + 48));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)archiveCache:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__SCSharingReminderManager_archiveCache_completion___block_invoke;
  v11[3] = &unk_251662690;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "setObject:atKey:completion:", v10, CFSTR("SharingReminderCache"), v11);

}

void __52__SCSharingReminderManager_archiveCache_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    SCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __52__SCSharingReminderManager_archiveCache_completion___block_invoke_cold_1();

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (id)notificationDeliveryKey
{
  return CFSTR("com.apple.springboard.lockNotificationListEmptyAtScreenOn");
}

- (BOOL)isWithinDeliveryWindow:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsInTimeZone:fromDate:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = (unint64_t)(objc_msgSend(v7, "hour") - 9) < 9;
  return (char)v5;
}

- (BOOL)cacheHasDueReminders
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCSharingReminderManager validRemindersDueBy:](self, "validRemindersDueBy:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  objc_msgSend(v7, "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "categoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasPrefix:", CFSTR("scsharingreminders")))
  {
    objc_msgSend(v7, "actionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCSharingReminderManager handleNotificationAction:](self, "handleNotificationAction:", v13);

    if (!v8)
      goto LABEL_8;
    goto LABEL_7;
  }
  SCLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SCSharingReminderManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.1();

  if (v8)
LABEL_7:
    v8[2](v8);
LABEL_8:

}

- (void)handleNotificationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF8A70]))
  {
    -[SCSharingReminderManager sharingReminderCache](self, "sharingReminderCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "incrementNotificationCount");
LABEL_5:

    -[SCSharingReminderManager sharingReminderCache](self, "sharingReminderCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCSharingReminderManager archiveCache:completion:](self, "archiveCache:completion:", v6, 0);

    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF8A60]))
  {
    -[SCSharingReminderManager sharingReminderCache](self, "sharingReminderCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetNotificationCount");
    goto LABEL_5;
  }
  SCLogger();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SCSharingReminderManager handleNotificationAction:].cold.1();

LABEL_9:
}

- (void)userOpenedSafetyCheckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[SCSharingReminderManager sharingReminderCache](self, "sharingReminderCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetNotificationCount");

  objc_initWeak(&location, self);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__SCSharingReminderManager_userOpenedSafetyCheckWithCompletion___block_invoke;
  v8[3] = &unk_2516626B8;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "getIntAtKey:completion:", 2, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __64__SCSharingReminderManager_userOpenedSafetyCheckWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (v5)
  {
    SCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__SCSharingReminderManager_userOpenedSafetyCheckWithCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(WeakRetained, "sharingReminderCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deliverGeneralSharingReminderAfter:", (double)a2);

    objc_msgSend(v7, "sharingReminderCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "archiveCache:completion:", v10, *(_QWORD *)(a1 + 32));

  }
}

- (void)handleSignals:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[24];
  void *v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v22 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "signalType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("userAcknowledgedShare"));

        SCLogger();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v11;
            _os_log_impl(&dword_2454C0000, v15, OS_LOG_TYPE_INFO, "\"Ignoring future reminders for %@ and removing any existing ones\", buf, 0xCu);
          }

          -[SCSharingReminderManager sharingReminderCache](self, "sharingReminderCache");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sharingIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v17;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sharingType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addIgnoredIdentifiers:withType:", v18, v19);

        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[SCSharingReminderManager handleSignals:completion:].cold.1((uint64_t)v32, (uint64_t)v11);

          +[SCDaemonError errorWithCode:](SCDaemonError, "errorWithCode:", 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v8);
  }

  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __53__SCSharingReminderManager_handleSignals_completion___block_invoke;
  v24[3] = &unk_2516626E0;
  objc_copyWeak(&v27, (id *)buf);
  v20 = v6;
  v25 = v20;
  v21 = v22;
  v26 = v21;
  -[SCSharingReminderManager validateCacheWithCompletion:](self, "validateCacheWithCompletion:", v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

void __53__SCSharingReminderManager_handleSignals_completion___block_invoke(id *a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  if (v5 || !a2)
  {
    SCLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __53__SCSharingReminderManager_handleSignals_completion___block_invoke_cold_1(v8);

    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "sharingReminderCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__SCSharingReminderManager_handleSignals_completion___block_invoke_2;
    v9[3] = &unk_251662690;
    v10 = a1[4];
    v11 = a1[5];
    objc_msgSend(WeakRetained, "archiveCache:completion:", v7, v9);

  }
}

void __53__SCSharingReminderManager_handleSignals_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", 2, *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(_QWORD, BOOL, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4 == 0, v4);

}

- (void)fetchStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke;
  v7[3] = &unk_251662780;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "getValueAtKey:completion:", 0, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "archiverService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_2;
    v7[3] = &unk_251662758;
    v7[4] = v5;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v6, "getValueAtKey:completion:", 1, v7);

  }
}

void __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "archiverService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_3;
    v7[3] = &unk_251662730;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    v9 = v3;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v5, "getValueAtKey:completion:", 2, v7);

  }
}

void __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "archiverService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_4;
    v7[3] = &unk_251662708;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    v9 = *(id *)(a1 + 48);
    v10 = v3;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v5, "getValueAtKey:completion:", 3, v7);

  }
}

void __54__SCSharingReminderManager_fetchStatusWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _OWORD v15[2];
  char v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v7, "sharingReminderCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "toCacheState");
    }
    else
    {
      v26 = 0u;
      v27 = 0u;
    }

    v22 = 0;
    LOBYTE(v20) = objc_msgSend(*(id *)(a1 + 40), "integerValue");
    *(_QWORD *)&v20 = v20;
    *((_QWORD *)&v20 + 1) = objc_msgSend(*(id *)(a1 + 48), "integerValue");
    *(_QWORD *)&v21 = objc_msgSend(*(id *)(a1 + 56), "integerValue");
    *((_QWORD *)&v21 + 1) = objc_msgSend(v5, "integerValue");
    v10 = v26;
    LOBYTE(v22) = v26;
    v23 = *((id *)&v26 + 1);
    v24 = (id)v27;
    v25 = *((id *)&v27 + 1);
    v11 = *(_QWORD *)(a1 + 64);
    v15[0] = v20;
    v15[1] = v21;
    v16 = v10;
    v12 = v23;
    v17 = v12;
    v13 = v24;
    v18 = v13;
    v14 = v25;
    v19 = v14;
    (*(void (**)(uint64_t, _OWORD *))(v11 + 16))(v11, v15);

  }
}

- (void)resetFeatureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _OWORD v11[2];
  char v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  configWithGlobalDefaults(&v16);
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "toCacheState");
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }

  v11[0] = v16;
  v11[1] = v17;
  v12 = v18;
  v7 = *((id *)&v18 + 1);
  v13 = v7;
  v8 = (id)v19;
  v14 = v8;
  v9 = *((id *)&v19 + 1);
  v15 = v9;
  if (self)
  {
    -[SCSharingReminderManager setStatus:completion:](self, "setStatus:completion:", v11, v4);
  }
  else
  {
    v10 = v9;

  }
}

- (void)setStatus:(id *)a3 completion:(id)a4
{
  id v6;
  SCSharingReminderKVStoreValue *v7;
  SCSharingReminderKVStoreValue *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  id v25;
  SCSharingReminderKVStoreValue *v26;
  SCSharingReminderKVStoreValue *v27;
  SCSharingReminderKVStoreValue *v28;
  SCSharingReminderKVStoreValue *v29;
  _QWORD block[5];
  id v31;
  __int128 v32;
  __int128 v33;
  id v34[4];
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  id v45;
  id v46;
  _QWORD v47[4];
  NSObject *v48;
  id v49;
  id v50;
  id location[2];

  v6 = a4;
  v7 = -[SCSharingReminderKVStoreValue initWithIntegerValue:]([SCSharingReminderKVStoreValue alloc], "initWithIntegerValue:", a3->var0.var0);
  v29 = -[SCSharingReminderKVStoreValue initWithIntegerValue:]([SCSharingReminderKVStoreValue alloc], "initWithIntegerValue:", a3->var0.var1);
  v8 = -[SCSharingReminderKVStoreValue initWithIntegerValue:]([SCSharingReminderKVStoreValue alloc], "initWithIntegerValue:", a3->var0.var3);
  v28 = -[SCSharingReminderKVStoreValue initWithIntegerValue:]([SCSharingReminderKVStoreValue alloc], "initWithIntegerValue:", a3->var0.var2);
  v27 = v8;
  objc_initWeak(location, self);
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke;
  v47[3] = &unk_2516627A8;
  objc_copyWeak(&v50, location);
  v12 = v6;
  v49 = v12;
  v13 = v9;
  v48 = v13;
  objc_msgSend(v10, "setValue:atKey:completion:", v7, 0, v47);
  v26 = v7;

  dispatch_group_enter(v13);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke_47;
  v43[3] = &unk_2516627A8;
  objc_copyWeak(&v46, location);
  v15 = v12;
  v45 = v15;
  v16 = v13;
  v44 = v16;
  objc_msgSend(v14, "setValue:atKey:completion:", v29, 1, v43);

  dispatch_group_enter(v16);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v11;
  v39[1] = 3221225472;
  v39[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke_48;
  v39[3] = &unk_2516627A8;
  objc_copyWeak(&v42, location);
  v18 = v15;
  v41 = v18;
  v19 = v16;
  v40 = v19;
  objc_msgSend(v17, "setValue:atKey:completion:", v28, 2, v39);

  dispatch_group_enter(v19);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke_49;
  v35[3] = &unk_2516627A8;
  objc_copyWeak(&v38, location);
  v21 = v18;
  v37 = v21;
  v22 = v19;
  v36 = v22;
  objc_msgSend(v20, "setValue:atKey:completion:", v27, 3, v35);

  block[0] = v11;
  block[1] = 3254779904;
  block[2] = __49__SCSharingReminderManager_setStatus_completion___block_invoke_50;
  block[3] = &unk_2516627D0;
  v23 = *(_OWORD *)&a3->var0.var0;
  v24 = *(_OWORD *)&a3->var0.var2;
  a3 = ($FD6C089DBE29D0470B3336F97308C734 *)((char *)a3 + 32);
  v32 = v23;
  v33 = v24;
  __copy_constructor_8_8_t0w1_s8_s16_s24((uint64_t)v34, (uint64_t)a3);
  block[4] = self;
  v31 = v21;
  v25 = v21;
  dispatch_group_notify(v22, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v50);

  objc_destroyWeak(location);
  __destructor_8_s8_s16_s24((id *)a3);
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_cold_1();

      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);

    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }

}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_47(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_47_cold_1();

      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);

    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }

}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_48_cold_1();

      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);

    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }

}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_49(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_49_cold_1();

      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);

    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }

}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_50(uint64_t a1)
{
  __objc2_class *v2;
  id v3[4];

  v2 = SCSharingReminderCache;
  __copy_constructor_8_8_t0w1_s8_s16_s24((uint64_t)v3, a1 + 80);
  if (SCSharingReminderCache)
  {
    +[SCSharingReminderCache cacheWithState:](SCSharingReminderCache, "cacheWithState:", v3);
    v2 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "setSharingReminderCache:", v2);
  objc_msgSend(*(id *)(a1 + 32), "archiveCache:completion:", v2, *(_QWORD *)(a1 + 40));

}

- (void)setReminderDelays:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SCSharingReminderKVStoreValue *v8;
  void *v9;
  SCSharingReminderKVStoreValue *v10;
  SCSharingReminderKVStoreValue *v11;
  void *v12;
  SCSharingReminderKVStoreValue *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  SCSharingReminderKVStoreValue *v28;
  SCSharingReminderKVStoreValue *v29;
  _QWORD block[4];
  id v31;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  NSObject *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  id v43;
  id location[2];

  v6 = a3;
  v7 = a4;
  v8 = [SCSharingReminderKVStoreValue alloc];
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SCSharingReminderKVStoreValue initWithIntegerValue:](v8, "initWithIntegerValue:", objc_msgSend(v9, "longLongValue"));

  v11 = [SCSharingReminderKVStoreValue alloc];
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[SCSharingReminderKVStoreValue initWithIntegerValue:](v11, "initWithIntegerValue:", objc_msgSend(v12, "longLongValue"));

  v13 = [SCSharingReminderKVStoreValue alloc];
  v27 = v6;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SCSharingReminderKVStoreValue initWithIntegerValue:](v13, "initWithIntegerValue:", objc_msgSend(v14, "longLongValue"));

  objc_initWeak(location, self);
  v15 = dispatch_group_create();
  dispatch_group_enter(v15);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke;
  v40[3] = &unk_2516627A8;
  objc_copyWeak(&v43, location);
  v18 = v7;
  v42 = v18;
  v19 = v15;
  v41 = v19;
  objc_msgSend(v16, "setValue:atKey:completion:", v10, 1, v40);

  dispatch_group_enter(v19);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v17;
  v36[1] = 3221225472;
  v36[2] = __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_51;
  v36[3] = &unk_2516627A8;
  objc_copyWeak(&v39, location);
  v21 = v18;
  v38 = v21;
  v22 = v19;
  v37 = v22;
  objc_msgSend(v20, "setValue:atKey:completion:", v29, 2, v36);

  dispatch_group_enter(v22);
  -[SCSharingReminderManager archiverService](self, "archiverService");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_52;
  v32[3] = &unk_2516627A8;
  objc_copyWeak(&v35, location);
  v24 = v21;
  v34 = v24;
  v25 = v22;
  v33 = v25;
  objc_msgSend(v23, "setValue:atKey:completion:", v28, 3, v32);

  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_53;
  block[3] = &unk_251662808;
  v31 = v24;
  v26 = v24;
  dispatch_group_notify(v25, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&v43);
  objc_destroyWeak(location);

}

void __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_cold_1();

      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_51(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_48_cold_1();

      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      SCLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __49__SCSharingReminderManager_setStatus_completion___block_invoke_49_cold_1();

      v8 = *(_QWORD *)(a1 + 40);
      v11[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCDaemonError errorWithCode:underlyingErrors:](SCDaemonError, "errorWithCode:underlyingErrors:", 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v10);

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

uint64_t __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SCSharingReminderCache)sharingReminderCache
{
  return self->_sharingReminderCache;
}

- (void)setSharingReminderCache:(id)a3
{
  objc_storeStrong((id *)&self->_sharingReminderCache, a3);
}

- (SCArchivingService)archiverService
{
  return self->_archiverService;
}

- (void)setArchiverService:(id)a3
{
  objc_storeStrong((id *)&self->_archiverService, a3);
}

- (SCUNNotificationService)userNotificationService
{
  return self->_userNotificationService;
}

- (void)setUserNotificationService:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationService, a3);
}

- (SCLockdownService)wifiSyncService
{
  return self->_wifiSyncService;
}

- (void)setWifiSyncService:(id)a3
{
  objc_storeStrong((id *)&self->_wifiSyncService, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableSet)notificationsToRequest
{
  return self->_notificationsToRequest;
}

- (void)setNotificationsToRequest:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsToRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsToRequest, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_wifiSyncService, 0);
  objc_storeStrong((id *)&self->_userNotificationService, 0);
  objc_storeStrong((id *)&self->_archiverService, 0);
  objc_storeStrong((id *)&self->_sharingReminderCache, 0);
}

- (void)handleNotificationEventWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Received unrecognized notification event: %@, doing nothing\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Could not fetch delay, so could not schedule reminder. Error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __68__SCSharingReminderManager_handleWifiSyncNotificationEventWithName___block_invoke_18_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2454C0000, a2, a3, "\"Error submitting task request: %@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __51__SCSharingReminderManager_postDueSharingReminders__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Error posting notification: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)postWifiSyncNotificationWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = 0;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2454C0000, a2, OS_LOG_TYPE_ERROR, "\"SharingReminderManager could not form a request: %@ for a reminder with type: %@\", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Couldn't check notif status. Max count error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __72__SCSharingReminderManager_checkNotificationAvailabilityWithCompletion___block_invoke_31_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Couldn't fetch backstop interval length. Error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__SCSharingReminderManager_validateCacheWithCompletion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_5(&dword_2454C0000, v5, v6, "\"Cannot validate cache against unrecognized type: %@\");

  OUTLINED_FUNCTION_7();
}

void __52__SCSharingReminderManager_archiveCache_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Archiving error: %@. Failed to archive cache: %@\");
  OUTLINED_FUNCTION_3();
}

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Unknown notification category identifier: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleNotificationAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Unknown notification action identifier: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__SCSharingReminderManager_userOpenedSafetyCheckWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_2454C0000, v0, v1, "\"Error retrieving general time interval after SC use: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleSignals:(uint64_t)a1 completion:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "signalType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_5(&dword_2454C0000, v5, v6, "\"Received unrecognized sharing reminder signal type: %@\");

  OUTLINED_FUNCTION_7();
}

void __53__SCSharingReminderManager_handleSignals_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2454C0000, log, OS_LOG_TYPE_ERROR, "\"Cache validation failed, returning error...\", v1, 2u);
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Error setting maximum notification count: %@ %s\");
  OUTLINED_FUNCTION_3();
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_47_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Error setting backstop length: %@ %s\");
  OUTLINED_FUNCTION_3();
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_48_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Error setting general time interval: %@ %s\");
  OUTLINED_FUNCTION_3();
}

void __49__SCSharingReminderManager_setStatus_completion___block_invoke_49_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Error setting short time interval: %@ %s\");
  OUTLINED_FUNCTION_3();
}

void __57__SCSharingReminderManager_setReminderDelays_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2454C0000, v0, v1, "\"Error setting backstop delay: %@ %s\");
  OUTLINED_FUNCTION_3();
}

@end
