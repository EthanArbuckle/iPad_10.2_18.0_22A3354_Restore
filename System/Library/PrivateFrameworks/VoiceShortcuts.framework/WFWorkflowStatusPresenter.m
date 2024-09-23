@implementation WFWorkflowStatusPresenter

- (WFWorkflowStatusPresenter)init
{
  WFWorkflowStatusPresenter *v2;
  NSXPCListener *v3;
  NSXPCListener *listener;
  NSXPCListener *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  WFWorkflowStatusPresenter *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFWorkflowStatusPresenter;
  v2 = -[WFWorkflowStatusPresenter init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    -[NSXPCListener setDelegate:](v3, "setDelegate:", v2);
    -[NSXPCListener resume](v3, "resume");
    listener = v2->_listener;
    v2->_listener = v3;
    v5 = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INITIATED, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.shortcuts.WFStatusPresenter-queue", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    v10 = v2;
  }

  return v2;
}

- (BOOL)alertIsLaunching
{
  WFWorkflowStatusPresenter *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[WFWorkflowStatusPresenter queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[WFWorkflowStatusPresenter queue](v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__WFWorkflowStatusPresenter_alertIsLaunching__block_invoke;
  v6[3] = &unk_1E7AA8288;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (BOOL)alertIsActive
{
  WFWorkflowStatusPresenter *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  -[WFWorkflowStatusPresenter queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[WFWorkflowStatusPresenter queue](v2, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__WFWorkflowStatusPresenter_alertIsActive__block_invoke;
  v6[3] = &unk_1E7AA8288;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (void)activateAlertInMainSceneOfApplicationWithBundleIdentifier:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[WFWorkflowStatusPresenter queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)deactivateAlert
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  getWFDialogLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[WFWorkflowStatusPresenter deactivateAlert]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEFAULT, "%s Deactivating alert", buf, 0xCu);
  }

  -[WFWorkflowStatusPresenter queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__WFWorkflowStatusPresenter_deactivateAlert__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  -[WFWorkflowStatusPresenter queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[WFWorkflowStatusPresenter queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E7AA8350;
  v13 = v7;
  v14 = &v15;
  block[4] = self;
  v10 = v7;
  dispatch_sync(v9, block);

  LOBYTE(v7) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v7;
}

- (WFDialogAlertPresenterDelegate)delegate
{
  return (WFDialogAlertPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFWorkflowStatusPresenterDelegate)statusPresenterDelegate
{
  return (WFWorkflowStatusPresenterDelegate *)objc_loadWeakRetained((id *)&self->_statusPresenterDelegate);
}

- (void)setStatusPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_statusPresenterDelegate, a3);
}

- (BOOL)isLaunching
{
  return self->_launching;
}

- (void)setLaunching:(BOOL)a3
{
  self->_launching = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
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
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_statusPresenterDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  BOOL v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setLaunching:", 0);
  objc_msgSend(*(id *)(a1 + 32), "activeConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  getWFDialogLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFWorkflowStatusPresenter listener:shouldAcceptNewConnection:]_block_invoke";
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_DEFAULT, "%s Accepting incoming connection as active: %@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setActiveConnection:", *(_QWORD *)(a1 + 40));
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_112;
    v19[3] = &unk_1E7AA8328;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(*(id *)(a1 + 40), "setInvalidationHandler:", v19);
    v14 = v8;
    v15 = 3221225472;
    v16 = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_2;
    v17 = &unk_1E7AA8328;
    objc_copyWeak(&v18, (id *)buf);
    objc_msgSend(*(id *)(a1 + 40), "setInterruptionHandler:", &v14);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF716E10, v14, v15, v16, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setRemoteObjectInterface:", v9);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF6F52C0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setExportedInterface:", v10);

    objc_msgSend(*(id *)(a1 + 32), "statusPresenterDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", v11);

    objc_msgSend(*(id *)(a1 + 40), "resume");
    objc_msgSend(*(id *)(a1 + 32), "statusPresenterDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "remoteObjectProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "statusPresenterDidConnectToService:", v13);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "activeConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFWorkflowStatusPresenter listener:shouldAcceptNewConnection:]_block_invoke";
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_ERROR, "%s Not accepting new connections while one is already active: %@", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_112(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[WFWorkflowStatusPresenter listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_DEBUG, "%s Connection to view service application was invalidated.", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_113;
  block[3] = &unk_1E7AA8300;
  block[4] = WeakRetained;
  dispatch_async(v3, block);

}

void __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFDialogLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[WFWorkflowStatusPresenter listener:shouldAcceptNewConnection:]_block_invoke_2";
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_ERROR, "%s Connection to view service application was interrupted", buf, 0xCu);
  }

  objc_msgSend(WeakRetained, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_114;
  block[3] = &unk_1E7AA8300;
  block[4] = WeakRetained;
  dispatch_async(v3, block);

}

uint64_t __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_114(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusPresenterDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusPresenterDidDisconnect");

  return objc_msgSend(*(id *)(a1 + 32), "setActiveConnection:", 0);
}

uint64_t __64__WFWorkflowStatusPresenter_listener_shouldAcceptNewConnection___block_invoke_113(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusPresenterDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusPresenterDidDisconnect");

  return objc_msgSend(*(id *)(a1 + 32), "setActiveConnection:", 0);
}

uint64_t __44__WFWorkflowStatusPresenter_deactivateAlert__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "activeConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setActiveConnection:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setLaunching:", 0);
}

void __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setLaunching:", 1);
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forSetting:", v5, 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01698]), "initWithInfo:responder:", v2, 0);
  v7 = (void *)MEMORY[0x1E0D23158];
  v8 = *MEMORY[0x1E0D22D00];
  v9 = MEMORY[0x1E0C9AAB0];
  v19[0] = MEMORY[0x1E0C9AAB0];
  v10 = *MEMORY[0x1E0D22CE0];
  v18[0] = v8;
  v18[1] = v10;
  v17 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = *MEMORY[0x1E0DAB8A8];
  v19[1] = v11;
  v19[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optionsWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0DC7F80];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke_2;
  v16[3] = &unk_1E7AA82D8;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v14, "openApplication:withOptions:completion:", v15, v13, v16);

}

void __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke_3;
  block[3] = &unk_1E7AA82B0;
  v11 = v5;
  v12 = v6;
  v13 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

}

uint64_t __87__WFWorkflowStatusPresenter_activateAlertInMainSceneOfApplicationWithBundleIdentifier___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(result + 32))
  {
    v1 = result;
    getWFDialogLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      v3 = *(_QWORD *)(v1 + 40);
      v4 = 136315394;
      v5 = "-[WFWorkflowStatusPresenter activateAlertInMainSceneOfApplicationWithBundleIdentifier:]_block_invoke_3";
      v6 = 2112;
      v7 = v3;
      _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_FAULT, "%s Unable to launch View Service application, error: %@", (uint8_t *)&v4, 0x16u);
    }

    return objc_msgSend(*(id *)(v1 + 48), "setLaunching:", 0);
  }
  return result;
}

void __42__WFWorkflowStatusPresenter_alertIsActive__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "activeConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 != 0;

}

uint64_t __45__WFWorkflowStatusPresenter_alertIsLaunching__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isLaunching");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
