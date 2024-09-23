@implementation PPLocalNamedEntityStore

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  id v11;
  char v12;
  PPLocalTopicStore *topicStoreForNamedEntityMapping;
  id v14;
  const char *v15;
  unint64_t v17;
  char v18;

  v10 = a3;
  v11 = a4;
  v18 = 0;
  v17 = 0;
  v12 = 0;
  if (-[PPNamedEntityStorage deleteAllNamedEntitiesFromSourcesWithBundleId:groupIds:atLeastOneNamedEntityRemoved:deletedCount:error:](self->_storage, "deleteAllNamedEntitiesFromSourcesWithBundleId:groupIds:atLeastOneNamedEntityRemoved:deletedCount:error:", v10, v11, &v18, &v17, a6))
  {
    topicStoreForNamedEntityMapping = self->_topicStoreForNamedEntityMapping;
    if (topicStoreForNamedEntityMapping)
      v12 = -[PPLocalTopicStore deleteAllTopicsFromSourcesWithBundleId:groupIds:algorithm:deletedCount:error:](topicStoreForNamedEntityMapping, "deleteAllTopicsFromSourcesWithBundleId:groupIds:algorithm:deletedCount:error:", v10, v11, 4, 0, a6);
    else
      v12 = 1;
  }
  if (v18)
  {
    -[PPLocalNamedEntityStore invalidationNotificationOverride](self, "invalidationNotificationOverride");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    if (!v15)
      v15 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    PPPostNotification(v15);

  }
  if (a5)
    *a5 = v17;

  return v12;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v8;
  char v9;
  PPLocalTopicStore *topicStoreForNamedEntityMapping;
  id v11;
  const char *v12;
  unint64_t v14;
  char v15;

  v8 = a3;
  v15 = 0;
  v14 = 0;
  v9 = 0;
  if (-[PPNamedEntityStorage deleteAllNamedEntitiesFromSourcesWithBundleId:atLeastOneNamedEntityRemoved:deletedCount:error:](self->_storage, "deleteAllNamedEntitiesFromSourcesWithBundleId:atLeastOneNamedEntityRemoved:deletedCount:error:", v8, &v15, &v14, a5))
  {
    topicStoreForNamedEntityMapping = self->_topicStoreForNamedEntityMapping;
    if (topicStoreForNamedEntityMapping)
      v9 = -[PPLocalTopicStore deleteAllTopicsFromSourcesWithBundleId:algorithm:deletedCount:error:](topicStoreForNamedEntityMapping, "deleteAllTopicsFromSourcesWithBundleId:algorithm:deletedCount:error:", v8, 4, 0, a5);
    else
      v9 = 1;
  }
  if (v15)
  {
    -[PPLocalNamedEntityStore invalidationNotificationOverride](self, "invalidationNotificationOverride");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    if (!v12)
      v12 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    PPPostNotification(v12);

  }
  if (a4)
    *a4 = v14;

  return v9;
}

+ (id)defaultStore
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD aBlock[4];
  id v22;
  id location;

  pthread_mutex_lock(&defaultStore_lock_5521);
  if (!defaultStore_instance_5522)
  {
    v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance_5522;
    defaultStore_instance_5522 = v2;

    v4 = (void *)defaultStore_instance_5522;
    if (defaultStore_instance_5522)
    {
      v5 = *(void **)(defaultStore_instance_5522 + 8);
      v6 = MEMORY[0x1E0C809B0];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke;
      v18 = &unk_1E7E176B8;
      v19 = defaultStore_instance_5522;
      objc_msgSend(v5, "runWithLockAcquired:", &v15);
      location = 0;
      objc_initWeak(&location, v4);
      aBlock[0] = v6;
      aBlock[1] = 3221225472;
      aBlock[2] = __56__PPLocalNamedEntityStore__registerMapsQueryPrefetching__block_invoke;
      aBlock[3] = &unk_1E7E1FCC0;
      objc_copyWeak(&v22, &location);
      v7 = _Block_copy(aBlock);
      +[PPAppLaunchMonitor sharedInstance](PPAppLaunchMonitor, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *MEMORY[0x1E0D70E20];
      v15 = v6;
      v16 = 3221225472;
      v17 = __56__PPLocalNamedEntityStore__registerMapsQueryPrefetching__block_invoke_298;
      v18 = &unk_1E7E176E0;
      v19 = (uint64_t)v4;
      v10 = v7;
      v20 = v10;
      v11 = (id)objc_msgSend(v8, "registerForAppLaunchWithBundleId:queue:handler:", v9, 0, &v15);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    else
    {
      pp_entities_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore defaultStore did not initialize, will try again later. Device may be Class C locked.", (uint8_t *)&v15, 2u);
      }

    }
  }
  v13 = (id)defaultStore_instance_5522;
  pthread_mutex_unlock(&defaultStore_lock_5521);
  return v13;
}

- (PPLocalNamedEntityStore)initWithStorage:(id)a3 topicStoreForNamedEntityMapping:(id)a4 lazyContactStoreForMapsFeedback:(id)a5 trialWrapper:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  PPLocalNamedEntityStore *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _PASLock *lock;
  PPTrialWrapper *trialWrapper;
  id v25;
  uint64_t v26;
  NSCache *modelCache;
  uint64_t v28;
  OS_dispatch_queue *mapsPrefetchQueue;
  id v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[4];
  id v38;
  objc_super v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalNamedEntityStore.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storage"));

  }
  v39.receiver = self;
  v39.super_class = (Class)PPLocalNamedEntityStore;
  v16 = -[PPNamedEntityStore _initFromSubclass](&v39, sel__initFromSubclass);
  if (v16)
  {
    v31 = v14;
    v32 = v13;
    v17 = objc_opt_new();
    v18 = objc_alloc(MEMORY[0x1E0D815E8]);
    v19 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __120__PPLocalNamedEntityStore_initWithStorage_topicStoreForNamedEntityMapping_lazyContactStoreForMapsFeedback_trialWrapper___block_invoke;
    v37[3] = &unk_1E7E17368;
    v38 = v15;
    v20 = objc_msgSend(v18, "initWithBlock:", v37);
    v21 = *(void **)(v17 + 16);
    *(_QWORD *)(v17 + 16) = v20;

    *(_BYTE *)(v17 + 8) = 0;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v17);

    lock = v16->_lock;
    v16->_lock = (_PASLock *)v22;

    objc_storeStrong((id *)&v16->_storage, a3);
    objc_storeStrong((id *)&v16->_topicStoreForNamedEntityMapping, a4);
    objc_storeStrong((id *)&v16->_lazyContactStoreForMapsFeedback, a5);
    objc_storeStrong((id *)&v16->_trialWrapper, a6);
    location = 0;
    objc_initWeak(&location, v16);
    trialWrapper = v16->_trialWrapper;
    v34[0] = v19;
    v34[1] = 3221225472;
    v34[2] = __120__PPLocalNamedEntityStore_initWithStorage_topicStoreForNamedEntityMapping_lazyContactStoreForMapsFeedback_trialWrapper___block_invoke_177;
    v34[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v35, &location);
    v25 = -[PPTrialWrapper addUpdateHandlerForNamespaceName:block:](trialWrapper, "addUpdateHandlerForNamespaceName:block:", CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"), v34);
    v26 = objc_opt_new();
    modelCache = v16->_modelCache;
    v16->_modelCache = (NSCache *)v26;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.PersonalizationPortrait.mapsPrefetchQueue", 17);
    v28 = objc_claimAutoreleasedReturnValue();
    mapsPrefetchQueue = v16->_mapsPrefetchQueue;
    v16->_mapsPrefetchQueue = (OS_dispatch_queue *)v28;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
    v14 = v31;
    v13 = v32;
  }

  return v16;
}

- (PPLocalNamedEntityStore)init
{
  void *v3;
  PPNamedEntityStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  PPLocalNamedEntityStore *v8;

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PPNamedEntityStorage initWithDatabase:]([PPNamedEntityStorage alloc], "initWithDatabase:", v3);
    if (v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815E8]), "initWithBlock:", &__block_literal_global_5502);
      +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[PPLocalNamedEntityStore initWithStorage:topicStoreForNamedEntityMapping:lazyContactStoreForMapsFeedback:trialWrapper:](self, "initWithStorage:topicStoreForNamedEntityMapping:lazyContactStoreForMapsFeedback:trialWrapper:", v4, v6, v5, v7);

      v8 = self;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  uint64_t v30;
  id *v31;
  void *v32;
  PPNamedEntityStorage *storage;
  id v34;
  void (**v35)(_QWORD);
  void *v36;
  NSObject *v37;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _BYTE *v47;
  _QWORD *v48;
  BOOL v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD aBlock[4];
  id v61;
  id v62;
  _QWORD *v63;
  _BYTE *v64;
  _QWORD *v65;
  _QWORD v66[3];
  char v67;
  _QWORD v68[4];
  uint8_t v69[4];
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a5;
  pp_entities_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "limit", v41);
    objc_msgSend(v8, "fromDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v74 = v14;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "iterNamedEntityRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  if (!objc_msgSend(v8, "limit"))
  {
    LOBYTE(v27) = 1;
    goto LABEL_21;
  }
  v15 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v15, "setLimit:", -1);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v74 = __Block_byref_object_copy__5387;
  v75 = __Block_byref_object_dispose__5388;
  v76 = 0;
  v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v17 = objc_msgSend(v8, "limit");
  if (v17 >= 0x40)
    v18 = 64;
  else
    v18 = v17;
  v76 = (id)objc_msgSend(v16, "initWithCapacity:", v18, v41);
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v68[3] = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x2020000000;
  v67 = 0;
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke;
  aBlock[3] = &unk_1E7E173D0;
  v63 = v66;
  v64 = buf;
  v62 = v41;
  v65 = v68;
  v20 = v8;
  v61 = v20;
  v21 = _Block_copy(aBlock);
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v22 = v20;
  v23 = v22;
  v24 = self != 0;
  if (self)
  {
    v25 = (unint64_t)(objc_msgSend(v22, "locationConsumer") - 1) < 2;

    if (!v25)
    {
      v24 = 0;
      v26 = 0;
      goto LABEL_13;
    }
    +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "homeOrWorkAddresses");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  LOBYTE(v25) = self != 0;
LABEL_13:
  v50[0] = v19;
  v50[1] = 3221225472;
  v50[2] = __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke_2;
  v50[3] = &unk_1E7E173F8;
  v28 = v26;
  v51 = v28;
  v29 = _Block_copy(v50);
  v30 = v19;
  v31 = a4;
  v32 = v15;
  storage = self->_storage;
  v42[0] = v30;
  v42[1] = 3221225472;
  v42[2] = __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke_3;
  v42[3] = &unk_1E7E17420;
  v45 = &v56;
  v49 = v25;
  v34 = v29;
  v43 = v34;
  v46 = &v52;
  v47 = buf;
  v35 = v21;
  v44 = v35;
  v48 = v66;
  v36 = v32;
  v27 = -[PPNamedEntityStorage iterNamedEntityRecordsWithQuery:error:block:](storage, "iterNamedEntityRecordsWithQuery:error:block:", v32, v31, v42);
  if (v27)
    v35[2](v35);
  if (v24 && v53[3])
  {
    pp_entities_log_handle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v39 = v53[3];
      v40 = v57[3];
      *(_DWORD *)v69 = 134218240;
      v70 = v39;
      v71 = 2048;
      v72 = v40;
      _os_log_debug_impl(&dword_1C392E000, v37, OS_LOG_TYPE_DEBUG, "iterNamedEntitiesRecordsWithQuery filtered %tu of %tu items due to map UI restriction", v69, 0x16u);
    }

  }
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(buf, 8);

LABEL_21:
  return v27;
}

- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pp_entities_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v6, "limit");
    objc_msgSend(v6, "fromDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v21 = v8;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "namedEntityRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  v13 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__PPLocalNamedEntityStore_namedEntityRecordsWithQuery_error___block_invoke;
  v18[3] = &unk_1E7E1F540;
  v19 = v13;
  v14 = v13;
  if (-[PPLocalNamedEntityStore iterNamedEntityRecordsWithQuery:error:block:](self, "iterNamedEntityRecordsWithQuery:error:block:", v6, a4, v18))
  {
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  return v16;
}

- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, uint8_t *);
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, uint8_t *))a5;
  pp_entities_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v8, "limit");
    objc_msgSend(v8, "fromDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "toDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v33 = v11;
    v34 = 2112;
    v35 = v13;
    v36 = 2112;
    v37 = v15;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "iterRankedNamedEntitiesWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  v30 = 0;
  -[PPLocalNamedEntityStore rankedNamedEntitiesWithQuery:error:](self, "rankedNamedEntitiesWithQuery:error:", v8, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;
  if (v17)
  {
    pp_entities_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (uint64_t)v17;
      _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "iterRankedNamedEntitiesWithQuery: error from rankedNamedEntitiesWithQuery: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v17);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
LABEL_10:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23);
        buf[0] = 0;
        v9[2](v9, v24, buf);
        if (buf[0])
          break;
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v21)
            goto LABEL_10;
          break;
        }
      }
    }

  }
  return v17 == 0;
}

- (double)finalScoreFromRecordsUsingHybrid:(id)a3 streamingScorer:(id)a4 mlModel:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  NSObject *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        objc_msgSend(v8, "addRecord:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v11);
  }
  v25 = 0;
  objc_msgSend(v8, "getFinalScoreWithAggregationResultOut:finalResultOut:", 0, &v25);
  if (v25)
  {
    v24 = 0;
    objc_msgSend(v9, "predictionFromFeatures:error:", v25, &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    if (v14)
    {
      objc_msgSend(v14, "featureValueForName:", CFSTR("computed_score"));
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject multiArrayValue](v16, "multiArrayValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[NSObject multiArrayValue](v16, "multiArrayValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        v21 = v20;

      }
      else
      {
        -[NSObject doubleValue](v16, "doubleValue");
        v21 = v22;
      }
    }
    else
    {
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      v21 = -1.0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        _os_log_fault_impl(&dword_1C392E000, v16, OS_LOG_TYPE_FAULT, "PPLocalNamedEntityStore: unable to retrieve prediction %@", buf, 0xCu);
      }
    }

  }
  else
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = 0.0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C392E000, v15, OS_LOG_TYPE_FAULT, "PPLocalLocationStore: the score interpreter provided a nil final output.", buf, 2u);
    }
  }

  return v21;
}

- (id)scoredEntityFromRecords:(id)a3 scoringDate:(id)a4 perRecordDecayRate:(float)a5 decayRate:(float)a6 sourceStats:(id)a7 decayedFeedbackCounts:(id)a8 streamingScorer:(id *)a9 mlModel:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  PPStreamingNamedEntityScorer *v64;
  id v65;
  void *v66;
  int v67;
  void *v68;
  PPTrialWrapper *trialWrapper;
  id v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  float v80;
  void *v81;
  float v82;
  float v83;
  int v84;
  double v85;
  BOOL v86;
  void *v87;
  NSObject *v88;
  void *v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  PPLocalNamedEntityStore *v94;
  void *v95;
  id v96;
  uint64_t v97;
  void *context;
  id v99;
  id v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint8_t buf[4];
  double v117;
  __int16 v118;
  double v119;
  uint8_t v120[4];
  void *v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  if (objc_msgSend(v16, "count"))
  {
    v20 = v16;
    v104 = v17;
    v21 = v18;
    v106 = v19;
    v102 = v20;
    if (!self)
    {
      v74 = 0;
      goto LABEL_55;
    }
    context = (void *)MEMORY[0x1C3BD6630]();
    if (!objc_msgSend(v20, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultScoredEntityFromRecords_scoringDate_perRecordDecayRate_decayRate_sourceStats_decayedFeedbackCounts_streamingScorer_, self, CFSTR("PPLocalNamedEntityStore.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("records.count > 0"));

    }
    v101 = v17;
    if (!v21)
    {
      +[PPStreamingNamedEntityScorer scoreInterpreterAggregationBytecode](PPStreamingNamedEntityScorer, "scoreInterpreterAggregationBytecode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPStreamingNamedEntityScorer scoreInterpreterFinalBytecode](PPStreamingNamedEntityScorer, "scoreInterpreterFinalBytecode");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = 0;
      if (v22 && v23)
      {
        v26 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:](PPStreamingNamedEntityScorer, "sourceStatsNeededForBytecode:", v22);
        v25 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:](PPStreamingNamedEntityScorer, "sourceStatsNeededForBytecode:", v24) | v26;
      }
      -[PPNamedEntityStorage sourceStats:withExcludedAlgorithms:](self->_storage, "sourceStats:withExcludedAlgorithms:", v25, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    v94 = self;
    v103 = v21;
    v99 = v19;
    v100 = v18;
    v96 = v16;
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "entity");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v20;
    v29 = (void *)objc_opt_new();
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v30 = v28;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v113;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v113 != v33)
            objc_enumerationMutation(v30);
          v35 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * i), "entity");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "category"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v37);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
      }
      while (v32);
    }

    objc_msgSend(v29, "allObjects");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    v107 = MEMORY[0x1E0C809B0];
    v108 = 3221225472;
    v109 = __62__PPLocalNamedEntityStore__dominantEntityCategoryFromRecords___block_invoke;
    v110 = &unk_1E7E17448;
    v111 = v29;
    v40 = v29;
    objc_msgSend(v38, "sortedArrayUsingComparator:", &v107);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "unsignedIntegerValue");

    v44 = v30;
    v45 = (void *)objc_opt_new();
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v46 = v44;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v113;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v113 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * j), "entity");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "name");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v52);

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
      }
      while (v48);
    }

    objc_msgSend(v45, "allObjects");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v39;
    v108 = 3221225472;
    v109 = __58__PPLocalNamedEntityStore__dominantEntityNameFromRecords___block_invoke;
    v110 = &unk_1E7E17470;
    v111 = v45;
    v54 = v45;
    objc_msgSend(v53, "sortedArrayUsingComparator:", &v107);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "lastObject");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v107 = v39;
    v108 = 3221225472;
    v109 = __150__PPLocalNamedEntityStore__defaultScoredEntityFromRecords_scoringDate_perRecordDecayRate_decayRate_sourceStats_decayedFeedbackCounts_streamingScorer___block_invoke;
    v110 = &__block_descriptor_40_e46_B24__0__PPNamedEntityRecord_8__NSDictionary_16l;
    v111 = v43;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &v107);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "filteredArrayUsingPredicate:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = v58;
    objc_msgSend(v58, "sortedArrayUsingComparator:", &__block_literal_global_205);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "lastObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = objc_alloc(MEMORY[0x1E0D70BC0]);
    objc_msgSend(v105, "bestLanguage");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v61, "initWithName:category:dynamicCategory:language:mostRelevantRecord:", v56, v43, 0, v62, v60);

    v63 = *a9;
    if (!*a9)
    {
      v64 = -[PPStreamingNamedEntityScorer initWithScoringDate:perRecordDecayRate:sourceStats:]([PPStreamingNamedEntityScorer alloc], "initWithScoringDate:perRecordDecayRate:sourceStats:", v104, v103, a5);
      v65 = *a9;
      *a9 = v64;

      v63 = *a9;
    }
    objc_msgSend(v63, "startNewClusterWithDecayedFeedbackCounts:mostRelevantRecord:dominantEntityName:", v106, v60, v56);
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "namedEntityScoringUsesHybrid");

    if (v67)
    {
      -[NSCache objectForKey:](v94->_modelCache, "objectForKey:", CFSTR("scoring_model"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v96;
      if (!v68)
      {
        trialWrapper = v94->_trialWrapper;
        *(_QWORD *)&v112 = 0;
        -[PPTrialWrapper mlModelForModelName:namespaceName:error:](trialWrapper, "mlModelForModelName:namespaceName:error:", CFSTR("PPModel_NE.mlmodelc"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"), &v112);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (id)v112;
        if (!v68)
        {
          v90 = v70;
          pp_default_log_handle();
          v91 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v120 = 138412290;
            v121 = v90;
            _os_log_fault_impl(&dword_1C392E000, v91, OS_LOG_TYPE_FAULT, "PPLocalNamedEntityStore: unable to load scoring model with error: %@", v120, 0xCu);
          }

          pp_entities_log_handle();
          v92 = objc_claimAutoreleasedReturnValue();
          v18 = v100;
          v17 = v101;
          v19 = v99;
          v21 = v103;
          v73 = v95;
          v87 = (void *)v97;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v120 = 0;
            _os_log_error_impl(&dword_1C392E000, v92, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: unable to locate ML model.", v120, 2u);
          }

          v74 = 0;
          goto LABEL_54;
        }

        -[NSCache setObject:forKey:](v94->_modelCache, "setObject:forKey:", v68, CFSTR("scoring_model"));
      }
      -[PPLocalNamedEntityStore finalScoreFromRecordsUsingHybrid:streamingScorer:mlModel:](v94, "finalScoreFromRecordsUsingHybrid:streamingScorer:mlModel:", v46, *a9, v68);
      v72 = v71;

      v73 = v58;
    }
    else
    {
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v75 = v46;
      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
      v73 = v58;
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v113;
        do
        {
          for (k = 0; k != v77; ++k)
          {
            if (*(_QWORD *)v113 != v78)
              objc_enumerationMutation(v75);
            objc_msgSend(*a9, "addRecord:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * k));
          }
          v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v112, v120, 16);
        }
        while (v77);
      }

      objc_msgSend(*a9, "getFinalScore");
      v72 = v80;
      v16 = v96;
    }
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "scoreThresholdForNamedEntity");
    v83 = v82;

    if (v72 <= 0.0)
      v84 = 1;
    else
      v84 = v67;
    v85 = v83;
    v86 = v84 == 1 && v72 < v85;
    v19 = v99;
    v18 = v100;
    v87 = (void *)v97;
    if (v86)
    {
      v17 = v101;
      if (v67)
      {
        pp_entities_log_handle();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          v117 = v72;
          v118 = 2048;
          v119 = v85;
          _os_log_debug_impl(&dword_1C392E000, v88, OS_LOG_TYPE_DEBUG, "Portrait Scoring, filtering out score of %f below threshold of %f", buf, 0x16u);
        }

      }
      v74 = 0;
    }
    else
    {
      v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v97, v72);
      v17 = v101;
    }
    v21 = v103;
LABEL_54:

    objc_autoreleasePoolPop(context);
LABEL_55:

    goto LABEL_56;
  }
  v74 = 0;
LABEL_56:

  return v74;
}

- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4
{
  return -[PPLocalNamedEntityStore rankedNamedEntitiesWithQuery:error:clientProcessName:](self, "rankedNamedEntitiesWithQuery:error:clientProcessName:", a3, a4, 0);
}

- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  _PASLock *lock;
  uint64_t v20;
  void *v21;
  id v22;
  PPEvictingMinPriorityQueue *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  dispatch_semaphore_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  _QWORD *v41;
  void *v42;
  BOOL v43;
  id v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  id v50;
  id v51;
  NSObject *v52;
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  float v60;
  uint64_t v61;
  NSObject *v62;
  id v64;
  id v65;
  PPEvictingMinPriorityQueue *v66;
  os_signpost_id_t spid;
  void *v68;
  void *v70;
  id v71;
  unint64_t v72;
  _QWORD block[4];
  id v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD v78[4];
  NSObject *v79;
  NSObject *v80;
  PPLocalNamedEntityStore *v81;
  id v82;
  _BYTE *v83;
  _QWORD *v84;
  _QWORD *v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[5];
  id v89;
  _QWORD aBlock[5];
  id v91;
  id v92;
  PPEvictingMinPriorityQueue *v93;
  _QWORD *v94;
  uint64_t *v95;
  uint64_t *v96;
  _QWORD v97[5];
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD v107[5];
  id v108;
  uint8_t v109[4];
  id v110;
  _BYTE buf[24];
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  PPLocalNamedEntityStore *v115;
  uint64_t v116;
  BOOL v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v71 = a5;
  if (objc_msgSend(v6, "isForRecordMonitoring"))
  {
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLimit:", objc_msgSend(v7, "namedEntityLoadAndMonitorInitialLoadLimit"));

    pp_entities_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v71;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v6, "limit");
      _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: overwrote query from %@ with limit %tu", buf, 0x16u);
    }

  }
  pp_entities_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "limit");
    objc_msgSend(v6, "fromDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v112 = v14;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "rankedNamedEntitiesWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  v72 = objc_msgSend(v6, "limit");
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v72 > (int)objc_msgSend(v15, "maxNumberNamedEntities");

  if (v16)
  {
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "maxNumberNamedEntities");

    v72 = v18;
  }
  if (objc_msgSend(v6, "locationConsumer") == 3)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v112 = __Block_byref_object_copy__5387;
    v113 = __Block_byref_object_dispose__5388;
    lock = self->_lock;
    v114 = 0;
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke;
    v107[3] = &unk_1E7E17518;
    v107[4] = buf;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v107);
    if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") > v72)
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "subarrayWithRange:", 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v20;

    }
    v22 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v103 = 0;
    v104 = &v103;
    v105 = 0x2020000000;
    v106 = 0;
    v99 = 0;
    v100 = &v99;
    v101 = 0x2020000000;
    v102 = 0;
    v23 = -[PPEvictingMinPriorityQueue initWithCapacity:]([PPEvictingMinPriorityQueue alloc], "initWithCapacity:", objc_msgSend(v6, "limit"));
    objc_msgSend(v6, "scoringDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      v26 = v24;
    else
      v26 = (id)objc_opt_new();
    v27 = v26;

    +[PPStreamingNamedEntityScorer scoreInterpreterAggregationBytecode](PPStreamingNamedEntityScorer, "scoreInterpreterAggregationBytecode");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPStreamingNamedEntityScorer scoreInterpreterFinalBytecode](PPStreamingNamedEntityScorer, "scoreInterpreterFinalBytecode");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    if (v70 && v68)
    {
      v29 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:](PPStreamingNamedEntityScorer, "sourceStatsNeededForBytecode:", v70);
      v28 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:](PPStreamingNamedEntityScorer, "sourceStatsNeededForBytecode:", v68) | v29;
    }
    -[PPNamedEntityStorage sourceStats:withExcludedAlgorithms:](self->_storage, "sourceStats:withExcludedAlgorithms:", v28, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = 0;
    v97[1] = v97;
    v97[2] = 0x3032000000;
    v97[3] = __Block_byref_object_copy__5387;
    v97[4] = __Block_byref_object_dispose__5388;
    v98 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_2;
    aBlock[3] = &unk_1E7E17540;
    aBlock[4] = self;
    v64 = v27;
    v91 = v64;
    v65 = v30;
    v92 = v65;
    v94 = v97;
    v66 = v23;
    v93 = v66;
    v95 = &v99;
    v96 = &v103;
    v31 = _Block_copy(aBlock);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v112 = __Block_byref_object_copy__5387;
    v113 = __Block_byref_object_dispose__5388;
    v114 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x3032000000;
    v88[3] = __Block_byref_object_copy__5387;
    v88[4] = __Block_byref_object_dispose__5388;
    v89 = 0;
    v86[0] = 0;
    v86[1] = v86;
    v86[2] = 0x3032000000;
    v86[3] = __Block_byref_object_copy__5387;
    v86[4] = __Block_byref_object_dispose__5388;
    v87 = 0;
    pp_entities_signpost_handle();
    v32 = objc_claimAutoreleasedReturnValue();
    spid = os_signpost_id_generate(v32);

    pp_entities_signpost_handle();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)v109 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C392E000, v34, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PPLocalNamedEntityStore.rankedNamedEntitiesWithQuery.aggregation", ", v109, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPLocalNamedEntityStore-scoring", qos_class_self());
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = dispatch_semaphore_create(64);
    v37 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v37, "setOrderByName:", 1);
    objc_msgSend(v37, "setRemoveNearDuplicates:", 1);
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_220;
    v78[3] = &unk_1E7E17568;
    v83 = buf;
    v84 = v88;
    v85 = v86;
    v38 = v36;
    v79 = v38;
    v39 = v35;
    v80 = v39;
    v40 = v31;
    v81 = self;
    v82 = v40;
    v41 = v78;
    v42 = (void *)objc_msgSend(v37, "copy");
    objc_msgSend(v42, "setLimit:", -1);
    v108 = 0;
    v43 = -[PPLocalNamedEntityStore iterNamedEntityRecordsWithQuery:error:block:](self, "iterNamedEntityRecordsWithQuery:error:block:", v42, &v108, v41);

    v44 = v108;
    if (!v43)
    {
      pp_entities_log_handle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v109 = 138412290;
        v110 = v44;
        _os_log_error_impl(&dword_1C392E000, v45, OS_LOG_TYPE_ERROR, "_unlimitedNamedEntityRecordsWithQuery: nil result from iterNamedEntityRecordsWithQuery: %@", v109, 0xCu);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v44);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_223;
    block[3] = &unk_1E7E1D050;
    v76 = v88;
    v46 = v40;
    v75 = v46;
    v77 = v86;
    dispatch_sync(v39, block);
    pp_entities_signpost_handle();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
    {
      *(_WORD *)v109 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C392E000, v48, OS_SIGNPOST_INTERVAL_END, spid, "PPLocalNamedEntityStore.rankedNamedEntitiesWithQuery.aggregation", ", v109, 2u);
    }

    _Block_object_dispose(v86, 8);
    _Block_object_dispose(v88, 8);

    _Block_object_dispose(buf, 8);
    v49 = v104[3];
    v50 = v6;
    v51 = v71;
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
    v52 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __86__PPLocalNamedEntityStore__petLoggingForQuery_resultCount_clientProcessName_hasError___block_invoke;
    v112 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E7E1FD78;
    v53 = (void (*)(uint64_t))v51;
    v113 = v53;
    v116 = v49;
    v54 = v50;
    v117 = !v43;
    v114 = v54;
    v115 = self;
    dispatch_async(v52, buf);

    if (v43)
    {
      v55 = v100[3];
      v56 = v104[3];
      pp_entities_log_handle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = v100[3];
        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "scoreThresholdForNamedEntity");
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v60;
        *(_WORD *)&buf[22] = 2048;
        v112 = (uint64_t (*)(uint64_t, uint64_t))(v56 + v55);
        _os_log_impl(&dword_1C392E000, v57, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: filtered %tu items below threshold of %f out of %tu total.", buf, 0x20u);

      }
      -[PPEvictingMinPriorityQueue extractSortedMutableArray](v66, "extractSortedMutableArray");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count") > v72)
      {
        objc_msgSend(v22, "subarrayWithRange:", 0);
        v61 = objc_claimAutoreleasedReturnValue();

        v22 = (id)v61;
      }
    }
    else
    {
      pp_default_log_handle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = 0;
        _os_log_error_impl(&dword_1C392E000, v62, OS_LOG_TYPE_ERROR, "Error encountered while scoring named entities: %@", buf, 0xCu);
      }

      v22 = 0;
      if (a4)
        *a4 = 0;
    }

    _Block_object_dispose(v97, 8);
    _Block_object_dispose(&v99, 8);
    _Block_object_dispose(&v103, 8);
  }

  return v22;
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8
{
  _BOOL4 v9;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  uint64_t v27;
  _PASLock *lock;
  uint64_t v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  unsigned int v46;
  double v47;
  double v48;
  int v49;
  id v50;
  void *v51;
  void *v52;
  PPCoalescedScoredNamedEntity *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  unsigned int v66;
  id v67;
  void *v71;
  void *v72;
  id obj;
  uint64_t v74;
  _QWORD block[4];
  id v76;
  PPLocalNamedEntityStore *v77;
  id v78;
  uint64_t *v79;
  unint64_t v80;
  uint64_t v81;
  _QWORD v82[4];
  id v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  uint64_t v101;

  v9 = a6;
  v101 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v72 = v12;
  if (!v12)
  {
    v63 = v13;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalNamedEntityStore.m"), 886, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entities"));

    v13 = v63;
  }
  v71 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalNamedEntityStore.m"), 887, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

  }
  pp_entities_log_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v72, "count");
    objc_msgSend(MEMORY[0x1E0D70BD8], "describeAlgorithm:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v96 = v15;
    v97 = 2112;
    v98 = (uint64_t)v71;
    v99 = 2112;
    v100 = (uint64_t)v16;
    _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore received a donation of %tu named entities from source: %@, algorithm: %@", buf, 0x20u);

  }
  if (objc_msgSend(v72, "count"))
  {
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "bundleId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "bundleIdentifierIsEnabledForDonation:", v18);

    if ((v19 & 1) != 0)
    {
      if (v9)
      {
        +[PPSettings sharedInstance](PPSettings, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "bundleId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "bundleIdentifierIsEnabledForCloudKit:", v21);

        if ((v22 & 1) != 0)
        {
          v66 = 1;
          goto LABEL_22;
        }
        pp_entities_log_handle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v71, "bundleId");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v96 = (uint64_t)v62;
          _os_log_debug_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore suppressed named entity cloudSync on donation from disabled bundleId: %@", buf, 0xCu);

        }
      }
      v66 = 0;
LABEL_22:
      v27 = objc_msgSend(v72, "count");
      v85 = 0;
      v86 = &v85;
      v87 = 0x3032000000;
      v88 = __Block_byref_object_copy__5387;
      v89 = __Block_byref_object_dispose__5388;
      lock = self->_lock;
      v29 = MEMORY[0x1E0C809B0];
      v90 = 0;
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke;
      v82[3] = &unk_1E7E17590;
      v84 = &v85;
      v30 = v72;
      v83 = v30;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v82);
      +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
      v31 = objc_claimAutoreleasedReturnValue();
      block[0] = v29;
      block[1] = 3221225472;
      block[2] = __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke_2;
      block[3] = &unk_1E7E175B8;
      v67 = v71;
      v76 = v67;
      v77 = self;
      v79 = &v85;
      v80 = a5;
      v81 = v27;
      v78 = v30;
      dispatch_async(v31, block);

      if (objc_msgSend((id)v86[5], "count"))
      {
        pp_entities_log_handle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = objc_msgSend((id)v86[5], "count");
          v34 = objc_msgSend((id)v86[5], "count");
          *(_DWORD *)buf = 134218496;
          v96 = v27 - v33;
          v97 = 2048;
          v98 = v27;
          v99 = 2048;
          v100 = v34;
          _os_log_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: PPNamedEntityFilter filtered %tu entities. Prev count %tu, new count %tu.", buf, 0x20u);
        }

        v35 = (id)v86[5];
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v35, "count"));
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        obj = v35;
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, buf, 16);
        if (v37)
        {
          v74 = *(_QWORD *)v92;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v92 != v74)
                objc_enumerationMutation(obj);
              v39 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
              v40 = (void *)MEMORY[0x1C3BD6630]();
              objc_msgSend(v39, "item");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (v42)
              {
                objc_msgSend(v42, "scoredNamedEntity");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "score");
                v45 = v44;
                v46 = objc_msgSend(v42, "occurrencesInSource");
                objc_msgSend(v39, "score");
                v48 = v47;
                v49 = objc_msgSend(v42, "occurrencesInSource");

                v50 = objc_alloc(MEMORY[0x1E0D70C38]);
                objc_msgSend(v39, "item");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = (void *)objc_msgSend(v50, "initWithItem:score:", v51, (v48 + v45 * (double)v46) / (double)(v49 + 1));

                v53 = -[PPCoalescedScoredNamedEntity initWithScoredNamedEntity:occurrencesInSource:]([PPCoalescedScoredNamedEntity alloc], "initWithScoredNamedEntity:occurrencesInSource:", v52, (unsigned __int16)(objc_msgSend(v42, "occurrencesInSource") + 1));
              }
              else
              {
                v53 = -[PPCoalescedScoredNamedEntity initWithScoredNamedEntity:occurrencesInSource:]([PPCoalescedScoredNamedEntity alloc], "initWithScoredNamedEntity:occurrencesInSource:", v39, 1);
              }
              objc_msgSend(v39, "item");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v53, v54);

              objc_autoreleasePoolPop(v40);
            }
            v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, buf, 16);
          }
          while (v37);
        }

        v55 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v36, "allValues");
        v56 = objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v55);

        if (-[NSObject count](v56, "count"))
        {
          pp_entities_log_handle();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            v58 = -[NSObject count](v56, "count");
            *(_DWORD *)buf = 134217984;
            v96 = v58;
            _os_log_impl(&dword_1C392E000, v57, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore: writing %tu coalesced scored entities to the database.", buf, 0xCu);
          }

          if (!-[PPNamedEntityStorage donateNamedEntities:source:algorithm:cloudSync:decayRate:sentimentScore:error:](self->_storage, "donateNamedEntities:source:algorithm:cloudSync:decayRate:sentimentScore:error:", v56, v67, a5, v66, a8, 0.0, a7))
          {
            v25 = 0;
            goto LABEL_43;
          }
          -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_241);
        }
      }
      else
      {
        pp_default_log_handle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v67, "bundleId");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v96 = (uint64_t)v59;
          v97 = 2048;
          v98 = v27;
          _os_log_impl(&dword_1C392E000, v56, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: Received a donation that filtered to zero from bundle %@. Prev count %tu", buf, 0x16u);

        }
      }
      v25 = 1;
LABEL_43:

      _Block_object_dispose(&v85, 8);
      goto LABEL_44;
    }
    pp_entities_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v71, "bundleId");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v96 = (uint64_t)v61;
      _os_log_debug_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore suppressed named entity donation from disabled bundleId: %@", buf, 0xCu);

    }
  }
  else
  {
    pp_entities_log_handle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v71, "bundleId");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v96 = (uint64_t)v24;
      _os_log_impl(&dword_1C392E000, v23, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore received empty donation from %@", buf, 0xCu);

    }
  }

  v25 = 1;
LABEL_44:

  return v25;
}

- (BOOL)flushDonationsWithError:(id *)a3
{
  _PASLock *lock;
  id v5;
  const char *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  lock = self->_lock;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PPLocalNamedEntityStore_flushDonationsWithError___block_invoke;
  v8[3] = &unk_1E7E17518;
  v8[4] = &v9;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  if (*((_BYTE *)v10 + 24))
  {
    -[PPLocalNamedEntityStore meaningfulChangeNotificationOverride](self, "meaningfulChangeNotificationOverride");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    if (!v6)
      v6 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesDidChangeMeaningfully";
    PPPostNotification(v6);

  }
  _Block_object_dispose(&v9, 8);
  return 1;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  id v11;
  char v12;
  PPLocalTopicStore *topicStoreForNamedEntityMapping;
  id v14;
  const char *v15;
  unint64_t v17;
  char v18;

  v10 = a3;
  v11 = a4;
  v18 = 0;
  v17 = 0;
  v12 = 0;
  if (-[PPNamedEntityStorage deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:atLeastOneNamedEntityRemoved:deletedCount:error:](self->_storage, "deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:atLeastOneNamedEntityRemoved:deletedCount:error:", v10, v11, &v18, &v17, a6))
  {
    topicStoreForNamedEntityMapping = self->_topicStoreForNamedEntityMapping;
    if (topicStoreForNamedEntityMapping)
      v12 = -[PPLocalTopicStore deleteAllTopicsFromSourcesWithBundleId:documentIds:algorithm:deletedCount:error:](topicStoreForNamedEntityMapping, "deleteAllTopicsFromSourcesWithBundleId:documentIds:algorithm:deletedCount:error:", v10, v11, 4, 0, a6);
    else
      v12 = 1;
  }
  if (v18)
  {
    -[PPLocalNamedEntityStore invalidationNotificationOverride](self, "invalidationNotificationOverride");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    if (!v15)
      v15 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    PPPostNotification(v15);

  }
  if (a5)
    *a5 = v17;

  return v12;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  char v15;
  PPLocalTopicStore *topicStoreForNamedEntityMapping;
  id v17;
  const char *v18;
  unint64_t v20;
  char v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v21 = 0;
  v20 = 0;
  v15 = 0;
  if (-[PPNamedEntityStorage deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThanDate:atLeastOneNamedEntityRemoved:deletedCount:error:](self->_storage, "deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThanDate:atLeastOneNamedEntityRemoved:deletedCount:error:", v12, v13, v14, &v21, &v20, a7))
  {
    topicStoreForNamedEntityMapping = self->_topicStoreForNamedEntityMapping;
    if (topicStoreForNamedEntityMapping)
      v15 = -[PPLocalTopicStore deleteAllTopicsFromSourcesWithBundleId:groupId:algorithm:olderThan:deletedCount:error:](topicStoreForNamedEntityMapping, "deleteAllTopicsFromSourcesWithBundleId:groupId:algorithm:olderThan:deletedCount:error:", v12, v13, 4, v14, 0, a7);
    else
      v15 = 1;
  }
  if (v21)
  {
    -[PPLocalNamedEntityStore invalidationNotificationOverride](self, "invalidationNotificationOverride");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    if (!v18)
      v18 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    PPPostNotification(v18);

  }
  if (a6)
    *a6 = v20;

  return v15;
}

- (BOOL)deleteAllNamedEntitiesOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  BOOL v7;
  id v8;
  const char *v9;
  unint64_t v11;
  char v12;

  v12 = 0;
  v11 = 0;
  v7 = -[PPNamedEntityStorage deleteAllNamedEntitiesOlderThanDate:atLeastOneNamedEntityRemoved:deletedCount:error:](self->_storage, "deleteAllNamedEntitiesOlderThanDate:atLeastOneNamedEntityRemoved:deletedCount:error:", a3, &v12, &v11, a5);
  if (v12)
  {
    -[PPLocalNamedEntityStore invalidationNotificationOverride](self, "invalidationNotificationOverride");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    if (!v9)
      v9 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
    PPPostNotification(v9);

  }
  if (a4)
    *a4 = v11;
  return v7;
}

- (BOOL)deleteAllNamedEntityFeedbackCountsOlderThanDate:(id)a3
{
  return -[PPNamedEntityStorage deleteAllNamedEntityFeedbackCountRecordsOlderThanDate:](self->_storage, "deleteAllNamedEntityFeedbackCountRecordsOlderThanDate:", a3);
}

- (BOOL)pruneOrphanedNamedEntityFeedbackCountsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  return -[PPNamedEntityStorage pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit:rowOffset:deletedCount:isComplete:](self->_storage, "pruneOrphanedNamedEntityFeedbackCountRecordsWithLimit:rowOffset:deletedCount:isComplete:", a3, a4, a5, a6);
}

- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5
{
  id v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pp_entities_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "length");
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "map item being donated of length %tu", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (id)mapItemForPlaceName:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  PPNamedEntityStorage *storage;
  NSObject *v9;
  NSObject *v10;
  char v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __CFString *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  char v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t v30;
  __CFString *v31;
  uint8_t buf[4];
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15A50], "userKnowledgeStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    pp_entities_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: exporting locally-generated named entity records", buf, 2u);
    }

    v7 = (void *)objc_opt_new();
    storage = self->_storage;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __46__PPLocalNamedEntityStore_cloudSyncWithError___block_invoke;
    v28[3] = &unk_1E7E1D240;
    v9 = v7;
    v29 = v9;
    -[PPNamedEntityStorage exportRecordsToDKWithShouldContinueBlock:](storage, "exportRecordsToDKWithShouldContinueBlock:", v28);
    pp_entities_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: synchronizing _DKKnowledgeStore", buf, 2u);
    }

    v27 = 0;
    v11 = objc_msgSend(v5, "synchronizeWithError:", &v27);
    v12 = v27;
    if ((v11 & 1) != 0)
    {
      pp_entities_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: importing remotely-generated named entity records", buf, 2u);
      }

      v26 = 0;
      do
        -[PPNamedEntityStorage importRemotelyGeneratedNamedEntityDKEventsWithLimit:isComplete:shouldContinueBlock:](self->_storage, "importRemotelyGeneratedNamedEntityDKEventsWithLimit:isComplete:shouldContinueBlock:", -[PPNamedEntityStorage duetReadBatchSize](self->_storage, "duetReadBatchSize"), &v26, &__block_literal_global_254);
      while (!v26);
      pp_entities_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: processing _DKKnowledgeStore remote named entity deletions", buf, 2u);
      }

      -[PPNamedEntityStorage processNewDKEventDeletions](self->_storage, "processNewDKEventDeletions");
    }
    else
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v12, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (__CFString *)objc_msgSend(v18, "initWithFormat:", CFSTR("Unable to synchronize _DKKnowledgeStore: %@"), v19);

      if (a3)
      {
        v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v22 = *MEMORY[0x1E0D70D10];
        v30 = *MEMORY[0x1E0CB2D50];
        v31 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *a3 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, 1, v23);

      }
      pp_entities_log_handle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v20;
        _os_log_error_impl(&dword_1C392E000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (a3)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v16 = *MEMORY[0x1E0D70D10];
      v34 = *MEMORY[0x1E0CB2D50];
      v35[0] = CFSTR("Unable to connect to _DKKnowledgeStore");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *a3 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 1, v17);

    }
    pp_entities_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = CFSTR("Unable to connect to _DKKnowledgeStore");
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  NSObject *v7;
  BOOL v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  const char *v12;
  id v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  pp_entities_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "Invalidating named entity query cache due to clear operation.", (uint8_t *)&v15, 2u);
  }

  v8 = -[PPNamedEntityStorage clearWithError:deletedCount:](self->_storage, "clearWithError:deletedCount:", a3, a4);
  v9 = v8;
  if (a3 && !v8)
  {
    pp_entities_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = *a3;
      v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "clearWithError error: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  -[PPLocalNamedEntityStore invalidationNotificationOverride](self, "invalidationNotificationOverride");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  if (!v12)
    v12 = "com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated";
  PPPostNotification(v12);

  return v9;
}

- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6
{
  id v8;
  NSObject *v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  BOOL v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  id v88;
  void *v89;
  id v90;
  NSObject *v91;
  NSObject *v92;
  id *v93;
  id *v94;
  uint64_t v95;
  void *v96;
  id v97;
  NSObject *v98;
  id obj;
  uint64_t v102;
  void *v103;
  id v104;
  uint64_t v105;
  id v106;
  BOOL v107;
  uint64_t v108;
  void *v110;
  id v111;
  _QWORD v112[4];
  id v113;
  id v114;
  id v115;
  _QWORD v116[4];
  id v117;
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  id v123;
  id v124;
  _QWORD block[4];
  id v126;
  id v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE buf[12];
  __int16 v134;
  uint64_t v135;
  __int16 v136;
  void *v137;
  _BYTE v138[128];
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v111 = a4;
  v104 = a5;
  pp_entities_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v111;
    v134 = 2048;
    v135 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating %tu locations", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D70D00], "currentLocaleLanguageCode");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = (void *)objc_opt_new();
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  obj = v8;
  v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
  if (!v105)
  {
    v106 = 0;
    v107 = 1;
    goto LABEL_75;
  }
  v102 = *(_QWORD *)v130;
  v106 = 0;
  v107 = 1;
  do
  {
    for (i = 0; i != v105; ++i)
    {
      if (*(_QWORD *)v130 != v102)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * i);
      v108 = MEMORY[0x1C3BD6630]();
      v12 = (void *)objc_opt_new();
      objc_msgSend(v11, "score");
      v14 = v13;
      v15 = 0.5;
      if (v14 > 0.0)
        objc_msgSend(v11, "score", 0.5);
      v16 = fmin(v15, 1.0);
      objc_msgSend(v11, "locationName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        pp_entities_log_handle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v111;
          _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a name", buf, 0xCu);
        }

        v19 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v11, "locationName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithName:category:language:", v20, 3, v110);

        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v21, v16);
        objc_msgSend(v12, "addObject:", v22);
        objc_msgSend(v11, "mapItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "locationName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = 0;
        -[PPLocalNamedEntityStore donateMapItem:forPlaceName:error:](self, "donateMapItem:forPlaceName:error:", v23, v24, &v128);
        v25 = v128;

        if (v25)
        {
          pp_entities_log_handle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v25;
            _os_log_error_impl(&dword_1C392E000, v26, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate map item for location name: %@", buf, 0xCu);
          }

          +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
          v27 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke;
          block[3] = &unk_1E7E1FCE8;
          v126 = v111;
          v127 = v25;
          dispatch_async(v27, block);

        }
      }
      else
      {
        v25 = 0;
      }
      objc_msgSend(v11, "streetAddress");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        pp_entities_log_handle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v111;
          _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a street address", buf, 0xCu);
        }

        v30 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v11, "streetAddress");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v30, "initWithName:category:language:", v31, 8, v110);

        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v32, v16);
        objc_msgSend(v12, "addObject:", v33);

      }
      objc_msgSend(v11, "city");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        pp_entities_log_handle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v111;
          _os_log_impl(&dword_1C392E000, v35, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a city", buf, 0xCu);
        }

        v36 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v11, "city");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v36, "initWithName:category:language:", v37, 9, v110);

        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v38, v16);
        objc_msgSend(v12, "addObject:", v39);

      }
      objc_msgSend(v11, "stateOrProvince");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        pp_entities_log_handle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v111;
          _os_log_impl(&dword_1C392E000, v41, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a state", buf, 0xCu);
        }

        v42 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v11, "stateOrProvince");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v42, "initWithName:category:language:", v43, 10, v110);

        v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v44, v16);
        objc_msgSend(v12, "addObject:", v45);

      }
      objc_msgSend(v11, "country");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        pp_entities_log_handle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v111;
          _os_log_impl(&dword_1C392E000, v47, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating a country", buf, 0xCu);
        }

        v48 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v11, "country");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend(v48, "initWithName:category:language:", v49, 11, v110);

        v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v50, v16);
        objc_msgSend(v12, "addObject:", v51);

      }
      objc_msgSend(v11, "streetAddress");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(v11, "streetAddress");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "city");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stateOrProvince");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postalCode");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "country");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPNamedEntitySupport fullAddressForStreetAddress:city:state:postalCode:country:](PPNamedEntitySupport, "fullAddressForStreetAddress:city:state:postalCode:country:", v53, v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70BC0]), "initWithName:category:language:", v58, 12, v110);
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v59, v16);
          objc_msgSend(v12, "addObject:", v60);
          objc_msgSend(v11, "mapItem");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = v25;
          -[PPLocalNamedEntityStore donateMapItem:forPlaceName:error:](self, "donateMapItem:forPlaceName:error:", v61, v58, &v124);
          v62 = v124;

          if (v62)
          {
            pp_entities_log_handle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v62;
              _os_log_error_impl(&dword_1C392E000, v63, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate map item for full address: %@", buf, 0xCu);
            }

          }
          v25 = v62;
        }

      }
      objc_msgSend(v11, "unstructuredLocationString");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      if (v64)
      {
        pp_entities_log_handle();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v111;
          _os_log_impl(&dword_1C392E000, v65, OS_LOG_TYPE_DEFAULT, "PPLocationNamedEntities: %@ is donating an unstructured location string", buf, 0xCu);
        }

        v66 = objc_alloc(MEMORY[0x1E0D70BC0]);
        objc_msgSend(v11, "unstructuredLocationString");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)objc_msgSend(v66, "initWithName:category:language:", v67, 3, v110);

        v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v68, v16);
        objc_msgSend(v12, "addObject:", v69);
        objc_msgSend(v11, "mapItem");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "unstructuredLocationString");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = v25;
        -[PPLocalNamedEntityStore donateMapItem:forPlaceName:error:](self, "donateMapItem:forPlaceName:error:", v70, v71, &v123);
        v72 = v123;

        if (v72)
        {
          pp_entities_log_handle();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v72;
            _os_log_error_impl(&dword_1C392E000, v73, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate map item for unstructured location: %@", buf, 0xCu);
          }

          +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
          v74 = objc_claimAutoreleasedReturnValue();
          v120[0] = MEMORY[0x1E0C809B0];
          v120[1] = 3221225472;
          v120[2] = __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_260;
          v120[3] = &unk_1E7E1FCE8;
          v121 = v111;
          v122 = v72;
          dispatch_async(v74, v120);

        }
      }
      else
      {
        v72 = v25;
      }
      v75 = objc_alloc(MEMORY[0x1E0D70C78]);
      objc_msgSend(v11, "documentId");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (v76)
      {
        v77 = (void *)objc_msgSend(v75, "initWithBundleId:groupId:documentId:date:", v111, v104, v76, v103);
      }
      else
      {
        v78 = (void *)objc_opt_new();
        objc_msgSend(v78, "UUIDString");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)objc_msgSend(v75, "initWithBundleId:groupId:documentId:date:", v111, v104, v79, v103);

      }
      pp_entities_log_handle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        v95 = objc_msgSend(v12, "count");
        objc_msgSend(v77, "documentId");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v111;
        v134 = 2048;
        v135 = v95;
        v136 = 2112;
        v137 = v96;
        _os_log_debug_impl(&dword_1C392E000, v80, OS_LOG_TYPE_DEBUG, "PPLocationNamedEntities: %@ donated %tu entities under document ID %@", buf, 0x20u);

      }
      v119 = v72;
      v81 = -[PPLocalNamedEntityStore donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:](self, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v12, v77, 6, 0, &v119, 0.0);
      v82 = v119;

      if (v81)
      {
        if (!v107)
        {
          v107 = 0;
          v89 = (void *)v108;
          goto LABEL_71;
        }
        v115 = v82;
        if (self)
        {
          v83 = v77;
          +[PPLocalLocationStore locationNamedEntityToPPScoredLocation:](PPLocalLocationStore, "locationNamedEntityToPPScoredLocation:", v11);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v84;
          v107 = 1;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v85, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:", v86, v83, 0, 6, 0, &v115);

          v88 = v115;
          v89 = (void *)v108;
          if ((v87 & 1) != 0)
          {
            v82 = v88;
            goto LABEL_71;
          }
        }
        else
        {
          v88 = v82;

          v89 = (void *)v108;
        }
        v97 = v88;

        pp_entities_log_handle();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v97;
          _os_log_error_impl(&dword_1C392E000, v98, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate locations: %@", buf, 0xCu);
        }

        +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
        v92 = objc_claimAutoreleasedReturnValue();
        v112[0] = MEMORY[0x1E0C809B0];
        v112[1] = 3221225472;
        v112[2] = __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_267;
        v112[3] = &unk_1E7E1FCE8;
        v113 = v111;
        v82 = v97;
        v114 = v82;
        dispatch_async(v92, v112);
        v94 = &v114;
        v93 = &v113;
      }
      else
      {
        v90 = v82;

        pp_entities_log_handle();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v90;
          _os_log_error_impl(&dword_1C392E000, v91, OS_LOG_TYPE_ERROR, "PPLocationNamedEntities: failed to donate entities: %@", buf, 0xCu);
        }

        +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
        v92 = objc_claimAutoreleasedReturnValue();
        v116[0] = MEMORY[0x1E0C809B0];
        v116[1] = 3221225472;
        v116[2] = __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_264;
        v116[3] = &unk_1E7E1FCE8;
        v117 = v111;
        v82 = v90;
        v118 = v82;
        dispatch_async(v92, v116);
        v94 = &v118;
        v93 = &v117;
        v89 = (void *)v108;
      }

      v106 = v82;
      v107 = 0;
LABEL_71:

      objc_autoreleasePoolPop(v89);
    }
    v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v138, 16);
  }
  while (v105);
LABEL_75:

  if (a6)
    *a6 = objc_retainAutorelease(v106);
  -[PPLocalNamedEntityStore flushDonationsWithError:](self, "flushDonationsWithError:", a6);

  return v107;
}

- (void)disableSyncForBundleIds:(id)a3
{
  -[PPNamedEntityStorage disableSyncForBundleIds:](self->_storage, "disableSyncForBundleIds:", a3);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  pp_private_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "Named entity feedback received: %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  +[PPInternalFeedback fromBaseFeedback:storeType:](PPInternalFeedback, "fromBaseFeedback:storeType:", v5, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storePendingFeedback:storeType:error:", v9, 1, 0);

  if (v6)
    v6[2](v6, 1, 0);

}

- (void)processFeedback:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  BOOL v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t n;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  float v95;
  double v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  unint64_t v101;
  unint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  PPStreamingNamedEntityScorer *v117;
  id v118;
  id v119;
  void *v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t jj;
  float v126;
  float v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  NSObject *v133;
  void *v134;
  void *v135;
  NSObject *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  id v140;
  NSObject *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t k;
  uint64_t v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  BOOL v156;
  void *v157;
  id v158;
  id v159;
  id v160;
  void *v161;
  id v162;
  id v163;
  uint64_t v164;
  PPFeatureRedactor *log;
  id v166;
  os_log_t oslog;
  uint64_t v168;
  unsigned int v169;
  id v170;
  void *v171;
  void *v172;
  void *v173;
  PPFeatureRedactor *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id obj;
  id obja;
  uint64_t v182;
  id v183;
  uint64_t v184;
  uint64_t ii;
  uint64_t v187;
  void *v188;
  void *context;
  void *contexta;
  id v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  _QWORD v201[4];
  id v202;
  id v203;
  id v204;
  id *v205;
  id v206;
  id v207[5];
  __CFString *v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  id v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  id v218;
  _BYTE v219[128];
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  uint8_t buf[16];
  __int128 v229;
  __int128 v230;
  __int128 v231;
  uint8_t v232[4];
  id v233;
  __int16 v234;
  id v235;
  uint64_t v236;

  v236 = *MEMORY[0x1E0C80C00];
  v162 = a3;
  objc_msgSend(v162, "feedbackItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v4 = (void *)objc_opt_new();
    v224 = 0u;
    v225 = 0u;
    v226 = 0u;
    v227 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v224, v232, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v225;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v225 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v9, "itemString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 == 0;

          if (v13)
          {
            v14 = (void *)objc_opt_new();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v9);

          objc_autoreleasePoolPop(v10);
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v224, v232, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }

  objc_msgSend(v162, "clientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("mapssearch"));

  if (v17)
  {
    v18 = v4;
    v193 = v18;
    if (self)
    {
      objc_msgSend(v18, "allKeys");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_opt_new();
      v176 = (void *)objc_opt_new();
      if (objc_msgSend(v178, "count"))
      {
        v20 = 0;
        v21 = 0;
        v169 = 0;
        while (1)
        {
          v171 = (void *)MEMORY[0x1C3BD6630]();
          v22 = (unint64_t)objc_msgSend(v178, "count") > 7 ? 8 : objc_msgSend(v178, "count");
          v23 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v178, "subarrayWithRange:", v20, v22);
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_autoreleasePoolPop(v23);
          objc_msgSend(v176, "setMatchingIdentifiers:", v173);
          -[_PASLazyResult result](self->_lazyContactStoreForMapsFeedback, "result");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v209 = v21;
          objc_msgSend(v24, "contactsWithQuery:error:", v176, &v209);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (id)v209;

          if (!v25)
            break;
          v222 = 0u;
          v223 = 0u;
          v220 = 0u;
          v221 = 0u;
          obj = v25;
          v184 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v232, 16);
          if (v184)
          {
            v182 = *(_QWORD *)v221;
            v27 = v26;
            do
            {
              v28 = 0;
              do
              {
                if (*(_QWORD *)v221 != v182)
                {
                  v29 = v28;
                  objc_enumerationMutation(obj);
                  v28 = v29;
                }
                v187 = v28;
                v30 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * v28);
                context = (void *)MEMORY[0x1C3BD6630]();
                v207[0] = v27;
                objc_msgSend(v30, "contactsContactIdentifierWithError:", v207);
                v195 = (void *)objc_claimAutoreleasedReturnValue();
                v191 = v207[0];

                if (v195)
                {
                  objc_msgSend(v30, "localizedFullName");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v31)
                  {
                    objc_msgSend(v30, "localizedFullName");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "objectForKeyedSubscript:", v32);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = v33 == 0;

                    if (v34)
                    {
                      v35 = (void *)objc_opt_new();
                      objc_msgSend(v30, "localizedFullName");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v19, "setObject:forKeyedSubscript:", v35, v36);

                    }
                    objc_msgSend(v30, "localizedFullName");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "objectForKeyedSubscript:", v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v193, "objectForKeyedSubscript:", v195);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v39;
                    if (!v39)
                    {
                      objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
                      v40 = (void *)MEMORY[0x1E0C9AA60];
                    }
                    objc_msgSend(v38, "addObjectsFromArray:", v40);

                  }
                  v216 = 0u;
                  v217 = 0u;
                  v214 = 0u;
                  v215 = 0u;
                  objc_msgSend(v30, "postalAddresses");
                  v41 = objc_claimAutoreleasedReturnValue();
                  v42 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v214, &v224, 16);
                  if (v42)
                  {
                    v43 = *(_QWORD *)v215;
                    do
                    {
                      for (j = 0; j != v42; ++j)
                      {
                        if (*(_QWORD *)v215 != v43)
                          objc_enumerationMutation(v41);
                        v45 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * j);
                        v46 = (void *)MEMORY[0x1C3BD6630]();
                        objc_msgSend(v45, "value");
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v47, "singleLineNormalizedAddressString");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v48)
                        {
                          objc_msgSend(v19, "objectForKeyedSubscript:", v48);
                          v49 = (void *)objc_claimAutoreleasedReturnValue();
                          v50 = v49 == 0;

                          if (v50)
                          {
                            v51 = (void *)objc_opt_new();
                            objc_msgSend(v19, "setObject:forKeyedSubscript:", v51, v48);

                          }
                          objc_msgSend(v19, "objectForKeyedSubscript:", v48);
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v193, "objectForKeyedSubscript:", v195);
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          v54 = v53;
                          if (!v53)
                          {
                            objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
                            v54 = (void *)MEMORY[0x1E0C9AA60];
                          }
                          objc_msgSend(v52, "addObjectsFromArray:", v54);

                        }
                        objc_autoreleasePoolPop(v46);
                      }
                      v42 = -[NSObject countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v214, &v224, 16);
                    }
                    while (v42);
                  }
                }
                else
                {
                  pp_entities_log_handle();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v191;
                    _os_log_error_impl(&dword_1C392E000, v41, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: error fetching contact identifier for contact. %@", buf, 0xCu);
                  }
                }

                objc_autoreleasePoolPop(context);
                v28 = v187 + 1;
                v27 = v191;
              }
              while (v187 + 1 != v184);
              v184 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v232, 16);
              v27 = v191;
            }
            while (v184);
          }
          else
          {
            v27 = v26;
          }
          v21 = v27;

          objc_autoreleasePoolPop(v171);
          v169 += 8;
          v20 = v169;
          if (objc_msgSend(v178, "count") <= (unint64_t)v169)
            goto LABEL_57;
        }
        pp_entities_log_handle();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v26;
          _os_log_error_impl(&dword_1C392E000, v55, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: error fetching maps related contacts: %@", buf, 0xCu);
        }

        objc_autoreleasePoolPop(v171);
        v21 = v26;
LABEL_57:

      }
      v4 = v19;
      objc_msgSend(v19, "addEntriesFromDictionary:", v193);

    }
    else
    {
      v4 = 0;
    }

  }
  v56 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "allKeys");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v56, "initWithArray:", v57);

  v59 = (void *)objc_opt_new();
  v161 = (void *)objc_opt_new();
  objc_msgSend(v162, "timestamp");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setScoringDate:", v60);

  objc_msgSend(v162, "timestamp");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setToDate:", v61);

  objc_msgSend(v162, "clientBundleId");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v62, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "setExcludingSourceBundleIds:", v63);

  objc_msgSend(v161, "setOrderByName:", 1);
  v207[0] = 0;
  v207[1] = v207;
  v207[2] = (id)0x3032000000;
  v207[3] = __Block_byref_object_copy__5387;
  v207[4] = __Block_byref_object_dispose__5388;
  v208 = &stru_1E7E221D0;
  v205 = v207;
  v206 = 0;
  v201[0] = MEMORY[0x1E0C809B0];
  v201[1] = 3221225472;
  v201[2] = __43__PPLocalNamedEntityStore_processFeedback___block_invoke;
  v201[3] = &unk_1E7E17640;
  v159 = (id)v58;
  v202 = v159;
  v160 = v59;
  v203 = v160;
  v196 = v4;
  v204 = v196;
  LOBYTE(v58) = -[PPLocalNamedEntityStore iterNamedEntityRecordsWithQuery:error:block:](self, "iterNamedEntityRecordsWithQuery:error:block:", v161, &v206, v201);
  v158 = v206;
  if ((v58 & 1) != 0)
  {
    if (!objc_msgSend(v160, "count"))
    {
LABEL_129:
      v138 = objc_opt_new();
      v199 = 0u;
      v200 = 0u;
      v197 = 0u;
      v198 = 0u;
      v142 = v159;
      v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v197, v219, 16);
      if (v143)
      {
        v144 = *(_QWORD *)v198;
        do
        {
          for (k = 0; k != v143; ++k)
          {
            if (*(_QWORD *)v198 != v144)
              objc_enumerationMutation(v142);
            v146 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * k);
            v147 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(v196, "objectForKeyedSubscript:", v146);
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObjectsFromArray:](v138, "addObjectsFromArray:", v148);

            objc_autoreleasePoolPop(v147);
          }
          v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v197, v219, 16);
        }
        while (v143);
      }

      if (-[NSObject count](v138, "count"))
      {
        v149 = objc_alloc(MEMORY[0x1E0D70AD0]);
        objc_msgSend(v162, "timestamp");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "clientIdentifier");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "clientBundleId");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "mappingId");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v154 = (void *)objc_msgSend(v149, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v138, v150, v151, v152, v153);

        +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v154, 1, 1, 1);
      }
      goto LABEL_138;
    }
    v64 = objc_alloc(MEMORY[0x1E0D70AD0]);
    objc_msgSend(v162, "timestamp");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "clientIdentifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "clientBundleId");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "mappingId");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v64, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v160, v65, v66, v67, v68);

    +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v69, 1, 2, 1);
    objc_msgSend(v162, "clientBundleId");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v162, "clientIdentifier");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPFeedbackUtils recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:](PPFeedbackUtils, "recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:", v162, v160, v70, v71, 1);

    v72 = v69;
    v157 = v72;
    if (self)
    {
      objc_msgSend(v72, "clientBundleId");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = +[PPFeedbackUtils shouldSample:](PPFeedbackUtils, "shouldSample:", v73);

      if (v74)
      {
        oslog = (os_log_t)objc_opt_new();
        -[NSObject setPredictionType:](oslog, "setPredictionType:", 2);
        +[PPFeedbackUtils feedbackMetadataForBaseFeedback:](PPFeedbackUtils, "feedbackMetadataForBaseFeedback:", v157);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setFeedbackMetadata:](oslog, "setFeedbackMetadata:", v75);

        v213 = 0;
        v166 = v157;
        v76 = (void *)objc_opt_new();
        v77 = (void *)objc_opt_new();
        v216 = 0u;
        v217 = 0u;
        v214 = 0u;
        v215 = 0u;
        objc_msgSend(v166, "feedbackItems");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v214, v232, 16);
        if (v79)
        {
          v80 = *(_QWORD *)v215;
          do
          {
            for (m = 0; m != v79; ++m)
            {
              if (*(_QWORD *)v215 != v80)
                objc_enumerationMutation(v78);
              v82 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * m);
              objc_msgSend(v82, "itemString");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "addObject:", v83);

              objc_msgSend(v82, "itemString");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "setObject:forKeyedSubscript:", v82, v84);

            }
            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v214, v232, 16);
          }
          while (v79);
        }

        objc_msgSend(v166, "timestamp");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "timeIntervalSince1970");
        -[PPLocalNamedEntityStore namedEntityToMatchedStringMappingForNamedEntities:timestamp:error:](self, "namedEntityToMatchedStringMappingForNamedEntities:timestamp:error:", v76, &v213);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        v179 = (void *)objc_opt_new();
        v231 = 0u;
        v230 = 0u;
        v229 = 0u;
        *(_OWORD *)buf = 0u;
        v87 = v86;
        v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", buf, &v224, 16);
        if (v88)
        {
          v89 = *(_QWORD *)v229;
          do
          {
            for (n = 0; n != v88; ++n)
            {
              if (*(_QWORD *)v229 != v89)
                objc_enumerationMutation(v87);
              v91 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * n);
              objc_msgSend(v87, "objectForKeyedSubscript:", v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "objectForKeyedSubscript:", v91);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v179, "setObject:forKeyedSubscript:", v92, v93);

            }
            v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", buf, &v224, 16);
          }
          while (v88);
        }

        v94 = v213;
        v156 = v179 != 0;
        v155 = v94;
        if (v179)
        {
          log = -[PPFeatureRedactor initWithTrialWrapper:namespaceName:]([PPFeatureRedactor alloc], "initWithTrialWrapper:namespaceName:", self->_trialWrapper, CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
          v211 = 0u;
          v212 = 0u;
          v209 = 0u;
          v210 = 0u;
          v170 = v179;
          v168 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v209, &v220, 16);
          if (!v168)
          {
            v163 = 0;
            goto LABEL_119;
          }
          v163 = 0;
          v164 = *(_QWORD *)v210;
          v95 = *MEMORY[0x1E0D70EA8];
          v96 = v95;
          while (1)
          {
            for (ii = 0; ii != v168; ++ii)
            {
              if (*(_QWORD *)v210 != v164)
                objc_enumerationMutation(v170);
              v97 = *(_QWORD *)(*((_QWORD *)&v209 + 1) + 8 * ii);
              +[PPFeedbackUtils feedbackItemForPPFeedbackItem:](PPFeedbackUtils, "feedbackItemForPPFeedbackItem:", v97);
              obja = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v170, "objectForKeyedSubscript:", v97);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v166, "clientBundleId");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              v174 = log;
              v100 = v98;
              v183 = v99;
              v192 = v100;
              -[PPNamedEntityStorage decayedFeedbackCountsForClusterIdentifier:](self->_storage, "decayedFeedbackCountsForClusterIdentifier:", v100);
              v175 = (void *)objc_claimAutoreleasedReturnValue();
              +[PPStreamingNamedEntityScorer scoreInterpreterAggregationBytecode](PPStreamingNamedEntityScorer, "scoreInterpreterAggregationBytecode");
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              +[PPStreamingNamedEntityScorer scoreInterpreterFinalBytecode](PPStreamingNamedEntityScorer, "scoreInterpreterFinalBytecode");
              contexta = (void *)objc_claimAutoreleasedReturnValue();
              v101 = 0;
              if (v194 && contexta)
              {
                v102 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:](PPStreamingNamedEntityScorer, "sourceStatsNeededForBytecode:", v194);
                v101 = +[PPStreamingNamedEntityScorer sourceStatsNeededForBytecode:](PPStreamingNamedEntityScorer, "sourceStatsNeededForBytecode:", contexta) | v102;
              }
              -[PPNamedEntityStorage sourceStats:withExcludedAlgorithms:](self->_storage, "sourceStats:withExcludedAlgorithms:", v101, 0);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              v188 = (void *)objc_opt_new();
              v103 = (void *)objc_opt_new();
              v104 = (void *)MEMORY[0x1C3BD6630]();
              v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v192, 0);
              objc_autoreleasePoolPop(v104);
              objc_msgSend(v103, "setMatchingNames:", v105);

              objc_msgSend(v103, "setScoringDate:", v188);
              *(_QWORD *)&v214 = 0;
              -[PPLocalNamedEntityStore namedEntityRecordsWithQuery:error:](self, "namedEntityRecordsWithQuery:error:", v103, &v214);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = (id)v214;
              v172 = v107;
              if (v106)
              {
                v108 = objc_alloc(MEMORY[0x1E0D70BC0]);
                objc_msgSend(v106, "firstObject");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v109, "entity");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v110, "name");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v111, "lowercaseString");
                v112 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "firstObject");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v113, "entity");
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "bestLanguage");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                v116 = objc_msgSend(v108, "initWithName:category:dynamicCategory:language:mostRelevantRecord:", v112, 0, 0, v115, 0);

                v117 = -[PPStreamingNamedEntityScorer initWithScoringDate:perRecordDecayRate:sourceStats:]([PPStreamingNamedEntityScorer alloc], "initWithScoringDate:perRecordDecayRate:sourceStats:", v188, v177, v96);
                v118 = (id)objc_opt_self();
                v119 = (id)objc_opt_self();
                objc_msgSend(v106, "firstObject");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject name](v116, "name");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                -[PPStreamingNamedEntityScorer startNewClusterWithDecayedFeedbackCounts:mostRelevantRecord:dominantEntityName:](v117, "startNewClusterWithDecayedFeedbackCounts:mostRelevantRecord:dominantEntityName:", v175, v120, v121);

                v226 = 0u;
                v227 = 0u;
                v224 = 0u;
                v225 = 0u;
                v122 = v106;
                v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v224, v232, 16);
                if (v123)
                {
                  v124 = *(_QWORD *)v225;
                  do
                  {
                    for (jj = 0; jj != v123; ++jj)
                    {
                      if (*(_QWORD *)v225 != v124)
                        objc_enumerationMutation(v122);
                      -[PPStreamingNamedEntityScorer addRecord:](v117, "addRecord:", *(_QWORD *)(*((_QWORD *)&v224 + 1) + 8 * jj));
                    }
                    v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v224, v232, 16);
                  }
                  while (v123);
                }

                *(_QWORD *)buf = 0;
                v218 = 0;
                -[PPStreamingNamedEntityScorer getFinalScoreWithAggregationResultOut:finalResultOut:](v117, "getFinalScoreWithAggregationResultOut:finalResultOut:", buf, &v218);
                v127 = v126;
                v128 = objc_alloc(MEMORY[0x1E0D81638]);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v127);
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                v130 = (void *)objc_msgSend(v128, "initWithFirst:second:", v129, *(_QWORD *)buf);

              }
              else
              {
                v163 = objc_retainAutorelease(v107);
                pp_entities_log_handle();
                v116 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(sel_getScoredNamedEntityFeaturesWithNamedEntity_excludingSourceBundleId_decayRate_error_);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v232 = 138412546;
                  v233 = v137;
                  v234 = 2112;
                  v235 = v163;
                  _os_log_error_impl(&dword_1C392E000, v116, OS_LOG_TYPE_ERROR, "error %@: %@", v232, 0x16u);

                }
                v130 = 0;
              }

              if (v130)
              {
                objc_msgSend(v130, "second");
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                +[PPFeedbackUtils featuresForScoreDict:](PPFeedbackUtils, "featuresForScoreDict:", v131);
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                v133 = objc_msgSend(v132, "mutableCopy");

                if (v133)
                {
                  -[PPFeatureRedactor transformFeaturesInPlace:](v174, "transformFeaturesInPlace:", v133);
                  objc_msgSend(v130, "first");
                  v134 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v134, "floatValue");
                  +[PPFeedbackUtils scoredItemWithFeaturesForFeatureDictionary:score:](PPFeedbackUtils, "scoredItemWithFeaturesForFeatureDictionary:score:", v133);
                  v135 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_108;
                }
                pp_entities_log_handle();
                v136 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v232 = 0;
                  _os_log_error_impl(&dword_1C392E000, v136, OS_LOG_TYPE_ERROR, "nil result from +[PPRecordFeaturizer featuresForScoreDict]", v232, 2u);
                }

                v133 = 0;
              }
              else
              {
                pp_entities_log_handle();
                v133 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v232 = 138412290;
                  v233 = v163;
                  _os_log_error_impl(&dword_1C392E000, v133, OS_LOG_TYPE_ERROR, "nil result from getScoredNamedEntityFeaturesWithNamedEntity: %@", v232, 0xCu);
                }
              }
              v135 = 0;
LABEL_108:

              objc_msgSend(v135, "addFeedbackItems:", obja);
              -[NSObject addScoredItems:](oslog, "addScoredItems:", v135);

            }
            v168 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v209, &v220, 16);
            if (!v168)
            {
LABEL_119:

              +[PPFeedbackUtils addBoilerplateToFeedbackLog:](PPFeedbackUtils, "addBoilerplateToFeedbackLog:", oslog);
              objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v139, "logMessage:", oslog);

              goto LABEL_123;
            }
          }
        }
        if (v94)
          v163 = objc_retainAutorelease(v94);
        else
          v163 = 0;
        pp_entities_log_handle();
        log = (PPFeatureRedactor *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&log->super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v232 = 138412290;
          v233 = v155;
          _os_log_error_impl(&dword_1C392E000, &log->super, OS_LOG_TYPE_ERROR, "logFeedbackSessionsWithFeedback: nil result from getMatchedNamedEntityForFeedback: %@", v232, 0xCu);
        }
LABEL_123:

      }
      else
      {
        pp_default_log_handle();
        oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v232 = 0;
          _os_log_debug_impl(&dword_1C392E000, oslog, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: No feedback session logs collection performed due to sampling.", v232, 2u);
        }
        v163 = 0;
        v156 = 1;
      }

      v140 = v163;
      if (v156)
        goto LABEL_128;
    }
    else
    {

      v140 = 0;
    }
    pp_entities_log_handle();
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v232 = 138412290;
      v233 = v158;
      _os_log_error_impl(&dword_1C392E000, v141, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: feedback logging failed: %@", v232, 0xCu);
    }

LABEL_128:
    -[PPNamedEntityStorage donateNamedEntityFeedback:](self->_storage, "donateNamedEntityFeedback:", v157);

    goto LABEL_129;
  }
  pp_default_log_handle();
  v138 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v232 = 138412290;
    v233 = v158;
    _os_log_error_impl(&dword_1C392E000, v138, OS_LOG_TYPE_ERROR, "processFeedbackItems: error from iterNamedEntityRecordsWithQuery: %@", v232, 0xCu);
  }
LABEL_138:

  _Block_object_dispose(v207, 8);
}

- (id)namedEntityToMatchedStringMappingForNamedEntities:(id)a3 timestamp:(double)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD aBlock[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", a4);
  objc_msgSend(v9, "setScoringDate:", v10);
  objc_msgSend(v9, "setToDate:", v10);
  objc_msgSend(v9, "setOrderByName:", 1);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__5387;
  v31[4] = __Block_byref_object_dispose__5388;
  v32 = 0;
  v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v8);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5387;
  v29 = __Block_byref_object_dispose__5388;
  v30 = 0;
  v30 = (id)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__PPLocalNamedEntityStore_namedEntityToMatchedStringMappingForNamedEntities_timestamp_error___block_invoke;
  aBlock[3] = &unk_1E7E20048;
  aBlock[4] = v31;
  aBlock[5] = &v25;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__5387;
  v22[4] = __Block_byref_object_dispose__5388;
  v23 = 0;
  v20 = v22;
  v21 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__PPLocalNamedEntityStore_namedEntityToMatchedStringMappingForNamedEntities_timestamp_error___block_invoke_2;
  v18[3] = &unk_1E7E17668;
  v11 = _Block_copy(aBlock);
  v19 = v11;
  v12 = -[PPLocalNamedEntityStore iterNamedEntityRecordsWithQuery:error:block:](self, "iterNamedEntityRecordsWithQuery:error:block:", v9, &v21, v18);
  v13 = v21;
  v14 = v13;
  if (v12)
  {
    v15 = (id)v26[5];
  }
  else
  {
    if (a5 && v13)
      *a5 = objc_retainAutorelease(v13);
    pp_entities_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v14;
      _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "namedEntityToMatchedStringMappingForNamedEntities: error from iterNamedEntityRecordsWithQuery: %@", buf, 0xCu);
    }

    v15 = 0;
  }

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
  return v15;
}

- (BOOL)filterExistingNamedEntitiesWithShouldContinueBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  void *v6;
  PPNamedEntityStorage *storage;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  int v12;
  char v13;
  NSObject *v14;
  void *v16;
  PPNamedEntityStorage *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  PPNamedEntityStorage *v31;
  NSObject *v32;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  NSObject *v39;
  uint8_t *v40;
  NSObject *v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  id v48;
  uint8_t v49[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = (void *)objc_opt_new();
  if ((v4[2](v4) & 1) != 0)
  {
    -[PPTrialWrapper lastTreatmentUpdateForNamespaceName:](self->_trialWrapper, "lastTreatmentUpdateForNamespaceName:", CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    storage = self->_storage;
    v48 = 0;
    -[PPNamedEntityStorage namedEntityFilterLastRunDateWithError:](storage, "namedEntityFilterLastRunDateWithError:", &v48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v48;
    if (v6)
      v10 = 1;
    else
      v10 = v8 == 0;
    if (v10)
    {
      if (!v8
        || (objc_msgSend(v6, "earlierDate:", v8),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "isEqualToDate:", v6),
            v11,
            !v12))
      {
        if ((v4[2](v4) & 1) != 0)
        {
          *(_QWORD *)buf = 0;
          v43 = buf;
          v44 = 0x3032000000;
          v45 = __Block_byref_object_copy__5387;
          v46 = __Block_byref_object_dispose__5388;
          v47 = 0;
          v47 = (id)objc_opt_new();
          v16 = (void *)objc_opt_new();
          if ((v4[2](v4) & 1) != 0)
          {
            v17 = self->_storage;
            v18 = (void *)objc_opt_new();
            v41 = v9;
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __78__PPLocalNamedEntityStore_filterExistingNamedEntitiesWithShouldContinueBlock___block_invoke;
            v37[3] = &unk_1E7E17690;
            v39 = v4;
            v38 = v16;
            v40 = buf;
            -[PPNamedEntityStorage iterNamedEntityRecordsAndIdsWithQuery:error:block:](v17, "iterNamedEntityRecordsAndIdsWithQuery:error:block:", v18, &v41, v37);
            v19 = v41;

            if (objc_msgSend(*((id *)v43 + 5), "count"))
            {
              pp_entities_log_handle();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                v21 = objc_msgSend(*((id *)v43 + 5), "count");
                *(_DWORD *)v49 = 134217984;
                v50 = v21;
                _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: dropping %tu named entities", v49, 0xCu);
              }

              v35 = v19;
              v36 = 0;
              v22 = -[PPNamedEntityStorage deleteNamedEntitiesMatchingRowIds:atLeastOneNamedEntityRemoved:deletedCount:error:](self->_storage, "deleteNamedEntitiesMatchingRowIds:atLeastOneNamedEntityRemoved:deletedCount:error:", *((_QWORD *)v43 + 5), 0, &v36, &v35);
              v23 = v35;

              if (!v22)
              {
                pp_entities_log_handle();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v49 = 138412290;
                  v50 = (uint64_t)v23;
                  _os_log_error_impl(&dword_1C392E000, v24, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: error in dropping the named entities: %@", v49, 0xCu);
                }

              }
              v25 = v36;
              if (v25 != objc_msgSend(*((id *)v43 + 5), "count"))
              {
                pp_entities_log_handle();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  v27 = objc_msgSend(*((id *)v43 + 5), "count");
                  *(_DWORD *)v49 = 134218240;
                  v50 = v27;
                  v51 = 2048;
                  v52 = v36;
                  _os_log_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: dropped a different number of named entities than was expected. Expected %tu, found %tu", v49, 0x16u);
                }

              }
            }
            else
            {
              pp_entities_log_handle();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v49 = 0;
                _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore: no named entities to drop.", v49, 2u);
              }

              v23 = v19;
            }
            v31 = self->_storage;
            v34 = v23;
            v13 = -[PPNamedEntityStorage setNamedEntityFilterLastRunDate:error:](v31, "setNamedEntityFilterLastRunDate:error:", v5, &v34);
            v9 = v34;

            if ((v13 & 1) != 0)
            {
              pp_entities_log_handle();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v49 = 0;
                _os_log_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: completed pruning of database for new filter.", v49, 2u);
              }
            }
            else
            {
              pp_entities_log_handle();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v49 = 138412290;
                v50 = (uint64_t)v9;
                _os_log_error_impl(&dword_1C392E000, v32, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: unable to update the last runtime of the named entity filter. %@", v49, 0xCu);
              }
            }

            v29 = v39;
          }
          else
          {
            pp_entities_log_handle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v49 = 0;
              _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: deferring filtering of named entities after constructing filter.", v49, 2u);
            }
            v13 = 0;
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          pp_entities_log_handle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: deferring filtering of named entiies before filtering operation.", buf, 2u);
          }

          v13 = 0;
        }
        goto LABEL_47;
      }
      pp_entities_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: not running filter as there is no need.", buf, 2u);
      }
    }
    else
    {
      pp_entities_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: has previously run filter on default assets in the build.", buf, 2u);
      }
    }

    v13 = 1;
LABEL_47:

    goto LABEL_48;
  }
  pp_entities_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: deferring filtering of named entities before processing.", buf, 2u);
  }
  v13 = 0;
LABEL_48:

  return v13;
}

- (void)runWithLockAcquired:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PPLocalNamedEntityStore_runWithLockAcquired___block_invoke;
  v7[3] = &unk_1E7E17708;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (PPNamedEntityStorage)storage
{
  return self->_storage;
}

- (NSString)invalidationNotificationOverride
{
  return self->_invalidationNotificationOverride;
}

- (void)setInvalidationNotificationOverride:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationNotificationOverride, a3);
}

- (NSString)meaningfulChangeNotificationOverride
{
  return self->_meaningfulChangeNotificationOverride;
}

- (void)setMeaningfulChangeNotificationOverride:(id)a3
{
  objc_storeStrong((id *)&self->_meaningfulChangeNotificationOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningfulChangeNotificationOverride, 0);
  objc_storeStrong((id *)&self->_invalidationNotificationOverride, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_mapsPrefetchQueue, 0);
  objc_storeStrong((id *)&self->_lazyContactStoreForMapsFeedback, 0);
  objc_storeStrong((id *)&self->_topicStoreForNamedEntityMapping, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

uint64_t __47__PPLocalNamedEntityStore_runWithLockAcquired___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __78__PPLocalNamedEntityStore_filterExistingNamedEntitiesWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAcceptableRecord:", v7) & 1) == 0)
    {
      pp_entities_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = 134217984;
        v11 = a3;
        _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: filtering named entity with row id %lli", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addIndex:", a3);
    }
  }
  else
  {
    pp_entities_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPLocalNamedEntityStore: deferring filtering in progress.", (uint8_t *)&v10, 2u);
    }

    *a4 = 1;
  }

}

void __93__PPLocalNamedEntityStore_namedEntityToMatchedStringMappingForNamedEntities_timestamp_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"))
  {
    v6 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
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
          v13 = (void *)MEMORY[0x1C3BD6630](v8);
          objc_msgSend(v5, "rangeOfString:options:", v12, 1, (_QWORD)v15);
          if (v14)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v5, v12);
            objc_msgSend(v6, "addObject:", v12);
          }
          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v9 = v8;
      }
      while (v8);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "minusSet:", v6);
  }
  else
  {
    *a3 = 1;
  }

}

void __93__PPLocalNamedEntityStore_namedEntityToMatchedStringMappingForNamedEntities_timestamp_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clusterIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = (void *)v6;
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v17, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clusterIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v17, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clusterIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v15 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v17, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v15 + 16))(v15, v16, a3);

LABEL_4:
  }

}

void __43__PPLocalNamedEntityStore_processFeedback___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BYTE *v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clusterIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clusterIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    if ((v11 & 1) == 0)
    {
      v29 = a3;
      objc_msgSend(v5, "entity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clusterIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v31 = (void *)objc_opt_new();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = *(id *)(a1 + 32);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            v21 = (void *)MEMORY[0x1C3BD6630]();
            v22 = v5;
            objc_msgSend(v5, "entity");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "name");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "rangeOfString:options:", v20, 1);
            v26 = v25;

            if (v26)
            {
              v27 = *(void **)(a1 + 40);
              objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v20);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObjectsFromArray:", v28);

              objc_msgSend(v31, "addObject:", v20);
            }
            objc_autoreleasePoolPop(v21);
            v5 = v22;
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v17);
      }

      objc_msgSend(*(id *)(a1 + 32), "minusSet:", v31);
      if (!objc_msgSend(*(id *)(a1 + 32), "count"))
        *v29 = 1;

    }
  }
  else
  {

  }
}

void __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPEventKitImporter: failed to donate map item for location name."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

void __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_260(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPLocationNamedEntities: failed to donate map item for unstructured location."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

void __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_264(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPLocationNamedEntities: failed to donate entities."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

void __78__PPLocalNamedEntityStore_donateLocationNamedEntities_bundleId_groupId_error___block_invoke_267(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(v3, "setErrorMessage:", CFSTR("PPLocationNamedEntities: failed to donate locations."));
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackScalarForMessage:", v3);

}

BOOL __46__PPLocalNamedEntityStore_cloudSyncWithError___block_invoke(uint64_t a1)
{
  double v1;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  return v1 > -600.0;
}

uint64_t __46__PPLocalNamedEntityStore_cloudSyncWithError___block_invoke_253()
{
  return 1;
}

void __51__PPLocalNamedEntityStore_flushDonationsWithError___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  pp_entities_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "Flushing donations", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3[8];
  v3[8] = 0;

}

void __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id *v10;

  v10 = a2;
  objc_msgSend(v10[2], "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterScoredNamedEntities:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v4;
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = MEMORY[0x1E0C9AA60];
  }

}

void __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t buf[16];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDonationSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", v3));

  objc_msgSend(v2, "setAlgorithm:", +[PPMetricsUtils mapNamedEntityAlgorithmForPET2:](PPMetricsUtils, "mapNamedEntityAlgorithmForPET2:", *(_QWORD *)(a1 + 64)));
  objc_msgSend(*(id *)(a1 + 32), "groupId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGroupId:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "concatenatedTreatmentNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActiveTreatments:", v6);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackDistributionForMessage:value:", v2, (double)(unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));

  v8 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDetectedLanguage:", v9);

  objc_msgSend(MEMORY[0x1E0D70D00], "currentLocaleLanguageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSystemLanguage:", v10);

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLanguageCount:", objc_msgSend(v11, "count"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "concatenatedTreatmentNames");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveTreatments:", v12);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackScalarForMessage:", v8);

  v14 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "concatenatedTreatmentNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActiveTreatments:", v15);

  v16 = *(_QWORD *)(a1 + 72);
  v17 = v16 - objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trackDistributionForMessage:value:", v14, (double)v17);

  if (*(_QWORD *)(a1 + 64) != 16)
    return;
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  if (!v19)
    goto LABEL_27;
  v21 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "differentiallyPrivateEntityLogLevels");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Extraction.low"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v21, "initWithArray:", v24);

  v26 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "differentiallyPrivateEntityLogLevels");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("Extraction.medium"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v26, "initWithArray:", v29);

  v30 = objc_alloc(MEMORY[0x1E0C99E60]);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "differentiallyPrivateEntityLogLevels");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Extraction.high"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v30, "initWithArray:", v33);

  v54 = (void *)objc_opt_new();
  v52 = (void *)objc_opt_new();
  v49 = v20;
  v50 = (void *)objc_opt_new();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v34 = v20;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  if (!v35)
    goto LABEL_24;
  v36 = v35;
  v37 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v36; ++i)
    {
      if (*(_QWORD *)v57 != v37)
        objc_enumerationMutation(v34);
      v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      v40 = (void *)MEMORY[0x1E0D70BC0];
      objc_msgSend(v39, "item", v49);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "describeCategory:", objc_msgSend(v41, "category"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "item");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "dynamicCategory");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v25, "containsObject:", v42) & 1) != 0)
      {
LABEL_11:
        objc_msgSend(v39, "item");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v54;
LABEL_21:
        objc_msgSend(v47, "addObject:", v46);

        goto LABEL_22;
      }
      if (v44)
      {
        if (objc_msgSend(v25, "containsObject:", v44))
          goto LABEL_11;
        if ((objc_msgSend(v53, "containsObject:", v42) & 1) != 0
          || objc_msgSend(v53, "containsObject:", v44))
        {
LABEL_17:
          objc_msgSend(v39, "item");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "name");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v52;
          goto LABEL_21;
        }
        if ((objc_msgSend(v51, "containsObject:", v42) & 1) != 0
          || objc_msgSend(v51, "containsObject:", v44))
        {
          goto LABEL_20;
        }
      }
      else
      {
        if ((objc_msgSend(v53, "containsObject:", v42) & 1) != 0)
          goto LABEL_17;
        if ((objc_msgSend(v51, "containsObject:", v42) & 1) != 0)
        {
LABEL_20:
          objc_msgSend(v39, "item");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "name");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v50;
          goto LABEL_21;
        }
      }
LABEL_22:

    }
    v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
  }
  while (v36);
LABEL_24:

  -[PPLocalNamedEntityStore _logDifferentiallyPrivateExtractionsWithDpCategory:extractions:](CFSTR("Extraction.low"), v54);
  -[PPLocalNamedEntityStore _logDifferentiallyPrivateExtractionsWithDpCategory:extractions:](CFSTR("Extraction.medium"), v52);
  -[PPLocalNamedEntityStore _logDifferentiallyPrivateExtractionsWithDpCategory:extractions:](CFSTR("Extraction.high"), v50);
  pp_entities_log_handle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v48, OS_LOG_TYPE_INFO, "PPLocalNamedEntityStore: completed logging of entities to differential privacy.", buf, 2u);
  }

  v20 = v49;
LABEL_27:

}

void __95__PPLocalNamedEntityStore_donateNamedEntities_source_algorithm_cloudSync_sentimentScore_error___block_invoke_240(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 8) = 1;
}

- (void)_logDifferentiallyPrivateExtractionsWithDpCategory:(void *)a1 extractions:(void *)a2
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "initWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.PersonalizationPortrait.NamedEntity"), v3, v7);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", v8);
    objc_msgSend(v9, "record:", v4);
    pp_private_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v12 = objc_msgSend(v4, "count");
      v13 = 2112;
      v14 = v3;
      _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: logged %tu items of type %@", buf, 0x16u);
    }

  }
  else
  {
    pp_private_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = (uint64_t)v3;
      _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "PPLocalNamedEntityStore: not logging any extractions matching %@", buf, 0xCu);
    }
  }

}

void __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 24), "result");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v11, "count"))
  {
    v7 = *MEMORY[0x1E0D70EA8];
    *(float *)&v7 = *MEMORY[0x1E0D70EA8];
    LODWORD(v6) = 0;
    objc_msgSend(*(id *)(a1 + 32), "scoredEntityFromRecords:scoringDate:perRecordDecayRate:decayRate:sourceStats:decayedFeedbackCounts:streamingScorer:mlModel:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40, 0, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id *)(a1 + 56);
    objc_sync_enter(v9);
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
      v10 = a1 + 80;
    }
    else
    {
      v10 = a1 + 72;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v10 + 8) + 24);
    objc_sync_exit(v9);

  }
}

void __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint8_t buf[16];
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  id v44;
  id v45;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v3, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clusterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "isEqualToString:", v6);

  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if ((v4 & 1) == 0)
  {
    v8 = v7;
    v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (!objc_msgSend(v8, "count"))
      goto LABEL_9;
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "use2StageScoreInterpreterForNEScoring"))
    {

    }
    else
    {
      +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "namedEntityScoringUsesHybrid");

      if (!v12)
      {
        if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", *(_QWORD *)(a1 + 32), 0.0))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_9:
          v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;

          objc_msgSend(v3, "entity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "clusterIdentifier");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v21 = *(void **)(v20 + 40);
          *(_QWORD *)(v20 + 40) = v19;

          objc_msgSend(v3, "entity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "clusterIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
            {
LABEL_16:

              goto LABEL_17;
            }
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 56), "decayedFeedbackCountsForClusterIdentifier:");
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
            v26 = *(void **)(v25 + 40);
            *(_QWORD *)(v25 + 40) = v24;
          }
          else
          {
            pp_default_log_handle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1C392E000, v27, OS_LOG_TYPE_FAULT, "Named entity record unexpectedly had nil cluster identifier while aggregating for scoring.", buf, 2u);
            }

            v28 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
            v29 = *(void **)(v28 + 40);
            *(_QWORD *)(v28 + 40) = 0;

            v26 = (void *)objc_opt_new();
            objc_msgSend(v26, "UUIDString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lowercaseString");
            v31 = objc_claimAutoreleasedReturnValue();
            v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v33 = *(void **)(v32 + 40);
            *(_QWORD *)(v32 + 40) = v31;

          }
          goto LABEL_16;
        }
        v34 = *(NSObject **)(a1 + 40);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_3;
        v36[3] = &unk_1E7E1D000;
        v40 = *(id *)(a1 + 56);
        v37 = v8;
        v38 = v9;
        v39 = *(id *)(a1 + 32);
        dispatch_async(v34, v36);

        v14 = v40;
LABEL_8:

        goto LABEL_9;
      }
    }
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", *(_QWORD *)(a1 + 32));
    v13 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_2_221;
    block[3] = &unk_1E7E1D000;
    v45 = *(id *)(a1 + 56);
    v42 = v8;
    v43 = v9;
    v44 = *(id *)(a1 + 32);
    dispatch_async(v13, block);

    v14 = v45;
    goto LABEL_8;
  }
  objc_msgSend(v7, "addObject:", v3);
LABEL_17:

}

uint64_t __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_223(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

void __86__PPLocalNamedEntityStore__petLoggingForQuery_resultCount_clientProcessName_hasError___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_opt_new();
  objc_msgSend(v9, "setBundleId:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    v3 = (unint64_t)log10((double)v2);
  else
    v3 = 0;
  objc_msgSend(v9, "setResultSizeLog10:", v3);
  objc_msgSend(*(id *)(a1 + 40), "scoringDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeSpec:", v4 != 0);

  objc_msgSend(v9, "setLimitHit:", *(_QWORD *)(a1 + 56) > (unint64_t)objc_msgSend(*(id *)(a1 + 40), "limit"));
  objc_msgSend(*(id *)(a1 + 40), "fromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeLimited:", v5 != 0);

  objc_msgSend(*(id *)(a1 + 40), "excludingSourceBundleIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExclusionSpec:", objc_msgSend(v6, "count") != 0);

  objc_msgSend(v9, "setError:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "concatenatedTreatmentNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActiveTreatments:", v7);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackScalarForMessage:", v9);

}

intptr_t __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_2_221(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __80__PPLocalNamedEntityStore_rankedNamedEntitiesWithQuery_error_clientProcessName___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

BOOL __150__PPLocalNamedEntityStore__defaultScoredEntityFromRecords_scoringDate_perRecordDecayRate_decayRate_sourceStats_decayedFeedbackCounts_streamingScorer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "category") == *(_QWORD *)(a1 + 32);

  return v4;
}

uint64_t __150__PPLocalNamedEntityStore__defaultScoredEntityFromRecords_scoringDate_perRecordDecayRate_decayRate_sourceStats_decayedFeedbackCounts_streamingScorer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __58__PPLocalNamedEntityStore__dominantEntityNameFromRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "localizedCapitalizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  objc_msgSend(v5, "localizedCapitalizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToString:", v9);

  v11 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);
  v12 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v5);

  if (v8 && !v10)
    return 1;
  if (v11 < v12)
    v14 = -1;
  else
    v14 = 1;
  if (v11 == v12)
    v14 = 0;
  if ((v10 ^ 1 | v8) == 1)
    return v14;
  else
    return -1;
}

uint64_t __62__PPLocalNamedEntityStore__dominantEntityCategoryFromRecords___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  v9 = -1;
  if (v7 >= v8)
    v9 = 1;
  if (v7 == v8)
    return 0;
  else
    return v9;
}

uint64_t __61__PPLocalNamedEntityStore_namedEntityRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD6630]();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        if (*(_BYTE *)(v8 + 24))
        {
          v9 = 1;
        }
        else
        {
          v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          v9 = v10 == objc_msgSend(*(id *)(a1 + 32), "limit", (_QWORD)v11);
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        }
        *(_BYTE *)(v8 + 24) = v9;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v5)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeAllObjects", (_QWORD)v11);
  objc_autoreleasePoolPop(v2);
}

uint64_t __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "category");

  if ((v5 | 4) == 0xC)
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v3, "entity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v7);
    v11 = objc_msgSend(v6, "containsObject:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __71__PPLocalNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  int v6;
  id v7;

  v5 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v7 = v5;
  if (*(_BYTE *)(a1 + 80) && (v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))(), v5 = v7, v6))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v5);
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count") == 64)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v5 = v7;
  }

}

id __31__PPLocalNamedEntityStore_init__block_invoke()
{
  return +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
}

PPNamedEntityFilter *__120__PPLocalNamedEntityStore_initWithStorage_topicStoreForNamedEntityMapping_lazyContactStoreForMapsFeedback_trialWrapper___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  PPNamedEntityFilter *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v7 = 0;
  objc_msgSend(v1, "mlModelForModelName:namespaceName:error:", CFSTR("PPModel_NE_Filtering.mlmodelc"), CFSTR("PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"), &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (!v2)
  {
    pp_entities_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPLocalNamedEntityStore: unable to fetch filtering model from Trial. %@", buf, 0xCu);
    }

  }
  v5 = -[PPNamedEntityFilter initWithModel:]([PPNamedEntityFilter alloc], "initWithModel:", v2);

  return v5;
}

void __120__PPLocalNamedEntityStore_initWithStorage_topicStoreForNamedEntityMapping_lazyContactStoreForMapsFeedback_trialWrapper___block_invoke_177(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  __int16 v4[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "removeAllObjects");
    pp_entities_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "Invalidating all caches as a result of named entity namespace update.", (uint8_t *)v4, 2u);
    }

  }
}

+ (void)sortAndTruncate:(id)a3 queryLimit:(unint64_t)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_210);
  if (objc_msgSend(v5, "count") > a4)
    objc_msgSend(v5, "removeObjectsInRange:", a4, objc_msgSend(v5, "count") - a4);

}

+ (id)recordsForNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v15 = (void *)objc_opt_new();
        objc_msgSend(v14, "item");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEntity:", v16);

        objc_msgSend(v14, "score");
        objc_msgSend(v15, "setInitialScore:");
        objc_msgSend(v15, "setSource:", v8);
        objc_msgSend(v15, "setAlgorithm:", a5);
        objc_msgSend(MEMORY[0x1E0D70D00], "osBuild");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setExtractionOsBuild:", v17);

        +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setExtractionAssetVersion:", objc_msgSend(v18, "treatmentsHash"));

        objc_msgSend(v9, "addObject:", v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v9;
}

+ (float)resolvedPerRecordDecayRateForFeatureProvider:(id)a3 perRecordDecayRate:(float)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double *v13;

  v5 = a3;
  v6 = v5;
  if (a4 < 0.0)
  {
    objc_msgSend(v5, "featureValueForName:", CFSTR("algorithm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "int64Value");

    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 0xA)
      goto LABEL_7;
    v9 = (void *)*MEMORY[0x1E0D70E28];
    objc_msgSend(v6, "featureValueForName:", CFSTR("source_bundleId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    v13 = (double *)((unint64_t)(v8 - 5) >= 3 ? MEMORY[0x1E0D70F00] : MEMORY[0x1E0D70F28]);
    if (v12)
LABEL_7:
      v13 = (double *)MEMORY[0x1E0D70F08];
    a4 = *v13;
  }
  if (a4 < 0.0)
    a4 = 0.0;

  return a4;
}

uint64_t __54__PPLocalNamedEntityStore_sortAndTruncate_queryLimit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0D70D00];
  v5 = a3;
  objc_msgSend(a2, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  v9 = v8;

  return objc_msgSend(v4, "reverseCompareDouble:withDouble:", v7, v9);
}

void __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v3 = (objc_class *)MEMORY[0x1E0D815E0];
  v4 = a2;
  v5 = [v3 alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke_2;
  v8[3] = &unk_1E7E198E8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v5, "initWithBlock:idleTimeout:", v8, 240.0);
  v7 = (void *)v4[3];
  v4[3] = v6;

}

void __56__PPLocalNamedEntityStore__registerMapsQueryPrefetching__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[6];

  pp_entities_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Running Maps search query prefetch.", (uint8_t *)v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 1);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke;
    v6[3] = &unk_1E7E176B8;
    v6[4] = v4;
    objc_msgSend(v5, "runWithLockAcquired:", v6);
  }

}

uint64_t __56__PPLocalNamedEntityStore__registerMapsQueryPrefetching__block_invoke_298(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  pp_entities_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "Maps launch event handler invoked", v4, 2u);
  }

  return objc_msgSend(MEMORY[0x1E0D81598], "runAsyncOnQueue:afterDelaySeconds:block:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40), 3.0);
}

id __57__PPLocalNamedEntityStore__generateMapsSearchQueryResult__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)os_transaction_create();
  pp_entities_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "Maps search query: cache miss", buf, 2u);
  }

  v4 = (void *)objc_opt_new();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapsSearchQueryFromDateInterval");
  objc_msgSend(v4, "dateByAddingTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "mapsSearchQueryLimit");

  objc_msgSend(MEMORY[0x1E0D70BD0], "locationQueryWithLimit:fromDate:consumerType:", v8, v6, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocationConsumer:", 0);
  v10 = *(void **)(a1 + 32);
  v17 = 0;
  objc_msgSend(v10, "rankedNamedEntitiesWithQuery:error:clientProcessName:", v9, &v17, CFSTR("suggestd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    pp_entities_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "Failed to prefetch Maps search query: %@", buf, 0xCu);
    }

    v13 = (id)objc_opt_new();
  }
  v15 = v13;

  return v15;
}

@end
