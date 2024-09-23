@implementation WFSystemSurfaceWorkflowStatusUpdater

- (WFSystemSurfaceWorkflowStatusUpdater)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4
{
  id v8;
  id v9;
  WFSystemSurfaceWorkflowStatusUpdater *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  WFSystemSurfaceWorkflowStatusRegistry *v15;
  WFSystemSurfaceWorkflowStatusRegistry *registry;
  NSObject *v17;
  WFSystemSurfaceWorkflowStatusUpdater *v18;
  WFSystemSurfaceWorkflowStatusUpdater *v19;
  void *v21;
  _QWORD block[4];
  WFSystemSurfaceWorkflowStatusUpdater *v23;
  id v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSystemSurfaceWorkflowStatusUpdater.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseProvider"));

  }
  v25.receiver = self;
  v25.super_class = (Class)WFSystemSurfaceWorkflowStatusUpdater;
  v10 = -[WFSystemSurfaceWorkflowStatusUpdater init](&v25, sel_init);
  if (v10)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.shortcuts.WFSystemSurfaceWorkflowStatusUpdater", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v15 = (WFSystemSurfaceWorkflowStatusRegistry *)objc_alloc_init(MEMORY[0x1E0DC7DB8]);
    registry = v10->_registry;
    v10->_registry = v15;

    objc_storeStrong((id *)&v10->_databaseProvider, a3);
    -[WFSystemSurfaceWorkflowStatusUpdater queue](v10, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__WFSystemSurfaceWorkflowStatusUpdater_initWithDatabaseProvider_eventHandler___block_invoke;
    block[3] = &unk_1E7AA8138;
    v18 = v10;
    v23 = v18;
    v24 = v9;
    dispatch_async(v17, block);

    v19 = v18;
  }

  return v10;
}

- (void)startIfPossible
{
  NSObject *v3;
  _QWORD block[5];

  -[WFSystemSurfaceWorkflowStatusUpdater queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WFSystemSurfaceWorkflowStatusUpdater_startIfPossible__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)queue_startIfPossible
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[WFSystemSurfaceWorkflowStatusUpdater queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[WFSystemSurfaceWorkflowStatusUpdater databaseProvider](self, "databaseProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v4, "databaseWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v5)
  {
    objc_msgSend(v5, "addObjectObserver:", self);
    -[WFSystemSurfaceWorkflowStatusUpdater queue_updateFromDatabase:](self, "queue_updateFromDatabase:", v5);
  }
  else
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFSystemSurfaceWorkflowStatusUpdater queue_startIfPossible]";
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to load database, assuming no shortcuts are present to show in system surfaces: %{public}@", buf, 0x16u);
    }

    -[WFSystemSurfaceWorkflowStatusUpdater registry](self, "registry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStatus:forSystemSurface:", 1, 0);

  }
}

- (void)queue_updateFromDatabase:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFSystemSurfaceWorkflowStatusUpdater queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "sortedVisibleWorkflowsWithType:", *MEMORY[0x1E0DC8500]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  getWFGeneralLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = CFSTR("YES");
    if (!v7)
      v9 = CFSTR("NO");
    v17 = 136315394;
    v18 = "-[WFSystemSurfaceWorkflowStatusUpdater queue_updateFromDatabase:]";
    v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, "%s Setting share sheet shortcuts present to %{public}@", (uint8_t *)&v17, 0x16u);
  }

  -[WFSystemSurfaceWorkflowStatusUpdater registry](self, "registry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    v12 = 2;
  else
    v12 = 1;
  objc_msgSend(v10, "setStatus:forSystemSurface:", v12, 0);

  +[WFShareSheetState shareSheetShortcuts](WFShareSheetState, "shareSheetShortcuts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "descriptors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSystemSurfaceWorkflowStatusUpdater shareSheetStateForWorkflows:database:](self, "shareSheetStateForWorkflows:database:", v14, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && (objc_msgSend(v15, "isEqualToDictionary:", v13) & 1) != 0)
    {
      +[WFShareSheetState setShareSheetShortcuts:](WFShareSheetState, "setShareSheetShortcuts:", v15);
LABEL_17:

      goto LABEL_18;
    }
    +[WFShareSheetState setShareSheetShortcuts:](WFShareSheetState, "setShareSheetShortcuts:", v15);

LABEL_14:
    getWFGeneralLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = 136315138;
      v18 = "-[WFSystemSurfaceWorkflowStatusUpdater queue_updateFromDatabase:]";
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_INFO, "%s Posting share sheet workflows change notification", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", *MEMORY[0x1E0DC82B0], 0);
    goto LABEL_17;
  }
  +[WFShareSheetState setShareSheetShortcuts:](WFShareSheetState, "setShareSheetShortcuts:", 0);
  if (v13)
    goto LABEL_14;
LABEL_18:

}

- (id)shareSheetStateForWorkflows:(id)a3 database:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1C3BAFA00]();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("inputClasses"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recordWithDescriptor:properties:error:", v12, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "inputClasses");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = v16;
        else
          v18 = MEMORY[0x1E0C9AA60];
        objc_msgSend(v12, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v18, v19);

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  return v7;
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;

  v9 = a3;
  if (WFDatabaseChangesContainObjectType(0, a4, v10, v11, v12, v13, v14, v15, (uint64_t)a5))
  {
    -[WFSystemSurfaceWorkflowStatusUpdater queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__WFSystemSurfaceWorkflowStatusUpdater_databaseDidChange_modified_inserted_removed___block_invoke;
    block[3] = &unk_1E7AA8138;
    block[4] = self;
    v18 = v9;
    dispatch_async(v16, block);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (WFSystemSurfaceWorkflowStatusRegistry)registry
{
  return self->_registry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __84__WFSystemSurfaceWorkflowStatusUpdater_databaseDidChange_modified_inserted_removed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_updateFromDatabase:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__WFSystemSurfaceWorkflowStatusUpdater_startIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_startIfPossible");
}

uint64_t __78__WFSystemSurfaceWorkflowStatusUpdater_initWithDatabaseProvider_eventHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_startIfPossible");
  return objc_msgSend(*(id *)(a1 + 40), "addObserver:selector:name:", *(_QWORD *)(a1 + 32), sel_startIfPossible, CFSTR("com.apple.mobile.keybagd.first_unlock"));
}

@end
