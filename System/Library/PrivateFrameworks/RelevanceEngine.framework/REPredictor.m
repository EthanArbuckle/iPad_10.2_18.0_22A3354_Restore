@implementation REPredictor

+ (id)systemPredictorsSupportingFeatureSet:(id)a3 relevanceEngine:(id)a4
{
  id v6;
  REMutableFeatureSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REPredictorManager *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = a4;
  v7 = objc_alloc_init(REMutableFeatureSet);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "availablePredictors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "supportedFeatures");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        objc_msgSend(v16, "intersetFeatureSet:", v6);
        if (objc_msgSend(v16, "count"))
        {
          -[REMutableFeatureSet unionFeatureSet:](v7, "unionFeatureSet:", v16);
          objc_msgSend(v14, "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v18 = -[REPredictorManager initWithPredictors:featureSet:relevanceEngine:]([REPredictorManager alloc], "initWithPredictors:featureSet:relevanceEngine:", v8, v7, v20);
  return v18;
}

+ (id)availablePredictors
{
  if (availablePredictors_onceToken != -1)
    dispatch_once(&availablePredictors_onceToken, &__block_literal_global_31);
  return (id)availablePredictors_PredictorClasses;
}

void __34__REPredictor_availablePredictors__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];

  v2[10] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)availablePredictors_PredictorClasses;
  availablePredictors_PredictorClasses = v0;

}

- (id)_init
{
  _QWORD *v2;
  objc_class *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  _QWORD block[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)REPredictor;
  v2 = -[REObservableSingleton _init](&v33, sel__init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_init_onceToken != -1)
      dispatch_once(&_init_onceToken, &__block_literal_global_14_0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.RelevanceEngine.%@"), v4);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    objc_msgSend((id)_init_QueuePool, "nextAvailableQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2(v8, v6, v9);
    v11 = (void *)v2[2];
    v2[2] = v10;

    v12 = objc_opt_new();
    v13 = (void *)v2[3];
    v2[3] = v12;

    *((_DWORD *)v2 + 12) = 0;
    objc_msgSend(MEMORY[0x24BDD14E0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v2[5];
    v2[5] = v14;

    objc_initWeak(&location, v2);
    +[RESingleton sharedInstance](RERelevanceSignalUpdateScheduler, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "updateInterval");
    v18 = v17;
    v19 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __20__REPredictor__init__block_invoke_2;
    v30[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v16, "scheduleEventWithIdentifier:updateFrequency:completion:", v4, v30, v18);

    v20 = v2[2];
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __20__REPredictor__init__block_invoke_3;
    v28[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v29, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v20, v28, 0.1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v2[4];
    v2[4] = v21;

    objc_msgSend(v2, "beginFetchingData");
    v23 = dispatch_time(0, 500000000);
    v24 = v2[2];
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __20__REPredictor__init__block_invoke_4;
    block[3] = &unk_24CF8AAC8;
    objc_copyWeak(&v27, &location);
    dispatch_after(v23, v24, block);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __20__REPredictor__init__block_invoke()
{
  REDispatchQueuePool *v0;
  void *v1;

  v0 = -[REDispatchQueuePool initWithQueueCount:prefix:]([REDispatchQueuePool alloc], "initWithQueueCount:prefix:", 2, CFSTR("com.apple.RelevanceEngine.Predictor"));
  v1 = (void *)_init_QueuePool;
  _init_QueuePool = (uint64_t)v0;

}

void __20__REPredictor__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void __20__REPredictor__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performUpdate");

}

void __20__REPredictor__init__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performUpdate");
  objc_msgSend(WeakRetained, "finishFetchingData");

}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RESingleton sharedInstance](RERelevanceSignalUpdateScheduler, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unscheduleEventWithIdentifier:", v4);

  v6.receiver = self;
  v6.super_class = (Class)REPredictor;
  -[REPredictor dealloc](&v6, sel_dealloc);
}

- (id)queue
{
  return self->_queue;
}

- (void)onQueue:(id)a3
{
  if (a3)
    dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)onQueueSync:(id)a3
{
  if (a3)
    dispatch_sync((dispatch_queue_t)self->_queue, a3);
}

- (void)updateObservers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __30__REPredictor_updateObservers__block_invoke;
  v2[3] = &unk_24CF8AEF0;
  v2[4] = self;
  -[REObservableSingleton enumerateObservers:](self, "enumerateObservers:", v2);
}

void __30__REPredictor_updateObservers__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "predictorDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)beginUpdates
{
  os_unfair_lock_s *p_predictorLock;
  int64_t v4;

  p_predictorLock = &self->_predictorLock;
  os_unfair_lock_lock(&self->_predictorLock);
  v4 = -[REPredictor beginUpdatesCount](self, "beginUpdatesCount");
  -[REPredictor setBeginUpdatesCount:](self, "setBeginUpdatesCount:", v4 + 1);
  os_unfair_lock_unlock(p_predictorLock);
  if ((v4 & 0x8000000000000000) == 0)
    -[REPredictor _setRunning:](self, "_setRunning:", 1);
}

- (void)endUpdates
{
  os_unfair_lock_s *p_predictorLock;
  uint64_t v4;

  p_predictorLock = &self->_predictorLock;
  os_unfair_lock_lock(&self->_predictorLock);
  v4 = -[REPredictor beginUpdatesCount](self, "beginUpdatesCount");
  -[REPredictor setBeginUpdatesCount:](self, "setBeginUpdatesCount:", v4 - 1);
  os_unfair_lock_unlock(p_predictorLock);
  if (v4 <= 1)
    -[REPredictor _setRunning:](self, "_setRunning:", 0);
}

- (void)_setRunning:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *queue;
  _QWORD v6[5];
  BOOL v7;

  v3 = a3;
  if (-[REPredictor _isRunning](self, "_isRunning") != a3)
  {
    -[REPredictor _setIsRunning:](self, "_setIsRunning:", v3);
    queue = self->_queue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __27__REPredictor__setRunning___block_invoke;
    v6[3] = &unk_24CF8B678;
    v7 = v3;
    v6[4] = self;
    dispatch_async(queue, v6);
  }
}

uint64_t __27__REPredictor__setRunning___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "resume");
  else
    return objc_msgSend(v2, "pause");
}

- (void)addRelevanceEngine:(id)a3
{
  -[REObserverStore addObserver:](self->_engines, "addObserver:", a3);
}

- (void)removeRelevanceEngine:(id)a3
{
  -[REObserverStore removeObserver:](self->_engines, "removeObserver:", a3);
}

- (id)engines
{
  return -[REObserverStore allObservers](self->_engines, "allObservers");
}

- (void)enumerateInflectionFeatureValues:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[REPredictor engines](self, "engines");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      v9 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "inflectionFeatureValues");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = v9;
          v14[1] = 3221225472;
          v14[2] = __48__REPredictor_enumerateInflectionFeatureValues___block_invoke;
          v14[3] = &unk_24CF8DB00;
          v13 = v4;
          v14[4] = v11;
          v15 = v13;
          objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
}

void __48__REPredictor_enumerateInflectionFeatureValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v11);

        if (v13)
        {

          v11 = 0;
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)beginFetchingData
{
  -[REPredictor beginActivity:](self, "beginActivity:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
}

- (void)finishFetchingData
{
  -[REPredictor finishActivity:](self, "finishActivity:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
}

+ (double)updateInterval
{
  return 86400.0;
}

+ (id)supportedFeatures
{
  return (id)objc_opt_new();
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  return 0;
}

- (void)invalidate
{
  -[REUpNextScheduler schedule](self->_refreshScheduler, "schedule");
}

- (void)_performUpdate
{
  -[REPredictor beginFetchingData](self, "beginFetchingData");
  -[REPredictor update](self, "update");
  -[REPredictor finishFetchingData](self, "finishFetchingData");
}

- (BOOL)_isRunning
{
  return self->__isRunning;
}

- (void)_setIsRunning:(BOOL)a3
{
  self->__isRunning = a3;
}

- (int64_t)beginUpdatesCount
{
  return self->_beginUpdatesCount;
}

- (void)setBeginUpdatesCount:(int64_t)a3
{
  self->_beginUpdatesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_refreshScheduler, 0);
  objc_storeStrong((id *)&self->_engines, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)beginActivity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_predictorLock);
  -[NSCountedSet addObject:](self->_activities, "addObject:", v4);
  os_unfair_lock_unlock(&self->_predictorLock);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__REPredictor_REActivityTracking__beginActivity___block_invoke;
  v6[3] = &unk_24CF8DB28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[REObservableSingleton enumerateObservers:](self, "enumerateObservers:", v6);

}

void __49__REPredictor_REActivityTracking__beginActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "predictor:didBeginActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)finishActivity:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_lock(&self->_predictorLock);
  -[NSCountedSet removeObject:](self->_activities, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_predictorLock);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__REPredictor_REActivityTracking__finishActivity___block_invoke;
  v6[3] = &unk_24CF8DB28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[REObservableSingleton enumerateObservers:](self, "enumerateObservers:", v6);

}

void __50__REPredictor_REActivityTracking__finishActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "predictor:didFinishActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSCountedSet)outstandingActivities
{
  os_unfair_lock_s *p_predictorLock;
  void *v4;

  p_predictorLock = &self->_predictorLock;
  os_unfair_lock_lock(&self->_predictorLock);
  v4 = (void *)-[NSCountedSet copy](self->_activities, "copy");
  os_unfair_lock_unlock(p_predictorLock);
  return (NSCountedSet *)v4;
}

@end
