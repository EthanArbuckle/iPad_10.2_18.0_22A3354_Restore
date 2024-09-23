@implementation ATXModeHeuristicClassifier

- (ATXModeHeuristicClassifier)initWithConfiguredModeService:(id)a3 locationManager:(id)a4
{
  id v5;
  id v6;
  ATXModeCalendarFeaturizer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ATXModeHeuristicClassifier *v15;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[14];

  v23[12] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v22 = (void *)objc_opt_new();
  v23[0] = v22;
  v21 = (void *)objc_opt_new();
  v23[1] = v21;
  v20 = (void *)objc_opt_new();
  v23[2] = v20;
  v19 = (void *)objc_opt_new();
  v23[3] = v19;
  v17 = (void *)objc_opt_new();
  v23[4] = v17;
  v7 = -[ATXModeCalendarFeaturizer initWithLocationManager:]([ATXModeCalendarFeaturizer alloc], "initWithLocationManager:", v5);

  v23[5] = v7;
  v8 = (void *)objc_opt_new();
  v23[6] = v8;
  v9 = (void *)objc_opt_new();
  v23[7] = v9;
  v10 = (void *)objc_opt_new();
  v23[8] = v10;
  v11 = (void *)objc_opt_new();
  v23[9] = v11;
  v12 = (void *)objc_opt_new();
  v23[10] = v12;
  v13 = (void *)objc_opt_new();
  v23[11] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ATXModeHeuristicClassifier initWithFeaturizers:minUpdateInterval:configuredModeService:](self, "initWithFeaturizers:minUpdateInterval:configuredModeService:", v14, v6, 15.0);

  return v15;
}

- (ATXModeHeuristicClassifier)initWithFeaturizers:(id)a3 minUpdateInterval:(double)a4 configuredModeService:(id)a5
{
  id v9;
  id v10;
  ATXModeHeuristicClassifier *v11;
  uint64_t v12;
  NSArray *featurizers;
  objc_class *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _PASQueueLock *lock;
  ATXModeScheduler *v27;
  OS_dispatch_queue *v28;
  uint64_t v29;
  ATXModeScheduler *scheduler;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  NSObject *v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v46.receiver = self;
  v46.super_class = (Class)ATXModeHeuristicClassifier;
  v11 = -[ATXModeHeuristicClassifier init](&v46, sel_init);
  if (v11)
  {
    if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("ATXModeHeuristicClassifier.m"), 113, CFSTR("ATXModeHeuristicClassifier must not be initialized when the device is Class C locked"));

    }
    v12 = objc_msgSend(v9, "copy");
    featurizers = v11->_featurizers;
    v11->_featurizers = (NSArray *)v12;

    v11->_minUpdateInterval = a4;
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v11->_modeService, a5);
    v20 = objc_opt_new();
    *(_DWORD *)(v20 + 32) = -1;
    v21 = objc_opt_new();
    v22 = *(void **)(v20 + 8);
    *(_QWORD *)(v20 + 8) = v21;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(v20 + 24);
    *(_QWORD *)(v20 + 24) = v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81600]), "initWithGuardedData:serialQueue:", v20, v11->_queue);
    lock = v11->_lock;
    v11->_lock = (_PASQueueLock *)v25;

    objc_initWeak(&location, v11);
    v27 = [ATXModeScheduler alloc];
    v28 = v11->_queue;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __90__ATXModeHeuristicClassifier_initWithFeaturizers_minUpdateInterval_configuredModeService___block_invoke;
    v43[3] = &unk_1E942DA58;
    objc_copyWeak(&v44, &location);
    v29 = -[ATXModeScheduler initWithQueue:operationBlock:andLeeway:](v27, "initWithQueue:operationBlock:andLeeway:", v28, v43, 5.0);
    scheduler = v11->_scheduler;
    v11->_scheduler = (ATXModeScheduler *)v29;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v31 = v11->_featurizers;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v40 != v33)
            objc_enumerationMutation(v31);
          v35 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v35, "setDelegate:", v11, (_QWORD)v39);
          objc_msgSend(v35, "beginListening");
        }
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v32);
    }

    -[ATXModeHeuristicClassifier _requestFeaturesFromAllFeaturizersAndUpdate](v11, "_requestFeaturesFromAllFeaturizersAndUpdate");
    __atxlog_handle_modes();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      -[ATXModeHeuristicClassifier initWithFeaturizers:minUpdateInterval:configuredModeService:].cold.1(v36);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __90__ATXModeHeuristicClassifier_initWithFeaturizers_minUpdateInterval_configuredModeService___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD v4[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[5];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __90__ATXModeHeuristicClassifier_initWithFeaturizers_minUpdateInterval_configuredModeService___block_invoke_2;
    v4[3] = &unk_1E942ED68;
    v5 = WeakRetained;
    objc_msgSend(v3, "runAsyncWithLockAcquired:", v4);

  }
}

uint64_t __90__ATXModeHeuristicClassifier_initWithFeaturizers_minUpdateInterval_configuredModeService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIfNeededWithGuardedData:", a2);
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_featurizers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "stopListening");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ATXModeHeuristicClassifier;
  -[ATXModeHeuristicClassifier dealloc](&v8, sel_dealloc);
}

- (void)_requestFeaturesFromAllFeaturizersAndUpdate
{
  _PASQueueLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__ATXModeHeuristicClassifier__requestFeaturesFromAllFeaturizersAndUpdate__block_invoke;
  v3[3] = &unk_1E942ED68;
  v3[4] = self;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v3);
}

void __73__ATXModeHeuristicClassifier__requestFeaturesFromAllFeaturizersAndUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_new();
  v5 = (void *)*((_QWORD *)v3 + 1);
  *((_QWORD *)v3 + 1) = v4;

  objc_msgSend(*((id *)v3 + 3), "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "provideFeatures", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(*((id *)v3 + 3), "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "_updateIfNeededWithGuardedData:", v3);
  v12 = (void *)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = 0;

}

- (void)_updateIfNeededWithGuardedData:(id)a3
{
  id *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (id *)a3;
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5[3], "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v7;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "ATXModeHeuristicClassifier update with %d feature sets in buffer", buf, 8u);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5[3];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v5[1], "mergeWithFeatures:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12++), (_QWORD)v22);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXModeHeuristicClassifier _predictModeWithFeature:](self, "_predictModeWithFeature:", v5[1]);
  __atxlog_handle_modes();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    v17 = v16;
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    BMUserFocusInferredModeTypeAsString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v27 = v16;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_1D2C00000, v15, OS_LOG_TYPE_DEFAULT, "[%@][%@] Predicted mode: %@", buf, 0x20u);

  }
  if (v14 != *((_DWORD *)v5 + 8))
  {
    *((_DWORD *)v5 + 8) = v14;
    -[ATXModeHeuristicClassifier _updateWithGuardedData:](self, "_updateWithGuardedData:", v5);
  }
  v20 = v5[2];
  v5[2] = v13;
  v21 = v13;

  objc_msgSend(v5[3], "removeAllObjects");
  -[ATXModeScheduler cancelPendingOperation](self->_scheduler, "cancelPendingOperation");

}

- (id)_serializedTriggersForMode:(int)a3 fromAggregateFeatures:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[ATXModeHeuristicClassifier _triggersForMode:fromAggregateFeatures:](self, "_triggersForMode:fromAggregateFeatures:", *(_QWORD *)&a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    ATXSerializeTriggers(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_triggersForMode:(int)a3 fromAggregateFeatures:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  ATXLocationEnteredTrigger *v10;
  void *v11;
  ATXLocationEnteredTrigger **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  ATXLocationEnteredTrigger *v20;
  ATXLocationEnteredTrigger *v21;
  ATXLocationEnteredTrigger *v22;
  ATXLocationEnteredTrigger *v23;
  ATXLocationEnteredTrigger *v24;
  ATXLocationEnteredTrigger *v25;
  ATXLocationEnteredTrigger *v26;
  ATXLocationEnteredTrigger *v27;
  ATXLocationEnteredTrigger *v28;
  ATXLocationEnteredTrigger *v29;
  ATXLocationEnteredTrigger *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  v8 = a3 - 1;
  v9 = 0;
  switch(v8)
  {
    case 0:
    case 1:
    case 9:
    case 10:
    case 11:
    case 13:
    case 16:
      goto LABEL_24;
    case 2:
      v10 = -[ATXLocationEnteredTrigger initWithLocationIdentifier:namedLOI:]([ATXLocationEnteredTrigger alloc], "initWithLocationIdentifier:namedLOI:", 0, 2);
      v24 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v24;
      goto LABEL_22;
    case 3:
      if (objc_msgSend(v6, "BOOLValueForFeatureType:", 2))
      {
        v10 = -[ATXLocationEnteredTrigger initWithLocationIdentifier:namedLOI:]([ATXLocationEnteredTrigger alloc], "initWithLocationIdentifier:namedLOI:", 0, 1);
        v23 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v23;
      }
      else
      {
        if ((objc_msgSend(v7, "BOOLValueForFeatureType:", 26) & 1) == 0
          && !-[ATXModeHeuristicClassifier _isUserWorkingFromHomeWithAggregateFeatures:](self, "_isUserWorkingFromHomeWithAggregateFeatures:", v7))
        {
LABEL_20:
          v9 = 0;
          goto LABEL_24;
        }
        v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
        v22 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v22;
      }
LABEL_22:
      objc_msgSend(v11, "arrayWithObjects:count:", v12, 1, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_24:
      return v9;
    case 4:
      v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      v29 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v29;
      goto LABEL_22;
    case 5:
      if (!objc_msgSend(v6, "BOOLValueForFeatureType:", 4))
        goto LABEL_20;
      v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      v30 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v30;
      goto LABEL_22;
    case 6:
      v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      v25 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v25;
      goto LABEL_22;
    case 7:
      if (objc_msgSend(v6, "BOOLValueForFeatureType:", 19))
      {
        v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
        v28 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v28;
      }
      else
      {
        v10 = -[ATXAppCategoryTrigger initWithiTunesCategoryId:]([ATXAppCategoryTrigger alloc], "initWithiTunesCategoryId:", 6014);
        v27 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v27;
      }
      goto LABEL_22;
    case 8:
      v10 = -[ATXAppCategoryTrigger initWithiTunesCategoryId:]([ATXAppCategoryTrigger alloc], "initWithiTunesCategoryId:", 6018);
      v26 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v26;
      goto LABEL_22;
    case 12:
    case 15:
      v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      v21 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v21;
      goto LABEL_22;
    case 14:
      v10 = (ATXLocationEnteredTrigger *)objc_opt_new();
      v20 = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = &v20;
      goto LABEL_22;
    default:
      __atxlog_handle_modes();
      v10 = (ATXLocationEnteredTrigger *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_FAULT))
        -[ATXModeHeuristicClassifier _triggersForMode:fromAggregateFeatures:].cold.1(0, &v10->super, v13, v14, v15, v16, v17, v18);
      v9 = 0;
      goto LABEL_23;
  }
}

- (BOOL)_isUserWorkingFromHomeWithAggregateFeatures:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "BOOLValueForFeatureType:", 1)
    && objc_msgSend(v3, "BOOLValueForFeatureType:", 14))
  {
    v4 = objc_msgSend(v3, "BOOLValueForFeatureType:", 25);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateWithGuardedData:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  double v14;
  unsigned int v15;

  v15 = 0;
  v14 = 0.0;
  v13 = 0;
  v11 = 0;
  v12 = 0;
  v9 = 0;
  v10 = 0;
  -[ATXModeHeuristicClassifier _currentModeUUID:userModeName:modeType:confidenceScore:origin:originBundleId:serializedTrigger:allowsSmartEntry:guardedData:](self, "_currentModeUUID:userModeName:modeType:confidenceScore:origin:originBundleId:serializedTrigger:allowsSmartEntry:guardedData:", &v12, &v11, &v15, &v14, &v13, &v10, &v9, 0, a3);
  v4 = v12;
  v5 = v11;
  v6 = v10;
  v7 = v9;
  -[ATXModeHeuristicClassifier delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientModel:didUpdatePredictionWithUUID:userModeName:modeType:confidenceScore:modeOrigin:originBundleId:originAnchorType:serializedTriggers:", self, v4, v5, v15, v13, v6, v14, 0, v7);

}

- (void)currentModeUUID:(id *)a3 userModeName:(id *)a4 modeType:(int *)a5 confidenceScore:(double *)a6 origin:(int *)a7 originBundleId:(id *)a8 serializedTrigger:(id *)a9 allowsSmartEntry:(BOOL *)a10
{
  _PASQueueLock *lock;
  _QWORD v14[13];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__15;
  v37 = __Block_byref_object_dispose__15;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__15;
  v31 = __Block_byref_object_dispose__15;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__15;
  v19 = __Block_byref_object_dispose__15;
  v20 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __141__ATXModeHeuristicClassifier_currentModeUUID_userModeName_modeType_confidenceScore_origin_originBundleId_serializedTrigger_allowsSmartEntry___block_invoke;
  v14[3] = &unk_1E942ED90;
  v14[4] = self;
  v14[5] = &v33;
  v14[10] = a6;
  v14[11] = a7;
  v14[6] = &v21;
  v14[7] = &v27;
  v14[8] = &v15;
  v14[9] = a5;
  v14[12] = a10;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
  if (a3)
    *a3 = objc_retainAutorelease((id)v34[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  if (a8)
    *a8 = objc_retainAutorelease((id)v28[5]);
  if (a9)
    *a9 = objc_retainAutorelease((id)v16[5]);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
}

void __141__ATXModeHeuristicClassifier_currentModeUUID_userModeName_modeType_confidenceScore_origin_originBundleId_serializedTrigger_allowsSmartEntry___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id obj;
  id v14;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[5] + 8);
  v14 = *(id *)(v3 + 40);
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  v6 = a1[10];
  v7 = a1[11];
  v8 = *(_QWORD *)(a1[7] + 8);
  v12 = *(id *)(v8 + 40);
  obj = v5;
  v9 = a1[9];
  v10 = *(_QWORD *)(a1[8] + 8);
  v11 = *(id *)(v10 + 40);
  objc_msgSend(v2, "_currentModeUUID:userModeName:modeType:confidenceScore:origin:originBundleId:serializedTrigger:allowsSmartEntry:guardedData:", &v14, &obj, v9, v6, v7, &v12, &v11, a1[12], a2);
  objc_storeStrong((id *)(v3 + 40), v14);
  objc_storeStrong((id *)(v4 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v12);
  objc_storeStrong((id *)(v10 + 40), v11);
}

- (void)_currentModeUUID:(id *)a3 userModeName:(id *)a4 modeType:(int *)a5 confidenceScore:(double *)a6 origin:(int *)a7 originBundleId:(id *)a8 serializedTrigger:(id *)a9 allowsSmartEntry:(BOOL *)a10 guardedData:(id)a11
{
  unsigned int *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  ATXConfiguredModeService *modeService;
  _BOOL4 v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  id v30;
  int *v31;
  id *v32;
  id v34;
  id v35;
  BOOL v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v17 = (unsigned int *)a11;
  v18 = v17[8];
  v36 = 0;
  if ((_DWORD)v18 != 2)
  {
    v31 = a7;
    v32 = a8;
    v21 = BMUserFocusInferredModeTypeToActivity(v18);
    modeService = self->_modeService;
    v34 = 0;
    v35 = 0;
    v23 = -[ATXConfiguredModeService isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:](modeService, "isActivityTypeConfigured:uuid:allowsSmartEntry:userModeName:", v21, &v35, &v36, &v34);
    v20 = v35;
    v30 = v34;
    __atxlog_handle_modes();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (!v25)
        goto LABEL_10;
      *(_DWORD *)buf = 134218242;
      v38 = v21;
      v39 = 2114;
      v40 = v20;
      v26 = "Found configured activity for type: %ld uuid: %{public}@";
      v27 = v24;
      v28 = 22;
    }
    else
    {
      if (!v25)
        goto LABEL_10;
      *(_DWORD *)buf = 134217984;
      v38 = v21;
      v26 = "No configured activity for type: %ld, making generic suggestion";
      v27 = v24;
      v28 = 12;
    }
    _os_log_impl(&dword_1D2C00000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
LABEL_10:

    a7 = v31;
    a8 = v32;
    v19 = v30;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  v19 = 0;
  v20 = 0;
  if (a3)
LABEL_11:
    *a3 = objc_retainAutorelease(v20);
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(v19);
  if (a5)
    *a5 = v18;
  if (a6)
  {
    -[ATXModeHeuristicClassifier _confidenceScoreForMode:fromAggregateFeatures:](self, "_confidenceScoreForMode:fromAggregateFeatures:", v18, *((_QWORD *)v17 + 1));
    *(_QWORD *)a6 = v29;
  }
  if (a7)
    *a7 = -[ATXModeHeuristicClassifier _originForMode:fromAggregateFeatures:](self, "_originForMode:fromAggregateFeatures:", v18, *((_QWORD *)v17 + 1));
  if (a8)
  {
    objc_msgSend(*((id *)v17 + 1), "stringForFeatureType:", 16);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a9)
  {
    -[ATXModeHeuristicClassifier _serializedTriggersForMode:fromAggregateFeatures:](self, "_serializedTriggersForMode:fromAggregateFeatures:", v18, *((_QWORD *)v17 + 1));
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a10)
    *a10 = v36;

}

- (int)_originForMode:(int)a3 fromAggregateFeatures:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a4;
  v7 = v6;
  v8 = a3 - 1;
  v9 = 0;
  switch(v8)
  {
    case 0:
    case 9:
    case 10:
    case 11:
    case 13:
    case 16:
      goto LABEL_32;
    case 1:
      v9 = 1;
      goto LABEL_32;
    case 2:
      v17 = objc_msgSend(v6, "BOOLValueForFeatureType:", 1) == 0;
      v18 = 5;
      goto LABEL_29;
    case 3:
      if ((objc_msgSend(v6, "BOOLValueForFeatureType:", 2) & 1) != 0
        || (objc_msgSend(v7, "BOOLValueForFeatureType:", 23) & 1) != 0)
      {
        goto LABEL_26;
      }
      if ((objc_msgSend(v7, "BOOLValueForFeatureType:", 26) & 1) != 0
        || (objc_msgSend(v7, "BOOLValueForFeatureType:", 27) & 1) != 0)
      {
        v9 = 10;
        goto LABEL_32;
      }
      v17 = !-[ATXModeHeuristicClassifier _isUserWorkingFromHomeWithAggregateFeatures:](self, "_isUserWorkingFromHomeWithAggregateFeatures:", v7);
      v18 = 9;
      goto LABEL_29;
    case 4:
      if ((objc_msgSend(v6, "BOOLValueForFeatureType:", 3) & 1) != 0)
      {
        v9 = 8;
        goto LABEL_32;
      }
      if ((objc_msgSend(v7, "BOOLValueForFeatureType:", 22) & 1) != 0)
      {
LABEL_26:
        v9 = 5;
        goto LABEL_32;
      }
      v17 = objc_msgSend(v7, "BOOLValueForFeatureType:", 24) == 0;
      v18 = 16;
      goto LABEL_29;
    case 5:
      if (objc_msgSend(v6, "BOOLValueForFeatureType:", 4))
        v9 = 4;
      else
        v9 = 0;
      goto LABEL_32;
    case 6:
      v17 = objc_msgSend(v6, "BOOLValueForFeatureType:", 7) == 0;
      v18 = 6;
      goto LABEL_29;
    case 7:
      if ((objc_msgSend(v6, "BOOLValueForFeatureType:", 19) & 1) != 0)
      {
        v9 = 15;
      }
      else
      {
        v6 = v7;
        v19 = 8;
LABEL_28:
        v17 = objc_msgSend(v6, "BOOLValueForFeatureType:", v19) == 0;
        v18 = 7;
LABEL_29:
        if (v17)
          v9 = 0;
        else
          v9 = v18;
      }
LABEL_32:

      return v9;
    case 8:
      v19 = 15;
      goto LABEL_28;
    case 12:
      v20 = 17;
      goto LABEL_24;
    case 14:
      v17 = objc_msgSend(v6, "BOOLValueForFeatureType:", 18) == 0;
      v18 = 14;
      goto LABEL_29;
    case 15:
      v20 = 20;
LABEL_24:
      v17 = objc_msgSend(v6, "BOOLValueForFeatureType:", v20) == 0;
      v18 = 13;
      goto LABEL_29;
    default:
      __atxlog_handle_modes();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[ATXModeHeuristicClassifier _triggersForMode:fromAggregateFeatures:].cold.1(0, v10, v11, v12, v13, v14, v15, v16);

      v9 = 0;
      goto LABEL_32;
  }
}

- (double)_confidenceScoreForMode:(int)a3 fromAggregateFeatures:(id)a4
{
  return 0.8;
}

- (int)_predictModeWithFeature:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeHeuristicClassifier predict mode with features: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = 8;
  if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 8) & 1) == 0
    && (objc_msgSend(v4, "BOOLValueForFeatureType:", 19) & 1) == 0)
  {
    if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 15) & 1) != 0)
    {
      v6 = 9;
    }
    else if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 3) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 4) & 1) != 0)
    {
      v6 = 6;
    }
    else if (objc_msgSend(v4, "BOOLValueForFeatureType:", 17))
    {
      if (objc_msgSend(v4, "BOOLValueForFeatureType:", 20))
        v6 = 16;
      else
        v6 = 13;
    }
    else if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 18) & 1) != 0)
    {
      v6 = 15;
    }
    else if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 2) & 1) != 0
           || (objc_msgSend(v4, "BOOLValueForFeatureType:", 23) & 1) != 0
           || (objc_msgSend(v4, "BOOLValueForFeatureType:", 26) & 1) != 0
           || (objc_msgSend(v4, "BOOLValueForFeatureType:", 27) & 1) != 0
           || (objc_msgSend(v4, "BOOLValueForFeatureType:", 28) & 1) != 0
           || -[ATXModeHeuristicClassifier _isUserWorkingFromHomeWithAggregateFeatures:](self, "_isUserWorkingFromHomeWithAggregateFeatures:", v4))
    {
      v6 = 4;
    }
    else
    {
      v6 = 7;
      if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 7) & 1) == 0)
      {
        if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 1) & 1) != 0)
        {
          v6 = 3;
        }
        else
        {
          v6 = 5;
          if ((objc_msgSend(v4, "BOOLValueForFeatureType:", 22) & 1) == 0)
          {
            if (objc_msgSend(v4, "BOOLValueForFeatureType:", 24))
              v6 = 5;
            else
              v6 = 2;
          }
        }
      }
    }
  }

  return v6;
}

- (int)currentMode
{
  _PASQueueLock *lock;
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__ATXModeHeuristicClassifier_currentMode__block_invoke;
  v5[3] = &unk_1E942EDB8;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__ATXModeHeuristicClassifier_currentMode__block_invoke(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(a2 + 32);
  return result;
}

- (id)currentFeaturesInDictionary
{
  _PASQueueLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__15;
  v10 = __Block_byref_object_dispose__15;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__ATXModeHeuristicClassifier_currentFeaturesInDictionary__block_invoke;
  v5[3] = &unk_1E942EDB8;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__ATXModeHeuristicClassifier_currentFeaturesInDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 8), "dictionaryRepresentation");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)updateWithFeatureSet:(id)a3
{
  -[ATXModeHeuristicClassifier updateWithFeatureSet:immediately:reply:](self, "updateWithFeatureSet:immediately:reply:", a3, 0, 0);
}

- (void)updateWithFeatureSet:(id)a3 immediately:(BOOL)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _PASQueueLock *lock;
  _QWORD v12[4];
  id v13;
  ATXModeHeuristicClassifier *v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    lock = self->_lock;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__ATXModeHeuristicClassifier_updateWithFeatureSet_immediately_reply___block_invoke;
    v12[3] = &unk_1E942EDE0;
    v16 = a4;
    v13 = v8;
    v14 = self;
    v15 = v10;
    -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v12);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __69__ATXModeHeuristicClassifier_updateWithFeatureSet_immediately_reply___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  id *v10;

  v10 = a2;
  objc_msgSend(v10[3], "addObject:", *(_QWORD *)(a1 + 32));
  v3 = v10;
  if (*(_BYTE *)(a1 + 56) || !v10[2] || (v7 = objc_msgSend(v10[3], "count"), v3 = v10, v7 >= 0x64))
  {
    v4 = *(id **)(a1 + 40);
LABEL_3:
    objc_msgSend(v4, "_updateIfNeededWithGuardedData:", v3);
    v5 = 0;
    goto LABEL_4;
  }
  v8 = *(double *)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(v10[2], "timeIntervalSinceNow");
  v4 = *(id **)(a1 + 40);
  if (v8 + v9 <= 0.0)
  {
    v3 = v10;
    goto LABEL_3;
  }
  objc_msgSend(v4[4], "runAfterDelaySecondsIfNotYetScheduled:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);

}

- (void)reset
{
  _PASQueueLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__ATXModeHeuristicClassifier_reset__block_invoke;
  v3[3] = &unk_1E942ED68;
  v3[4] = self;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v3);
}

void __35__ATXModeHeuristicClassifier_reset__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = objc_opt_new();
  v5 = (void *)*((_QWORD *)v3 + 1);
  *((_QWORD *)v3 + 1) = v4;

  objc_msgSend(*((id *)v3 + 3), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_updateIfNeededWithGuardedData:", v3);
  v6 = (id)*((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 2) = 0;

}

- (void)featurizer:(id)a3 didUpdateFeatures:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_modes();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_1D2C00000, v8, OS_LOG_TYPE_DEFAULT, "ATXModeHeuristicClassifier: %@ updated its features", (uint8_t *)&v11, 0xCu);

  }
  -[ATXModeHeuristicClassifier updateWithFeatureSet:](self, "updateWithFeatureSet:", v7);

}

- (ATXModeClassifierClientModelDelegate)delegate
{
  return (ATXModeClassifierClientModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modeService, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_featurizers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithFeaturizers:(os_log_t)log minUpdateInterval:configuredModeService:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D2C00000, log, OS_LOG_TYPE_DEBUG, "ATXModeHeuristicClassifier finished initialization", v1, 2u);
}

- (void)_triggersForMode:(uint64_t)a3 fromAggregateFeatures:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, a2, a3, "BMUserFocusInferredMode: %lu not handled in switch statement", a5, a6, a7, a8, 0);
}

@end
