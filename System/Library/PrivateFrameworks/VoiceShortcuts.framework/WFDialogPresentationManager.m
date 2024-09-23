@implementation WFDialogPresentationManager

- (WFDialogPresentationManager)initWithNotificationManager:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  WFSpringBoardRemoteAlertPresenter *v7;
  id v8;
  WFDialogPresentationManager *v9;
  WFDialogPresentationManager *v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3B58];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:", CFSTR("com.apple.shortcuts.dialogpresentation"));
  v7 = objc_alloc_init(WFSpringBoardRemoteAlertPresenter);
  v8 = objc_alloc_init(MEMORY[0x1E0DD9E40]);
  v9 = -[WFDialogPresentationManager initWithListener:notificationManager:dialogAlertPresenter:screenOnObserver:](self, "initWithListener:notificationManager:dialogAlertPresenter:screenOnObserver:", v6, v5, v7, v8);

  v10 = v9;
  objc_msgSend(v6, "resume");

  return v10;
}

- (WFDialogPresentationManager)initWithListener:(id)a3 notificationManager:(id)a4 dialogAlertPresenter:(id)a5 screenOnObserver:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFDialogPresentationManager *v15;
  void *v16;
  WFDialogAlertPresenter *statusPresenter;
  uint64_t v18;
  NSMutableArray *contextsAwaitingStatusPresentation;
  uint64_t v20;
  NSMutableArray *attributionsAwaitingStatusPresentation;
  uint64_t v22;
  NSMutableSet *connectedRunners;
  NSObject *v24;
  NSObject *v25;
  dispatch_queue_t v26;
  OS_dispatch_queue *queue;
  uint64_t v28;
  NSMutableArray *persistentPresentationQueue;
  uint64_t v30;
  NSMutableArray *otherPresentationQueue;
  uint64_t v32;
  NSMutableArray *contentDismissalCompletionHandlers;
  WFDialogPresentationManager *v34;
  id v36;
  objc_super v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)WFDialogPresentationManager;
  v15 = -[WFDialogPresentationManager init](&v37, sel_init);
  if (v15)
  {
    objc_msgSend(v13, "setDelegate:", v15);
    objc_storeStrong((id *)&v15->_remoteAlertPresenter, a5);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setStatusPresenterDelegate:", v15);
    statusPresenter = v15->_statusPresenter;
    v15->_statusPresenter = (WFDialogAlertPresenter *)v16;
    v36 = v16;

    v18 = objc_opt_new();
    contextsAwaitingStatusPresentation = v15->_contextsAwaitingStatusPresentation;
    v15->_contextsAwaitingStatusPresentation = (NSMutableArray *)v18;

    v20 = objc_opt_new();
    attributionsAwaitingStatusPresentation = v15->_attributionsAwaitingStatusPresentation;
    v15->_attributionsAwaitingStatusPresentation = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v15->_listener, a3);
    -[NSXPCListener setDelegate:](v15->_listener, "setDelegate:", v15);
    v22 = objc_opt_new();
    connectedRunners = v15->_connectedRunners;
    v15->_connectedRunners = (NSMutableSet *)v22;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_USER_INITIATED, 0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = dispatch_queue_create("com.apple.shortcuts.WFDialogPresentationManager", v25);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v26;

    v28 = objc_opt_new();
    persistentPresentationQueue = v15->_persistentPresentationQueue;
    v15->_persistentPresentationQueue = (NSMutableArray *)v28;

    v30 = objc_opt_new();
    otherPresentationQueue = v15->_otherPresentationQueue;
    v15->_otherPresentationQueue = (NSMutableArray *)v30;

    v32 = objc_opt_new();
    contentDismissalCompletionHandlers = v15->_contentDismissalCompletionHandlers;
    v15->_contentDismissalCompletionHandlers = (NSMutableArray *)v32;

    objc_storeStrong((id *)&v15->_notificationManager, a4);
    objc_storeStrong((id *)&v15->_screenOnObserver, a6);
    -[WFScreenOnObserver setDelegate:](v15->_screenOnObserver, "setDelegate:", v15);
    -[WFScreenOnObserver start](v15->_screenOnObserver, "start");

    v34 = v15;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[WFScreenOnObserver stop](self->_screenOnObserver, "stop");
  v3.receiver = self;
  v3.super_class = (Class)WFDialogPresentationManager;
  -[WFDialogPresentationManager dealloc](&v3, sel_dealloc);
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFDialogPresentationManager notificationManager](self, "notificationManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleRemovedIgnoredNotifications:", v4);

}

- (void)queue_connectedRemoteAlertDidDisconnect
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  getWFDialogLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFDialogPresentationManager queue_connectedRemoteAlertDidDisconnect]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Connected remote alert did disconnect", buf, 0xCu);
  }

  -[WFDialogPresentationManager setConnectedRemoteAlert:](self, "setConnectedRemoteAlert:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[WFDialogPresentationManager contentDismissalCompletionHandlers](self, "contentDismissalCompletionHandlers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (v10)
          (*(void (**)(void))(v10 + 16))();
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)queue_hasMoreDialogsToPresent
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFDialogPresentationManager persistentRunningContext](self, "persistentRunningContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[WFDialogPresentationManager persistentPresentationQueue](self, "persistentPresentationQueue");
  else
    -[WFDialogPresentationManager otherPresentationQueue](self, "otherPresentationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6 != 0;
}

- (BOOL)hasPersistentState
{
  WFDialogPresentationManager *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[WFDialogPresentationManager queue](v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__WFDialogPresentationManager_hasPersistentState__block_invoke;
  v6[3] = &unk_1E7AA8288;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  WFDialogPresentationManager *v18;
  id v19;
  id v20;
  SEL v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[WFDialogPresentationManager queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__WFDialogPresentationManager_showDialogRequest_runningContext_completionHandler___block_invoke;
  block[3] = &unk_1E7AA7650;
  v20 = v11;
  v21 = a2;
  v17 = v10;
  v18 = self;
  v19 = v9;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_async(v12, block);

}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[WFDialogPresentationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke;
  v8[3] = &unk_1E7AA77A8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)queue_presentNextDialog
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFDialogPresentationManager persistentRunningContext](self, "persistentRunningContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  getWFDialogLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Dequeueing dialog from transient queue.", buf, 0xCu);
    }

    -[WFDialogPresentationManager otherPresentationQueue](self, "otherPresentationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_INFO, "%s Dequeueing dialog from persistent queue.", buf, 0xCu);
    }

    -[WFDialogPresentationManager persistentPresentationQueue](self, "persistentPresentationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (objc_msgSend(v8, "count"))
  {
    -[WFDialogPresentationManager connectedRemoteAlert](self, "connectedRemoteAlert");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[WFDialogPresentationManager presentedDialog](self, "presentedDialog");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(v9, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectAtIndex:", 0);
        getWFDialogLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "request");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
          v25 = 2112;
          v26 = v18;
          _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_DEFAULT, "%s Asking connected dialog to show request: %@", buf, 0x16u);

        }
        -[WFDialogPresentationManager setPresentedDialog:](self, "setPresentedDialog:", v16);
        objc_initWeak((id *)buf, self);
        objc_msgSend(v16, "request");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __54__WFDialogPresentationManager_queue_presentNextDialog__block_invoke;
        v20[3] = &unk_1E7AA6548;
        objc_copyWeak(&v22, (id *)buf);
        v12 = v16;
        v21 = v12;
        -[NSObject showDialogRequest:completionHandler:](v10, "showDialogRequest:completionHandler:", v19, v20);

        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
        goto LABEL_21;
      }
      getWFDialogLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
        v13 = "%s Attempted to present a dialog while another dialog is still visible. Ignoring.";
        v14 = v12;
        v15 = OS_LOG_TYPE_ERROR;
LABEL_17:
        _os_log_impl(&dword_1C146A000, v14, v15, v13, buf, 0xCu);
      }
    }
    else
    {
      getWFDialogLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
        v13 = "%s Unable to present any dialogs, since the UI process is not connected";
        v14 = v12;
        v15 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_17;
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  getWFDialogLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Presentation queue is empty, so not presenting any dialogs.", buf, 0xCu);
  }
LABEL_22:

}

- (void)queue_deactivateRemoteAlertAndInvalidateConnection
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  getWFDialogLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[WFDialogPresentationManager queue_deactivateRemoteAlertAndInvalidateConnection]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Deactivating remote alert, and invalidating the XPC connection.", (uint8_t *)&v6, 0xCu);
  }

  -[WFDialogPresentationManager queue_connectedRemoteAlertDidDisconnect](self, "queue_connectedRemoteAlertDidDisconnect");
  -[WFDialogPresentationManager remoteAlertPresenter](self, "remoteAlertPresenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivateAlert");

}

- (void)queue_clearPersistentModeStateIfNecessary
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFDialogPresentationManager persistentRunningContext](self, "persistentRunningContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[WFDialogPresentationManager persistentRunningAttribution](self, "persistentRunningAttribution");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
  }
  getWFDialogLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[WFDialogPresentationManager persistentRunningContext](self, "persistentRunningContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[WFDialogPresentationManager queue_clearPersistentModeStateIfNecessary]";
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Clearing persistent state (%@)", (uint8_t *)&v9, 0x16u);

  }
  -[WFDialogPresentationManager setPersistentRunningContext:](self, "setPersistentRunningContext:", 0);
  -[WFDialogPresentationManager setPersistentRunningAttribution:](self, "setPersistentRunningAttribution:", 0);
  -[WFDialogPresentationManager persistentPresentationQueue](self, "persistentPresentationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)activateRemoteAlert
{
  -[WFDialogPresentationManager activateRemoteAlertTiedToBundleIdentifier:](self, "activateRemoteAlertTiedToBundleIdentifier:", 0);
}

- (void)activateRemoteAlertTiedToBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFDialogPresentationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WFDialogPresentationManager_activateRemoteAlertTiedToBundleIdentifier___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)activateStatusPresenter
{
  NSObject *v3;
  _QWORD block[5];

  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WFDialogPresentationManager_activateStatusPresenter__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  WFDialogPresentationManager *v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  -[WFDialogPresentationManager queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__WFDialogPresentationManager_postNotificationWithRequest_presentationMode_context___block_invoke;
  v13[3] = &unk_1E7AA6590;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v13;
  WFDialogPresentationManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  -[WFDialogPresentationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[WFDialogPresentationManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E7AA8350;
  v14 = self;
  v15 = &v16;
  v13 = v7;
  v10 = v7;
  dispatch_sync(v9, block);

  LOBYTE(v7) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v7;
}

- (void)beginConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__WFDialogPresentationManager_beginConnection__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)requestDismissalWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFDialogPresentationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__WFDialogPresentationManager_requestDismissalWithReason___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)cancelWorkflow
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[WFDialogPresentationManager presentedDialog](self, "presentedDialog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[WFDialogPresentationManager connectedRunners](self, "connectedRunners", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "remoteObjectProxy");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "presenterRequestedWorkflowStopForContext:", v4);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)dialogAlertPresenter:(id)a3 didConnectToAlert:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[WFDialogPresentationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__WFDialogPresentationManager_dialogAlertPresenter_didConnectToAlert___block_invoke;
  v8[3] = &unk_1E7AA8138;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)dialogAlertPresenterDidDisconnectFromAlert:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[WFDialogPresentationManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WFDialogPresentationManager_dialogAlertPresenterDidDisconnectFromAlert___block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)dialogAlertPresenterDidDeactivateAlert:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[WFDialogPresentationManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WFDialogPresentationManager_dialogAlertPresenterDidDeactivateAlert___block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)dialogAlertPresenterDidInvalidateAlert:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[WFDialogPresentationManager queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WFDialogPresentationManager_dialogAlertPresenterDidInvalidateAlert___block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)workflowStatusHostBeginConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WFDialogPresentationManager_workflowStatusHostBeginConnection__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)statusPresenterDidConnectToService:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFDialogPresentationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__WFDialogPresentationManager_statusPresenterDidConnectToService___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)statusPresenterDidDisconnect
{
  NSObject *v3;
  _QWORD block[5];

  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__WFDialogPresentationManager_statusPresenterDidDisconnect__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)acquireStatusPresenterAssertionIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  -[WFDialogPresentationManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WFDialogPresentationManager_acquireStatusPresenterAssertionIfNecessary__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFDialogPresentationManager *v10;

  v5 = a3;
  -[WFDialogPresentationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__WFDialogPresentationManager_assertion_didInvalidateWithError___block_invoke;
  v8[3] = &unk_1E7AA8138;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (BOOL)shouldShowStatus
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSystemAperture");

  return v3;
}

- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFDialogPresentationManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __99__WFDialogPresentationManager_beginPersistentModeWithRunningContext_attribution_completionHandler___block_invoke;
  v15[3] = &unk_1E7AA7558;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  -[WFDialogPresentationManager queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__WFDialogPresentationManager_completePersistentModeWithSuccess_runningContext_completion___block_invoke;
  block[3] = &unk_1E7AA8110;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)dismissPersistentChromeInDialog:(id)a3 success:(BOOL)a4 customAttribution:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a4;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__WFDialogPresentationManager_dismissPersistentChromeInDialog_success_customAttribution_completionHandler___block_invoke;
  v12[3] = &unk_1E7AA77A8;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a3, "dismissPersistentChromeWithSuccess:customAttribution:completionHandler:", v7, a5, v12);

}

- (void)screenOnStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WFDialogPresentationManager *v9;

  v4 = a3;
  -[WFDialogPresentationManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WFDialogPresentationManager_screenOnStateDidChange___block_invoke;
  v7[3] = &unk_1E7AA8138;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)trackSuspendShortcutWithPresentedDialog:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0DD9EA0];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v8, "setKey:", CFSTR("SuspendShortcutEvent"));
  objc_msgSend(v5, "presentationMode");

  WFStringForDialogPresentationMode();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPresentationStyle:", v6);

  -[WFDialogPresentationManager dismissalReason](self, "dismissalReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDismissalType:", v7);

  objc_msgSend(v8, "track");
}

- (void)logStartDialogPresentationWithRequest:(id)a3 presentationMode:(unint64_t)a4
{
  -[WFDialogPresentationManager trackDialogEventWithKey:request:presentationMode:automationType:](self, "trackDialogEventWithKey:request:presentationMode:automationType:", CFSTR("ShowDialogStart"), a3, a4, 0);
}

- (void)logFinishDialogPresentationWithPresentedDialog:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "request");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "presentationMode");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "automationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogPresentationManager trackDialogEventWithKey:request:presentationMode:automationType:](self, "trackDialogEventWithKey:request:presentationMode:automationType:", CFSTR("ShowDialogFinish"), v8, v5, v7);

}

- (void)logFinishDialogPresentationWithRequest:(id)a3 presentationMode:(unint64_t)a4 automationType:(id)a5
{
  -[WFDialogPresentationManager trackDialogEventWithKey:request:presentationMode:automationType:](self, "trackDialogEventWithKey:request:presentationMode:automationType:", CFSTR("ShowDialogFinish"), a3, a4, a5);
}

- (void)trackDialogEventWithKey:(id)a3 request:(id)a4 presentationMode:(unint64_t)a5 automationType:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v9 = (objc_class *)MEMORY[0x1E0DD9E70];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v17 = objc_alloc_init(v9);
  objc_msgSend(v17, "setKey:", v12);

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDialogType:", v14);

  WFStringForDialogPresentationMode();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPresentationStyle:", v15);

  -[WFDialogPresentationManager dismissalReason](self, "dismissalReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDismissalType:", v16);

  objc_msgSend(v17, "setAutomationType:", v10);
  objc_msgSend(v17, "track");

}

- (WFDialogPresentationManagerDelegate)delegate
{
  return (WFDialogPresentationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSMutableSet)connectedRunners
{
  return self->_connectedRunners;
}

- (WFDialogAlertPresenter)remoteAlertPresenter
{
  return self->_remoteAlertPresenter;
}

- (WFDialogXPCProtocol)connectedRemoteAlert
{
  return self->_connectedRemoteAlert;
}

- (void)setConnectedRemoteAlert:(id)a3
{
  objc_storeStrong((id *)&self->_connectedRemoteAlert, a3);
}

- (WFDialogAlertPresenter)statusPresenter
{
  return self->_statusPresenter;
}

- (WFWorkflowStatusProtocol)connectedStatusPresenter
{
  return self->_connectedStatusPresenter;
}

- (void)setConnectedStatusPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_connectedStatusPresenter, a3);
}

- (RBSAssertion)statusPresenterAssertion
{
  return self->_statusPresenterAssertion;
}

- (void)setStatusPresenterAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_statusPresenterAssertion, a3);
}

- (WFPresentedDialog)presentedDialog
{
  return self->_presentedDialog;
}

- (void)setPresentedDialog:(id)a3
{
  objc_storeStrong((id *)&self->_presentedDialog, a3);
}

- (NSMutableArray)contentDismissalCompletionHandlers
{
  return self->_contentDismissalCompletionHandlers;
}

- (NSMutableArray)contextsAwaitingStatusPresentation
{
  return self->_contextsAwaitingStatusPresentation;
}

- (NSMutableArray)attributionsAwaitingStatusPresentation
{
  return self->_attributionsAwaitingStatusPresentation;
}

- (WFWorkflowRunningContext)persistentRunningContext
{
  return self->_persistentRunningContext;
}

- (void)setPersistentRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_persistentRunningContext, a3);
}

- (WFDialogAttribution)persistentRunningAttribution
{
  return self->_persistentRunningAttribution;
}

- (void)setPersistentRunningAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_persistentRunningAttribution, a3);
}

- (NSMutableArray)persistentPresentationQueue
{
  return self->_persistentPresentationQueue;
}

- (NSMutableArray)otherPresentationQueue
{
  return self->_otherPresentationQueue;
}

- (WFDialogNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (WFScreenOnObserver)screenOnObserver
{
  return self->_screenOnObserver;
}

- (BOOL)completePersistentModeAwaitingRemoteAlertReactivationSuccess
{
  return self->_completePersistentModeAwaitingRemoteAlertReactivationSuccess;
}

- (void)setCompletePersistentModeAwaitingRemoteAlertReactivationSuccess:(BOOL)a3
{
  self->_completePersistentModeAwaitingRemoteAlertReactivationSuccess = a3;
}

- (id)completePersistentModeBlockAwaitingRemoteAlertReactivation
{
  return self->_completePersistentModeBlockAwaitingRemoteAlertReactivation;
}

- (void)setCompletePersistentModeBlockAwaitingRemoteAlertReactivation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (void)setDismissalReason:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalReason, 0);
  objc_storeStrong(&self->_completePersistentModeBlockAwaitingRemoteAlertReactivation, 0);
  objc_storeStrong((id *)&self->_screenOnObserver, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_otherPresentationQueue, 0);
  objc_storeStrong((id *)&self->_persistentPresentationQueue, 0);
  objc_storeStrong((id *)&self->_persistentRunningAttribution, 0);
  objc_storeStrong((id *)&self->_persistentRunningContext, 0);
  objc_storeStrong((id *)&self->_attributionsAwaitingStatusPresentation, 0);
  objc_storeStrong((id *)&self->_contextsAwaitingStatusPresentation, 0);
  objc_storeStrong((id *)&self->_contentDismissalCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_presentedDialog, 0);
  objc_storeStrong((id *)&self->_statusPresenterAssertion, 0);
  objc_storeStrong((id *)&self->_connectedStatusPresenter, 0);
  objc_storeStrong((id *)&self->_statusPresenter, 0);
  objc_storeStrong((id *)&self->_connectedRemoteAlert, 0);
  objc_storeStrong((id *)&self->_remoteAlertPresenter, 0);
  objc_storeStrong((id *)&self->_connectedRunners, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __54__WFDialogPresentationManager_screenOnStateDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "screenOn") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "persistentRunningContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      objc_msgSend(*(id *)(a1 + 40), "queue_clearPersistentModeStateIfNecessary");
  }
  objc_msgSend(*(id *)(a1 + 40), "remoteAlertPresenter");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "alertIsActive") & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 40), "presentedDialog"), (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v5 = objc_msgSend(*(id *)(a1 + 32), "screenOn");

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "queue_clearPersistentModeStateIfNecessary");
      objc_msgSend(*(id *)(a1 + 40), "presentedDialog");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "presentedDialog");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "allowsDialogNotifications");

      if ((v9 & 1) != 0)
      {
        getWFDialogLogObject();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[WFDialogPresentationManager screenOnStateDidChange:]_block_invoke";
          _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Converting presented dialog into a notification, since the screen locked.", buf, 0xCu);
        }

        v11 = *(void **)(a1 + 40);
        objc_msgSend(v6, "request");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v6, "presentationMode");
        objc_msgSend(v6, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postNotificationWithRequest:presentationMode:context:", v12, v13, v14);

        objc_msgSend(*(id *)(a1 + 40), "queue_deactivateRemoteAlertAndInvalidateConnection");
        v15 = *(void **)(a1 + 40);
        objc_msgSend(v15, "presentedDialog");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "trackSuspendShortcutWithPresentedDialog:", v16);

      }
      else
      {
        objc_msgSend(v6, "context");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isShortcutsApp");

        if ((v18 & 1) != 0)
        {
          v19 = 3;
        }
        else
        {
          objc_msgSend(v6, "context");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "allowsDialogNotifications");

          if (v21)
            v19 = 0;
          else
            v19 = 2;
        }
        objc_msgSend(*(id *)(a1 + 40), "presentedDialog");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "completionHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(*(id *)(a1 + 40), "presentedDialog");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "completionHandler");
          v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithResponseCode:", v19);
          ((void (**)(_QWORD, void *))v25)[2](v25, v26);

        }
        objc_msgSend(*(id *)(a1 + 40), "setPresentedDialog:", 0);
        objc_msgSend(*(id *)(a1 + 40), "queue_deactivateRemoteAlertAndInvalidateConnection");
      }

    }
  }
  else
  {

  }
}

void __107__WFDialogPresentationManager_dismissPersistentChromeInDialog_success_customAttribution_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __107__WFDialogPresentationManager_dismissPersistentChromeInDialog_success_customAttribution_completionHandler___block_invoke_2;
  v4[3] = &unk_1E7AA77A8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

uint64_t __107__WFDialogPresentationManager_dismissPersistentChromeInDialog_success_customAttribution_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[WFDialogPresentationManager dismissPersistentChromeInDialog:success:customAttribution:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Finished dismissing chrome after persistent mode completed", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "persistentPresentationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4 = objc_msgSend(*(id *)(a1 + 32), "queue_hasMoreDialogsToPresent");
  v5 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v5, "queue_presentNextDialog");
  else
    objc_msgSend(v5, "queue_deactivateRemoteAlertAndInvalidateConnection");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __91__WFDialogPresentationManager_completePersistentModeWithSuccess_runningContext_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[WFDialogPresentationManager completePersistentModeWithSuccess:runningContext:completion:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Completing persistent mode", (uint8_t *)&v11, 0xCu);
  }

  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldShowStatus");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "connectedStatusPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "acquireStatusPresenterAssertionIfNecessary");
      objc_msgSend(*(id *)(a1 + 32), "connectedStatusPresenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "workflowStatusWorkflowDidFinishWithSuccess:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));

    }
    objc_msgSend(*(id *)(a1 + 32), "queue_clearPersistentModeStateIfNecessary");
  }
  else
  {
    objc_msgSend(v4, "persistentRunningAttribution");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "queue_clearPersistentModeStateIfNecessary");
    objc_msgSend(*(id *)(a1 + 32), "connectedRemoteAlert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "connectedRemoteAlert");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissPersistentChromeInDialog:success:customAttribution:completionHandler:", v10, objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), v7, *(_QWORD *)(a1 + 48));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setPersistentRunningAttribution:", v7);
      objc_msgSend(*(id *)(a1 + 32), "setCompletePersistentModeBlockAwaitingRemoteAlertReactivation:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "setCompletePersistentModeAwaitingRemoteAlertReactivationSuccess:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
      objc_msgSend(*(id *)(a1 + 32), "activateRemoteAlert");
    }

  }
}

void __99__WFDialogPresentationManager_beginPersistentModeWithRunningContext_attribution_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "shouldShowStatus");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "statusPresenter");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(*(id *)(a1 + 32), "statusPresenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "alertIsActive"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "statusPresenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "alertIsLaunching");

        if ((v15 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "contextsAwaitingStatusPresentation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", *(_QWORD *)(a1 + 40));

          objc_msgSend(*(id *)(a1 + 32), "attributionsAwaitingStatusPresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", *(_QWORD *)(a1 + 48));

          objc_msgSend(*(id *)(a1 + 32), "activateStatusPresenter");
          goto LABEL_24;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "statusPresenter");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(*(id *)(a1 + 32), "statusPresenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "alertIsActive"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "statusPresenter");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "alertIsLaunching");

        if (v20)
        {
          objc_msgSend(*(id *)(a1 + 32), "contextsAwaitingStatusPresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", *(_QWORD *)(a1 + 40));

          objc_msgSend(*(id *)(a1 + 32), "attributionsAwaitingStatusPresentation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", *(_QWORD *)(a1 + 48));
          goto LABEL_22;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "connectedStatusPresenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
LABEL_24:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "acquireStatusPresenterAssertionIfNecessary");
    objc_msgSend(*(id *)(a1 + 32), "connectedStatusPresenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "workflowStatusWorkflowWillBeginRunningWithAttribution:context:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
LABEL_22:

    goto LABEL_24;
  }
  objc_msgSend(v3, "persistentRunningContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPersistentRunningContext:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setPersistentRunningAttribution:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "remoteAlertPresenter");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(*(id *)(a1 + 32), "remoteAlertPresenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "alertIsActive");

      if ((v12 & 1) == 0)
      {
        getWFDialogLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 136315138;
          v27 = "-[WFDialogPresentationManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
          _os_log_impl(&dword_1C146A000, v13, OS_LOG_TYPE_DEFAULT, "%s Activating remote alert in persistent mode, because workflow started running", (uint8_t *)&v26, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "activateRemoteAlert");
      }
    }
    goto LABEL_24;
  }
  getWFXPCRunnerLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    v26 = 136315138;
    v27 = "-[WFDialogPresentationManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_FAULT, "%s Already showing persistent UI. Running multiple shortcuts in persistent mode, concurrently, is not supported. This should've been caught in the run coordinator before starting the shortcut run, this shortcut won't run properly.", (uint8_t *)&v26, 0xCu);
  }

}

uint64_t __64__WFDialogPresentationManager_assertion_didInvalidateWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "setStatusPresenterAssertion:", 0);
}

void __73__WFDialogPresentationManager_acquireStatusPresenterAssertionIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "statusPresenterAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  if ((v3 & 1) == 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CA5850]);
    v5 = *MEMORY[0x1E0DC7F80];
    v17 = 0;
    v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:allowPlaceholder:personaUniqueString:error:", v5, 0, &stru_1E7AA8740, &v17);
    v7 = v17;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D87D80], "identityForLSApplicationIdentity:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithProcessIdentity:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0D87C98]);
      objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.shortcuts"), CFSTR("RunningBackground"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithExplanation:target:attributes:", CFSTR("Shortcuts Status"), v9, v12);

      objc_msgSend(v13, "addObserver:", *(_QWORD *)(a1 + 32));
      v16 = 0;
      LOBYTE(v12) = objc_msgSend(v13, "acquireWithError:", &v16);
      v14 = v16;

      if ((v12 & 1) == 0)
      {
        getWFDialogLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[WFDialogPresentationManager acquireStatusPresenterAssertionIfNecessary]_block_invoke";
          v21 = 2112;
          v22 = v14;
          _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Failed to acquire assertion for view service to present status: error: %@", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "setStatusPresenterAssertion:", v13);

    }
    else
    {
      getWFDialogLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[WFDialogPresentationManager acquireStatusPresenterAssertionIfNecessary]_block_invoke";
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to find identity for view service, bailing assertion acquiring: %@", buf, 0x16u);
      }
      v14 = v7;
    }

  }
}

void __59__WFDialogPresentationManager_statusPresenterDidDisconnect__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusPresenterAssertion");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

uint64_t __66__WFDialogPresentationManager_statusPresenterDidConnectToService___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "acquireStatusPresenterAssertionIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "setConnectedStatusPresenter:", *(_QWORD *)(a1 + 40));
}

void __64__WFDialogPresentationManager_workflowStatusHostBeginConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "contextsAwaitingStatusPresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "attributionsAwaitingStatusPresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "contextsAwaitingStatusPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "contextsAwaitingStatusPresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "attributionsAwaitingStatusPresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "connectedStatusPresenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "workflowStatusWorkflowWillBeginRunningWithAttribution:context:", v11, v9);

      ++v7;
      objc_msgSend(*(id *)(a1 + 32), "contextsAwaitingStatusPresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v7 < v14);
  }
  objc_msgSend(*(id *)(a1 + 32), "contextsAwaitingStatusPresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "attributionsAwaitingStatusPresentation");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

}

void __70__WFDialogPresentationManager_dialogAlertPresenterDidInvalidateAlert___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dismissalReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "setDismissalReason:", *MEMORY[0x1E0DC83E8]);
  objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "screenOnObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "screenOn");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "response");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      getWFDialogLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          v16 = 136315138;
          v17 = "-[WFDialogPresentationManager dialogAlertPresenterDidInvalidateAlert:]_block_invoke";
          _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s Cancelling workflow execution, since the remote alert was invalidated and the screen is still on", (uint8_t *)&v16, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "cancelWorkflow");
      }
      else
      {
        if (v9)
        {
          v16 = 136315138;
          v17 = "-[WFDialogPresentationManager dialogAlertPresenterDidInvalidateAlert:]_block_invoke";
          _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s Sending cancelled dialog response, since the remote alert was invalidated and the screen is still on", (uint8_t *)&v16, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "completionHandler");
        v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithCancelled:", 1);
        ((void (**)(_QWORD, void *))v11)[2](v11, v12);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setPresentedDialog:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "remoteAlertPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deactivateAlert");

  objc_msgSend(*(id *)(a1 + 32), "queue_connectedRemoteAlertDidDisconnect");
  if (objc_msgSend(*(id *)(a1 + 32), "queue_hasMoreDialogsToPresent"))
  {
    objc_msgSend(*(id *)(a1 + 32), "screenOnObserver");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "screenOn");

    if (v15)
      objc_msgSend(*(id *)(a1 + 32), "activateRemoteAlert");
  }
}

uint64_t __70__WFDialogPresentationManager_dialogAlertPresenterDidDeactivateAlert___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  int v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsDialogNotifications");

  objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "queue_clearPersistentModeStateIfNecessary");
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "presentedDialog");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "presentationMode");
      objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationWithRequest:presentationMode:context:", v9, v11, v13);

      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "presentedDialog");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "trackSuspendShortcutWithPresentedDialog:", v15);

    }
    getWFDialogLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315138;
      v26 = "-[WFDialogPresentationManager dialogAlertPresenterDidDeactivateAlert:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_DEFAULT, "%s dialogAlertPresenterDidDeactivateAlert", (uint8_t *)&v25, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v5, "response");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      getWFDialogLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 136315138;
        v26 = "-[WFDialogPresentationManager dialogAlertPresenterDidDeactivateAlert:]_block_invoke";
        _os_log_impl(&dword_1C146A000, v18, OS_LOG_TYPE_DEFAULT, "%s Cancelling workflow execution, since the remote alert was deactivated and we already sent a response", (uint8_t *)&v25, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "cancelWorkflow");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "completionHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "completionHandler");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithResponseCode:", 3);
        ((void (**)(_QWORD, void *))v22)[2](v22, v23);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setPresentedDialog:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "queue_deactivateRemoteAlertAndInvalidateConnection");
}

uint64_t __74__WFDialogPresentationManager_dialogAlertPresenterDidDisconnectFromAlert___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    getWFDialogLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[WFDialogPresentationManager dialogAlertPresenterDidDisconnectFromAlert:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_ERROR, "%s Connection unexpectedly invalidated while a dialog was presented. Sending a cancelled response.", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithResponseCode:", 1);
    ((void (**)(_QWORD, void *))v5)[2](v5, v6);

    objc_msgSend(*(id *)(a1 + 32), "setPresentedDialog:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "queue_connectedRemoteAlertDidDisconnect");
}

uint64_t __70__WFDialogPresentationManager_dialogAlertPresenter_didConnectToAlert___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setConnectedRemoteAlert:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__WFDialogPresentationManager_requestDismissalWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  if (v3)
    v5 = v3;
  else
    v5 = *MEMORY[0x1E0DC83F0];
  objc_msgSend(v2, "setDismissalReason:", v5);
  objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    getWFDialogLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[WFDialogPresentationManager requestDismissalWithReason:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Sending cancelled dialog response, since user cancelled the dialog", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "presentedDialog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v10, "cancelWorkflow");
    }
    else
    {
      objc_msgSend(v10, "presentedDialog");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "completionHandler");
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7AF0]), "initWithCancelled:", 1);
      ((void (**)(_QWORD, void *))v12)[2](v12, v13);

      objc_msgSend(*(id *)(a1 + 32), "setPresentedDialog:", 0);
    }
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "queue_hasMoreDialogsToPresent");
  getWFDialogLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v18 = 136315138;
      v19 = "-[WFDialogPresentationManager requestDismissalWithReason:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s Presenting another dialog, even though the user cancelled the current one, since it's likely from another shortcut.", (uint8_t *)&v18, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "queue_presentNextDialog");
  }
  else
  {
    if (v16)
    {
      v18 = 136315138;
      v19 = "-[WFDialogPresentationManager requestDismissalWithReason:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_DEFAULT, "%s Dismissing the dialog, since the user cancelled.", (uint8_t *)&v18, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "queue_deactivateRemoteAlertAndInvalidateConnection");
  }
}

void __46__WFDialogPresentationManager_beginConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "completePersistentModeBlockAwaitingRemoteAlertReactivation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = objc_msgSend(v3, "completePersistentModeAwaitingRemoteAlertReactivationSuccess");
    objc_msgSend(*(id *)(a1 + 32), "completePersistentModeBlockAwaitingRemoteAlertReactivation");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCompletePersistentModeBlockAwaitingRemoteAlertReactivation:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setCompletePersistentModeAwaitingRemoteAlertReactivationSuccess:", 0);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "persistentRunningContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completePersistentModeWithSuccess:runningContext:completion:", v6, v7, v12);

  }
  else
  {
    objc_msgSend(v3, "persistentRunningContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "connectedRemoteAlert");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "persistentRunningContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "persistentRunningAttribution");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preparePersistentChromeWithContext:attribution:", v10, v11);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "queue_hasMoreDialogsToPresent"))
      objc_msgSend(*(id *)(a1 + 32), "queue_presentNextDialog");
  }
}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "valueForEntitlement:", CFSTR("com.apple.shortcuts.dialogpresentation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  getWFDialogLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[WFDialogPresentationManager listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Received incoming XPC connection", buf, 0xCu);
    }

    WFUIPresenterXPCInterface();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExportedInterface:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", *(_QWORD *)(a1 + 40));
    WFUIPresenterHostXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectInterface:", v7);

    v8 = *(id *)(a1 + 32);
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_143;
    v19[3] = &unk_1E7AA65B8;
    objc_copyWeak(&v21, (id *)buf);
    v10 = v8;
    v20 = v10;
    objc_msgSend(*(id *)(a1 + 32), "setInterruptionHandler:", v19);
    v13 = v9;
    v14 = 3221225472;
    v15 = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_2;
    v16 = &unk_1E7AA65B8;
    objc_copyWeak(&v18, (id *)buf);
    v11 = v10;
    v17 = v11;
    objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", &v13);
    objc_msgSend(*(id *)(a1 + 32), "resume", v13, v14, v15, v16);
    objc_msgSend(*(id *)(a1 + 40), "connectedRunners");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 32));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[WFDialogPresentationManager listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Rejecting incoming connection, since it is missing the com.apple.shortcuts.dialogpresentation entitlement", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_143(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  getWFDialogLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WFDialogPresentationManager listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_ERROR, "%s XPC connection interrupted", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_144;
  v5[3] = &unk_1E7AA8138;
  v5[4] = WeakRetained;
  v6 = *(id *)(a1 + 32);
  dispatch_sync(v4, v5);

}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  getWFDialogLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[WFDialogPresentationManager listener:shouldAcceptNewConnection:]_block_invoke_2";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_ERROR, "%s XPC connection invalidated", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_145;
  v5[3] = &unk_1E7AA8138;
  v5[4] = WeakRetained;
  v6 = *(id *)(a1 + 32);
  dispatch_sync(v4, v5);

}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_145(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connectedRunners");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_144(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connectedRunners");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __84__WFDialogPresentationManager_postNotificationWithRequest_presentationMode_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v19 = "-[WFDialogPresentationManager postNotificationWithRequest:presentationMode:context:]_block_invoke";
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Posting notification for dialog request: %@", buf, 0x16u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "connectedRunners", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "remoteObjectProxy");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "presenterRequestedWorkflowPauseForContext:dialogRequest:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), &__block_literal_global_1692);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    if (*(_QWORD *)(a1 + 56) >= 3uLL)
      v10 = 3;
    else
      v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "notificationManager");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationWithRequest:presentationMode:runningContext:](v11, "postNotificationWithRequest:presentationMode:runningContext:", *(_QWORD *)(a1 + 32), v10, *(_QWORD *)(a1 + 40));
  }
  else
  {
    getWFDialogLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v19 = "-[WFDialogPresentationManager postNotificationWithRequest:presentationMode:context:]_block_invoke";
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_FAULT, "%s Attempting to post notification for request: %@ with no running context", buf, 0x16u);
    }
  }

}

void __54__WFDialogPresentationManager_activateStatusPresenter__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "statusPresenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activateAlertInMainSceneOfApplicationWithBundleIdentifier:", 0);

}

void __73__WFDialogPresentationManager_activateRemoteAlertTiedToBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "screenOnObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screenOn");

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteAlertPresenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateAlertInMainSceneOfApplicationWithBundleIdentifier:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    getWFDialogLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[WFDialogPresentationManager activateRemoteAlertTiedToBundleIdentifier:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEFAULT, "%s Attempting to activate remote alert while the display is off, ignoring request", buf, 0xCu);
    }

  }
}

void __54__WFDialogPresentationManager_queue_presentNextDialog__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WFDialogPresentationManager_queue_presentNextDialog__block_invoke_2;
  block[3] = &unk_1E7AA82B0;
  v8 = v3;
  v9 = WeakRetained;
  v10 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v5, block);

}

void __54__WFDialogPresentationManager_queue_presentNextDialog__block_invoke_2(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v12 = 136315394;
    v13 = "-[WFDialogPresentationManager queue_presentNextDialog]_block_invoke_2";
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEFAULT, "%s Received response from presented dialog: %@", (uint8_t *)&v12, 0x16u);
  }

  if (objc_msgSend(a1[4], "shouldDismissDialogInTransientMode"))
  {
    objc_msgSend(a1[5], "setPresentedDialog:", 0);
  }
  else
  {
    v4 = a1[4];
    objc_msgSend(a1[5], "presentedDialog");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResponse:", v4);

  }
  objc_msgSend(a1[6], "completionHandler");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v6)[2](v6, a1[4]);

  objc_msgSend(a1[5], "persistentPresentationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {

LABEL_9:
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[WFDialogPresentationManager queue_presentNextDialog]_block_invoke";
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s There are more dialogs to present, so presenting the next one.", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(a1[5], "queue_presentNextDialog");
    return;
  }
  objc_msgSend(a1[5], "otherPresentationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    goto LABEL_9;
  if ((objc_msgSend(a1[4], "isCancelled") & 1) != 0)
    goto LABEL_14;
  objc_msgSend(a1[5], "persistentRunningContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    return;
  }
  if (objc_msgSend(a1[4], "shouldDismissDialogInTransientMode"))
LABEL_14:
    objc_msgSend(a1[5], "queue_deactivateRemoteAlertAndInvalidateConnection");
}

void __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD aBlock[5];
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "presentedDialog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logFinishDialogPresentationWithPresentedDialog:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setPresentedDialog:", 0);
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E7AA77A8;
  v5 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "connectedRemoteAlert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectedRemoteAlert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_3;
    v12[3] = &unk_1E7AA8300;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "dismissPresentedContentWithCompletionHandler:", v12);

    objc_msgSend(*(id *)(a1 + 32), "contentDismissalCompletionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "copy");
    v11 = _Block_copy(v10);
    objc_msgSend(v9, "addObject:", v11);

  }
  else
  {
    v6[2](v6);
  }

}

void __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationManager:dismissPresentedContentWithCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_4;
  block[3] = &unk_1E7AA8300;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "persistentRunningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "queue_deactivateRemoteAlertAndInvalidateConnection");
  objc_msgSend(*(id *)(a1 + 32), "contentDismissalCompletionHandlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    objc_msgSend(*(id *)(a1 + 32), "contentDismissalCompletionHandlers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectAtIndex:", 0);

    v4 = v6;
  }

}

void __82__WFDialogPresentationManager_showDialogRequest_runningContext_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  WFPresentedDialog *v20;
  uint64_t v21;
  id v22;
  WFPresentedDialog *v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  NSObject *v36;
  char isKindOfClass;
  void *v38;
  char v39;
  NSObject *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  int8x16_t v51;
  _QWORD v52[4];
  id v53;
  int8x16_t v54;
  id v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("WFDialogPresentationManager.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  objc_msgSend(*(id *)(a1 + 40), "persistentRunningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 32));

  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "setDismissalReason:", 0);
  objc_msgSend(*(id *)(a1 + 40), "logStartDialogPresentationWithRequest:presentationMode:", *(_QWORD *)(a1 + 48), v3);
  if (objc_msgSend(*(id *)(a1 + 32), "allowsDialogNotifications")
    && (objc_msgSend(*(id *)(a1 + 40), "screenOnObserver"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "screenOn"),
        v5,
        (v6 & 1) == 0))
  {
    getWFDialogLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_DEFAULT, "%s Screen is off, so posting dialog request as a notification.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setDismissalReason:", *MEMORY[0x1E0DC83E0]);
    objc_msgSend(*(id *)(a1 + 40), "logFinishDialogPresentationWithRequest:presentationMode:automationType:", *(_QWORD *)(a1 + 48), v4, 0);
    objc_msgSend(*(id *)(a1 + 40), "postNotificationWithRequest:presentationMode:context:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = *(id *)(a1 + 48);
    if (v4)
    {
      v8 = *(id *)(a1 + 48);
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "textFieldConfiguration");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)objc_msgSend(v9, "copy");

          objc_msgSend(v10, "setFocusImmediatelyWhenPresented:", 1);
          v11 = objc_alloc(MEMORY[0x1E0DC7B98]);
          objc_msgSend(v8, "message");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "attribution");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "prompt");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "parameterKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v11, "initWithTextFieldConfiguration:message:attribution:prompt:parameterKey:", v10, v12, v13, v14, v15);

          v7 = (id)v16;
        }
        else
        {
          v10 = v8;
          v8 = 0;
        }
      }
      else
      {
        v10 = 0;
      }

      v18 = *(id *)(a1 + 48);
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v18, "requestBySettingFocusImmediatelyWhenPresented:", 1);
          v19 = objc_claimAutoreleasedReturnValue();

          v7 = (id)v19;
        }
      }

    }
    v20 = [WFPresentedDialog alloc];
    v21 = *(_QWORD *)(a1 + 32);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __82__WFDialogPresentationManager_showDialogRequest_runningContext_completionHandler___block_invoke_130;
    v52[3] = &unk_1E7AA6520;
    v53 = *(id *)(a1 + 48);
    v51 = *(int8x16_t *)(a1 + 32);
    v22 = (id)v51.i64[0];
    v54 = vextq_s8(v51, v51, 8uLL);
    v55 = *(id *)(a1 + 56);
    v23 = -[WFPresentedDialog initWithRequest:presentationMode:runningContext:completionHandler:](v20, "initWithRequest:presentationMode:runningContext:completionHandler:", v7, v4, v21, v52);
    getWFDialogLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v25)
      {
        v26 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke_2";
        v58 = 2112;
        v59 = v26;
        _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_DEFAULT, "%s Adding %@ to persistent presentation queue.", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "persistentPresentationQueue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v25)
      {
        v28 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
        v58 = 2112;
        v59 = v28;
        _os_log_impl(&dword_1C146A000, v24, OS_LOG_TYPE_DEFAULT, "%s Adding %@ to transient presentation queue.", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "otherPresentationQueue");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v27;
    objc_msgSend(v27, "addObject:", v23);

    objc_msgSend(*(id *)(a1 + 40), "remoteAlertPresenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(*(id *)(a1 + 40), "presentedDialog");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = (void *)v31;
        objc_msgSend(*(id *)(a1 + 40), "presentedDialog");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "response");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "shouldDismissDialogInTransientMode");

        if ((v35 & 1) == 0)
        {
          getWFDialogLogObject();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
            _os_log_impl(&dword_1C146A000, v36, OS_LOG_TYPE_DEFAULT, "%s There's a presented dialog. We are ignoring it and moving on because the presented dialog already has a response and shouldDismissDialogInTransientMode was NO, which means it was likely just waiting for a followup.", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 40), "setPresentedDialog:", 0);
        }
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(*(id *)(a1 + 40), "remoteAlertPresenter");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "alertIsActive");

      if ((v39 & 1) == 0)
      {
        getWFDialogLogObject();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
          _os_log_impl(&dword_1C146A000, v40, OS_LOG_TYPE_INFO, "%s No remote alert is active, so activating one.", buf, 0xCu);
        }

        if ((isKindOfClass & 1) != 0)
        {
          v41 = *(id *)(a1 + 48);
          if (v41)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v42 = v41;
            else
              v42 = 0;
          }
          else
          {
            v42 = 0;
          }
          v43 = v42;

          objc_msgSend(v43, "applicationBundleIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "activateRemoteAlertTiedToBundleIdentifier:", v44);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "activateRemoteAlert");
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "connectedRemoteAlert");
      v45 = objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v46 = (void *)v45;
        objc_msgSend(*(id *)(a1 + 40), "presentedDialog");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {

        }
        else
        {
          v48 = objc_msgSend(*(id *)(a1 + 40), "queue_hasMoreDialogsToPresent");

          if (v48)
          {
            getWFDialogLogObject();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
              _os_log_impl(&dword_1C146A000, v49, OS_LOG_TYPE_INFO, "%s There is a connected remote alert, so asking it to present a dialog.", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 40), "queue_presentNextDialog");
          }
        }
      }
    }

  }
}

void __82__WFDialogPresentationManager_showDialogRequest_runningContext_completionHandler___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v17 = v3;
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v17;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v6 && v8)
  {
    objc_msgSend(v6, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workflowReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v8, "promptedStatesData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "actionUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "presentationManager:updateSmartPromptStateData:actionUUID:context:reference:", v14, v15, v16, *(_QWORD *)(a1 + 48), v10);

      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __49__WFDialogPresentationManager_hasPersistentState__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistentRunningContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

@end
