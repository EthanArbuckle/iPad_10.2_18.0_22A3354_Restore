@implementation WFTriggerRegistrar

- (WFTriggerRegistrar)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4 userNotificationManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFTriggerRegistrar *v12;
  WFTriggerRegistrar *v13;
  WFTriggerUserNotificationManager *v14;
  WFTriggerNotificationScheduler *v15;
  WFTriggerNotificationScheduler *scheduler;
  WFTriggerBootManager *v17;
  WFTriggerBootManager *triggerBootManager;
  WFTriggerBootManager *v19;
  WFTriggerEventQueue *v20;
  WFTriggerEventQueue *eventQueue;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  WFCoreDuetListener *v26;
  WFCoreDuetListener *coreDuetListener;
  WFBiomeListener *v28;
  WFBiomeListener *biomeListener;
  WFTriggerRegistrar *v30;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)WFTriggerRegistrar;
  v12 = -[WFTriggerRegistrar init](&v32, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseProvider, a3);
    objc_storeStrong((id *)&v13->_eventHandler, a4);
    v14 = -[WFTriggerUserNotificationManager initWithUserNotificationManager:]([WFTriggerUserNotificationManager alloc], "initWithUserNotificationManager:", v11);
    v15 = -[WFTriggerNotificationScheduler initWithUserNotificationManager:databaseProvider:]([WFTriggerNotificationScheduler alloc], "initWithUserNotificationManager:databaseProvider:", v14, v9);
    scheduler = v13->_scheduler;
    v13->_scheduler = v15;

    v17 = -[WFTriggerBootManager initWithDatabaseProvider:]([WFTriggerBootManager alloc], "initWithDatabaseProvider:", v9);
    -[WFTriggerBootManager start](v17, "start");
    triggerBootManager = v13->_triggerBootManager;
    v13->_triggerBootManager = v17;
    v19 = v17;

    v20 = -[WFTriggerEventQueue initWithDatabaseProvider:notificationManager:notificationScheduler:triggerBootManager:]([WFTriggerEventQueue alloc], "initWithDatabaseProvider:notificationManager:notificationScheduler:triggerBootManager:", v9, v14, v13->_scheduler, v19);
    eventQueue = v13->_eventQueue;
    v13->_eventQueue = v20;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_USER_INITIATED, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.siriactionsd.WFTriggerRegistrar", v23);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v24;

    v26 = -[WFCoreDuetListener initWithDatabaseProvider:eventQueue:]([WFCoreDuetListener alloc], "initWithDatabaseProvider:eventQueue:", v9, v13->_eventQueue);
    coreDuetListener = v13->_coreDuetListener;
    v13->_coreDuetListener = v26;

    v28 = -[WFBiomeListener initWithEventQueue:]([WFBiomeListener alloc], "initWithEventQueue:", v13->_eventQueue);
    biomeListener = v13->_biomeListener;
    v13->_biomeListener = v28;

    -[SwiftVCDaemonXPCEventHandler addObserver:selector:name:](v13->_eventHandler, "addObserver:selector:name:", v13, sel_deviceDidUnlockForFirstTime, CFSTR("com.apple.mobile.keybagd.first_unlock"));
    -[SwiftVCDaemonXPCEventHandler addObserver:selector:name:](v13->_eventHandler, "addObserver:selector:name:", v13, sel_timezoneChangeDidOccur, CFSTR("com.apple.system.timezone"));
    -[SwiftVCDaemonXPCEventHandler addObserver:selector:name:](v13->_eventHandler, "addObserver:selector:name:", v13, sel_timeChangeDidOccur, CFSTR("com.apple.system.clock_set"));

    v30 = v13;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[WFTriggerRegistrar eventHandler](self, "eventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:", self, CFSTR("com.apple.mobile.keybagd.first_unlock"));

  -[WFTriggerRegistrar eventHandler](self, "eventHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:", self, CFSTR("com.apple.system.timezone"));

  -[WFTriggerRegistrar eventHandler](self, "eventHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:", self, CFSTR("com.apple.system.clock_set"));

  v6.receiver = self;
  v6.super_class = (Class)WFTriggerRegistrar;
  -[WFTriggerRegistrar dealloc](&v6, sel_dealloc);
}

- (void)deviceDidUnlockForFirstTime
{
  void *v3;

  -[WFTriggerRegistrar triggerBootManager](self, "triggerBootManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceWasUnlockedForTheFirstTime");

  -[WFTriggerRegistrar registerAllTriggersWithCompletion:](self, "registerAllTriggersWithCompletion:", 0);
}

- (void)timezoneChangeDidOccur
{
  -[WFTriggerRegistrar registerAllTriggersWithCompletion:](self, "registerAllTriggersWithCompletion:", 0);
}

- (void)timeChangeDidOccur
{
  -[WFTriggerRegistrar registerAllTriggersWithCompletion:](self, "registerAllTriggersWithCompletion:", 0);
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFTriggerRegistrar eventQueue](self, "eventQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleRemovedIgnoredNotifications:", v4);

}

- (void)registerAllTriggersWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFTriggerRegistrar queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke;
  v7[3] = &unk_1E7AA77A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)registerTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WFTriggerRegistrar queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WFTriggerRegistrar_registerTriggerWithIdentifier_completion___block_invoke;
  block[3] = &unk_1E7AA8110;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)queue_registerConfiguredTrigger:(id)a3 completion:(id)a4
{
  id v7;
  NSObject *v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  -[WFTriggerRegistrar queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = -[WFTriggerRegistrar triggerBackingForConfiguredTrigger:](self, "triggerBackingForConfiguredTrigger:", v12);
  switch(v9)
  {
    case 1:
      -[WFTriggerRegistrar coreDuetListener](self, "coreDuetListener");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = v11;
      objc_msgSend(v11, "registerConfiguredTrigger:completion:", v12, v7);
      goto LABEL_8;
    case 2:
      -[WFTriggerRegistrar biomeListener](self, "biomeListener");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerRegistrar.m"), 138, CFSTR("Trigger did not specify a backing source and cannot be registered."));
LABEL_8:

      break;
  }

}

- (void)unregisterAllTriggers
{
  NSObject *v3;
  _QWORD block[5];

  -[WFTriggerRegistrar queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WFTriggerRegistrar_unregisterAllTriggers__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  -[WFTriggerRegistrar queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WFTriggerRegistrar_unregisterTriggerWithIdentifier_triggerBacking___block_invoke;
  block[3] = &unk_1E7AA6E20;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)queue_unregisterConfiguredTrigger:(id)a3
{
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[WFTriggerRegistrar queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[WFTriggerRegistrar triggerBackingForConfiguredTrigger:](self, "triggerBackingForConfiguredTrigger:", v15);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v15, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Trigger (%@) did not specify a backing source and cannot be unregistered"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerRegistrar.m"), 180, v9);

  }
  -[WFTriggerRegistrar scheduler](self, "scheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelActivitiesFromTriggerIdentifier:", v11);

  objc_msgSend(v15, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerRegistrar queue_unregisterConfiguredTriggerWithIdentifier:triggerBacking:](self, "queue_unregisterConfiguredTriggerWithIdentifier:triggerBacking:", v12, objc_msgSend((id)objc_opt_class(), "triggerBacking"));

}

- (void)queue_unregisterConfiguredTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[WFTriggerRegistrar queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (a4 == 2)
  {
    -[WFTriggerRegistrar biomeListener](self, "biomeListener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    -[WFTriggerRegistrar coreDuetListener](self, "coreDuetListener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v7;
    objc_msgSend(v7, "unregisterConfiguredTriggerWithIdentifier:", v14);

  }
  -[WFTriggerRegistrar databaseProvider](self, "databaseProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTriggerRegistrar triggerBootManager](self, "triggerBootManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allConfiguredTriggers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "descriptors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configuredTriggersDidChange:", v13);

}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 eventInfo:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  SEL v22;
  BOOL v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[WFTriggerRegistrar queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__WFTriggerRegistrar_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke;
  v18[3] = &unk_1E7AA6E48;
  v18[4] = self;
  v19 = v11;
  v21 = v13;
  v22 = a2;
  v23 = a4;
  v20 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  dispatch_async(v14, v18);

}

- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  -[WFTriggerRegistrar deleteTriggerWithIdentifier:allowedDeletionClasses:completion:](self, "deleteTriggerWithIdentifier:allowedDeletionClasses:completion:", a3, 0, a4);
}

- (void)deleteTriggerWithIdentifier:(id)a3 allowedDeletionClasses:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  SEL v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[WFTriggerRegistrar queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WFTriggerRegistrar_deleteTriggerWithIdentifier_allowedDeletionClasses_completion___block_invoke;
  block[3] = &unk_1E7AA7650;
  block[4] = self;
  v17 = v9;
  v19 = v11;
  v20 = a2;
  v18 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(v12, block);

}

- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerRegistrar.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFTriggerRegistrar queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WFTriggerRegistrar_getConfiguredTriggerDescriptionsWithCompletion___block_invoke;
  block[3] = &unk_1E7AA77A8;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

- (int64_t)triggerBackingForConfiguredTrigger:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "triggerBacking");

  return v4;
}

- (id)unableToLoadDatabaseErrorWithUnderlyingError:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, a3, CFSTR("Unable to load database"));
}

- (WFCoreDuetListener)coreDuetListener
{
  return self->_coreDuetListener;
}

- (WFBiomeListener)biomeListener
{
  return self->_biomeListener;
}

- (WFTriggerNotificationScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (WFTriggerEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (WFTriggerBootManager)triggerBootManager
{
  return self->_triggerBootManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBootManager, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_biomeListener, 0);
  objc_storeStrong((id *)&self->_coreDuetListener, 0);
}

void __69__WFTriggerRegistrar_getConfiguredTriggerDescriptionsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "databaseWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;

  if (v3)
  {
    objc_msgSend(v3, "allConfiguredTriggers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_map:", &__block_literal_global_4296);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "unableToLoadDatabaseErrorWithUnderlyingError:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFTriggerRegistrar getConfiguredTriggerDescriptionsWithCompletion:]_block_invoke";
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get configured trigger descriptions: %{public}@", buf, 0x16u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

id __69__WFTriggerRegistrar_getConfiguredTriggerDescriptionsWithCompletion___block_invoke_141(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "localizedDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescriptionWithConfigurationSummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@: %@"), v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __84__WFTriggerRegistrar_deleteTriggerWithIdentifier_allowedDeletionClasses_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "databaseWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;

  if (v3)
  {
    objc_msgSend(v3, "configuredTriggerForTriggerID:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_10;
    if (!objc_msgSend(*(id *)(a1 + 32), "triggerBackingForConfiguredTrigger:", v5))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("WFTriggerRegistrar.m"), 245, CFSTR("Trigger did not specify a backing source and cannot be registered."));

    }
    if (!objc_msgSend(*(id *)(a1 + 48), "count")
      || (v6 = *(void **)(a1 + 48),
          objc_msgSend(v5, "trigger"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v6) = objc_msgSend(v6, "containsObject:", objc_opt_class()),
          v7,
          (v6 & 1) != 0))
    {
      v11 = 0;
      v8 = objc_msgSend(v3, "deleteReference:error:", v5, &v11);
      v9 = v11;
      if ((v8 & 1) != 0)
        objc_msgSend(*(id *)(a1 + 32), "queue_unregisterConfiguredTrigger:", v5);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
LABEL_10:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __75__WFTriggerRegistrar_fireTriggerWithIdentifier_force_eventInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v2, "databaseWithError:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;

  if (!v3)
  {
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "unableToLoadDatabaseErrorWithUnderlyingError:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v5);
    goto LABEL_14;
  }
  objc_msgSend(v3, "configuredTriggerForTriggerID:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, 0);
    goto LABEL_14;
  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "triggerBackingForConfiguredTrigger:", v5);
  switch(v6)
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "coreDuetListener");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v7 = v9;
      objc_msgSend(v9, "fireTriggerWithIdentifier:force:eventInfo:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      goto LABEL_13;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "biomeListener");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("WFTriggerRegistrar.m"), 215, CFSTR("Trigger did not specify a backing source and cannot be fired."));
LABEL_13:

      break;
  }
LABEL_14:

}

void __69__WFTriggerRegistrar_unregisterTriggerWithIdentifier_triggerBacking___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "databaseWithError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "scheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelActivitiesFromTriggerIdentifier:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "queue_unregisterConfiguredTriggerWithIdentifier:triggerBacking:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __43__WFTriggerRegistrar_unregisterAllTriggers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "databaseWithError:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;

  if (v3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "allConfiguredTriggers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(a1 + 32), "queue_unregisterConfiguredTrigger:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
}

void __63__WFTriggerRegistrar_registerTriggerWithIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "databaseWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;

  if (v3)
  {
    objc_msgSend(v3, "configuredTriggerForTriggerID:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(*(id *)(a1 + 32), "triggerBootManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "allConfiguredTriggers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptors");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configuredTriggersDidChange:", v9);

      objc_msgSend(*(id *)(a1 + 32), "queue_registerConfiguredTrigger:completion:", v6, *(_QWORD *)(a1 + 48));
    }
    else
    {
      getWFTriggersLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v15 = "-[WFTriggerRegistrar registerTriggerWithIdentifier:completion:]_block_invoke";
        v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s No configured trigger for identifier: %@", buf, 0x16u);
      }

      v6 = 0;
    }
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "unableToLoadDatabaseErrorWithUnderlyingError:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v6);
  }

}

void __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v2, "databaseWithError:", &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "triggerBootManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allConfiguredTriggers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configuredTriggersDidChange:", v7);

    objc_msgSend(v3, "allConfiguredTriggers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_2;
    v15[3] = &unk_1E7AA6DF8;
    v10 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_4;
    v13[3] = &unk_1E7AA6FA8;
    v14 = v10;
    objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v15, v13);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "unableToLoadDatabaseErrorWithUnderlyingError:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    }
  }

}

void __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_3;
  v9[3] = &unk_1E7AA6DD0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "queue_registerConfiguredTrigger:completion:", a2, v9);

}

uint64_t __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  return result;
}

uint64_t __56__WFTriggerRegistrar_registerAllTriggersWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
