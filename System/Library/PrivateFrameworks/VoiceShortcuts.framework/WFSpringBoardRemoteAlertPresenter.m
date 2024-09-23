@implementation WFSpringBoardRemoteAlertPresenter

- (WFSpringBoardRemoteAlertPresenter)init
{
  WFSpringBoardRemoteAlertPresenter *v2;
  uint64_t v3;
  NSXPCListener *listener;
  WFSpringBoardRemoteAlertPresenter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSpringBoardRemoteAlertPresenter;
  v2 = -[WFSpringBoardRemoteAlertPresenter init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    v5 = v2;
  }

  return v2;
}

- (BOOL)alertIsActive
{
  void *v3;
  void *v4;
  char v5;

  -[WFSpringBoardRemoteAlertPresenter activeHandle](self, "activeHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WFSpringBoardRemoteAlertPresenter activeHandle](self, "activeHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isActive");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)activateAlertInMainSceneOfApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFDialogLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v17 = 136315138;
    v18 = "-[WFSpringBoardRemoteAlertPresenter activateAlertInMainSceneOfApplicationWithBundleIdentifier:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEBUG, "%s Requesting remote alert activation", (uint8_t *)&v17, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "idiom");

  if (!objc_msgSend(v4, "length") || v7 == 1)
  {
    -[WFSpringBoardRemoteAlertPresenter activateAlertWithPresentationTarget:](self, "activateAlertWithPresentationTarget:", 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D87DB8];
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "statesForPredicate:withDescriptor:error:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && (objc_msgSend(v12, "isRunning") & 1) != 0)
    {
      objc_msgSend(v12, "process");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "pid");

      objc_msgSend(MEMORY[0x1E0D01828], "processHandleForPID:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAFA8]), "initWithTargetProcess:", v15);
      -[WFSpringBoardRemoteAlertPresenter activateAlertWithPresentationTarget:](self, "activateAlertWithPresentationTarget:", v16);

    }
    else
    {
      -[WFSpringBoardRemoteAlertPresenter activateAlertWithPresentationTarget:](self, "activateAlertWithPresentationTarget:", 0);
    }

  }
}

- (void)activateAlertWithPresentationTarget:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DAAF58];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setPresentationTarget:", v5);

  -[WFSpringBoardRemoteAlertPresenter activeHandle](self, "activeHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[WFSpringBoardRemoteAlertPresenter activeHandle](self, "activeHandle"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isActive"),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    getWFDialogLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = 136315138;
      v20 = "-[WFSpringBoardRemoteAlertPresenter activateAlertWithPresentationTarget:]";
      _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_INFO, "%s Reactivating existing remote alert", (uint8_t *)&v19, 0xCu);
    }

    -[WFSpringBoardRemoteAlertPresenter activeHandle](self, "activeHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateWithContext:", v6);

  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.shortcuts.runtime"), CFSTR("WFRemoteAlertViewController"));
    v12 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
    -[WFSpringBoardRemoteAlertPresenter listener](self, "listener");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endpoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setXpcEndpoint:", v15);

    v16 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v11, v12);
    objc_msgSend(v16, "addObserver:", self);
    objc_msgSend(v16, "activateWithContext:", v6);
    -[WFSpringBoardRemoteAlertPresenter setActiveHandle:](self, "setActiveHandle:", v16);

  }
}

- (void)deactivateAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[WFSpringBoardRemoteAlertPresenter deactivateAlert]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s Dismissing remote alert", (uint8_t *)&v6, 0xCu);
  }

  -[WFSpringBoardRemoteAlertPresenter activeConnection](self, "activeConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[WFSpringBoardRemoteAlertPresenter activeHandle](self, "activeHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[WFSpringBoardRemoteAlertPresenter remoteAlertHandleDidActivate:]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEBUG, "%s Remote alert did activate", (uint8_t *)&v4, 0xCu);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *deactivateTimer;
  NSObject *v8;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[WFSpringBoardRemoteAlertPresenter remoteAlertHandleDidDeactivate:]";
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEBUG, "%s Remote alert did deactivate", buf, 0xCu);
  }

  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);

  deactivateTimer = self->_deactivateTimer;
  self->_deactivateTimer = v6;
  v8 = v6;

  dispatch_source_set_timer(v8, 0, 0xBEBC200uLL, 0xBEBC200uLL);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __68__WFSpringBoardRemoteAlertPresenter_remoteAlertHandleDidDeactivate___block_invoke;
  handler[3] = &unk_1E7AA8300;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(v8);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  OS_dispatch_source *deactivateTimer;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  getWFDialogLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[WFSpringBoardRemoteAlertPresenter remoteAlertHandle:didInvalidateWithError:]";
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Remote alert did invalidate with error: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  -[WFSpringBoardRemoteAlertPresenter deactivateTimer](self, "deactivateTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFSpringBoardRemoteAlertPresenter deactivateTimer](self, "deactivateTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v8);

    deactivateTimer = self->_deactivateTimer;
    self->_deactivateTimer = 0;

  }
  -[WFSpringBoardRemoteAlertPresenter setActiveHandle:](self, "setActiveHandle:", 0);
  -[WFSpringBoardRemoteAlertPresenter delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dialogAlertPresenterDidInvalidateAlert:", self);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFSpringBoardRemoteAlertPresenter activeConnection](self, "activeConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getWFDialogLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFSpringBoardRemoteAlertPresenter listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Not accepting new connection since there is already an active one.", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[WFSpringBoardRemoteAlertPresenter listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEFAULT, "%s Setting activeConnection", buf, 0xCu);
    }

    -[WFSpringBoardRemoteAlertPresenter setActiveConnection:](self, "setActiveConnection:", v7);
    objc_initWeak((id *)buf, self);
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __72__WFSpringBoardRemoteAlertPresenter_listener_shouldAcceptNewConnection___block_invoke;
    v23[3] = &unk_1E7AA8328;
    objc_copyWeak(&v24, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", v23);
    v18 = v11;
    v19 = 3221225472;
    v20 = __72__WFSpringBoardRemoteAlertPresenter_listener_shouldAcceptNewConnection___block_invoke_124;
    v21 = &unk_1E7AA8328;
    objc_copyWeak(&v22, (id *)buf);
    objc_msgSend(v7, "setInterruptionHandler:", &v18);
    WFDialogXPCInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v12, v18, v19, v20, v21);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF6F5010);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v13);

    -[WFSpringBoardRemoteAlertPresenter delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedObject:", v14);

    objc_msgSend(v7, "resume");
    -[WFSpringBoardRemoteAlertPresenter delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dialogAlertPresenter:didConnectToAlert:", self, v16);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }

  return v8 == 0;
}

- (WFDialogAlertPresenterDelegate)delegate
{
  return (WFDialogAlertPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBSRemoteAlertHandle)activeHandle
{
  return self->_activeHandle;
}

- (void)setActiveHandle:(id)a3
{
  objc_storeStrong((id *)&self->_activeHandle, a3);
}

- (OS_dispatch_source)deactivateTimer
{
  return self->_deactivateTimer;
}

- (void)setDeactivateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deactivateTimer, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_deactivateTimer, 0);
  objc_storeStrong((id *)&self->_activeHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __72__WFSpringBoardRemoteAlertPresenter_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[WFSpringBoardRemoteAlertPresenter listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEBUG, "%s Connection to dialog was invalidated.", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dialogAlertPresenterDidDisconnectFromAlert:", WeakRetained);

  objc_msgSend(WeakRetained, "setActiveConnection:", 0);
  objc_msgSend(WeakRetained, "setActiveHandle:", 0);

}

void __72__WFSpringBoardRemoteAlertPresenter_listener_shouldAcceptNewConnection___block_invoke_124(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[WFSpringBoardRemoteAlertPresenter listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_ERROR, "%s Connection to dialog was interrupted", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dialogAlertPresenterDidDisconnectFromAlert:", WeakRetained);

  objc_msgSend(WeakRetained, "setActiveConnection:", 0);
  objc_msgSend(WeakRetained, "setActiveHandle:", 0);

}

void __68__WFSpringBoardRemoteAlertPresenter_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dialogAlertPresenterDidDeactivateAlert:", *(_QWORD *)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

}

@end
