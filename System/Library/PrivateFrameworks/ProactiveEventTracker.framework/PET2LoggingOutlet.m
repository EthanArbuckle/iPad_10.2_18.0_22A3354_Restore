@implementation PET2LoggingOutlet

- (void)logUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *loggingQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  PET2LoggingOutlet *v26;
  unint64_t v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  loggingQueue = self->_loggingQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__PET2LoggingOutlet_logUnsignedIntegerValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke;
  v21[3] = &unk_1E2A41010;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = self;
  v27 = a3;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(loggingQueue, v21);

}

void __95__PET2LoggingOutlet_logUnsignedIntegerValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke(uint64_t a1)
{
  id v2;

  +[PETLoggingUtils keyStringForEvent:featureId:stringifiedProperties:metaData:](PETLoggingUtils, "keyStringForEvent:featureId:stringifiedProperties:metaData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "_dispatchBatchForKey:value:isUpdate:", v2, *(_QWORD *)(a1 + 72), 0);

}

- (void)_dispatchBatchForKey:(id)a3 value:(unint64_t)a4 isUpdate:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSMutableDictionary **p_updateKeys;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  OS_os_transaction *v17;
  OS_os_transaction *batchTxn;
  dispatch_time_t v19;
  NSObject *loggingQueue;
  _QWORD block[5];

  v5 = a5;
  v8 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    p_updateKeys = &self->_updateKeys;
  }
  else
  {
    p_updateKeys = &self->_addKeys;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_addKeys, "objectForKeyedSubscript:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = &unk_1E2A49B10;
    if (v11)
      v13 = (void *)v11;
    v14 = v13;

    v15 = (void *)MEMORY[0x1E0CB37E8];
    v16 = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v15, "numberWithUnsignedInteger:", v16 + a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](*p_updateKeys, "setObject:forKeyedSubscript:", v9, v8);

  if (!self->_batchTxn)
  {
    v17 = (OS_os_transaction *)os_transaction_create();
    batchTxn = self->_batchTxn;
    self->_batchTxn = v17;

    v19 = dispatch_time(0, 1000000000);
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PET2LoggingOutlet__dispatchBatchForKey_value_isUpdate___block_invoke;
    block[3] = &unk_1E2A413D8;
    block[4] = self;
    dispatch_after(v19, loggingQueue, block);
  }

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_instance;
}

void __57__PET2LoggingOutlet__dispatchBatchForKey_value_isUpdate___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v41;
    v7 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v4 = 138412546;
    v34 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "setKey:", v9);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntegerValue");

        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v34;
          v46 = v9;
          v47 = 1024;
          v48 = v12;
          _os_log_debug_impl(&dword_18FAB0000, v7, OS_LOG_TYPE_DEBUG, "Batch adding key: %@, value: %d", buf, 0x12u);
        }
        +[PETEventTracker2 sharedInstance](PETEventTracker2, "sharedInstance", v34);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "trackScalarForMessage:count:", v10, v12);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v5);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v37;
    v19 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v16 = 138412546;
    v35 = v16;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v14);
        v21 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v20);
        v22 = (void *)objc_opt_new();
        objc_msgSend(v22, "setKey:", v21);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "unsignedIntegerValue");

        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v35;
          v46 = v21;
          v47 = 1024;
          v48 = v24;
          _os_log_debug_impl(&dword_18FAB0000, v19, OS_LOG_TYPE_DEBUG, "Batch updating key: %@, value: %d", buf, 0x12u);
        }
        +[PETEventTracker2 sharedInstance](PETEventTracker2, "sharedInstance", v35, (_QWORD)v36);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "trackScalarForMessage:updateCount:", v22, v24);

        ++v20;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v17);
  }

  v26 = objc_opt_new();
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 24);
  *(_QWORD *)(v27 + 24) = v26;

  v29 = objc_opt_new();
  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 32);
  *(_QWORD *)(v30 + 32) = v29;

  v32 = *(_QWORD *)(a1 + 32);
  v33 = *(void **)(v32 + 40);
  *(_QWORD *)(v32 + 40) = 0;

}

- (PET2LoggingOutlet)init
{
  PET2LoggingOutlet *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *loggingQueue;
  uint64_t v7;
  NSMutableDictionary *addKeys;
  uint64_t v9;
  NSMutableDictionary *updateKeys;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PET2LoggingOutlet;
  v2 = -[PET2LoggingOutlet init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("PET2LoggingOutlet", v4);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    addKeys = v2->_addKeys;
    v2->_addKeys = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    updateKeys = v2->_updateKeys;
    v2->_updateKeys = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (void)setUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *loggingQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  PET2LoggingOutlet *v26;
  unint64_t v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  loggingQueue = self->_loggingQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__PET2LoggingOutlet_setUnsignedIntegerValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke;
  v21[3] = &unk_1E2A41010;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = self;
  v27 = a3;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(loggingQueue, v21);

}

- (id)_findBucketsForKey:(id)a3
{
  id v4;
  NSDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_pet1HistogramBuckets;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v4, "hasPrefix:", v10, (_QWORD)v13) & 1) != 0)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_pet1HistogramBuckets, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)logDoubleValue:(double)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *loggingQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  double v26;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  loggingQueue = self->_loggingQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __86__PET2LoggingOutlet_logDoubleValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke;
  v21[3] = &unk_1E2A41010;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  v26 = a3;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(loggingQueue, v21);

}

- (void)logErrorForEvent:(id)a3 featureId:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *loggingQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  PET2LoggingOutlet *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  loggingQueue = self->_loggingQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__PET2LoggingOutlet_logErrorForEvent_featureId_reason___block_invoke;
  v15[3] = &unk_1E2A414A0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(loggingQueue, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchTxn, 0);
  objc_storeStrong((id *)&self->_updateKeys, 0);
  objc_storeStrong((id *)&self->_addKeys, 0);
  objc_storeStrong((id *)&self->_pet1HistogramBuckets, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
}

void __55__PET2LoggingOutlet_logErrorForEvent_featureId_reason___block_invoke(uint64_t a1)
{
  PETStringPairs *v2;
  void *v3;
  PETStringPairs *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = [PETStringPairs alloc];
  v6 = *(_OWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PETStringPairs initWithKeys:values:](v2, "initWithKeys:values:", &unk_1E2A49CE8, v3);

  +[PETLoggingUtils keyStringForEvent:featureId:stringifiedProperties:metaData:](PETLoggingUtils, "keyStringForEvent:featureId:stringifiedProperties:metaData:", CFSTR("error"), CFSTR("framework"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_dispatchBatchForKey:value:isUpdate:", v5, 1, 0);

}

void __86__PET2LoggingOutlet_logDoubleValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[16];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathForResource:ofType:", CFSTR("pet1_histogram_buckets"), CFSTR("plist"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 16);
      *(_QWORD *)(v5 + 16) = v4;

    }
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to load histogram buckets for PET1 keys", buf, 2u);
      }
      v7 = objc_opt_new();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 16);
      *(_QWORD *)(v8 + 16) = v7;

    }
  }
  +[PETLoggingUtils keyStringForEvent:featureId:stringifiedProperties:metaData:](PETLoggingUtils, "keyStringForEvent:featureId:stringifiedProperties:metaData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_findBucketsForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = *(double *)(a1 + 72);
    objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, objc_msgSend(v14, "count"), 1280, &__block_literal_global_101);

    if (v16 >= objc_msgSend(v14, "count"))
    {
      v19 = 0x7FF0000000000000;
    }
    else
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.[%f,%f]"), v10, v19, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_dispatchBatchForKey:value:isUpdate:", v20, 1, 0);
    v10 = (void *)v20;
  }

}

void __95__PET2LoggingOutlet_setUnsignedIntegerValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke(uint64_t a1)
{
  id v2;

  +[PETLoggingUtils keyStringForEvent:featureId:stringifiedProperties:metaData:](PETLoggingUtils, "keyStringForEvent:featureId:stringifiedProperties:metaData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "_dispatchBatchForKey:value:isUpdate:", v2, *(_QWORD *)(a1 + 72), 1);

}

void __35__PET2LoggingOutlet_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x19400723C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = v1;

  objc_autoreleasePoolPop(v0);
}

@end
