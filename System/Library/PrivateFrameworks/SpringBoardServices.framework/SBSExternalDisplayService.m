@implementation SBSExternalDisplayService

- (void)dealloc
{
  BSServiceConnection *connection;
  OS_dispatch_queue *connectionQueue;
  objc_super v5;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSExternalDisplayService;
  -[SBSExternalDisplayService dealloc](&v5, sel_dealloc);
}

- (void)getConnectedDisplayInfoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBSExternalDisplayService _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__SBSExternalDisplayService_getConnectedDisplayInfoWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E288EF58;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "getConnectedDisplayInfoWithCompletion:", v8);

}

void __74__SBSExternalDisplayService_getConnectedDisplayInfoWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);

  v4 = a3;
  if (v4)
  {
    SBLogDisplayControlling();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __74__SBSExternalDisplayService_getConnectedDisplayInfoWithCompletionHandler___block_invoke_cold_1((uint64_t)v4, v5);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

- (void)setDisplayArrangement:(id)a3 forDisplay:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBSExternalDisplayService _connection](self, "_connection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisplayArrangement:forDisplay:", v7, v6);

}

- (void)setMirroringEnabled:(BOOL)a3 forDisplay:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = a4;
  -[SBSExternalDisplayService _connection](self, "_connection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayMirroringEnabled:forDisplay:", v8, v6);

}

- (void)setSettings:(id)a3 forDisplay:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[SBSExternalDisplayService _connection](self, "_connection");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "remoteTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDisplayModeSettings:forDisplay:options:completionHandler:", v12, v11, v14, v10);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = -[SBSExternalDisplayService _connection](self, "_connection");
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SBSExternalDisplayService_addObserver___block_invoke;
  v8[3] = &unk_1E288D940;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

}

uint64_t __41__SBSExternalDisplayService_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  NSObject *connectionQueue;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SBSExternalDisplayService_removeObserver___block_invoke;
  v8[3] = &unk_1E288D940;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x193FF87DC](v8);
  connectionQueue = self->_connectionQueue;
  if (connectionQueue)
    dispatch_async(connectionQueue, v6);
  else
    v6[2](v6);

}

void __44__SBSExternalDisplayService_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 24);
    *(_QWORD *)(v2 + 24) = 0;

  }
}

- (void)externalDisplayDidConnect:(id)a3
{
  id v4;
  NSHashTable *v5;
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
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_queue_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "externalDisplayDidConnect:", v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)externalDisplayWillDisconnect:(id)a3
{
  id v4;
  NSHashTable *v5;
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
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_queue_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "externalDisplayWillDisconnect:", v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)externalDisplayDidUpdateProperties:(id)a3
{
  id v4;
  NSHashTable *v5;
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
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_queue_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "externalDisplayDidUpdateProperties:", v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_connection
{
  BSServiceConnection *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *connectionQueue;
  BSServiceConnection *v10;
  BSServiceConnection *v11;
  BSServiceConnection *v12;
  _QWORD v14[5];

  connection = self->_connection;
  if (!connection)
  {
    v4 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSExternalDisplayServiceSpecification identifier](SBSExternalDisplayServiceSpecification, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = v8;

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v7);
    v10 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
    v11 = self->_connection;
    self->_connection = v10;

    v12 = self->_connection;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40__SBSExternalDisplayService__connection__block_invoke;
    v14[3] = &unk_1E288CF30;
    v14[4] = self;
    -[BSServiceConnection configureConnection:](v12, "configureConnection:", v14);
    -[BSServiceConnection activate](self->_connection, "activate");

    connection = self->_connection;
  }
  return connection;
}

void __40__SBSExternalDisplayService__connection__block_invoke(uint64_t a1, void *a2)
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
  +[SBSExternalDisplayServiceSpecification interface](SBSExternalDisplayServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[SBSExternalDisplayServiceSpecification serviceQuality](SBSExternalDisplayServiceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__SBSExternalDisplayService__connection__block_invoke_2;
  v9[3] = &unk_1E288CF08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __40__SBSExternalDisplayService__connection__block_invoke_3;
  v7[3] = &unk_1E288D248;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __40__SBSExternalDisplayService__connection__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __40__SBSExternalDisplayService__connection__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "activate");
    WeakRetained = v2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __74__SBSExternalDisplayService_getConnectedDisplayInfoWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "got error fetching external displayInfos: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
