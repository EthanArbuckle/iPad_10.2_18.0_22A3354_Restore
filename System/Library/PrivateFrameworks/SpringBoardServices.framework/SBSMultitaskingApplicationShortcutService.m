@implementation SBSMultitaskingApplicationShortcutService

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
  v5.super_class = (Class)SBSMultitaskingApplicationShortcutService;
  -[SBSMultitaskingApplicationShortcutService dealloc](&v5, sel_dealloc);
}

- (void)startObservingSupportedShortcutsForBundleIdentifier:(id)a3
{
  id v4;
  NSCountedSet *trackedBundleIdentifiers;
  NSCountedSet *v6;
  NSCountedSet *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  trackedBundleIdentifiers = self->_trackedBundleIdentifiers;
  if (!trackedBundleIdentifiers)
  {
    v6 = (NSCountedSet *)objc_opt_new();
    v7 = self->_trackedBundleIdentifiers;
    self->_trackedBundleIdentifiers = v6;

    trackedBundleIdentifiers = self->_trackedBundleIdentifiers;
  }
  -[NSCountedSet addObject:](trackedBundleIdentifiers, "addObject:", v4);
  -[SBSMultitaskingApplicationShortcutService _connection](self, "_connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97__SBSMultitaskingApplicationShortcutService_startObservingSupportedShortcutsForBundleIdentifier___block_invoke;
  v11[3] = &unk_1E288EFD0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "fetchSupportedShortcutActionsForBundleIdentifier:withCompletionHandler:", v10, v11);

}

void __97__SBSMultitaskingApplicationShortcutService_startObservingSupportedShortcutsForBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 40);
  v6 = v5;
  v7 = v8;
  BSDispatchMain();

}

void __97__SBSMultitaskingApplicationShortcutService_startObservingSupportedShortcutsForBundleIdentifier___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a1[4])
    v2 = &unk_1E28BFE70;
  else
    v2 = (void *)a1[5];
  v7 = v2;
  if (objc_msgSend(*(id *)(a1[6] + 24), "containsObject:", a1[7]))
  {
    v3 = *(void **)(a1[6] + 32);
    if (!v3)
    {
      v4 = objc_opt_new();
      v5 = a1[6];
      v6 = *(void **)(v5 + 32);
      *(_QWORD *)(v5 + 32) = v4;

      v3 = *(void **)(a1[6] + 32);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, a1[7]);
  }

}

- (void)stopObservingSupportedShortcutsForBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSCountedSet removeObject:](self->_trackedBundleIdentifiers, "removeObject:", v6);
  if (!-[NSCountedSet countForObject:](self->_trackedBundleIdentifiers, "countForObject:", v6))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_supportedShortcutsByBundleIdentifier, "removeObjectForKey:", v6);
    -[SBSMultitaskingApplicationShortcutService _connection](self, "_connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopObservingUpdatesForBundleIdentifier:", v6);

  }
}

- (unint64_t)supportedShortcutActionsForBundleIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_supportedShortcutsByBundleIdentifier, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)performMultitaskingShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  -[SBSMultitaskingApplicationShortcutService _connection](self, "_connection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performShortcutAction:forBundleIdentifier:", v8, v6);

}

- (void)updateSupportedShortcutActionsForBundleIdentifiers:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

void __96__SBSMultitaskingApplicationShortcutService_updateSupportedShortcutActionsForBundleIdentifiers___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", v7))
        {
          objc_msgSend(v2, "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKey:", v8, v7);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
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
    +[SBSMultitaskingApplicationShortcutServiceSpecification identifier](SBSMultitaskingApplicationShortcutServiceSpecification, "identifier");
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
    v14[2] = __56__SBSMultitaskingApplicationShortcutService__connection__block_invoke;
    v14[3] = &unk_1E288CF30;
    v14[4] = self;
    -[BSServiceConnection configureConnection:](v12, "configureConnection:", v14);
    -[BSServiceConnection activate](self->_connection, "activate");

    connection = self->_connection;
  }
  return connection;
}

void __56__SBSMultitaskingApplicationShortcutService__connection__block_invoke(uint64_t a1, void *a2)
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
  +[SBSMultitaskingApplicationShortcutServiceSpecification interface](SBSMultitaskingApplicationShortcutServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[SBSMultitaskingApplicationShortcutServiceSpecification serviceQuality](SBSMultitaskingApplicationShortcutServiceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SBSMultitaskingApplicationShortcutService__connection__block_invoke_2;
  v9[3] = &unk_1E288CF08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __56__SBSMultitaskingApplicationShortcutService__connection__block_invoke_3;
  v7[3] = &unk_1E288D248;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __56__SBSMultitaskingApplicationShortcutService__connection__block_invoke_2(uint64_t a1)
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

void __56__SBSMultitaskingApplicationShortcutService__connection__block_invoke_3(uint64_t a1)
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
  objc_storeStrong((id *)&self->_supportedShortcutsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_trackedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
