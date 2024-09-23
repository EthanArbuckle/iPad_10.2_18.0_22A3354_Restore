@implementation _UIDruidDestinationConnection

- (id)serverDestinationProxyWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a3);
}

- (_UIDruidDestinationConnection)initWithSessionIdentifier:(unsigned int)a3 systemPolicy:(BOOL)a4
{
  _UIDruidDestinationConnection *v7;
  _UIDruidDestinationConnection *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Drag destination's session identifier must be non-zero"));
  v21.receiver = self;
  v21.super_class = (Class)_UIDruidDestinationConnection;
  v7 = -[_UIDruidDestinationConnection init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_sessionIdentifier = a3;
    v7->_state = 0;
    v7->_systemPolicy = a4;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.DragUI.druid.destination"), 0);
    _UIDraggingConnectionXPCQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setQueue:", v10);

    objc_storeStrong((id *)&v8->_connection, v9);
    objc_initWeak(&location, v8);
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke;
    v18[3] = &unk_1E16B1B28;
    v12 = v9;
    v19 = v12;
    -[NSXPCConnection setInterruptionHandler:](v8->_connection, "setInterruptionHandler:", v18);
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke_2;
    v16[3] = &unk_1E16B3F40;
    objc_copyWeak(&v17, &location);
    -[NSXPCConnection setInvalidationHandler:](v8->_connection, "setInvalidationHandler:", v16);
    _DUINewServerDestinationInterface();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8->_connection, "setRemoteObjectInterface:", v13);

    _DUINewClientDestinationInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8->_connection, "setExportedInterface:", v14);

    -[NSXPCConnection setExportedObject:](v8->_connection, "setExportedObject:", v8);
    -[NSXPCConnection resume](v8->_connection, "resume");
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v8;
}

- (void)connect
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD aBlock[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___UIDruidDestinationConnection_connect__block_invoke;
  aBlock[3] = &unk_1E16C46D8;
  objc_copyWeak(&v9, &location);
  v4 = _Block_copy(aBlock);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __40___UIDruidDestinationConnection_connect__block_invoke_2;
  v6[3] = &unk_1E16C4700;
  objc_copyWeak(&v7, &location);
  -[_UIDruidDestinationConnection serverDestinationProxyWithErrorHandler:](self, "serverDestinationProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sawFirstDragEventWithSessionID:systemPolicy:destination:completion:", -[_UIDruidDestinationConnection sessionIdentifier](self, "sessionIdentifier"), -[_UIDruidDestinationConnection isSystemPolicy](self, "isSystemPolicy"), self, v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)dirtyItems:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = dirtyItems____s_category_647;
  if (!dirtyItems____s_category_647)
  {
    v5 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&dirtyItems____s_category_647);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection dirtyItems:", v7, 2u);
  }
  -[_DUIServerSessionDestination dirtyDestinationItems:](self->_serverSession, "dirtyDestinationItems:", v4);

}

- (void)sawDragEndEvent
{
  unint64_t v3;
  NSObject *v4;
  int64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = sawDragEndEvent___s_category;
  if (!sawDragEndEvent___s_category)
  {
    v3 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&sawDragEndEvent___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection sawDragEndEvent", v7, 2u);
  }
  v5 = -[_UIDruidDestinationConnection state](self, "state");
  if (v5)
  {
    if (v5 != 1)
      return;
    v6 = 2;
  }
  else
  {
    v6 = 5;
  }
  -[_UIDruidDestinationConnection setState:](self, "setState:", v6);
}

- (void)takePotentialDrop:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = takePotentialDrop____s_category;
  if (!takePotentialDrop____s_category)
  {
    v5 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&takePotentialDrop____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection takePotentialDrop:%@", (uint8_t *)&v7, 0xCu);
  }
  if (-[_UIDruidDestinationConnection state](self, "state") == 1)
    -[_DUIServerSessionDestination takePotentialDrop:](self->_serverSession, "takePotentialDrop:", v4);

}

- (void)requestDropWithOperation:(unint64_t)a3 layerContext:(id)a4
{
  id v6;
  unint64_t v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = requestDropWithOperation_layerContext____s_category;
  if (!requestDropWithOperation_layerContext____s_category)
  {
    v7 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&requestDropWithOperation_layerContext____s_category);
  }
  v8 = *(NSObject **)(v7 + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection requestDropWithOperation:%lu", (uint8_t *)&v9, 0xCu);
  }
  if (-[_UIDruidDestinationConnection state](self, "state") == 1)
    -[_DUIServerSessionDestination requestDropWithOperation:layerContext:](self->_serverSession, "requestDropWithOperation:layerContext:", a3, v6);

}

- (void)enableKeyboardIfNeeded
{
  -[_DUIServerSessionDestination enableKeyboardIfNeeded](self->_serverSession, "enableKeyboardIfNeeded");
}

- (void)requestVisibleItems:(id)a3
{
  -[_DUIServerSessionDestination requestVisibleItemsWithReply:](self->_serverSession, "requestVisibleItemsWithReply:", a3);
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
  v8 = requestDragPreviewsForIndexSet_reply____s_category_648;
  if (!requestDragPreviewsForIndexSet_reply____s_category_648)
  {
    v8 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&requestDragPreviewsForIndexSet_reply____s_category_648);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection requestDragPreviewsForIndexSet:reply: %@", buf, 0xCu);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70___UIDruidDestinationConnection_requestDragPreviewsForIndexSet_reply___block_invoke;
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
  v7[2] = __53___UIDruidDestinationConnection_updatedPresentation___block_invoke;
  v7[3] = &unk_1E16B1B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performAsync:", v7);

}

- (void)addedItemCollection:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = addedItemCollection____s_category;
  if (!addedItemCollection____s_category)
  {
    v5 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&addedItemCollection____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection addedItemCollection:", buf, 2u);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53___UIDruidDestinationConnection_addedItemCollection___block_invoke;
  v9[3] = &unk_1E16B1B50;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "performAsync:", v9);

}

- (void)performDropWithItemCollection:(id)a3 dataProviderEndpoint:(id)a4 visibleDroppedItems:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion____s_category;
  if (!performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion____s_category)
  {
    v14 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v14, (unint64_t *)&performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion____s_category);
  }
  v15 = *(NSObject **)(v14 + 8);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection performDropWithItemCollection:...", buf, 2u);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __115___UIDruidDestinationConnection_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion___block_invoke;
  v21[3] = &unk_1E16C0EF8;
  v21[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  objc_msgSend(v16, "performAsync:", v21);

}

- (void)handOffDroppedItems:(id)a3 withFence:(id)a4
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
  v8 = handOffDroppedItems_withFence____s_category;
  if (!handOffDroppedItems_withFence____s_category)
  {
    v8 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v8, (unint64_t *)&handOffDroppedItems_withFence____s_category);
  }
  v9 = *(NSObject **)(v8 + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection handOffDroppedItems:withFence:", buf, 2u);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63___UIDruidDestinationConnection_handOffDroppedItems_withFence___block_invoke;
  v13[3] = &unk_1E16B47A8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "performAsync:", v13);

}

- (void)dragEnded
{
  unint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = dragEnded___s_category;
  if (!dragEnded___s_category)
  {
    v3 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&dragEnded___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection: dragEnded", buf, 2u);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42___UIDruidDestinationConnection_dragEnded__block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  objc_msgSend(v5, "performAsync:", v6);

}

- (void)setState:(int64_t)a3
{
  unint64_t state;
  unint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    v6 = setState____s_category_653;
    if (!setState____s_category_653)
    {
      v6 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&setState____s_category_653);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      stringFromDraggingSessionDestinationState(state);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      stringFromDraggingSessionDestinationState(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "_UIInternalDraggingSessionDestination: State changing from %@ to %@", (uint8_t *)&v14, 0x16u);

    }
    if (state - 2 >= 2 && state != 0)
    {
      if (state == 1)
      {
        if (a3 == 2)
        {
          -[_DUIServerSessionDestination sawDragEndEvent](self->_serverSession, "sawDragEndEvent");
          return;
        }
      }
      else if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Should not transition from a terminal state to a non-terminal state"));
      }
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      -[_UIDruidDestinationConnection dragEndBlock](self, "dragEndBlock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[_UIDruidDestinationConnection dragEndBlock](self, "dragEndBlock");
        v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, BOOL))v13)[2](v13, a3 == 4);

      }
      -[_UIDruidDestinationConnection setConnectionBlock:](self, "setConnectionBlock:", 0);
      -[_UIDruidDestinationConnection setDragPreviewProviderBlock:](self, "setDragPreviewProviderBlock:", 0);
      -[_UIDruidDestinationConnection setHandOffDroppedItemsBlock:](self, "setHandOffDroppedItemsBlock:", 0);
      -[_UIDruidDestinationConnection setDropPerformBlock:](self, "setDropPerformBlock:", 0);
      -[_UIDruidDestinationConnection setDragEndBlock:](self, "setDragEndBlock:", 0);
      -[NSXPCConnection invalidate](self->_connection, "invalidate");
    }
  }
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (id)connectionBlock
{
  return self->_connectionBlock;
}

- (void)setConnectionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)dragEndBlock
{
  return self->_dragEndBlock;
}

- (void)setDragEndBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)dropPerformBlock
{
  return self->_dropPerformBlock;
}

- (void)setDropPerformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)handOffDroppedItemsBlock
{
  return self->_handOffDroppedItemsBlock;
}

- (void)setHandOffDroppedItemsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)dragPreviewProviderBlock
{
  return self->_dragPreviewProviderBlock;
}

- (void)setDragPreviewProviderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)itemsAddedBlock
{
  return self->_itemsAddedBlock;
}

- (void)setItemsAddedBlock:(id)a3
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

- (int64_t)state
{
  return self->_state;
}

- (BOOL)isSystemPolicy
{
  return self->_systemPolicy;
}

- (void)setSystemPolicy:(BOOL)a3
{
  self->_systemPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatedPresentationBlock, 0);
  objc_storeStrong(&self->_itemsAddedBlock, 0);
  objc_storeStrong(&self->_dragPreviewProviderBlock, 0);
  objc_storeStrong(&self->_handOffDroppedItemsBlock, 0);
  objc_storeStrong(&self->_dropPerformBlock, 0);
  objc_storeStrong(&self->_dragEndBlock, 0);
  objc_storeStrong(&self->_connectionBlock, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serverSession, 0);
}

@end
