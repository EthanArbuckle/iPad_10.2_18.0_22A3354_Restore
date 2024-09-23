@implementation SCLSuppressSchoolModeAssertionManager

- (SCLSuppressSchoolModeAssertionManager)initWithTargetQueue:(id)a3
{
  NSObject *v5;
  SCLSuppressSchoolModeAssertionManager *v6;
  uint64_t v7;
  NSMutableSet *clients;
  uint64_t v9;
  NSMutableSet *acquiredClients;
  uint64_t v11;
  NSHashTable *observers;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  NSXPCListener *listener;
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCLSuppressSchoolModeAssertionManager;
  v6 = -[SCLSuppressSchoolModeAssertionManager init](&v20, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    clients = v6->_clients;
    v6->_clients = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    acquiredClients = v6->_acquiredClients;
    v6->_acquiredClients = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v11;

    v13 = dispatch_queue_create_with_target_V2("SCLSuppressSchoolModeAssertionManager", 0, v5);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v6->_targetQueue, a3);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", 0x24E29CE48);
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v15;

    -[NSXPCListener _setQueue:](v6->_listener, "_setQueue:", v6->_queue);
    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    objc_initWeak(&location, v6);
    objc_copyWeak(&v18, &location);
    v6->_stateHandle = os_state_add_handler();
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __61__SCLSuppressSchoolModeAssertionManager_initWithTargetQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "_stateDataWithHints:", a2);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SCLSuppressSchoolModeAssertionManager;
  -[SCLSuppressSchoolModeAssertionManager dealloc](&v3, sel_dealloc);
}

- (void)activate
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  SCLSuppressSchoolModeAssertionClient *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = -[SCLSuppressSchoolModeAssertionClient initWithConnection:]([SCLSuppressSchoolModeAssertionClient alloc], "initWithConnection:", v5);
  -[SCLSuppressSchoolModeAssertionClient setDelegate:](v6, "setDelegate:", self);
  -[SCLSuppressSchoolModeAssertionManager clients](self, "clients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  -[SCLSuppressSchoolModeAssertionManager queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setQueue:", v8);

  objc_msgSend(v5, "resume");
  return 1;
}

- (void)clientDidAcquireAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCLSuppressSchoolModeAssertionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[SCLSuppressSchoolModeAssertionManager status](self, "status");
  -[SCLSuppressSchoolModeAssertionManager acquiredClients](self, "acquiredClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  v8 = -[SCLSuppressSchoolModeAssertionManager status](self, "status");
  scl_framework_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_21E4AD000, v9, OS_LOG_TYPE_DEFAULT, "Acquired suppression assertion for %@", buf, 0xCu);
  }

  if (v6 != v8)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__SCLSuppressSchoolModeAssertionManager_clientDidAcquireAssertion___block_invoke;
    v10[3] = &unk_24E29C228;
    v10[4] = self;
    v10[5] = v8;
    -[SCLSuppressSchoolModeAssertionManager performObserverBlock:](self, "performObserverBlock:", v10);
  }

}

uint64_t __67__SCLSuppressSchoolModeAssertionManager_clientDidAcquireAssertion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assertionManager:didUpdateAssertionsStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)clientDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCLSuppressSchoolModeAssertionManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[SCLSuppressSchoolModeAssertionManager status](self, "status");
  -[SCLSuppressSchoolModeAssertionManager acquiredClients](self, "acquiredClients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

  -[SCLSuppressSchoolModeAssertionManager clients](self, "clients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v4);

  v9 = -[SCLSuppressSchoolModeAssertionManager status](self, "status");
  scl_framework_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_21E4AD000, v10, OS_LOG_TYPE_DEFAULT, "Relinquished suppression assertion for %@", buf, 0xCu);
  }

  if (v6 != v9)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__SCLSuppressSchoolModeAssertionManager_clientDidInvalidate___block_invoke;
    v11[3] = &unk_24E29C228;
    v11[4] = self;
    v11[5] = v9;
    -[SCLSuppressSchoolModeAssertionManager performObserverBlock:](self, "performObserverBlock:", v11);
  }

}

uint64_t __61__SCLSuppressSchoolModeAssertionManager_clientDidInvalidate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assertionManager:didUpdateAssertionsStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (unint64_t)status
{
  NSObject *v3;
  void *v4;
  unint64_t v5;

  -[SCLSuppressSchoolModeAssertionManager targetQueue](self, "targetQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SCLSuppressSchoolModeAssertionManager acquiredClients](self, "acquiredClients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[SCLSuppressSchoolModeAssertionManager targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SCLSuppressSchoolModeAssertionManager observers](self, "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[SCLSuppressSchoolModeAssertionManager targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SCLSuppressSchoolModeAssertionManager observers](self, "observers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (void)performObserverBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  -[SCLSuppressSchoolModeAssertionManager targetQueue](self, "targetQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SCLSuppressSchoolModeAssertionManager observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (os_state_data_s)_stateDataWithHints:(os_state_hints_s *)a3
{
  NSObject *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  os_state_data_s *v13;

  -[SCLSuppressSchoolModeAssertionManager queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCLSuppressSchoolModeAssertionManager status](self, "status");
  v7 = CFSTR("active");
  if (v6 != 1)
    v7 = 0;
  if (v6)
    v8 = v7;
  else
    v8 = CFSTR("inactive");
  v9 = (id)objc_msgSend(v5, "appendObject:withName:", v8, CFSTR("status"));
  -[SCLSuppressSchoolModeAssertionManager clients](self, "clients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v11, CFSTR("clients"), 0);

  objc_msgSend(v5, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (os_state_data_s *)SCLSStateDataWithTitleDescriptionAndHints(CFSTR("SCLSuppressSchoolModeAssertionManager"), (uint64_t)v12);

  return v13;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetQueue, a3);
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

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (NSMutableSet)acquiredClients
{
  return self->_acquiredClients;
}

- (void)setAcquiredClients:(id)a3
{
  objc_storeStrong((id *)&self->_acquiredClients, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_acquiredClients, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

@end
