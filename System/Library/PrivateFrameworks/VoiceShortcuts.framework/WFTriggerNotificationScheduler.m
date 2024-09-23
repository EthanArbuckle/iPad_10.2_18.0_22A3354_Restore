@implementation WFTriggerNotificationScheduler

- (WFTriggerNotificationScheduler)initWithUserNotificationManager:(id)a3 databaseProvider:(id)a4
{
  id v7;
  id v8;
  WFTriggerNotificationScheduler *v9;
  WFTriggerNotificationScheduler *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  WFTriggerNotificationScheduler *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFTriggerNotificationScheduler;
  v9 = -[WFTriggerNotificationScheduler init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userNotificationManager, a3);
    objc_storeStrong((id *)&v10->_databaseProvider, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.siriactionsd.WFTriggerNotificationScheduler", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)scheduleTriggerForNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WFTriggerNotificationScheduler *v9;

  v4 = a3;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__WFTriggerNotificationScheduler_scheduleTriggerForNotifications___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)registerWithDatabaseProvider:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WFTriggerNotificationScheduler *v9;

  v4 = a3;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__WFTriggerNotificationScheduler_registerWithDatabaseProvider___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)registerConfiguredTrigger:(id)a3 delay:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  WFXPCActivityScheduler *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.siriactionsd.TriggerNotification.%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  getWFTriggerNotificationsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]";
    v21 = 1024;
    v22 = objc_msgSend(v7, "intValue");
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Registering trigger - creating activity with delay: %i for identifier: %{public}@", buf, 0x1Cu);
  }

  v12 = -[WFXPCActivityScheduler initWithActivityIdentifier:]([WFXPCActivityScheduler alloc], "initWithActivityIdentifier:", v10);
  v16 = v6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke;
  v17[3] = &unk_1E7AA5A78;
  v18 = v7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_119;
  v15[3] = &unk_1E7AA6D08;
  v15[4] = self;
  v13 = v6;
  v14 = v7;
  -[WFXPCActivityScheduler scheduleWithCheckInHandler:runHandler:](v12, "scheduleWithCheckInHandler:runHandler:", v17, v15);

}

- (void)postBackgroundRunningNotificationForTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  int v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  getWFTriggerNotificationsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Posting background notification", buf, 0xCu);
  }

  -[WFTriggerNotificationScheduler databaseProvider](self, "databaseProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  objc_msgSend(v7, "databaseWithError:", &v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v39;

  if (v8)
  {
    if ((int)objc_msgSend(v4, "notificationLevel") < 3)
    {
      v12 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "triggerRunEventsInTheLastWeek");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "descriptors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "if_compactMap:", &__block_literal_global_80);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setByAddingObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_2;
      v37[3] = &unk_1E7AA5AE0;
      v19 = v8;
      v38 = v19;
      objc_msgSend(v18, "if_compactMap:", v37);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "count"))
      {
        -[WFTriggerNotificationScheduler cancelAllActivitiesFromTriggers:](self, "cancelAllActivitiesFromTriggers:", v21);
        v22 = os_transaction_create();
        WFTriggerIDsToDisableNotificationUserInfoFromTriggers();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTriggerNotificationScheduler userNotificationManager](self, "userNotificationManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v9;
        objc_msgSend(v24, "postBackgroundRunningNotificationWithConfiguredTriggers:userInfo:error:", v21, v23, &v36);
        v31 = v36;

        v25 = MEMORY[0x1E0C809B0];
        v26 = -[WFTriggerNotificationScheduler updateTriggerNotificationLevels:database:](self, "updateTriggerNotificationLevels:database:", v21, v19);
        v34[0] = v25;
        v34[1] = 3221225472;
        v34[2] = __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_125;
        v34[3] = &unk_1E7AA5B08;
        v35 = v19;
        objc_msgSend(v21, "if_compactMap:", v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        getWFTriggerNotificationsLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
        if (v26 > 2)
        {
          if (v29)
          {
            *(_DWORD *)buf = 136315138;
            v41 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
            _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_DEFAULT, "%s Level is at WFTriggerNotificationLevelNever not rescheduling triggers", buf, 0xCu);
          }

        }
        else
        {
          if (v29)
          {
            WFReadableTriggerNotificationLevel();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v41 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
            v42 = 2112;
            v43 = v30;
            _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_DEFAULT, "%s Re-registering triggers to level: %@", buf, 0x16u);

            v25 = MEMORY[0x1E0C809B0];
          }

          v32[0] = v25;
          v32[1] = 3221225472;
          v32[2] = __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_127;
          v32[3] = &unk_1E7AA5B30;
          v32[4] = self;
          v33 = v26;
          objc_msgSend(v27, "enumerateObjectsUsingBlock:", v32);
        }

        v9 = v31;
      }
      else
      {
        getWFTriggerNotificationsLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
          _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to post background running notification due to no configured triggers being recently ran", buf, 0xCu);
        }
        v27 = v21;
      }

    }
    else
    {
      getWFTriggerNotificationsLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Attempted to post background running notification but trigger was in WFTriggerNotificationLevelNever, cancelling all activities", buf, 0xCu);
      }

      -[WFTriggerNotificationScheduler cancelActivitiesFromTrigger:](self, "cancelActivitiesFromTrigger:", v4);
    }
  }
  else
  {
    getWFTriggerNotificationsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]";
      v42 = 2114;
      v43 = v9;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to post background notification because database is not available: %{public}@", buf, 0x16u);
    }

  }
}

- (int)updateTriggerNotificationLevels:(id)a3 database:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__WFTriggerNotificationScheduler_updateTriggerNotificationLevels_database___block_invoke;
  v18[3] = &unk_1E7AA6420;
  v18[4] = &v19;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v18);
  getWFTriggerNotificationsLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    WFReadableTriggerNotificationLevel();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v24 = "-[WFTriggerNotificationScheduler updateTriggerNotificationLevels:database:]";
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Updating scheduled trigger notifications for runs in the last 7 days to level: %@", buf, 0x16u);

  }
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __75__WFTriggerNotificationScheduler_updateTriggerNotificationLevels_database___block_invoke_129;
  v15[3] = &unk_1E7AA5B58;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9EC0]), "initWithDatabase:", v7);
  v16 = v12;
  v17 = &v19;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
  v13 = *((_DWORD *)v20 + 6);

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (void)cancelAllActivitiesFromTriggers:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];

  v4 = a3;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__WFTriggerNotificationScheduler_cancelAllActivitiesFromTriggers___block_invoke;
  v6[3] = &unk_1E7AA5A30;
  v6[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

- (void)cancelActivitiesFromTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.siriactionsd.TriggerNotification.%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  xpc_activity_unregister((const char *)objc_msgSend(v8, "UTF8String"));

}

- (void)cancelActivitiesFromTriggerIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WFTriggerNotificationScheduler_cancelActivitiesFromTriggerIdentifier___block_invoke;
  block[3] = &unk_1E7AA8300;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (id)initialRunDateForConfiguredTrigger:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFTriggerNotificationScheduler databaseProvider](self, "databaseProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v6, "databaseWithError:", &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;

  if (!v7)
  {
    getWFTriggerNotificationsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFTriggerNotificationScheduler initialRunDateForConfiguredTrigger:]";
      v23 = 2114;
      v24 = v8;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to get initial run date for configured trigger because database is not available: %{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedRunEventsForTriggerID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = objc_claimAutoreleasedReturnValue();

  getWFTriggerNotificationsLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFTriggerNotificationScheduler initialRunDateForConfiguredTrigger:]";
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s No run events found for trigger with id: %@", buf, 0x16u);

    }
    v12 = 0;
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject date](v12, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[WFTriggerNotificationScheduler initialRunDateForConfiguredTrigger:]";
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s initial run event date for trigger: %@ - %@", buf, 0x20u);

  }
  -[NSObject date](v12, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v17;
}

- (void)migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFTriggerNotificationScheduler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "BOOLForKey:", CFSTR("WFTriggerNotificationLevelMigrationPerformed"));
    getWFTriggerNotificationsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[WFTriggerNotificationScheduler migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:]";
        v11 = "%s Migration has already occured not doing anything.";
        v12 = v9;
        v13 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl(&dword_1C146A000, v12, v13, v11, buf, 0xCu);
      }
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315138;
        v20 = "-[WFTriggerNotificationScheduler migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:]";
        _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s Migrating old triggers.", buf, 0xCu);
      }

      objc_msgSend(v4, "allConfiguredTriggers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "descriptors");
      v9 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9EC0]), "initWithDatabase:", v4);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __95__WFTriggerNotificationScheduler_migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase___block_invoke;
      v17[3] = &unk_1E7AA5A30;
      v18 = v15;
      v16 = v15;
      -[NSObject enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", v17);
      objc_msgSend(v7, "setBool:forKey:", 1, CFSTR("WFTriggerNotificationLevelMigrationPerformed"));

    }
  }
  else
  {
    getWFTriggerNotificationsLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFTriggerNotificationScheduler migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:]";
      v11 = "%s Could not get system shortcut user defaults not migrating.";
      v12 = v9;
      v13 = OS_LOG_TYPE_ERROR;
      goto LABEL_7;
    }
  }

}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (WFTriggerUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

void __95__WFTriggerNotificationScheduler_migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v6 = 0;
  v3 = objc_msgSend(v2, "updateNotificationLevel:forConfiguredTrigger:error:", 2, a2, &v6);
  v4 = v6;
  if ((v3 & 1) == 0)
  {
    getWFTriggerNotificationsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[WFTriggerNotificationScheduler migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:]_block_invoke";
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Could not migrate trigger to WFTriggerNotificationLevelMonth with error: %{public}@", buf, 0x16u);
    }

  }
}

void __72__WFTriggerNotificationScheduler_cancelActivitiesFromTriggerIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  id v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.siriactionsd.TriggerNotification.%@"), *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggerNotificationsLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "-[WFTriggerNotificationScheduler cancelActivitiesFromTriggerIdentifier:]_block_invoke";
    v6 = 2114;
    v7 = v1;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Unregistering trigger notification activities for identifier: %{public}@", buf, 0x16u);
  }

  v3 = objc_retainAutorelease(v1);
  xpc_activity_unregister((const char *)objc_msgSend(v3, "UTF8String"));

}

uint64_t __66__WFTriggerNotificationScheduler_cancelAllActivitiesFromTriggers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelActivitiesFromTrigger:", a2);
}

void __75__WFTriggerNotificationScheduler_updateTriggerNotificationLevels_database___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  int v4;
  int v5;
  id v6;

  v6 = a2;
  if (!objc_msgSend(v6, "shouldPrompt") || (objc_msgSend(v6, "shouldNotify") & 1) == 0)
  {
    v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v4 = objc_msgSend(v6, "notificationLevel");
    if (v3 <= v4 + 1)
      v5 = v4 + 1;
    else
      v5 = v3;
    if (v5 >= 3)
      v5 = 3;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  }

}

void __75__WFTriggerNotificationScheduler_updateTriggerNotificationLevels_database___block_invoke_129(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = 0;
  v5 = objc_msgSend(v3, "updateNotificationLevel:forConfiguredTrigger:error:", v4, a2, &v9);
  v6 = v9;
  if ((v5 & 1) == 0)
  {
    getWFTriggerNotificationsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      WFReadableTriggerNotificationLevel();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v11 = "-[WFTriggerNotificationScheduler updateTriggerNotificationLevels:database:]_block_invoke";
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Could not increment trigger to level: %@ due to error: %@", buf, 0x20u);

    }
  }

}

uint64_t __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "configuredTriggerForTriggerID:", a2);
}

id __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_125(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuredTriggerForTriggerID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "initialRunDateForConfiguredTrigger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WFTimeIntervalForNotificationLevelFromDate(*(_DWORD *)(a1 + 40), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "registerConfiguredTrigger:delay:", v3, v5);

  }
  else
  {
    getWFTriggerNotificationsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[WFTriggerNotificationScheduler postBackgroundRunningNotificationForTrigger:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Skipping rescheduling of trigger due to initial run date not being found", (uint8_t *)&v7, 0xCu);
    }

  }
}

uint64_t __78__WFTriggerNotificationScheduler_postBackgroundRunningNotificationForTrigger___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "triggerID");
}

void __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_object_t v4;
  xpc_object_t v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t *v12;
  NSObject *v13;
  void (**v14)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), void *);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[6];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E0C80760], (int)objc_msgSend(*(id *)(a1 + 32), "intValue"));
  v5 = xpc_activity_copy_criteria(v3);
  v6 = v5;
  if (v5)
  {
    v7 = xpc_equal(v5, v4);
    v8 = MEMORY[0x1C3BB01A4](v6);
    v9 = MEMORY[0x1C3BB01A4](v4);
    getWFTriggerNotificationsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]_block_invoke";
        v31 = 2082;
        v32 = v8;
        v33 = 2082;
        v34 = v9;
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Criteria exists %{public}s and it is equal to new criteria: %{public}s doing nothing", buf, 0x20u);
      }

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_115;
      v28[3] = &__block_descriptor_48_e5_v8__0l;
      v28[4] = v8;
      v28[5] = v9;
      v12 = v28;
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315650;
        v30 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]_block_invoke_2";
        v31 = 2082;
        v32 = v8;
        v33 = 2082;
        v34 = v9;
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Criteria exists %{public}s but it is NOT equal: %{public}s setting", buf, 0x20u);
      }

      xpc_activity_set_criteria(v3, v4);
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_117;
      v25 = &__block_descriptor_48_e5_v8__0l;
      v26 = v8;
      v27 = v9;
      v12 = &v22;
    }
    v14 = (void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t), void *))_Block_copy(v12);
    v14[2](v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);

  }
  else
  {
    getWFTriggerNotificationsLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]_block_invoke_2";
      _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_DEFAULT, "%s Criteria does not exist, setting a new one", buf, 0xCu);
    }

    xpc_activity_set_criteria(v3, v4);
  }

}

uint64_t __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_119(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_2;
  block[3] = &unk_1E7AA8110;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v4;
  v8 = v4;
  dispatch_async(v5, block);

  return 0;
}

uint64_t __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFTriggerNotificationsLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "-[WFTriggerNotificationScheduler registerConfiguredTrigger:delay:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Registering triggers - Run handler called: %@", (uint8_t *)&v5, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "postBackgroundRunningNotificationForTrigger:", *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_115(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
    free(v2);
  v3 = *(void **)(a1 + 40);
  if (v3)
    free(v3);
}

void __66__WFTriggerNotificationScheduler_registerConfiguredTrigger_delay___block_invoke_117(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
    free(v2);
  v3 = *(void **)(a1 + 40);
  if (v3)
    free(v3);
}

void __63__WFTriggerNotificationScheduler_registerWithDatabaseProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v2, "databaseWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:", v3);
    objc_msgSend(v3, "allConfiguredTriggersNeedingRunningNotifications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptors");
    v6 = objc_claimAutoreleasedReturnValue();

    getWFTriggerNotificationsLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFTriggerNotificationScheduler registerWithDatabaseProvider:]_block_invoke";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Possibly registering triggers: %@", buf, 0x16u);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__WFTriggerNotificationScheduler_registerWithDatabaseProvider___block_invoke_113;
    v8[3] = &unk_1E7AA5A30;
    v8[4] = *(_QWORD *)(a1 + 40);
    -[NSObject enumerateObjectsUsingBlock:](v6, "enumerateObjectsUsingBlock:", v8);
  }
  else
  {
    getWFTriggerNotificationsLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFTriggerNotificationScheduler registerWithDatabaseProvider:]_block_invoke";
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to schedule trigger notifications because database is not available: %{public}@", buf, 0x16u);
    }
  }

}

void __63__WFTriggerNotificationScheduler_registerWithDatabaseProvider___block_invoke_113(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "initialRunDateForConfiguredTrigger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggerNotificationsLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[WFTriggerNotificationScheduler registerWithDatabaseProvider:]_block_invoke";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Registering triggers with initial run date - %@", (uint8_t *)&v7, 0x16u);
    }

    WFTimeIntervalForNotificationLevelFromDate(objc_msgSend(v3, "notificationLevel"), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "registerConfiguredTrigger:delay:", v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[WFTriggerNotificationScheduler registerWithDatabaseProvider:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_ERROR, "%s Skipping scheduling of trigger due to initial run date not being found", (uint8_t *)&v7, 0xCu);
  }

}

void __66__WFTriggerNotificationScheduler_scheduleTriggerForNotifications___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)objc_msgSend(*(id *)(a1 + 32), "notificationLevel") < 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "databaseProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    objc_msgSend(v3, "databaseWithError:", &v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v6;

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "migrateAllTriggersCreatedBeforeBackgroundRunningWithDatabase:", v4);
      WFTimeIntervalForNotificationLevel(objc_msgSend(*(id *)(a1 + 32), "notificationLevel"));
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "registerConfiguredTrigger:delay:", *(_QWORD *)(a1 + 32), v5);
    }
    else
    {
      getWFTriggerNotificationsLogObject();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v8 = "-[WFTriggerNotificationScheduler scheduleTriggerForNotifications:]_block_invoke";
        v9 = 2114;
        v10 = v2;
        _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Failed to schedule trigger notifications because database is not available: %{public}@", buf, 0x16u);
      }
    }

  }
  else
  {
    getWFTriggerNotificationsLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[WFTriggerNotificationScheduler scheduleTriggerForNotifications:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_ERROR, "%s Attempted to schedule trigger that was already in WFTriggerNotificationLevelNever state", buf, 0xCu);
    }
  }

}

+ (BOOL)shortenTimeIntervalsForTesting
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0DDA040]))
    v3 = VCIsInternalBuild();
  else
    v3 = 0;

  return v3;
}

@end
