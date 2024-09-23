@implementation RERelevanceProviderManager

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

uint64_t __46__RERelevanceProviderManager__scheduleUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_scheduleUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)setSupportedFeatures:(id)a3
{
  REFeatureSet *v4;
  REFeatureSet *v5;
  REFeatureSet *v6;
  BOOL v7;
  REFeatureSet *v8;
  REFeatureSet *supportedFeatures;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSArray *v17;
  NSArray *effectiveFeatures;
  NSArray *v19;
  NSArray *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *inflectionValues;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = (REFeatureSet *)a3;
  v5 = self->_supportedFeatures;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[REFeatureSet isEqual:](v5, "isEqual:", v4);

    if (!v7)
    {
      v8 = (REFeatureSet *)-[REFeatureSet copy](v4, "copy");
      supportedFeatures = self->_supportedFeatures;
      self->_supportedFeatures = v8;

      if (self->_supportedFeatures)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend((id)objc_opt_class(), "_features");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v39 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
              if (-[REFeatureSet containsFeature:](self->_supportedFeatures, "containsFeature:", v16))
                objc_msgSend(v10, "addObject:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v13);
        }

        v17 = (NSArray *)objc_msgSend(v10, "copy");
        effectiveFeatures = self->_effectiveFeatures;
        self->_effectiveFeatures = v17;

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_features");
        v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v20 = self->_effectiveFeatures;
        self->_effectiveFeatures = v19;

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
      objc_msgSend(WeakRetained, "relevanceEngine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "inflectionFeatureValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSArray count](self->_effectiveFeatures, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v25 = self->_effectiveFeatures;
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v35 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
            objc_msgSend(v23, "objectForKeyedSubscript:", v30, (_QWORD)v34);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, v30);

          }
          v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v27);
      }

      v32 = (NSDictionary *)objc_msgSend(v24, "copy");
      inflectionValues = self->_inflectionValues;
      self->_inflectionValues = v32;

    }
  }

}

- (void)_scheduleUpdate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__RERelevanceProviderManager__scheduleUpdate___block_invoke;
  v7[3] = &unk_24CF8AB18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)setEnvironment:(id)a3
{
  id v5;

  objc_storeWeak((id *)&self->_environment, a3);
  if (a3)
  {
    +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders](RERelevanceProviderManagerUpdate, "immediateUpdateForAllProviders");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[RERelevanceProviderManager _scheduleUpdate:](self, "_scheduleUpdate:", v5);

  }
}

+ (id)_dependencyClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

+ (id)providerManagerClasses
{
  if (providerManagerClasses_onceToken != -1)
    dispatch_once(&providerManagerClasses_onceToken, &__block_literal_global_1);
  return (id)providerManagerClasses__providerManagersClasses;
}

- (void)_accessQueue_scheduleUpdate:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RERelevanceProviderManager _accessQueue_performImmediateUpdate:](self, "_accessQueue_performImmediateUpdate:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v5;
      if (-[REPriorityQueue containsObject:](self->_scheduledUpdates, "containsObject:", v4))
        -[RERelevanceProviderManager _accessQueue_appendCompletionHandlerForScheduledUpdate:](self, "_accessQueue_appendCompletionHandlerForScheduledUpdate:", v4);
      else
        -[REPriorityQueue insertObject:](self->_scheduledUpdates, "insertObject:", v4);
      -[RERelevanceProviderManager _accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded](self, "_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded");

    }
  }

}

- (void)_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  NSString *loggingHeader;
  uint64_t v10;
  void *v11;
  void *v12;
  OS_dispatch_queue *accessQueue;
  REUpNextTimer *v14;
  REUpNextTimer *updateTimer;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REPriorityQueue minimumObject](self->_scheduledUpdates, "minimumObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    *(_QWORD *)&v5 = 138412290;
    v16 = v5;
    do
    {
      objc_msgSend(v4, "updateDate", v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "compare:", v3) == 1;

      if (v7)
        break;
      RELogForDomain(3);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        loggingHeader = self->_loggingHeader;
        *(_DWORD *)buf = v16;
        v20 = loggingHeader;
        _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_DEFAULT, "%@ performing scheduled update", buf, 0xCu);
      }

      -[RERelevanceProviderManager _accessQueue_performUpdate:](self, "_accessQueue_performUpdate:", v4);
      -[REPriorityQueue removeMinimumObject](self->_scheduledUpdates, "removeMinimumObject");
      -[REPriorityQueue minimumObject](self->_scheduledUpdates, "minimumObject");
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
    while (v10);
  }
  if (-[REPriorityQueue count](self->_scheduledUpdates, "count"))
  {
    -[REPriorityQueue minimumObject](self->_scheduledUpdates, "minimumObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    accessQueue = self->_accessQueue;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __88__RERelevanceProviderManager__accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded__block_invoke;
    v17[3] = &unk_24CF8ABD0;
    objc_copyWeak(&v18, (id *)buf);
    +[REUpNextTimer timerWithFireDate:queue:block:](REUpNextTimer, "timerWithFireDate:queue:block:", v12, accessQueue, v17);
    v14 = (REUpNextTimer *)objc_claimAutoreleasedReturnValue();
    updateTimer = self->_updateTimer;
    self->_updateTimer = v14;

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    -[RERelevanceProviderManager _accessQueue_resetTimer](self, "_accessQueue_resetTimer");
  }

}

- (void)_accessQueue_resetTimer
{
  REUpNextTimer *updateTimer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  -[REUpNextTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

- (void)_accessQueue_performImmediateUpdate:(id)a3
{
  NSObject *accessQueue;
  id v5;

  accessQueue = self->_accessQueue;
  v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  -[RERelevanceProviderManager _accessQueue_performUpdate:](self, "_accessQueue_performUpdate:", v5);

  -[RERelevanceProviderManager _accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded](self, "_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded");
}

- (void)_accessQueue_performUpdate:(id)a3
{
  int v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v4 = objc_msgSend(v8, "allProviders");
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (v4)
  {
    objc_msgSend(v8, "completion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "scheduleUpdateForRelevanceProviderManager:completion:", self, v6);
  }
  else
  {
    objc_msgSend(v8, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "completion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "scheduleUpdateForRelevanceProvider:completion:", v6, v7);

  }
}

- (NSArray)allProviders
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  return -[NSHashTable allObjects](self->_providers, "allObjects");
}

+ (BOOL)_wantsDelayedUpdate
{
  return 0;
}

- (void)_prepareForUpdateWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *relevanceQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_implementsPrepareForUpdate)
  {
    relevanceQueue = self->_relevanceQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__RERelevanceProviderManager__prepareForUpdateWithCompletion___block_invoke;
    v7[3] = &unk_24CF8AA78;
    v7[4] = self;
    v8 = v4;
    dispatch_async(relevanceQueue, v7);

  }
  else
  {
    v4[2](v4);
  }

}

- (RERelevanceProviderManager)initWithQueue:(id)a3
{
  id v5;
  RERelevanceProviderManager *v6;
  RERelevanceProviderManager *v7;
  uint64_t v8;
  NSHashTable *providers;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *relevanceQueue;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  REPriorityQueue *v22;
  REPriorityQueue *scheduledUpdates;
  void *v24;
  void *v25;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)RERelevanceProviderManager;
  v6 = -[RERelevanceProviderManager init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    -[RERelevanceProviderManager _loadLoggingHeader](v6, "_loadLoggingHeader");
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v8 = objc_claimAutoreleasedReturnValue();
    providers = v7->_providers;
    v7->_providers = (NSHashTable *)v8;

    v7->_dataStoresOpened = 0;
    objc_storeStrong((id *)&v7->_accessQueue, a3);
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.RelevanceEngine.%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = objc_retainAutorelease(v13);
    v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), v14);
    relevanceQueue = v7->_relevanceQueue;
    v7->_relevanceQueue = (OS_dispatch_queue *)v16;

    v18 = (void *)objc_opt_class();
    v7->_implementsPrepareForUpdate = RESubclassOverridesMethod(v7, v18, (uint64_t)sel__prepareForUpdate);
    v19 = objc_msgSend((id)objc_opt_class(), "_wantsSeperateRelevanceQueue");
    v7->_hasSeperateRelevanceQueue = v19;
    if (v19)
    {
      if (initWithQueue__onceToken != -1)
        dispatch_once(&initWithQueue__onceToken, &__block_literal_global_79);
      v20 = v7->_relevanceQueue;
      objc_msgSend((id)initWithQueue__QueuePool, "nextAvailableQueue");
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_set_target_queue(v20, v21);

    }
    else
    {
      dispatch_set_target_queue((dispatch_object_t)v7->_relevanceQueue, (dispatch_queue_t)v7->_accessQueue);
    }
    -[RERelevanceProviderManager setSupportedFeatures:](v7, "setSupportedFeatures:", 0);
    v22 = -[REPriorityQueue initWithComparator:]([REPriorityQueue alloc], "initWithComparator:", &__block_literal_global_85);
    scheduledUpdates = v7->_scheduledUpdates;
    v7->_scheduledUpdates = v22;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    RESignificantTimeChangeNotification();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v7, sel__handleSignificantTimeChange, v25, 0);

  }
  return v7;
}

- (void)_loadLoggingHeader
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *loggingHeader;
  id v9;

  v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_relevanceProviderClass");
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("NTK"), &stru_24CF92178, 1, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("RelevanceProvider"), &stru_24CF92178, 1, 0, objc_msgSend(v9, "length"));
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("[PM: %@]"), v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  loggingHeader = self->_loggingHeader;
  self->_loggingHeader = v7;

}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 1;
}

+ (void)setProviderManagerClassesLoadingBlock:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)REProviderManagerLoadingBlock;
  REProviderManagerLoadingBlock = v3;

}

void __52__RERelevanceProviderManager_providerManagerClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 17);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)providerManagerClasses__providerManagersClasses;
  providerManagerClasses__providerManagersClasses = v0;

  if (REProviderManagerLoadingBlock)
  {
    v9 = (void *)providerManagerClasses__providerManagersClasses;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(REProviderManagerLoadingBlock + 16))(REProviderManagerLoadingBlock, v2, v3, v4, v5, v6, v7, v8, v13, v14, v15, v16, v17, v18, v19, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)providerManagerClasses__providerManagersClasses;
    providerManagerClasses__providerManagersClasses = v11;

  }
}

void __44__RERelevanceProviderManager_initWithQueue___block_invoke()
{
  REDispatchQueuePool *v0;
  void *v1;

  v0 = -[REDispatchQueuePool initWithQueueCount:prefix:]([REDispatchQueuePool alloc], "initWithQueueCount:prefix:", 2, CFSTR("com.apple.RelevanceEngine.ProviderManager"));
  v1 = (void *)initWithQueue__QueuePool;
  initWithQueue__QueuePool = (uint64_t)v0;

}

uint64_t __44__RERelevanceProviderManager_initWithQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  return REScheduledUpdateSortedByDate(a2, a3);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_dataStoresOpened)
    -[RERelevanceProviderManager pause](self, "pause");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RESignificantTimeChangeNotification();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)RERelevanceProviderManager;
  -[RERelevanceProviderManager dealloc](&v5, sel_dealloc);
}

+ (BOOL)_requiresLocationServices
{
  return 0;
}

- (float)_relevanceForProvider:(id)a3
{
  return 0.0;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  float v4;

  -[RERelevanceProviderManager _relevanceForProvider:](self, "_relevanceForProvider:", a3, a4);
  return +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v4);
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  return -[RERelevanceProviderManager _valueForProvider:feature:](self, "_valueForProvider:feature:", a3, a5);
}

- (id)_valuesForProvider:(id)a3 context:(id)a4 features:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    v28 = (void *)*MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[RERelevanceProviderManager _valueForProvider:context:feature:](self, "_valueForProvider:context:feature:", v8, v9, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          RERaiseInternalException(v28, CFSTR("%@ Unable to get feature value for relevance provider %@"), v21, v22, v23, v24, v25, v26, (uint64_t)v20);

          +[REFeatureValue nullValueForFeature:](REFeatureValue, "nullValueForFeature:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

  return v11;
}

+ (BOOL)_supportsHistoricProviders
{
  return 0;
}

- (BOOL)_isHistoricProvider:(id)a3
{
  return 0;
}

- (float)_relevanceForHistoricProvider:(id)a3
{
  return 0.0;
}

- (id)_valueForHistoricProvider:(id)a3 feature:(id)a4
{
  float v4;

  -[RERelevanceProviderManager _relevanceForHistoricProvider:](self, "_relevanceForHistoricProvider:", a3, a4);
  return +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:", v4);
}

- (NSArray)effectiveFeatures
{
  return self->_effectiveFeatures;
}

- (void)addProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!-[RERelevanceProviderManager _isValidProvider:](self, "_isValidProvider:", v6))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Provider %@ is not support by provider manager %@"), v6, self);
  -[NSHashTable addObject:](self->_providers, "addObject:", v6);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__RERelevanceProviderManager_addProvider_completion___block_invoke;
  v12[3] = &unk_24CF8AA00;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x2199B2434](v12);
  v11 = v10;
  if (self->_hasSeperateRelevanceQueue)
    dispatch_async((dispatch_queue_t)self->_relevanceQueue, v10);
  else
    v10[2](v10);

}

void __53__RERelevanceProviderManager_addProvider_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _BYTE *v4;

  objc_msgSend(*(id *)(a1 + 32), "_addedProvider:", *(_QWORD *)(a1 + 40));
  RELogForDomain(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__RERelevanceProviderManager_addProvider_completion___block_invoke_cold_1();

  +[RERelevanceProviderManagerUpdate immediateUpdateForProvider:](RERelevanceProviderManagerUpdate, "immediateUpdateForProvider:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletion:", *(_QWORD *)(a1 + 48));
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[57])
    objc_msgSend(v4, "_scheduleUpdate:", v3);
  else
    objc_msgSend(v4, "_accessQueue_scheduleUpdate:", v3);

}

- (void)removeProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (!-[NSHashTable containsObject:](self->_providers, "containsObject:", v6))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("No provider %@ was found by provider manager %@"), v6, self);
  -[NSHashTable removeObject:](self->_providers, "removeObject:", v6);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__RERelevanceProviderManager_removeProvider_completion___block_invoke;
  v12[3] = &unk_24CF8AA00;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x2199B2434](v12);
  v11 = v10;
  if (self->_hasSeperateRelevanceQueue)
    dispatch_async((dispatch_queue_t)self->_relevanceQueue, v10);
  else
    v10[2](v10);

}

uint64_t __56__RERelevanceProviderManager_removeProvider_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_removeProvider:", *(_QWORD *)(a1 + 40));
  RELogForDomain(3);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__RERelevanceProviderManager_removeProvider_completion___block_invoke_cold_1();

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)containsProvider:(id)a3
{
  RERelevanceProviderManager *v3;
  NSObject *accessQueue;
  id v5;

  v3 = self;
  accessQueue = self->_accessQueue;
  v5 = a3;
  dispatch_assert_queue_V2(accessQueue);
  LOBYTE(v3) = -[NSHashTable containsObject:](v3->_providers, "containsObject:", v5);

  return (char)v3;
}

- (void)relevanceForProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *relevanceQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  relevanceQueue = self->_relevanceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__RERelevanceProviderManager_relevanceForProvider_completion___block_invoke;
  block[3] = &unk_24CF8AA00;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(relevanceQueue, block);

}

void __62__RERelevanceProviderManager_relevanceForProvider_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  objc_msgSend(v2, "effectiveFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_valuesForProvider:context:features:", v3, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  RELogForDomain(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = a1[5];
    v8 = *(_QWORD *)(a1[4] + 80);
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v7;
    _os_log_debug_impl(&dword_2132F7000, v6, OS_LOG_TYPE_DEBUG, "%@ calculated relevances %@ for relevance provider %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (id)relevanceForProvider:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *relevanceQueue;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  if (self->_hasSeperateRelevanceQueue)
  {
    relevanceQueue = self->_relevanceQueue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__RERelevanceProviderManager_relevanceForProvider_context___block_invoke;
    v14[3] = &unk_24CF8AA28;
    v17 = &v18;
    v14[4] = self;
    v15 = v6;
    v16 = v7;
    dispatch_sync(relevanceQueue, v14);

  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
    -[RERelevanceProviderManager effectiveFeatures](self, "effectiveFeatures");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RERelevanceProviderManager _valuesForProvider:context:features:](self, "_valuesForProvider:context:features:", v6, v7, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v19[5];
    v19[5] = v10;

  }
  v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __59__RERelevanceProviderManager_relevanceForProvider_context___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  objc_msgSend(v2, "effectiveFeatures");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_valuesForProvider:context:features:", v3, v4, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)isProviderHistoric:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *relevanceQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  relevanceQueue = self->_relevanceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__RERelevanceProviderManager_isProviderHistoric_completion___block_invoke;
  block[3] = &unk_24CF8AA00;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(relevanceQueue, block);

}

uint64_t __60__RERelevanceProviderManager_isProviderHistoric_completion___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isHistoricProvider:", *(_QWORD *)(a1 + 40));
  RELogForDomain(3);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = CFSTR("current");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    if (v2)
      v6 = CFSTR("historic");
    v8 = 138412802;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_debug_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEBUG, "%@ relevance provider %@ is %@", (uint8_t *)&v8, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)relevanceForHistoricProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *relevanceQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  relevanceQueue = self->_relevanceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__RERelevanceProviderManager_relevanceForHistoricProvider_completion___block_invoke;
  block[3] = &unk_24CF8AA00;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(relevanceQueue, block);

}

void __70__RERelevanceProviderManager_relevanceForHistoricProvider_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(*(id *)(a1 + 32), "effectiveFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "effectiveFeatures", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_valueForHistoricProvider:feature:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v7);
  }

  RELogForDomain(3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    *(_DWORD *)buf = 138412802;
    v19 = v13;
    v20 = 2112;
    v21 = v4;
    v22 = 2112;
    v23 = v12;
    _os_log_debug_impl(&dword_2132F7000, v11, OS_LOG_TYPE_DEBUG, "%@ calculated historic relevances %@ for relevance provider %@", buf, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (RERelevanceProviderEnvironment)environment
{
  return (RERelevanceProviderEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (id)_engineLocationManager
{
  void *v2;
  void *v3;
  void *v4;

  -[RERelevanceProviderManager environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevanceEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)beginActivity:(id)a3
{
  RERelevanceProviderEnvironment **p_environment;
  id v5;
  id WeakRetained;

  p_environment = &self->_environment;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(WeakRetained, "beginActivity:forObject:", v5, self);

}

- (void)endActivity:(id)a3
{
  RERelevanceProviderEnvironment **p_environment;
  id v5;
  id WeakRetained;

  p_environment = &self->_environment;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(WeakRetained, "endActivity:forObject:", v5, self);

}

- (void)enumerateInflectionFeatureValues:(id)a3
{
  id v4;
  NSDictionary *inflectionValues;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    inflectionValues = self->_inflectionValues;
    v7[1] = 3221225472;
    v7[2] = __63__RERelevanceProviderManager_enumerateInflectionFeatureValues___block_invoke;
    v7[3] = &unk_24CF8AA50;
    v6 = v4;
    v7[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inflectionValues, "enumerateKeysAndObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

void __63__RERelevanceProviderManager_enumerateInflectionFeatureValues___block_invoke(uint64_t a1, void *a2, void *a3)
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
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (BOOL)_isValidProvider:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_relevanceProviderClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_dataSourcesOpened
{
  return self->_dataStoresOpened;
}

- (id)_manager_queue
{
  return self->_relevanceQueue;
}

- (void)_enumerateProviders:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__RERelevanceProviderManager__enumerateProviders___block_invoke;
  v7[3] = &unk_24CF8AA78;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __50__RERelevanceProviderManager__enumerateProviders___block_invoke(uint64_t a1)
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
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)beginFetchingData
{
  -[RERelevanceProviderManager beginActivity:](self, "beginActivity:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
}

- (void)finishFetchingData
{
  -[RERelevanceProviderManager endActivity:](self, "endActivity:", CFSTR("RERelevanceEngineSubsystemLoadingActivity"));
}

- (void)resumeWithCompletion:(id)a3
{
  id v4;
  NSObject *relevanceQueue;
  id v6;
  dispatch_block_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  relevanceQueue = self->_relevanceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__RERelevanceProviderManager_resumeWithCompletion___block_invoke;
  block[3] = &unk_24CF8AAA0;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v6 = v4;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, -1, block);
  dispatch_async(relevanceQueue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__RERelevanceProviderManager_resumeWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v3;
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((_BYTE *)WeakRetained + 56))
      -[dispatch_queue_t _relevanceQueue_openDataStores](WeakRetained, "_relevanceQueue_openDataStores");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__RERelevanceProviderManager_resumeWithCompletion___block_invoke_2;
    v6[3] = &unk_24CF8AA78;
    v6[4] = v3;
    v7 = *(id *)(a1 + 32);
    v4 = (void (**)(_QWORD))MEMORY[0x2199B2434](v6);
    v5 = v4;
    if (*((_BYTE *)v3 + 57))
      dispatch_async(v3[9], v4);
    else
      v4[2](v4);

  }
}

uint64_t __51__RERelevanceProviderManager_resumeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pauseWithCompletion:(id)a3
{
  id v4;
  NSObject *accessQueue;
  uint64_t v6;
  NSObject *relevanceQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke;
  block[3] = &unk_24CF8AAC8;
  objc_copyWeak(&v13, &location);
  dispatch_async(accessQueue, block);
  relevanceQueue = self->_relevanceQueue;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke_2;
  v9[3] = &unk_24CF8AAA0;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v8 = v4;
  dispatch_async(relevanceQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessQueue_resetTimer");

}

void __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && WeakRetained[56])
  {
    objc_msgSend(WeakRetained, "pause");
    v3[56] = 0;
    RELogForDomain(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
  }

}

- (void)_handleSignificantTimeChange
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__RERelevanceProviderManager__handleSignificantTimeChange__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __58__RERelevanceProviderManager__handleSignificantTimeChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded");
}

- (void)_removeAllPendingUpdates
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__RERelevanceProviderManager__removeAllPendingUpdates__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __54__RERelevanceProviderManager__removeAllPendingUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

uint64_t __62__RERelevanceProviderManager__prepareForUpdateWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_prepareForUpdate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSArray)allRelevanceProviders
{
  return -[NSHashTable allObjects](self->_providers, "allObjects");
}

- (BOOL)dataSourcesOpened
{
  return self->_dataStoresOpened;
}

- (unint64_t)scheduledUpdatesCount
{
  return -[REPriorityQueue count](self->_scheduledUpdates, "count");
}

- (void)_relevanceQueue_openDataStores
{
  OUTLINED_FUNCTION_4(&dword_2132F7000, a2, a3, "%@ opened data sources", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __60__RERelevanceProviderManager__relevanceQueue_openDataStores__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "immediateUpdateForRelevanceProviderManager:completion:", *(_QWORD *)(a1 + 32), &__block_literal_global_109);

}

- (void)_accessQueue_appendCompletionHandlerForScheduledUpdate:(id)a3
{
  id v4;
  void *v5;
  REPriorityQueue *scheduledUpdates;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_msgSend(v4, "completion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    scheduledUpdates = self->_scheduledUpdates;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __85__RERelevanceProviderManager__accessQueue_appendCompletionHandlerForScheduledUpdate___block_invoke;
    v7[3] = &unk_24CF8ABA8;
    v9 = v10;
    v8 = v4;
    -[REPriorityQueue enumerateObjects:](scheduledUpdates, "enumerateObjects:", v7);

    _Block_object_dispose(v10, 8);
  }

}

void __85__RERelevanceProviderManager__accessQueue_appendCompletionHandlerForScheduledUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 32), "completion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "completion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "completion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __85__RERelevanceProviderManager__accessQueue_appendCompletionHandlerForScheduledUpdate___block_invoke_2;
      v10[3] = &unk_24CF8AB80;
      v11 = v6;
      v12 = v7;
      v8 = v7;
      v9 = v6;
      objc_msgSend(v4, "setCompletion:", v10);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "completion");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCompletion:", v9);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t __85__RERelevanceProviderManager__accessQueue_appendCompletionHandlerForScheduledUpdate___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __88__RERelevanceProviderManager__accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessQueue_performPendingUpdatesAndScheduleTimerIfNeeded");

}

- (REFeatureSet)supportedFeatures
{
  return self->_supportedFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFeatures, 0);
  objc_storeStrong((id *)&self->_loggingHeader, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_relevanceQueue, 0);
  objc_storeStrong((id *)&self->_inflectionValues, 0);
  objc_storeStrong((id *)&self->_effectiveFeatures, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_scheduledUpdates, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_destroyWeak((id *)&self->_environment);
}

+ (Class)_relevanceProviderClass
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  return (Class)objc_opt_class();
}

+ (id)_features
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  return (id)MEMORY[0x24BDBD1A8];
}

void __53__RERelevanceProviderManager_addProvider_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ added relevance provider %@");
  OUTLINED_FUNCTION_3();
}

void __56__RERelevanceProviderManager_removeProvider_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2132F7000, v0, v1, "%@ removed relevance provider %@");
  OUTLINED_FUNCTION_3();
}

void __50__RERelevanceProviderManager_pauseWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_2132F7000, a2, a3, "%@ closed data sources", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
