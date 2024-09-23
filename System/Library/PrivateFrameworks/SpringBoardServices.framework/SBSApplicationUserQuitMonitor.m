@implementation SBSApplicationUserQuitMonitor

void __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBSApplicationUserQuitMonitorSessionSpecification serviceQuality](SBSApplicationUserQuitMonitorSessionSpecification, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v3);

  +[SBSApplicationUserQuitMonitorSessionSpecification interface](SBSApplicationUserQuitMonitorSessionSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_48);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_7_0);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_9_0);

}

uint64_t __50__SBSApplicationUserQuitMonitor_initWithDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_setupAndActivate");
}

- (void)_connectionQueue_setupAndActivate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BSServiceConnection *v7;
  BSServiceConnection *connection;
  BSServiceConnection *v9;
  NSObject *v10;
  BSServiceConnection *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  BSServiceConnection *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSApplicationUserQuitMonitorSessionSpecification identifier](SBSApplicationUserQuitMonitorSessionSpecification, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointForMachName:service:instance:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
  v7 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v7;

  v9 = self->_connection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke;
  v12[3] = &unk_1E288CF30;
  v12[4] = self;
  -[BSServiceConnection configureConnection:](v9, "configureConnection:", v12);
  SBLogAppQuitMonitor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self->_connection;
    *(_DWORD *)buf = 138543362;
    v14 = v11;
    _os_log_impl(&dword_18EB52000, v10, OS_LOG_TYPE_INFO, "Activating Connection: %{public}@", buf, 0xCu);
  }

  -[BSServiceConnection activate](self->_connection, "activate");
}

void __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogAppQuitMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (SBSApplicationUserQuitMonitor)initWithDelegate:(id)a3
{
  id v4;
  SBSApplicationUserQuitMonitor *v5;
  SBSApplicationUserQuitMonitor *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *connectionQueue;
  NSObject *v10;
  _QWORD block[4];
  SBSApplicationUserQuitMonitor *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBSApplicationUserQuitMonitor;
  v5 = -[SBSApplicationUserQuitMonitor init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSDispatchQueueCreate();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

    v10 = v6->_connectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SBSApplicationUserQuitMonitor_initWithDelegate___block_invoke;
    block[3] = &unk_1E288DFC0;
    v13 = v6;
    dispatch_async(v10, block);

  }
  return v6;
}

- (void)invalidate
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SBSApplicationUserQuitMonitor_invalidate__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

uint64_t __43__SBSApplicationUserQuitMonitor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_invalidate");
}

- (void)userClosedLastSceneOfApplicationWithBundleID:(id)a3
{
  SBSApplicationUserQuitMonitorDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "quitMonitor:userClosedLastSceneOfApplicationWithBundleID:", self, v5);

}

void __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogAppQuitMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __66__SBSApplicationUserQuitMonitor__connectionQueue_setupAndActivate__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogAppQuitMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "Received invalidation for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_connectionQueue_invalidate
{
  NSObject *v3;
  BSServiceConnection *connection;
  BSServiceConnection *v5;
  int v6;
  BSServiceConnection *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogAppQuitMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    v6 = 138543362;
    v7 = connection;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "Invalidating Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v5 = self->_connection;
  self->_connection = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

@end
