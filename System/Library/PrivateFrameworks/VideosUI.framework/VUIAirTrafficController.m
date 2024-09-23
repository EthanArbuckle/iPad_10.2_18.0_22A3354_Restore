@implementation VUIAirTrafficController

+ (id)defaultController
{
  if (defaultController___once != -1)
    dispatch_once(&defaultController___once, &__block_literal_global_1);
  return (id)defaultController___defaultController;
}

void __44__VUIAirTrafficController_defaultController__block_invoke()
{
  VUIAirTrafficController *v0;
  void *v1;

  v0 = objc_alloc_init(VUIAirTrafficController);
  v1 = (void *)defaultController___defaultController;
  defaultController___defaultController = (uint64_t)v0;

}

- (VUIAirTrafficController)init
{
  VUIAirTrafficController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  NSMutableSet *v5;
  NSMutableSet *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIAirTrafficController;
  v2 = -[VUIAirTrafficController init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.videosui.VUIAirTrafficController.ATConnection", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observers = v2->_observers;
    v2->_observers = v5;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VUIAirTrafficController connectionQueue](self, "connectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__VUIAirTrafficController_addObserver___block_invoke;
  v7[3] = &unk_1E9F98FD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__VUIAirTrafficController_addObserver___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_onConnectionQueue_startObservingIfIdle");
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VUIAirTrafficController connectionQueue](self, "connectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__VUIAirTrafficController_removeObserver___block_invoke;
  v7[3] = &unk_1E9F98FD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __42__VUIAirTrafficController_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_onConnectionQueue_stopObservingIfIdle");
}

- (void)removeAllObservers
{
  NSObject *v3;
  _QWORD block[5];

  -[VUIAirTrafficController connectionQueue](self, "connectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VUIAirTrafficController_removeAllObservers__block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __45__VUIAirTrafficController_removeAllObservers__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "_onConnectionQueue_stopObservingIfIdle");
}

- (void)_onConnectionQueue_startObservingIfIdle
{
  void *v3;
  uint64_t v4;
  id v5;

  -[VUIAirTrafficController observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CF7688]);
    -[VUIAirTrafficController setConnection:](self, "setConnection:", v5);
    objc_msgSend(v5, "setDelegate:", self);
    objc_msgSend(v5, "registerForStatus");

  }
}

- (void)_onConnectionQueue_stopObservingIfIdle
{
  void *v3;
  uint64_t v4;
  id v5;

  -[VUIAirTrafficController observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    -[VUIAirTrafficController connection](self, "connection");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[VUIAirTrafficController setConnection:](self, "setConnection:", 0);
    objc_msgSend(v5, "setDelegate:", 0);
    objc_msgSend(v5, "unregisterForStatus");

  }
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[VUIAirTrafficController connectionQueue](self, "connectionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__VUIAirTrafficController_connection_updatedProgress___block_invoke;
  v10[3] = &unk_1E9F99000;
  objc_copyWeak(&v12, &location);
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __54__VUIAirTrafficController_connection_updatedProgress___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "airTrafficController:proggressDidUpdate:", WeakRetained, *(_QWORD *)(a1 + 40));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (ATConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
