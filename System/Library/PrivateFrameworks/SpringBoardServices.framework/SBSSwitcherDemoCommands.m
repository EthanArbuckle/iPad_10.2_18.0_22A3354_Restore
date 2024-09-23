@implementation SBSSwitcherDemoCommands

- (SBSSwitcherDemoCommands)init
{
  SBSSwitcherDemoCommands *v2;
  void *v3;
  uint64_t v4;
  OS_dispatch_queue *connectionQueue;
  NSObject *v6;
  _QWORD block[4];
  SBSSwitcherDemoCommands *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSSwitcherDemoCommands;
  v2 = -[SBSSwitcherDemoCommands init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = BSDispatchQueueCreate();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_connectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__SBSSwitcherDemoCommands_init__block_invoke;
    block[3] = &unk_1E288DFC0;
    v9 = v2;
    dispatch_sync(v6, block);

  }
  return v2;
}

uint64_t __31__SBSSwitcherDemoCommands_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_setupAndActivate");
}

- (void)invalidate
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SBSSwitcherDemoCommands_invalidate__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

uint64_t __37__SBSSwitcherDemoCommands_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_invalidate");
}

- (BOOL)stashSwitcherModelToPath:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SBSSwitcherDemoCommands_stashSwitcherModelToPath___block_invoke;
  block[3] = &unk_1E288FEF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(connectionQueue, block);
  LOBYTE(connectionQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connectionQueue;
}

void __52__SBSSwitcherDemoCommands_stashSwitcherModelToPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_standardizedAbsolutePathForPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "stashSwitcherModelToPath:", v2);

}

- (BOOL)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SBSSwitcherDemoCommands_loadStashedSwitcherModelFromPath___block_invoke;
  block[3] = &unk_1E288FEF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(connectionQueue, block);
  LOBYTE(connectionQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connectionQueue;
}

void __60__SBSSwitcherDemoCommands_loadStashedSwitcherModelFromPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_standardizedAbsolutePathForPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "loadStashedSwitcherModelFromPath:", v2);

}

- (BOOL)setShouldDisableSwitcherModelUpdates:(BOOL)a3
{
  NSObject *connectionQueue;
  char v4;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBSSwitcherDemoCommands_setShouldDisableSwitcherModelUpdates___block_invoke;
  block[3] = &unk_1E288FF20;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(connectionQueue, block);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __64__SBSSwitcherDemoCommands_setShouldDisableSwitcherModelUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "setShouldDisableSwitcherModelUpdates:", v2);

}

- (BOOL)updateHiddenApplicationBundleIDs:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SBSSwitcherDemoCommands_updateHiddenApplicationBundleIDs___block_invoke;
  block[3] = &unk_1E288FEF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(connectionQueue, block);
  LOBYTE(connectionQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connectionQueue;
}

void __60__SBSSwitcherDemoCommands_updateHiddenApplicationBundleIDs___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 16), "remoteTarget");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "updateHiddenApplicationBundleIDs:", a1[5]);

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
  +[SBSSwitcherDemoCommandsSessionSpecification identifier](SBSSwitcherDemoCommandsSessionSpecification, "identifier");
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
  v12[2] = __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke;
  v12[3] = &unk_1E288CF30;
  v12[4] = self;
  -[BSServiceConnection configureConnection:](v9, "configureConnection:", v12);
  SBLogCommon();
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

void __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBSSwitcherDemoCommandsSessionSpecification serviceQuality](SBSSwitcherDemoCommandsSessionSpecification, "serviceQuality");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v3);

  +[SBSSwitcherDemoCommandsSessionSpecification interface](SBSSwitcherDemoCommandsSessionSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_50);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_8_1);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_10_0);

}

void __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __60__SBSSwitcherDemoCommands__connectionQueue_setupAndActivate__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCommon();
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
  SBLogCommon();
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

}

- (id)_standardizedAbsolutePathForPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isAbsolutePath"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDirectoryPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "stringByStandardizingPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

@end
