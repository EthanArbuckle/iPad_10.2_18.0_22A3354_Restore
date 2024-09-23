@implementation PPLocalLocationStore

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  BOOL v8;
  unint64_t v10;
  char v11;

  v11 = 0;
  v10 = 0;
  v8 = -[PPLocationStorage deleteAllLocationsFromSourcesWithBundleId:groupIds:atLeastOneLocationRemoved:deletedCount:error:](self->_storage, "deleteAllLocationsFromSourcesWithBundleId:groupIds:atLeastOneLocationRemoved:deletedCount:error:", a3, a4, &v11, &v10, a6);
  if (v11)
  {
    -[_PASLock runWithLockAcquired:](self->_cache, "runWithLockAcquired:", &__block_literal_global_167);
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a5)
    *a5 = v10;
  return v8;
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  BOOL v7;
  unint64_t v9;
  char v10;

  v10 = 0;
  v9 = 0;
  v7 = -[PPLocationStorage deleteAllLocationsFromSourcesWithBundleId:atLeastOneLocationRemoved:deletedCount:error:](self->_storage, "deleteAllLocationsFromSourcesWithBundleId:atLeastOneLocationRemoved:deletedCount:error:", a3, &v10, &v9, a5);
  if (v10)
  {
    -[_PASLock runWithLockAcquired:](self->_cache, "runWithLockAcquired:", &__block_literal_global_165);
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a4)
    *a4 = v9;
  return v7;
}

+ (id)defaultStore
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v8[16];

  pthread_mutex_lock(&defaultStore_lock_23872);
  if (!defaultStore_instance_23873)
  {
    v3 = objc_msgSend(objc_alloc((Class)a1), "_init");
    v4 = (void *)defaultStore_instance_23873;
    defaultStore_instance_23873 = v3;

    if (!defaultStore_instance_23873)
    {
      pp_locations_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPLocalLocationStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v8, 2u);
      }

    }
  }
  v6 = (id)defaultStore_instance_23873;
  pthread_mutex_unlock(&defaultStore_lock_23872);
  return v6;
}

- (PPLocalLocationStore)initWithStorage:(id)a3 trialWrapper:(id)a4
{
  id v8;
  id v9;
  PPLocalLocationStore *v10;
  PPLocalLocationStore *v11;
  id v12;
  PPLocationCache *v13;
  id v14;
  PPLocationCache *v15;
  uint64_t v16;
  _PASLock *cache;
  uint64_t v18;
  NSCache *modelCache;
  PPTrialWrapper *trialWrapper;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalLocationStore.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storage"));

  }
  v27.receiver = self;
  v27.super_class = (Class)PPLocalLocationStore;
  v10 = -[PPLocalLocationStore init](&v27, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_storage, a3);
    location = 0;
    objc_initWeak(&location, v11);
    v12 = objc_alloc(MEMORY[0x1E0D815F0]);
    v13 = [PPLocationCache alloc];
    v14 = objc_loadWeakRetained(&location);
    v15 = -[PPLocationCache initWithLocationStore:](v13, "initWithLocationStore:", v14);
    v16 = objc_msgSend(v12, "initWithGuardedData:", v15);
    cache = v11->_cache;
    v11->_cache = (_PASLock *)v16;

    v18 = objc_opt_new();
    modelCache = v11->_modelCache;
    v11->_modelCache = (NSCache *)v18;

    objc_storeStrong((id *)&v11->_trialWrapper, a4);
    trialWrapper = v11->_trialWrapper;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __53__PPLocalLocationStore_initWithStorage_trialWrapper___block_invoke;
    v24[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v25, &location);
    v21 = -[PPTrialWrapper addUpdateHandlerForNamespaceName:block:](trialWrapper, "addUpdateHandlerForNamespaceName:block:", CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"), v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (id)_init
{
  void *v3;
  PPLocationStorage *v4;
  void *v5;
  PPLocalLocationStore *v6;

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PPLocationStorage initWithDatabase:]([PPLocationStorage alloc], "initWithDatabase:", v3);
    if (v4)
    {
      +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[PPLocalLocationStore initWithStorage:trialWrapper:](self, "initWithStorage:trialWrapper:", v4, v5);

      v6 = self;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)donateLocations:(id)a3 source:(id)a4 contextualNamedEntities:(id)a5 algorithm:(unsigned __int16)a6 cloudSync:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  int v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  _BOOL4 v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  id v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id *v64;
  unsigned int v65;
  id v66;
  unsigned int v67;
  _QWORD v68[5];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  PPLocalLocationStore *v75;
  _QWORD block[4];
  id v77;
  PPLocalLocationStore *v78;
  uint8_t v79[128];
  _BYTE buf[24];
  void *v81;
  id v82;
  id v83;
  PPLocalLocationStore *v84;
  id v85;
  uint64_t v86;

  v9 = a7;
  v67 = a6;
  v86 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalLocationStore.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locations"));

  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalLocationStore.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

  }
  pp_locations_log_handle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(v14, "count");
    objc_msgSend(MEMORY[0x1E0D70B90], "describeAlgorithm:", v67);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v81 = v19;
    _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore received a donation of %tu locations from source: %@, algorithm: %@", buf, 0x20u);

  }
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "bundleIdentifierIsEnabledForDonation:", v21);

  if ((v22 & 1) == 0)
  {
    pp_locations_log_handle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v15, "bundleId");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v60;
      _os_log_debug_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEBUG, "PPLocalLocationStore suppressed location donation from disabled bundleId: %@", buf, 0xCu);

    }
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke;
    block[3] = &unk_1E7E1FCE8;
    v77 = v15;
    v78 = self;
    dispatch_async(v28, block);

    v29 = v77;
    goto LABEL_30;
  }
  if (v9)
  {
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "bundleIdentifierIsEnabledForCloudKit:", v24);

    if ((v25 & 1) != 0)
    {
      v26 = 1;
      goto LABEL_18;
    }
    pp_locations_log_handle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v15, "bundleId");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v61;
      _os_log_debug_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEBUG, "PPLocalLocationStore suppressed location cloudSync on donation from disabled bundleId: %@", buf, 0xCu);

    }
  }
  v26 = 0;
LABEL_18:
  if (!objc_msgSend(v14, "count"))
  {
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
    v40 = objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_126;
    v73[3] = &unk_1E7E1FCE8;
    v74 = v15;
    v75 = self;
    dispatch_async(v40, v73);

    v29 = v74;
LABEL_30:

    LOBYTE(v41) = 1;
    goto LABEL_38;
  }
  v65 = v26;
  v66 = v16;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v31 = v14;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v70;
    v64 = a8;
    while (2)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v70 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v36, "location");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "category") == 6)
        {

LABEL_32:
          -[_PASLock runWithLockAcquired:](self->_cache, "runWithLockAcquired:", &__block_literal_global_23815);
          a8 = v64;
          goto LABEL_33;
        }
        objc_msgSend(v36, "location");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "category");

        if (v39 == 5)
          goto LABEL_32;
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
      a8 = v64;
      if (v33)
        continue;
      break;
    }
  }

LABEL_33:
  v42 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_3;
  v68[3] = &unk_1E7E1FD50;
  v68[4] = self;
  objc_msgSend(v31, "_pas_filteredArrayWithTest:", v68);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v31, "count");
  v45 = objc_msgSend(v43, "count");
  pp_locations_log_handle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = v44 - v45;
    v48 = objc_msgSend(v31, "count");
    objc_msgSend(v15, "bundleId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v47;
    v42 = MEMORY[0x1E0C809B0];
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v48;
    *(_WORD *)&buf[22] = 2112;
    v81 = v49;
    _os_log_impl(&dword_1C392E000, v46, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: filtered %tu URLs of (of %tu) from %@", buf, 0x20u);

  }
  v16 = v66;
  v41 = -[PPLocationStorage donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:](self->_storage, "donateLocations:source:contextualNamedEntities:algorithm:cloudSync:error:", v43, v15, v66, v67, v65, a8);
  if (v41)
  {
    objc_msgSend(v15, "bundleId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "groupId");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v43;
    v53 = v50;
    v54 = v51;
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
    v55 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v42;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __76__PPLocalLocationStore__logDonationForLocations_bundleId_algorithm_groupId___block_invoke;
    v81 = &unk_1E7E1FFF8;
    v56 = v53;
    v82 = v56;
    v57 = v54;
    v83 = v57;
    v84 = self;
    v58 = v52;
    v85 = v58;
    dispatch_async(v55, buf);

    v16 = v66;
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsDidChangeMeaningfully");
  }

LABEL_38:
  return v41;
}

- (BOOL)iterRankedLocationsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  void (**v8)(id, uint64_t, char *);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, char *))a5;
  -[PPLocalLocationStore rankedLocationsWithQuery:clientProcessName:error:](self, "rankedLocationsWithQuery:clientProcessName:error:", a3, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v18 = 0;
        v8[2](v8, v16, &v18);
        if (v18)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  return v10 != 0;
}

- (id)rankedLocationsWithQuery:(id)a3 clientProcessName:(id)a4 error:(id *)a5
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PPLocalLocationStore *v16;
  BOOL v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  PPLocalLocationStore *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  float v39;
  float v40;
  id v41;
  PPLocalLocationStore *v42;
  id v43;
  id v44;
  id v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  double v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  NSObject *v58;
  PPLocalLocationStore *v59;
  id v60;
  unint64_t v61;
  PPLocalLocationStore *v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  PPLocalLocationStore *v68;
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  id v74;
  id *v75;
  uint64_t v76;
  uint64_t v77;
  uint8_t v78[4];
  id v79;
  __int16 v80;
  double v81;
  __int16 v82;
  char *v83;
  _BYTE buf[24];
  void *v85;
  PPLocalLocationStore *v86;
  id v87;
  PPLocalLocationStore *v88;
  id v89;
  id v90;
  id v91;
  __int128 *v92;
  uint64_t *v93;
  id *v94;
  char *v95;
  float v96;
  __int128 v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  v64 = a4;
  pp_locations_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v69, "limit");
    objc_msgSend(v69, "fromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "toDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v85 = v13;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "rankedLocationsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  if (self)
  {
    v14 = (void *)objc_msgSend(v69, "copy");
    objc_msgSend(v14, "setLimit:", -1);
    v15 = (void *)objc_opt_new();
    v74 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __65__PPLocalLocationStore__unlimitedLocationRecordsWithQuery_error___block_invoke;
    v85 = &unk_1E7E1FED0;
    v16 = v15;
    v86 = v16;
    v17 = -[PPLocalLocationStore iterLocationRecordsWithQuery:error:block:](self, "iterLocationRecordsWithQuery:error:block:", v14, &v74, buf);
    v18 = v74;
    if (v17)
    {
      v68 = v16;
      v19 = 0;
    }
    else
    {
      pp_locations_log_handle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v97) = 138412290;
        *(_QWORD *)((char *)&v97 + 4) = v18;
        _os_log_error_impl(&dword_1C392E000, v20, OS_LOG_TYPE_ERROR, "_unlimitedLocationRecordsWithQuery: nil result from iterLocationRecordsWithQuery: %@", (uint8_t *)&v97, 0xCu);
      }

      v19 = objc_retainAutorelease(v18);
      v68 = 0;
    }

  }
  else
  {
    v19 = 0;
    v68 = 0;
  }
  v67 = v19;
  if (v68)
  {
    objc_opt_self();
    +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_LC_Agg.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_LC_Final.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    if (v66 && v65)
    {
      v22 = +[PPStreamingLocationScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingLocationScorer, v66);
      v21 = +[PPStreamingLocationScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingLocationScorer, v65) | v22;
    }
    objc_msgSend(v69, "scoringDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      v25 = v23;
    else
      v25 = (id)objc_opt_new();
    v27 = v25;

    -[PPLocationStorage sourceStats:withExcludedAlgorithms:](self->_storage, "sourceStats:withExcludedAlgorithms:", v21, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v68;
    v30 = v27;
    v31 = v28;
    v63 = v29;
    +[PPLocationClusterID clustersWithRecords:](PPLocationClusterID, "clustersWithRecords:", v29);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPLocationClusterID latLongTableWithClusters:](PPLocationClusterID, "latLongTableWithClusters:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0;
    v75 = &v74;
    v76 = 0x2020000000;
    v77 = 0;
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "locationScoringUsesHybrid");

    if (v36)
    {
      -[PPLocalLocationStore _loadScoringMLModel]((uint64_t)self);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0;
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "scoreThresholdForLocation");
    v40 = v39;

    *(_QWORD *)&v97 = 0;
    *((_QWORD *)&v97 + 1) = &v97;
    v98 = 0x3032000000;
    v99 = __Block_byref_object_copy__23759;
    v100 = __Block_byref_object_dispose__23760;
    v101 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __71__PPLocalLocationStore_scoreLocations_scoringDate_sourceStats_mlModel___block_invoke;
    v85 = &unk_1E7E1FDE0;
    v95 = sel_scoreLocations_scoringDate_sourceStats_mlModel_;
    v86 = self;
    v41 = v33;
    v87 = v41;
    v92 = &v97;
    v42 = (PPLocalLocationStore *)v30;
    v88 = v42;
    v43 = v31;
    v89 = v43;
    v44 = v37;
    v90 = v44;
    v93 = &v70;
    v96 = v40;
    v45 = v34;
    v91 = v45;
    v94 = &v74;
    objc_msgSend(v32, "enumerateKeysAndObjectsUsingBlock:", buf);
    v46 = (char *)v75[3];
    v47 = objc_msgSend(v45, "count");
    pp_locations_log_handle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = v75[3];
      if (*((_BYTE *)v71 + 24))
        v50 = 0.0;
      else
        v50 = v40;
      *(_DWORD *)v78 = 134218496;
      v79 = v49;
      v80 = 2048;
      v81 = v50;
      v82 = 2048;
      v83 = &v46[v47];
      _os_log_impl(&dword_1C392E000, v48, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: filtered %tu items below threshold of %f out of %tu total.", v78, 0x20u);
    }

    v51 = v91;
    v52 = v45;

    _Block_object_dispose(&v97, 8);
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);

    v53 = (id)objc_opt_self();
    v54 = (id)objc_opt_self();
    v55 = (void *)objc_msgSend(v52, "count");
    v56 = v69;
    v57 = v64;
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
    v58 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __83__PPLocalLocationStore__petLoggingForQuery_resultCount_clientProcessName_hasError___block_invoke;
    v85 = &unk_1E7E1FD78;
    v59 = (PPLocalLocationStore *)v57;
    v86 = v59;
    v89 = v55;
    v60 = v56;
    LOBYTE(v90) = v67 != 0;
    v87 = v60;
    v88 = self;
    dispatch_async(v58, buf);

    v61 = objc_msgSend(v60, "limit");
    v26 = v52;
    objc_opt_self();
    objc_msgSend(v26, "sortUsingComparator:", &__block_literal_global_161);
    if (objc_msgSend(v26, "count") > v61)
      objc_msgSend(v26, "removeObjectsInRange:", v61, objc_msgSend(v26, "count") - v61);

  }
  else
  {
    v26 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v67);
  }

  return v26;
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
  double v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  NSObject *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v7);
        -[PPStreamingLocationScorer addRecord:]((uint64_t)v8, *(void **)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v11);
  }
  v26 = 0;
  *(float *)&v14 = -[PPStreamingLocationScorer getFinalScoreWithAggregationResultOut:finalResultOut:]((uint64_t)v8, 0, (uint64_t)&v26);
  if (v26)
  {
    v25 = 0;
    objc_msgSend(v9, "predictionFromFeatures:error:", v26, &v25, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;
    if (v15)
    {
      objc_msgSend(v15, "featureValueForName:", CFSTR("computed_score"));
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject multiArrayValue](v17, "multiArrayValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[NSObject multiArrayValue](v17, "multiArrayValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v22 = v21;

      }
      else
      {
        -[NSObject doubleValue](v17, "doubleValue");
        v22 = v23;
      }
    }
    else
    {
      pp_default_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      v22 = -1.0;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v16;
        _os_log_fault_impl(&dword_1C392E000, v17, OS_LOG_TYPE_FAULT, "PPLocalLocationStore: unable to retrieve prediction %@", buf, 0xCu);
      }
    }

  }
  else
  {
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    v22 = 0.0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C392E000, v16, OS_LOG_TYPE_FAULT, "PPLocalLocationStore: the score interpreter provided a nil final output.", buf, 2u);
    }
  }

  return v22;
}

- (BOOL)iterLocationRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  PPLocationStorage *storage;
  id v27;
  id v28;
  id v29;
  void (**v30)(_QWORD);
  _BOOL4 v31;
  NSObject *v32;
  uint64_t v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD *v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD aBlock[4];
  id v59;
  id v60;
  id v61;
  _QWORD *v62;
  _BYTE *v63;
  _QWORD v64[3];
  char v65;
  uint8_t v66[4];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  _BYTE buf[24];
  void *v71;
  uint64_t v72;

  v36 = a4;
  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = a5;
  pp_locations_log_handle();
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
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    v71 = v12;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "iterLocationRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  if (objc_msgSend(v6, "limit"))
  {
    v13 = (void *)objc_opt_new();
    if (objc_msgSend(v6, "consumer") == 1 || objc_msgSend(v6, "consumer") == 2)
    {
      -[PPLocalLocationStore locationForHome](self, "locationForHome", v36);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPLocalLocationStore locationForWork](self, "locationForWork");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v13, "addObject:", v14);
      if (v15)
        objc_msgSend(v13, "addObject:", v15);

    }
    v16 = (void *)objc_msgSend(v6, "copy", v36);
    objc_msgSend(v16, "setLimit:", -1);
    v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v18 = objc_msgSend(v6, "limit");
    if (v18 >= 0x40)
      v19 = 64;
    else
      v19 = v18;
    v20 = (void *)objc_msgSend(v17, "initWithCapacity:", v19);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v71 = 0;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x2020000000;
    v21 = MEMORY[0x1E0C809B0];
    v65 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke;
    aBlock[3] = &unk_1E7E1FE08;
    v62 = v64;
    v22 = v20;
    v59 = v22;
    v61 = v39;
    v63 = buf;
    v60 = v6;
    v23 = _Block_copy(aBlock);
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v48[0] = v21;
    v48[1] = 3221225472;
    v48[2] = __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke_2;
    v48[3] = &unk_1E7E1FE30;
    v24 = v13;
    v49 = v24;
    v25 = _Block_copy(v48);
    storage = self->_storage;
    v40[0] = v21;
    v40[1] = 3221225472;
    v40[2] = __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke_3;
    v40[3] = &unk_1E7E1FE58;
    v45 = &v54;
    v27 = v24;
    v41 = v27;
    v28 = v25;
    v43 = v28;
    v46 = &v50;
    v29 = v22;
    v42 = v29;
    v30 = v23;
    v44 = v30;
    v47 = v64;
    v31 = -[PPLocationStorage iterLocationRecordsWithQuery:error:block:](storage, "iterLocationRecordsWithQuery:error:block:", v16, v37, v40);
    if (v31)
      v30[2](v30);
    if (v51[3])
    {
      pp_locations_log_handle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v34 = v51[3];
        v35 = v55[3];
        *(_DWORD *)v66 = 134218240;
        v67 = v34;
        v68 = 2048;
        v69 = v35;
        _os_log_debug_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEBUG, "iterLocationRecordsWithQuery filtered %tu of %tu items due to map UI restriction", v66, 0x16u);
      }

    }
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    LOBYTE(v31) = 1;
  }

  return v31;
}

- (id)locationRecordOfCategory:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  PPLocationStorage *storage;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1C3BD6630](objc_msgSend(v5, "setLimit:", 1));
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, 0);

  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "setMatchingCategories:", v9);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__23759;
  v18 = __Block_byref_object_dispose__23760;
  v19 = 0;
  storage = self->_storage;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__PPLocalLocationStore_locationRecordOfCategory___block_invoke;
  v13[3] = &unk_1E7E1FE80;
  v13[4] = &v14;
  -[PPLocationStorage iterLocationRecordsWithQuery:error:block:](storage, "iterLocationRecordsWithQuery:error:block:", v5, 0, v13);
  v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)locationForHome
{
  _PASLock *cache;
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
  v9 = __Block_byref_object_copy__23759;
  v10 = __Block_byref_object_dispose__23760;
  v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PPLocalLocationStore_locationForHome__block_invoke;
  v5[3] = &unk_1E7E1FEA8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](cache, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)locationForWork
{
  _PASLock *cache;
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
  v9 = __Block_byref_object_copy__23759;
  v10 = __Block_byref_object_dispose__23760;
  v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PPLocalLocationStore_locationForWork__block_invoke;
  v5[3] = &unk_1E7E1FEA8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](cache, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)homeOrWorkAddresses
{
  _PASLock *cache;
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
  v9 = __Block_byref_object_copy__23759;
  v10 = __Block_byref_object_dispose__23760;
  v11 = 0;
  cache = self->_cache;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PPLocalLocationStore_homeOrWorkAddresses__block_invoke;
  v5[3] = &unk_1E7E1FEA8;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](cache, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)locationRecordsWithQuery:(id)a3 error:(id *)a4
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
  pp_locations_log_handle();
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
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "locationRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  v13 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __55__PPLocalLocationStore_locationRecordsWithQuery_error___block_invoke;
  v18[3] = &unk_1E7E1FED0;
  v19 = v13;
  v14 = v13;
  if (-[PPLocalLocationStore iterLocationRecordsWithQuery:error:block:](self, "iterLocationRecordsWithQuery:error:block:", v6, a4, v18))
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

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  BOOL v5;

  v5 = -[PPLocationStorage clearWithError:deletedCount:](self->_storage, "clearWithError:deletedCount:", a3, a4);
  -[_PASLock runWithLockAcquired:](self->_cache, "runWithLockAcquired:", &__block_literal_global_163_23769);
  PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  return v5;
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  BOOL v8;
  unint64_t v10;
  char v11;

  v11 = 0;
  v10 = 0;
  v8 = -[PPLocationStorage deleteAllLocationsFromSourcesWithBundleId:documentIds:atLeastOneLocationRemoved:deletedCount:error:](self->_storage, "deleteAllLocationsFromSourcesWithBundleId:documentIds:atLeastOneLocationRemoved:deletedCount:error:", a3, a4, &v11, &v10, a6);
  if (v11)
  {
    -[_PASLock runWithLockAcquired:](self->_cache, "runWithLockAcquired:", &__block_literal_global_166);
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a5)
    *a5 = v10;
  return v8;
}

- (BOOL)deleteAllLocationsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  BOOL v9;
  unint64_t v11;
  char v12;

  v12 = 0;
  v11 = 0;
  v9 = -[PPLocationStorage deleteAllLocationsFromSourcesWithBundleId:groupId:olderThanDate:atLeastOneLocationRemoved:deletedCount:error:](self->_storage, "deleteAllLocationsFromSourcesWithBundleId:groupId:olderThanDate:atLeastOneLocationRemoved:deletedCount:error:", a3, a4, a5, &v12, &v11, a7);
  if (v12)
  {
    -[_PASLock runWithLockAcquired:](self->_cache, "runWithLockAcquired:", &__block_literal_global_168_23768);
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a6)
    *a6 = v11;
  return v9;
}

- (BOOL)deleteAllLocationsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  BOOL v7;
  unint64_t v9;
  char v10;

  v10 = 0;
  v9 = 0;
  v7 = -[PPLocationStorage deleteAllLocationsOlderThanDate:atLeastOneLocationRemoved:deletedCount:error:](self->_storage, "deleteAllLocationsOlderThanDate:atLeastOneLocationRemoved:deletedCount:error:", a3, &v10, &v9, a5);
  if (v10)
  {
    -[_PASLock runWithLockAcquired:](self->_cache, "runWithLockAcquired:", &__block_literal_global_169_23765);
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.locationsInvalidated");
  }
  if (a4)
    *a4 = v9;
  return v7;
}

- (BOOL)deleteAllLocationFeedbackCountsOlderThanDate:(id)a3
{
  return -[PPLocationStorage deleteAllLocationFeedbackCountRecordsOlderThanDate:](self->_storage, "deleteAllLocationFeedbackCountRecordsOlderThanDate:", a3);
}

- (BOOL)pruneOrphanedLocationFeedbackCountsWithLimit:(int64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  return -[PPLocationStorage pruneOrphanedLocationFeedbackCountRecordsWithLimit:rowOffset:deletedCount:isComplete:](self->_storage, "pruneOrphanedLocationFeedbackCountRecordsWithLimit:rowOffset:deletedCount:isComplete:", a3, a4, a5, a6);
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
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "Location feedback received: %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  +[PPInternalFeedback fromBaseFeedback:storeType:](PPInternalFeedback, "fromBaseFeedback:storeType:", v5, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storePendingFeedback:storeType:error:", v9, 3, 0);

  if (v6)
    v6[2](v6, 1, 0);

}

- (void)processFeedback:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  BOOL v56;
  id v57;
  void *v58;
  id v59;
  NSObject *v60;
  char v61;
  NSObject *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t m;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  __int128 v72;
  char **v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  PPStreamingLocationScorer *v83;
  void *v84;
  NSObject *v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t n;
  float v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  NSObject *v106;
  id v107;
  NSObject *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t j;
  uint64_t v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  __int128 v122;
  const char *aSelector;
  void *v124;
  id v125;
  void *v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  os_log_t oslog;
  id v131;
  id v132;
  id v133;
  id obj;
  uint64_t v135;
  void *v136;
  void *v137;
  PPFeatureRedactor *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  id v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _QWORD v156[4];
  id v157;
  id v158;
  id v159;
  id v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  char v165;
  id location[2];
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[4];
  id v175;
  id v176;
  id aBlock[6];
  _BYTE v178[128];
  _BYTE v179[128];
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  uint8_t v184[4];
  void *v185;
  uint8_t buf[4];
  id v187;
  __int16 v188;
  id v189;
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v145 = a3;
  objc_msgSend(v145, "feedbackItems");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v148 = v3;
  if (self)
  {
    v4 = v3;
    v5 = (void *)objc_opt_new();
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v181;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v181 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v10, "itemString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v12) = v14 == 0;

          if ((_DWORD)v12)
          {
            v15 = (void *)objc_opt_new();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v13);

          }
          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v10);

          objc_autoreleasePoolPop(v11);
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
      }
      while (v7);
    }

  }
  else
  {
    v5 = 0;
  }

  v17 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v5, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithArray:", v18);

  v20 = (void *)objc_opt_new();
  v141 = (void *)objc_opt_new();
  objc_msgSend(v145, "timestamp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setScoringDate:", v21);

  objc_msgSend(v145, "timestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setToDate:", v22);

  objc_msgSend(v145, "clientBundleId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v23, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setExcludingSourceBundleIds:", v24);

  v160 = 0;
  v156[0] = MEMORY[0x1E0C809B0];
  v156[1] = 3221225472;
  v156[2] = __40__PPLocalLocationStore_processFeedback___block_invoke;
  v156[3] = &unk_1E7E20020;
  v133 = v20;
  v157 = v133;
  v25 = v5;
  v158 = v25;
  v132 = v19;
  v159 = v132;
  v26 = -[PPLocalLocationStore iterLocationRecordsWithQuery:error:block:](self, "iterLocationRecordsWithQuery:error:block:", v141, &v160, v156);
  v128 = v160;
  if (v26)
  {
    if (!objc_msgSend(v133, "count"))
    {
LABEL_95:
      v60 = objc_opt_new();
      v154 = 0u;
      v155 = 0u;
      v152 = 0u;
      v153 = 0u;
      v109 = v132;
      v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
      if (v110)
      {
        v111 = *(_QWORD *)v153;
        do
        {
          for (j = 0; j != v110; ++j)
          {
            if (*(_QWORD *)v153 != v111)
              objc_enumerationMutation(v109);
            v113 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * j);
            v114 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(v25, "objectForKeyedSubscript:", v113);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObjectsFromArray:](v60, "addObjectsFromArray:", v115);

            objc_autoreleasePoolPop(v114);
          }
          v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v152, v178, 16);
        }
        while (v110);
      }

      if (-[NSObject count](v60, "count"))
      {
        v116 = objc_alloc(MEMORY[0x1E0D70AD0]);
        objc_msgSend(v145, "timestamp");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "clientIdentifier");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "clientBundleId");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "mappingId");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = (void *)objc_msgSend(v116, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v60, v117, v118, v119, v120);

        +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v121, 2, 1, 1);
      }
      goto LABEL_104;
    }
    v27 = objc_alloc(MEMORY[0x1E0D70AD0]);
    objc_msgSend(v145, "timestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "clientIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "clientBundleId");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "mappingId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v27, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v133, v28, v29, v30, v31);

    +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v32, 2, 2, 1);
    objc_msgSend(v32, "feedbackItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "clientBundleId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "clientIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPFeedbackUtils recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:](PPFeedbackUtils, "recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:", v145, v33, v34, v35, 2);

    v36 = v32;
    v126 = v36;
    if (self)
    {
      objc_msgSend(v36, "clientBundleId");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = +[PPFeedbackUtils shouldSample:](PPFeedbackUtils, "shouldSample:", v37);

      if (v38)
      {
        oslog = (os_log_t)objc_opt_new();
        -[NSObject setPredictionType:](oslog, "setPredictionType:", 3);
        +[PPFeedbackUtils feedbackMetadataForBaseFeedback:](PPFeedbackUtils, "feedbackMetadataForBaseFeedback:", v126);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setFeedbackMetadata:](oslog, "setFeedbackMetadata:", v39);

        v131 = v126;
        v40 = (void *)objc_opt_new();
        v41 = (void *)objc_opt_new();
        v172 = 0u;
        v173 = 0u;
        v170 = 0u;
        v171 = 0u;
        objc_msgSend(v131, "feedbackItems");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v170, buf, 16);
        if (v43)
        {
          v44 = *(_QWORD *)v171;
          do
          {
            for (k = 0; k != v43; ++k)
            {
              if (*(_QWORD *)v171 != v44)
                objc_enumerationMutation(v42);
              v46 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * k);
              objc_msgSend(v46, "itemString");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v47);

              objc_msgSend(v46, "itemString");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, v48);

            }
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v170, buf, 16);
          }
          while (v43);
        }

        objc_msgSend(v131, "timestamp");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "timeIntervalSince1970");
        v51 = v50;
        v149 = v40;
        v52 = (void *)objc_opt_new();
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v51);
        objc_msgSend(v52, "setScoringDate:", v53);
        objc_msgSend(v52, "setToDate:", v53);
        *(_QWORD *)&v180 = 0;
        *((_QWORD *)&v180 + 1) = &v180;
        *(_QWORD *)&v181 = 0x3032000000;
        *((_QWORD *)&v181 + 1) = __Block_byref_object_copy__23759;
        *(_QWORD *)&v182 = __Block_byref_object_dispose__23760;
        *((_QWORD *)&v182 + 1) = 0;
        *((_QWORD *)&v182 + 1) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v149);
        location[0] = 0;
        location[1] = location;
        *(_QWORD *)&v167 = 0x3032000000;
        *((_QWORD *)&v167 + 1) = __Block_byref_object_copy__23759;
        v168 = (unint64_t)__Block_byref_object_dispose__23760;
        *((_QWORD *)&v168 + 1) = objc_opt_new();
        aBlock[0] = (id)MEMORY[0x1E0C809B0];
        aBlock[1] = (id)3221225472;
        aBlock[2] = __84__PPLocalLocationStore__locationToMappedStringMatchingForLocations_timestamp_error___block_invoke;
        aBlock[3] = &unk_1E7E20048;
        aBlock[4] = &v180;
        aBlock[5] = location;
        v54 = _Block_copy(aBlock);
        v176 = 0;
        v174[0] = MEMORY[0x1E0C809B0];
        v174[1] = 3221225472;
        v174[2] = __84__PPLocalLocationStore__locationToMappedStringMatchingForLocations_timestamp_error___block_invoke_2;
        v174[3] = &unk_1E7E20070;
        v55 = v54;
        v175 = v55;
        v56 = -[PPLocalLocationStore iterLocationRecordsWithQuery:error:block:](self, "iterLocationRecordsWithQuery:error:block:", v52, &v176, v174);
        v57 = v176;
        v58 = v57;
        if (v56)
        {
          v59 = *((id *)location[1] + 5);
          v146 = 0;
        }
        else
        {
          if (v57)
            v146 = objc_retainAutorelease(v57);
          else
            v146 = 0;
          pp_locations_log_handle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v184 = 138412290;
            v185 = v58;
            _os_log_error_impl(&dword_1C392E000, v62, OS_LOG_TYPE_ERROR, "PPLocalLocationStore mapped string matching: error from iterLocationRecordsWithQuery: %@", v184, 0xCu);
          }

          v59 = 0;
        }

        _Block_object_dispose(location, 8);
        _Block_object_dispose(&v180, 8);

        v63 = (void *)objc_opt_new();
        v168 = 0u;
        v169 = 0u;
        *(_OWORD *)location = 0u;
        v167 = 0u;
        v64 = v59;
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", location, &v180, 16);
        if (v65)
        {
          v66 = *(_QWORD *)v167;
          do
          {
            for (m = 0; m != v65; ++m)
            {
              if (*(_QWORD *)v167 != v66)
                objc_enumerationMutation(v64);
              v68 = *((_QWORD *)location[1] + m);
              objc_msgSend(v64, "objectForKeyedSubscript:", v68);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectForKeyedSubscript:", v68);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "setObject:forKeyedSubscript:", v69, v70);

            }
            v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", location, &v180, 16);
          }
          while (v65);
        }

        v71 = v146;
        v124 = v71;
        if (v63)
        {
          v163 = 0u;
          v164 = 0u;
          v161 = 0u;
          v162 = 0u;
          obj = v63;
          v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v179, 16);
          if (v129)
          {
            v125 = 0;
            v138 = 0;
            v73 = &selRef_engagedCount;
            v127 = *(_QWORD *)v162;
            *(_QWORD *)&v72 = 138412546;
            v122 = v72;
            do
            {
              v74 = 0;
              aSelector = v73[259];
              do
              {
                if (*(_QWORD *)v162 != v127)
                {
                  v75 = v74;
                  objc_enumerationMutation(obj);
                  v74 = v75;
                }
                v135 = v74;
                v76 = *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * v74);
                +[PPFeedbackUtils feedbackItemForPPFeedbackItem:](PPFeedbackUtils, "feedbackItemForPPFeedbackItem:", v76, v122);
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(obj, "objectForKeyedSubscript:", v76);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                -[PPLocationStorage decayedFeedbackCountsForClusterIdentifier:](self->_storage, "decayedFeedbackCountsForClusterIdentifier:", v77);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "clientBundleId");
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                v144 = v77;
                v143 = v78;
                objc_opt_self();
                +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_LC_Agg.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                if (v150)
                {
                  objc_opt_self();
                  +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_LC_Final.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v147)
                  {
                    v79 = +[PPStreamingLocationScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingLocationScorer, v150);
                    -[PPLocationStorage sourceStats:withExcludedAlgorithms:](self->_storage, "sourceStats:withExcludedAlgorithms:", +[PPStreamingLocationScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingLocationScorer, v147) | v79, 0);
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    v142 = (void *)objc_opt_new();
                    v80 = (void *)objc_opt_new();
                    objc_msgSend(v80, "setFuzzyMatchingString:", v144);
                    objc_msgSend(v80, "setScoringDate:", v142);
                    *(_QWORD *)&v170 = 0;
                    -[PPLocalLocationStore locationRecordsWithQuery:error:](self, "locationRecordsWithQuery:error:", v80, &v170);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    v82 = (id)v170;
                    v136 = v82;
                    if (v81)
                    {
                      v83 = [PPStreamingLocationScorer alloc];
                      objc_msgSend(v80, "scoringDate");
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      v85 = -[PPStreamingLocationScorer initWithScoringDate:sourceStats:trialWrapper:](v83, v84, v139, self->_trialWrapper);

                      v86 = (id)objc_opt_self();
                      v87 = (id)objc_opt_self();
                      objc_msgSend(v81, "firstObject");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PPStreamingLocationScorer startNewClusterWithDecayedFeedbackCounts:mostRelevantRecord:]((uint64_t)v85, v143, v88);

                      v182 = 0u;
                      v183 = 0u;
                      v180 = 0u;
                      v181 = 0u;
                      v89 = v81;
                      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
                      if (v90)
                      {
                        v91 = *(_QWORD *)v181;
                        do
                        {
                          for (n = 0; n != v90; ++n)
                          {
                            if (*(_QWORD *)v181 != v91)
                              objc_enumerationMutation(v89);
                            -[PPStreamingLocationScorer addRecord:]((uint64_t)v85, *(void **)(*((_QWORD *)&v180 + 1) + 8 * n));
                          }
                          v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v180, buf, 16);
                        }
                        while (v90);
                      }

                      location[0] = 0;
                      aBlock[0] = 0;
                      v93 = -[PPStreamingLocationScorer getFinalScoreWithAggregationResultOut:finalResultOut:]((uint64_t)v85, location, (uint64_t)aBlock);
                      v94 = objc_alloc(MEMORY[0x1E0D81638]);
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v93);
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      v96 = (void *)objc_msgSend(v94, "initWithFirst:second:", v95, location[0]);

                    }
                    else
                    {
                      v125 = objc_retainAutorelease(v82);
                      pp_locations_log_handle();
                      v85 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                      {
                        NSStringFromSelector(aSelector);
                        v103 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = v122;
                        v187 = v103;
                        v188 = 2112;
                        v189 = v125;
                        _os_log_error_impl(&dword_1C392E000, v85, OS_LOG_TYPE_ERROR, "error in %@: %@", buf, 0x16u);

                      }
                      v96 = 0;
                    }

                  }
                  else
                  {
                    v96 = 0;
                  }

                }
                else
                {
                  v96 = 0;
                }

                objc_msgSend(v96, "second");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                +[PPFeedbackUtils featuresForScoreDict:](PPFeedbackUtils, "featuresForScoreDict:", v97);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = (void *)objc_msgSend(v98, "mutableCopy");

                if (!v138)
                  v138 = -[PPFeatureRedactor initWithTrialWrapper:namespaceName:]([PPFeatureRedactor alloc], "initWithTrialWrapper:namespaceName:", self->_trialWrapper, CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"));
                if (v99)
                {
                  -[PPFeatureRedactor transformFeaturesInPlace:](v138, "transformFeaturesInPlace:", v99);
                  objc_msgSend(v96, "first");
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "floatValue");
                  +[PPFeedbackUtils scoredItemWithFeaturesForFeatureDictionary:score:](PPFeedbackUtils, "scoredItemWithFeaturesForFeatureDictionary:score:", v99);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v101, "addFeedbackItems:", v140);
                  -[NSObject addScoredItems:](oslog, "addScoredItems:", v101);

                }
                else
                {
                  pp_locations_log_handle();
                  v102 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_1C392E000, v102, OS_LOG_TYPE_ERROR, "PPLocalLocationStore: unable to fetch feature dictionary.", buf, 2u);
                  }

                  v165 = 0;
                }

                if (!v99)
                {

                  goto LABEL_84;
                }
                v74 = v135 + 1;
              }
              while (v135 + 1 != v129);
              v104 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v179, 16);
              v129 = v104;
              v73 = &selRef_engagedCount;
            }
            while (v104);
          }
          else
          {
            v125 = 0;
            v138 = 0;
          }

          +[PPFeedbackUtils addBoilerplateToFeedbackLog:](PPFeedbackUtils, "addBoilerplateToFeedbackLog:", oslog);
          objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "logMessage:", oslog);

          v165 = 1;
LABEL_84:

          v61 = v165;
        }
        else
        {
          if (v71)
            v125 = objc_retainAutorelease(v71);
          else
            v125 = 0;
          pp_locations_log_handle();
          v106 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v187 = v124;
            _os_log_error_impl(&dword_1C392E000, v106, OS_LOG_TYPE_ERROR, "logFeedbackSessionsWithFeedback: nil result from _feedbackItemToLocationMapForFeedback: %@", buf, 0xCu);
          }

          v61 = 0;
        }

      }
      else
      {
        pp_default_log_handle();
        oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C392E000, oslog, OS_LOG_TYPE_DEBUG, "PPLocalLocationStore: no feedback session log collection being performed due to sampling", buf, 2u);
        }
        v125 = 0;
        v61 = 1;
      }

      v107 = v125;
      if ((v61 & 1) != 0)
        goto LABEL_94;
    }
    else
    {

      v107 = 0;
    }
    pp_locations_log_handle();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v187 = v107;
      _os_log_error_impl(&dword_1C392E000, v108, OS_LOG_TYPE_ERROR, "PPLocalLocationStore: encountered error in session logging: %@", buf, 0xCu);
    }

LABEL_94:
    -[PPLocationStorage donateLocationFeedback:](self->_storage, "donateLocationFeedback:", v126);

    goto LABEL_95;
  }
  pp_locations_log_handle();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v187 = v128;
    _os_log_error_impl(&dword_1C392E000, v60, OS_LOG_TYPE_ERROR, "processFeedbackItems: error from iterLocationRecordsWithQuery: %@", buf, 0xCu);
  }
LABEL_104:

}

- (PPLocationStorage)storage
{
  return self->_storage;
}

- (BOOL)useScoreInterpreter
{
  return self->_useScoreInterpreter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __40__PPLocalLocationStore_processFeedback___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
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
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v18, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placemark");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v13);

    v14 = *(void **)(a1 + 48);
    objc_msgSend(v18, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "placemark");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v17);

    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
      *a3 = 1;
  }

}

void __84__PPLocalLocationStore__locationToMappedStringMatchingForLocations_timestamp_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
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

void __84__PPLocalLocationStore__locationToMappedStringMatchingForLocations_timestamp_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "location");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clusterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

}

uint64_t __75__PPLocalLocationStore_deleteAllLocationsOlderThanDate_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __103__PPLocalLocationStore_deleteAllLocationsFromSourcesWithBundleId_groupId_olderThan_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __94__PPLocalLocationStore_deleteAllLocationsFromSourcesWithBundleId_groupIds_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __97__PPLocalLocationStore_deleteAllLocationsFromSourcesWithBundleId_documentIds_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __85__PPLocalLocationStore_deleteAllLocationsFromSourcesWithBundleId_deletedCount_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __52__PPLocalLocationStore_clearWithError_deletedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __55__PPLocalLocationStore_locationRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __43__PPLocalLocationStore_homeOrWorkAddresses__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "homeOrWorkAddresses");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __39__PPLocalLocationStore_locationForWork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "locationForWork");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __39__PPLocalLocationStore_locationForHome__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "locationForHome");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __49__PPLocalLocationStore_locationRecordOfCategory___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD6630]();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = *(id *)(a1 + 32);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (*(_BYTE *)(v8 + 24))
        {
          v9 = 1;
        }
        else
        {
          v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
          v9 = v10 >= objc_msgSend(*(id *)(a1 + 40), "limit", (_QWORD)v11);
          v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        *(_BYTE *)(v8 + 24) = v9;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
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
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (_QWORD)v11);
  objc_autoreleasePoolPop(v2);
}

uint64_t __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (+[PPLocationSupport fuzzyMatchingLocations:and:](PPLocationSupport, "fuzzyMatchingLocations:and:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), v3, (_QWORD)v9))
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

void __65__PPLocalLocationStore_iterLocationRecordsWithQuery_error_block___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = v5;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v9 = v5;
  if (*(_QWORD *)(a1 + 32)
    && (v7 = *(_QWORD *)(a1 + 48),
        objc_msgSend(v5, "location"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
        v8,
        v6 = v9,
        (_DWORD)v7))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    if (objc_msgSend(*(id *)(a1 + 40), "count") == 64)
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);

}

uint64_t __51__PPLocalLocationStore_sortAndTruncate_queryLimit___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __83__PPLocalLocationStore__petLoggingForQuery_resultCount_clientProcessName_hasError___block_invoke(uint64_t a1)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "concatenatedTreatmentNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActiveTreatments:", v7);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackScalarForMessage:", v9);

}

- (id)_loadScoringMLModel
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = *(void **)(a1 + 24);
  v6 = 0;
  objc_msgSend(v1, "mlModelForModelName:namespaceName:error:", CFSTR("PPModel_LOC.mlmodelc"), CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS"), &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (!v2)
  {
    pp_locations_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = CFSTR("PPModel_LOC.mlmodelc");
      v11 = 2112;
      v12 = CFSTR("PERSONALIZATION_PORTRAIT_LOCATIONS");
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPLocalLocationStore: error %@ in retrieving %@ model with namespace %@", buf, 0x20u);
    }

  }
  return v2;
}

void __71__PPLocalLocationStore_scoreLocations_scoringDate_sourceStats_mlModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  double v30;
  double v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  void *v40;
  NSObject *v41;
  double v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  double v49;
  __int16 v50;
  double v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32), CFSTR("PPLocalLocationStore.m"), 368, CFSTR("Location cluster for %@ had 0 records"), v5);

  }
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_142_23794);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "supplementFieldsWithClusterID:locationWithLatLong:", v5, v9);

  objc_msgSend(v8, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clusterIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(v8, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clusterIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "decayedFeedbackCountsForClusterIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!v16)
  {
    v17 = -[PPStreamingLocationScorer initWithScoringDate:sourceStats:trialWrapper:]([PPStreamingLocationScorer alloc], *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(*(_QWORD *)(a1 + 32) + 24));
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  }
  -[PPStreamingLocationScorer startNewClusterWithDecayedFeedbackCounts:mostRelevantRecord:](v16, v15, v8);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "locationScoringUsesHybrid");

  if (!v21)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v24 = v6;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v45 != v27)
            objc_enumerationMutation(v24);
          -[PPStreamingLocationScorer addRecord:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(void **)(*((_QWORD *)&v44 + 1) + 8 * i));
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v26);
    }

    v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    if (v29)
      v30 = -[PPStreamingLocationScorer getFinalScoreWithAggregationResultOut:finalResultOut:](v29, 0, 0);
    else
      v30 = 0.0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    goto LABEL_23;
  }
  v22 = *(void **)(a1 + 64);
  if (v22)
  {
    v23 = v22;
LABEL_22:
    objc_msgSend(*(id *)(a1 + 32), "finalScoreFromRecordsUsingHybrid:streamingScorer:mlModel:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v23);
    v30 = v31;

LABEL_23:
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) && v30 > 0.0 || v30 >= *(float *)(a1 + 112))
    {
      v33 = objc_alloc(MEMORY[0x1E0D70B78]);
      objc_msgSend(v8, "location");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "placemark");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "location");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v33, "initWithPlacemark:category:mostRelevantRecord:", v35, objc_msgSend(v36, "category"), v8);

      v38 = objc_alloc(MEMORY[0x1E0D70C48]);
      objc_msgSend(v8, "sentimentScore");
      v40 = (void *)objc_msgSend(v38, "initWithLocation:score:sentimentScore:", v37, v30, v39);
      objc_msgSend(*(id *)(a1 + 72), "addObject:", v40);

    }
    else
    {
      pp_locations_log_handle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v42 = *(float *)(a1 + 112);
        *(_DWORD *)buf = 134218240;
        v49 = v30;
        v50 = 2048;
        v51 = v42;
        _os_log_debug_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEBUG, "Scoring: filtering out location with score %f below threshold of %f", buf, 0x16u);
      }

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
    }
    goto LABEL_30;
  }
  -[PPLocalLocationStore _loadScoringMLModel](*(_QWORD *)(a1 + 32));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v23)
    goto LABEL_22;
  pp_locations_log_handle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C392E000, v41, OS_LOG_TYPE_ERROR, "PPLocalLocationStore: unable to locate ML model.", buf, 2u);
  }

LABEL_30:
}

uint64_t __71__PPLocalLocationStore_scoreLocations_scoringDate_sourceStats_mlModel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placemark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedCapitalizedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "placemark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v9, "isEqual:", v12);

  objc_msgSend(v5, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "placemark");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedCapitalizedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "placemark");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v16, "isEqual:", v19);

  if (!v27)
  {
    if ((v20 & 1) != 0)
    {
      v21 = -1;
      goto LABEL_7;
    }
LABEL_6:
    objc_msgSend(v4, "source");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v23, "compare:", v25);

    goto LABEL_7;
  }
  if ((v20 & 1) != 0)
    goto LABEL_6;
  v21 = 1;
LABEL_7:

  return v21;
}

uint64_t __65__PPLocalLocationStore__unlimitedLocationRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setReason:", 1);
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleId:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "concatenatedTreatmentNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveTreatments:", v3);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackScalarForMessage:", v5);

}

void __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_126(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setReason:", 0);
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleId:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "concatenatedTreatmentNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveTreatments:", v3);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackScalarForMessage:", v5);

}

uint64_t __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placemark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v7 = (objc_class *)MEMORY[0x1E0C99E98];
      v8 = v6;
      v9 = (void *)objc_msgSend([v7 alloc], "initWithString:", v8);

      if (v9)
      {
        objc_msgSend(v9, "host");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "scheme");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11 != 0;

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
    v13 = !v12;
  }
  else
  {
    v13 = 1;
  }
  objc_msgSend(v3, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clusterIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
    v17 = v13;
  else
    v17 = 0;

  return v17;
}

void __76__PPLocalLocationStore__logDonationForLocations_bundleId_algorithm_groupId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setDonationSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(_QWORD *)(a1 + 32)));
  +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupId:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "concatenatedTreatmentNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActiveTreatments:", v3);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackDistributionForMessage:value:", v5, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 56), "count"));

}

uint64_t __97__PPLocalLocationStore_donateLocations_source_contextualNamedEntities_algorithm_cloudSync_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

void __53__PPLocalLocationStore_initWithStorage_trialWrapper___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  __int16 v5[8];

  pp_locations_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v5[0] = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "PPLocalLocationStore: refreshing model cache due to prompt from Trial.", (uint8_t *)v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[2], "removeAllObjects");

}

+ (id)locationFromMapItemDictionary:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  unsigned __int16 v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint8_t v41[16];
  uint8_t v42[16];
  uint8_t buf[16];
  uint8_t v44[16];
  uint8_t v45[16];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MKMapItemGEOMapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D271E8]), "initWithData:", v3);
    v5 = v4;
    if (v4)
    {
      -[NSObject name](v4, "name");
      v6 = objc_claimAutoreleasedReturnValue();
      if (!-[NSObject length](v6, "length"))
      {
        pp_locations_log_handle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: GEOMapItem is missing a name.", buf, 2u);
        }

      }
      -[NSObject geoAddress](v5, "geoAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "structuredAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        pp_locations_log_handle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: GEOMapItem is missing a structured address.", v42, 2u);
        }

      }
      -[NSObject coordinate](v5, "coordinate");
      if (v11 == 0.0)
      {
        -[NSObject coordinate](v5, "coordinate");
        if (v12 == 0.0)
        {
          pp_locations_log_handle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v41 = 0;
            _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: GEOMapItem is missing coordinates.", v41, 2u);
          }

        }
      }
      v28 = v3;
      v38 = (void *)MEMORY[0x1E0D70B98];
      v14 = (void *)MEMORY[0x1E0CB37E8];
      -[NSObject coordinate](v5, "coordinate");
      objc_msgSend(v14, "numberWithDouble:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB37E8];
      -[NSObject coordinate](v5, "coordinate");
      objc_msgSend(v15, "numberWithDouble:", v16);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "thoroughfare");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subThoroughfare");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locality");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subLocality");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "administrativeArea");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subAdministrativeArea");
      v40 = v5;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postCode");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "countryCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "country");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inlandWater");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ocean");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "areaOfInterests");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "placemarkWithLatitudeDegrees:longitudeDegrees:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", v35, v37, v6, v36, v34, v33, v32, v31, v30, v29, v17, v18, v19, v20, v21);
      v39 = objc_claimAutoreleasedReturnValue();

      v5 = v40;
      v22 = objc_alloc(MEMORY[0x1E0D70B78]);
      -[NSObject _poiCategory](v40, "_poiCategory");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      if (objc_msgSend(v23, "length"))
      {
        v3 = v28;
        v24 = (void *)v39;
        if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D267B0]) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D267C0]) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D267F0]) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D268E8]) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D26900]) & 1) != 0
          || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D269F0]) & 1) != 0)
        {
          v25 = 4;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D26850]) & 1) != 0
               || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D26898]) & 1) != 0
               || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D26938]) & 1) != 0
               || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D26940]) & 1) != 0
               || (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D269D8]) & 1) != 0)
        {
          v25 = 1;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D267D0]) & 1) != 0)
        {
          v25 = 2;
        }
        else
        {
          v25 = 2;
          if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D26810]) & 1) == 0)
          {
            if (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D26960]))
              v25 = 2;
            else
              v25 = 3;
          }
        }
      }
      else
      {
        v25 = 0;
        v3 = v28;
        v24 = (void *)v39;
      }

      v26 = (void *)objc_msgSend(v22, "initWithPlacemark:category:mostRelevantRecord:", v24, v25, 0);
    }
    else
    {
      pp_locations_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: GEOMapItemStorage initWithData failed.", v44, 2u);
      }
      v26 = 0;
    }

  }
  else
  {
    pp_locations_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPLocalLocationStore: locationFromMapItemDictionary: no geo data.", v45, 2u);
    }
    v26 = 0;
  }

  return v26;
}

+ (id)locationNamedEntityToPPScoredLocation:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v23;
  void *v24;

  v3 = (void *)MEMORY[0x1E0D70B98];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v5, "location");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "coordinate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "coordinate");
  objc_msgSend(v7, "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streetAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "city");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateOrProvince");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postalCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "country");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placemarkWithLatitudeDegrees:longitudeDegrees:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", v6, v9, v10, v11, 0, v12, 0, v13, 0, v14, 0, v15, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v16, 0, 0);
  v18 = objc_alloc(MEMORY[0x1E0D70C48]);
  objc_msgSend(v5, "score");
  v20 = v19;

  v21 = (void *)objc_msgSend(v18, "initWithLocation:score:sentimentScore:", v17, v20, 0.0);
  return v21;
}

+ (id)locationFromMapItem:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = a3;
  objc_msgSend(v3, "geoAddress");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "structuredAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinate");
  v7 = v6 >= -180.0;
  if (v6 > 180.0)
    v7 = 0;
  if (v5 < -90.0)
    v7 = 0;
  v8 = v5 <= 90.0 && v7;
  v26 = (void *)MEMORY[0x1E0D70B98];
  v28 = v8;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "coordinate");
    objc_msgSend(v9, "numberWithDouble:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "coordinate");
    objc_msgSend(v10, "numberWithDouble:", v11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  objc_msgSend(v3, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thoroughfare");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subThoroughfare");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locality");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subLocality");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administrativeArea");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subAdministrativeArea");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "country");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inlandWater");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ocean");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "areaOfInterests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "placemarkWithLatitudeDegrees:longitudeDegrees:name:thoroughfare:subthoroughFare:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:country:inlandWater:ocean:areasOfInterest:", v31, v30, v32, v25, v24, v23, v22, v21, v20, v12, v13, v14, v15, v16, v17);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v27, 0, 0);

  return v18;
}

+ (BOOL)isLocationRelevantNamedEntityCategory:(unint64_t)a3
{
  return (a3 < 0xE) & (0x3F38u >> a3);
}

+ (unsigned)namedEntityCategoryToLocationCategory:(unint64_t)a3
{
  if (a3 > 0x15)
    return 2;
  else
    return word_1C3AE52E8[a3];
}

+ (unsigned)routineLOITypeToLocationCategory:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4)
    return 5;
  else
    return word_1C3AE5314[a3 + 1];
}

+ (id)scoredLocationFromName:(id)a3 category:(unsigned __int16)a4 score:(double)a5 sentimentScore:(double)a6
{
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("Name"));

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3F0]), "initWithLocation:addressDictionary:region:areasOfInterest:", 0, v10, 0, 0);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B78]), "initWithPlacemark:category:mostRelevantRecord:", v11, v8, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C48]), "initWithLocation:score:sentimentScore:", v12, a5, a6);

  return v13;
}

@end
