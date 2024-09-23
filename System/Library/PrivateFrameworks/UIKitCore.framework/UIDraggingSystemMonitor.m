@implementation UIDraggingSystemMonitor

- (id)_init
{
  UIDraggingSystemMonitor *v3;
  uint64_t v4;
  NSMapTable *sessionsBySessionInfo;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *xpcQueue;
  uint64_t v9;
  NSXPCListener *systemListener;
  UIDraggingSystemMonitor *v11;
  objc_super v13;

  if (qword_1ECD81D48 != -1)
    dispatch_once(&qword_1ECD81D48, &__block_literal_global_583);
  if (_MergedGlobals_1270)
  {
    v13.receiver = self;
    v13.super_class = (Class)UIDraggingSystemMonitor;
    v3 = -[UIDraggingSystemMonitor init](&v13, sel_init);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v4 = objc_claimAutoreleasedReturnValue();
      sessionsBySessionInfo = v3->_sessionsBySessionInfo;
      v3->_sessionsBySessionInfo = (NSMapTable *)v4;

      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = dispatch_queue_create("com.apple.UIKit.druid.system.xpcQueue", v6);
      xpcQueue = v3->_xpcQueue;
      v3->_xpcQueue = (OS_dispatch_queue *)v7;

      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.DragUI.druid.system"));
      systemListener = v3->_systemListener;
      v3->_systemListener = (NSXPCListener *)v9;

      -[NSXPCListener _setQueue:](v3->_systemListener, "_setQueue:", v3->_xpcQueue);
      -[NSXPCListener setDelegate:](v3->_systemListener, "setDelegate:", v3);
      -[NSXPCListener resume](v3->_systemListener, "resume");

    }
    self = v3;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UIDraggingSystemMonitor)init
{

  return 0;
}

+ (id)new
{
  return 0;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__UIDraggingSystemMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD81D38 != -1)
    dispatch_once(&qword_1ECD81D38, block);
  return (id)qword_1ECD81D40;
}

void __41__UIDraggingSystemMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_1ECD81D40;
  qword_1ECD81D40 = v1;

}

- (NSSet)sessions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[NSMapTable objectEnumerator](self->_sessionsBySessionInfo, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)sessionForDropSession:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "sessionDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sessionIdentifier");

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable keyEnumerator](self->_sessionsBySessionInfo, "keyEnumerator", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "sessionIdentifier") == v6)
          {
            -[NSMapTable objectForKey:](self->_sessionsBySessionInfo, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_13:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  return -[UIDraggingSystemMonitor xpcQueue_shouldAcceptNewConnection:](self, "xpcQueue_shouldAcceptNewConnection:", a4);
}

- (BOOL)xpcQueue_shouldAcceptNewConnection:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.druid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if (v6)
  {
    -[UIDraggingSystemMonitor xpcQueue_acceptNewConnection:](self, "xpcQueue_acceptNewConnection:", v4);
    objc_msgSend(v4, "resume");
  }

  return v6;
}

- (void)xpcQueue_acceptNewConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id from;
  id location;

  v4 = a3;
  objc_msgSend(v4, "_setQueue:", self->_xpcQueue);
  _DUINewClientSystemAppInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v5);

  objc_msgSend(v4, "setExportedObject:", self);
  objc_msgSend(v4, "setRemoteObjectInterface:", 0);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__UIDraggingSystemMonitor_xpcQueue_acceptNewConnection___block_invoke;
  v9[3] = &unk_1E16B3F40;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __56__UIDraggingSystemMonitor_xpcQueue_acceptNewConnection___block_invoke_2;
  v7[3] = &unk_1E16B3F40;
  objc_copyWeak(&v8, &from);
  objc_msgSend(v4, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __56__UIDraggingSystemMonitor_xpcQueue_acceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __56__UIDraggingSystemMonitor_xpcQueue_acceptNewConnection___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeAllObjects");
    WeakRetained = v2;
  }

}

- (void)dragDidBeginWithSystemSession:(id)a3 info:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setServerSession:", v10);

  objc_msgSend(v11, "setInfo:", v8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__UIDraggingSystemMonitor_dragDidBeginWithSystemSession_info_reply___block_invoke;
  v15[3] = &unk_1E16B4420;
  v15[4] = self;
  v16 = v11;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v15);

}

void __68__UIDraggingSystemMonitor_dragDidBeginWithSystemSession_info_reply___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(a1[4], "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "touchRoutingPolicyForBeginningDragSessionWithInfo:", a1[6]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setRoutingPolicy:", v3);

    objc_msgSend(a1[5], "routingPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHitTestingDisabled");

    if (v5)
      objc_msgSend(a1[5], "commandeerImmediately");
  }
  v6 = a1[4];
  v7 = a1[5];
  v8 = *((_QWORD *)v6 + 2);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __68__UIDraggingSystemMonitor_dragDidBeginWithSystemSession_info_reply___block_invoke_2;
  v12 = &unk_1E16B4420;
  v13 = v6;
  v14 = v7;
  v15 = a1[6];
  v16 = a1[7];
  dispatch_async(v8, &v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "dragSessionDidBegin:", a1[5], v9, v10, v11, v12, v13, v14, v15);

}

void __68__UIDraggingSystemMonitor_dragDidBeginWithSystemSession_info_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "routingPolicy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)dragDidEndWithSystemSession:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_sessionsBySessionInfo, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMapTable removeObjectForKey:](self->_sessionsBySessionInfo, "removeObjectForKey:", v4);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__UIDraggingSystemMonitor_dragDidEndWithSystemSession___block_invoke;
    v6[3] = &unk_1E16B1B50;
    v6[4] = self;
    v7 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

void __55__UIDraggingSystemMonitor_dragDidEndWithSystemSession___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "dragSessionDidEnd:", *(_QWORD *)(a1 + 40));

}

- (UIDraggingSystemMonitorDelegate)delegate
{
  return (UIDraggingSystemMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionsBySessionInfo, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_systemListener, 0);
}

@end
