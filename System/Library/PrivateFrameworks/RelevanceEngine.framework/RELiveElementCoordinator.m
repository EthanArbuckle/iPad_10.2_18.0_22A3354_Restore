@implementation RELiveElementCoordinator

- (RELiveElementCoordinator)initWithRelevanceEngine:(id)a3
{
  id v4;
  RELiveElementCoordinator *v5;
  RELiveElementCoordinator *v6;
  uint64_t v7;
  OS_dispatch_queue *controllerQueue;
  void *v9;
  void *v10;
  void *v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *callbackQueue;
  OS_dispatch_queue *v14;
  id v15;
  uint64_t v16;
  NSCountedSet *remainingInsertOperations;
  uint64_t v18;
  NSCountedSet *remainingRemoveOperations;
  uint64_t v20;
  NSMutableSet *refreshedElements;
  uint64_t v22;
  NSMutableDictionary *elementIdElementMap;
  REElementRelevanceEngine *v24;
  REElementRelevanceEngine *relevanceEngine;
  void *v26;
  void *v27;
  int v28;
  OS_dispatch_queue *v29;
  double v30;
  uint64_t v31;
  REUpNextScheduler *scheduler;
  _QWORD v34[4];
  id v35;
  id location;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)RELiveElementCoordinator;
  v5 = -[REElementCoordinator initWithRelevanceEngine:](&v37, sel_initWithRelevanceEngine_, v4);
  v6 = v5;
  if (v5)
  {
    -[RERelevanceEngineSubsystem queue](v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    controllerQueue = v6->_controllerQueue;
    v6->_controllerQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(v4, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "observerQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      callbackQueue = v6->_callbackQueue;
      v6->_callbackQueue = v12;
    }
    else
    {
      v14 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      v15 = MEMORY[0x24BDAC9B8];
      callbackQueue = v6->_callbackQueue;
      v6->_callbackQueue = v14;
    }

    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    remainingInsertOperations = v6->_remainingInsertOperations;
    v6->_remainingInsertOperations = (NSCountedSet *)v16;

    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    remainingRemoveOperations = v6->_remainingRemoveOperations;
    v6->_remainingRemoveOperations = (NSCountedSet *)v18;

    v6->_currentReloadTryCount = 0;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    refreshedElements = v6->_refreshedElements;
    v6->_refreshedElements = (NSMutableSet *)v20;

    v6->_reloadImmediately = 1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    elementIdElementMap = v6->_elementIdElementMap;
    v6->_elementIdElementMap = (NSMutableDictionary *)v22;

    v24 = -[REElementRelevanceEngine initWithRelevanceEngine:]([REElementRelevanceEngine alloc], "initWithRelevanceEngine:", v4);
    relevanceEngine = v6->_relevanceEngine;
    v6->_relevanceEngine = v24;

    -[REElementRelevanceEngine setDelegate:](v6->_relevanceEngine, "setDelegate:", v6);
    objc_msgSend(v4, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addLoggable:", v6->_relevanceEngine);

    objc_msgSend(v4, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "wantsImmutableContent");

    objc_initWeak(&location, v6);
    v29 = v6->_controllerQueue;
    if (v28)
      v30 = 0.0;
    else
      v30 = 0.2;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __52__RELiveElementCoordinator_initWithRelevanceEngine___block_invoke;
    v34[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v35, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v29, v34, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    scheduler = v6->_scheduler;
    v6->_scheduler = (REUpNextScheduler *)v31;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dataSourceManager:(id)a3 didLoadDataSourceController:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineSubsystem trackObject:](self, "trackObject:", v6);

  objc_msgSend(v5, "dataSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setActivityDelegate:", self);
}

- (id)elementRelevanceEngine
{
  return self->_relevanceEngine;
}

void __52__RELiveElementCoordinator_initWithRelevanceEngine___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  unint64_t v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_reload");
    WeakRetained = v3;
    if (v3[14])
    {
      v2 = 0;
      do
      {
        objc_msgSend(v3, "endActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), v3);
        WeakRetained = v3;
        ++v2;
      }
      while (v2 < v3[14]);
    }
    WeakRetained[14] = 0;
  }

}

- (void)_enumerateSectionsUsingBlock:(id)a3
{
  -[RELiveElementCoordinator _enumerateSectionsWithOptions:usingBlock:](self, "_enumerateSectionsWithOptions:usingBlock:", 0, a3);
}

- (void)_enumerateSectionsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__RELiveElementCoordinator__enumerateSectionsWithOptions_usingBlock___block_invoke;
  v9[3] = &unk_24CF8F420;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateSectionDescriptorsWithOptions:includeHistoric:usingBlock:", a3, 1, v9);

}

void __69__RELiveElementCoordinator__enumerateSectionsWithOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)dataSourceManager:(id)a3 willUnloadDataSourceController:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  RELiveElementCoordinator *v15;

  v5 = a4;
  objc_msgSend(v5, "elementOperationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __77__RELiveElementCoordinator_dataSourceManager_willUnloadDataSourceController___block_invoke;
  v13 = &unk_24CF8AB18;
  v14 = v5;
  v15 = self;
  v7 = v5;
  dispatch_async(v6, &v10);

  objc_msgSend(v7, "dataSource", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActivityDelegate:", 0);

  objc_msgSend(v7, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineSubsystem withdrawObject:](self, "withdrawObject:", v9);

}

void __77__RELiveElementCoordinator_dataSourceManager_willUnloadDataSourceController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "allElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__RELiveElementCoordinator_dataSourceManager_willUnloadDataSourceController___block_invoke_2;
  v6[3] = &unk_24CF8AB18;
  v7 = v3;
  v8 = v4;
  v5 = v3;
  objc_msgSend(v4, "_onqueue_async:", v6);

}

void __77__RELiveElementCoordinator_dataSourceManager_willUnloadDataSourceController___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "elementDataSourceController:didRemoveElement:", 0, *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)addElement:(id)a3 toSection:(id)a4
{
  NSObject *controllerQueue;
  id v7;
  id v8;

  controllerQueue = self->_controllerQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(controllerQueue);
  -[RELiveElementCoordinator _queue_addElement:toSection:](self, "_queue_addElement:toSection:", v8, v7);

}

- (void)removeElement:(id)a3
{
  NSObject *controllerQueue;
  id v5;

  controllerQueue = self->_controllerQueue;
  v5 = a3;
  dispatch_assert_queue_V2(controllerQueue);
  -[RELiveElementCoordinator _queue_removeElement:](self, "_queue_removeElement:", v5);

}

- (id)predictionForElementAtPath:(id)a3
{
  void *v4;
  void *v5;

  -[REElementCoordinator elementAtPath:](self, "elementAtPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RELiveElementCoordinator _predictionForElement:](self, "_predictionForElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)featureProviderForElement:(id)a3
{
  id v4;
  NSObject *controllerQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v17 = 0;
  controllerQueue = self->_controllerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RELiveElementCoordinator_featureProviderForElement___block_invoke;
  block[3] = &unk_24CF8DCF8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(controllerQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__RELiveElementCoordinator_featureProviderForElement___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "featureProviderForElement:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)featureProviderForElementAtPath:(id)a3
{
  void *v4;
  void *v5;

  -[REElementCoordinator elementAtPath:](self, "elementAtPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RELiveElementCoordinator featureProviderForElement:](self, "featureProviderForElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)elementRankerForSection:(id)a3
{
  return -[REElementRelevanceEngine elementRankerForSection:](self->_relevanceEngine, "elementRankerForSection:", a3);
}

- (id)_predictionForElement:(id)a3
{
  id v4;
  NSObject *controllerQueue;
  id v6;
  id v7;
  _QWORD block[5];
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
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v17 = 0;
  controllerQueue = self->_controllerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__RELiveElementCoordinator__predictionForElement___block_invoke;
  block[3] = &unk_24CF8DCF8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(controllerQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__RELiveElementCoordinator__predictionForElement___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 80), "predictionForElement:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)elementDataSourceController:(id)a3 performBatchUpdates:(id)a4
{
  id v6;
  id v7;
  NSObject *controllerQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  controllerQueue = self->_controllerQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__RELiveElementCoordinator_elementDataSourceController_performBatchUpdates___block_invoke;
  v11[3] = &unk_24CF8AA78;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(controllerQueue, v11);

}

void __76__RELiveElementCoordinator_elementDataSourceController_performBatchUpdates___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __76__RELiveElementCoordinator_elementDataSourceController_performBatchUpdates___block_invoke_2;
  v2[3] = &unk_24CF8AA78;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  _os_activity_initiate(&dword_2132F7000, "[LEC]: Batch element updates", OS_ACTIVITY_FLAG_DEFAULT, v2);

}

void __76__RELiveElementCoordinator_elementDataSourceController_performBatchUpdates___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  RELogForDomain(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_2132F7000, v2, OS_LOG_TYPE_DEFAULT, "[LEC]: Start processing batch updates for data source controller %{public}@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  RELogForDomain(7);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2132F7000, v4, OS_LOG_TYPE_DEFAULT, "[LEC]: Finish processing batch updates for data source controller %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)elementDataSourceController:(id)a3 didAddElement:(id)a4 toSection:(id)a5
{
  NSObject *controllerQueue;
  id v8;
  id v9;

  controllerQueue = self->_controllerQueue;
  v8 = a5;
  v9 = a4;
  dispatch_assert_queue_V2(controllerQueue);
  -[RELiveElementCoordinator _queue_addElement:toSection:](self, "_queue_addElement:toSection:", v9, v8);

}

- (void)elementDataSourceController:(id)a3 didReloadElement:(id)a4
{
  NSObject *controllerQueue;
  id v6;

  controllerQueue = self->_controllerQueue;
  v6 = a4;
  dispatch_assert_queue_V2(controllerQueue);
  -[RELiveElementCoordinator _queue_reloadElement:](self, "_queue_reloadElement:", v6);

}

- (void)elementDataSourceController:(id)a3 didRemoveElement:(id)a4
{
  NSObject *controllerQueue;
  id v6;

  controllerQueue = self->_controllerQueue;
  v6 = a4;
  dispatch_assert_queue_V2(controllerQueue);
  -[RELiveElementCoordinator _queue_removeElement:](self, "_queue_removeElement:", v6);

}

- (void)elementDataSourceController:(id)a3 didRefreshElement:(id)a4
{
  NSObject *controllerQueue;
  id v6;

  controllerQueue = self->_controllerQueue;
  v6 = a4;
  dispatch_assert_queue_V2(controllerQueue);
  -[RELiveElementCoordinator _queue_refreshElement:](self, "_queue_refreshElement:", v6);

}

- (BOOL)elementDataSourceController:(id)a3 isElementVisible:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  -[REElementCoordinator pathForElement:](self, "pathForElement:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__RELiveElementCoordinator_elementDataSourceController_isElementVisible___block_invoke;
  v13[3] = &unk_24CF8F448;
  v10 = v9;
  v14 = v10;
  v11 = v8;
  v15 = v11;
  v16 = &v17;
  -[REElementCoordinator enumerateObservers:](self, "enumerateObservers:", v13);
  LOBYTE(self) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

uint64_t __73__RELiveElementCoordinator_elementDataSourceController_isElementVisible___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "relevanceEngine:isElementAtPathVisible:", a1[4], a1[5]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)dataSource:(id)a3 didBeginActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  RELogForDomain(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "[LEC]: Start processing %{public}@ activity from data source %{public}@", (uint8_t *)&v9, 0x16u);
  }

  -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", v7, v6);
}

- (void)dataSource:(id)a3 didFinishActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[RERelevanceEngineSubsystem endActivity:forObject:](self, "endActivity:forObject:", v7, v6);
  RELogForDomain(7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "[LEC]: Finish processing %{public}@ activity from data source %{public}@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)_queue_addElement:(id)a3 toSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSMutableSet *refreshedElements;
  void *v11;
  NSCountedSet *remainingInsertOperations;
  void *v13;
  NSMutableDictionary *elementIdElementMap;
  void *v15;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  if (_fetchedInternalBuildOnceToken_6 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_53);
  if (_isInternalDevice_6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Reproduced rdar://107396589: Attempted to add element to section %@ without an identifier: %@"), v7, v6);
  }
  RELogForDomain(7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RELiveElementCoordinator _queue_addElement:toSection:].cold.1(v6);

  refreshedElements = self->_refreshedElements;
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](refreshedElements, "removeObject:", v11);

  remainingInsertOperations = self->_remainingInsertOperations;
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](remainingInsertOperations, "addObject:", v13);

  elementIdElementMap = self->_elementIdElementMap;
  objc_msgSend(v6, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](elementIdElementMap, "setObject:forKey:", v6, v15);

  -[REElementRelevanceEngine addElement:section:](self->_relevanceEngine, "addElement:section:", v6, v7);
}

uint64_t __56__RELiveElementCoordinator__queue_addElement_toSection___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

- (void)_queue_reloadElement:(id)a3
{
  id v4;
  NSMutableDictionary *elementIdElementMap;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REElementRelevanceEngine *relevanceEngine;
  void *v19;
  void *v20;
  NSMutableSet *refreshedElements;
  void *v22;
  NSObject *v23;

  v4 = a3;
  elementIdElementMap = self->_elementIdElementMap;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](elementIdElementMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  if (_fetchedInternalBuildOnceToken_6 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_9_1);
  if (_isInternalDevice_6)
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Reproduced rdar://107396589: Attempted to reload element without an identifier: %@"), v4);
  }
  RELogForDomain(7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[RELiveElementCoordinator _queue_reloadElement:].cold.2(v4);

  v10 = self->_elementIdElementMap;
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v4, v11);

  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "relevanceProviders");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "relevanceProviders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isEqualToSet:", v17) & 1) == 0)
    -[REElementRelevanceEngine reloadElement:withElement:](self->_relevanceEngine, "reloadElement:withElement:", v7, v4);
  relevanceEngine = self->_relevanceEngine;
  objc_msgSend(v4, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[REElementRelevanceEngine pathForElement:](relevanceEngine, "pathForElement:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    refreshedElements = self->_refreshedElements;
    objc_msgSend(v4, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](refreshedElements, "removeObject:", v22);

    -[RELiveElementCoordinator _queue_scheduleContentUpdate:](self, "_queue_scheduleContentUpdate:", 1);
  }
  else
  {
    RELogForDomain(7);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[RELiveElementCoordinator _queue_reloadElement:].cold.1(v4);

  }
}

uint64_t __49__RELiveElementCoordinator__queue_reloadElement___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

- (void)_queue_refreshElement:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSMutableDictionary *elementIdElementMap;
  void *v8;
  REElementRelevanceEngine *relevanceEngine;
  void *v10;
  void *v11;
  NSMutableSet *refreshedElements;
  void *v13;
  NSObject *v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  if (_fetchedInternalBuildOnceToken_6 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_13_1);
  if (_isInternalDevice_6)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Reproduced rdar://107396589: Attempted to refresh element without an identifier: %@"), v4);
  }
  RELogForDomain(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RELiveElementCoordinator _queue_refreshElement:].cold.2(v4);

  elementIdElementMap = self->_elementIdElementMap;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](elementIdElementMap, "setObject:forKey:", v4, v8);

  relevanceEngine = self->_relevanceEngine;
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[REElementRelevanceEngine pathForElement:](relevanceEngine, "pathForElement:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    refreshedElements = self->_refreshedElements;
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](refreshedElements, "addObject:", v13);

    -[RELiveElementCoordinator _queue_scheduleContentUpdate:](self, "_queue_scheduleContentUpdate:", 0);
  }
  else
  {
    RELogForDomain(7);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[RELiveElementCoordinator _queue_refreshElement:].cold.1(v4);

  }
}

uint64_t __50__RELiveElementCoordinator__queue_refreshElement___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

- (void)_queue_removeElement:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSMutableSet *refreshedElements;
  void *v8;
  NSCountedSet *remainingRemoveOperations;
  void *v10;
  REElementRelevanceEngine *relevanceEngine;
  void *v12;
  NSMutableDictionary *elementIdElementMap;
  void *v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  if (_fetchedInternalBuildOnceToken_6 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_16);
  if (_isInternalDevice_6)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Reproduced rdar://107396589: Attempted to remove element without an identifier: %@"), v4);
  }
  RELogForDomain(7);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[RELiveElementCoordinator _queue_removeElement:].cold.1(v4);

  refreshedElements = self->_refreshedElements;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet removeObject:](refreshedElements, "removeObject:", v8);

  remainingRemoveOperations = self->_remainingRemoveOperations;
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet removeObject:](remainingRemoveOperations, "removeObject:", v10);

  relevanceEngine = self->_relevanceEngine;
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REElementRelevanceEngine removeElement:](relevanceEngine, "removeElement:", v12);

  elementIdElementMap = self->_elementIdElementMap;
  objc_msgSend(v4, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](elementIdElementMap, "removeObjectForKey:", v14);

}

uint64_t __49__RELiveElementCoordinator__queue_removeElement___block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

- (void)_queue_reload
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2132F7000, log, OS_LOG_TYPE_DEBUG, "[LEC] Reached reload retry limit. Proceeding with reload", v1, 2u);
}

void __41__RELiveElementCoordinator__queue_reload__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "numberOfElementsInSection:");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", v10, i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "elementAtPath:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v4, "addObject:", v8);

    }
  }
  v9 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v10);

}

void __41__RELiveElementCoordinator__queue_reload__block_invoke_2(id *a1)
{
  id v2;
  int DisplayDebugProbabilities;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "relevanceEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (_fetchedInternalBuildOnceToken_6 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_161_0);
  if (_isInternalDevice_6)
  {
    DisplayDebugProbabilities = __RE_Cached_Get__DisplayDebugProbabilities(v2);

    if (DisplayDebugProbabilities)
    {
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
      v31 = 0u;
      obj = a1[5];
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v21)
      {
        v20 = *(_QWORD *)v32;
        do
        {
          v4 = 0;
          do
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(obj);
            v22 = v4;
            v5 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v4);
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            objc_msgSend(a1[5], "objectForKeyedSubscript:", v5);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v7)
            {
              v8 = v7;
              v9 = *(_QWORD *)v28;
              do
              {
                for (i = 0; i != v8; ++i)
                {
                  if (*(_QWORD *)v28 != v9)
                    objc_enumerationMutation(v6);
                  v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                  objc_msgSend(a1[4], "_predictionForElement:", v11);
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v12, "probability");
                  objc_msgSend(v13, "stringWithFormat:", CFSTR("%f"), v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "content");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v16, "style") != 3 || objc_msgSend(v16, "style"))
                    objc_msgSend(v16, "setStyle:", 0);
                  objc_msgSend(v16, "setDescription2TextProvider:", 0);
                  objc_msgSend(v16, "setDescription2Text:", 0);
                  +[RESimpleTextContentProvider textContentProviderWithText:](RESimpleTextContentProvider, "textContentProviderWithText:", v15);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setDescription2TextContentProvider:", v17);

                }
                v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              }
              while (v8);
            }

            v4 = v22 + 1;
          }
          while (v22 + 1 != v21);
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v21);
      }

    }
  }
  else
  {

  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __41__RELiveElementCoordinator__queue_reload__block_invoke_3;
  v23[3] = &unk_24CF8C580;
  v18 = a1[5];
  v24 = a1[4];
  v25 = v18;
  v26 = a1[6];
  objc_msgSend(v24, "performBatchUpdateBlock:", v23);

}

void __41__RELiveElementCoordinator__queue_reload__block_invoke_3(id *a1)
{
  void *v2;
  id v3;
  char DisplayDebugProbabilities;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;

  objc_msgSend(a1[4], "displayElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "relevanceEngine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (_fetchedInternalBuildOnceToken_6 != -1)
    dispatch_once(&_fetchedInternalBuildOnceToken_6, &__block_literal_global_161_0);
  if (_isInternalDevice_6)
    DisplayDebugProbabilities = __RE_Cached_Get__DisplayDebugProbabilities(v3);
  else
    DisplayDebugProbabilities = 0;

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__RELiveElementCoordinator__queue_reload__block_invoke_4;
  v9[3] = &unk_24CF8F5E0;
  v10 = v2;
  v5 = a1[4];
  v6 = a1[5];
  v14 = DisplayDebugProbabilities;
  v7 = a1[4];
  v11 = v6;
  v12 = v7;
  v13 = a1[6];
  v8 = v2;
  objc_msgSend(v5, "_enumerateSectionsUsingBlock:", v9);

}

void __41__RELiveElementCoordinator__queue_reload__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, void *, uint64_t, uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD v22[4];
  char v23;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __41__RELiveElementCoordinator__queue_reload__block_invoke_7;
  v22[3] = &__block_descriptor_33_e33_B24__0__REElement_8__REElement_16l;
  v23 = *(_BYTE *)(a1 + 64);
  v9 = (void *)MEMORY[0x2199B2434](v22);
  +[REArrayDiff diffFromElements:toElements:equalComparator:hashGenerator:changeComparator:](REArrayDiff, "diffFromElements:toElements:equalComparator:hashGenerator:changeComparator:", v5, v7, &__block_literal_global_27_1, &__block_literal_global_29_0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = 3221225472;
  v17 = __41__RELiveElementCoordinator__queue_reload__block_invoke_8;
  v18 = &unk_24CF8F5B8;
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(void **)(a1 + 56);
  v19 = v3;
  v20 = v11;
  v21 = v12;
  v13 = v3;
  v14 = (void *)MEMORY[0x2199B2434](&v15);
  objc_msgSend(v10, "enumerateOperationsUsingBlock:", v14, v15, v16, v17, v18);

}

uint64_t __41__RELiveElementCoordinator__queue_reload__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "isEqualToString:", v6);
  return v7;
}

uint64_t __41__RELiveElementCoordinator__queue_reload__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

uint64_t __41__RELiveElementCoordinator__queue_reload__block_invoke_7(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return 1;
  else
    return objc_msgSend(a2, "isEqual:") ^ 1;
}

void __41__RELiveElementCoordinator__queue_reload__block_invoke_8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 32), a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RESectionPath sectionPathWithSectionName:element:](RESectionPath, "sectionPathWithSectionName:element:", *(_QWORD *)(a1 + 32), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a2)
  {
    case 0:
      objc_msgSend(v14, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v11);
      v13 = *(void **)(a1 + 40);
      if (v12)
        objc_msgSend(v13, "refreshElement:atPath:", v14, v9);
      else
        objc_msgSend(v13, "reloadElement:atPath:", v14, v9);

      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 40), "insertElement:atPath:", v14, v9);
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "removeElement:atPath:", v14, v10);
      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 40), "moveElement:fromPath:toPath:", v14, v10, v9);
      break;
    default:
      break;
  }

}

- (void)_queue_scheduleContentUpdate:(BOOL)a3
{
  -[RERelevanceEngineSubsystem beginActivity:forObject:](self, "beginActivity:forObject:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"), self);
  ++self->_scheduleCount;
  -[REUpNextScheduler schedule](self->_scheduler, "schedule");
  if (a3 || RETrainingSimulationIsCurrentlyActive())
  {
    self->_reloadImmediately = 1;
    -[REUpNextScheduler performImmediately](self->_scheduler, "performImmediately");
  }
}

- (void)relevanceEngine:(id)a3 performedBatchUpdates:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)relevanceEngine:(id)a3 didInsertElement:(id)a4 atPath:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  -[NSMutableDictionary objectForKey:](self->_elementIdElementMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[RELiveElementCoordinator _queue_scheduleContentUpdate:](self, "_queue_scheduleContentUpdate:", 0);
  }
  else
  {
    RELogForDomain(7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[RELiveElementCoordinator relevanceEngine:didInsertElement:atPath:].cold.1();

  }
}

- (void)relevanceEngine:(id)a3 didRemoveElement:(id)a4 atPath:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  -[NSMutableDictionary objectForKey:](self->_elementIdElementMap, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[RELiveElementCoordinator _queue_scheduleContentUpdate:](self, "_queue_scheduleContentUpdate:", 0);
  }
  else
  {
    RELogForDomain(7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[RELiveElementCoordinator relevanceEngine:didRemoveElement:atPath:].cold.1();

  }
}

- (void)relevanceEngine:(id)a3 didMoveElement:(id)a4 fromPath:(id)a5 toPath:(id)a6
{
  id v7;
  void *v8;
  NSObject *v9;

  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  -[NSMutableDictionary objectForKey:](self->_elementIdElementMap, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[RELiveElementCoordinator _queue_scheduleContentUpdate:](self, "_queue_scheduleContentUpdate:", 0);
  }
  else
  {
    RELogForDomain(7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[RELiveElementCoordinator relevanceEngine:didMoveElement:fromPath:toPath:].cold.1();

  }
}

- (void)relevanceEngine:(id)a3 elementWasAdded:(id)a4
{
  -[NSCountedSet removeObject:](self->_remainingInsertOperations, "removeObject:", a4);
}

- (void)relevanceEngine:(id)a3 elementWasRemoved:(id)a4
{
  -[NSCountedSet removeObject:](self->_remainingRemoveOperations, "removeObject:", a4);
}

- (void)relevanceEngine:(id)a3 didUpdateRelevanceOfElement:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *callbackQueue;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerQueue);
  -[NSMutableDictionary objectForKey:](self->_elementIdElementMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__RELiveElementCoordinator_relevanceEngine_didUpdateRelevanceOfElement___block_invoke;
    block[3] = &unk_24CF8C580;
    block[4] = self;
    v11 = v7;
    v12 = v6;
    v9 = v7;
    dispatch_async(callbackQueue, block);

  }
  else
  {
    RELogForDomain(7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[RELiveElementCoordinator relevanceEngine:didUpdateRelevanceOfElement:].cold.1();
  }

}

void __72__RELiveElementCoordinator_relevanceEngine_didUpdateRelevanceOfElement___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __72__RELiveElementCoordinator_relevanceEngine_didUpdateRelevanceOfElement___block_invoke_2;
  v3[3] = &unk_24CF8F608;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateObservers:", v3);

}

uint64_t __72__RELiveElementCoordinator_relevanceEngine_didUpdateRelevanceOfElement___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "relevanceEngine:didUpdateRelevanceForElement:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_onqueue_async:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_controllerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_refreshedElements, 0);
  objc_storeStrong((id *)&self->_remainingRemoveOperations, 0);
  objc_storeStrong((id *)&self->_remainingInsertOperations, 0);
  objc_storeStrong((id *)&self->_controllerQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_elementIdElementMap, 0);
  objc_storeStrong((id *)&self->_relevanceEngine, 0);
}

- (id)featureMapForElementId:(id)a3 trainingContext:(id)a4
{
  return -[REElementRelevanceEngine featureMapForElement:trainingContext:](self->_relevanceEngine, "featureMapForElement:trainingContext:", a3, a4);
}

- (id)featureMapForElement:(id)a3 trainingContext:(id)a4
{
  return -[REElementRelevanceEngine featureMapForPredictedElement:trainingContext:](self->_relevanceEngine, "featureMapForPredictedElement:trainingContext:", a3, a4);
}

- (id)elementForElementId:(id)a3
{
  NSObject *controllerQueue;
  id v5;
  void *v6;

  controllerQueue = self->_controllerQueue;
  v5 = a3;
  dispatch_assert_queue_V2(controllerQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_elementIdElementMap, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_queue_addElement:(void *)a1 toSection:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_2132F7000, v2, v3, "[LEC]: Add element %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_reloadElement:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_2132F7000, v2, v3, "Unable to reload element %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_reloadElement:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_2132F7000, v2, v3, "[LEC]: Reload element %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_refreshElement:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_2132F7000, v2, v3, "Unable to refresh element %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_refreshElement:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_2132F7000, v2, v3, "[LEC]: Refresh element %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_removeElement:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_2132F7000, v2, v3, "[LEC]: Remove element %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)relevanceEngine:didInsertElement:atPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_2132F7000, v0, v1, "Unable to find element for id %@ (insert)", v2);
  OUTLINED_FUNCTION_3();
}

- (void)relevanceEngine:didRemoveElement:atPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_2132F7000, v0, v1, "Unable to find element for id %@ (remove)", v2);
  OUTLINED_FUNCTION_3();
}

- (void)relevanceEngine:didMoveElement:fromPath:toPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_2132F7000, v0, v1, "Unable to find element for id %@ (move)", v2);
  OUTLINED_FUNCTION_3();
}

- (void)relevanceEngine:didUpdateRelevanceOfElement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_2132F7000, v0, v1, "Unable to find element for id %@ (relevance update)", v2);
  OUTLINED_FUNCTION_3();
}

@end
