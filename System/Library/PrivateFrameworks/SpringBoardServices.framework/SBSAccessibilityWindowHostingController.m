@implementation SBSAccessibilityWindowHostingController

- (SBSAccessibilityWindowHostingController)init
{
  SBSAccessibilityWindowHostingController *v2;
  uint64_t Serial;
  OS_dispatch_queue *connectionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSAccessibilityWindowHostingController;
  v2 = -[SBSAccessibilityWindowHostingController init](&v6, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)Serial;

  }
  return v2;
}

- (void)registerWindowWithContextID:(unsigned int)a3 atLevel:(double)a4
{
  NSObject *connectionQueue;
  _QWORD block[6];
  unsigned int v6;

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SBSAccessibilityWindowHostingController_registerWindowWithContextID_atLevel___block_invoke;
  block[3] = &unk_1E288E520;
  block[4] = self;
  *(double *)&block[5] = a4;
  v6 = a3;
  dispatch_sync(connectionQueue, block);
}

void __79__SBSAccessibilityWindowHostingController_registerWindowWithContextID_atLevel___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_connection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerWindowWithContextID:atLevel:", v9, v10);

}

- (void)unregisterWindowWithContextID:(unsigned int)a3
{
  NSObject *connectionQueue;
  _QWORD v4[5];
  unsigned int v5;

  connectionQueue = self->_connectionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__SBSAccessibilityWindowHostingController_unregisterWindowWithContextID___block_invoke;
  v4[3] = &unk_1E288E548;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(connectionQueue, v4);
}

void __73__SBSAccessibilityWindowHostingController_unregisterWindowWithContextID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_connection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterWindowWithContextID:", v7);

}

- (void)invalidate
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SBSAccessibilityWindowHostingController_invalidate__block_invoke;
  block[3] = &unk_1E288DFC0;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __53__SBSAccessibilityWindowHostingController_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = 0;

}

- (id)_connectionQueue_connection
{
  BSServiceConnection *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BSServiceConnection *v8;
  BSServiceConnection *v9;
  BSServiceConnection *v10;
  NSObject *v11;
  BSServiceConnection *v12;
  _QWORD v14[5];
  uint8_t buf[4];
  BSServiceConnection *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  connection = self->_connection;
  if (!connection)
  {
    v4 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSAccessibilityWindowHostingSpecification identifier](SBSAccessibilityWindowHostingSpecification, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v7);
    v8 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
    v9 = self->_connection;
    self->_connection = v8;

    v10 = self->_connection;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke;
    v14[3] = &unk_1E288CF30;
    v14[4] = self;
    -[BSServiceConnection configureConnection:](v10, "configureConnection:", v14);
    SBLogAccessibilityWindowHosting();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = self->_connection;
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_18EB52000, v11, OS_LOG_TYPE_INFO, "Activating Connection: %{public}@", buf, 0xCu);
    }

    -[BSServiceConnection activate](self->_connection, "activate");
    connection = self->_connection;
  }
  return connection;
}

void __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  +[SBSAccessibilityWindowHostingSpecification serviceQuality](SBSAccessibilityWindowHostingSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SBSAccessibilityWindowHostingSpecification interface](SBSAccessibilityWindowHostingSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_25);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_7;
  v9[3] = &unk_1E288CF08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_8;
  v7[3] = &unk_1E288CF08;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogAccessibilityWindowHosting();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogAccessibilityWindowHosting();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_INFO, "Received interruption for connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_connectionQueue_handleInterruption");

}

void __70__SBSAccessibilityWindowHostingController__connectionQueue_connection__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogAccessibilityWindowHosting();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_INFO, "Received invalidation for connection: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && *((id *)WeakRetained + 1) == v3)
  {
    *((_QWORD *)WeakRetained + 1) = 0;

  }
}

- (void)_connectionQueue_handleInterruption
{
  NSMutableDictionary *registeredWindowContextIDsToLevel;
  _QWORD v4[5];

  -[BSServiceConnection activate](self->_connection, "activate");
  registeredWindowContextIDsToLevel = self->_registeredWindowContextIDsToLevel;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__SBSAccessibilityWindowHostingController__connectionQueue_handleInterruption__block_invoke;
  v4[3] = &unk_1E288E570;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](registeredWindowContextIDsToLevel, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __78__SBSAccessibilityWindowHostingController__connectionQueue_handleInterruption__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "remoteTarget");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerWindowWithContextID:atLevel:", v6, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredWindowContextIDsToLevel, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
