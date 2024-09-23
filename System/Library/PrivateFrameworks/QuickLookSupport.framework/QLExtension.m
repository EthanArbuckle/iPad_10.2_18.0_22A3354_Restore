@implementation QLExtension

- (NSExtension)extension
{
  return self->_extension;
}

- (QLExtension)initWithExtension:(id)a3
{
  id v5;
  QLExtension *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_queue_t v9;
  OS_dispatch_queue *completionHandlersQueue;
  uint64_t v11;
  NSMutableSet *observers;
  QLGracePeriodTimer *v13;
  uint64_t v14;
  QLGracePeriodTimer *gracePeriodTimer;
  uint64_t v16;
  NSMutableArray *extensionRequestHandlers;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)QLExtension;
  v6 = -[QLExtension init](&v22, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.quicklook.qlextension.request", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.quicklook.qlextension.request", MEMORY[0x24BDAC9C0]);
    completionHandlersQueue = v6->_completionHandlersQueue;
    v6->_completionHandlersQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_extension, a3);
    v11 = objc_opt_new();
    observers = v6->_observers;
    v6->_observers = (NSMutableSet *)v11;

    v6->_externalResourcesPermission = 0;
    objc_initWeak(&location, v6);
    v13 = [QLGracePeriodTimer alloc];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __33__QLExtension_initWithExtension___block_invoke;
    v19[3] = &unk_24C71B2C8;
    objc_copyWeak(&v20, &location);
    v14 = -[QLGracePeriodTimer initWithAction:callbackQueue:delay:](v13, "initWithAction:callbackQueue:delay:", v19, v6->_queue, *(double *)&QLExtensionGracePeriodDelay);
    gracePeriodTimer = v6->_gracePeriodTimer;
    v6->_gracePeriodTimer = (QLGracePeriodTimer *)v14;

    v16 = objc_opt_new();
    extensionRequestHandlers = v6->_extensionRequestHandlers;
    v6->_extensionRequestHandlers = (NSMutableArray *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __33__QLExtension_initWithExtension___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateAndCancelExtensionRequest");

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p %@ identifier:%@>"), objc_opt_class(), self, self->_extension, self->_requestIdentifier);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)QLExtension;
  -[QLExtension dealloc](&v2, sel_dealloc);
}

- (void)_setupConnectionIfNeededWithCompletionHandler:(id)a3
{
  id v4;
  NSMutableArray *extensionRequestHandlers;
  void *v6;
  NSExtension *extension;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _BYTE location[12];
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  extensionRequestHandlers = self->_extensionRequestHandlers;
  v6 = (void *)MEMORY[0x212BA28B4](v4);
  -[NSMutableArray addObject:](extensionRequestHandlers, "addObject:", v6);

  if (self->_connection)
  {
    -[QLExtension _callExtensionRequestHandlers](self, "_callExtensionRequestHandlers");
  }
  else if (!self->_isRequestingExtension)
  {
    self->_isRequestingExtension = 1;
    extension = self->_extension;
    v22 = 0;
    -[NSExtension beginExtensionRequestWithOptions:inputItems:error:](extension, "beginExtensionRequestWithOptions:inputItems:error:", 1, 0, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v22;
    self->_isRequestingExtension = 0;
    if (v8)
    {
      -[QLExtension extension](self, "extension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_extensionContextForUUID:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLExtension setContext:](self, "setContext:", v11);

      -[QLExtension context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_auxiliaryConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLExtension setConnection:](self, "setConnection:", v13);

      -[QLExtension setRequestIdentifier:](self, "setRequestIdentifier:", v8);
      objc_initWeak((id *)location, self);
      v14 = MEMORY[0x24BDAC760];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke;
      v20[3] = &unk_24C71B2C8;
      objc_copyWeak(&v21, (id *)location);
      -[QLExtension connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setInterruptionHandler:", v20);

      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_3;
      v18[3] = &unk_24C71B2C8;
      objc_copyWeak(&v19, (id *)location);
      -[QLExtension connection](self, "connection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setInvalidationHandler:", v18);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v17 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v17 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)location = 138412546;
        *(_QWORD *)&location[4] = self;
        v24 = 2112;
        v25 = v9;
        _os_log_impl(&dword_20D4C7000, v17, OS_LOG_TYPE_FAULT, "%@: error while instantiating extension's object: %@ #Remote", location, 0x16u);
      }
    }
    -[QLExtension _callExtensionRequestHandlers](self, "_callExtensionRequestHandlers");

  }
}

void __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_2;
    block[3] = &unk_24C71B2C8;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }

}

void __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidate");

}

void __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_4;
    block[3] = &unk_24C71B2C8;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);

    objc_destroyWeak(&v6);
  }

}

void __61__QLExtension__setupConnectionIfNeededWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidate");

}

- (void)_callExtensionRequestHandlers
{
  NSMutableArray *v3;
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

  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_extensionRequestHandlers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
        dispatch_async((dispatch_queue_t)self->_completionHandlersQueue, *(dispatch_block_t *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_extensionRequestHandlers, "removeAllObjects", (_QWORD)v8);
}

- (void)_invalidateAndCancelExtensionRequest
{
  NSObject *v3;
  int v4;
  QLExtension *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_connection)
  {
    v3 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v3 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = 138412290;
      v5 = self;
      _os_log_impl(&dword_20D4C7000, v3, OS_LOG_TYPE_DEBUG, "%@: cancelling extension request #Extensions", (uint8_t *)&v4, 0xCu);
    }
    if (self->_requestIdentifier)
      -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:");
    -[QLExtension _invalidate](self, "_invalidate");
  }
}

- (void)_invalidate
{
  NSObject *v3;
  id requestIdentifier;
  NSXPCConnection *connection;
  NSExtensionContext *context;
  int v7;
  QLExtension *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    v3 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_20D4C7000, v3, OS_LOG_TYPE_DEBUG, "%@: invalidating extension connection #Extensions", (uint8_t *)&v7, 0xCu);
  }
  requestIdentifier = self->_requestIdentifier;
  self->_requestIdentifier = 0;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  context = self->_context;
  self->_context = 0;

}

- (void)registerClient:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__QLExtension_registerClient___block_invoke;
  block[3] = &unk_24C71AF38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __30__QLExtension_registerClient___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "gracePeriodTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suppress");

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)unregisterClient:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__QLExtension_unregisterClient___block_invoke;
  block[3] = &unk_24C71AF38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __32__QLExtension_unregisterClient___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v5 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_20D4C7000, v5, OS_LOG_TYPE_DEBUG, "Arming timer to invalidate QLExtension %@ because there is no more active observer. #Extensions", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "gracePeriodTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arm");

  }
}

- (void)extensionContextWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__QLExtension_extensionContextWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C71B318;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __53__QLExtension_extensionContextWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__QLExtension_extensionContextWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_24C71B2F0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_setupConnectionIfNeededWithCompletionHandler:", v4);

}

void __53__QLExtension_extensionContextWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)invalidateAndCancelExtensionRequest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__QLExtension_invalidateAndCancelExtensionRequest__block_invoke;
  block[3] = &unk_24C71AF10;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __50__QLExtension_invalidateAndCancelExtensionRequest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAndCancelExtensionRequest");
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (int64_t)extensionScore
{
  return self->_extensionScore;
}

- (void)setExtensionScore:(int64_t)a3
{
  self->_extensionScore = a3;
}

- (unint64_t)externalResourcesPermission
{
  return self->_externalResourcesPermission;
}

- (void)setExternalResourcesPermission:(unint64_t)a3
{
  self->_externalResourcesPermission = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)completionHandlersQueue
{
  return self->_completionHandlersQueue;
}

- (void)setCompletionHandlersQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlersQueue, a3);
}

- (NSExtensionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong(&self->_requestIdentifier, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (QLGracePeriodTimer)gracePeriodTimer
{
  return self->_gracePeriodTimer;
}

- (void)setGracePeriodTimer:(id)a3
{
  objc_storeStrong((id *)&self->_gracePeriodTimer, a3);
}

- (NSMutableArray)extensionRequestHandlers
{
  return self->_extensionRequestHandlers;
}

- (void)setExtensionRequestHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_extensionRequestHandlers, a3);
}

- (BOOL)isRequestingExtension
{
  return self->_isRequestingExtension;
}

- (void)setIsRequestingExtension:(BOOL)a3
{
  self->_isRequestingExtension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionRequestHandlers, 0);
  objc_storeStrong((id *)&self->_gracePeriodTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_completionHandlersQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end
