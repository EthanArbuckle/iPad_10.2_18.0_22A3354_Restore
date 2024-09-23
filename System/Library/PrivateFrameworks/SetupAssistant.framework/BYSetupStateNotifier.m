@implementation BYSetupStateNotifier

- (unint64_t)currentState
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[BYSetupStateNotifier notificationQueue](self, "notificationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__BYSetupStateNotifier_currentState__block_invoke;
  v6[3] = &unk_1E4E28048;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

uint64_t __36__BYSetupStateNotifier_currentState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

+ (id)sharedNotifier
{
  if (sharedNotifier_onceToken != -1)
    dispatch_once(&sharedNotifier_onceToken, &__block_literal_global_22);
  return (id)sharedNotifier_notifier;
}

void __38__BYSetupStateNotifier_sharedNotifier__block_invoke()
{
  BYSetupStateNotifier *v0;
  void *v1;

  v0 = objc_alloc_init(BYSetupStateNotifier);
  v1 = (void *)sharedNotifier_notifier;
  sharedNotifier_notifier = (uint64_t)v0;

}

- (BYSetupStateNotifier)init
{
  BYSetupStateNotifier *v2;
  BYSetupStateNotifier *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *notificationQueue;
  NSMutableArray *v6;
  NSMutableArray *generalStateNotificationBlocks;
  NSMutableDictionary *v8;
  NSMutableDictionary *specificStateNotificationBlocks;
  NSMutableArray *v10;
  NSMutableArray *exclusiveNotificationBlocks;
  NSMutableArray *v12;
  NSMutableArray *relaunchStateNotificationBlocks;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BYSetupStateNotifier;
  v2 = -[BYSetupStateNotifier init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v4 = dispatch_queue_create("Setup State Notification Queue", 0);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    generalStateNotificationBlocks = v3->_generalStateNotificationBlocks;
    v3->_generalStateNotificationBlocks = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    specificStateNotificationBlocks = v3->_specificStateNotificationBlocks;
    v3->_specificStateNotificationBlocks = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    exclusiveNotificationBlocks = v3->_exclusiveNotificationBlocks;
    v3->_exclusiveNotificationBlocks = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    relaunchStateNotificationBlocks = v3->_relaunchStateNotificationBlocks;
    v3->_relaunchStateNotificationBlocks = v12;

    -[BYSetupStateNotifier _beginObservingState](v3, "_beginObservingState");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BYSetupStateNotifier _endObservingState](self, "_endObservingState");
  v3.receiver = self;
  v3.super_class = (Class)BYSetupStateNotifier;
  -[BYSetupStateNotifier dealloc](&v3, sel_dealloc);
}

- (void)addStateChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BYSetupStateNotifier notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__BYSetupStateNotifier_addStateChangeObserver___block_invoke;
  block[3] = &unk_1E4E27178;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __47__BYSetupStateNotifier_addStateChangeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "generalStateNotificationBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A85AAF94](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  if (objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__BYSetupStateNotifier_addStateChangeObserver___block_invoke_2;
    v6[3] = &unk_1E4E28070;
    v5 = *(id *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    dispatch_async(v4, v6);

  }
}

uint64_t __47__BYSetupStateNotifier_addStateChangeObserver___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "state"));
}

- (void)addStateCompletionObserver:(id)a3 forState:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[BYSetupStateNotifier notificationQueue](self, "notificationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__BYSetupStateNotifier_addStateCompletionObserver_forState___block_invoke;
  block[3] = &unk_1E4E28098;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(v7, block);

}

void __60__BYSetupStateNotifier_addStateCompletionObserver_forState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[4];
  id v10;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "state") >= *(_QWORD *)(a1 + 48))
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__BYSetupStateNotifier_addStateCompletionObserver_forState___block_invoke_2;
    block[3] = &unk_1E4E26FC0;
    v10 = *(id *)(a1 + 40);
    dispatch_async(v2, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "specificStateNotificationBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)MEMORY[0x1A85AAF94](*(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "specificStateNotificationBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, v8);

}

uint64_t __60__BYSetupStateNotifier_addStateCompletionObserver_forState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addObserverWhenSetupIsNoLongerExclusiveWithNotificationBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BYSetupStateNotifier notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__BYSetupStateNotifier_addObserverWhenSetupIsNoLongerExclusiveWithNotificationBlock___block_invoke;
  block[3] = &unk_1E4E27178;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __85__BYSetupStateNotifier_addObserverWhenSetupIsNoLongerExclusiveWithNotificationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "exclusiveNotificationBlocks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1A85AAF94](*(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v2);

}

- (void)addRelaunchStateChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BYSetupStateNotifier notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__BYSetupStateNotifier_addRelaunchStateChangeObserver___block_invoke;
  block[3] = &unk_1E4E27178;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __55__BYSetupStateNotifier_addRelaunchStateChangeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "relaunchStateNotificationBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1A85AAF94](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__BYSetupStateNotifier_addRelaunchStateChangeObserver___block_invoke_2;
  v6[3] = &unk_1E4E28070;
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(v4, v6);

}

uint64_t __55__BYSetupStateNotifier_addRelaunchStateChangeObserver___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "shouldRelaunchSetup"));
}

- (void)notifyStateChangedTo:(unint64_t)a3
{
  CFNotificationName *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  BOOL is_valid_token;
  NSObject *v8;
  NSObject *v9;
  uint32_t v10;
  int v11;
  NSObject *v12;

  if (a3 - 1 <= 2)
  {
    v5 = (CFNotificationName *)(&off_1E4E28108)[a3 - 1];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, *v5, 0, 0, 0);
  }
  is_valid_token = notify_is_valid_token(-[BYSetupStateNotifier stateNotificationToken](self, "stateNotificationToken"));
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!is_valid_token)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BYSetupStateNotifier notifyStateChangedTo:].cold.4(v9);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[BYSetupStateNotifier notifyStateChangedTo:].cold.3(a3, v9);

  v10 = notify_set_state(-[BYSetupStateNotifier stateNotificationToken](self, "stateNotificationToken"), a3);
  if (v10)
  {
    v11 = v10;
    _BYLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BYSetupStateNotifier notifyStateChangedTo:].cold.2(a3, v11, v12);

  }
  if (notify_post("com.apple.purplebuddy.setupStateChanged"))
  {
    _BYLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BYSetupStateNotifier notifyStateChangedTo:].cold.1();
LABEL_15:

  }
}

- (void)notifySetupShouldRemainAlive
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4E92000, log, OS_LOG_TYPE_DEBUG, "Updating remaining alive notification...", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_beginObservingState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, v0, v1, "Failed to get the register for state notification changes: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __44__BYSetupStateNotifier__beginObservingState__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t state64;

  state64 = 0;
  if (notify_get_state(objc_msgSend(*(id *)(a1 + 32), "stateNotificationToken"), &state64))
  {
    _BYLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __44__BYSetupStateNotifier__beginObservingState__block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_stateChangedTo:", state64);
  }
}

uint64_t __44__BYSetupStateNotifier__beginObservingState__block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "stateNotificationToken"));
}

uint64_t __44__BYSetupStateNotifier__beginObservingState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noLongerExclusiveNotificationFired");
}

uint64_t __44__BYSetupStateNotifier__beginObservingState__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldRemainAliveNotificationFired");
}

- (void)_endObservingState
{
  notify_cancel(-[BYSetupStateNotifier stateNotificationToken](self, "stateNotificationToken"));
  notify_cancel(-[BYSetupStateNotifier exclusiveNotificationToken](self, "exclusiveNotificationToken"));
  -[BYSetupStateNotifier setStateNotificationToken:](self, "setStateNotificationToken:", 0xFFFFFFFFLL);
  -[BYSetupStateNotifier setExclusiveNotificationToken:](self, "setExclusiveNotificationToken:", 0xFFFFFFFFLL);
}

- (void)_stateChangedTo:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[7];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[BYSetupStateNotifier notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[BYSetupStateNotifier state](self, "state") != a3)
  {
    v6 = -[BYSetupStateNotifier state](self, "state");
    -[BYSetupStateNotifier setState:](self, "setState:", a3);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[BYSetupStateNotifier generalStateNotificationBlocks](self, "generalStateNotificationBlocks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v11);
          dispatch_get_global_queue(0, 0);
          v13 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __40__BYSetupStateNotifier__stateChangedTo___block_invoke;
          block[3] = &unk_1E4E280C0;
          block[5] = v12;
          block[6] = v6;
          block[4] = self;
          dispatch_async(v13, block);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v9);
    }

    -[BYSetupStateNotifier specificStateNotificationBlocks](self, "specificStateNotificationBlocks");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[BYSetupStateNotifier state](self, "state"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21);
          dispatch_get_global_queue(0, 0);
          v23 = objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __40__BYSetupStateNotifier__stateChangedTo___block_invoke_2;
          v24[3] = &unk_1E4E26FC0;
          v24[4] = v22;
          dispatch_async(v23, v24);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v19);
    }

  }
}

uint64_t __40__BYSetupStateNotifier__stateChangedTo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "state"));
}

uint64_t __40__BYSetupStateNotifier__stateChangedTo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_noLongerExclusiveNotificationFired
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  BOOL v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD block[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[BYSetupStateNotifier exclusiveNotificationBlocks](self, "exclusiveNotificationBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v8);
        dispatch_get_global_queue(0, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __59__BYSetupStateNotifier__noLongerExclusiveNotificationFired__block_invoke;
        block[3] = &unk_1E4E26FC0;
        block[4] = v9;
        dispatch_async(v10, block);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  -[BYSetupStateNotifier setShouldRelaunchSetup:](self, "setShouldRelaunchSetup:", 0);
  v11 = -[BYSetupStateNotifier shouldRelaunchSetup](self, "shouldRelaunchSetup");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[BYSetupStateNotifier relaunchStateNotificationBlocks](self, "relaunchStateNotificationBlocks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
        dispatch_get_global_queue(0, 0);
        v18 = objc_claimAutoreleasedReturnValue();
        v19[0] = v5;
        v19[1] = 3221225472;
        v19[2] = __59__BYSetupStateNotifier__noLongerExclusiveNotificationFired__block_invoke_2;
        v19[3] = &unk_1E4E280E8;
        v19[4] = v17;
        v20 = v11;
        dispatch_async(v18, v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v14);
  }

}

uint64_t __59__BYSetupStateNotifier__noLongerExclusiveNotificationFired__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__BYSetupStateNotifier__noLongerExclusiveNotificationFired__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_shouldRemainAliveNotificationFired
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, v0, v1, "Failed to get the state of the should remain alive notification: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __59__BYSetupStateNotifier__shouldRemainAliveNotificationFired__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)generalStateNotificationBlocks
{
  return self->_generalStateNotificationBlocks;
}

- (void)setGeneralStateNotificationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_generalStateNotificationBlocks, a3);
}

- (NSMutableDictionary)specificStateNotificationBlocks
{
  return self->_specificStateNotificationBlocks;
}

- (void)setSpecificStateNotificationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_specificStateNotificationBlocks, a3);
}

- (NSMutableArray)exclusiveNotificationBlocks
{
  return self->_exclusiveNotificationBlocks;
}

- (void)setExclusiveNotificationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_exclusiveNotificationBlocks, a3);
}

- (NSMutableArray)relaunchStateNotificationBlocks
{
  return self->_relaunchStateNotificationBlocks;
}

- (void)setRelaunchStateNotificationBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_relaunchStateNotificationBlocks, a3);
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (BOOL)shouldRelaunchSetup
{
  return self->_shouldRelaunchSetup;
}

- (void)setShouldRelaunchSetup:(BOOL)a3
{
  self->_shouldRelaunchSetup = a3;
}

- (int)stateNotificationToken
{
  return self->_stateNotificationToken;
}

- (void)setStateNotificationToken:(int)a3
{
  self->_stateNotificationToken = a3;
}

- (int)shouldRemainAliveNotificationToken
{
  return self->_shouldRemainAliveNotificationToken;
}

- (void)setShouldRemainAliveNotificationToken:(int)a3
{
  self->_shouldRemainAliveNotificationToken = a3;
}

- (int)exclusiveNotificationToken
{
  return self->_exclusiveNotificationToken;
}

- (void)setExclusiveNotificationToken:(int)a3
{
  self->_exclusiveNotificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_relaunchStateNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_exclusiveNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_specificStateNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_generalStateNotificationBlocks, 0);
}

- (void)notifyStateChangedTo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, v0, v1, "Failed to post state notification: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)notifyStateChangedTo:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1A4E92000, log, OS_LOG_TYPE_ERROR, "Failed to update state notification to %ld: %d", (uint8_t *)&v3, 0x12u);
}

- (void)notifyStateChangedTo:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_DEBUG, "Updating state notification to %ld...", (uint8_t *)&v2, 0xCu);
}

- (void)notifyStateChangedTo:(os_log_t)log .cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E92000, log, OS_LOG_TYPE_ERROR, "Unable to update state notification; state notification token is invalid!",
    v1,
    2u);
  OUTLINED_FUNCTION_1();
}

void __44__BYSetupStateNotifier__beginObservingState__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4E92000, v0, v1, "Failed to get the state of the state notification: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
