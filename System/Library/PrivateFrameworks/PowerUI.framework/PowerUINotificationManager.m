@implementation PowerUINotificationManager

- (PowerUINotificationManager)init
{
  PowerUINotificationManager *v2;
  os_log_t v3;
  OS_os_log *log;
  uint64_t v5;
  NSUserDefaults *defaults;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 immediateCharge;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  UNUserNotificationCenter *unCenter;
  UNUserNotificationCenter *v18;
  _QWORD v20[4];
  PowerUINotificationManager *v21;
  objc_super v22;
  uint8_t buf[4];
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)PowerUINotificationManager;
  v2 = -[PowerUINotificationManager init](&v22, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.powerui.smartcharging", "NotificationManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.powerui.notification"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.powerui.notificationmanager.queue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    -[NSUserDefaults objectForKey:](v2->_defaults, "objectForKey:", CFSTR("immediateCharge"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v2->_immediateCharge = objc_msgSend(v10, "BOOLValue");
      v12 = v2->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        immediateCharge = v2->_immediateCharge;
        *(_DWORD *)buf = 67109120;
        v24 = immediateCharge;
        _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Setting immediateCharge to %d", buf, 8u);
      }
    }
    v14 = v2->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v2->_immediateCharge;
      *(_DWORD *)buf = 67109120;
      v24 = v15;
      _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "ImmediateCharge %d", buf, 8u);
    }
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.powerui.smartcharging"));
    unCenter = v2->_unCenter;
    v2->_unCenter = (UNUserNotificationCenter *)v16;

    -[UNUserNotificationCenter setDelegate:](v2->_unCenter, "setDelegate:", v2);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_unCenter, "setWantsNotificationResponsesDelivered");
    v18 = v2->_unCenter;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __34__PowerUINotificationManager_init__block_invoke;
    v20[3] = &unk_24D3FB9D8;
    v21 = v2;
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](v18, "getDeliveredNotificationsWithCompletionHandler:", v20);

  }
  return v2;
}

void __34__PowerUINotificationManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v7), "request");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "content");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "categoryIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("fullChargeCategory"));

        if (v11)
        {
          objc_msgSend(v8, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

          if ((v13 & 1) == 0)
          {
            objc_msgSend(v8, "identifier");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = *(_QWORD *)(a1 + 32);
            v16 = *(void **)(v15 + 48);
            *(_QWORD *)(v15 + 48) = v14;

          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

- (id)currentOBCEngagedNotification
{
  dispatch_semaphore_t v3;
  UNUserNotificationCenter *unCenter;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v3 = dispatch_semaphore_create(0);
  unCenter = self->_unCenter;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __59__PowerUINotificationManager_currentOBCEngagedNotification__block_invoke;
  v13 = &unk_24D3FBA00;
  v15 = &v16;
  v5 = v3;
  v14 = v5;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](unCenter, "getDeliveredNotificationsWithCompletionHandler:", &v10);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    -[PowerUINotificationManager log](self, "log", v10, v11, v12, v13);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PowerUINotificationManager currentOBCEngagedNotification].cold.1();

    v8 = 0;
  }
  else
  {
    v8 = (id)v17[5];
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __59__PowerUINotificationManager_currentOBCEngagedNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v13 = a1;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "request");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "content");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "categoryIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", CFSTR("fullChargeCategory"));

        if (v12)
        {
          a1 = v13;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v13 + 40) + 8) + 40), v8);

          goto LABEL_11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      a1 = v13;
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_3);
  return (id)sharedInstance_instance;
}

void __44__PowerUINotificationManager_sharedInstance__block_invoke()
{
  PowerUINotificationManager *v0;
  void *v1;

  if (!sharedInstance_instance)
  {
    v0 = objc_alloc_init(PowerUINotificationManager);
    v1 = (void *)sharedInstance_instance;
    sharedInstance_instance = (uint64_t)v0;

  }
}

+ (id)fullChargeDeadlineStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = fullChargeDeadlineStringFromDate__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&fullChargeDeadlineStringFromDate__onceToken, &__block_literal_global_22);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)fullChargeDeadlineStringFromDate__formatter, "setLocale:", v5);

  objc_msgSend((id)fullChargeDeadlineStringFromDate__formatter, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__PowerUINotificationManager_fullChargeDeadlineStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)fullChargeDeadlineStringFromDate__formatter;
  fullChargeDeadlineStringFromDate__formatter = (uint64_t)v0;

  objc_msgSend((id)fullChargeDeadlineStringFromDate__formatter, "setDateStyle:", 0);
  return objc_msgSend((id)fullChargeDeadlineStringFromDate__formatter, "setTimeStyle:", 1);
}

- (void)updateOBCEngagedNotificationWithDate:(id)a3
{
  void *v4;
  void *v5;

  +[PowerUINotificationManager obcEngagedContentWithDeadline:toppingOff:](PowerUINotificationManager, "obcEngagedContentWithDeadline:toppingOff:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[UNUserNotificationCenter replaceContentForRequestWithIdentifier:replacementContent:completionHandler:](self->_unCenter, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", self->_lastScheduledFullChargeNotificationID, v4, 0);
    v4 = v5;
  }

}

- (id)postOBCEngagedNotificationWithDate:(id)a3
{
  void *v4;
  void *v5;

  +[PowerUINotificationManager obcEngagedRequestWithDeadline:isToppingOff:](PowerUINotificationManager, "obcEngagedRequestWithDeadline:isToppingOff:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v4, 0);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)postOBCEngagedTopOffNotificationWithDate:(id)a3
{
  void *v4;
  void *v5;

  +[PowerUINotificationManager obcEngagedRequestWithDeadline:isToppingOff:](PowerUINotificationManager, "obcEngagedRequestWithDeadline:isToppingOff:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v4, 0);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)postNotificationWithRequest:(id)a3
{
  id v4;
  UNUserNotificationCenter *unCenter;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  unCenter = self->_unCenter;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__PowerUINotificationManager_postNotificationWithRequest___block_invoke;
  v8[3] = &unk_24D3FBA68;
  v8[4] = &v9;
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](unCenter, "addNotificationRequest:withCompletionHandler:", v4, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __58__PowerUINotificationManager_postNotificationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (id)getDeliveredNotifications
{
  dispatch_semaphore_t v3;
  UNUserNotificationCenter *unCenter;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  v3 = dispatch_semaphore_create(0);
  unCenter = self->_unCenter;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__PowerUINotificationManager_getDeliveredNotifications__block_invoke;
  v9[3] = &unk_24D3FBA00;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](unCenter, "getDeliveredNotificationsWithCompletionHandler:", v9);
  v6 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(v5, v6) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_FAULT))
    -[PowerUINotificationManager getDeliveredNotifications].cold.1();
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__PowerUINotificationManager_getDeliveredNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)removeAllNotifications
{
  NSObject *log;
  UNUserNotificationCenter *unCenter;
  _QWORD v5[5];
  uint8_t buf[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Removing all notifications", buf, 2u);
  }
  unCenter = self->_unCenter;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__PowerUINotificationManager_removeAllNotifications__block_invoke;
  v5[3] = &unk_24D3FB9D8;
  v5[4] = self;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](unCenter, "getDeliveredNotificationsWithCompletionHandler:", v5);
  -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_unCenter, "removeAllDeliveredNotifications");
  -[PowerUINotificationManager resetAll](self, "resetAll");
}

void __52__PowerUINotificationManager_removeAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v10 = v8;
          objc_msgSend(v9, "request");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v12;
          _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "Removing notification %@", buf, 0xCu);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

}

+ (id)pausedNotificationContentFromDate:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  v6 = a3;
  +[PowerUINotificationManager fullChargeDeadlineStringFromDate:](PowerUINotificationManager, "fullChargeDeadlineStringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 32, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "hour") == 1)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = CFSTR("OBC_CHARGING_PAUSED_BODY_TIME_SINGULAR");
LABEL_8:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v11, &stru_24D3FD658, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v14, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (objc_msgSend(v9, "hour") != 13)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = CFSTR("OBC_CHARGING_PAUSED_BODY_TIME_PLURAL");
    goto LABEL_8;
  }
  v12 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "containsString:", CFSTR("H")) & 1) != 0
    || objc_msgSend(v14, "containsString:", CFSTR("k")))
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = CFSTR("OBC_CHARGING_PAUSED_BODY_TIME_PLURAL");
  }
  else
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = CFSTR("OBC_CHARGING_PAUSED_BODY_TIME_SINGULAR");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v16, &stru_24D3FD658, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v18, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\.\\.$"), CFSTR("."), 1024, 0, objc_msgSend(v17, "length"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)obcEngagedContentWithDeadline:(id)a3 toppingOff:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDF8800]);
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OBC_FEATURE_TITLE"), &stru_24D3FD658, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v9);

    +[PowerUINotificationManager pausedNotificationContentFromDate:bundle:](PowerUINotificationManager, "pausedNotificationContentFromDate:bundle:", v5, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBody:", v10);

    if (v4)
      v11 = CFSTR("chargingToFullCategory");
    else
      v11 = CFSTR("fullChargeCategory");
    objc_msgSend(v6, "setCategoryIdentifier:", v11);
    objc_msgSend(v6, "setShouldIgnoreDowntime:", 1);
    objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(v6, "setShouldHideDate:", 1);
    objc_msgSend(v6, "setShouldSuppressScreenLightUp:", 1);
    objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIcon:", v12);

    objc_msgSend(v6, "setExpirationDate:", v5);
    v13 = v6;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)obcEngagedRequestWithDeadline:(id)a3 isToppingOff:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[PowerUINotificationManager obcEngagedContentWithDeadline:toppingOff:](PowerUINotificationManager, "obcEngagedContentWithDeadline:toppingOff:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("chargingRequest-%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v7, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDestinations:", 2);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)resetAll
{
  NSString *lastScheduledFullChargeNotificationID;

  self->_immediateCharge = 0;
  lastScheduledFullChargeNotificationID = self->_lastScheduledFullChargeNotificationID;
  self->_lastScheduledFullChargeNotificationID = 0;

  -[NSUserDefaults removeObjectForKey:](self->_defaults, "removeObjectForKey:", CFSTR("immediateCharge"));
}

+ (id)chargeLimitRecommendationContentWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CHARGE_LIMIT_FEATURE_TITLE"), &stru_24D3FD658, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(v6, "setCategoryIdentifier:", CFSTR("chargeRecommendationCategory"));
  objc_msgSend(v6, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v6, "setShouldHideDate:", 1);
  objc_msgSend(v6, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v8);

  objc_msgSend(v6, "setShouldBackgroundDefaultAction:", 1);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=BATTERY_USAGE&path=CHARGING_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultActionURL:", v9);

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 172800.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v10);

  v11 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLocale:", v12);

  objc_msgSend(v11, "setNumberStyle:", 3);
  objc_msgSend(v11, "setMaximumFractionDigits:", 0);
  objc_msgSend(v11, "setMultiplier:", &unk_24D443588);
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CHARGE_LIMIT_RECOMMENDATION"), &stru_24D3FD658, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromNumber:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBody:", v17);

  return v6;
}

+ (id)chargeLimitRecommendationRequestWithLimit:(unint64_t)a3
{
  void *v3;
  void *v4;

  +[PowerUINotificationManager chargeLimitRecommendationContentWithLimit:](PowerUINotificationManager, "chargeLimitRecommendationContentWithLimit:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("recommendedLimitRequest"), v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDestinations:", 2);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)postChargeLimitRecommendationWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[PowerUINotificationManager chargeLimitRecommendationRequestWithLimit:](PowerUINotificationManager, "chargeLimitRecommendationRequestWithLimit:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v4, 0);
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)postCECEngagedNotificationWithDate:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v17[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Posting CEC Engaged notification", v17, 2u);
  }
  +[PowerUISmartChargeUtilities roundedDateFromDate:](PowerUISmartChargeUtilities, "roundedDateFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDF8800]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CEC_FEATURE_TITLE"), &stru_24D3FD658, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v10);

  +[PowerUINotificationManager pausedNotificationContentFromDate:bundle:](PowerUINotificationManager, "pausedNotificationContentFromDate:bundle:", v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBody:", v11);

  objc_msgSend(v7, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v7, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v7, "setShouldHideDate:", 1);
  objc_msgSend(v7, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("cecEngagedCategory"));
  objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIcon:", v12);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=BATTERY_USAGE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultActionURL:", v13);

  objc_msgSend(v7, "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);
  objc_msgSend(v7, "setExpirationDate:", v6);
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("cec-pausedCharging"), v7, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDestinations:", 2);
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v14, 0);
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)postCECFirstTimeNotification
{
  NSObject *log;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Posting First time notification", buf, 2u);
  }
  v4 = objc_alloc_init(MEMORY[0x24BDF8800]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CEC_FEATURE_TITLE"), &stru_24D3FD658, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v7);

  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CEC_FEATURE_FIRST_TIME"), &stru_24D3FD658, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v8);

  objc_msgSend(v4, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v4, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v4, "setShouldHideDate:", 1);
  objc_msgSend(v4, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=BATTERY_USAGE&path=BATTERY_HEALTH"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultActionURL:", v9);

  objc_msgSend(v4, "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);
  objc_msgSend(v4, "setCategoryIdentifier:", CFSTR("cecFirstTimeCategory"));
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 28800.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpirationDate:", v10);

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("cec-FirstTime-%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v13, v4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDestinations:", 2);
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v14, 0);
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)removeCECPausedNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Timeout waiting for delivered notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __57__PowerUINotificationManager_removeCECPausedNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v23;
    *(_QWORD *)&v4 = 138412290;
    v20 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "request", v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "content");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "categoryIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", CFSTR("cecEngagedCategory"));

        if (v12)
        {
          v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = v13;
            objc_msgSend(v8, "request");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v27 = v16;
            _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "Removing notification %@", buf, 0xCu);

          }
          v17 = *(void **)(a1 + 40);
          objc_msgSend(v8, "request");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v19);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)removeCECNotifications
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Timeout waiting for delivered notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __52__PowerUINotificationManager_removeCECNotifications__block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a2;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v27)
  {
    v4 = *(_QWORD *)v29;
    v5 = CFSTR("cecEngagedCategory");
    *(_QWORD *)&v3 = 138412290;
    v23 = v3;
    v24 = *(_QWORD *)v29;
    v25 = a1;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v29 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v7, "request", v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "content");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "categoryIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v5))
        {

        }
        else
        {
          objc_msgSend(v7, "request");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "content");
          v12 = v5;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "categoryIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", CFSTR("cecFirstTimeCategory"));

          v5 = v12;
          v4 = v24;
          a1 = v25;

          if (!v15)
            continue;
        }
        v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          objc_msgSend(v7, "request");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v23;
          v33 = v19;
          _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "Removing notification %@", buf, 0xCu);

        }
        v20 = *(void **)(a1 + 40);
        objc_msgSend(v7, "request");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v22);

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v27);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *log;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 immediateCharge;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v12 = log;
    objc_msgSend(v9, "actionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v13;
    _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_INFO, "notification request coming in: %@", (uint8_t *)&v21, 0xCu);

  }
  objc_msgSend(v9, "actionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("fullCharge"));

  if (v15)
  {
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "User requested immediate charge.", (uint8_t *)&v21, 2u);
    }
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      immediateCharge = self->_immediateCharge;
      v21 = 67109120;
      LODWORD(v22) = immediateCharge;
      _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "ImmediateCharge %d", (uint8_t *)&v21, 8u);
    }
    self->_immediateCharge = 1;
    -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, CFSTR("immediateCharge"));
  }
  -[PowerUINotificationManager handleLocationFailures:](self, "handleLocationFailures:", v9);
  +[PowerUICECManager manager](PowerUICECManager, "manager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleNotificationResponse:", v9);

  +[PowerUISmartChargeManager manager](PowerUISmartChargeManager, "manager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleNotificationResponse:", v9);

  v10[2](v10);
}

- (BOOL)internalCECNotificationsDisabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.powerui.cec"));
  objc_msgSend(v2, "objectForKey:", CFSTR("testDisableInternalNotifications"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (void)postInternalCECNotificationForChargingDates:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  PowerUINotificationManager *v29;
  id v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[PowerUINotificationManager internalCECNotificationsDisabled](self, "internalCECNotificationsDisabled")
    && objc_msgSend(v4, "count"))
  {
    v29 = self;
    v5 = objc_alloc_init(MEMORY[0x24BDF8800]);
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", CFSTR("[CEC INTERNAL]"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v5;
    objc_msgSend(v5, "setTitle:", v6);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v30 = v4;
    obj = v4;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v35)
    {
      v9 = 0;
      v33 = *(_QWORD *)v37;
      v10 = CFSTR("Cleaner Electricity windows: ");
      do
      {
        v11 = 0;
        v31 = v9;
        v32 = v9 + 1;
        v12 = v8;
        do
        {
          if (*(_QWORD *)v37 != v33)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
          objc_msgSend(v13, "timeIntervalSinceDate:", v12);
          if (v14 > 900.0 || v32 + v11 == objc_msgSend(obj, "count"))
          {
            objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v7, 0, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)MEMORY[0x24BDD1500];
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v12, 900.0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "localizedStringFromDate:dateStyle:timeStyle:", v17, 0, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v15, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v10, v19);
            v20 = objc_claimAutoreleasedReturnValue();

            v21 = v13;
            v10 = (__CFString *)v20;
            v7 = v21;
          }
          v8 = v13;

          ++v11;
          v12 = v8;
        }
        while (v35 != v11);
        v9 = v35 + v31;
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v35);
    }
    else
    {
      v10 = CFSTR("Cleaner Electricity windows: ");
    }

    objc_msgSend(v28, "setBody:", v10);
    objc_msgSend(MEMORY[0x24BDF8850], "iconNamed:", CFSTR("leaf.circle@2x"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setIcon:", v22);

    v23 = (void *)MEMORY[0x24BDF8850];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pathForResource:ofType:", CFSTR("leaf.circle@2x"), CFSTR("png"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "iconAtPath:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setIcon:", v26);

    objc_msgSend(v28, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(v28, "setCategoryIdentifier:", CFSTR("cecEngagedCategory"));
    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("emissionChargingDates"), v28, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](v29->_unCenter, "addNotificationRequest:withCompletionHandler:", v27, 0);

    v4 = v30;
  }

}

- (id)postInternalCECNotificationWithID:(id)a3 chargingStatus:(BOOL)a4 information:(id)a5 shouldReplace:(BOOL)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  if (-[PowerUINotificationManager internalCECNotificationsDisabled](self, "internalCECNotificationsDisabled"))
  {
    v12 = 0;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BDF8800]);
    v14 = CFSTR("Charging On Hold");
    if (v8)
      v14 = CFSTR("Charging Now");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("[CEC Internal]"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBody:", v11);
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v16);

    objc_msgSend(MEMORY[0x24BDF8850], "iconNamed:", CFSTR("leaf.circle@2x"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIcon:", v17);

    v18 = (void *)MEMORY[0x24BDF8850];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "pathForResource:ofType:", CFSTR("leaf.circle@2x"), CFSTR("png"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "iconAtPath:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIcon:", v21);

    objc_msgSend(v13, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(v13, "setCategoryIdentifier:", CFSTR("cecEngagedCategory"));
    if (v8)
      objc_msgSend(v13, "setAccessoryImageName:", CFSTR("bolt.fill"));
    if (!a6)
    {
      v22 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("%@-%@"), v10, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v24;
    }
    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", v10, v13, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v25, 0);
    objc_msgSend(v25, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)contentForInternalDurationPredictionWithDuration:(double)a3 withConfidence:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *log;
  void *v13;
  double v14;
  double v15;
  const __CFString *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v8, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[Internal]\nPredicted to be plugged in for %d hours and %d minutes - plugout at %@ with confidence %.2f"), ((int)a3 / 3600), (int)(((__int16)((34953 * ((int)a3 % 3600)) >> 16) >> 5)+ ((((int)a3 % 3600 + ((-30583 * ((int)a3 % 3600)) >> 16)) & 0x8000) >> 15)), v9, *(_QWORD *)&a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities batteryLevelHistogramAroundTime:withDelta:withOffset:](PowerUISmartChargeUtilities, "batteryLevelHistogramAroundTime:withDelta:withOffset:", 0, 7200.0, 7200.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v11;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Histogram at plugin: %@", buf, 0xCu);
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24D4435A0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  if (v15 <= 0.1)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", &unk_24D4435B8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    if (v19 <= 0.4)
      goto LABEL_8;
    v16 = CFSTR("\nThis could be treated as a long charge.");
  }
  else
  {
    v16 = CFSTR("\nThis could be treated as an emergency charge.");
  }
  objc_msgSend(v10, "stringByAppendingString:", v16);
  v20 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v20;
LABEL_8:
  v21 = CFSTR("Medium Length Charge Session Predicted");
  if (a3 > 19800.0)
    v21 = CFSTR("Long Charge Session Predicted");
  if (a3 < 5400.0)
    v21 = CFSTR("Short Charge Session Predicted");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBody:", v10);
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v23);

  objc_msgSend(v7, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v7, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v7, "setShouldHideDate:", 0);
  objc_msgSend(v7, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(v7, "setCategoryIdentifier:", CFSTR("chargingIntelligence"));
  objc_msgSend(v7, "setExpirationDate:", v8);
  objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIcon:", v24);

  return v7;
}

- (void)postInternalChargeDurationNotificationWithDuration:(double)a3 withConfidence:(double)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PowerUINotificationManager contentForInternalDurationPredictionWithDuration:withConfidence:](self, "contentForInternalDurationPredictionWithDuration:withConfidence:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("charging-intelligence-notification"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PowerUINotificationManager cancelNotificationRequestWithIdentifier:](self, "cancelNotificationRequestWithIdentifier:", CFSTR("charging-intelligence-notification"));
      -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v6, 0);
    }

    v5 = v7;
  }

}

- (id)postInternalChargingIntelligenceNotificationWithChargingStatus:(BOOL)a3 information:(id)a4 url:(id)a5 validUntil:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  -[PowerUINotificationManager cancelNotificationRequestWithIdentifier:](self, "cancelNotificationRequestWithIdentifier:", CFSTR("charging-intelligence-notification"));
  v12 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), CFSTR("[Charging Intelligence Internal]"), &stru_24D3FD658);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBody:", v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v14);

  objc_msgSend(v12, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v12, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v12, "setShouldHideDate:", 0);
  objc_msgSend(v12, "setShouldSuppressScreenLightUp:", 1);
  objc_msgSend(v12, "setCategoryIdentifier:", CFSTR("chargingIntelligence"));
  objc_msgSend(v12, "setExpirationDate:", v10);

  objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIcon:", v15);

  if (v9)
    objc_msgSend(v12, "setDefaultActionURL:", v9);
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("charging-intelligence-notification"), v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v16, 0);
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)handleLocationFailures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *log;
  const __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  _QWORD v20[9];
  char v21;
  uint8_t buf[4];
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "notification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.powerui.note.location"));

  if (!v8)
    goto LABEL_10;
  objc_msgSend(v4, "actionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("yesAction")))
  {

LABEL_5:
    objc_msgSend(v4, "actionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("noAction"));

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v15 = &stru_24D3FD658;
      if (v13)
        v15 = CFSTR(" not");
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_INFO, "User has%@ charged here before.", buf, 0xCu);
    }
    v20[5] = MEMORY[0x24BDAC760];
    v20[6] = 3221225472;
    v20[7] = __53__PowerUINotificationManager_handleLocationFailures___block_invoke;
    v20[8] = &__block_descriptor_33_e19___NSDictionary_8__0l;
    v21 = v13;
    AnalyticsSendEventLazy();
    goto LABEL_10;
  }
  objc_msgSend(v4, "actionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("noAction"));

  if (v11)
    goto LABEL_5;
  objc_msgSend(v4, "actionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("poweruiTTR"));

  if (v17)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUINotificationManager ttrURLforLocationFailure](self, "ttrURLforLocationFailure");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __53__PowerUINotificationManager_handleLocationFailures___block_invoke_2;
    v20[3] = &unk_24D3FBAD8;
    v20[4] = self;
    objc_msgSend(v18, "openURL:configuration:completionHandler:", v19, 0, v20);

  }
LABEL_10:

}

id __53__PowerUINotificationManager_handleLocationFailures___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("Correct");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __53__PowerUINotificationManager_handleLocationFailures___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__PowerUINotificationManager_handleLocationFailures___block_invoke_2_cold_1((uint64_t)v6, v7);
  }

}

- (id)ttrURLforLocationFailure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *log;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tap-to-radar://new?Title=OBC Location Error&Classification=Serious Bug&ComponentID=971083&ComponentName=PowerUI&ComponentVersion=all&Reproducible=Sometimes&Description=If you have charged here in the past, could you describe how recently and general frequency of charge sessions that are at least one hour long?"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "TTR URL is %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (void)postInternalLocationFailureNotification
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(v6, "setTitle:", CFSTR("Have you charged here in the last month?"));
  objc_msgSend(v6, "setBody:", CFSTR("Help your fellow engineers! Please long-press this notification and consider filing a radar (or select 'Yes') if you've charged at this (physical) location in the last month for at least an hour, or 'No' if this is the first time or you typically charge here very briefly."));
  objc_msgSend(v6, "setShouldIgnoreDowntime:", 1);
  objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v6, "setShouldHideDate:", 0);
  objc_msgSend(v6, "setShouldSuppressScreenLightUp:", 0);
  objc_msgSend(v6, "setCategoryIdentifier:", CFSTR("yesNoCategory"));
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 28800.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v3);

  objc_msgSend(MEMORY[0x24BDF8850], "iconForSystemImageNamed:", CFSTR("bolt.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v4);

  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:", CFSTR("com.apple.powerui.note.location"), v6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_unCenter, "addNotificationRequest:withCompletionHandler:", v5, 0);

}

- (void)cancelNotificationRequestWithIdentifier:(id)a3
{
  UNUserNotificationCenter *unCenter;
  void *v5;
  id v6;
  void *v7;
  UNUserNotificationCenter *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  unCenter = self->_unCenter;
  v11[0] = a3;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](unCenter, "removeDeliveredNotificationsWithIdentifiers:", v7);

  v8 = self->_unCenter;
  v10 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:](v8, "removePendingNotificationRequestsWithIdentifiers:", v9);

}

- (BOOL)immediateCharge
{
  return self->_immediateCharge;
}

- (void)setImmediateCharge:(BOOL)a3
{
  self->_immediateCharge = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (UNUserNotificationCenter)unCenter
{
  return self->_unCenter;
}

- (void)setUnCenter:(id)a3
{
  objc_storeStrong((id *)&self->_unCenter, a3);
}

- (NSString)lastScheduledFullChargeNotificationID
{
  return self->_lastScheduledFullChargeNotificationID;
}

- (void)setLastScheduledFullChargeNotificationID:(id)a3
{
  objc_storeStrong((id *)&self->_lastScheduledFullChargeNotificationID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScheduledFullChargeNotificationID, 0);
  objc_storeStrong((id *)&self->_unCenter, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)currentOBCEngagedNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "UIKit Error: Timeout on delivered notifications", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)getDeliveredNotifications
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_215A71000, v0, OS_LOG_TYPE_FAULT, "Error: Timeout occurred to obtain delivered notifications", v1, 2u);
  OUTLINED_FUNCTION_6_0();
}

void __53__PowerUINotificationManager_handleLocationFailures___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215A71000, a2, OS_LOG_TYPE_ERROR, "Error when opening TTR URL: %@", (uint8_t *)&v2, 0xCu);
}

@end
