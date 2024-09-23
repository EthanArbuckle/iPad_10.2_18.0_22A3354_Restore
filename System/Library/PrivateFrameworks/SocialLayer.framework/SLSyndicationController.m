@implementation SLSyndicationController

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_5);
  return (id)sharedController_sharedController;
}

void __43__SLSyndicationController_sharedController__block_invoke()
{
  SLSyndicationController *v0;
  void *v1;

  v0 = objc_alloc_init(SLSyndicationController);
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

}

- (void)removeMessageGUIDFromSyndication:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    +[SLSyndicationController syndicationProcessingQueue](SLSyndicationController, "syndicationProcessingQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__SLSyndicationController_removeMessageGUIDFromSyndication___block_invoke;
    v6[3] = &unk_1E37942C0;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __60__SLSyndicationController_removeMessageGUIDFromSyndication___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pendingmessageGUIDsToRemove");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "syndicationServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "connectionActive");

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "_sendCurrentRemovalsToDaemonAndDisconnect");
  }
  else
  {
    objc_msgSend(v5, "syndicationServiceProxy");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connect");

  }
}

- (void)_sendCurrentRemovalsToDaemonAndDisconnect
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SLSyndicationController _sendCurrentRemovalsToDaemonAndDisconnect]";
  _os_log_debug_impl(&dword_199EFF000, log, OS_LOG_TYPE_DEBUG, "%s: Not currently connected to syndication service. We'll wait for the connection to finish posting pending removals.", (uint8_t *)&v1, 0xCu);
}

void __68__SLSyndicationController__sendCurrentRemovalsToDaemonAndDisconnect__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  SWFrameworkLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_199EFF000, v6, OS_LOG_TYPE_INFO, "Received success for removal for message with guid: '%@'", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __68__SLSyndicationController__sendCurrentRemovalsToDaemonAndDisconnect__block_invoke_cold_1(a1, v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
    objc_msgSend(WeakRetained, "_disconnectSyndicationServiceConnectionIfNecessary");

}

- (void)_disconnectSyndicationServiceConnectionIfNecessary
{
  NSObject *v3;
  _QWORD block[5];

  +[SLSyndicationController syndicationProcessingQueue](SLSyndicationController, "syndicationProcessingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SLSyndicationController__disconnectSyndicationServiceConnectionIfNecessary__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(v3, block);

}

void __77__SLSyndicationController__disconnectSyndicationServiceConnectionIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pendingmessageGUIDsToRemove");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    SWFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[SLSyndicationController _disconnectSyndicationServiceConnectionIfNecessary]_block_invoke";
      _os_log_impl(&dword_199EFF000, v5, OS_LOG_TYPE_INFO, "%s: No more message GUIDS to remove, disconnecting from syndication service proxy.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "syndicationServiceProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disconnect");

  }
}

- (void)serviceProxyDidConnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SLSyndicationController *v9;

  v4 = a3;
  +[SLSyndicationController syndicationProcessingQueue](SLSyndicationController, "syndicationProcessingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SLSyndicationController_serviceProxyDidConnect___block_invoke;
  v7[3] = &unk_1E37942C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__SLSyndicationController_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syndicationServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 40), "_sendCurrentRemovalsToDaemonAndDisconnect");
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SLSyndicationController *v9;

  v4 = a3;
  +[SLSyndicationController syndicationProcessingQueue](SLSyndicationController, "syndicationProcessingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SLSyndicationController_serviceProxyDidDisconnect___block_invoke;
  v7[3] = &unk_1E37942C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__SLSyndicationController_serviceProxyDidDisconnect___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "syndicationServiceProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "pendingmessageGUIDsToRemove");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "syndicationServiceProxy");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connect");

    }
  }
}

- (NSMutableSet)pendingmessageGUIDsToRemove
{
  NSMutableSet *pendingmessageGUIDsToRemove;
  NSMutableSet *v4;
  NSMutableSet *v5;

  pendingmessageGUIDsToRemove = self->_pendingmessageGUIDsToRemove;
  if (!pendingmessageGUIDsToRemove)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_pendingmessageGUIDsToRemove;
    self->_pendingmessageGUIDsToRemove = v4;

    pendingmessageGUIDsToRemove = self->_pendingmessageGUIDsToRemove;
  }
  return pendingmessageGUIDsToRemove;
}

- (SLDServiceProxy)syndicationServiceProxy
{
  SLDServiceProxy *syndicationServiceProxy;
  uint64_t v4;
  void *v5;
  SLDServiceProxy *v6;
  SLDServiceProxy *v7;

  syndicationServiceProxy = self->_syndicationServiceProxy;
  if (!syndicationServiceProxy)
  {
    v4 = objc_opt_class();
    +[SLSyndicationController syndicationProcessingQueue](SLSyndicationController, "syndicationProcessingQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SLDServiceProxy proxyForServiceClass:targetSerialQueue:delegate:](SLDServiceProxy, "proxyForServiceClass:targetSerialQueue:delegate:", v4, v5, self);
    v6 = (SLDServiceProxy *)objc_claimAutoreleasedReturnValue();
    v7 = self->_syndicationServiceProxy;
    self->_syndicationServiceProxy = v6;

    syndicationServiceProxy = self->_syndicationServiceProxy;
  }
  return syndicationServiceProxy;
}

+ (OS_dispatch_queue)syndicationProcessingQueue
{
  if (syndicationProcessingQueue_onceToken != -1)
    dispatch_once(&syndicationProcessingQueue_onceToken, &__block_literal_global_6);
  return (OS_dispatch_queue *)(id)syndicationProcessingQueue_syndicationProcessingQueue;
}

void __53__SLSyndicationController_syndicationProcessingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SocialLayer.SLSyndicationProcessingQueue", v2);
  v1 = (void *)syndicationProcessingQueue_syndicationProcessingQueue;
  syndicationProcessingQueue_syndicationProcessingQueue = (uint64_t)v0;

}

- (void)setSyndicationServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationServiceProxy, a3);
}

- (void)setPendingmessageGUIDsToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_pendingmessageGUIDsToRemove, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingmessageGUIDsToRemove, 0);
  objc_storeStrong((id *)&self->_syndicationServiceProxy, 0);
}

void __68__SLSyndicationController__sendCurrentRemovalsToDaemonAndDisconnect__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "Unsuccessful sending remove for message with guid: '%@'", (uint8_t *)&v3, 0xCu);
}

@end
