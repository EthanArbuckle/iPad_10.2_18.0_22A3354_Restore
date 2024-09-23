@implementation RERelevanceEngineDebugger

- (NSArray)availableEngines
{
  return -[REObserverStore allObservers](self->_observerStore, "allObservers");
}

- (void)_registerEngine:(id)a3
{
  -[REObserverStore addObserver:](self->_observerStore, "addObserver:", a3);
}

- (id)_init
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RERelevanceEngineDebugger;
  v2 = -[RESingleton _init](&v8, sel__init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)v2[1];
    v2[1] = v3;

    RECreateSharedQueue(CFSTR("Debugger"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[2];
    v2[2] = v5;

  }
  return v2;
}

- (id)engineWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[RERelevanceEngineDebugger availableEngines](self, "availableEngines", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)firstEngine
{
  void *v2;
  void *v3;

  -[RERelevanceEngineDebugger availableEngines](self, "availableEngines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isValidEngine:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = 1;
  }
  else
  {
    RELogForDomain(13);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "Object %@ isn't valid engine", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (id)diagnosticLogsForEngine:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (-[RERelevanceEngineDebugger _isValidEngine:](self, "_isValidEngine:", v4))
  {
    v5 = dispatch_semaphore_create(0);
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3;
    v16 = __Block_byref_object_dispose__3;
    v17 = 0;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__RERelevanceEngineDebugger_diagnosticLogsForEngine___block_invoke;
    v9[3] = &unk_24CF8B9F8;
    v11 = &v12;
    v6 = v5;
    v10 = v6;
    objc_msgSend(v4, "storeDiagnosticLogs:", v9);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __53__RERelevanceEngineDebugger_diagnosticLogsForEngine___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)reloadDataSourceForEngine:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[RERelevanceEngineDebugger _isValidEngine:](self, "_isValidEngine:"))
  {
    objc_msgSend(v5, "dataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumerateElementDataSourceControllers:", &__block_literal_global_12);

  }
}

uint64_t __55__RERelevanceEngineDebugger_reloadDataSourceForEngine___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateElements");
}

- (id)dataSourceElementsForEngine:(id)a3
{
  id v4;
  void *v5;
  dispatch_group_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  dispatch_group_t v14;
  RERelevanceEngineDebugger *v15;
  id v16;

  v4 = a3;
  if (-[RERelevanceEngineDebugger _isValidEngine:](self, "_isValidEngine:", v4))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = dispatch_group_create();
    objc_msgSend(v4, "dataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke;
    v13[3] = &unk_24CF8BA60;
    v14 = v6;
    v15 = self;
    v8 = v5;
    v16 = v8;
    v9 = v6;
    objc_msgSend(v7, "enumerateElementDataSourceControllers:", v13);
    dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v10 = v16;
    v11 = v8;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_msgSend(v3, "elementOperationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke_2;
  v8[3] = &unk_24CF8B6F0;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v3;
  dispatch_async(v4, v8);

}

void __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "allElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
  v8[0] = MEMORY[0x24BDAC760];
  v8[2] = __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke_3;
  v8[3] = &unk_24CF8B6F0;
  v8[1] = 3221225472;
  v9 = v4;
  v10 = v3;
  v11 = v2;
  v12 = *(id *)(a1 + 56);
  v6 = v2;
  v7 = v3;
  dispatch_async(v5, v8);

}

void __57__RERelevanceEngineDebugger_dataSourceElementsForEngine___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (id)allRelevanceProviderValuesForEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[RERelevanceEngineDebugger _isValidEngine:](self, "_isValidEngine:", v4))
  {
    objc_msgSend(v4, "coordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "elementRelevanceEngine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relevanceProviderEnvironment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentRelevanceProvidersState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)orderedElementsForEngine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t j;
  uint64_t v19;
  unint64_t v20;
  RESectionPath *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[RERelevanceEngineDebugger _isValidEngine:](self, "_isValidEngine:", v4))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v4, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v12, "historicSectionDescriptor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);

          }
          objc_msgSend(v12, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v16);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v17, "appendString:", v19);
          objc_msgSend(v17, "appendString:", CFSTR("\n"));
          if (objc_msgSend(v4, "numberOfElementsInSection:", v19))
          {
            v20 = 0;
            do
            {
              v21 = -[RESectionPath initWithSectionName:element:]([RESectionPath alloc], "initWithSectionName:element:", v19, v20);
              objc_msgSend(v4, "elementAtPath:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              REDescriptionForExportedObject(v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "appendString:", v23);

              objc_msgSend(v17, "appendString:", CFSTR("\n\n"));
              ++v20;
            }
            while (v20 < objc_msgSend(v4, "numberOfElementsInSection:", v19));
          }
          objc_msgSend(v17, "appendString:", CFSTR("\n\n\n\n"));
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v27);
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_unregisterEngine:(id)a3
{
  -[REObserverStore removeObserver:](self->_observerStore, "removeObserver:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observerStore, 0);
}

@end
