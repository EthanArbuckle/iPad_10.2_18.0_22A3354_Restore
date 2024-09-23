@implementation HDSPUserNotificationCenter

- (HDSPUserNotificationCenter)initWithEnvironment:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  HDSPUserNotificationCenter *v8;

  v4 = (objc_class *)MEMORY[0x24BDF88B8];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:", *MEMORY[0x24BDD4608]);
  v8 = -[HDSPUserNotificationCenter initWithEnvironment:notificationCenter:](self, "initWithEnvironment:notificationCenter:", v5, v7);

  return v8;
}

- (HDSPUserNotificationCenter)initWithEnvironment:(id)a3 notificationCenter:(id)a4
{
  id v6;
  id v7;
  HDSPUserNotificationCenter *v8;
  HDSPUserNotificationCenter *v9;
  HDSPUserNotificationCenter *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPUserNotificationCenter;
  v8 = -[HDSPUserNotificationCenter init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_notificationCenter, a4);
    v10 = v9;
  }

  return v9;
}

- (void)environmentDidBecomeReady:(id)a3
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", (uint8_t *)&v5, 0xCu);

  }
}

- (void)publishNotificationForEvent:(id)a3
{
  void *v4;
  void *v5;

  -[HDSPUserNotificationCenter _notificationRequestForEvent:](self, "_notificationRequestForEvent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HDSPUserNotificationCenter _publishNotificationRequest:](self, "_publishNotificationRequest:", v4);
    v4 = v5;
  }

}

- (id)_notificationRequestForEvent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isAppleWatch"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEA95C0]);

  if ((v8 & 1) == 0)
  {
LABEL_5:
    -[HDSPUserNotificationCenter _notificationRequestIdentifierForEvent:](self, "_notificationRequestIdentifierForEvent:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPUserNotificationCenter _notificationContentForEventIdentifier:userInfo:](self, "_notificationContentForEventIdentifier:userInfo:", v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:destinations:", v10, v13, 0, 7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      HKSPLogForCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_opt_class();
        v20 = v19;
        objc_msgSend(v4, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v19;
        v24 = 2114;
        v25 = v21;
        _os_log_error_impl(&dword_21610C000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] unable to create notification content for event %{public}@", (uint8_t *)&v22, 0x16u);

      }
      v13 = 0;
    }
    else
    {
      HKSPLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_opt_class();
        v15 = v14;
        objc_msgSend(v4, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v14;
        v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_21610C000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] unable to create notification identifier for event %{public}@", (uint8_t *)&v22, 0x16u);

      }
    }
    v9 = 0;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)_publishNotificationRequest:(id)a3
{
  id v4;
  UNUserNotificationCenter *notificationCenter;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HDSPUserNotificationCenter__publishNotificationRequest___block_invoke;
  v7[3] = &unk_24D4E6298;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](notificationCenter, "addNotificationRequest:withCompletionHandler:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __58__HDSPUserNotificationCenter__publishNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 32);
      v13 = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v11;
      v17 = 2114;
      v18 = v3;
      v12 = v10;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to publish %{public}@ with error %{public}@", (uint8_t *)&v13, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      v8 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v8;
      v9 = v7;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] published %{public}@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(WeakRetained, "_submitAnalyticsForNotification:", *(_QWORD *)(a1 + 32));
  }

}

- (void)_submitAnalyticsForNotification:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "hksp_shouldSubmitAnalytics"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "analyticsManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "analyticsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v9, "hksp_analyticsSleepNotificationType");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA9850]), "initWithType:action:", v7, 0);
    objc_msgSend(v6, "trackEvent:", v8);

  }
}

- (void)tearDownNotificationForEventIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UNUserNotificationCenter *notificationCenter;
  _QWORD v17[4];
  id v18;
  HDSPUserNotificationCenter *v19;
  uint64_t v20;
  _QWORD v21[3];
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[5];
  _BYTE buf[24];
  void *v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    v6 = *(id *)&buf[4];
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearDownNotificationForEventIdentifier %{public}@", buf, 0x16u);

  }
  v25[0] = *MEMORY[0x24BEA95A8];
  v7 = *MEMORY[0x24BEA93C8];
  v24[0] = *MEMORY[0x24BEA9338];
  v24[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v8;
  v25[1] = *MEMORY[0x24BEA95E0];
  v23[0] = *MEMORY[0x24BEA97F0];
  v23[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf[8] = v9;
  v25[2] = *MEMORY[0x24BEA95B0];
  v22 = *MEMORY[0x24BEA9370];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf[16] = v10;
  v25[3] = *MEMORY[0x24BEA95D0];
  v11 = *MEMORY[0x24BEA9440];
  v21[0] = *MEMORY[0x24BEA9438];
  v21[1] = v11;
  v21[2] = *MEMORY[0x24BEA9750];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v12;
  v25[4] = *MEMORY[0x24BEA95C0];
  v20 = *MEMORY[0x24BEA9768];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v25, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    notificationCenter = self->_notificationCenter;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke;
    v17[3] = &unk_24D4E6328;
    v18 = v15;
    v19 = self;
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](notificationCenter, "getDeliveredNotificationsWithCompletionHandler:", v17);

  }
}

void __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke_2;
  v9[3] = &unk_24D4E62C0;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_filter:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v5;
    v8 = v7;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Tearing down %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeDeliveredNotificationsWithIdentifiers:", v5);

}

uint64_t __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "containsObject:", v5);

  return v6;
}

id __69__HDSPUserNotificationCenter_tearDownNotificationForEventIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)tearDownNotifications
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  __int128 buf;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v4 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Tearing down all notifications", (uint8_t *)&buf, 0xCu);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *MEMORY[0x24BEA95B0];
  *(_QWORD *)&buf = *MEMORY[0x24BEA95A8];
  *((_QWORD *)&buf + 1) = v5;
  v6 = *MEMORY[0x24BEA95E0];
  v18 = *MEMORY[0x24BEA95D0];
  v19 = v6;
  v20 = *MEMORY[0x24BEA95C0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &buf, 5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[HDSPUserNotificationCenter tearDownNotificationForEventIdentifier:](self, "tearDownNotificationForEventIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_notificationRequestIdentifierForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPUserNotificationCenter _notificationIdentifierPrefixForEventIdentifier:](self, "_notificationIdentifierPrefixForEventIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_class();
    objc_msgSend(v4, "dueDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_generateUniqueIdentifierForNotificationIdentifierPrefix:eventDate:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_notificationIdentifierPrefixForEventIdentifier:(id)a3
{
  id v3;
  id *v4;
  id v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEA95E0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEA95A8]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEA9348];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEA95B0]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEA9378];
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEA95D0]) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEA9788];
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEA95C0]))
    {
      v5 = 0;
      goto LABEL_5;
    }
    v4 = (id *)MEMORY[0x24BEA9770];
  }
  v5 = *v4;
LABEL_5:

  return v5;
}

+ (id)_generateUniqueIdentifierForNotificationIdentifierPrefix:(id)a3 eventDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_stringForEventDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("_%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_stringForEventDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_253DE8F58;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_253DE8F58, &__block_literal_global_194_2);
  objc_msgSend((id)_MergedGlobals_21, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50__HDSPUserNotificationCenter__stringForEventDate___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_MergedGlobals_21;
  _MergedGlobals_21 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_21;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  v4 = (void *)_MergedGlobals_21;
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  return objc_msgSend((id)_MergedGlobals_21, "setDateFormat:", CFSTR("yyyy-MM-dd_HH:mm"));
}

- (id)_notificationContentForEventIdentifier:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEA95E0]))
  {
    -[HDSPUserNotificationCenter _windDownReminderContent](self, "_windDownReminderContent");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEA95A8]))
  {
    -[HDSPUserNotificationCenter _bedtimeReminderContent](self, "_bedtimeReminderContent");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEA95B0]))
  {
    -[HDSPUserNotificationCenter _chargingReminderContentWithUserInfo:](self, "_chargingReminderContentWithUserInfo:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEA95D0]))
  {
    -[HDSPUserNotificationCenter _wakeUpResultsContentWithUserInfo:](self, "_wakeUpResultsContentWithUserInfo:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEA95C0]))
    {
      v10 = 0;
      goto LABEL_12;
    }
    -[HDSPUserNotificationCenter _wakeDetectionContentWithUserInfo:](self, "_wakeDetectionContentWithUserInfo:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  -[HDSPUserNotificationCenter _contentByAddingCommonUserInfoTo:](self, "_contentByAddingCommonUserInfoTo:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v10;
}

- (id)_contentByAddingCommonUserInfoTo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24D4FEF98, *MEMORY[0x24BDD46A8]);
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setUserInfo:", v7);

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (id)_bedtimeReminderContent
{
  void *v3;
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void (**v18)(void);
  void *v19;
  void *v20;

  v3 = (void *)MEMORY[0x24BDF8800];
  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v3, "hdsp_notificationContentWithEnvironment:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCategoryIdentifier:", *MEMORY[0x24BEA9338]);
  HDSPLocalizedString(CFSTR("BEDTIME_REMINDER_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  v8 = -[HDSPUserNotificationCenter _shouldPostCustomizeFocusNotification](self, "_shouldPostCustomizeFocusNotification");
  if (v8)
  {
    objc_msgSend(v6, "setCategoryIdentifier:", *MEMORY[0x24BEA93C8]);
    HDSPLocalizedString(CFSTR("SILENCE_NOTIFICATIONS_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v9);

    HKSPSleepFocusConfigurationURL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDefaultActionURL:", v10);

    v11 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v11, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAppleWatch");

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDF8850], "iconForApplicationIdentifier:", CFSTR("com.apple.Preferences"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIcon:", v14);

    }
  }
  -[HDSPUserNotificationCenter _localizedBedtimeOrWindDownReminderBodyWithKey:embeddingTimeForEvent:shouldIntroduceFocus:](self, "_localizedBedtimeOrWindDownReminderBodyWithKey:embeddingTimeForEvent:shouldIntroduceFocus:", CFSTR("BEDTIME_REMINDER_MESSAGE"), *MEMORY[0x24BEA95A0], v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBody:", v15);

  objc_msgSend(MEMORY[0x24BDF8870], "hdsp_bedtimeReminderSound");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSound:", v16);

  v17 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v17, "currentDateProvider");
  v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v18[2]();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateByAddingTimeInterval:", *MEMORY[0x24BEA97E0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v20);

  return v6;
}

- (id)_windDownReminderContent
{
  void *v3;
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void (**v18)(void);
  void *v19;
  void *v20;

  v3 = (void *)MEMORY[0x24BDF8800];
  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v3, "hdsp_notificationContentWithEnvironment:", WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCategoryIdentifier:", *MEMORY[0x24BEA97F0]);
  HDSPLocalizedString(CFSTR("WIND_DOWN_REMINDER_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  v8 = -[HDSPUserNotificationCenter _shouldPostCustomizeFocusNotification](self, "_shouldPostCustomizeFocusNotification");
  if (v8)
  {
    objc_msgSend(v6, "setCategoryIdentifier:", *MEMORY[0x24BEA93C8]);
    HDSPLocalizedString(CFSTR("SILENCE_NOTIFICATIONS_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v9);

    HKSPSleepFocusConfigurationURL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDefaultActionURL:", v10);

    v11 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v11, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAppleWatch");

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDF8850], "iconForApplicationIdentifier:", CFSTR("com.apple.Preferences"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIcon:", v14);

    }
  }
  -[HDSPUserNotificationCenter _windDownReminderBodyContentShouldIntroduceFocus:](self, "_windDownReminderBodyContentShouldIntroduceFocus:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBody:", v15);

  objc_msgSend(MEMORY[0x24BDF8870], "hdsp_bedtimeReminderSound");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSound:", v16);

  v17 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v17, "currentDateProvider");
  v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v18[2]();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateByAddingTimeInterval:", *MEMORY[0x24BEA97E0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpirationDate:", v20);

  return v6;
}

- (BOOL)_shouldPostCustomizeFocusNotification
{
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepScheduleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sleepEventRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isConsolidatedSleepCoachingOnboardingCompleted"))
  {
    objc_msgSend(v5, "sleepSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "scheduledSleepMode"))
    {
      v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v8 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v8, "sleepModeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sleepFocusModeBridge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    objc_msgSend(v10, "sleepFocusConfiguration:", &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v11)
    {
      if (objc_msgSend(v11, "hasSleepFocusMode"))
      {
        v13 = objc_msgSend(v11, "state") == 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      HKSPLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v20 = v16;
        v21 = 2114;
        v22 = v12;
        v17 = v16;
        _os_log_error_impl(&dword_21610C000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to fetch sleep focus configuration with error: %{public}@", buf, 0x16u);

      }
    }
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

- (id)_windDownReminderBodyContentShouldIntroduceFocus:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  _QWORD *v10;
  void *v11;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepEventRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isAnySleepCoachingOnboardingCompleted");
  if (v8)
    v9 = CFSTR("WIND_DOWN_REMINDER_MESSAGE");
  else
    v9 = CFSTR("WIND_DOWN_REMINDER_MESSAGE_PRE_ONBOARDING");
  v10 = (_QWORD *)MEMORY[0x24BEA95A0];
  if (!v8)
    v10 = (_QWORD *)MEMORY[0x24BEA95C8];
  -[HDSPUserNotificationCenter _localizedBedtimeOrWindDownReminderBodyWithKey:embeddingTimeForEvent:shouldIntroduceFocus:](self, "_localizedBedtimeOrWindDownReminderBodyWithKey:embeddingTimeForEvent:shouldIntroduceFocus:", v9, *v10, v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_localizedBedtimeOrWindDownReminderBodyWithKey:(id)a3 embeddingTimeForEvent:(id)a4 shouldIntroduceFocus:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEA95A0]) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEA95C8]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPUserNotificationCenter.m"), 338, CFSTR("This method can only be used to format localized strings containing bedtime or wakeUp times."));

    if (v5)
      goto LABEL_4;
LABEL_8:
    -[HDSPUserNotificationCenter _localizedBedtimeOrWindDownReminderBodyHelperWithKey:embeddingTimeForEvent:](self, "_localizedBedtimeOrWindDownReminderBodyHelperWithKey:embeddingTimeForEvent:", v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!v5)
    goto LABEL_8;
LABEL_4:
  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = (id)objc_opt_class();
    v12 = v18;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Preparing focus introduction notification", (uint8_t *)&v17, 0xCu);

  }
  HDSPLocalizedString(CFSTR("SLEEP_FOCUS_INTRO"));
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v15 = (void *)v13;

  return v15;
}

- (id)_localizedBedtimeOrWindDownReminderBodyHelperWithKey:(id)a3 embeddingTimeForEvent:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(void);
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSUInteger v25;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  __CFString *v32;
  NSObject *v33;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;
  NSRange v50;
  NSRange v51;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sleepScheduleModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v11, "currentDateProvider");
  v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v12[2]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "nextEventWithIdentifier:dueAfterDate:", v7, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v14, 0, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    v41 = v6;
    v16 = v6;
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hksp_dateRequiresSingularTimeString:", v14);

    v39 = v10;
    v40 = v7;
    if (v18)
    {
      objc_msgSend(v16, "stringByAppendingString:", CFSTR("_SINGULAR"));
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v19;
    }
    HDSPLocalizedString(v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v20, CFSTR("%@"), &v42, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v42;
    v23 = v22;
    if (v21)
    {
      v38 = v13;
      v24 = v22;
      v25 = objc_msgSend(v21, "localizedStandardRangeOfString:", v15);
      v27 = v26;
      v28 = objc_msgSend(v21, "localizedStandardRangeOfString:", CFSTR(".."));
      if (v27)
      {
        v30 = v29;
        if (v29)
        {
          v31 = v28;
          v50.location = v25;
          v50.length = v27;
          v51.location = v31;
          v51.length = v30;
          if (NSIntersectionRange(v50, v51).length)
            objc_msgSend(v21, "replaceCharactersInRange:withString:", v31, v30, CFSTR("."));
        }
      }
      v32 = (__CFString *)objc_msgSend(v21, "copy");
      v23 = v24;
      v13 = v38;
    }
    else
    {
      HKSPLogForCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v36 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v44 = v36;
        v45 = 2114;
        v46 = v20;
        v47 = 2114;
        v48 = v23;
        v37 = v36;
        _os_log_error_impl(&dword_21610C000, v33, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected format specifier in \"%{public}@\": %{public}@", buf, 0x20u);

      }
      v32 = &stru_24D4E68A0;
    }

    v7 = v40;
    v6 = v41;
    v10 = v39;
  }
  else
  {
    HKSPLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v44 = (id)objc_opt_class();
      v45 = 2114;
      v46 = v7;
      v47 = 2114;
      v48 = v6;
      v35 = v44;
      _os_log_error_impl(&dword_21610C000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find next event with identifier %{public}@ for message %{public}@", buf, 0x20u);

    }
    v32 = &stru_24D4E68A0;
  }

  return v32;
}

- (id)_chargingReminderContentWithUserInfo:(id)a3
{
  void *v4;
  HDSPEnvironment **p_environment;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x24BDF8800];
  p_environment = &self->_environment;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v4, "hdsp_notificationContentWithEnvironment:", WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCategoryIdentifier:", *MEMORY[0x24BEA9370]);
  HDSPLocalizedString(CFSTR("CHARGE_WATCH_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v9);

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEA9368]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BEA9380]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPUserNotificationCenter _chargingReminderBodyForAlarmEnabled:sleepTrackingEnabled:](self, "_chargingReminderBodyForAlarmEnabled:sleepTrackingEnabled:", v11, objc_msgSend(v12, "BOOLValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBody:", v13);

  objc_msgSend(MEMORY[0x24BDF8870], "hdsp_chargingReminderSound");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSound:", v14);

  return v8;
}

- (id)_chargingReminderBodyForAlarmEnabled:(BOOL)a3 sleepTrackingEnabled:(BOOL)a4
{
  const __CFString *v4;
  __CFString *v5;

  v4 = CFSTR("CHARGE_WATCH_NO_ALARM_OR_SLEEP_TRACKING_MESSAGE");
  if (a4)
    v4 = CFSTR("CHARGE_WATCH_SLEEP_TRACKING_MESSAGE");
  if (a3)
    v5 = CFSTR("CHARGE_WATCH_ALARM_MESSAGE");
  else
    v5 = (__CFString *)v4;
  HDSPLocalizedString(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_wakeDetectionContentWithUserInfo:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = *MEMORY[0x24BEA9778];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BEA9780]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = (void *)MEMORY[0x24BDF8800];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v10, "hdsp_notificationContentWithEnvironment:", WeakRetained);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setCategoryIdentifier:", *MEMORY[0x24BEA9768]);
  -[HDSPUserNotificationCenter _wakeDetectionAlertTitleForAlarmEnabled:sleepModeOn:](self, "_wakeDetectionAlertTitleForAlarmEnabled:sleepModeOn:", v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v13);

  -[HDSPUserNotificationCenter _wakeDetectionAlertBodyForAlarmEnabled:sleepModeOn:](self, "_wakeDetectionAlertBodyForAlarmEnabled:sleepModeOn:", v7, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBody:", v14);

  objc_msgSend(MEMORY[0x24BDF8870], "hdsp_wakeDetectionSound");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSound:", v15);

  objc_msgSend(v12, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v12, "setUserInfo:", v5);

  return v12;
}

- (id)_wakeDetectionAlertTitleForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  const __CFString *v4;
  __CFString *v5;
  NSObject *v6;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("EARLY_WAKEUP_TITLE_SLEEP_FOCUS");
  if (a3 && a4)
    v4 = CFSTR("EARLY_WAKEUP_TITLE_ALARM_AND_SLEEP_FOCUS");
  if (a4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("EARLY_WAKEUP_TITLE_ALARM");
  if (!a4 && !a3)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v8 = v10;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] posting wake detection notification with no user actions!", (uint8_t *)&v9, 0xCu);

    }
    v5 = CFSTR("EARLY_WAKEUP_TITLE_NONE");
  }
  HDSPLocalizedString(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_wakeDetectionAlertBodyForAlarmEnabled:(BOOL)a3 sleepModeOn:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  v4 = CFSTR("EARLY_WAKEUP_BODY_NONE");
  if (a3)
    v4 = CFSTR("EARLY_WAKEUP_BODY_ALARM");
  v5 = CFSTR("EARLY_WAKEUP_BODY_ALARM_AND_SLEEP_FOCUS");
  if (!a3)
    v5 = CFSTR("EARLY_WAKEUP_BODY_SLEEP_FOCUS");
  if (a4)
    v6 = (__CFString *)v5;
  else
    v6 = (__CFString *)v4;
  HDSPLocalizedString(v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_wakeUpResultsContentWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  HDSPWakeUpResultsNotificationLocalizer *v11;
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HDSPWakeUpResultsNotification wakeUpResultsNotificationFromUserInfo:](HDSPWakeUpResultsNotification, "wakeUpResultsNotificationFromUserInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = v8;
      objc_msgSend(v5, "categoryIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v8;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating content for %{public}@", (uint8_t *)&v25, 0x16u);

    }
    v11 = [HDSPWakeUpResultsNotificationLocalizer alloc];
    p_environment = &self->_environment;
    WeakRetained = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(WeakRetained, "healthStoreProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "healthStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HDSPWakeUpResultsNotificationLocalizer initWithNotification:healthStore:](v11, "initWithNotification:healthStore:", v5, v15);

    v16 = (void *)MEMORY[0x24BDF8800];
    v17 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v16, "hdsp_notificationContentWithEnvironment:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "categoryIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCategoryIdentifier:", v19);

    -[NSObject localizedTitle](v7, "localizedTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:", v20);

    -[NSObject localizedBody](v7, "localizedBody");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBody:", v21);

    objc_msgSend(MEMORY[0x24BDF8870], "hdsp_wakeUpResultsSound");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSound:", v22);

    objc_msgSend(v18, "setUserInfo:", v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v25 = 138543618;
      v26 = (id)objc_opt_class();
      v27 = 2112;
      v28 = v4;
      v24 = v26;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot create content for wake up results without valid data: %@", (uint8_t *)&v25, 0x16u);

    }
    v18 = 0;
  }

  return v18;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
