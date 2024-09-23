@implementation REElementCoordinator

void __48__REElementCoordinator_initWithRelevanceEngine___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a2;
  objc_msgSend(v3, "array");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);
}

- (void)enumerateObservers:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__REElementCoordinator_enumerateObservers___block_invoke;
    v6[3] = &unk_24CF907E0;
    v7 = v4;
    -[REElementCoordinator _enumerateValidObservers:](self, "_enumerateValidObservers:", v6);

  }
}

- (void)_enumerateValidObservers:(id)a3
{
  id v4;
  void *v5;
  REObserverStore *observers;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    observers = self->_observers;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __49__REElementCoordinator__enumerateValidObservers___block_invoke;
    v17[3] = &unk_24CF90830;
    v19 = v4;
    v7 = v5;
    v18 = v7;
    -[REObserverStore enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v17);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          -[REObserverStore removeObserver:](self->_observers, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
      }
      while (v10);
    }

  }
}

- (REElementCoordinator)initWithRelevanceEngine:(id)a3
{
  id v4;
  REElementCoordinator *v5;
  REObserverStore *v6;
  REObserverStore *observers;
  uint64_t v8;
  NSMutableArray *updates;
  void *v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *callbackQueue;
  OS_dispatch_queue *v15;
  id v16;
  uint64_t v17;
  NSMutableDictionary *displayElements;
  void *v19;
  REElementCoordinator *v20;
  void *v21;
  _QWORD v23[4];
  REElementCoordinator *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)REElementCoordinator;
  v5 = -[RERelevanceEngineSubsystem initWithRelevanceEngine:](&v25, sel_initWithRelevanceEngine_, v4);
  if (v5)
  {
    v6 = -[REObserverStore initWithFunctionsOptions:]([REObserverStore alloc], "initWithFunctionsOptions:", 512);
    observers = v5->_observers;
    v5->_observers = v6;

    v5->_performingBatch = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    updates = v5->_updates;
    v5->_updates = (NSMutableArray *)v8;

    objc_msgSend(v4, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "observerQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
      callbackQueue = v5->_callbackQueue;
      v5->_callbackQueue = v13;
    }
    else
    {
      v15 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v16 = MEMORY[0x24BDAC9B8];
      callbackQueue = v5->_callbackQueue;
      v5->_callbackQueue = v15;
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    displayElements = v5->_displayElements;
    v5->_displayElements = (NSMutableDictionary *)v17;

    -[RERelevanceEngineSubsystem relevanceEngine](v5, "relevanceEngine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __48__REElementCoordinator_initWithRelevanceEngine___block_invoke;
    v23[3] = &unk_24CF90790;
    v20 = v5;
    v24 = v20;
    objc_msgSend(v19, "enumerateSectionDescriptorsWithOptions:includeHistoric:usingBlock:", 0, 1, v23);

    objc_msgSend(v4, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addLoggable:", v20);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLoggable:", self);

  v5.receiver = self;
  v5.super_class = (Class)REElementCoordinator;
  -[RERelevanceEngineSubsystem dealloc](&v5, sel_dealloc);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)addObserver:(id)a3
{
  id v4;
  _RERelevanceEngineObserverWrapper *v5;

  v4 = a3;
  v5 = -[_RERelevanceEngineObserverWrapper initWithObserver:]([_RERelevanceEngineObserverWrapper alloc], "initWithObserver:", v4);

  -[REObserverStore addObserver:](self->_observers, "addObserver:", v5);
  -[REElementCoordinator didAddObserver:](self, "didAddObserver:", v5);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, uint64_t, _BYTE *);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  v16 = __Block_byref_object_dispose__28;
  v17 = 0;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __39__REElementCoordinator_removeObserver___block_invoke;
  v9 = &unk_24CF907B8;
  v5 = v4;
  v10 = v5;
  v11 = &v12;
  -[REElementCoordinator _enumerateValidObservers:](self, "_enumerateValidObservers:", &v6);
  if (v13[5])
  {
    -[REObserverStore removeObserver:](self->_observers, "removeObserver:", v6, v7, v8, v9);
    -[REElementCoordinator didRemoveObserver:](self, "didRemoveObserver:", v13[5]);
  }

  _Block_object_dispose(&v12, 8);
}

void __39__REElementCoordinator_removeObserver___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

uint64_t __43__REElementCoordinator_enumerateObservers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)numberOfObservers
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__REElementCoordinator_numberOfObservers__block_invoke;
  v4[3] = &unk_24CF90808;
  v4[4] = &v5;
  -[REElementCoordinator _enumerateValidObservers:](self, "_enumerateValidObservers:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __41__REElementCoordinator_numberOfObservers__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __49__REElementCoordinator__enumerateValidObservers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "observer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (id)applicationPrewarmIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (NSDictionary)displayElements
{
  void *v3;
  NSMutableDictionary *displayElements;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  displayElements = self->_displayElements;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__REElementCoordinator_displayElements__block_invoke;
  v8[3] = &unk_24CF8B898;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayElements, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return (NSDictionary *)v6;
}

void __39__REElementCoordinator_displayElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (id)elementAtPath:(id)a3
{
  id v4;
  NSMutableDictionary *displayElements;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  displayElements = self->_displayElements;
  objc_msgSend(v4, "sectionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](displayElements, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (v8 = objc_msgSend(v4, "element"), v8 < objc_msgSend(v7, "count")))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "element"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v12 = (id)objc_msgSend(v9, "shallowCopy");
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_updateIdentifier:", v14);

    }
    else
    {
      v12 = v9;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)numberOfElementsInSection:(id)a3
{
  NSObject *callbackQueue;
  id v5;
  void *v6;
  unint64_t v7;

  callbackQueue = self->_callbackQueue;
  v5 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_displayElements, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (id)pathForElement:(id)a3
{
  id v4;
  NSMutableDictionary *displayElements;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__28;
  v16 = __Block_byref_object_dispose__28;
  v17 = 0;
  displayElements = self->_displayElements;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__REElementCoordinator_pathForElement___block_invoke;
  v9[3] = &unk_24CF90880;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](displayElements, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __39__REElementCoordinator_pathForElement___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v7 = a2;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39__REElementCoordinator_pathForElement___block_invoke_2;
  v11[3] = &unk_24CF90858;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v12 = v8;
  v14 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

void __39__REElementCoordinator_pathForElement___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  char isKindOfClass;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v10 = v8;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  v12 = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0 || (v12 & 1) != 0)
  {
    v16 = isKindOfClass | ~v12;
    v13 = v9;
    v15 = v10;
    if ((v16 & 1) != 0)
      goto LABEL_7;
    objc_msgSend(v10, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    v13 = v9;
  }
  else
  {
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v15 = v10;
  }

LABEL_7:
  v17 = objc_msgSend(v13, "isEqualToString:", v15);

  if (v17)
  {
    +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 40), a3);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    *a4 = 1;
  }
}

- (void)performBatchUpdateBlock:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  REElementCoordinator *v35;
  NSObject *v36;
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  RELogForDomain(7);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[REElementCoordinator performBatchUpdateBlock:].cold.16();

  if (self->_performingBatch)
  {
    RELogForDomain(7);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[REElementCoordinator performBatchUpdateBlock:].cold.15();

  }
  self->_performingBatch = 1;
  if (v4)
    v4[2](v4);
  v7 = (void *)-[NSMutableArray copy](self->_updates, "copy");
  -[NSMutableArray removeAllObjects](self->_updates, "removeAllObjects");
  v8 = objc_msgSend(v7, "count");
  RELogForDomain(7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      -[REElementCoordinator performBatchUpdateBlock:].cold.3();

    RELogForDomain(7);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.3();

    RELogForDomain(7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.12();

    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayElements, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_80);
    RELogForDomain(7);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.11();

    RELogForDomain(7);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.3();

    RELogForDomain(7);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.3();

    -[REElementCoordinator _performOperationsToDisplayElements:](self, "_performOperationsToDisplayElements:", v7);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      while (2)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v16);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v20), "type") != 4)
          {
            v21 = 1;
            goto LABEL_32;
          }
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v18)
          continue;
        break;
      }
    }
    v21 = 0;
LABEL_32:

    -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x24BDAC760];
    v31 = 3221225472;
    v32 = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_13;
    v33 = &unk_24CF90958;
    v34 = v16;
    v35 = self;
    v37 = v21;
    v9 = v22;
    v36 = v9;
    -[REElementCoordinator enumerateObservers:](self, "enumerateObservers:", &v30);
    RELogForDomain(7);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.3();

    RELogForDomain(7);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.3();

    RELogForDomain(7);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.6();

    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_displayElements, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_21, v30, v31, v32, v33);
    RELogForDomain(7);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.5();

    RELogForDomain(7);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.3();

    RELogForDomain(7);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[REElementCoordinator performBatchUpdateBlock:].cold.3();

  }
  else if (v10)
  {
    -[REElementCoordinator performBatchUpdateBlock:].cold.2();
  }

  self->_performingBatch = 0;
  RELogForDomain(7);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[REElementCoordinator performBatchUpdateBlock:].cold.1();

}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a2;
  v5 = a3;
  RELogForDomain(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_cold_1((uint64_t)v4, v6, v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_12;
  v9[3] = &unk_24CF908E8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  RELogForDomain(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 32), a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    REStringForSectionPath(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_debug_impl(&dword_2132F7000, v6, OS_LOG_TYPE_DEBUG, "[%@]: %@", (uint8_t *)&v10, 0x16u);

  }
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_2;
  v9[3] = &unk_24CF8C580;
  v4 = v3;
  v10 = v4;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v5;
  v12 = v6;
  v7 = MEMORY[0x2199B2434](v9);
  v8 = (void *)v7;
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(v4, "relevanceEngine:performBatchUpdateBlock:completion:", *(_QWORD *)(a1 + 48), v7, &__block_literal_global_18);
  else
    (*(void (**)(uint64_t))(v7 + 16))(v7);

}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  char isKindOfClass;
  void *v4;
  void *v5;
  NSObject *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "observer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543362;
    v16 = v4;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_INFO, "[EC]: Begin view updates for observer: %{public}@.", buf, 0xCu);
    if ((isKindOfClass & 1) != 0)

  }
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_14;
  v12 = &unk_24CF90910;
  v5 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);
  RELogForDomain(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_opt_class();
    v7 = objc_opt_isKindOfClass();
    v8 = *(void **)(a1 + 32);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "observer", v9, v10, v11, v12, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "[EC]: End view updates for observer: %{public}@.", buf, 0xCu);
    if ((v7 & 1) != 0)

  }
}

uint64_t __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performOperation:toObserver:", a2, *(_QWORD *)(a1 + 40));
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a2;
  v5 = a3;
  RELogForDomain(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_cold_1((uint64_t)v4, v6, v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_22;
  v9[3] = &unk_24CF908E8;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_22(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  RELogForDomain(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315650;
    v10 = v7;
    v11 = 2048;
    v12 = a3;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "[%s - %lu]: %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)reloadElement:(id)a3 atPath:(id)a4
{
  NSObject *callbackQueue;
  id v7;
  id v8;
  id v9;

  callbackQueue = self->_callbackQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  +[REElementUpdateOperation reloadElement:atPath:](REElementUpdateOperation, "reloadElement:atPath:", v8, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[REElementCoordinator _enqueueOrPerformOperation:](self, "_enqueueOrPerformOperation:", v9);
}

- (void)insertElement:(id)a3 atPath:(id)a4
{
  NSObject *callbackQueue;
  id v7;
  id v8;
  id v9;

  callbackQueue = self->_callbackQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  +[REElementUpdateOperation insertElement:atPath:](REElementUpdateOperation, "insertElement:atPath:", v8, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[REElementCoordinator _enqueueOrPerformOperation:](self, "_enqueueOrPerformOperation:", v9);
}

- (void)removeElement:(id)a3 atPath:(id)a4
{
  NSObject *callbackQueue;
  id v7;
  id v8;
  id v9;

  callbackQueue = self->_callbackQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  +[REElementUpdateOperation removeElement:atPath:](REElementUpdateOperation, "removeElement:atPath:", v8, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[REElementCoordinator _enqueueOrPerformOperation:](self, "_enqueueOrPerformOperation:", v9);
}

- (void)moveElement:(id)a3 fromPath:(id)a4 toPath:(id)a5
{
  NSObject *callbackQueue;
  id v9;
  id v10;
  id v11;
  id v12;

  callbackQueue = self->_callbackQueue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  +[REElementUpdateOperation moveElement:fromPath:toPath:](REElementUpdateOperation, "moveElement:fromPath:toPath:", v11, v10, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[REElementCoordinator _enqueueOrPerformOperation:](self, "_enqueueOrPerformOperation:", v12);
}

- (void)refreshElement:(id)a3 atPath:(id)a4
{
  NSObject *callbackQueue;
  id v7;
  id v8;
  id v9;

  callbackQueue = self->_callbackQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(callbackQueue);
  +[REElementUpdateOperation refreshElement:atPath:](REElementUpdateOperation, "refreshElement:atPath:", v8, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[REElementCoordinator _enqueueOrPerformOperation:](self, "_enqueueOrPerformOperation:", v9);
}

- (void)_enqueueOrPerformOperation:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  v5 = objc_msgSend(v4, "type");
  RELogForDomain(7);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5 == 3)
  {
    if (v7)
    {
      v25 = objc_msgSend(v4, "type");
      objc_msgSend(v4, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sectionName");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = objc_msgSend(v27, "UTF8String");
      objc_msgSend(v4, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v26, "element");
      objc_msgSend(v4, "movedToPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sectionName");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = objc_msgSend(v9, "UTF8String");
      objc_msgSend(v4, "movedToPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "element");
      objc_msgSend(v4, "element");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v34 = v25;
      v35 = 2080;
      v36 = v24;
      v37 = 2048;
      v38 = v23;
      v39 = 2080;
      v40 = v10;
      v41 = 2048;
      v42 = v12;
      v43 = 2112;
      v44 = v14;
      _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "[EC]: Enqueue operation: %lu %s-%lu → %s-%lu for element %@", buf, 0x3Eu);

    }
  }
  else if (v7)
  {
    v29 = objc_msgSend(v4, "type");
    objc_msgSend(v4, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sectionName");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    objc_msgSend(v4, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "element");
    objc_msgSend(v4, "element");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v34 = v29;
    v35 = 2080;
    v36 = v17;
    v37 = 2048;
    v38 = v19;
    v39 = 2112;
    v40 = (uint64_t)v21;
    _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "[EC]: Enqueue operation: %lu %s-%lu for element %@", buf, 0x2Au);

  }
  if (self->_performingBatch)
  {
    -[NSMutableArray addObject:](self->_updates, "addObject:", v4);
  }
  else
  {
    v32 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[REElementCoordinator _performOperationsToDisplayElements:](self, "_performOperationsToDisplayElements:", v22);

    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __51__REElementCoordinator__enqueueOrPerformOperation___block_invoke;
    v30[3] = &unk_24CF8F608;
    v30[4] = self;
    v31 = v4;
    -[REElementCoordinator enumerateObservers:](self, "enumerateObservers:", v30);

  }
}

uint64_t __51__REElementCoordinator__enqueueOrPerformOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performOperation:toObserver:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_performOperation:(id)a3 toObserver:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "element");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v6, "type"))
  {
    case 0:
    case 4:
      RELogForDomain(7);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[REElementCoordinator _performOperation:toObserver:].cold.2(v8, v9);

      objc_msgSend(v7, "relevanceEngine:didReloadElement:atPath:", v10, v8, v9);
      break;
    case 1:
      RELogForDomain(7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[REElementCoordinator _performOperation:toObserver:].cold.3(v8, v9);

      objc_msgSend(v7, "relevanceEngine:didRemoveElement:atPath:", v10, v8, v9);
      break;
    case 2:
      RELogForDomain(7);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[REElementCoordinator _performOperation:toObserver:].cold.1(v8, v9);

      objc_msgSend(v7, "relevanceEngine:didInsertElement:atPath:", v10, v8, v9);
      break;
    case 3:
      objc_msgSend(v6, "movedToPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      RELogForDomain(7);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        REStringForSectionPath(v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        REStringForSectionPath(v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412802;
        v20 = v16;
        v21 = 2112;
        v22 = v17;
        v23 = 2112;
        v24 = v18;
        _os_log_debug_impl(&dword_2132F7000, v15, OS_LOG_TYPE_DEBUG, "[EC]: Move %@ from %@ to %@", (uint8_t *)&v19, 0x20u);

      }
      objc_msgSend(v7, "relevanceEngine:didMoveElement:fromPath:toPath:", v10, v8, v9, v14);

      break;
    default:
      break;
  }

}

- (void)_performOperationsToDisplayElements:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sectionName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v13);

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__REElementCoordinator__performOperationsToDisplayElements___block_invoke;
  v17[3] = &unk_24CF8B898;
  v17[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v17);

}

uint64_t __60__REElementCoordinator__performOperationsToDisplayElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performOperationsToDisplayElements:toSection:", a3, a2);
}

- (void)_performOperationsToDisplayElements:(id)a3 toSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  v38 = v7;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_displayElements, "objectForKeyedSubscript:", v7);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        switch(objc_msgSend(v14, "type"))
        {
          case 0:
          case 4:
            objc_msgSend(v14, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "element");

            objc_msgSend(v14, "element");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);

            break;
          case 1:
            objc_msgSend(v14, "path");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "element");

            objc_msgSend(v40, "addIndex:", v23);
            break;
          case 2:
            objc_msgSend(v14, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_11;
          case 3:
            objc_msgSend(v14, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "element");

            objc_msgSend(v40, "addIndex:", v20);
            objc_msgSend(v14, "movedToPath");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
            v24 = v21;
            v25 = objc_msgSend(v21, "element");

            objc_msgSend(v41, "addIndex:", v25);
            objc_msgSend(v14, "element");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v26, v27);

            break;
          default:
            continue;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v11);
  }

  v28 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke;
  v49[3] = &unk_24CF909A0;
  v29 = v38;
  v50 = v29;
  v30 = v37;
  v51 = v30;
  v31 = v8;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v49);
  v46[0] = v28;
  v46[1] = 3221225472;
  v46[2] = __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_28;
  v46[3] = &unk_24CF903E8;
  v32 = v29;
  v47 = v32;
  v33 = v30;
  v48 = v33;
  objc_msgSend(v40, "enumerateIndexesWithOptions:usingBlock:", 2, v46);
  v42[0] = v28;
  v42[1] = 3221225472;
  v42[2] = __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_30;
  v42[3] = &unk_24CF909C8;
  v43 = v39;
  v44 = v32;
  v45 = v33;
  v34 = v33;
  v35 = v32;
  v36 = v39;
  objc_msgSend(v41, "enumerateIndexesUsingBlock:", v42);

}

void __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  RELogForDomain(7);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 32), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    REStringForSectionPath(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_2132F7000, v7, OS_LOG_TYPE_DEBUG, "[EC]: Reload %@ into display elements at %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v5, v6);

}

uint64_t __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_28(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  RELogForDomain(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_28_cold_1(a1, a2, v4);

  return objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", a2);
}

void __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_30(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  RELogForDomain(7);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 40), a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    REStringForSectionPath(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_2132F7000, v7, OS_LOG_TYPE_DEBUG, "[EC]: Insert %@ into display elements at %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v6, a2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_displayElements, 0);
}

- (void)performBatchUpdateBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "[EC]: Finish batch update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)performBatchUpdateBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "[EC]: No updates. Not notifying observers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)performBatchUpdateBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)performBatchUpdateBlock:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "[EC]: Final Display Elements End", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)performBatchUpdateBlock:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "[EC]: Final Display Elements Begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)performBatchUpdateBlock:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "[EC]: Current Display Elements End", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)performBatchUpdateBlock:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "[EC]: Current Display Elements Begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)performBatchUpdateBlock:.cold.15()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_2132F7000, v0, OS_LOG_TYPE_ERROR, "trying to do recursive batch updates. results are undefined", v1, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)performBatchUpdateBlock:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_2132F7000, v0, v1, "[EC]: Begin batch update", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __48__REElementCoordinator_performBatchUpdateBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_1(&dword_2132F7000, a2, a3, "[EC]: Begin section %@", (uint8_t *)&v3);
}

- (void)_performOperation:(void *)a1 toObserver:(void *)a2 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  REStringForSectionPath(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5(&dword_2132F7000, v5, v6, "[EC]: Insert %@ at %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_3_4();
}

- (void)_performOperation:(void *)a1 toObserver:(void *)a2 .cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  REStringForSectionPath(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5(&dword_2132F7000, v5, v6, "[EC]: Reload %@ at %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_3_4();
}

- (void)_performOperation:(void *)a1 toObserver:(void *)a2 .cold.3(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  REStringForSectionPath(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_5(&dword_2132F7000, v5, v6, "[EC]: Remove %@ at %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_3_4();
}

void __70__REElementCoordinator__performOperationsToDisplayElements_toSection___block_invoke_28_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 32), a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  REStringForSectionPath(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v5;
  OUTLINED_FUNCTION_1_1(&dword_2132F7000, a3, v6, "[EC]: Remove element in display elements at %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_3_4();
}

@end
