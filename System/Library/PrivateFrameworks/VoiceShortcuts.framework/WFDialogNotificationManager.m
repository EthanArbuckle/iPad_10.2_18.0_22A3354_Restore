@implementation WFDialogNotificationManager

- (WFDialogNotificationManager)initWithUserNotificationManager:(id)a3
{
  id v6;
  WFDialogNotificationManager *v7;
  WFDialogNotificationManager *v8;
  WFUserNotificationManager *userNotificationManager;
  void *v10;
  void *v11;
  void *v12;
  WFUserNotificationManager *v13;
  void *v14;
  WFUserNotificationManager *v15;
  void *v16;
  WFDialogNotificationManager *v17;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDialogNotificationManager.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userNotificationManager"));

  }
  v20.receiver = self;
  v20.super_class = (Class)WFDialogNotificationManager;
  v7 = -[WFDialogNotificationManager init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_userNotificationManager, a3);
    userNotificationManager = v8->_userNotificationManager;
    +[WFDialogNotificationManager dialogNotificationCategory](WFDialogNotificationManager, "dialogNotificationCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    +[WFDialogNotificationManager dialogNotificationConfirmationCategory](WFDialogNotificationManager, "dialogNotificationConfirmationCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager registerCategoriesIfNecessary:](userNotificationManager, "registerCategoriesIfNecessary:", v12);

    v13 = v8->_userNotificationManager;
    +[WFDialogNotificationManager dialogNotificationCategory](WFDialogNotificationManager, "dialogNotificationCategory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager addObserver:forCategory:](v13, "addObserver:forCategory:", v8, v14);

    v15 = v8->_userNotificationManager;
    +[WFDialogNotificationManager dialogNotificationConfirmationCategory](WFDialogNotificationManager, "dialogNotificationConfirmationCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager addObserver:forCategory:](v15, "addObserver:forCategory:", v8, v16);

    v17 = v8;
  }

  return v8;
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t i;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __65__WFDialogNotificationManager_handleRemovedIgnoredNotifications___block_invoke;
  v37[3] = &unk_1E7AA6D38;
  v7 = v6;
  v38 = v7;
  v8 = v5;
  v39 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v37);
  if (objc_msgSend(v8, "count"))
  {
    -[WFDialogNotificationManager userNotificationManager](self, "userNotificationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeNotificationsWithIdentifiers:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "wf_savedShortcutStatesURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v14 = 0;
    v13 = 0;
    if (!objc_msgSend(0, "count"))
      goto LABEL_25;
LABEL_9:
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v15 = v13;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v16)
    {
      v17 = v16;
      v30 = v11;
      v28 = v8;
      v29 = v4;
      v18 = *(_QWORD *)v33;
      v19 = v15;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(v19);
          v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v21, v28, v29) & 1) == 0)
          {
            v22 = v19;
            v23 = v10;
            objc_msgSend(v10, "URLByAppendingPathComponent:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v14;
            v25 = objc_msgSend(v30, "removeItemAtURL:error:", v24, &v31);
            v26 = v31;

            if ((v25 & 1) == 0)
            {
              getWFDialogLogObject();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v41 = "-[WFDialogNotificationManager handleRemovedIgnoredNotifications:]";
                v42 = 2112;
                v43 = v24;
                v44 = 2112;
                v45 = v26;
                _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_ERROR, "%s Unable to delete state at path (%@), error: %@", buf, 0x20u);
              }

            }
            v14 = v26;
            v10 = v23;
            v19 = v22;
          }
        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v17);
      v13 = v19;
      v8 = v28;
      v4 = v29;
      v15 = v19;
      v11 = v30;
    }
    else
    {
      v13 = v15;
    }
    goto LABEL_24;
  }
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v11, "contentsOfDirectoryAtPath:error:", v12, &v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v36;

  if (objc_msgSend(v13, "count"))
    goto LABEL_9;
  if (v14)
  {
    getWFDialogLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[WFDialogNotificationManager handleRemovedIgnoredNotifications:]";
      v42 = 2112;
      v43 = v14;
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get contents of saved shortcut states: %@", buf, 0x16u);
    }
LABEL_24:

  }
LABEL_25:

}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD *v27;
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
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "workflowIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_4;
  v11 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0DD9D00], "defaultDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "workflowIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "referenceForWorkflowID:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0D140A0];
    objc_msgSend(v9, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "proposedTemporaryFileURLForFilename:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screenScale");
    objc_msgSend(v14, "attributionIconWithSize:scale:rounded:", 0, 20.0, 20.0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "PNGRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "writeToURL:atomically:", v17, 0);

    v22 = (void *)MEMORY[0x1E0CEC738];
    objc_msgSend(v17, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "iconAtPath:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CEC738], "iconForApplicationIdentifier:", *MEMORY[0x1E0DC7FD8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "message");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBody:", v26);

    objc_msgSend(v25, "setShouldSuppressDefaultAction:", 1);
    v27 = (_QWORD *)MEMORY[0x1E0DC80F8];
  }
  else
  {
    WFLocalizedString(CFSTR("Tap to respond"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBody:", v28);

    objc_msgSend(v25, "setShouldBackgroundDefaultAction:", 1);
    v27 = (_QWORD *)MEMORY[0x1E0DC80F0];
  }
  objc_msgSend(v25, "setCategoryIdentifier:", *v27);
  objc_msgSend(v25, "setInterruptionLevel:", 2);
  objc_msgSend(v25, "setShouldAuthenticateDefaultAction:", 1);
  objc_msgSend(v25, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v8, "attribution");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "title");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTitle:", v30);

  objc_msgSend(v25, "setIcon:", v24);
  objc_msgSend(v8, "promptForDisplay");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSubtitle:", v31);

  v47[0] = CFSTR("runningContext");
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = CFSTR("presentationMode");
  v48[0] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUserInfo:", v34);

  objc_msgSend(v9, "workflowIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "workflowIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("workflow-identifier:%@"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setThreadIdentifier:", v38);

  }
  v39 = (void *)MEMORY[0x1E0CEC740];
  objc_msgSend(v9, "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "requestWithIdentifier:content:trigger:destinations:", v40, v25, 0, 15);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDialogNotificationManager userNotificationManager](self, "userNotificationManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "notificationCenter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __91__WFDialogNotificationManager_postNotificationWithRequest_presentationMode_runningContext___block_invoke;
  v45[3] = &unk_1E7AA7478;
  v46 = v8;
  v44 = v8;
  objc_msgSend(v43, "addNotificationRequest:withCompletionHandler:", v41, v45);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  (*((void (**)(id))a5 + 2))(a5);
  objc_msgSend(v6, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("runningContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  if (v12)
  {
    objc_msgSend(v6, "actionIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject isEqualToString:](v14, "isEqualToString:", *MEMORY[0x1E0CEC818]) & 1) == 0)
    {
      objc_msgSend(v9, "userInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("presentationMode"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "integerValue");
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7E60]), "initWithInput:presentationMode:", 0, v17);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9D58]), "initWithRunningContext:runRequest:", v12, v18);
      objc_msgSend(v19, "start");

    }
  }
  else
  {
    getWFDialogLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFDialogNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_ERROR, "%s Unable to get context from notification userInfo: %@", buf, 0x16u);
    }
  }

}

- (WFUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
}

void __91__WFDialogNotificationManager_postNotificationWithRequest_presentationMode_runningContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFDialogLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 136315650;
      v7 = "-[WFDialogNotificationManager postNotificationWithRequest:presentationMode:runningContext:]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Unable to post request (%@) as a notification: %@", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __65__WFDialogNotificationManager_handleRemovedIgnoredNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("runningContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v18;
    if (v8)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v8, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);
    }
    else
    {
      getWFDialogLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[WFDialogNotificationManager handleRemovedIgnoredNotifications:]_block_invoke";
        v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_FAULT, "%s Decoding running context failed while trying to keep a workflow controller state around: %{public}@", buf, 0x16u);
      }

      v16 = *(void **)(a1 + 40);
      objc_msgSend(v3, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v17);

    }
  }
  else
  {
    getWFDialogLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "content");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userInfo");
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFDialogNotificationManager handleRemovedIgnoredNotifications:]_block_invoke";
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_ERROR, "%s Notification user info (%@) was expected to contain a running context but did not", buf, 0x16u);

    }
  }

}

+ (id)dialogNotificationCategory
{
  return (id)objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", *MEMORY[0x1E0DC80F0], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
}

+ (id)dialogNotificationConfirmationCategory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("play"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEC700];
  WFLocalizedString(CFSTR("Continue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithIdentifier:title:options:icon:", CFSTR("confirm"), v4, 1, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEC720];
  v7 = *MEMORY[0x1E0DC80F8];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categoryWithIdentifier:actions:intentIdentifiers:options:", v7, v8, MEMORY[0x1E0C9AA60], 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)categoryIdentifiers
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC80F8];
  v4[0] = *MEMORY[0x1E0DC80F0];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
