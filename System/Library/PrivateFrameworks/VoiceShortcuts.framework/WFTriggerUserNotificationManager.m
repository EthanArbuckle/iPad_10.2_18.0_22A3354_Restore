@implementation WFTriggerUserNotificationManager

- (WFTriggerUserNotificationManager)initWithUserNotificationManager:(id)a3
{
  id v6;
  WFTriggerUserNotificationManager *v7;
  WFTriggerUserNotificationManager *v8;
  WFUserNotificationManager *userNotificationManager;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFUserNotificationManager *v14;
  void *v15;
  WFUserNotificationManager *v16;
  void *v17;
  WFUserNotificationManager *v18;
  void *v19;
  WFTriggerUserNotificationManager *v20;
  void *v22;
  objc_super v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerUserNotificationManager.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userNotificationManager"));

  }
  v23.receiver = self;
  v23.super_class = (Class)WFTriggerUserNotificationManager;
  v7 = -[WFTriggerUserNotificationManager init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_userNotificationManager, a3);
    userNotificationManager = v8->_userNotificationManager;
    +[WFTriggerUserNotificationManager alertCategory](WFTriggerUserNotificationManager, "alertCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v10;
    +[WFTriggerUserNotificationManager promptCategory](WFTriggerUserNotificationManager, "promptCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v11;
    +[WFTriggerUserNotificationManager backgroundRunningCategory](WFTriggerUserNotificationManager, "backgroundRunningCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager registerCategoriesIfNecessary:](userNotificationManager, "registerCategoriesIfNecessary:", v13);

    v14 = v8->_userNotificationManager;
    +[WFTriggerUserNotificationManager alertCategory](WFTriggerUserNotificationManager, "alertCategory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager addObserver:forCategory:](v14, "addObserver:forCategory:", v8, v15);

    v16 = v8->_userNotificationManager;
    +[WFTriggerUserNotificationManager promptCategory](WFTriggerUserNotificationManager, "promptCategory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager addObserver:forCategory:](v16, "addObserver:forCategory:", v8, v17);

    v18 = v8->_userNotificationManager;
    +[WFTriggerUserNotificationManager backgroundRunningCategory](WFTriggerUserNotificationManager, "backgroundRunningCategory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager addObserver:forCategory:](v18, "addObserver:forCategory:", v8, v19);

    v20 = v8;
  }

  return v8;
}

- (WFTriggerNotificationDebouncer)debouncer
{
  WFTriggerNotificationDebouncer *debouncer;
  WFTriggerNotificationDebouncer *v4;
  WFTriggerNotificationDebouncer *v5;

  debouncer = self->_debouncer;
  if (!debouncer)
  {
    v4 = objc_alloc_init(WFTriggerNotificationDebouncer);
    v5 = self->_debouncer;
    self->_debouncer = v4;

    -[WFTriggerNotificationDebouncer setDelegate:](self->_debouncer, "setDelegate:", self);
    debouncer = self->_debouncer;
  }
  return debouncer;
}

- (BOOL)postNotificationOfType:(unint64_t)a3 forTrigger:(id)a4 workflowReference:(id)a5 removeDeliveredNotifications:(BOOL)a6 pendingTriggerEventIDs:(id)a7 actionIcons:(id)a8 error:(id *)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v23;
  void *v24;

  v11 = a6;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerUserNotificationManager.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredTrigger"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerUserNotificationManager.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflowReference"));

LABEL_3:
  if (objc_msgSend(v18, "count"))
  {
    -[WFTriggerUserNotificationManager debouncer](self, "debouncer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addEventsWithIdentifiers:configuredTrigger:workflowReference:", v18, v16, v17);

    v21 = 1;
  }
  else
  {
    v21 = -[WFTriggerUserNotificationManager _postNotificationOfType:forTrigger:workflowReference:removeDeliveredNotifications:pendingTriggerEventIDs:actionIcons:error:](self, "_postNotificationOfType:forTrigger:workflowReference:removeDeliveredNotifications:pendingTriggerEventIDs:actionIcons:error:", a3, v16, v17, v11, v18, v19, a9);
  }

  return v21;
}

- (BOOL)_postNotificationOfType:(unint64_t)a3 forTrigger:(id)a4 workflowReference:(id)a5 removeDeliveredNotifications:(BOOL)a6 pendingTriggerEventIDs:(id)a7 actionIcons:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  dispatch_semaphore_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  dispatch_time_t v38;
  BOOL v39;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  WFTriggerUserNotificationManager *v46;
  id v47;
  NSObject *v48;
  uint64_t *v49;
  unint64_t v50;
  BOOL v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v15, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "trigger");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  WFLocalizedString(CFSTR("Shortcuts"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v21);

  WFTriggerNotificationUserInfo();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUserInfo:", v22);

  objc_msgSend(v20, "setShouldHideDate:", 0);
  objc_msgSend(v20, "setShouldIgnoreDoNotDisturb:", 1);
  v41 = v18;
  v42 = v15;
  if (a3 == 1)
  {
    objc_msgSend(v20, "setSound:", 0);
    objc_msgSend(v43, "localizedPastTenseDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitle:", v28);

    WFLocalizedString(CFSTR("Running your automation"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBody:", v29);

    objc_msgSend(v20, "setCategoryIdentifier:", CFSTR("triggerAlertCategory"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("alert:%@"), v19, v18, v15);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setThreadIdentifier:", v30);

  }
  else if (!a3)
  {
    VCNotificationTitleForTriggerWithPendingCount(v43, objc_msgSend(v17, "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSubtitle:", v23);

    objc_msgSend(v16, "actionsDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBody:", v24);

    objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSound:", v25);

    objc_msgSend(v20, "setCategoryIdentifier:", *MEMORY[0x1E0DD9FF0]);
    objc_msgSend(v20, "setInterruptionLevel:", 2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("prompt:%@"), v19, v18, v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setThreadIdentifier:", v26);

    objc_msgSend(v20, "setShouldSuppressDefaultAction:", 1);
    objc_msgSend(v20, "setShouldAuthenticateDefaultAction:", 0);
    if (VCLocaleIsRTL())
      v27 = CFSTR("arrow.up.backward.square.fill");
    else
      v27 = CFSTR("arrow.up.right.square.fill");
    objc_msgSend(v20, "setAccessoryImageName:", v27);
  }
  v31 = v16;
  v32 = dispatch_semaphore_create(0);
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__3733;
  v56 = __Block_byref_object_dispose__3734;
  v57 = 0;
  -[WFTriggerUserNotificationManager userNotificationManager](self, "userNotificationManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "notificationCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __159__WFTriggerUserNotificationManager__postNotificationOfType_forTrigger_workflowReference_removeDeliveredNotifications_pendingTriggerEventIDs_actionIcons_error___block_invoke;
  v44[3] = &unk_1E7AA6B80;
  v51 = a6;
  v35 = v19;
  v45 = v35;
  v46 = self;
  v36 = v20;
  v47 = v36;
  v49 = &v52;
  v50 = a3;
  v37 = v32;
  v48 = v37;
  objc_msgSend(v34, "getDeliveredNotificationsWithCompletionHandler:", v44);

  v38 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v37, v38);
  if (a9)
    *a9 = objc_retainAutorelease((id)v53[5]);
  v39 = v53[5] == 0;

  _Block_object_dispose(&v52, 8);
  return v39;
}

- (void)postNotificationThatTrigger:(id)a3 failedWithError:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerUserNotificationManager.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredTrigger"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerUserNotificationManager.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

LABEL_3:
  v10 = v9;
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v10;
  if (v13)
  {
    v15 = v10;
    do
    {
      objc_msgSend(v15, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v14;
    }
    while (v18);
  }
  objc_msgSend(v14, "localizedFailureReason");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19
    && (v20 = (void *)v19,
        objc_msgSend(v14, "localizedDescription"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        v21))
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "localizedFailureReason");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@\n\n%@"), v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "localizedFailureReason");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      objc_msgSend(v14, "localizedFailureReason");
    else
      objc_msgSend(v14, "localizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  WFLocalizedString(CFSTR("Shortcuts"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTitle:", v28);

  objc_msgSend(v27, "setShouldHideDate:", 0);
  objc_msgSend(v27, "setCategoryIdentifier:", CFSTR("triggerAlertCategory"));
  WFLocalizedString(CFSTR("Automation failed"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSubtitle:", v29);

  v30 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("“%1$@” encountered an error: %2$@"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trigger");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedDescriptionWithConfigurationSummary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringWithFormat:", v31, v33, v25);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBody:", v34);

  objc_msgSend(v7, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  WFTriggerNotificationUserInfo();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUserInfo:", v36);

  v37 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "UUIDString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "requestWithIdentifier:content:trigger:destinations:", v39, v27, 0, 15);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  getWFTriggersLogObject();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "identifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "identifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v49 = "-[WFTriggerUserNotificationManager postNotificationThatTrigger:failedWithError:]";
    v50 = 2114;
    v51 = v42;
    v52 = 2114;
    v53 = v43;
    _os_log_impl(&dword_1C146A000, v41, OS_LOG_TYPE_DEFAULT, "%s Showing error alert for trigger (%{public}@), request id (%{public}@)", buf, 0x20u);

  }
  -[WFTriggerUserNotificationManager userNotificationManager](self, "userNotificationManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "notificationCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addNotificationRequest:withCompletionHandler:", v40, &__block_literal_global_3751);

}

- (BOOL)postBackgroundRunningNotificationWithConfiguredTriggers:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  dispatch_semaphore_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  dispatch_time_t v22;
  BOOL v23;
  _QWORD v25[4];
  NSObject *v26;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  WFLocalizedString(CFSTR("Shortcuts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedPluralString(CFSTR("%lu automations recently ran in the background."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v13, objc_msgSend(v8, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBody:", v14);

  objc_msgSend(MEMORY[0x1E0CEC760], "defaultSound");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSound:", v15);

  objc_msgSend(v10, "setCategoryIdentifier:", *MEMORY[0x1E0DD9FE8]);
  objc_msgSend(v10, "setInterruptionLevel:", 1);
  objc_msgSend(v10, "setShouldSuppressDefaultAction:", 1);
  objc_msgSend(v10, "setShouldAuthenticateDefaultAction:", 0);
  objc_msgSend(v10, "setShouldHideDate:", 1);
  objc_msgSend(v10, "setUserInfo:", v9);
  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.siriactionsd.TriggerBackgroundRunning"), v10, 0, 15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggerNotificationsLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[WFTriggerUserNotificationManager postBackgroundRunningNotificationWithConfiguredTr"
                                    "iggers:userInfo:error:]";
    _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_DEFAULT, "%s Showing background running trigger notification", (uint8_t *)&buf, 0xCu);
  }

  v18 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3733;
  v31 = __Block_byref_object_dispose__3734;
  v32 = 0;
  -[WFTriggerUserNotificationManager userNotificationManager](self, "userNotificationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "notificationCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __107__WFTriggerUserNotificationManager_postBackgroundRunningNotificationWithConfiguredTriggers_userInfo_error___block_invoke;
  v25[3] = &unk_1E7AA6B58;
  p_buf = &buf;
  v21 = v18;
  v26 = v21;
  objc_msgSend(v20, "addNotificationRequest:withCompletionHandler:", v16, v25);

  v22 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v21, v22);
  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
  v23 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) == 0;

  _Block_object_dispose(&buf, 8);
  return v23;
}

- (void)removeNotificationsWithTriggerIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WFTriggerUserNotificationManager *v14;
  _QWORD v15[4];
  id v16;
  WFTriggerUserNotificationManager *v17;

  v4 = a3;
  -[WFTriggerUserNotificationManager userNotificationManager](self, "userNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__WFTriggerUserNotificationManager_removeNotificationsWithTriggerIdentifier___block_invoke;
  v15[3] = &unk_1E7AA6BC8;
  v8 = v4;
  v16 = v8;
  v17 = self;
  objc_msgSend(v6, "getDeliveredNotificationsWithCompletionHandler:", v15);

  -[WFTriggerUserNotificationManager userNotificationManager](self, "userNotificationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __77__WFTriggerUserNotificationManager_removeNotificationsWithTriggerIdentifier___block_invoke_2;
  v12[3] = &unk_1E7AA6BC8;
  v13 = v8;
  v14 = self;
  v11 = v8;
  objc_msgSend(v10, "getPendingNotificationRequestsWithCompletionHandler:", v12);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTriggerUserNotificationManager.m"), 295, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"), v32);

  }
  getWFTriggersLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "actionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v34 = "-[WFTriggerUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    v35 = 2114;
    v36 = v12;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s daemon didReceiveNotificationResponse with action (%{public}@)", buf, 0x16u);

  }
  objc_msgSend(v9, "actionIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notification");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "content");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "notification");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "request");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "content");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "categoryIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0DD9FF0]);

  if (v22)
  {
    WFTriggerIDFromNotificationUserInfo();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    WFPendingTriggerEventIDsFromNotificationUserInfo();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CEC818]))
      {
        -[WFTriggerUserNotificationManager delegate](self, "delegate");
        v25 = objc_claimAutoreleasedReturnValue();
        -[NSObject notificationManager:didDismissTriggerWithIdentifier:pendingTriggerEventIDs:](v25, "notificationManager:didDismissTriggerWithIdentifier:pendingTriggerEventIDs:", self, v23, v24);
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("runAction")))
      {
        -[WFTriggerUserNotificationManager delegate](self, "delegate");
        v25 = objc_claimAutoreleasedReturnValue();
        -[NSObject notificationManager:receivedConfirmationToRunTriggerWithIdentifier:pendingTriggerEventIDs:](v25, "notificationManager:receivedConfirmationToRunTriggerWithIdentifier:pendingTriggerEventIDs:", self, v23, v24);
      }
      else
      {
        getWFTriggersLogObject();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "actionIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v34 = "-[WFTriggerUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
          v35 = 2114;
          v36 = v30;
          v37 = 2114;
          v38 = v9;
          _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_ERROR, "%s unexpected actionIdentifier (%{public}@) from notification reponse (%{public}@)", buf, 0x20u);

        }
      }
    }
    else
    {
      getWFTriggersLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFTriggerUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
        v35 = 2114;
        v36 = v17;
        _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_ERROR, "%s Missing or invalid triggerID from notification reponse userInfo: %{public}@", buf, 0x16u);
      }
    }

    v10[2](v10);
    goto LABEL_20;
  }
  objc_msgSend(v9, "notification");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "request");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "content");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "categoryIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0DD9FE8]))
  {

LABEL_20:
    goto LABEL_21;
  }
  v28 = objc_msgSend(v13, "isEqualToString:", CFSTR("disableAction"));

  if (v28)
  {
    WFTriggerIDsToDisableFromNotificationUserInfo();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerUserNotificationManager delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "notificationManager:didRequestDisablementOfTriggersWithIdentifiers:", self, v23);

    v10[2](v10);
LABEL_21:

  }
}

- (void)postNotificationForTrigger:(id)a3 workflowReference:(id)a4 pendingTriggerEventIDs:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v16 = 0;
  v10 = -[WFTriggerUserNotificationManager _postNotificationOfType:forTrigger:workflowReference:removeDeliveredNotifications:pendingTriggerEventIDs:actionIcons:error:](self, "_postNotificationOfType:forTrigger:workflowReference:removeDeliveredNotifications:pendingTriggerEventIDs:actionIcons:error:", 0, v8, a4, 0, v9, 0, &v16);
  v11 = v16;
  v12 = v11;
  if (!v10)
  {
    if (v11)
    {
      getWFTriggersLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFTriggerUserNotificationManager postNotificationForTrigger:workflowReference:pendingTriggerEventIDs:]";
        v19 = 2114;
        v20 = v12;
        _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_ERROR, "%s Could not post trigger notification after debouncing with error: %{public}@", buf, 0x16u);
      }

    }
    -[WFTriggerUserNotificationManager delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "notificationManager:didFailToPostNotificationPromptWithTriggerIdentifier:pendingTriggerEventIDs:", self, v15, v9);

  }
}

- (WFTriggerUserNotificationManagerDelegate)delegate
{
  return (WFTriggerUserNotificationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debouncer, 0);
}

void __77__WFTriggerUserNotificationManager_removeNotificationsWithTriggerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "request");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "content");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        WFTriggerIDFromNotificationUserInfo();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32)))
        {
          objc_msgSend(*(id *)(a1 + 40), "userNotificationManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "notificationCenter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeDeliveredNotificationsWithIdentifiers:", v16);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

void __77__WFTriggerUserNotificationManager_removeNotificationsWithTriggerIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v7, "request");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "content");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        WFTriggerIDFromNotificationUserInfo();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32)))
        {
          objc_msgSend(*(id *)(a1 + 40), "userNotificationManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "notificationCenter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removePendingNotificationRequestsWithIdentifiers:", v16);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

}

void __107__WFTriggerUserNotificationManager_postBackgroundRunningNotificationWithConfiguredTriggers_userInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __80__WFTriggerUserNotificationManager_postNotificationThatTrigger_failedWithError___block_invoke(uint64_t a1, void *a2)
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
  if (v2)
  {
    getWFTriggersLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[WFTriggerUserNotificationManager postNotificationThatTrigger:failedWithError:]_block_invoke";
      v6 = 2114;
      v7 = v2;
      _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_ERROR, "%s Failed to post error notification: %{public}@", (uint8_t *)&v4, 0x16u);
    }

  }
}

void __159__WFTriggerUserNotificationManager__postNotificationOfType_forTrigger_workflowReference_removeDeliveredNotifications_pendingTriggerEventIDs_actionIcons_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  id obj;
  _QWORD v30[4];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  obj = a2;
  if (*(_BYTE *)(a1 + 80))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v33 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v7, "request");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "content");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "userInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          WFTriggerIDFromNotificationUserInfo();
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32)))
          {
            objc_msgSend(*(id *)(a1 + 40), "userNotificationManager");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "notificationCenter");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "request");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v15;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeDeliveredNotificationsWithIdentifiers:", v16);

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      }
      while (v4);
    }
  }
  v17 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "requestWithIdentifier:content:trigger:destinations:", v19, *(_QWORD *)(a1 + 48), 0, 15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  getWFTriggersLogObject();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_QWORD *)(a1 + 72))
      v22 = CFSTR("alert");
    else
      v22 = CFSTR("prompt");
    v23 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v20, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v37 = "-[WFTriggerUserNotificationManager _postNotificationOfType:forTrigger:workflowReference:removeDeliveredNotific"
          "ations:pendingTriggerEventIDs:actionIcons:error:]_block_invoke";
    v38 = 2114;
    v39 = v22;
    v40 = 2114;
    v41 = v23;
    v42 = 2114;
    v43 = v24;
    _os_log_impl(&dword_1C146A000, v21, OS_LOG_TYPE_DEFAULT, "%s Showing %{public}@ for firing trigger (%{public}@), request id (%{public}@)", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "userNotificationManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "notificationCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __159__WFTriggerUserNotificationManager__postNotificationOfType_forTrigger_workflowReference_removeDeliveredNotifications_pendingTriggerEventIDs_actionIcons_error___block_invoke_153;
  v30[3] = &unk_1E7AA6B58;
  v28 = *(_OWORD *)(a1 + 56);
  v27 = (id)v28;
  v31 = v28;
  objc_msgSend(v26, "addNotificationRequest:withCompletionHandler:", v20, v30);

}

void __159__WFTriggerUserNotificationManager__postNotificationOfType_forTrigger_workflowReference_removeDeliveredNotifications_pendingTriggerEventIDs_actionIcons_error___block_invoke_153(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)promptCategory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("play"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEC700];
  WFLocalizedString(CFSTR("Run"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithIdentifier:title:options:icon:", CFSTR("runAction"), v4, 0, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x1E0CEC6D0]);
  v7 = (void *)objc_msgSend(v6, "initWithIdentifier:", *MEMORY[0x1E0DD9FF0]);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActions:", v8);

  objc_msgSend(v7, "setOptions:", 131073);
  objc_msgSend(v7, "setListPriority:", 2);

  return v7;
}

+ (id)alertCategory
{
  return (id)objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("triggerAlertCategory"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
}

+ (id)backgroundRunningCategory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("arrow.up.forward.square"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEC700];
  WFLocalizedString(CFSTR("Edit in Shortcuts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithIdentifier:title:options:icon:", CFSTR("editAction"), v4, 4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEC700];
  WFLocalizedString(CFSTR("Disable Automations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithIdentifier:title:options:icon:", CFSTR("disableAction"), v7, 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0CEC6D0]);
  v10 = (void *)objc_msgSend(v9, "initWithIdentifier:", *MEMORY[0x1E0DD9FE8]);
  v13[0] = v5;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActions:", v11);

  objc_msgSend(v10, "setListPriority:", 1);
  return v10;
}

+ (id)categoryIdentifiers
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0DD9FF0];
  v3[1] = CFSTR("triggerAlertCategory");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
