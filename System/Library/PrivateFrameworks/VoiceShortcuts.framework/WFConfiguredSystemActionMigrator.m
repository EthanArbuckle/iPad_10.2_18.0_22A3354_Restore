@implementation WFConfiguredSystemActionMigrator

- (WFConfiguredSystemActionMigrator)initWithDatabaseProvider:(id)a3 actionProvider:(id)a4
{
  id v7;
  id v8;
  WFConfiguredSystemActionMigrator *v9;
  WFConfiguredSystemActionMigrator *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  WFConfiguredSystemActionMigrator *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFConfiguredSystemActionMigrator;
  v9 = -[WFConfiguredSystemActionMigrator init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseProvider, a3);
    objc_storeStrong((id *)&v10->_actionProvider, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.shortcuts.WFConfiguredSystemActionMigrator", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)startMonitoring
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[WFConfiguredSystemActionMigrator queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[WFConfiguredSystemActionMigrator queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WFConfiguredSystemActionMigrator_startMonitoring__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)stopMonitoring
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];

  -[WFConfiguredSystemActionMigrator queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  -[WFConfiguredSystemActionMigrator queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WFConfiguredSystemActionMigrator_stopMonitoring__block_invoke;
  block[3] = &unk_1E7AA8300;
  block[4] = self;
  dispatch_sync(v4, block);

}

- (void)updateActionsIfNeededWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFConfiguredSystemActionMigrator queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  getWFStaccatoLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[WFConfiguredSystemActionMigrator updateActionsIfNeededWithReason:]";
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_DEFAULT, "%s Detected system action source change due to: %@, migrating actions if necessary", buf, 0x16u);
  }

  -[WFConfiguredSystemActionMigrator actionProvider](self, "actionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "availableActionTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:](self, "updateConfiguredSystemActionOfType:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)updateConfiguredSystemActionOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFConfiguredSystemActionMigrator actionProvider](self, "actionProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuredSystemActionForActionType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && !-[WFConfiguredSystemActionMigrator isConfiguredSystemActionValid:](self, "isConfiguredSystemActionValid:", v6))
  {
    getWFStaccatoLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:]";
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_DEFAULT, "%s Current action for system action type: %@ needs updating: %@", (uint8_t *)&v13, 0x20u);
    }

    -[WFConfiguredSystemActionMigrator updatedConfiguredSystemActionFrom:](self, "updatedConfiguredSystemActionFrom:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getWFStaccatoLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:]";
      v15 = 2112;
      v16 = v4;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s Updated action for system action type: %@ is: %@", (uint8_t *)&v13, 0x20u);
    }

    -[WFConfiguredSystemActionMigrator actionProvider](self, "actionProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "saveUpdatedAction:forActionType:", v8, v4);

    getWFStaccatoLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = "-[WFConfiguredSystemActionMigrator updateConfiguredSystemActionOfType:]";
      v15 = 2112;
      v16 = v4;
      v17 = 1024;
      LODWORD(v18) = v11;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s Completed updating system action type: %@, success: %i", (uint8_t *)&v13, 0x1Cu);
    }

  }
}

- (BOOL)isConfiguredSystemActionValid:(id)a3
{
  id v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    -[WFConfiguredSystemActionMigrator updatedConfiguredSystemActionFrom:](self, "updatedConfiguredSystemActionFrom:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)updatedConfiguredSystemActionFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFConfiguredSystemActionMigrator databaseProvider](self, "databaseProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v5, "databaseWithError:", &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;

    if (v6)
    {
      v8 = v4;
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
      }
      else
      {
        v9 = 0;
      }
      v12 = v9;

      objc_msgSend(v12, "workflowIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "referenceForWorkflowID:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0DC7A30]);
        objc_msgSend(v8, "shortcutsMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v15, "initWithWorkflow:shortcutsMetadata:", v14, v16);

      }
      else
      {
        v10 = objc_alloc_init(MEMORY[0x1E0DC7A28]);
      }

    }
    else
    {
      getWFStaccatoLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[WFConfiguredSystemActionMigrator updatedConfiguredSystemActionFrom:]";
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed to fetch current workflow state due to: %@", buf, 0x16u);
      }

      v10 = v4;
    }

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a6;
  if (objc_msgSend(a4, "count") || objc_msgSend(v8, "count"))
  {
    getWFStaccatoLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[WFConfiguredSystemActionMigrator databaseDidChange:modified:inserted:removed:]";
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_INFO, "%s Received valid database change notification.", (uint8_t *)&v11, 0xCu);
    }

    -[WFConfiguredSystemActionMigrator databaseDeboucer](self, "databaseDeboucer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "poke");

  }
}

- (void)handleDatabaseChangeWithDelay
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  getWFStaccatoLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[WFConfiguredSystemActionMigrator handleDatabaseChangeWithDelay]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Forwarding database change notification.", (uint8_t *)&v4, 0xCu);
  }

  -[WFConfiguredSystemActionMigrator updateActionsIfNeededWithReason:](self, "updateActionsIfNeededWithReason:", CFSTR("DatabaseChanged"));
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (WFDebouncer)databaseDeboucer
{
  return self->_databaseDeboucer;
}

- (void)setDatabaseDeboucer:(id)a3
{
  objc_storeStrong((id *)&self->_databaseDeboucer, a3);
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (WFConfiguredSystemActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_databaseDeboucer, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __50__WFConfiguredSystemActionMigrator_stopMonitoring__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectObserver:", *(_QWORD *)(a1 + 32));

}

void __51__WFConfiguredSystemActionMigrator_startMonitoring__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "databaseProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "databaseWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;

  if (v3)
  {
    v5 = objc_alloc(MEMORY[0x1E0DD9D10]);
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithDelay:queue:", v6, 0.5);

    objc_msgSend(*(id *)(a1 + 32), "setDatabaseDeboucer:", v7);
    -[NSObject addTarget:action:](v7, "addTarget:action:", *(_QWORD *)(a1 + 32), sel_handleDatabaseChangeWithDelay);
    objc_msgSend(v3, "addObjectObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setDatabase:", v3);
    getWFStaccatoLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[WFConfiguredSystemActionMigrator startMonitoring]_block_invoke";
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_DEFAULT, "%s Started monitoring for changes for system actions.", buf, 0xCu);
    }

  }
  else
  {
    getWFStaccatoLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFConfiguredSystemActionMigrator startMonitoring]_block_invoke";
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to start monitoring due to: %@", buf, 0x16u);
    }
  }

}

@end
