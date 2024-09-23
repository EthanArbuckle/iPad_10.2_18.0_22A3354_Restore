@implementation WFTriggerEventQueue

- (WFTriggerEventQueue)initWithDatabaseProvider:(id)a3 notificationManager:(id)a4 notificationScheduler:(id)a5 triggerBootManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFTriggerEventQueue *v15;
  WFTriggerEventQueue *v16;
  WFTriggerEventQueue *v17;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEventQueue.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

  }
  v15 = -[WFTriggerEventQueue initWithDatabaseProvider:notificationManager:notificationScheduler:](self, "initWithDatabaseProvider:notificationManager:notificationScheduler:", v11, v12, v13);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_triggerBootManager, a6);
    v17 = v16;
  }

  return v16;
}

- (WFTriggerEventQueue)initWithDatabaseProvider:(id)a3 notificationManager:(id)a4 notificationScheduler:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFTriggerEventQueue *v13;
  WFTriggerEventQueue *v14;
  WFTriggerEventRunner *v15;
  WFTriggerEventRunner *triggerEventRunner;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  WFTriggerEventQueue *v21;
  void *v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerEventQueue.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

  }
  v24.receiver = self;
  v24.super_class = (Class)WFTriggerEventQueue;
  v13 = -[WFTriggerEventQueue init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_databaseProvider, a3);
    objc_storeStrong((id *)&v14->_notificationManager, a4);
    objc_storeStrong((id *)&v14->_notificationScheduler, a5);
    -[WFTriggerUserNotificationManager setDelegate:](v14->_notificationManager, "setDelegate:", v14);
    v15 = -[WFTriggerEventRunner initWithDatabaseProvider:delegate:]([WFTriggerEventRunner alloc], "initWithDatabaseProvider:delegate:", v10, v14);
    triggerEventRunner = v14->_triggerEventRunner;
    v14->_triggerEventRunner = v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = dispatch_queue_create("com.apple.siriactionsd.WFTriggerEventQueue", v18);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v19;

    v21 = v14;
  }

  return v14;
}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  -[WFTriggerEventQueue queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__WFTriggerEventQueue_resume__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)resumeWithConfiguredTrigger:(id)a3 workflowReference:(id)a4 eventInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFTriggerEventQueue queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  getWFTriggersLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFTriggerEventQueue resumeWithConfiguredTrigger:workflowReference:eventInfo:]";
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s 🤖 Resuming trigger with id: %{public}@", buf, 0x16u);

  }
  -[WFTriggerEventQueue triggerEventRunner](self, "triggerEventRunner");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workflowID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isRunningWorkflowWithIdentifier:", v15))
  {

  }
  else
  {
    -[WFTriggerEventQueue triggerBootManager](self, "triggerBootManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "canRunAutomations");

    if ((v17 & 1) != 0)
    {
      -[WFTriggerEventQueue runWithConfiguredTrigger:workflowReference:eventInfo:](self, "runWithConfiguredTrigger:workflowReference:eventInfo:", v8, v9, v10);
      goto LABEL_14;
    }
  }
  getWFTriggersLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "workflowID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFTriggerEventQueue resumeWithConfiguredTrigger:workflowReference:eventInfo:]";
    v26 = 2114;
    v27 = v19;
    _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_DEFAULT, "%s 🤖 Persisting to database because triggerEventRunner is running workflow with id: %{public}@", buf, 0x16u);

  }
  v23 = 0;
  -[WFTriggerEventQueue triggerEventForConfiguredTrigger:eventInfo:confirmed:error:](self, "triggerEventForConfiguredTrigger:eventInfo:confirmed:error:", v8, v10, 1, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v23;

  if (!v20)
  {
    getWFTriggersLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "-[WFTriggerEventQueue resumeWithConfiguredTrigger:workflowReference:eventInfo:]";
      v26 = 2112;
      v27 = v8;
      v28 = 2114;
      v29 = v21;
      _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to create trigger events for trigger %@: %{public}@", buf, 0x20u);
    }

  }
LABEL_14:

}

- (void)runWithConfiguredTrigger:(id)a3 workflowReference:(id)a4 eventInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFTriggerEventQueue queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[WFTriggerEventQueue triggerBootManager](self, "triggerBootManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "willRunAutomations");

  -[WFTriggerEventQueue triggerEventRunner](self, "triggerEventRunner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workflowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isRunningWorkflowWithIdentifier:", v14);

  if (v15)
  {
    getWFTriggersLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v8, "workflowID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFTriggerEventQueue runWithConfiguredTrigger:workflowReference:eventInfo:]";
      v30 = 2114;
      v31 = v17;
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_FAULT, "%s Attempted to run trigger while triggerEventRunner is running with workflow id: %{public}@.", buf, 0x16u);

    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v8, "shouldPrompt") & 1) != 0)
    goto LABEL_16;
  objc_msgSend(v8, "trigger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend((id)objc_opt_class(), "isAllowedToRunAutomatically");

  if (!v19)
    goto LABEL_16;
  if ((objc_msgSend(v8, "shouldNotify") & 1) != 0
    || (objc_msgSend(v8, "trigger"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend((id)objc_opt_class(), "requiresNotification"),
        v20,
        v21))
  {
    -[WFTriggerEventQueue notificationManager](self, "notificationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v23 = objc_msgSend(v22, "postNotificationOfType:forTrigger:workflowReference:removeDeliveredNotifications:pendingTriggerEventIDs:actionIcons:error:", 1, v8, v9, 1, 0, 0, &v27);
    v24 = v27;

    if ((v23 & 1) == 0)
    {
      getWFTriggersLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[WFTriggerEventQueue runWithConfiguredTrigger:workflowReference:eventInfo:]";
        v30 = 2114;
        v31 = v24;
        _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_ERROR, "%s Failed to post notification alert due to error: %{public}@", buf, 0x16u);
      }

      goto LABEL_18;
    }
  }
  else
  {
    if ((int)objc_msgSend(v8, "notificationLevel") > 2)
      goto LABEL_16;
    -[WFTriggerEventQueue notificationScheduler](self, "notificationScheduler");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scheduleTriggerForNotifications:", v8);
  }

LABEL_16:
  -[WFTriggerEventQueue triggerEventRunner](self, "triggerEventRunner");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "startRunningWorkflow:forTrigger:eventInfo:", v9, v8, v10);

  if (_os_feature_enabled_impl())
    -[WFTriggerEventQueue deactivateEphemeralTriggerIfNeeded:completion:](self, "deactivateEphemeralTriggerIfNeeded:completion:", v8, &__block_literal_global_3167);
LABEL_18:

}

- (void)enqueueTriggerWithIdentifier:(id)a3 eventInfo:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[WFTriggerEventQueue queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__WFTriggerEventQueue_enqueueTriggerWithIdentifier_eventInfo_force_completion___block_invoke;
  v16[3] = &unk_1E7AA7558;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v10;
  v14 = v11;
  v15 = v9;
  dispatch_async(v12, v16);

}

- (id)databaseWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  -[WFTriggerEventQueue queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFTriggerEventQueue databaseProvider](self, "databaseProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseWithError:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)numberOfEventsInQueueWithConfirmationOnly:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = a3;
  -[WFTriggerEventQueue queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedTriggerEventsWithConfirmationOnly:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (BOOL)deleteTriggerEvent:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFTriggerEventQueue queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v16 = 0;
  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v8)
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFTriggerEventQueue deleteTriggerEvent:error:]";
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Removing trigger event with identifier: %{public}@", buf, 0x16u);

    }
    v12 = objc_msgSend(v8, "deleteReference:error:", v6, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v9, CFSTR("Unable to load database"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a4)
      *a4 = objc_retainAutorelease(v13);

    v12 = 0;
  }

  return v12;
}

- (id)nextTriggerEventWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;

  -[WFTriggerEventQueue queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v14 = 0;
  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v7, CFSTR("Unable to load database"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v11 = objc_retainAutorelease(v11);
      v12 = 0;
      *a3 = v11;
      goto LABEL_8;
    }
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "sortedTriggerEventsWithConfirmationOnly:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = 0;
    goto LABEL_7;
  }
  v11 = v10;
  v12 = v11;
LABEL_8:

  return v12;
}

- (id)configuredTriggerForIdentifier:(id)a3 workflowReference:(id *)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  v8 = a3;
  -[WFTriggerEventQueue queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v26 = 0;
  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v26;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v11, CFSTR("Unable to load database"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    if (a5)
    {
      v13 = objc_retainAutorelease(v17);
      v16 = 0;
      *a5 = v13;
      goto LABEL_19;
    }
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v10, "configuredTriggerForTriggerID:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 6003, CFSTR("Could not find trigger with identifier: %@"), v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a5)
      *a5 = objc_retainAutorelease(v18);

    v13 = 0;
    goto LABEL_18;
  }
  v13 = v12;
  objc_msgSend(v12, "workflowID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 6001, CFSTR("Missing workflow identifier for trigger with identifier: %@"), v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a5)
      *a5 = objc_retainAutorelease(v20);
    goto LABEL_17;
  }
  if (a4)
  {
    objc_msgSend(v13, "workflowID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "referenceForWorkflowID:", v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    if (!*a4)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v13, "workflowID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "vc_voiceShortcutErrorWithCode:reason:", 6001, CFSTR("Couldn't find workflow (%@) for trigger with identifier: %@"), v21, v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (a5)
        *a5 = objc_retainAutorelease(v23);

LABEL_17:
      goto LABEL_18;
    }
  }
  v13 = v13;
  v16 = v13;
LABEL_19:

  return v16;
}

- (id)triggerEventForConfiguredTrigger:(id)a3 eventInfo:(id)a4 confirmed:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[WFTriggerEventQueue queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  getWFTriggersLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[WFTriggerEventQueue triggerEventForConfiguredTrigger:eventInfo:confirmed:error:]";
    _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_DEFAULT, "%s 🤖 Attempting to create trigger events for configured trigger", buf, 0xCu);
  }

  v22 = 0;
  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v15, CFSTR("Unable to load database"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    if (a6)
    {
      v16 = objc_retainAutorelease(v20);
      v19 = 0;
      *a6 = v16;
      goto LABEL_9;
    }
LABEL_8:
    v19 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v10, "trigger");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_8;
  WFSerializedTriggerEventInfo(v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createTriggerEventWithTriggerID:eventInfo:confirmed:error:", v18, v17, v7, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v19;
}

- (void)setConfirmedForTriggerEventIDs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFTriggerEventQueue queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  getWFTriggersLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[WFTriggerEventQueue setConfirmedForTriggerEventIDs:error:]";
    v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEBUG, "%s Attempting to mark trigger events as confirmed with ids: %{public}@", buf, 0x16u);
  }

  v28 = 0;
  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  if (v9)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
    if (v12)
    {
      v13 = v12;
      v21 = v10;
      v22 = v6;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v23 = 0;
          objc_msgSend(v9, "setConfirmedForTriggerEventWithIdentifier:error:", v16, &v23, v21, v22);
          v17 = v23;
          if (v17)
          {
            v18 = v17;
            getWFTriggersLogObject();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v30 = "-[WFTriggerEventQueue setConfirmedForTriggerEventIDs:error:]";
              v31 = 2114;
              v32 = v16;
              v33 = 2114;
              v34 = v18;
              _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_ERROR, "%s Failed to set confirmed for trigger with eventID: %{public}@ error: %{public}@", buf, 0x20u);
            }

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      }
      while (v13);
      v10 = v21;
      v6 = v22;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:reason:", 1004, v10, CFSTR("Unable to load database"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
    if (a4)
    {
      v11 = objc_retainAutorelease(v20);
      *a4 = v11;
    }
  }

}

- (void)removePendingTriggerEventsWithEventIDs:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  const char *v22;
  uint32_t v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFTriggerEventQueue queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  getWFTriggersLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[WFTriggerEventQueue removePendingTriggerEventsWithEventIDs:]";
    v34 = 2114;
    v35 = v4;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEBUG, "%s Attempting to remove pending trigger events with identifiers %{public}@", buf, 0x16u);
  }

  v31 = 0;
  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  if (v7)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = v4;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v10)
    {
      v11 = v10;
      v24 = v8;
      v25 = v4;
      v12 = *(_QWORD *)v28;
      while (1)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AA8]), "initWithIdentifier:objectType:", v14, 4);
          v26 = 0;
          v16 = objc_msgSend(v7, "deleteReference:error:", v15, &v26);
          v17 = v26;
          getWFTriggersLogObject();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if ((v16 & 1) != 0)
          {
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              goto LABEL_15;
            *(_DWORD *)buf = 136315394;
            v33 = "-[WFTriggerEventQueue removePendingTriggerEventsWithEventIDs:]";
            v34 = 2114;
            v35 = v14;
            v20 = v19;
            v21 = OS_LOG_TYPE_DEBUG;
            v22 = "%s Successfully deleted trigger event with identifier: %{public}@";
            v23 = 22;
          }
          else
          {
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              goto LABEL_15;
            *(_DWORD *)buf = 136315650;
            v33 = "-[WFTriggerEventQueue removePendingTriggerEventsWithEventIDs:]";
            v34 = 2114;
            v35 = v14;
            v36 = 2114;
            v37 = v17;
            v20 = v19;
            v21 = OS_LOG_TYPE_ERROR;
            v22 = "%s Failed to delete trigger event with identifier: %{public}@ with error: %{public}@";
            v23 = 32;
          }
          _os_log_impl(&dword_1C146A000, v20, v21, v22, buf, v23);
LABEL_15:

        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        if (!v11)
        {
          v8 = v24;
          v4 = v25;
          break;
        }
      }
    }
  }
  else
  {
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFTriggerEventQueue removePendingTriggerEventsWithEventIDs:]";
      v34 = 2114;
      v35 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Unable to load database: %{public}@", buf, 0x16u);
    }
  }

}

- (BOOL)shouldRunEmailOrMessageTrigger:(id)a3 forEvent:(id)a4 runEvents:(id)a5 error:(id *)a6
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[WFTriggerEventQueue queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[WFTriggerEventQueue numberOfEventsInQueueWithConfirmationOnly:](self, "numberOfEventsInQueueWithConfirmationOnly:", 0) < 0xC9)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("NewValue"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ((unint64_t)-[NSObject count](v9, "count") < 0xB)
      {
        v11 = 1;
        goto LABEL_14;
      }
      getWFTriggersLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = 136315138;
        v14 = "-[WFTriggerEventQueue shouldRunEmailOrMessageTrigger:forEvent:runEvents:error:]";
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_INFO, "%s Trigger contains more than 10 emails or messages, not running trigger", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {

      getWFTriggersLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v13 = 136315138;
        v14 = "-[WFTriggerEventQueue shouldRunEmailOrMessageTrigger:forEvent:runEvents:error:]";
        _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_INFO, "%s Could not cast eventInfo to NSArray", (uint8_t *)&v13, 0xCu);
      }
      v9 = 0;
    }

  }
  else
  {
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 136315138;
      v14 = "-[WFTriggerEventQueue shouldRunEmailOrMessageTrigger:forEvent:runEvents:error:]";
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s Queue has more than 50 events, not running trigger", (uint8_t *)&v13, 0xCu);
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFTriggerEventQueue *v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFTriggersLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[WFTriggerEventQueue handleRemovedIgnoredNotifications:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEBUG, "%s Removing all trigger events", buf, 0xCu);
  }

  -[WFTriggerEventQueue queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__WFTriggerEventQueue_handleRemovedIgnoredNotifications___block_invoke;
  v8[3] = &unk_1E7AA8138;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)removeAllStaleTriggerEventsIgnoringValidIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  NSObject *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFTriggerEventQueue queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v34 = 0;
  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v34);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v34;
  v8 = v7;
  if (v6)
  {
    v27 = v7;
    v28 = v6;
    objc_msgSend(v6, "sortedTriggerEventsWithConfirmationOnly:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v10;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (!v12)
      goto LABEL_21;
    v13 = v12;
    v14 = *(_QWORD *)v31;
    while (1)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "containsObject:", v17) & 1) != 0)
        {

LABEL_15:
          getWFTriggersLogObject();
          v22 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          objc_msgSend(v16, "identifier");
          v23 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v37 = "-[WFTriggerEventQueue removeAllStaleTriggerEventsIgnoringValidIDs:]";
          v38 = 2114;
          v39 = v23;
          v24 = v22;
          v25 = OS_LOG_TYPE_DEFAULT;
          v26 = "%s Trigger event is valid with id: %{public}@";
LABEL_17:
          _os_log_impl(&dword_1C146A000, v24, v25, v26, buf, 0x16u);
          goto LABEL_18;
        }
        v18 = -[WFTriggerEventQueue isTriggerEventStale:](self, "isTriggerEventStale:", v16);

        if (!v18)
          goto LABEL_15;
        getWFTriggersLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "identifier");
          v20 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v37 = "-[WFTriggerEventQueue removeAllStaleTriggerEventsIgnoringValidIDs:]";
          v38 = 2114;
          v39 = v20;
          _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, "%s Removing stale trigger event with id: %{public}@", buf, 0x16u);

        }
        v29 = 0;
        v21 = -[WFTriggerEventQueue deleteTriggerEvent:error:](self, "deleteTriggerEvent:error:", v16, &v29);
        v22 = v29;
        if (!v21)
        {
          getWFTriggersLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v37 = "-[WFTriggerEventQueue removeAllStaleTriggerEventsIgnoringValidIDs:]";
            v38 = 2114;
            v39 = v22;
            v24 = v23;
            v25 = OS_LOG_TYPE_ERROR;
            v26 = "%s Could not delete trigger notification with error %{public}@";
            goto LABEL_17;
          }
LABEL_18:

        }
LABEL_19:

      }
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (!v13)
      {
LABEL_21:

        v8 = v27;
        v6 = v28;
        goto LABEL_24;
      }
    }
  }
  getWFTriggersLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFTriggerEventQueue removeAllStaleTriggerEventsIgnoringValidIDs:]";
    v38 = 2114;
    v39 = v8;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_ERROR, "%s Unable to load database: %{public}@", buf, 0x16u);
  }
LABEL_24:

}

- (BOOL)isTriggerEventStale:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v7, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "day") > 6;
  return (char)v7;
}

- (void)disableTriggersWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFTriggerEventQueue queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v9 = 0;
  -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v6)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9EC0]), "initWithDatabase:", v6);
    -[NSObject disableTriggersWithIdentifiers:](v8, "disableTriggersWithIdentifiers:", v4);
  }
  else
  {
    getWFTriggersLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFTriggerEventQueue disableTriggersWithIdentifiers:]";
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to load database: %{public}@", buf, 0x16u);
    }
  }

}

- (void)notificationManager:(id)a3 receivedConfirmationToRunTriggerWithIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id *v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  WFTriggerEventQueue *v21;
  id v22;
  _QWORD block[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = objc_msgSend(v10, "count");
    -[WFTriggerEventQueue queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke_156;
      v20 = &unk_1E7AA8138;
      v21 = self;
      v14 = &v22;
      v22 = v11;
      dispatch_async(v13, &v17);

      -[WFTriggerEventQueue resume](self, "resume", v17, v18, v19, v20, v21);
LABEL_10:

      goto LABEL_11;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke_2;
    block[3] = &unk_1E7AA8138;
    block[4] = self;
    v14 = &v24;
    v24 = v9;
    v16 = block;
LABEL_9:
    dispatch_async(v13, v16);

    goto LABEL_10;
  }
  getWFTriggersLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[WFTriggerEventQueue notificationManager:receivedConfirmationToRunTriggerWithIdentifier:pendingTriggerEventIDs:]";
    _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEBUG, "%s Failed to run trigger because recieved confirmation with no trigger identifier", buf, 0xCu);
  }

  if (objc_msgSend(v11, "count"))
  {
    -[WFTriggerEventQueue queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke;
    v25[3] = &unk_1E7AA8138;
    v25[4] = self;
    v14 = &v26;
    v26 = v11;
    v16 = v25;
    goto LABEL_9;
  }
LABEL_11:

}

- (void)notificationManager:(id)a3 didDismissTriggerWithIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  getWFTriggersLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFTriggerEventQueue notificationManager:didDismissTriggerWithIdentifier:pendingTriggerEventIDs:]";
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEBUG, "%s User dismissed notification prompt for trigger with identifier: %{public}@", buf, 0x16u);
  }

  if (objc_msgSend(v8, "count"))
  {
    -[WFTriggerEventQueue queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __98__WFTriggerEventQueue_notificationManager_didDismissTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke;
    v12[3] = &unk_1E7AA8138;
    v12[4] = self;
    v13 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    getWFTriggersLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFTriggerEventQueue notificationManager:didDismissTriggerWithIdentifier:pendingTriggerEventIDs:]";
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEBUG, "%s No event info found to delete", buf, 0xCu);
    }

  }
}

- (void)notificationManager:(id)a3 didFailToPostNotificationPromptWithTriggerIdentifier:(id)a4 pendingTriggerEventIDs:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  getWFTriggersLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFTriggerEventQueue notificationManager:didFailToPostNotificationPromptWithTriggerIdentifier:pendingTriggerEventIDs:]";
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEBUG, "%s Failed to post notifciation prompt for trigger with identifier: %{public}@", buf, 0x16u);
  }

  if (objc_msgSend(v8, "count"))
  {
    -[WFTriggerEventQueue queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __119__WFTriggerEventQueue_notificationManager_didFailToPostNotificationPromptWithTriggerIdentifier_pendingTriggerEventIDs___block_invoke;
    v12[3] = &unk_1E7AA8138;
    v12[4] = self;
    v13 = v8;
    dispatch_async(v10, v12);

  }
  else
  {
    getWFTriggersLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[WFTriggerEventQueue notificationManager:didFailToPostNotificationPromptWithTriggerIdentifier:pendingTriggerEventIDs:]";
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEBUG, "%s No event info found to delete", buf, 0xCu);
    }

  }
}

- (void)notificationManager:(id)a3 didRequestDisablementOfTriggersWithIdentifiers:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFTriggerNotificationsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[WFTriggerEventQueue notificationManager:didRequestDisablementOfTriggersWithIdentifiers:]";
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Disabling triggers with identifiers: %{public}@", buf, 0x16u);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[WFTriggerEventQueue queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__WFTriggerEventQueue_notificationManager_didRequestDisablementOfTriggersWithIdentifiers___block_invoke;
    v9[3] = &unk_1E7AA8138;
    v9[4] = self;
    v10 = v5;
    dispatch_async(v7, v9);

  }
  else
  {
    getWFTriggersLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFTriggerEventQueue notificationManager:didRequestDisablementOfTriggersWithIdentifiers:]";
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEBUG, "%s No event info found to delete", buf, 0xCu);
    }

  }
}

- (void)didFinishRunningWithError:(id)a3 cancelled:(BOOL)a4 trigger:(id)a5 runEvent:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  _QWORD block[5];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v8 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  getWFTriggersLogObject();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFTriggerEventQueue didFinishRunningWithError:cancelled:trigger:runEvent:]";
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Finished running with error: %@", buf, 0x16u);
    }

    -[WFTriggerEventQueue notificationManager](self, "notificationManager");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationThatTrigger:failedWithError:](v14, "postNotificationThatTrigger:failedWithError:", v11, v10);
    v15 = 2;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFTriggerEventQueue didFinishRunningWithError:cancelled:trigger:runEvent:]";
      v23 = 1024;
      LODWORD(v24) = v8;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEBUG, "%s Finished running workflow in background extension (cancelled: %d)", buf, 0x12u);
    }
    v15 = 1;
  }

  -[WFTriggerEventQueue queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WFTriggerEventQueue_didFinishRunningWithError_cancelled_trigger_runEvent___block_invoke;
  block[3] = &unk_1E7AA6E20;
  block[4] = self;
  v19 = v12;
  v20 = v15;
  v17 = v12;
  dispatch_async(v16, block);

  -[WFTriggerEventQueue resume](self, "resume");
}

- (void)logMetricForTrigger:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0DD9EC8];
  v4 = a3;
  v8 = objc_alloc_init(v3);
  objc_msgSend(v8, "setRequiredRuntimeConfirmation:", objc_msgSend(v4, "shouldPrompt"));
  objc_msgSend(v4, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTriggerType:", v7);

  objc_msgSend(v8, "track");
}

- (void)deactivateEphemeralTriggerIfNeeded:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if (_os_feature_enabled_impl() && (objc_msgSend(v6, "shouldRecur") & 1) == 0)
  {
    v23 = 0;
    -[WFTriggerEventQueue databaseWithError:](self, "databaseWithError:", &v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v23;
    v10 = v9;
    if (v8)
    {
      v22 = v9;
      objc_msgSend(v8, "recordWithDescriptor:error:", v6, &v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v22;

      if (v11)
      {
        objc_msgSend(v11, "setEnabled:", 0);
        v21 = v12;
        v13 = objc_msgSend(v8, "saveRecord:withDescriptor:error:", v11, v6, &v21);
        v14 = v21;

        if ((v13 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "trigger");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend((id)objc_opt_class(), "triggerBacking");
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __69__WFTriggerEventQueue_deactivateEphemeralTriggerIfNeeded_completion___block_invoke;
          v19[3] = &unk_1E7AA6DD0;
          v20 = v7;
          objc_msgSend(v15, "unregisterTriggerWithIdentifier:triggerBacking:completion:", v16, v18, v19);

        }
        else
        {
          (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v14);
        }
        v12 = v14;
      }
      else
      {
        (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v12);
      }

      v10 = v12;
    }
    else
    {
      (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
    }

  }
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (WFTriggerEventRunner)triggerEventRunner
{
  return self->_triggerEventRunner;
}

- (WFTriggerUserNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (WFTriggerNotificationScheduler)notificationScheduler
{
  return self->_notificationScheduler;
}

- (WFTriggerBootManager)triggerBootManager
{
  return self->_triggerBootManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_triggerBootManager, 0);
  objc_storeStrong((id *)&self->_notificationScheduler, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_triggerEventRunner, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

uint64_t __69__WFTriggerEventQueue_deactivateEphemeralTriggerIfNeeded_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__WFTriggerEventQueue_didFinishRunningWithError_cancelled_trigger_runEvent___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v7 = 0;
  objc_msgSend(v2, "databaseWithError:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (v3)
  {
    objc_msgSend(v3, "setOutcome:forRunEvent:", a1[6], a1[5]);
  }
  else
  {
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = a1[5];
      *(_DWORD *)buf = 136315650;
      v9 = "-[WFTriggerEventQueue didFinishRunningWithError:cancelled:trigger:runEvent:]_block_invoke";
      v10 = 2112;
      v11 = v6;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Unable to load database, not setting outcome for run event %@: %{public}@", buf, 0x20u);
    }

  }
}

uint64_t __90__WFTriggerEventQueue_notificationManager_didRequestDisablementOfTriggersWithIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disableTriggersWithIdentifiers:", *(_QWORD *)(a1 + 40));
}

uint64_t __119__WFTriggerEventQueue_notificationManager_didFailToPostNotificationPromptWithTriggerIdentifier_pendingTriggerEventIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePendingTriggerEventsWithEventIDs:", *(_QWORD *)(a1 + 40));
}

uint64_t __98__WFTriggerEventQueue_notificationManager_didDismissTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePendingTriggerEventsWithEventIDs:", *(_QWORD *)(a1 + 40));
}

uint64_t __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removePendingTriggerEventsWithEventIDs:", *(_QWORD *)(a1 + 40));
}

void __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v11 = 0;
  objc_msgSend(v2, "configuredTriggerForIdentifier:workflowReference:error:", v3, &v11, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  v6 = v10;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFTriggerEventQueue notificationManager:receivedConfirmationToRunTriggerWithIdentifier:pendingTriggerEvent"
            "IDs:]_block_invoke_2";
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger because it could not be found: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = objc_opt_new();
    objc_msgSend(v8, "resumeWithConfiguredTrigger:workflowReference:eventInfo:", v4, v5, v9);
  }

}

void __113__WFTriggerEventQueue_notificationManager_receivedConfirmationToRunTriggerWithIdentifier_pendingTriggerEventIDs___block_invoke_156(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  objc_msgSend(v2, "setConfirmedForTriggerEventIDs:error:", v1, &v5);
  v3 = v5;
  if (v3)
  {
    getWFTriggersLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v7 = "-[WFTriggerEventQueue notificationManager:receivedConfirmationToRunTriggerWithIdentifier:pendingTriggerEventI"
           "Ds:]_block_invoke";
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to set confirmed for trigger events with error: %{public}@", buf, 0x16u);
    }

  }
}

void __57__WFTriggerEventQueue_handleRemovedIgnoredNotifications___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_opt_new();
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__WFTriggerEventQueue_handleRemovedIgnoredNotifications___block_invoke_2;
  v5[3] = &unk_1E7AA6A80;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);
  objc_msgSend(*(id *)(a1 + 40), "removeAllStaleTriggerEventsIgnoringValidIDs:", v4);

}

void __57__WFTriggerEventQueue_handleRemovedIgnoredNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  WFPendingTriggerEventIDsFromNotificationUserInfo();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);

}

void __79__WFTriggerEventQueue_enqueueTriggerWithIdentifier_eventInfo_force_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  NSObject *log;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v69 = 0;
  v70 = 0;
  objc_msgSend(v2, "configuredTriggerForIdentifier:workflowReference:error:", v3, &v70, &v69);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v70;
  v6 = v69;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    objc_msgSend(v4, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
      v74 = 2114;
      v75 = v13;
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s 🤖 Enqueuing trigger of type: %{public}@", buf, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 48);
    v68 = 0;
    v15 = objc_msgSend(v9, "shouldFireTriggerWithEventInfo:error:", v14, &v68);
    v16 = v68;

    if ((v15 & 1) == 0)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_58:

      v6 = v16;
      goto LABEL_59;
    }
    v17 = *(void **)(a1 + 32);
    v67 = v16;
    objc_msgSend(v17, "databaseWithError:", &v67);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v67;

    if (!v18)
    {
      getWFTriggersLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
        v74 = 2114;
        v75 = v19;
        _os_log_impl(&dword_1C146A000, v32, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger because database is not available: %{public}@", buf, 0x16u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_57;
    }
    objc_msgSend(v4, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sortedRunEventsForTriggerID:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v21, "descriptors");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_opt_class();
    v24 = *(_QWORD *)(a1 + 48);
    v66 = v19;
    LOBYTE(v21) = objc_msgSend(v23, "shouldRunTrigger:forEvent:runEvents:error:", v4, v24, v22, &v66);
    v25 = v66;

    if ((v21 & 1) == 0)
    {
      getWFTriggersLogObject();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
        v74 = 2112;
        v75 = v4;
        v76 = 2112;
        v77 = v34;
        v78 = 2112;
        v79 = v25;
        _os_log_impl(&dword_1C146A000, v33, OS_LOG_TYPE_INFO, "%s Not running trigger (%@) for event (%@) because: %@", buf, 0x2Au);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_56;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v26 = *(void **)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 48);
      v65 = v25;
      v28 = objc_msgSend(v26, "shouldRunEmailOrMessageTrigger:forEvent:runEvents:error:", v4, v27, v22, &v65);
      v29 = v65;

      if ((v28 & 1) == 0)
      {
        getWFTriggersLogObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 136315906;
          v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
          v74 = 2112;
          v75 = v4;
          v76 = 2112;
          v77 = v31;
          v78 = 2112;
          v79 = v29;
          _os_log_impl(&dword_1C146A000, v30, OS_LOG_TYPE_INFO, "%s Not running trigger (%@) for event (%@) because: %@", buf, 0x2Au);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        v25 = v29;
        goto LABEL_56;
      }
    }
    else
    {
      v29 = v25;
    }
    if ((objc_msgSend(v4, "shouldPrompt") & 1) != 0
      || (objc_msgSend((id)objc_opt_class(), "isAllowedToRunAutomatically") & 1) == 0)
    {
      getWFTriggersLogObject();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
        v74 = 2114;
        v75 = v36;
        _os_log_impl(&dword_1C146A000, v35, OS_LOG_TYPE_DEFAULT, "%s 🤖 Trigger needs confirmation, adding (%{public}@) to run queue", buf, 0x16u);
      }

      if (objc_msgSend(v9, "requiresEventInfoAsInput"))
      {
        v37 = *(void **)(a1 + 32);
        v38 = *(_QWORD *)(a1 + 48);
        v64 = v29;
        objc_msgSend(v37, "triggerEventForConfiguredTrigger:eventInfo:confirmed:error:", v4, v38, 0, &v64);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v64;

        if (!v39)
        {
          getWFTriggersLogObject();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
            v74 = 2114;
            v75 = v25;
            _os_log_impl(&dword_1C146A000, v55, OS_LOG_TYPE_ERROR, "%s Failed to create trigger events with error: %{public}@", buf, 0x16u);
          }

          goto LABEL_56;
        }
        objc_msgSend(v39, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
        v41 = objc_claimAutoreleasedReturnValue();

        v42 = (void *)v41;
        v29 = v25;
      }
      else
      {
        v42 = 0;
      }
      VCOSTransactionWithName((uint64_t)CFSTR("WFTriggerEventQueue.enqueueTriggerWithIdentifier"));
      v59 = v22;
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (ActionKitLibrary_sOnce != -1)
        dispatch_once(&ActionKitLibrary_sOnce, &__block_literal_global_282);
      v61 = v42;
      v63 = v29;
      objc_msgSend(MEMORY[0x1E0DD9EF8], "workflowWithReference:database:error:", v5, v18, &v63);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v63;

      if (!v43)
      {
        getWFTriggersLogObject();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v5, "identifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
          v74 = 2112;
          v75 = v54;
          v76 = 2112;
          v77 = v9;
          v78 = 2114;
          v79 = v25;
          _os_log_impl(&dword_1C146A000, v53, OS_LOG_TYPE_ERROR, "%s Failed to fetch workflow (%@) for trigger (%@): %{public}@", buf, 0x2Au);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        goto LABEL_56;
      }
      objc_msgSend(v43, "actions");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v43;
      objc_msgSend(v43, "actions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count");

      if (v46 >= 8)
        v47 = 8;
      else
        v47 = v46;
      objc_msgSend(v44, "subarrayWithRange:", 0, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "if_compactMap:", &__block_literal_global_129);
      v49 = objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v9, "requiresEventInfoAsInput") ^ 1;
      objc_msgSend(*(id *)(a1 + 32), "notificationManager");
      v51 = objc_claimAutoreleasedReturnValue();
      v62 = 0;
      v57 = (void *)v49;
      LOBYTE(v49) = objc_msgSend((id)v51, "postNotificationOfType:forTrigger:workflowReference:removeDeliveredNotifications:pendingTriggerEventIDs:actionIcons:error:", 0, v4, v5, v50, v61, v49, &v62);
      v52 = v62;

      LOBYTE(v51) = v49;
      v22 = v59;
      if ((v51 & 1) == 0)
      {
        getWFTriggersLogObject();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke_2";
          v74 = 2114;
          v75 = v52;
          _os_log_impl(&dword_1C146A000, log, OS_LOG_TYPE_ERROR, "%s Failed to post notification prompt with error: %{public}@", buf, 0x16u);
        }

        if (objc_msgSend(v61, "count"))
          objc_msgSend(*(id *)(a1 + 32), "removePendingTriggerEventsWithEventIDs:", v61);
      }
      objc_msgSend(*(id *)(a1 + 32), "resume");
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "resumeWithConfiguredTrigger:workflowReference:eventInfo:", v4, v5, *(_QWORD *)(a1 + 48));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v25 = v29;
    }
    objc_msgSend(*(id *)(a1 + 32), "logMetricForTrigger:", v4);
LABEL_56:

    v19 = v25;
LABEL_57:

    v16 = v19;
    goto LABEL_58;
  }
  getWFTriggersLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v73 = "-[WFTriggerEventQueue enqueueTriggerWithIdentifier:eventInfo:force:completion:]_block_invoke";
    v74 = 2114;
    v75 = v6;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger because it could not be found: %{public}@", buf, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_59:

}

uint64_t __79__WFTriggerEventQueue_enqueueTriggerWithIdentifier_eventInfo_force_completion___block_invoke_127(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "icon");
}

void __76__WFTriggerEventQueue_runWithConfiguredTrigger_workflowReference_eventInfo___block_invoke(uint64_t a1, char a2, void *a3)
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
    getWFTriggersLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[WFTriggerEventQueue runWithConfiguredTrigger:workflowReference:eventInfo:]_block_invoke";
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Failed to deactivate ephemeral trigger: %{public}@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __29__WFTriggerEventQueue_resume__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v32 = 0;
  objc_msgSend(v2, "nextTriggerEventWithError:", &v32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v32;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "triggerBootManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "canRunAutomations");

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v3, "triggerID");
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        getWFTriggersLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v34 = "-[WFTriggerEventQueue resume]_block_invoke";
          _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Not resuming queue due to missing trigger id", buf, 0xCu);
        }
        goto LABEL_31;
      }
      v8 = *(void **)(a1 + 32);
      v30 = v4;
      v31 = 0;
      objc_msgSend(v8, "configuredTriggerForIdentifier:workflowReference:error:", v7, &v31, &v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v31;
      v11 = v30;

      if (v9 && v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "triggerEventRunner");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject identifier](v10, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isRunningWorkflowWithIdentifier:", v13);

        if (!v14)
        {
          v22 = *(void **)(a1 + 32);
          v29 = v11;
          v23 = objc_msgSend(v22, "deleteTriggerEvent:error:", v3, &v29);
          v4 = v29;

          if ((v23 & 1) == 0)
          {
            getWFTriggersLogObject();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v34 = "-[WFTriggerEventQueue resume]_block_invoke";
              v35 = 2114;
              v36 = v4;
              _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_ERROR, "%s Unable to delete next trigger event with error: %{public}@", buf, 0x16u);
            }

          }
          getWFTriggersLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v3, "triggerID");
            v26 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v34 = "-[WFTriggerEventQueue resume]_block_invoke";
            v35 = 2114;
            v36 = v26;
            _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_DEFAULT, "%s 🤖 Resuming processing for trigger with identifier %{public}@", buf, 0x16u);

          }
          v27 = *(void **)(a1 + 32);
          objc_msgSend(v3, "eventInfo");
          v15 = objc_claimAutoreleasedReturnValue();
          WFTriggerEventInfoDictionaryConverter(v15);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "runWithConfiguredTrigger:workflowReference:eventInfo:", v9, v10, v28);

          goto LABEL_30;
        }
        getWFTriggersLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject identifier](v10, "identifier");
          v16 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v34 = "-[WFTriggerEventQueue resume]_block_invoke";
          v35 = 2112;
          v36 = v16;
          _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEBUG, "%s Not resuming because the triggerEventRunner is running a workflow with identifier %@", buf, 0x16u);

        }
      }
      else
      {
        getWFTriggersLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[WFTriggerEventQueue resume]_block_invoke";
          v35 = 2114;
          v36 = v11;
          _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to fire trigger because it could not be found: %{public}@", buf, 0x16u);
        }
      }
      v4 = v11;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    getWFTriggersLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[WFTriggerEventQueue resume]_block_invoke";
      v18 = "%s Not resuming queue due to boot manager not allowing automation runs";
      v19 = v7;
      v20 = OS_LOG_TYPE_DEFAULT;
      v21 = 12;
      goto LABEL_14;
    }
    goto LABEL_32;
  }
  getWFTriggersLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v4)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFTriggerEventQueue resume]_block_invoke";
      v35 = 2114;
      v36 = v4;
      v18 = "%s Unable to get next trigger event with error: %{public}@";
      v19 = v7;
      v20 = OS_LOG_TYPE_ERROR;
      v21 = 22;
LABEL_14:
      _os_log_impl(&dword_1C146A000, v19, v20, v18, buf, v21);
    }
LABEL_32:

    goto LABEL_33;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[WFTriggerEventQueue resume]_block_invoke";
    _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEBUG, "%s Not resuming because there are no events in the queue", buf, 0xCu);
  }
  v4 = v7;
LABEL_33:

}

+ (BOOL)shouldRunTrigger:(id)a3 forEvent:(id)a4 runEvents:(id)a5 error:(id *)a6
{
  NSObject *v11;
  id v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  NSObject *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTriggerEventQueue.m"), 444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trigger"));

  }
  if ((-[NSObject isEnabled](v11, "isEnabled") & 1) != 0)
  {
    if (-[NSObject shouldPrompt](v11, "shouldPrompt"))
    {
      getWFTriggersLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = 1;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
        v16 = "%s Don't bother rate-limiting prompt automations; the user is doing that when they press Run";
        v17 = v14;
        v18 = 12;
LABEL_18:
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
      }
    }
    else if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(a1, "rateLimitingTimeoutForTrigger:runEvents:", v11, v13);
      v22 = v21;
      objc_msgSend(v13, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject date](v14, "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dateByAddingTimeInterval:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "compare:", v25);

      v15 = v26 != 1;
      if (v26 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Not running trigger (%@) for event (%@) due to rate-limiting with timeout=%0.0f"), v11, v12, *(_QWORD *)&v22);
        v27 = objc_claimAutoreleasedReturnValue();
        getWFTriggersLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
          v35 = 2112;
          v36 = v27;
          _os_log_impl(&dword_1C146A000, v28, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 6004, CFSTR("%@"), v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (a6)
          *a6 = objc_retainAutorelease(v29);

      }
      else
      {
        getWFTriggersLogObject();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
          v35 = 2112;
          v36 = v11;
          _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_INFO, "%s No rate-limiting checks applied; running trigger (%@)",
            buf,
            0x16u);
        }
      }

    }
    else
    {
      getWFTriggersLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = 1;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
        v35 = 2112;
        v36 = v11;
        v16 = "%s No recent runs for trigger (%@); running it";
        v17 = v14;
        v18 = 22;
        goto LABEL_18;
      }
    }
  }
  else
  {
    getWFTriggersLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "+[WFTriggerEventQueue shouldRunTrigger:forEvent:runEvents:error:]";
      v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_INFO, "%s Trigger (%@) is disabled; not running it", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:reason:", 6005, CFSTR("Automation disabled"));
    v20 = objc_claimAutoreleasedReturnValue();
    v14 = v20;
    if (a6)
    {
      v14 = objc_retainAutorelease(v20);
      v15 = 0;
      *a6 = v14;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

+ (double)rateLimitingTimeoutForTrigger:(id)a3 runEvents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        v13 = 0;
        v14 = v10 + v11;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "outcome", (_QWORD)v18) == 1)
          {
            v14 = v11 + v13;
            goto LABEL_17;
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, buf, 16);
        v11 = v14;
        if (v10)
          continue;
        break;
      }
LABEL_17:

      if (v14 > 5)
        v16 = 120.0;
      else
        v16 = dbl_1C1566728[v14];
    }
    else
    {

      v16 = 1.0;
    }
  }
  else
  {
    getWFTriggersLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[WFTriggerEventQueue rateLimitingTimeoutForTrigger:runEvents:]";
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_INFO, "%s No recent runs for trigger (%@); running it",
        buf,
        0x16u);
    }

    v16 = 0.0;
  }

  return v16;
}

@end
