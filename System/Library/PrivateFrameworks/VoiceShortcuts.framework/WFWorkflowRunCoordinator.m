@implementation WFWorkflowRunCoordinator

- (WFWorkflowRunCoordinator)initWithUserNotificationManager:(id)a3 databaseProvider:(id)a4
{
  id v7;
  id v8;
  WFWorkflowRunCoordinator *v9;
  WFWorkflowRunCoordinator *v10;
  WFUserNotificationManager *userNotificationManager;
  void *v12;
  void *v13;
  void *v14;
  WFUserNotificationManager *v15;
  void *v16;
  WFUserNotificationManager *v17;
  void *v18;
  WFDialogNotificationManager *v19;
  WFDialogNotificationManager *dialogNotificationManager;
  WFDialogPresentationManager *v21;
  WFDialogPresentationManager *dialogPresentationManager;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  WFUIPresenter *userInterfacePresenter;
  NSObject *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *queue;
  WFWorkflowRunCoordinator *v31;
  objc_super v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)WFWorkflowRunCoordinator;
  v9 = -[WFWorkflowRunCoordinator init](&v33, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseProvider, a4);
    objc_storeStrong((id *)&v10->_userNotificationManager, a3);
    userNotificationManager = v10->_userNotificationManager;
    +[WFWorkflowRunCoordinator errorCategory](WFWorkflowRunCoordinator, "errorCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v12;
    +[WFWorkflowRunCoordinator errorWithActionCategory](WFWorkflowRunCoordinator, "errorWithActionCategory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager registerCategoriesIfNecessary:](userNotificationManager, "registerCategoriesIfNecessary:", v14);

    v15 = v10->_userNotificationManager;
    +[WFWorkflowRunCoordinator errorCategory](WFWorkflowRunCoordinator, "errorCategory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager addObserver:forCategory:](v15, "addObserver:forCategory:", v10, v16);

    v17 = v10->_userNotificationManager;
    +[WFWorkflowRunCoordinator errorWithActionCategory](WFWorkflowRunCoordinator, "errorWithActionCategory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFUserNotificationManager addObserver:forCategory:](v17, "addObserver:forCategory:", v10, v18);

    v19 = -[WFDialogNotificationManager initWithUserNotificationManager:]([WFDialogNotificationManager alloc], "initWithUserNotificationManager:", v10->_userNotificationManager);
    dialogNotificationManager = v10->_dialogNotificationManager;
    v10->_dialogNotificationManager = v19;

    v21 = -[WFDialogPresentationManager initWithNotificationManager:]([WFDialogPresentationManager alloc], "initWithNotificationManager:", v10->_dialogNotificationManager);
    dialogPresentationManager = v10->_dialogPresentationManager;
    v10->_dialogPresentationManager = v21;

    -[WFDialogPresentationManager setDelegate:](v10->_dialogPresentationManager, "setDelegate:", v10);
    if (objc_msgSend(MEMORY[0x1E0C99EA0], "bannersEnabled"))
      v23 = objc_opt_new();
    else
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9EE0]), "initWithPresenter:", v10->_dialogPresentationManager);
    v24 = (void *)v23;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v24, "setInterruptionHandler:", &__block_literal_global_128);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9ED0]), "initWithConnection:", v24);
    userInterfacePresenter = v10->_userInterfacePresenter;
    v10->_userInterfacePresenter = (WFUIPresenter *)v25;

    -[WFUIPresenter setDelegate:](v10->_userInterfacePresenter, "setDelegate:", v10);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v27, QOS_CLASS_USER_INITIATED, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create("com.apple.shortcuts.WFWorkflowRunCoordinator", v28);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v29;

    v31 = v10;
  }

  return v10;
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFWorkflowRunCoordinator dialogPresentationManager](self, "dialogPresentationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleRemovedIgnoredNotifications:", v4);

}

- (WFToastManager)toastManager
{
  WFToastManager *toastManager;
  WFToastManager *v4;
  WFToastManager *v5;

  toastManager = self->_toastManager;
  if (!toastManager)
  {
    if (self->_hasInitializedToastManager)
    {
      toastManager = 0;
    }
    else
    {
      v4 = -[WFToastManager initWithDelegate:]([WFToastManager alloc], "initWithDelegate:", self);
      v5 = self->_toastManager;
      self->_toastManager = v4;

      self->_hasInitializedToastManager = 1;
      toastManager = self->_toastManager;
    }
  }
  return toastManager;
}

- (void)showSingleStepCompletionWithWebClipMetadata:(id)a3 completion:(id)a4
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
  -[WFWorkflowRunCoordinator queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WFWorkflowRunCoordinator_showSingleStepCompletionWithWebClipMetadata_completion___block_invoke;
  block[3] = &unk_1E7AA8110;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  void *v12;
  double v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  getWFSessionKitLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v15 = 136315394;
    v16 = "-[WFWorkflowRunCoordinator toastSessionKitSessionWithIdentifier:forDuration:completion:]";
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_INFO, "%s Toasting SessionKit session with identifier: %@", (uint8_t *)&v15, 0x16u);
  }

  -[WFWorkflowRunCoordinator toastManager](self, "toastManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v9, "doubleValue");
  else
    v13 = -1.0;
  v14 = objc_msgSend(v12, "toastSessionWithIdentifier:forDuration:", v8, v13);

  v10[2](v10, v14);
}

- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkflowRunCoordinator.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[WFWorkflowRunCoordinator toastManager](self, "toastManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eatTheToastWithReason:", v10);

  v7[2](v7);
}

- (id)unsupportedDialogResponseWithRequest:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9E60]), "initWithUnsupported:", 1);
  else
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithCancelled:", 1);
  return v5;
}

- (void)presentationManager:(id)a3 updateSmartPromptStateData:(id)a4 actionUUID:(id)a5 context:(id)a6 reference:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __int128 v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a7;
  -[WFWorkflowRunCoordinator databaseProvider](self, "databaseProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "databaseWithError:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v27;
    *(_QWORD *)&v17 = 136315394;
    v24 = v17;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v15);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
        v25 = 0;
        objc_msgSend(v14, "saveSmartPromptStateData:actionUUID:reference:error:", v21, v11, v12, &v25, v24);
        v22 = v25;
        if (v22)
        {
          getWFWorkflowExecutionLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v31 = "-[WFWorkflowRunCoordinator presentationManager:updateSmartPromptStateData:actionUUID:context:reference:]";
            v32 = 2112;
            v33 = v22;
            _os_log_impl(&dword_1C146A000, v23, OS_LOG_TYPE_ERROR, "%s Failed to save smart prompt state data: %@", buf, 0x16u);
          }

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

}

- (void)toastManager:(id)a3 didToastSessionWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFWorkflowExecutionLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[WFWorkflowRunCoordinator toastManager:didToastSessionWithIdentifier:]";
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Toasted session with identifier %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0DDA050]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 136315906;
      v20 = "WFEnforceClass";
      v21 = 2114;
      v22 = v10;
      v23 = 2114;
      v24 = v13;
      v25 = 2114;
      v26 = v9;
      v14 = v13;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  -[WFWorkflowRunCoordinator userInterfacePresenter](self, "userInterfacePresenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__WFWorkflowRunCoordinator_toastManager_didToastSessionWithIdentifier___block_invoke;
  v17[3] = &unk_1E7AA7478;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v15, "pauseDialogPresentationForDuration:withCompletionHandler:", v16, v17);

}

- (void)toastManager:(id)a3 didDismissToastedSessionWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFWorkflowExecutionLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[WFWorkflowRunCoordinator toastManager:didDismissToastedSessionWithIdentifier:]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Toasted session with identifier %{public}@ is dismissed, let's resume dialog presentation", (uint8_t *)&v8, 0x16u);
  }

  -[WFWorkflowRunCoordinator userInterfacePresenter](self, "userInterfacePresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resumeDialogPresentationWithCompletionHandler:", &__block_literal_global_147);

}

- (void)toastManager:(id)a3 didFailToToastSessionWithIdentifier:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  getWFWorkflowExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315650;
    v10 = "-[WFWorkflowRunCoordinator toastManager:didFailToToastSessionWithIdentifier:error:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to toast session with identifier %{identifier}@: %@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5
{
  -[WFDialogNotificationManager postNotificationWithRequest:presentationMode:runningContext:](self->_dialogNotificationManager, "postNotificationWithRequest:presentationMode:runningContext:", a3, a4, a5);
}

- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  char IsSpotlight;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  WFWorkflowRunCoordinator *v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  id v92;
  __int16 v93;
  void *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v11;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = 0;
      v16 = v14;
      goto LABEL_19;
    }
  }

  objc_msgSend(v13, "runSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  IsSpotlight = WFRunSourceIsSpotlight();

  if ((IsSpotlight & 1) != 0)
    goto LABEL_17;
  objc_msgSend(v13, "runSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)*MEMORY[0x1E0DC8440];
  v21 = v19;
  v22 = v20;
  if (v21 != v22)
  {
    v23 = v22;
    if (v21 && v22)
    {
      v24 = objc_msgSend(v21, "isEqualToString:", v22);

      if ((v24 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    objc_msgSend(v13, "runSource");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)*MEMORY[0x1E0DC8478];
    v21 = v25;
    v27 = v26;
    if (v21 != v27)
    {
      v28 = v27;
      if (!v21 || !v27)
      {

        v16 = 0;
        goto LABEL_60;
      }
      v29 = objc_msgSend(v21, "isEqualToString:", v27);

      v16 = 0;
      if ((v29 & 1) == 0)
        goto LABEL_60;
      goto LABEL_18;
    }
  }

LABEL_17:
  v16 = 0;
LABEL_18:
  v15 = 1;
LABEL_19:
  if ((objc_msgSend(v16, "hiddenFromLibraryAndSync") & 1) == 0)
  {
    getWFDialogLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v90 = "-[WFWorkflowRunCoordinator postNotificationAboutFailure:inWorkflow:dialogAttribution:runningContext:]";
      v91 = 2112;
      v92 = v10;
      v93 = 2112;
      v94 = v16;
      _os_log_impl(&dword_1C146A000, v30, OS_LOG_TYPE_ERROR, "%s Posting notification for error (%@) when running workflow: %@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUIDString");
    v32 = objc_claimAutoreleasedReturnValue();

    v84 = self;
    v83 = v15;
    if (v15)
    {
      v33 = (void *)MEMORY[0x1E0CEC738];
      if (v12)
      {
        objc_msgSend(v12, "appBundleIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "iconForApplicationIdentifier:", v34);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEC738], "iconForApplicationIdentifier:", *MEMORY[0x1E0DC7FD8]);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
      }
      WFLocalizedString(CFSTR("your shortcut"));
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D140A0], "proposedTemporaryFileURLForFilename:", v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "screenScale");
      objc_msgSend(v16, "attributionIconWithSize:scale:rounded:", 0, 48.0, 48.0, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "PNGRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "writeToURL:atomically:", v35, 0);

      v40 = (void *)MEMORY[0x1E0CEC738];
      objc_msgSend(v35, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "iconAtPath:", v41);
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "name");
      v42 = objc_claimAutoreleasedReturnValue();
    }
    v82 = (void *)v42;
    objc_msgSend(v10, "domain");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v13;
    v80 = v12;
    v78 = (void *)v32;
    if (objc_msgSend(v43, "isEqualToString:", *MEMORY[0x1E0DC8270]))
      v44 = objc_msgSend(v10, "code") == 3 || objc_msgSend(v10, "code") == 4;
    else
      v44 = 0;

    objc_msgSend(v10, "userInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKey:", *MEMORY[0x1E0CB2D50]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v85 = 0;
    }
    else
    {
      objc_msgSend(v10, "userInfo");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKey:", *MEMORY[0x1E0CB2D68]);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v48 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("An error occurred while running %@. (%@, %i)"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "domain");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringWithFormat:", v49, v82, v50, objc_msgSend(v10, "code"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v16, "identifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v16, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setObject:forKey:", v53, *MEMORY[0x1E0DDA030]);

    }
    objc_msgSend(v10, "userInfo");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKey:", *MEMORY[0x1E0DDA0D0]);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v51, "setObject:forKey:", v55, *MEMORY[0x1E0DDA008]);
      objc_msgSend(v10, "localizedDescription");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setObject:forKey:", v56, *MEMORY[0x1E0DDA000]);

    }
    v57 = objc_alloc_init(MEMORY[0x1E0CEC6E0]);
    objc_msgSend(v16, "attributionTitle");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_msgSend(v57, "setTitle:", v58);
    }
    else
    {
      objc_msgSend(v80, "title");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setTitle:", v59);

    }
    objc_msgSend(v57, "setIcon:", v81);
    if (objc_msgSend(v46, "length"))
      v60 = v46;
    else
      v60 = v86;
    objc_msgSend(v57, "setBody:", v60);
    objc_msgSend(v57, "setShouldBackgroundDefaultAction:", 1);
    objc_msgSend(v57, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(v57, "setUserInfo:", v51);
    if (v83)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "UUIDString");
    }
    else
    {
      v63 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "identifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "stringWithFormat:", CFSTR("workflow-error: %@"), v61);
    }
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setThreadIdentifier:", v62);

    if (!objc_msgSend(v46, "length") || (v65 = objc_msgSend(v85, "length"), v64 = v46, v65))
    {
      if (objc_msgSend(v46, "length", v64) || (v68 = objc_msgSend(v85, "length"), v64 = v85, !v68))
      {
        v66 = objc_msgSend(v46, "length");
        v64 = v86;
        if (v66)
        {
          v67 = objc_msgSend(v85, "length", v86);
          v64 = v86;
          if (v67)
          {
            objc_msgSend(v57, "setSubtitle:", v85);
            v64 = v46;
          }
        }
      }
    }
    objc_msgSend(v57, "setBody:", v64);
    v69 = (void *)objc_opt_class();
    if (v83)
      objc_msgSend(v69, "errorCategory");
    else
      objc_msgSend(v69, "errorWithActionCategory");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "identifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setCategoryIdentifier:", v71);

    v72 = (void *)MEMORY[0x1E0CEC740];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "UUIDString");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "requestWithIdentifier:content:trigger:destinations:", v74, v57, 0, 7);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFWorkflowRunCoordinator userNotificationManager](v84, "userNotificationManager");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "notificationCenter");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __101__WFWorkflowRunCoordinator_postNotificationAboutFailure_inWorkflow_dialogAttribution_runningContext___block_invoke;
    v87[3] = &unk_1E7AA7478;
    v88 = v10;
    objc_msgSend(v77, "addNotificationRequest:withCompletionHandler:", v75, v87);

    v13 = v79;
    v12 = v80;
  }
LABEL_60:

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(void);

  v22 = (void (**)(void))a5;
  objc_msgSend(a4, "notification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "errorWithActionCategory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "categoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v11, "isEqualToString:", v10);

  if ((v7 & 1) != 0)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    objc_msgSend(v12, "setScheme:", CFSTR("shortcuts"));
    objc_msgSend(v8, "categoryIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v10);

    if (v14)
    {
      objc_msgSend(v12, "setHost:", CFSTR("open-shortcut"));
      v15 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v8, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dc_queryItemsFromQueryDictionary:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setQueryItems:", v17);

    }
    v18 = (void *)MEMORY[0x1E0DD9F38];
    objc_msgSend(v12, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "requestWithURL:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DD9BF8], "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "performRequest:", v20);

    v22[2]();
  }
  else
  {
    v22[2]();
  }

}

- (WFUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (WFUIPresenter)userInterfacePresenter
{
  return self->_userInterfacePresenter;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (WFDialogNotificationManager)dialogNotificationManager
{
  return self->_dialogNotificationManager;
}

- (WFDialogPresentationManager)dialogPresentationManager
{
  return self->_dialogPresentationManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasInitializedToastManager
{
  return self->_hasInitializedToastManager;
}

- (void)setHasInitializedToastManager:(BOOL)a3
{
  self->_hasInitializedToastManager = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dialogPresentationManager, 0);
  objc_storeStrong((id *)&self->_dialogNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_userInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_toastManager, 0);
}

void __101__WFWorkflowRunCoordinator_postNotificationAboutFailure_inWorkflow_dialogAttribution_runningContext___block_invoke(uint64_t a1, void *a2)
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
      v7 = "-[WFWorkflowRunCoordinator postNotificationAboutFailure:inWorkflow:dialogAttribution:runningContext:]_block_invoke";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Unable to post error (%@) as a notification: %@", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __80__WFWorkflowRunCoordinator_toastManager_didDismissToastedSessionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  getWFWorkflowExecutionLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[WFWorkflowRunCoordinator toastManager:didDismissToastedSessionWithIdentifier:]_block_invoke";
      v11 = 2112;
      v12 = v2;
      v5 = "%s Failed to resume dialog presentation: %@";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
      v8 = 22;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[WFWorkflowRunCoordinator toastManager:didDismissToastedSessionWithIdentifier:]_block_invoke";
    v5 = "%s Resumed dialog presentation";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    v8 = 12;
    goto LABEL_6;
  }

}

void __71__WFWorkflowRunCoordinator_toastManager_didToastSessionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFWorkflowExecutionLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[WFWorkflowRunCoordinator toastManager:didToastSessionWithIdentifier:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to pause dialog presentation: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  getWFWorkflowExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = 136315394;
    v8 = "-[WFWorkflowRunCoordinator toastManager:didToastSessionWithIdentifier:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Paused dialog presentation for %@ seconds", (uint8_t *)&v7, 0x16u);
  }

}

void __83__WFWorkflowRunCoordinator_showSingleStepCompletionWithWebClipMetadata_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  objc_msgSend(a1[4], "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0DC7AA8]);
  objc_msgSend(a1[5], "shortcutIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:objectType:", v5, 0);

  objc_msgSend(v3, "recordWithDescriptor:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0DD9E78]);
  objc_msgSend(v7, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "applicationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithShortcutName:applicationBundleIdentifier:", v9, v10);

  v12 = objc_alloc(MEMORY[0x1E0DC7E80]);
  objc_msgSend(a1[5], "shortcutIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithWorkflowIdentifier:", v13);

  objc_msgSend(v14, "setRunKind:", *MEMORY[0x1E0DC8438]);
  objc_msgSend(v14, "setAllowsDialogNotifications:", 0);
  objc_msgSend(a1[4], "userInterfacePresenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__WFWorkflowRunCoordinator_showSingleStepCompletionWithWebClipMetadata_completion___block_invoke_2;
  v16[3] = &unk_1E7AA69B0;
  v17 = a1[6];
  objc_msgSend(v15, "showDialogRequest:runningContext:completionHandler:", v11, v14, v16);

}

uint64_t __83__WFWorkflowRunCoordinator_showSingleStepCompletionWithWebClipMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__WFWorkflowRunCoordinator_initWithUserNotificationManager_databaseProvider___block_invoke(uint64_t a1, void *a2)
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
  getWFGeneralLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[WFWorkflowRunCoordinator initWithUserNotificationManager:databaseProvider:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_ERROR, "%s UI presenter connection went down with error %@", (uint8_t *)&v4, 0x16u);
  }

}

+ (id)errorCategory
{
  return (id)objc_msgSend(MEMORY[0x1E0CEC720], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("WFWorkflowRunCoordinatorErrorCategory"), MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);
}

+ (id)errorWithActionCategory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEC710], "iconWithSystemImageName:", CFSTR("arrow.up.forward.app"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEC700];
  WFLocalizedString(CFSTR("Show"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithIdentifier:title:options:icon:", CFSTR("WFShow"), v4, 0, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEC720];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("WFWorkflowRunCoordinatorErrorWithActionCategory"), v7, MEMORY[0x1E0C9AA60], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (int64_t)outOfProcessWorkflowControllerPresentationModeFromVCShortcutPresentationMode:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 2;
  else
    return qword_1C1566708[a3 - 1];
}

@end
