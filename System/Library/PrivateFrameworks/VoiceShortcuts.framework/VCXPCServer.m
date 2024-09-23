@implementation VCXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v6;
  VCXPCServer *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  VCVoiceShortcutManagerAccessWrapper *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  VCVoiceShortcutManagerAccessWrapper *v24;
  NSObject *v25;
  _OWORD v27[2];
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  VCXPCServer *v36;
  __int16 v37;
  NSObject *v38;
  __int16 v39;
  VCXPCServer *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (VCXPCServer *)a4;
  getWFGeneralLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v34 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
    v35 = 2114;
    v36 = self;
    v37 = 2114;
    v38 = v6;
    v39 = 2114;
    v40 = v7;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEBUG, "%s -[%{public}@ listener:%{public}@ shouldAcceptNewConnection:%{public}@]", buf, 0x2Au);
  }

  -[VCXPCServer voiceShortcutManager](self, "voiceShortcutManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    getWFGeneralLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_ERROR, "%s Rejecting connection because database is inaccessible", buf, 0xCu);
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0DC7928], "accessSpecifierForXPCConnection:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  if (-[VCXPCServer skipEntitlementsCheck](self, "skipEntitlementsCheck"))
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
      v35 = 2114;
      v36 = v7;
      _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEBUG, "%s Skipping entitlement check for connection %{public}@ for testing", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0DC7928], "accessSpecifierUnrestricted");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = v12;
  }
  v13 = -[NSObject allowConnection](v10, "allowConnection");
  getWFGeneralLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
      v35 = 2114;
      v36 = v7;
      v37 = 2114;
      v38 = v10;
      _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_ERROR, "%s Rejecting connection %{public}@ because it has insufficient privileges: %{public}@", buf, 0x20u);
    }

LABEL_18:
    v23 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v34 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
    v35 = 2114;
    v36 = v7;
    v37 = 2114;
    v38 = v10;
    _os_log_impl(&dword_1C146A000, v15, OS_LOG_TYPE_INFO, "%s Accepting connection %{public}@ with access %{public}@", buf, 0x20u);
  }

  objc_initWeak(&location, v7);
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __50__VCXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  v30[3] = &unk_1E7AA8328;
  objc_copyWeak(&v31, &location);
  -[VCXPCServer setInterruptionHandler:](v7, "setInterruptionHandler:", v30);
  v28[0] = v16;
  v28[1] = 3221225472;
  v28[2] = __50__VCXPCServer_listener_shouldAcceptNewConnection___block_invoke_124;
  v28[3] = &unk_1E7AA8328;
  objc_copyWeak(&v29, &location);
  -[VCXPCServer setInvalidationHandler:](v7, "setInvalidationHandler:", v28);
  -[VCXPCServer setDelegate:](v7, "setDelegate:", self);
  -[VCXPCServer xpcInterface](self, "xpcInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCXPCServer setExportedInterface:](v7, "setExportedInterface:", v17);

  v18 = [VCVoiceShortcutManagerAccessWrapper alloc];
  -[VCXPCServer triggerRegistrar](self, "triggerRegistrar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCXPCServer syncCoordinator](self, "syncCoordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCXPCServer syncDataEndpoint](self, "syncDataEndpoint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCXPCServer runCoordinator](self, "runCoordinator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[VCXPCServer auditToken](v7, "auditToken");
  else
    memset(v27, 0, sizeof(v27));
  v24 = -[VCVoiceShortcutManagerAccessWrapper initWithVoiceShortcutManager:triggerRegistrar:accessSpecifier:syncCoordinator:syncDataEndpoint:runCoordinator:auditToken:](v18, "initWithVoiceShortcutManager:triggerRegistrar:accessSpecifier:syncCoordinator:syncDataEndpoint:runCoordinator:auditToken:", v9, v19, v10, v20, v21, v22, v27);
  -[VCXPCServer setExportedObject:](v7, "setExportedObject:", v24);

  -[VCXPCServer resume](v7, "resume");
  getWFGeneralLogObject();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
    v35 = 2114;
    v36 = v7;
    _os_log_impl(&dword_1C146A000, v25, OS_LOG_TYPE_DEBUG, "%s Resumed connection %{public}@", buf, 0x16u);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  v23 = 1;
LABEL_23:

  return v23;
}

- (VCVoiceShortcutManager)voiceShortcutManager
{
  VCVoiceShortcutManager *voiceShortcutManager;
  void *v4;
  VCVoiceShortcutManager *v5;
  void *v6;
  void *v7;
  void *v8;
  VCVoiceShortcutManager *v9;
  VCVoiceShortcutManager *v10;

  voiceShortcutManager = self->_voiceShortcutManager;
  if (!voiceShortcutManager)
  {
    -[VCXPCServer databaseProvider](self, "databaseProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [VCVoiceShortcutManager alloc];
      -[VCXPCServer eventHandler](self, "eventHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCXPCServer appShortcutsUpdater](self, "appShortcutsUpdater");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VCXPCServer contextualActionSyncService](self, "contextualActionSyncService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[VCVoiceShortcutManager initWithDatabaseProvider:eventHandler:appShortcutsUpdater:contextualActionSyncService:](v5, "initWithDatabaseProvider:eventHandler:appShortcutsUpdater:contextualActionSyncService:", v4, v6, v7, v8);
      v10 = self->_voiceShortcutManager;
      self->_voiceShortcutManager = v9;

    }
    voiceShortcutManager = self->_voiceShortcutManager;
  }
  return voiceShortcutManager;
}

- (WFTriggerRegistrar)triggerRegistrar
{
  return self->_triggerRegistrar;
}

- (VCSyncDataEndpoint)syncDataEndpoint
{
  return self->_syncDataEndpoint;
}

- (VCCKShortcutSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (BOOL)skipEntitlementsCheck
{
  return self->_skipEntitlementsCheck;
}

- (WFWorkflowRunCoordinator)runCoordinator
{
  return self->_runCoordinator;
}

- (VCXPCServer)initWithDatabaseProvider:(id)a3 triggerRegistrar:(id)a4 syncCoordinator:(id)a5 syncDataEndpoint:(id)a6 runCoordinator:(id)a7 eventHandler:(id)a8 appShortcutsUpdater:(id)a9 contextualActionSyncService:(id)a10
{
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  VCXPCServer *v28;

  v17 = (objc_class *)MEMORY[0x1E0CB3B58];
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v26 = [v17 alloc];
  v27 = (void *)objc_msgSend(v26, "initWithMachServiceName:", *MEMORY[0x1E0DC8050]);
  v28 = -[VCXPCServer initWithXPCListener:databaseProvider:triggerRegistrar:syncCoordinator:syncDataEndpoint:runCoordinator:eventHandler:appShortcutsUpdater:contextualActionSyncService:](self, "initWithXPCListener:databaseProvider:triggerRegistrar:syncCoordinator:syncDataEndpoint:runCoordinator:eventHandler:appShortcutsUpdater:contextualActionSyncService:", v27, v25, v24, v23, v22, v21, v20, v19, v18);

  return v28;
}

- (VCXPCServer)initWithUnsecuredAnonymousListenerAndDatabaseProvider:(id)a3
{
  id v4;
  void *v5;
  WFWorkflowRunCoordinator *v6;
  WFTriggerRegistrar *v7;
  void *v8;
  VCXPCServer *v9;
  VCXPCServer *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[WFWorkflowRunCoordinator initWithUserNotificationManager:databaseProvider:]([WFWorkflowRunCoordinator alloc], "initWithUserNotificationManager:databaseProvider:", v5, v4);
  v7 = -[WFTriggerRegistrar initWithDatabaseProvider:eventHandler:userNotificationManager:]([WFTriggerRegistrar alloc], "initWithDatabaseProvider:eventHandler:userNotificationManager:", v4, 0, v5);
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[VCXPCServer initWithXPCListener:databaseProvider:triggerRegistrar:syncCoordinator:syncDataEndpoint:runCoordinator:eventHandler:appShortcutsUpdater:contextualActionSyncService:](self, "initWithXPCListener:databaseProvider:triggerRegistrar:syncCoordinator:syncDataEndpoint:runCoordinator:eventHandler:appShortcutsUpdater:contextualActionSyncService:", v8, v4, v7, 0, 0, v6, 0, 0, 0);

  if (v9)
  {
    v9->_skipEntitlementsCheck = 1;
    v10 = v9;
  }

  return v9;
}

- (VCXPCServer)initWithXPCListener:(id)a3 databaseProvider:(id)a4 triggerRegistrar:(id)a5 syncCoordinator:(id)a6 syncDataEndpoint:(id)a7 runCoordinator:(id)a8 eventHandler:(id)a9 appShortcutsUpdater:(id)a10 contextualActionSyncService:(id)a11
{
  id v17;
  id v18;
  id v19;
  VCXPCServer *v20;
  id v21;
  id v22;
  id v23;
  VCXPCServer *v24;
  uint64_t v25;
  NSXPCInterface *xpcInterface;
  VCXPCServer *v27;
  void *v29;
  void *v30;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;

  v17 = a3;
  v33 = a4;
  v18 = a4;
  v34 = a5;
  v19 = a5;
  v20 = self;
  v40 = v19;
  v35 = a6;
  v39 = a6;
  v36 = a7;
  v38 = a7;
  v37 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("VCXPCServer.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("xpcListener"));

    if (v18)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("VCXPCServer.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

LABEL_3:
  v41.receiver = v20;
  v41.super_class = (Class)VCXPCServer;
  v24 = -[VCXPCServer init](&v41, sel_init);
  if (v24)
  {
    VCDaemonXPCInterface();
    v25 = objc_claimAutoreleasedReturnValue();
    xpcInterface = v24->_xpcInterface;
    v24->_xpcInterface = (NSXPCInterface *)v25;

    objc_storeStrong((id *)&v24->_xpcListener, a3);
    -[NSXPCListener setDelegate:](v24->_xpcListener, "setDelegate:", v24);
    objc_storeStrong((id *)&v24->_databaseProvider, v33);
    objc_storeStrong((id *)&v24->_triggerRegistrar, v34);
    objc_storeStrong((id *)&v24->_syncCoordinator, v35);
    objc_storeStrong((id *)&v24->_syncDataEndpoint, v36);
    objc_storeStrong((id *)&v24->_runCoordinator, a8);
    objc_storeStrong((id *)&v24->_eventHandler, a9);
    objc_storeStrong((id *)&v24->_appShortcutsUpdater, a10);
    objc_storeStrong((id *)&v24->_contextualActionSyncService, a11);
    -[NSXPCListener resume](v24->_xpcListener, "resume");
    v27 = v24;
  }

  return v24;
}

- (NSXPCListenerEndpoint)endpoint
{
  void *v2;
  void *v3;

  -[VCXPCServer xpcListener](self, "xpcListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (NSXPCInterface)xpcInterface
{
  return self->_xpcInterface;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (WFTopHitsAppShortcutsUpdater)appShortcutsUpdater
{
  return self->_appShortcutsUpdater;
}

- (WFContextualActionSpotlightSyncService)contextualActionSyncService
{
  return self->_contextualActionSyncService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualActionSyncService, 0);
  objc_storeStrong((id *)&self->_appShortcutsUpdater, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_syncDataEndpoint, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_runCoordinator, 0);
  objc_storeStrong((id *)&self->_triggerRegistrar, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_storeStrong((id *)&self->_voiceShortcutManager, 0);
}

void __50__VCXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFGeneralLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 136315394;
    v4 = "-[VCXPCServer listener:shouldAcceptNewConnection:]_block_invoke";
    v5 = 2114;
    v6 = WeakRetained;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Connection %{public}@ was interrupted", (uint8_t *)&v3, 0x16u);
  }

}

void __50__VCXPCServer_listener_shouldAcceptNewConnection___block_invoke_124(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  getWFGeneralLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = 136315394;
    v4 = "-[VCXPCServer listener:shouldAcceptNewConnection:]_block_invoke";
    v5 = 2114;
    v6 = WeakRetained;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Connection %{public}@ was invalidated", (uint8_t *)&v3, 0x16u);
  }

}

@end
