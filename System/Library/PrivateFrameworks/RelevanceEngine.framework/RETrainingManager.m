@implementation RETrainingManager

- (RETrainingManager)initWithRelevanceEngine:(id)a3
{
  id v4;
  RETrainingManager *v5;
  uint64_t v6;
  NSMutableSet *trainingContexts;
  void *v8;
  uint64_t v9;
  RETrainingScheduler *trainingScheduler;
  uint64_t v11;
  RELiveElementCoordinator *coordinator;
  uint64_t v13;
  REMLModelManager *modelManager;
  uint64_t v15;
  OS_dispatch_queue *queue;
  uint64_t v17;
  NSMutableArray *trainingFeatureMaps;
  uint64_t v19;
  NSMutableArray *trainingContents;
  uint64_t v21;
  NSMutableArray *trainingEvents;
  uint64_t v23;
  NSMutableArray *interactionTypes;
  void *v25;
  uint64_t v26;
  RERemoteTrainingClientListener *remoteTrainingListener;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RETrainingManager;
  v5 = -[RERelevanceEngineSubsystem initWithRelevanceEngine:](&v30, sel_initWithRelevanceEngine_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    trainingContexts = v5->_trainingContexts;
    v5->_trainingContexts = (NSMutableSet *)v6;

    objc_msgSend(v4, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RETrainingScheduler schedulerWithBehavior:](RETrainingScheduler, "schedulerWithBehavior:", objc_msgSend(v8, "trainingBehavior"));
    v9 = objc_claimAutoreleasedReturnValue();
    trainingScheduler = v5->_trainingScheduler;
    v5->_trainingScheduler = (RETrainingScheduler *)v9;

    objc_msgSend(v4, "coordinator");
    v11 = objc_claimAutoreleasedReturnValue();
    coordinator = v5->_coordinator;
    v5->_coordinator = (RELiveElementCoordinator *)v11;

    objc_msgSend(v4, "modelManager");
    v13 = objc_claimAutoreleasedReturnValue();
    modelManager = v5->_modelManager;
    v5->_modelManager = (REMLModelManager *)v13;

    -[RERelevanceEngineSubsystem queue](v5, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v17 = objc_claimAutoreleasedReturnValue();
    trainingFeatureMaps = v5->_trainingFeatureMaps;
    v5->_trainingFeatureMaps = (NSMutableArray *)v17;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v19 = objc_claimAutoreleasedReturnValue();
    trainingContents = v5->_trainingContents;
    v5->_trainingContents = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v21 = objc_claimAutoreleasedReturnValue();
    trainingEvents = v5->_trainingEvents;
    v5->_trainingEvents = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v23 = objc_claimAutoreleasedReturnValue();
    interactionTypes = v5->_interactionTypes;
    v5->_interactionTypes = (NSMutableArray *)v23;

    objc_msgSend(v4, "configuration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v25, "allowsRemoteTraining");

    if ((_DWORD)v8)
    {
      +[RERemoteTrainingClientListener sharedTrainingClientListener](RERemoteTrainingClientListener, "sharedTrainingClientListener");
      v26 = objc_claimAutoreleasedReturnValue();
      remoteTrainingListener = v5->_remoteTrainingListener;
      v5->_remoteTrainingListener = (RERemoteTrainingClientListener *)v26;

      -[RERemoteTrainingClientListener setDelegate:](v5->_remoteTrainingListener, "setDelegate:", v5);
    }
    objc_msgSend(v4, "logger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addLoggable:", v5);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[RETrainingManager makeContextCurrent:](self, "makeContextCurrent:", 0);
  -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLoggable:", self);

  v5.receiver = self;
  v5.super_class = (Class)RETrainingManager;
  -[RERelevanceEngineSubsystem dealloc](&v5, sel_dealloc);
}

- (void)addTrainingContext:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (v4)
  {
    if (!-[NSMutableSet containsObject:](self->_trainingContexts, "containsObject:", v4))
    {
      -[NSMutableSet addObject:](self->_trainingContexts, "addObject:", v15);
      -[RERelevanceEngineSubsystem relevanceEngine](self, "relevanceEngine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_configureForRelevanceEngine:", v13);

      goto LABEL_7;
    }
    v11 = (void *)*MEMORY[0x24BDBCAB8];
    v12 = CFSTR("Training context already added to relevance engine");
  }
  else
  {
    v11 = (void *)*MEMORY[0x24BDBCAB8];
    v12 = CFSTR("Training context must be non-nill");
  }
  RERaiseInternalException(v11, v12, v5, v6, v7, v8, v9, v10, v14);
LABEL_7:

}

- (void)removeTrainingContext:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (v4)
  {
    if (-[NSMutableSet containsObject:](self->_trainingContexts, "containsObject:", v4))
    {
      -[RETrainingManager currentTrainingContext](self, "currentTrainingContext");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v14;
      if (v11 == v14)
      {
        -[RETrainingManager makeContextCurrent:](self, "makeContextCurrent:", 0);
        v12 = v14;
      }
      objc_msgSend(v12, "_configureForRelevanceEngine:", 0);
      -[NSMutableSet removeObject:](self->_trainingContexts, "removeObject:", v14);
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Training context must be non-nill"), v5, v6, v7, v8, v9, v10, v13);
  }

}

- (void)performTrainingForElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[RETrainingManager currentTrainingContext](self, "currentTrainingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributeContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[RETrainingManager performTrainingForElementWithIdentifier:isPositiveEvent:interaction:context:](self, "performTrainingForElementWithIdentifier:isPositiveEvent:interaction:context:", v9, v5, v8, v11);
}

- (void)performTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[RETrainingManager currentTrainingContext](self, "currentTrainingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributeContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[RETrainingManager performTrainingForElement:isPositiveEvent:interaction:context:](self, "performTrainingForElement:isPositiveEvent:interaction:context:", v9, v5, v8, v11);
}

- (void)performTrainingForElementWithIdentifier:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__RETrainingManager_performTrainingForElementWithIdentifier_isPositiveEvent_interaction_context___block_invoke;
  block[3] = &unk_24CF8C940;
  block[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v12;
  v20 = v11;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(queue, block);

}

void __97__RETrainingManager_performTrainingForElementWithIdentifier_isPositiveEvent_interaction_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "featureMapForElementId:trainingContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "elementForElementId:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "relevanceProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_queue_trainElementWithIdentifier:relevanceProviders:featureMap:isPositiveEvent:interaction:context:", v4, v5, v6, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)performTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  RETrainingManager *v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__RETrainingManager_performTrainingForElement_isPositiveEvent_interaction_context___block_invoke;
  block[3] = &unk_24CF8C940;
  v18 = v10;
  v19 = self;
  v22 = a4;
  v20 = v12;
  v21 = v11;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  dispatch_async(queue, block);

}

void __83__RETrainingManager_performTrainingForElement_isPositiveEvent_interaction_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[REPredictionElement predictionElementFromElement:](REPredictionElement, "predictionElementFromElement:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "featureMapForElement:trainingContext:", v6, *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "relevanceProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_queue_trainElementWithIdentifier:relevanceProviders:featureMap:isPositiveEvent:interaction:context:", v4, v5, v2, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)_performTrainingForPredictionElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5 context:(id)a6
{
  _BOOL8 v7;
  RELiveElementCoordinator *coordinator;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a4;
  coordinator = self->_coordinator;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[RELiveElementCoordinator featureMapForElement:trainingContext:](coordinator, "featureMapForElement:trainingContext:", v13, v11);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "relevanceProviders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RETrainingManager _queue_trainElementWithIdentifier:relevanceProviders:featureMap:isPositiveEvent:interaction:context:](self, "_queue_trainElementWithIdentifier:relevanceProviders:featureMap:isPositiveEvent:interaction:context:", v14, v15, v16, v7, v12, v11);
}

- (void)flushTraining
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_20);
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_10);
  -[REMLModelManager flushTraining](self->_modelManager, "flushTraining");
}

- (void)_queue_trainElementWithIdentifier:(id)a3 relevanceProviders:(id)a4 featureMap:(id)a5 isPositiveEvent:(BOOL)a6 interaction:(id)a7 context:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSMutableArray *trainingEvents;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  RETrainingScheduler *trainingScheduler;
  const __CFString *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v10 = a6;
  v43 = *MEMORY[0x24BDAC8D0];
  v28 = a3;
  v29 = a4;
  v14 = a5;
  v15 = a7;
  v27 = a8;
  RELogForDomain(4);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v26 = CFSTR("negative");
      *(_DWORD *)buf = 138412802;
      v38 = v28;
      v39 = 2112;
      if (v10)
        v26 = CFSTR("positive");
      v40 = v26;
      v41 = 2112;
      v42 = v15;
      _os_log_debug_impl(&dword_2132F7000, v17, OS_LOG_TYPE_DEBUG, "Training for element %@ %@ %@", buf, 0x20u);
    }

    -[NSMutableArray addObject:](self->_trainingFeatureMaps, "addObject:", v14, v27);
    trainingEvents = self->_trainingEvents;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](trainingEvents, "addObject:", v19);

    -[NSMutableArray addObject:](self->_interactionTypes, "addObject:", v15);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = v29;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v33;
      v17 = MEMORY[0x24BDBD1A8];
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v24, "keywords");
            v17 = objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v21)
          continue;
        break;
      }
    }
    else
    {
      v17 = MEMORY[0x24BDBD1A8];
    }
LABEL_16:

    -[NSMutableArray addObject:](self->_trainingContents, "addObject:", v17);
    objc_initWeak((id *)buf, self);
    trainingScheduler = self->_trainingScheduler;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __121__RETrainingManager__queue_trainElementWithIdentifier_relevanceProviders_featureMap_isPositiveEvent_interaction_context___block_invoke;
    v30[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v31, (id *)buf);
    -[RETrainingScheduler performTask:](trainingScheduler, "performTask:", v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v28;
    _os_log_impl(&dword_2132F7000, v17, OS_LOG_TYPE_DEFAULT, "Dropping training for element %@ because we couldn't get its feature map", buf, 0xCu);
  }

}

void __121__RETrainingManager__queue_trainElementWithIdentifier_relevanceProviders_featureMap_isPositiveEvent_interaction_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performTraining:completion:", 0, 0);

}

- (void)manuallyPerformTrainingWithCompletion:(id)a3
{
  RETrainingScheduler *trainingScheduler;
  id v5;

  trainingScheduler = self->_trainingScheduler;
  v5 = a3;
  -[RETrainingScheduler cancelPendindTasks](trainingScheduler, "cancelPendindTasks");
  -[RETrainingManager _performTraining:completion:](self, "_performTraining:completion:", 1, v5);

}

- (void)_performTraining:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  if (a3 || !RETrainingSimulationIsCurrentlyActive())
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__RETrainingManager__performTraining_completion___block_invoke;
    block[3] = &unk_24CF8B6C8;
    block[4] = self;
    v10 = a3;
    v9 = v6;
    dispatch_async(queue, block);

  }
  else if (v6)
  {
    dispatch_async((dispatch_queue_t)self->_queue, v6);
  }

}

void __49__RETrainingManager__performTraining_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = (void *)MEMORY[0x2199B223C]();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v3 + 48), "performTrainingWithFeatureMaps:content:events:interactions:purgeCaches:completion:", *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 104), *(_QWORD *)(v3 + 112), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 96);
    *(_QWORD *)(v8 + 96) = v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 104);
    *(_QWORD *)(v11 + 104) = v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 100);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 112);
    *(_QWORD *)(v14 + 112) = v13;

  }
  objc_autoreleasePoolPop(v2);
}

- (void)makeContextCurrent:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[RETrainingManager currentTrainingContext](self, "currentTrainingContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5)
  {
    objc_msgSend(v4, "_willResignCurrent");
    objc_msgSend(v5, "_willBecomeCurrent");
    -[RETrainingManager setCurrentTrainingContext:](self, "setCurrentTrainingContext:", v5);
    objc_msgSend(v4, "_didResignCurrent");
    objc_msgSend(v5, "_didBecomeCurrent");
  }

}

- (NSMutableArray)trainingEvents
{
  return self->_trainingEvents;
}

- (RETrainingScheduler)trainingScheduler
{
  return self->_trainingScheduler;
}

- (RETrainingContext)currentTrainingContext
{
  return (RETrainingContext *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCurrentTrainingContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTrainingContext, 0);
  objc_storeStrong((id *)&self->_interactionTypes, 0);
  objc_storeStrong((id *)&self->_trainingEvents, 0);
  objc_storeStrong((id *)&self->_trainingContents, 0);
  objc_storeStrong((id *)&self->_trainingFeatureMaps, 0);
  objc_storeStrong((id *)&self->_remoteTrainingListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trainingContexts, 0);
  objc_storeStrong((id *)&self->_trainingScheduler, 0);
  objc_storeStrong((id *)&self->_modelManager, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
