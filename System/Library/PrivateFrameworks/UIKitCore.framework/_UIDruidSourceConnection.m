@implementation _UIDruidSourceConnection

- (_UIDruidSourceConnection)init
{
  _UIDruidSourceConnection *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  OS_dispatch_source *connectionWatchdogTimer;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIDruidSourceConnection;
  v2 = -[_UIDruidSourceConnection init](&v16, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.DragUI.druid.source"), 0);
    _UIDraggingConnectionXPCQueue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setQueue:", v4);

    objc_storeStrong((id *)&v2->_connection, v3);
    objc_initWeak(&location, v2);
    v5 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32___UIDruidSourceConnection_init__block_invoke;
    v13[3] = &unk_1E16B1B28;
    v6 = v3;
    v14 = v6;
    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", v13);
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __32___UIDruidSourceConnection_init__block_invoke_2;
    v11[3] = &unk_1E16B3F40;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", v11);
    _DUINewServerSourceInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v7);

    _DUINewClientSourceInterface();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v2->_connection, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](v2->_connection, "setExportedObject:", v2);
    connectionWatchdogTimer = v2->_connectionWatchdogTimer;
    v2->_connectionWatchdogTimer = 0;

    -[NSXPCConnection resume](v2->_connection, "resume");
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)beginDragWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  char IsBeingDebugged;
  uint64_t v15;
  OS_dispatch_source *v16;
  OS_dispatch_source *connectionWatchdogTimer;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  NSXPCConnection *connection;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  _QWORD aBlock[5];
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD handler[4];
  id v51;
  id buf;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "touchIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(v6, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axEndpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 || (objc_msgSend(v6, "initiatedWithPointer") & 1) != 0)
  {

  }
  else if ((v9 - 3) <= 0xFFFFFFFD)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("touches must have 1 or 2 objects"));
  }
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("items must be non-nil"));
  if (objc_msgSend(v10, "count"))
  {
    if (v7)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("items must not be empty"));
    if (v7)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("completion must be non-nil"));
LABEL_8:
  v12 = beginDragWithConfiguration_completion____s_category;
  if (!beginDragWithConfiguration_completion____s_category)
  {
    v12 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v12, (unint64_t *)&beginDragWithConfiguration_completion____s_category);
  }
  v13 = *(NSObject **)(v12 + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection beginDragWithTouches:items:completion:", (uint8_t *)&buf, 2u);
  }
  if (-[_UIDruidSourceConnection isCancelled](self, "isCancelled"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
  }
  v39 = v7;
  IsBeingDebugged = _UIKitProcessIsBeingDebugged();
  v15 = MEMORY[0x1E0C809B0];
  if ((IsBeingDebugged & 1) == 0)
  {
    v16 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    connectionWatchdogTimer = self->_connectionWatchdogTimer;
    self->_connectionWatchdogTimer = v16;

    v18 = self->_connectionWatchdogTimer;
    v19 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0xBEBC200uLL);
    objc_initWeak(&buf, self);
    v20 = self->_connectionWatchdogTimer;
    handler[0] = v15;
    handler[1] = 3221225472;
    handler[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke;
    handler[3] = &unk_1E16B3F40;
    objc_copyWeak(&v51, &buf);
    dispatch_source_set_event_handler(v20, handler);
    objc_destroyWeak(&v51);
    objc_destroyWeak(&buf);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count", v39));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v22 = v10;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "itemProvider");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0B8]), "initWithNSItemProvider:", v27);
        objc_msgSend(v21, "addObject:", v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v24);
  }

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0C0]), "initWithItems:", v21);
  objc_msgSend(v29, "setOriginatorDataOwner:", objc_msgSend(v6, "dataOwner"));
  objc_msgSend(v6, "setItemCollection:", v29);
  objc_msgSend(v29, "dataConsumersEndpoint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDataProviderEndpoint:", v30);

  v31 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_545;
  aBlock[3] = &unk_1E16C4638;
  aBlock[4] = self;
  v32 = v40;
  v45 = v32;
  v33 = v6;
  v44 = v33;
  v34 = _Block_copy(aBlock);
  connection = self->_connection;
  v41[0] = v31;
  v41[1] = 3221225472;
  v41[2] = __66___UIDruidSourceConnection_beginDragWithConfiguration_completion___block_invoke_2_548;
  v41[3] = &unk_1E16C4660;
  v36 = v32;
  v41[4] = self;
  v42 = v36;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v41);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "beginDragWithClientSession:configuration:reply:", self, v33, v34);
  v38 = self->_connectionWatchdogTimer;
  if (v38)
    dispatch_activate(v38);

}

- (void)dirtyItems:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = dirtyItems____s_category;
  if (!dirtyItems____s_category)
  {
    v5 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&dirtyItems____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection dirtyItems:", v7, 2u);
  }
  -[_DUIServerSessionSource dirtySourceItems:](self->_serverSession, "dirtySourceItems:", v4);

}

- (void)takeInsideAppSourceOperationMask:(unint64_t)a3 outsideAppSourceOperationMask:(unint64_t)a4 prefersFullSizePreview:(BOOL)a5
{
  -[_DUIServerSessionSource takeOutsideAppSourceOperationMask:prefersFullSizePreview:](self->_serverSession, "takeOutsideAppSourceOperationMask:prefersFullSizePreview:", a4, a5);
}

- (void)dragDidExitApp
{
  -[_DUIServerSessionSource dragDidExitSourceApp](self->_serverSession, "dragDidExitSourceApp");
}

- (id)addItems:(id)a3 withOldItemCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _DUIServerSessionSource *serverSession;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        v15 = objc_alloc(MEMORY[0x1E0D6C0B8]);
        objc_msgSend(v14, "itemProvider", (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithNSItemProvider:", v16);

        objc_msgSend(v8, "addObject:", v17);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0C0]), "initWithItems:", v8);
  serverSession = self->_serverSession;
  objc_msgSend(v18, "dataConsumersEndpoint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DUIServerSessionSource addItemCollection:dataProviderEndpoint:](serverSession, "addItemCollection:dataProviderEndpoint:", v18, v20);

  return v18;
}

- (void)cancelDrag
{
  self->_cancelled = 1;
  if (self->_serverSession)
    -[_DUIServerSessionSource cancelDrag](self->_serverSession, "cancelDrag");
  else
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)requestDragPreviewsForIndexSet:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = requestDragPreviewsForIndexSet_reply____s_category;
  if (!requestDragPreviewsForIndexSet_reply____s_category)
  {
    v8 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&requestDragPreviewsForIndexSet_reply____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection requestDragPreviewsForIndexSet:reply: %@", buf, 0xCu);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65___UIDruidSourceConnection_requestDragPreviewsForIndexSet_reply___block_invoke;
  v13[3] = &unk_1E16BAD68;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performAsync:", v13);

}

- (void)updatedPresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48___UIDruidSourceConnection_updatedPresentation___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", v7);

}

- (void)canHandOffCancelledItems:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = canHandOffCancelledItems_withReply____s_category;
  if (!canHandOffCancelledItems_withReply____s_category)
  {
    v8 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&canHandOffCancelledItems_withReply____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection canHandOffCancelledItems:withReply:", buf, 2u);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63___UIDruidSourceConnection_canHandOffCancelledItems_withReply___block_invoke;
  v13[3] = &unk_1E16BAD68;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performAsync:", v13);

}

- (void)handOffCancelledItems:(id)a3 withFence:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = handOffCancelledItems_withFence____s_category;
  if (!handOffCancelledItems_withFence____s_category)
  {
    v8 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&handOffCancelledItems_withFence____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection handOffCancelledItems:withFence", buf, 2u);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60___UIDruidSourceConnection_handOffCancelledItems_withFence___block_invoke;
  v13[3] = &unk_1E16B47A8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performAsync:", v13);

}

- (void)dragEndedWithOperation:(unint64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = dragEndedWithOperation____s_category;
  if (!dragEndedWithOperation____s_category)
  {
    v5 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&dragEndedWithOperation____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = a3;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection dragEndedWithOperation:%ld", buf, 0xCu);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___UIDruidSourceConnection_dragEndedWithOperation___block_invoke;
  v8[3] = &unk_1E16B1888;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend(v7, "performAsync:", v8);

}

- (void)dragFailed
{
  unint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = dragFailed___s_category;
  if (!dragFailed___s_category)
  {
    v3 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&dragFailed___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "_UIDruidSourceConnection dragFailed", v5, 2u);
  }
  -[_UIDruidSourceConnection _internalDragFailed](self, "_internalDragFailed");
}

- (void)dataTransferSessionFinished
{
  void *v3;
  _QWORD v4[5];

  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55___UIDruidSourceConnection_dataTransferSessionFinished__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "performAsync:", v4);

}

- (void)_internalDragFailed
{
  void *v3;
  _QWORD v4[5];

  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47___UIDruidSourceConnection__internalDragFailed__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "performAsync:", v4);

}

- (id)dragPreviewProviderBlock
{
  return self->_dragPreviewProviderBlock;
}

- (void)setDragPreviewProviderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)canHandOffCancelledItemsBlock
{
  return self->_canHandOffCancelledItemsBlock;
}

- (void)setCanHandOffCancelledItemsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)handOffCancelledItemsBlock
{
  return self->_handOffCancelledItemsBlock;
}

- (void)setHandOffCancelledItemsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)dragCompletionBlock
{
  return self->_dragCompletionBlock;
}

- (void)setDragCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)dataTransferFinishedBlock
{
  return self->_dataTransferFinishedBlock;
}

- (void)setDataTransferFinishedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)updatedPresentationBlock
{
  return self->_updatedPresentationBlock;
}

- (void)setUpdatedPresentationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedPresentationBlock, 0);
  objc_storeStrong(&self->_dataTransferFinishedBlock, 0);
  objc_storeStrong(&self->_dragCompletionBlock, 0);
  objc_storeStrong(&self->_handOffCancelledItemsBlock, 0);
  objc_storeStrong(&self->_canHandOffCancelledItemsBlock, 0);
  objc_storeStrong(&self->_dragPreviewProviderBlock, 0);
  objc_storeStrong((id *)&self->_serverSession, 0);
  objc_storeStrong((id *)&self->_connectionWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
