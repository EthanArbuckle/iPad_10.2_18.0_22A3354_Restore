@implementation WFTriggerBootManager

- (WFTriggerBootManager)initWithDatabaseProvider:(id)a3
{
  id v5;
  WFTriggerBootManager *v6;
  WFTriggerBootManager *v7;
  id v8;
  uint64_t v9;
  UNUserNotificationCenter *notificationCenter;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  UNUserNotificationCenter *v15;
  void *v16;
  void *v17;
  void *v18;
  WFTriggerBootManager *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFTriggerBootManager;
  v6 = -[WFTriggerBootManager init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseProvider, a3);
    v8 = objc_alloc(MEMORY[0x1E0CEC7A0]);
    v9 = objc_msgSend(v8, "initWithBundleIdentifier:", *MEMORY[0x1E0DC7FE0]);
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = (UNUserNotificationCenter *)v9;

    -[UNUserNotificationCenter setDelegate:](v7->_notificationCenter, "setDelegate:", v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.shortcuts.WFTriggerBootManager", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v7->_notificationCenter, "setWantsNotificationResponsesDelivered");
    v15 = v7->_notificationCenter;
    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "category");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter setNotificationCategories:](v15, "setNotificationCategories:", v18);

    v19 = v7;
  }

  return v7;
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;

  -[WFTriggerBootManager notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:](self, "registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:", v3);

  v4 = (void *)objc_opt_class();
  -[WFTriggerBootManager notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:", v5, 0);

}

- (void)registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[WFTriggerBootManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)lastKnownBootUUIDDiffersFromCurrentBootUUID
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WFTriggerBootManager lastKnownBootUUID](self, "lastKnownBootUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFGetBootSessionUUID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v5 = v3;
  v6 = v5;
  if (v4 == v5)
  {

  }
  else
  {
    if (!v4 || !v5)
    {

LABEL_11:
      v9 = 1;
      goto LABEL_12;
    }
    v7 = objc_msgSend(v4, "isEqualToString:", v5);

    if (!v7)
      goto LABEL_11;
  }
  getWFTriggerNotificationsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[WFTriggerBootManager lastKnownBootUUIDDiffersFromCurrentBootUUID]";
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s Not posting notification because we already have for this boot session (%@) (%@)", (uint8_t *)&v11, 0x20u);
  }

  v9 = 0;
LABEL_12:

  return v9;
}

- (void)queue_postNotification
{
  NSObject *v3;
  id v4;

  -[WFTriggerBootManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFTriggerBootManager createOrUpdateBootTimeFileIfNeeded](self, "createOrUpdateBootTimeFileIfNeeded");
  -[WFTriggerBootManager notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTriggerBootManager postNotificationWithUserNotificationCenterIfNecessary:completionHandler:](self, "postNotificationWithUserNotificationCenterIfNecessary:completionHandler:", v4, &__block_literal_global_123);

}

- (void)postNotificationWithUserNotificationCenterIfNecessary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  getWFTriggerNotificationsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[WFTriggerBootManager postNotificationWithUserNotificationCenterIfNecessary:completionHandler:]";
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s Posting notification", buf, 0xCu);
  }

  -[WFTriggerBootManager notificationContentForDeviceWithKnownUnlockedState:](self, "notificationContentForDeviceWithKnownUnlockedState:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.siriactionsd.TriggersEnabledBootNotification"), v9, 0, 15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__WFTriggerBootManager_postNotificationWithUserNotificationCenterIfNecessary_completionHandler___block_invoke;
  v12[3] = &unk_1E7AA8398;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "addNotificationRequest:withCompletionHandler:", v10, v12);

}

- (id)notificationContentForDeviceWithKnownUnlockedState:(BOOL)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  id v16;
  __CFString *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[WFTriggerBootManager notificationContentForDeviceWithKnownUnlockedState:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Posting notification", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  WFLocalizedString(CFSTR("Shortcuts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a3 && !VCDeviceHasBeenUnlocked())
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("iPhone")))
    {
      v17 = CFSTR("Automations will run once your iPhone is unlocked.");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("iPod touch")))
    {
      v17 = CFSTR("Automations will run once your iPod is unlocked.");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("iPad")))
    {
      v17 = CFSTR("Automations will run once your iPad is unlocked.");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Mac")))
    {
      v17 = CFSTR("Automations will run once your Mac is unlocked.");
    }
    else
    {
      v17 = CFSTR("Automations will run once your device is unlocked.");
    }
    WFLocalizedString(v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  -[WFTriggerBootManager triggerManager](self, "triggerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allConfiguredTriggers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "if_objectsPassingTest:", &__block_literal_global_138);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("iPhone")))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = CFSTR("%d automations are enabled on your iPhone.");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("iPod touch")))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = CFSTR("%d automations are enabled on your iPod.");
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("iPad")))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = CFSTR("%d automations are enabled on your iPad.");
    }
    else
    {
      v18 = objc_msgSend(v9, "isEqualToString:", CFSTR("Mac"));
      v14 = (void *)MEMORY[0x1E0CB3940];
      if (v18)
        v15 = CFSTR("%d automations are enabled on your Mac.");
      else
        v15 = CFSTR("%d automations are enabled on your device.");
    }
    WFLocalizedPluralString(v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v19, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
    objc_msgSend(v6, "setBody:", v20);
    objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(v6, "setSound:", 0);
    objc_msgSend(v6, "setCategoryIdentifier:", *MEMORY[0x1E0DD9FE0]);
    objc_msgSend(v6, "setShouldSuppressDefaultAction:", 0);
    objc_msgSend(v6, "setShouldAuthenticateDefaultAction:", 0);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("shortcuts://automations"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDefaultActionURL:", v21);

    v16 = v6;
    goto LABEL_28;
  }
  v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)canRunAutomations
{
  void *v3;
  BOOL v4;

  -[WFTriggerBootManager bootUUIDFileURL](self, "bootUUIDFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "wf_fileExists"))
    v4 = -[WFTriggerBootManager triggerRunningTimeoutHasPassed](self, "triggerRunningTimeoutHasPassed");
  else
    v4 = 0;

  return v4;
}

- (BOOL)triggerRunningTimeoutHasPassed
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerBootManager runningThresholdDate](self, "runningThresholdDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "compare:", v3) + 1;
    v7 = v6 < 2;
    getWFTriggersLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[WFTriggerBootManager triggerRunningTimeoutHasPassed]";
      v12 = 1024;
      v13 = v6 < 2;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s Trigger running threshold has passed: %d", (uint8_t *)&v10, 0x12u);
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)runningThresholdDate
{
  void *v2;
  void *v3;

  -[WFTriggerBootManager firstUnlockDate](self, "firstUnlockDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", 120.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)willRunAutomations
{
  void *v3;
  id v4;

  v3 = (void *)objc_opt_class();
  -[WFTriggerBootManager notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearDeliveredNotificationsWithUserNotificationCenter:", v4);

}

- (void)deviceWasUnlockedForTheFirstTime
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD block[5];

  -[WFTriggerBootManager replaceNotificationContentWithUpdatedTitleIfNeeded](self, "replaceNotificationContentWithUpdatedTitleIfNeeded");
  -[WFTriggerBootManager createFirstUnlockTimeFile](self, "createFirstUnlockTimeFile");
  -[WFTriggerBootManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WFTriggerBootManager_deviceWasUnlockedForTheFirstTime__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

  v4 = (void *)objc_opt_class();
  -[WFTriggerBootManager notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:", v5, 1);

}

- (void)replaceNotificationContentWithUpdatedTitleIfNeeded
{
  void *v3;
  id v4;

  -[WFTriggerBootManager notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTriggerBootManager notificationContentForDeviceWithKnownUnlockedState:](self, "notificationContentForDeviceWithKnownUnlockedState:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", CFSTR("com.apple.siriactionsd.TriggersEnabledBootNotification"), v3, &__block_literal_global_185);

}

- (WFTriggerManager)triggerManager
{
  WFTriggerManager *triggerManager;
  void *v4;
  void *v5;
  id v6;
  WFTriggerManager *v7;
  WFTriggerManager *v8;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  triggerManager = self->_triggerManager;
  if (triggerManager)
    return triggerManager;
  -[WFTriggerBootManager databaseProvider](self, "databaseProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "databaseWithError:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v5)
  {
    v7 = (WFTriggerManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9EC0]), "initWithDatabase:", v5);
    v8 = self->_triggerManager;
    self->_triggerManager = v7;

    triggerManager = self->_triggerManager;
    return triggerManager;
  }
  getWFTriggersLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[WFTriggerBootManager triggerManager]";
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s WFTriggerBootManager could not create trigger manager due to no database", buf, 0xCu);
  }

  return (WFTriggerManager *)0;
}

- (void)configuredTriggersDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[WFTriggerBootManager enabledTriggers:](self, "enabledTriggers:", a3))
  {
    -[WFTriggerBootManager queue](self, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__WFTriggerBootManager_configuredTriggersDidChange___block_invoke;
    block[3] = &unk_1E7AA8300;
    block[4] = self;
    dispatch_async(v4, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerBootManager bootUUIDFileURL](self, "bootUUIDFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v7 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v10);
    v8 = v10;

    if ((v7 & 1) == 0)
    {
      getWFTriggerNotificationsLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFTriggerBootManager configuredTriggersDidChange:]";
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to remove file with error: %@", buf, 0x16u);
      }

    }
  }
}

- (BOOL)enabledTriggers:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "if_firstObjectPassingTest:", &__block_literal_global_188);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)lastKnownBootUUID
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WFTriggerBootManager bootUUIDFileURL](self, "bootUUIDFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v2, 4, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      getWFTriggersLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "-[WFTriggerBootManager lastKnownBootUUID]";
        v11 = 2112;
        v12 = v4;
        _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Could not get last logged boot data error: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)createOrUpdateBootTimeFileIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  char v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[WFTriggerBootManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  WFGetBootSessionUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerBootManager lastKnownBootUUID](self, "lastKnownBootUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerBootManager bootUUIDFileURL](self, "bootUUIDFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = 0;
    goto LABEL_17;
  }
  if (!v5)
    goto LABEL_13;
  v7 = v5;
  v8 = v4;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_9;
  }
  if (!v8)
  {

    goto LABEL_13;
  }
  v10 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v10)
  {
LABEL_9:
    getWFTriggerNotificationsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[WFTriggerBootManager createOrUpdateBootTimeFileIfNeeded]";
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s Already updated boot uuid not doing!", buf, 0xCu);
    }
    v11 = 0;
    goto LABEL_16;
  }
LABEL_13:
  v14 = 0;
  v13 = objc_msgSend(v4, "writeToURL:atomically:encoding:error:", v6, 1, 4, &v14);
  v11 = v14;
  if ((v13 & 1) == 0)
  {
    getWFTriggerNotificationsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFTriggerBootManager createOrUpdateBootTimeFileIfNeeded]";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to update boot time uuid file with error: %@", buf, 0x16u);
    }
LABEL_16:

  }
LABEL_17:

}

- (BOOL)createFirstUnlockTimeFile
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  getWFTriggerNotificationsLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[WFTriggerBootManager createFirstUnlockTimeFile]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating first unlock time", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerBootManager firstUnlockTimeURL](self, "firstUnlockTimeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    v8 = v7;
    if (v6)
    {
      v15 = v7;
      v9 = objc_msgSend(v6, "writeToURL:options:error:", v5, 0, &v15);
      v10 = v15;

      if ((v9 & 1) != 0)
      {
        v11 = 1;
        v8 = v10;
LABEL_15:

        goto LABEL_16;
      }
      v8 = v10;
    }
    else
    {
      getWFTriggersLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFTriggerBootManager createFirstUnlockTimeFile]";
        v19 = 2112;
        v20 = 0;
        _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to create first unlock date with error: %@", buf, 0x16u);
      }

    }
    getWFTriggerNotificationsLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFTriggerBootManager createFirstUnlockTimeFile]";
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_DEFAULT, "%s Could not create first unlock date file due to error: %@", buf, 0x16u);
    }

    v11 = 0;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (id)firstUnlockDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[WFTriggerBootManager firstUnlockTimeURL](self, "firstUnlockTimeURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 0, &v12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v12;
    if (v3)
    {
      v11 = v4;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;

      if (v5)
      {
        v7 = v5;
        v8 = v7;
      }
      else
      {
        getWFTriggersLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "-[WFTriggerBootManager firstUnlockDate]";
          v15 = 2112;
          v16 = v6;
          _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Could not unarchive first unlock date with error: %@", buf, 0x16u);
        }

        v7 = 0;
        v8 = 0;
      }
    }
    else
    {
      getWFTriggersLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[WFTriggerBootManager firstUnlockDate]";
        v15 = 2112;
        v16 = 0;
        _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Could not get first unlock time data with error: %@", buf, 0x16u);
      }
      v8 = 0;
      v6 = v4;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)bootUUIDFileURL
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D140A0], "sharedAppGroupDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR(".AutomationsEnabled"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315138;
      v8 = "-[WFTriggerBootManager bootUUIDFileURL]";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_FAULT, "%s Could not get automations enabled marker url due to no sharedAppGroupDirectoryURL.", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (id)firstUnlockTimeURL
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D140A0], "sharedAppGroupDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR(".FirstUnlock"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315138;
      v8 = "-[WFTriggerBootManager firstUnlockTimeURL]";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_FAULT, "%s Could not get first unlock time url due to no sharedAppGroupDirectoryURL.", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerBootManager.m"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  getWFTriggerNotificationsLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "actionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFTriggerBootManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s WFTriggerBootManager didReceiveNotificationResponse with action (%{public}@)", buf, 0x16u);

  }
  objc_msgSend(v10, "notification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "content");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "categoryIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DD9FE0]);

  if (v18)
  {
    objc_msgSend(v10, "actionIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v19, "isEqualToString:", *MEMORY[0x1E0CEC818]))
    {
      getWFTriggerNotificationsLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[WFTriggerBootManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
        _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEFAULT, "%s Automations enabled notification dismissed", buf, 0xCu);
      }
      goto LABEL_16;
    }
    if (-[NSObject isEqualToString:](v19, "isEqualToString:", CFSTR("disableAction")))
    {
      -[WFTriggerBootManager triggerManager](self, "triggerManager");
      v20 = objc_claimAutoreleasedReturnValue();
      -[NSObject disableAllTriggers](v20, "disableAllTriggers");
LABEL_16:

      goto LABEL_17;
    }
    getWFTriggersLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      goto LABEL_16;
    objc_msgSend(v10, "actionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v25 = "-[WFTriggerBootManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    v26 = 2114;
    v27 = v21;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_FAULT, "%s unexpected actionIdentifier (%{public}@) from notification reponse (%{public}@)", buf, 0x20u);
LABEL_15:

    goto LABEL_16;
  }
  getWFTriggersLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v10, "notification");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject request](v20, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFTriggerBootManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    v26 = 2112;
    v27 = v22;
    _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_FAULT, "%s Recieved response for unrecognized category: %@", buf, 0x16u);

    goto LABEL_15;
  }
LABEL_17:

  v11[2](v11);
}

- (void)setTriggerManager:(id)a3
{
  objc_storeStrong((id *)&self->_triggerManager, a3);
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
}

uint64_t __40__WFTriggerBootManager_enabledTriggers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

uint64_t __52__WFTriggerBootManager_configuredTriggersDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createOrUpdateBootTimeFileIfNeeded");
}

void __74__WFTriggerBootManager_replaceNotificationContentWithUpdatedTitleIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  getWFTriggersLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[WFTriggerBootManager replaceNotificationContentWithUpdatedTitleIfNeeded]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s Attempted to replace content for delivered or pending notification with error %@", (uint8_t *)&v4, 0x16u);
  }

}

void __56__WFTriggerBootManager_deviceWasUnlockedForTheFirstTime__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "triggerManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allConfiguredTriggers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "enabledTriggers:", v3))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastKnownBootUUIDDiffersFromCurrentBootUUID");

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "queue_postNotification");
  }
  else
  {

  }
}

uint64_t __75__WFTriggerBootManager_notificationContentForDeviceWithKnownUnlockedState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

uint64_t __96__WFTriggerBootManager_postNotificationWithUserNotificationCenterIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__WFTriggerBootManager_queue_postNotification__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    getWFTriggerNotificationsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[WFTriggerBootManager queue_postNotification]_block_invoke";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Failed to post notification with error: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke(uint64_t a1)
{
  NSObject *v2;
  WFXPCActivityScheduler *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFTriggerNotificationsLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Registering for initial boot notification", buf, 0xCu);
  }

  v3 = -[WFXPCActivityScheduler initWithActivityIdentifier:]([WFXPCActivityScheduler alloc], "initWithActivityIdentifier:", CFSTR("com.apple.siriactionsd.TriggersEnabledBootNotification"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_120;
  v4[3] = &unk_1E7AA83C0;
  v4[4] = *(_QWORD *)(a1 + 32);
  -[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:](v3, "scheduleWithCheckInHandler:runHandler:", &__block_literal_global_2444, v4);

}

uint64_t __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_120(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(_QWORD);
  void *v6;
  _xpc_activity_s *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_2;
  block[3] = &unk_1E7AA8300;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v8, block);

  LOBYTE(a1) = xpc_activity_set_state(v7, 5);
  if ((a1 & 1) == 0)
  {
    getWFTriggerNotificationsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:]_block_invoke";
      v14 = 2114;
      v15 = CFSTR("com.apple.siriactionsd.TriggersEnabledBootNotification");
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_FAULT, "%s Failed to set %{public}@ to DONE", buf, 0x16u);
    }

  }
  v5[2](v5);

  return 0;
}

void __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_116(int a1, xpc_activity_t activity)
{
  xpc_object_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = xpc_activity_copy_criteria(activity);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1C3BB01A4](v2);
    getWFTriggerNotificationsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:]_block_invoke";
      v10 = 2082;
      v11 = v4;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Criteria exists %{public}s, running activity and setting state to DONE", buf, 0x16u);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_118;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v4;
    v6 = (uint64_t)_Block_copy(aBlock);
    (*(void (**)(void))(v6 + 16))();
  }
  else
  {
    getWFTriggerNotificationsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:]_block_invoke_2";
      _os_log_impl(&dword_1C146A000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "%s Criteria does not exist not running activity.", buf, 0xCu);
    }
  }

}

void __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_118(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    free(v1);
}

void __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "bootUUIDFileURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "wf_fileExists") & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "lastKnownBootUUID"), (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(*(id *)(a1 + 32), "lastKnownBootUUIDDiffersFromCurrentBootUUID");

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "queue_postNotification");
  }
  else
  {

  }
}

+ (void)registerForNotificationRemovalWithUserNotificationCenter:(id)a3 scheduleIfNeeded:(BOOL)a4
{
  id v6;
  NSObject *v7;
  WFXPCActivityScheduler *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  getWFTriggersLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]";
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Registering for automation notification removal", buf, 0xCu);
  }

  v8 = -[WFXPCActivityScheduler initWithActivityIdentifier:]([WFXPCActivityScheduler alloc], "initWithActivityIdentifier:", CFSTR("com.apple.siriactionsd.TriggerLockscreenNotificationRemoval"));
  v12 = a1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke;
  v13[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  v14 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_130;
  v10[3] = &unk_1E7AA6730;
  v11 = v6;
  v9 = v6;
  -[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:](v8, "scheduleWithCheckInHandler:runHandler:", v13, v10);

}

+ (void)clearDeliveredNotificationsWithUserNotificationCenter:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  const __CFString *v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "+[WFTriggerBootManager clearDeliveredNotificationsWithUserNotificationCenter:]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Removing notification", buf, 0xCu);
  }

  v6 = CFSTR("com.apple.siriactionsd.TriggersEnabledBootNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDeliveredNotificationsWithIdentifiers:", v5);

}

+ (id)category
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CEC6D0]);
  v3 = (void *)objc_msgSend(v2, "initWithIdentifier:", *MEMORY[0x1E0DD9FE0]);
  v4 = (void *)MEMORY[0x1E0CEC700];
  WFLocalizedString(CFSTR("Disable All Automations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithIdentifier:title:options:icon:", CFSTR("disableAction"), v5, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActions:", v7);

  return v3;
}

void __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_object_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void (**v11)(_QWORD);
  _QWORD v12[5];
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = xpc_activity_copy_criteria(v3);
  v5 = v4;
  if (v4)
  {
    v6 = MEMORY[0x1C3BB01A4](v4);
    getWFTriggersLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]_block_invoke";
      v16 = 2082;
      v17 = v6;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Criteria exists %{public}s, doing nothing", buf, 0x16u);
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_126;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v6;
    v8 = (uint64_t)_Block_copy(aBlock);
    (*(void (**)(void))(v8 + 16))();
  }
  else if (*(_BYTE *)(a1 + 32))
  {
    v8 = (uint64_t)xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL((xpc_object_t)v8, (const char *)*MEMORY[0x1E0C80898], 0);
    xpc_dictionary_set_int64((xpc_object_t)v8, (const char *)*MEMORY[0x1E0C80760], 120);
    xpc_dictionary_set_string((xpc_object_t)v8, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    v9 = MEMORY[0x1C3BB01A4](v8);
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]_block_invoke_2";
      v16 = 2082;
      v17 = v9;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Creating new criteria: %{public}s", buf, 0x16u);
    }

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_128;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    v12[4] = v9;
    v11 = (void (**)(_QWORD))_Block_copy(v12);
    xpc_activity_set_criteria(v3, (xpc_object_t)v8);
    v11[2](v11);

  }
  else
  {
    getWFTriggersLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]_block_invoke_2";
      _os_log_impl(&dword_1C146A000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%s Criteria does not exist, doing nothing", buf, 0xCu);
    }
  }

}

uint64_t __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_130(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(_QWORD);
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Run handler called attempting to clear notification.", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "clearDeliveredNotificationsWithUserNotificationCenter:", *(_QWORD *)(a1 + 32));
  v4[2](v4);

  return 0;
}

void __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_126(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    free(v1);
}

void __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_128(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    free(v1);
}

@end
