@implementation _PSFeatureCache

- (_PSFeatureCache)initWithPredictionContext:(id)a3 candidates:(id)a4 caches:(id)a5 store:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  char *v15;
  void *v16;
  objc_class *v17;
  id v18;
  uint64_t v19;
  void *v20;
  _PSShareSheetEphemeralFeatureManager *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  dispatch_source_t v37;
  void *v38;
  NSObject *v39;
  dispatch_time_t v40;
  NSObject *v41;
  _QWORD handler[4];
  id v44;
  objc_super v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  pthread_mutexattr_t v50;
  Class (*v51)(uint64_t);
  void *v52;
  uint64_t *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v45.receiver = self;
  v45.super_class = (Class)_PSFeatureCache;
  v15 = -[_PSFeatureCache init](&v45, sel_init);
  if (v15)
  {
    v50.__sig = 0;
    *(_QWORD *)v50.__opaque = 0;
    pthread_mutexattr_init(&v50);
    pthread_mutexattr_settype(&v50, 2);
    pthread_mutex_init((pthread_mutex_t *)(v15 + 56), &v50);
    pthread_mutexattr_destroy(&v50);
    v46 = 0;
    v47 = &v46;
    v48 = 0x2050000000;
    v16 = (void *)getLCFFeatureStoreClass_softClass;
    v49 = getLCFFeatureStoreClass_softClass;
    if (!getLCFFeatureStoreClass_softClass)
    {
      v50.__sig = MEMORY[0x1E0C809B0];
      *(_QWORD *)v50.__opaque = 3221225472;
      v51 = __getLCFFeatureStoreClass_block_invoke;
      v52 = &unk_1E43FEA00;
      v53 = &v46;
      __getLCFFeatureStoreClass_block_invoke((uint64_t)&v50);
      v16 = (void *)v47[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v46, 8);
    v18 = [v17 alloc];
    v19 = objc_msgSend(v18, "init:url:useSqlite:", lcfKey, 0, 0);
    v20 = (void *)*((_QWORD *)v15 + 20);
    *((_QWORD *)v15 + 20) = v19;

    v21 = -[_PSShareSheetEphemeralFeatureManager initWithContext:candidates:caches:store:]([_PSShareSheetEphemeralFeatureManager alloc], "initWithContext:candidates:caches:store:", v11, v12, v13, v14);
    v22 = (void *)*((_QWORD *)v15 + 22);
    *((_QWORD *)v15 + 22) = v21;

    objc_msgSend(v15, "addSelfToCandidates:", v12);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v15 + 2);
    *((_QWORD *)v15 + 2) = v23;

    objc_storeStrong((id *)v15 + 5, a5);
    objc_storeStrong((id *)v15 + 1, a3);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.coreduetd.psfeaturecache.queue", 17);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v15 + 15);
    *((_QWORD *)v15 + 15) = v25;

    v27 = objc_alloc(MEMORY[0x1E0C99EA0]);
    +[_PSConstants psDefaultsDomain](_PSConstants, "psDefaultsDomain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "initWithSuiteName:", v28);
    v30 = (void *)*((_QWORD *)v15 + 17);
    *((_QWORD *)v15 + 17) = v29;

    BiomeLibrary();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "MLSE");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "ShareSheet");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "VirtualFeatureStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "source");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)*((_QWORD *)v15 + 21);
    *((_QWORD *)v15 + 21) = v35;

    *((_QWORD *)v15 + 18) = 3600000000000;
    v37 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v15 + 15));
    v38 = (void *)*((_QWORD *)v15 + 16);
    *((_QWORD *)v15 + 16) = v37;

    *((_QWORD *)v15 + 19) = 60000000000;
    v39 = *((_QWORD *)v15 + 16);
    v40 = dispatch_time(0, 0);
    dispatch_source_set_timer(v39, v40, *((_QWORD *)v15 + 18), *((_QWORD *)v15 + 19));
    objc_initWeak((id *)&v50, v15);
    v41 = *((_QWORD *)v15 + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __69___PSFeatureCache_initWithPredictionContext_candidates_caches_store___block_invoke;
    handler[3] = &unk_1E4400328;
    objc_copyWeak(&v44, (id *)&v50);
    dispatch_source_set_event_handler(v41, handler);
    dispatch_resume(*((dispatch_object_t *)v15 + 16));
    objc_msgSend(v15, "invalidateAndRefreshCache");
    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)&v50);
  }

  return (_PSFeatureCache *)v15;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)_PSFeatureCache;
  -[_PSFeatureCache dealloc](&v3, sel_dealloc);
}

- (id)addSelfToCandidates:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  +[_PSCandidate selfCandidate](_PSCandidate, "selfCandidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (void)setPredictionContextWithContext:(id)a3
{
  _PSPredictionContext *v4;
  _PSPredictionContext *context;

  v4 = (_PSPredictionContext *)a3;
  pthread_mutex_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  pthread_mutex_unlock(&self->_lock);
}

- (id)computeEphemeralFeaturesWithCandidates:(id)a3 context:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;
  NSMutableDictionary *cache;
  _PSHistogramFeatureData *histogramFeatureData;
  void *v11;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[_PSShareSheetEphemeralFeatureManager setCandidates:](self->_ephemeralFeatureManager, "setCandidates:", v8);
  -[_PSShareSheetEphemeralFeatureManager setContext:](self->_ephemeralFeatureManager, "setContext:", v7);

  cache = self->_cache;
  self->_cache = 0;

  histogramFeatureData = self->_histogramFeatureData;
  self->_histogramFeatureData = 0;

  -[_PSFeatureCache refreshDurableCachesWithCandidates:](self, "refreshDurableCachesWithCandidates:", v8);
  -[_PSShareSheetEphemeralFeatureManager computeFeaturesWithHistogramFeatures:](self->_ephemeralFeatureManager, "computeFeaturesWithHistogramFeatures:", self->_histogramFeatureData);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  return v11;
}

- (BOOL)isDurableFeaturesSetAdmissible
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v2 = objc_alloc_init(MEMORY[0x1E0C99EA0]);
  objc_msgSend(v2, "objectForKey:", CFSTR("beginDurableFeatureComputation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("computeDurableFeatures"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6 || (objc_msgSend(v3, "timeIntervalSince1970"), v8 = v7, objc_msgSend(v5, "timeIntervalSince1970"), v8 >= v9))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(v3, "timeIntervalSince1970");
    v14 = vabdd_f64(v12, v13) < 432000.0;

  }
  return v14;
}

- (BOOL)isCacheEmpty
{
  _PSFeatureCache *v2;
  _opaque_pthread_mutex_t *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LOBYTE(v2) = v2->_cache == 0;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (void)refreshDurableCachesWithCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  NSMutableDictionary *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _PSHistogramFeatureData *v42;
  _PSHistogramFeatureData *histogramFeatureData;
  NSObject *v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableDictionary *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  NSMutableDictionary *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[4];
  NSMutableDictionary *v69;
  _PSFeatureCache *v70;
  uint8_t buf[4];
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  v53 = (void *)objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  -[_PSFeatureCache addSelfToCandidates:](self, "addSelfToCandidates:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_candidates, v9);
  v47 = v9;
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_pas_mappedArrayWithTransform:", &__block_literal_global_29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0C99D80]);
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_106);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v12, "initWithObjects:forKeys:", v11, v13);

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: Refreshing durable features", buf, 2u);
  }

  v15 = self->_cache;
  v16 = MEMORY[0x1E0C809B0];
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_107;
  v68[3] = &unk_1E4401218;
  v17 = v15;
  v69 = v17;
  v70 = self;
  objc_msgSend(v4, "_pas_mappedSetWithTransform:", v68);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFeatureCacheDurableCachesWithCandidates", " enableTelemetry=YES ", buf, 2u);
  }

  v46 = objc_alloc_init(MEMORY[0x1E0C99EA0]);
  objc_msgSend(v46, "objectForKey:", CFSTR("pruneDurableFeatureStoreBeforeDate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v52 = (void *)v8;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v7;
  v49 = v21;

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v72 = v55;
    _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: candidates to fetch %{private}@", buf, 0xCu);
  }

  v50 = v17;
  if (objc_msgSend(v55, "count"))
  {
    BiomeLibrary();
    v23 = v4;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "MLSE");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ShareSheet");
    v26 = v5;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "DurableFeatureStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v26;
    v17 = v50;

    objc_msgSend(v28, "publisher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v16;
    v65[1] = 3221225472;
    v65[2] = __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_110;
    v65[3] = &unk_1E4401240;
    v66 = v49;
    v67 = v55;
    objc_msgSend(v29, "filterWithIsIncluded:", v65);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v16;
    v56[1] = 3221225472;
    v56[2] = __54___PSFeatureCache_refreshDurableCachesWithCandidates___block_invoke_3;
    v56[3] = &unk_1E4401288;
    v57 = v51;
    v58 = v5;
    v59 = v50;
    v60 = v6;
    v61 = v54;
    v62 = v53;
    v63 = v48;
    v64 = v52;
    v31 = (id)objc_msgSend(v30, "sinkWithCompletion:receiveInput:", &__block_literal_global_114, v56);

    v4 = v23;
  }
  -[_PSHistogramFeatureData cache](self->_histogramFeatureData, "cache");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[_PSHistogramFeatureData cache](self->_histogramFeatureData, "cache");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v33);

  }
  -[_PSHistogramFeatureData bucketSums](self->_histogramFeatureData, "bucketSums");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[_PSHistogramFeatureData bucketSums](self->_histogramFeatureData, "bucketSums");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addEntriesFromDictionary:", v35);

  }
  -[_PSHistogramFeatureData bucketHasEver](self->_histogramFeatureData, "bucketHasEver");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[_PSHistogramFeatureData bucketHasEver](self->_histogramFeatureData, "bucketHasEver");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addEntriesFromDictionary:", v37);

  }
  -[_PSHistogramFeatureData factorToUniqueBucketNames](self->_histogramFeatureData, "factorToUniqueBucketNames");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    -[_PSHistogramFeatureData factorToUniqueBucketNames](self->_histogramFeatureData, "factorToUniqueBucketNames");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addEntriesFromDictionary:", v39);

  }
  -[_PSHistogramFeatureData candidateTimeIntervalSums](self->_histogramFeatureData, "candidateTimeIntervalSums");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[_PSHistogramFeatureData candidateTimeIntervalSums](self->_histogramFeatureData, "candidateTimeIntervalSums");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addEntriesFromDictionary:", v41);

  }
  v42 = (_PSHistogramFeatureData *)objc_opt_new();
  histogramFeatureData = self->_histogramFeatureData;
  self->_histogramFeatureData = v42;

  -[_PSHistogramFeatureData setCache:](self->_histogramFeatureData, "setCache:", v6);
  -[_PSHistogramFeatureData setBucketSums:](self->_histogramFeatureData, "setBucketSums:", v54);
  -[_PSHistogramFeatureData setBucketHasEver:](self->_histogramFeatureData, "setBucketHasEver:", v53);
  -[_PSHistogramFeatureData setFactorToUniqueBucketNames:](self->_histogramFeatureData, "setFactorToUniqueBucketNames:", v48);
  -[_PSHistogramFeatureData setCandidateTimeIntervalSums:](self->_histogramFeatureData, "setCandidateTimeIntervalSums:", v52);
  if (v17)
    -[NSMutableDictionary addEntriesFromDictionary:](v17, "addEntriesFromDictionary:", v5);
  else
    objc_storeStrong((id *)&self->_cache, v5);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFeatureCacheDurableCachesWithCandidates", (const char *)&unk_1A0908603, buf, 2u);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: finished refreshing durable feature cache", buf, 2u);
  }

}

- (void)invalidateAndRefreshCache
{
  NSObject *v3;
  NSMutableDictionary *cache;
  _PSHistogramFeatureData *histogramFeatureData;
  dispatch_time_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: Invalidating and refreshing cache", buf, 2u);
  }

  pthread_mutex_lock(&self->_lock);
  dispatch_suspend((dispatch_object_t)self->_timer);
  cache = self->_cache;
  self->_cache = 0;

  histogramFeatureData = self->_histogramFeatureData;
  self->_histogramFeatureData = 0;

  v6 = dispatch_time(0, self->_timeDelay);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v6, 0xFFFFFFFFFFFFFFFFLL, self->_leeway);
  -[_PSFeatureCache refreshDurableCachesWithCandidates:](self, "refreshDurableCachesWithCandidates:", self->_candidates);
  dispatch_resume((dispatch_object_t)self->_timer);
  pthread_mutex_unlock(&self->_lock);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: Finished invalidating and refreshing cache", v8, 2u);
  }

}

- (id)fetchFeaturesWithCandidates:(id)a3 context:(id)a4
{
  id v7;
  _opaque_pthread_mutex_t *p_lock;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v7 = a4;
  p_lock = &self->_lock;
  v9 = a3;
  pthread_mutex_lock(&self->_lock);
  objc_storeStrong((id *)&self->_context, a4);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetRefreshDurableCachesWithCandidates", " enableTelemetry=YES ", buf, 2u);
  }

  -[_PSFeatureCache refreshDurableCachesWithCandidates:](self, "refreshDurableCachesWithCandidates:", v9);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetRefreshDurableCachesWithCandidates", (const char *)&unk_1A0908603, v18, 2u);
  }

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetReplaceEphemeralFeaturesWithCache", (const char *)&unk_1A0908603, v17, 2u);
  }

  -[_PSFeatureCache replaceEphemeralFeaturesWithCache:](self, "replaceEphemeralFeaturesWithCache:", self->_cache);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetReplaceEphemeralFeaturesWithCache", (const char *)&unk_1A0908603, v16, 2u);
  }

  v14 = (void *)-[NSMutableDictionary copy](self->_cache, "copy");
  pthread_mutex_unlock(p_lock);

  return v14;
}

- (void)replaceEphemeralFeaturesWithCache:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: replacing ephemeral features", buf, 2u);
  }

  -[_PSShareSheetEphemeralFeatureManager setCandidates:](self->_ephemeralFeatureManager, "setCandidates:", self->_candidates);
  -[_PSShareSheetEphemeralFeatureManager setContext:](self->_ephemeralFeatureManager, "setContext:", self->_context);
  -[_PSShareSheetEphemeralFeatureManager computeFeaturesWithHistogramFeatures:](self->_ephemeralFeatureManager, "computeFeaturesWithHistogramFeatures:", self->_histogramFeatureData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53___PSFeatureCache_replaceEphemeralFeaturesWithCache___block_invoke;
  v9[3] = &unk_1E4400C78;
  v7 = v4;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_DEFAULT, "_PSFeatureCache: finished replacing ephemeral features", buf, 2u);
  }

}

- (id)getFeatureValueForLabeledDataStore:(id)a3
{
  id v3;
  char isKindOfClass;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = objc_alloc(MEMORY[0x1E0D020B0]);
  v6 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v5, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:doubleValuedVectorValue:", 0, 0, 0, 0, 0, v3);
  }
  else
  {
    v8 = objc_msgSend(v3, "hasIntValue");
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "intValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = objc_msgSend(v3, "hasDoubleValue");
    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v3, "doubleValue");
      objc_msgSend(v11, "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(v3, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v3, "hasBoolValue");
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v7 = (void *)objc_msgSend(v6, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:doubleValuedVectorValue:", v9, v12, v13, v15, objc_msgSend(v3, "timeBucketValue"), 0);
    if (v14)

    if (v10)
    if (v8)

  }
  return v7;
}

- (void)setFeatureValueForFeatureName:(int)a3 featureValue:(id)a4 candidate:(id)a5 bundleID:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  _opaque_pthread_mutex_t *p_lock;
  NSMutableDictionary *v14;
  NSMutableDictionary *cache;
  _PSCandidate *v16;
  NSObject *v17;
  void *v18;
  _PSFeatureDictionary *v19;
  _PSFeatureDictionary *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v11)
  {
    p_lock = &self->_lock;
    pthread_mutex_lock(&self->_lock);
    if (!self->_cache)
    {
      v14 = (NSMutableDictionary *)objc_opt_new();
      cache = self->_cache;
      self->_cache = v14;

    }
    v16 = -[_PSCandidate initWithDomainId:derivedIntentId:bundleId:recipientsId:]([_PSCandidate alloc], "initWithDomainId:derivedIntentId:bundleId:recipientsId:", v11, v11, v12, 0);
    -[_PSCandidate candidateForDeduping](v16, "candidateForDeduping");
    v17 = objc_claimAutoreleasedReturnValue();

    BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v17);
      v19 = (_PSFeatureDictionary *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (!v19)
        v19 = (_PSFeatureDictionary *)MEMORY[0x1E0C9AA70];
      -[NSDictionary _ps_dictionaryByAddingEntryForObject:withKey:](v19, v10, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v21, v17);

    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        -[_PSFeatureCache setFeatureValueForFeatureName:featureValue:candidate:bundleID:].cold.2(v8, v28, v29, v30, v31, v32, v33, v34);

    }
    pthread_mutex_unlock(p_lock);

  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[_PSFeatureCache setFeatureValueForFeatureName:featureValue:candidate:bundleID:].cold.1(v8, v17, v22, v23, v24, v25, v26, v27);
  }

}

- (id)deviceIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_psDefaults, "objectForKey:", CFSTR("DeviceId"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[NSUserDefaults objectForKey:](self->_psDefaults, "objectForKey:", CFSTR("DeviceIdDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateByAddingTimeInterval:", -7776000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "compare:", v7) == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = objc_claimAutoreleasedReturnValue();

      -[NSUserDefaults setObject:forKey:](self->_psDefaults, "setObject:forKey:", v9, CFSTR("DeviceId"));
      -[NSUserDefaults setObject:forKey:](self->_psDefaults, "setObject:forKey:", v3, CFSTR("DeviceIdDate"));
      v5 = (void *)v9;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSUserDefaults setObject:forKey:](self->_psDefaults, "setObject:forKey:", v5, CFSTR("DeviceId"));
    -[NSUserDefaults setObject:forKey:](self->_psDefaults, "setObject:forKey:", v3, CFSTR("DeviceIdDate"));
  }

  return v5;
}

- (id)privacyMitigateFeatures:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;

  v3 = a3;
  if ((os_variant_has_internal_content() & 1) != 0
    || !objc_msgSend(v3, "timeBucketValue")
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "timeBucketValue")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqual:", &unk_1E442B240),
        v4,
        (v5 & 1) != 0))
  {
    v6 = v3;
  }
  else
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D020D0]), "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, 0, 0, objc_msgSend(v3, "timeBucketValue"));
  }
  v7 = v6;

  return v7;
}

- (void)saveToVirtualStore
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  _QWORD *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD block[4];
  id v10;
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37___PSFeatureCache_saveToVirtualStore__block_invoke;
  v8[3] = &unk_1E43FEB68;
  v8[4] = self;
  v4 = v8;
  v5 = queue;
  v6 = (void *)os_transaction_create();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke;
  block[3] = &unk_1E4401318;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  dispatch_async(v5, block);

}

- (id)getHistogramFeatureData
{
  _opaque_pthread_mutex_t *p_lock;
  _PSHistogramFeatureData *v4;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = self->_histogramFeatureData;
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (_PSShareSheetEphemeralFeatureManager)ephemeralFeatureManager
{
  return self->_ephemeralFeatureManager;
}

- (void)setEphemeralFeatureManager:(id)a3
{
  objc_storeStrong((id *)&self->_ephemeralFeatureManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralFeatureManager, 0);
  objc_storeStrong((id *)&self->_virtualFeatureStreamSource, 0);
  objc_storeStrong((id *)&self->_featureStore, 0);
  objc_storeStrong((id *)&self->_psDefaults, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_caches, 0);
  objc_storeStrong((id *)&self->_histogramFeatureData, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setFeatureValueForFeatureName:(uint64_t)a3 featureValue:(uint64_t)a4 candidate:(uint64_t)a5 bundleID:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1A07F4000, a2, a3, "candidate was nil for featureName: %i", a5, a6, a7, a8, 0);
}

- (void)setFeatureValueForFeatureName:(uint64_t)a3 featureValue:(uint64_t)a4 candidate:(uint64_t)a5 bundleID:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1A07F4000, a2, a3, "featureNameAsString was nil for featureName: %i", a5, a6, a7, a8, 0);
}

@end
