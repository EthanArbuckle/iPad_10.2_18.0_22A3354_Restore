@implementation PPRecordMonitoringHelper

- (PPRecordMonitoringHelper)initWithName:(id)a3
{
  id v5;
  PPRecordMonitoringHelper *v6;
  PPRecordMonitoringHelper *v7;
  uint64_t v8;
  NSHashTable *delegates;
  NSObject *v10;
  NSObject *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PPRecordMonitoringHelper;
  v6 = -[PPRecordMonitoringHelper init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v8 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.proactive.PersonalizationPortrait.monitorHelper.%@"), v7->_name));
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), v11);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    v7->_hasRegistered = 0;
  }

  return v7;
}

- (BOOL)loadRecordsAndMonitorChangesWithDelegate:(id)a3 recordGenerator:(id)a4 notificationRegistrationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  PPRecordMonitoringHelper *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  location = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __115__PPRecordMonitoringHelper_loadRecordsAndMonitorChangesWithDelegate_recordGenerator_notificationRegistrationBlock___block_invoke;
  v16[3] = &unk_1E226A768;
  v17 = v8;
  v18 = self;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  objc_copyWeak(&v21, &location);
  v20 = v10;
  v14 = v10;
  dispatch_async(queue, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return 1;
}

- (void)loadRecordsWithDelegate:(id)a3 recordGenerator:(id)a4
{
  id v5;
  void (**v6)(id, id);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, id))a4;
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: loading records", buf, 0xCu);
  }

  v8 = (void *)os_transaction_create();
  pp_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_debug_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling recordLoadingSetup", buf, 0xCu);
  }

  v10 = objc_msgSend(v5, "recordLoadingSetup");
  pp_default_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10 == 1)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_debug_impl(&dword_18BE3A000, v11, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied stop to setup, going to call completion", buf, 0xCu);
    }

    objc_msgSend(v5, "recordLoadingCompletion");
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_debug_impl(&dword_18BE3A000, v11, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling recordGenerator", buf, 0xCu);
    }

    v6[2](v6, v5);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x18D7805AC](v14);
          if (objc_msgSend(v5, "recordLoadingHandler:", v18, (_QWORD)v22) == 1)
          {
            pp_default_log_handle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v5;
              _os_log_debug_impl(&dword_18BE3A000, v20, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied stop to record handler", buf, 0xCu);
            }

            objc_autoreleasePoolPop(v19);
            goto LABEL_23;
          }
          objc_autoreleasePoolPop(v19);
          ++v17;
        }
        while (v15 != v17);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        v15 = v14;
        if (v14)
          continue;
        break;
      }
    }
LABEL_23:

    pp_default_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v5;
      _os_log_debug_impl(&dword_18BE3A000, v21, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling recordLoadingCompletion", buf, 0xCu);
    }

    objc_msgSend(v5, "recordLoadingCompletion");
  }

}

- (void)handleChangeNotificationWithName:(id)a3 afterDelaySeconds:(double)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  OS_dispatch_queue *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D81598];
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__PPRecordMonitoringHelper_handleChangeNotificationWithName_afterDelaySeconds_handler___block_invoke;
  v14[3] = &unk_1E226A790;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v10, "runAsyncOnQueue:afterDelaySeconds:block:", queue, v14, a4);

}

- (void)sendResetToAllDelegatesWithRecordGenerator:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = (void *)os_transaction_create();
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: sending reset to all %tu delegates", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        pp_default_log_handle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v12;
          _os_log_debug_impl(&dword_18BE3A000, v13, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling reset", buf, 0xCu);
        }

        -[PPRecordMonitoringHelper resetWithDelegate:recentChangesInProgress:recordGenerator:](self, "resetWithDelegate:recentChangesInProgress:recordGenerator:", v12, 0, v4);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)resetWithDelegate:(id)a3 recentChangesInProgress:(BOOL)a4 recordGenerator:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: calling completion block in preparation for reset", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v8, "recentRecordLoadingCompletion");
  }
  pp_default_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_18BE3A000, v11, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: calling resetRecordData", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v8, "resetRecordData");
  -[PPRecordMonitoringHelper loadRecordsWithDelegate:recordGenerator:](self, "loadRecordsWithDelegate:recordGenerator:", v8, v9);

}

- (void)sendChangesToDelegatesWithChangeGenerator:(id)a3 recordGenerator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSString *name;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  NSString *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = (void *)os_transaction_create();
  -[NSHashTable allObjects](self->_delegates, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pp_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 138412546;
    v29 = name;
    v30 = 2048;
    v31 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: sending changes to %tu delegates", buf, 0x16u);
  }

  v19 = v8;
  -[PPRecordMonitoringHelper _setupRecentChangesWithDelegates:recordGenerator:](self, "_setupRecentChangesWithDelegates:recordGenerator:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  v22 = v6;
  -[PPRecordMonitoringHelper _handleRecentChangesWithDelegates:changeGenerator:recordGenerator:](self, "_handleRecentChangesWithDelegates:changeGenerator:recordGenerator:", v11, v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = *(NSString **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        pp_default_log_handle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v17;
          _os_log_debug_impl(&dword_18BE3A000, v18, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: calling recentRecordLoadingCompletion", buf, 0xCu);
        }

        -[NSString recentRecordLoadingCompletion](v17, "recentRecordLoadingCompletion");
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

}

- (id)_setupRecentChangesWithDelegates:(id)a3 recordGenerator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PPRecordMonitoringHelper__setupRecentChangesWithDelegates_recordGenerator___block_invoke;
  v10[3] = &unk_1E226A7B8;
  v10[4] = self;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_handleRecentChangesWithDelegates:(id)a3 changeGenerator:(id)a4 recordGenerator:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke;
  v14[3] = &unk_1E226A7E0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)unloadDelegate:(id)a3
{
  id v4;
  NSHashTable *v5;
  NSObject *queue;
  id v7;
  NSHashTable *v8;
  _QWORD v9[4];
  NSHashTable *v10;
  id v11;

  v4 = a3;
  v5 = self->_delegates;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PPRecordMonitoringHelper_unloadDelegate___block_invoke;
  v9[3] = &unk_1E226AD38;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

uint64_t __43__PPRecordMonitoringHelper_unloadDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v3;
    _os_log_impl(&dword_18BE3A000, v4, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: calling recent record handler", buf, 0xCu);
  }

  v28 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "count");
    *(_DWORD *)buf = 138412546;
    v31 = v3;
    v32 = 2048;
    v33 = v7;
    _os_log_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: handling %tu record changes", buf, 0x16u);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(v3, "recentRecordLoadingHandler:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        if ((v13 - 3) >= 0xFFFFFFFE)
        {
          if (v13 == 1)
          {
            pp_default_log_handle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v3;
              _os_log_debug_impl(&dword_18BE3A000, v19, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied to handler with stop", buf, 0xCu);
            }

            objc_msgSend(v3, "recentRecordLoadingCompletion");
          }
          else if (v13 == 2)
          {
            pp_default_log_handle();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v31 = v3;
              _os_log_debug_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied to handler with reset", buf, 0xCu);
            }

            v17 = *(_QWORD *)(a1 + 32);
            v18 = *(NSObject **)(v17 + 16);
            v21[0] = MEMORY[0x1E0C809B0];
            v21[1] = 3221225472;
            v21[2] = __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke_10;
            v21[3] = &unk_1E226A790;
            v21[4] = v17;
            v22 = v3;
            v23 = *(id *)(a1 + 48);
            dispatch_async(v18, v21);

          }
          v15 = 0;
          goto LABEL_25;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v10)
        continue;
      break;
    }
  }

  pp_default_log_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v3;
    _os_log_debug_impl(&dword_18BE3A000, v14, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: done calling recentRecordLoadingHandlers", buf, 0xCu);
  }

  v15 = 1;
LABEL_25:

  return v15;
}

uint64_t __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetWithDelegate:recentChangesInProgress:recordGenerator:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

uint64_t __94__PPRecordMonitoringHelper__handleRecentChangesWithDelegates_changeGenerator_recordGenerator___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetWithDelegate:recentChangesInProgress:recordGenerator:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

BOOL __77__PPRecordMonitoringHelper__setupRecentChangesWithDelegates_recordGenerator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  unsigned int v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_18BE3A000, v4, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: calling recent setup", buf, 0xCu);
  }

  v5 = objc_msgSend(v3, "recentRecordLoadingSetup");
  v6 = v5 - 3;
  if ((v5 - 3) >= 0xFFFFFFFE)
  {
    if (v5 == 1)
    {
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v3;
        _os_log_debug_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied to setup with stop", buf, 0xCu);
      }

      objc_msgSend(v3, "recentRecordLoadingCompletion");
    }
    else if (v5 == 2)
    {
      pp_default_log_handle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v3;
        _os_log_debug_impl(&dword_18BE3A000, v7, OS_LOG_TYPE_DEBUG, "PPRecordMonitoringHelper: %@: replied to setup with reset", buf, 0xCu);
      }

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 16);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__PPRecordMonitoringHelper__setupRecentChangesWithDelegates_recordGenerator___block_invoke_7;
      block[3] = &unk_1E226A790;
      block[4] = v8;
      v13 = v3;
      v14 = *(id *)(a1 + 40);
      dispatch_async(v9, block);

    }
  }

  return v6 < 0xFFFFFFFE;
}

uint64_t __77__PPRecordMonitoringHelper__setupRecentChangesWithDelegates_recordGenerator___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetWithDelegate:recentChangesInProgress:recordGenerator:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

uint64_t __87__PPRecordMonitoringHelper_handleChangeNotificationWithName_afterDelaySeconds_handler___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[5];
    v4 = *(_QWORD *)(a1[4] + 8);
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: handleChangeNotification for %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __115__PPRecordMonitoringHelper_loadRecordsAndMonitorChangesWithDelegate_recordGenerator_notificationRegistrationBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _BYTE *WeakRetained;
  _BYTE *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_18BE3A000, v2, OS_LOG_TYPE_DEFAULT, "PPRecordMonitoringHelper: %@: loadRecordsAndMonitorChangesWithDelegate", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "loadRecordsWithDelegate:recordGenerator:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "addObject:", *(_QWORD *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = WeakRetained;
  if (WeakRetained && !WeakRetained[32])
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    v5[32] = 1;
  }

}

@end
