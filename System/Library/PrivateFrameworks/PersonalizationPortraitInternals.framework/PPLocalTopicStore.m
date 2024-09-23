@implementation PPLocalTopicStore

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  BOOL v8;
  unint64_t v10;
  char v11;

  v11 = 0;
  v10 = 0;
  v8 = -[PPTopicStorage deleteAllTopicsFromSourcesWithBundleId:groupIds:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsFromSourcesWithBundleId:groupIds:atLeastOneTopicRemoved:deletedCount:error:", a3, a4, &v11, &v10, a6);
  if (v11)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a5)
    *a5 = v10;
  return v8;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 algorithm:(unint64_t)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  BOOL v9;
  unint64_t v11;
  char v12;

  v12 = 0;
  v11 = 0;
  v9 = -[PPTopicStorage deleteAllTopicsFromSourcesWithBundleId:groupIds:algorithm:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsFromSourcesWithBundleId:groupIds:algorithm:atLeastOneTopicRemoved:deletedCount:error:", a3, a4, a5, &v12, &v11, a7);
  if (v12)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a6)
    *a6 = v11;
  return v9;
}

+ (id)defaultStore
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  pthread_mutex_lock(&defaultStore_lock_18323);
  if (!defaultStore_instance_18324)
  {
    v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance_18324;
    defaultStore_instance_18324 = v2;

    if (!defaultStore_instance_18324)
    {
      pp_topics_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPLocalTopicStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }

    }
  }
  v5 = (id)defaultStore_instance_18324;
  pthread_mutex_unlock(&defaultStore_lock_18323);
  return v5;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  BOOL v7;
  unint64_t v9;
  char v10;

  v10 = 0;
  v9 = 0;
  v7 = -[PPTopicStorage deleteAllTopicsFromSourcesWithBundleId:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsFromSourcesWithBundleId:atLeastOneTopicRemoved:deletedCount:error:", a3, &v10, &v9, a5);
  if (v10)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a4)
    *a4 = v9;
  return v7;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 algorithm:(unint64_t)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  BOOL v8;
  unint64_t v10;
  char v11;

  v11 = 0;
  v10 = 0;
  v8 = -[PPTopicStorage deleteAllTopicsFromSourcesWithBundleId:algorithm:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsFromSourcesWithBundleId:algorithm:atLeastOneTopicRemoved:deletedCount:error:", a3, a4, &v11, &v10, a6);
  if (v11)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a5)
    *a5 = v10;
  return v8;
}

- (PPLocalTopicStore)initWithStorage:(id)a3 trialWrapper:(id)a4
{
  id v8;
  id v9;
  id *v10;
  PPLocalTopicStore *v11;
  uint64_t v12;
  NSCache *modelCache;
  void *v14;
  uint64_t v15;
  _PASLock *lock;
  PPTopicBlocklist *v17;
  PPTopicBlocklist *blocklist;
  PPTrialWrapper *trialWrapper;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSString *cachePath;
  uint64_t v30;
  OS_dispatch_queue *cacheUpdateQueue;
  uint64_t v32;
  OS_dispatch_queue *cacheAsyncUpdateQueue;
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  objc_super v40;
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalTopicStore.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storage"));

  }
  v40.receiver = self;
  v40.super_class = (Class)PPLocalTopicStore;
  v10 = -[PPTopicStore _initFromSubclass](&v40, sel__initFromSubclass);
  v11 = (PPLocalTopicStore *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 10, a3);
    v12 = objc_opt_new();
    modelCache = v11->_modelCache;
    v11->_modelCache = (NSCache *)v12;

    v14 = (void *)objc_opt_new();
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v14);

    lock = v11->_lock;
    v11->_lock = (_PASLock *)v15;

    objc_storeStrong((id *)&v11->_trialWrapper, a4);
    v17 = -[PPTopicBlocklist initWithTrialWrapper:]([PPTopicBlocklist alloc], "initWithTrialWrapper:", v11->_trialWrapper);
    blocklist = v11->_blocklist;
    v11->_blocklist = v17;

    location = 0;
    objc_initWeak(&location, v11);
    trialWrapper = v11->_trialWrapper;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __50__PPLocalTopicStore_initWithStorage_trialWrapper___block_invoke;
    v37[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v38, &location);
    v20 = (void *)MEMORY[0x1C3BD6630](-[PPTrialWrapper addUpdateHandlerForNamespaceName:block:](trialWrapper, "addUpdateHandlerForNamespaceName:block:", CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"), v37));
    -[PPTopicStorage parentDirectory](v11->_storage, "parentDirectory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("Topics"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v24 = objc_msgSend(v23, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v22, 1, 0, &v36);
    v25 = v36;
    if ((v24 & 1) == 0)
    {
      pp_default_log_handle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v25;
        _os_log_error_impl(&dword_1C392E000, v26, OS_LOG_TYPE_ERROR, "PPLocalTopicStore had an error while trying to create the cache directory: %@", buf, 0xCu);
      }

    }
    v27 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("ScoreCache"));
    v28 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v27);
    cachePath = v11->_cachePath;
    v11->_cachePath = (NSString *)v28;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "PPLocalTopicStore-cache");
    v30 = objc_claimAutoreleasedReturnValue();
    cacheUpdateQueue = v11->_cacheUpdateQueue;
    v11->_cacheUpdateQueue = (OS_dispatch_queue *)v30;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPLocalTopicStore-asyncCache", 9);
    v32 = objc_claimAutoreleasedReturnValue();
    cacheAsyncUpdateQueue = v11->_cacheAsyncUpdateQueue;
    v11->_cacheAsyncUpdateQueue = (OS_dispatch_queue *)v32;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (PPLocalTopicStore)init
{
  void *v3;
  PPTopicStorage *v4;
  void *v5;
  PPLocalTopicStore *v6;

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PPTopicStorage initWithDatabase:]([PPTopicStorage alloc], "initWithDatabase:", v3);
    if (v4)
    {
      +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[PPLocalTopicStore initWithStorage:trialWrapper:](self, "initWithStorage:trialWrapper:", v4, v5);

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

- (id)cachePath:(id *)a3
{
  return self->_cachePath;
}

- (id)cachedTopicScores
{
  return (id)objc_msgSend(MEMORY[0x1E0D70CE0], "cachedTopicScoresAtPath:", self->_cachePath);
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
        -[PPStreamingTopicScorer addRecord:]((uint64_t)v8, *(void **)(*((_QWORD *)&v27 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v11);
  }
  v26 = 0;
  *(float *)&v14 = -[PPStreamingTopicScorer getFinalScoreWithAggregationResultOut:finalResultOut:]((uint64_t)v8, (uint64_t)&v26);
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
        _os_log_fault_impl(&dword_1C392E000, v17, OS_LOG_TYPE_FAULT, "PPTopicStore: unable to retrieve prediction %@", buf, 0xCu);
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

- (id)scoreTopics:(id)a3 scoringDate:(id)a4 decayRate:(double)a5 strictFiltering:(BOOL)a6 sourceStats:(id)a7 decayedFeedbackCounts:(id)a8 streamingScorer:(id *)a9 mlModel:(id)a10
{
  _BOOL4 v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  PPTopicStorage *storage;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id *v37;
  PPStreamingTopicScorer *v38;
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  _QWORD *v47;
  PPScoreInterpreter *v48;
  void *v49;
  PPScoreInterpreter *v50;
  void *v51;
  PPScoreDict *v52;
  void *v53;
  PPScoreDict *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  id v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  id v86;
  void *v87;
  int v88;
  PPLocalTopicStore *v89;
  void *v90;
  void *v91;
  PPTrialWrapper *trialWrapper;
  id v93;
  NSObject *v94;
  double v95;
  double v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i;
  void *v103;
  float v104;
  float v105;
  int v106;
  double v107;
  NSObject *v108;
  void *v109;
  NSObject *v111;
  double v112;
  void *v113;
  id v114;
  id v115;
  unsigned int v116;
  id v117;
  void *v118;
  uint64_t v119;
  id v120;
  id v121;
  id v122;
  PPLocalTopicStore *v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint8_t buf[4];
  double v134;
  __int16 v135;
  double v136;
  _BYTE v137[22];
  __int16 v138;
  const __CFString *v139;
  uint64_t v140;

  v13 = a6;
  v140 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  if (objc_msgSend(v16, "count"))
  {
    v122 = v16;
    v20 = v16;
    v128 = v17;
    v21 = v18;
    v22 = v19;
    if (!self)
    {
      v127 = v21;
      v24 = 0;
      goto LABEL_51;
    }
    v120 = v19;
    v121 = v18;
    v119 = MEMORY[0x1C3BD6630]();
    v123 = self;
    if (v21)
    {
      v126 = 0;
      v127 = v21;
      v23 = 0;
    }
    else
    {
      objc_opt_self();
      +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_TP_Agg.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_TP_Final.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      v27 = 0;
      if (v23 && v25)
      {
        v28 = +[PPStreamingTopicScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingTopicScorer, v23);
        v27 = +[PPStreamingTopicScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingTopicScorer, v26) | v28;
      }
      v126 = v26;
      storage = self->_storage;
      v30 = (void *)MEMORY[0x1C3BD6630]();
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E59E28, 0);
      objc_autoreleasePoolPop(v30);
      -[PPTopicStorage sourceStats:withExcludedAlgorithms:](storage, "sourceStats:withExcludedAlgorithms:", v27, v31);
      v127 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "topic");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_alloc(MEMORY[0x1E0D70CB8]);
    v118 = v33;
    objc_msgSend(v33, "topicIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend(v34, "initWithTopicIdentifier:mostRelevantRecord:", v35, v36);

    v37 = (id *)*a9;
    v125 = v23;
    if (!*a9)
    {
      v38 = [PPStreamingTopicScorer alloc];
      v117 = v128;
      v39 = v127;
      if (v38
        && (*(_QWORD *)v137 = v38,
            *(_QWORD *)&v137[8] = PPStreamingTopicScorer,
            (v40 = objc_msgSendSuper2((objc_super *)v137, sel_init)) != 0))
      {
        v41 = v40;
        v116 = v13;
        objc_opt_self();
        +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_TP_Agg.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
        v42 = objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          v43 = (_QWORD *)v42;
          v114 = v22;
          v115 = v17;
          objc_opt_self();
          +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_TP_Final.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
          v44 = objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            v45 = v44;
            v46 = *MEMORY[0x1E0D70EA8];
            v47 = v43;
            v48 = -[PPScoreInterpreter initWithBytecode:]([PPScoreInterpreter alloc], "initWithBytecode:", v43);
            v49 = (void *)v41[1];
            v41[1] = v48;

            v50 = -[PPScoreInterpreter initWithBytecode:]([PPScoreInterpreter alloc], "initWithBytecode:", v45);
            v51 = (void *)v41[2];
            v41[2] = v50;

            v52 = [PPScoreDict alloc];
            v113 = (void *)v45;
            v53 = (void *)objc_opt_new();
            v54 = -[PPScoreDict initWithScoreInputSet:](v52, "initWithScoreInputSet:", v53);

            *(float *)&v55 = v46;
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 2, v55);
            *(float *)&v56 = (float)objc_msgSend(v39, "minRefCount");
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 6, v56);
            *(float *)&v57 = (float)objc_msgSend(v39, "maxRefCount");
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 7, v57);
            objc_msgSend(v39, "avgRefCount");
            *(float *)&v58 = v58;
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 8, v58);
            objc_msgSend(v39, "medianRefCount");
            *(float *)&v59 = v59;
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 9, v59);
            *(float *)&v60 = (float)objc_msgSend(v39, "uniqueBundleIdCount");
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 10, v60);
            *(float *)&v61 = (float)objc_msgSend(v39, "uniqueDocIdCount");
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 11, v61);
            *(float *)&v62 = (float)(unint64_t)objc_msgSend(v39, "recordCount");
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 23, v62);
            *(float *)&v63 = (float)v116;
            -[PPScoreDict setScalarValue:forIndex:](v54, "setScalarValue:forIndex:", 16, v63);
            v64 = (void *)MEMORY[0x1E0C99DC8];
            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "localeIdentifier");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "componentsFromLocaleIdentifier:", v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[PPScoreDict setObject:forIndex:](v54, "setObject:forIndex:", v68, 5);

            v69 = v117;
            -[PPScoreDict setObject:forIndex:](v54, "setObject:forIndex:", v117, 7);
            objc_msgSend(v39, "earliestDate");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[PPScoreDict setObject:forIndex:](v54, "setObject:forIndex:", v70, 9);

            objc_msgSend(v39, "latestDate");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[PPScoreDict setObject:forIndex:](v54, "setObject:forIndex:", v71, 10);

            v72 = v113;
            v73 = (void *)v41[3];
            v41[3] = v54;

          }
          else
          {
            v72 = v43;
            v47 = v41;
            v41 = 0;
            v69 = v117;
          }
          v74 = v41;

          v41 = v47;
          v22 = v114;
          v17 = v115;
        }
        else
        {
          v74 = 0;
          v69 = v117;
        }

      }
      else
      {
        v74 = 0;
        v69 = v117;
      }

      v75 = *a9;
      *a9 = v74;

      v76 = (id)objc_opt_self();
      v77 = (id)objc_opt_self();
      v37 = (id *)*a9;
    }
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v79 = v37[3];
      v80 = v22;
      objc_msgSend(v80, "engagedExplicitly");
      *(float *)&v81 = v81;
      objc_msgSend(v79, "setScalarValue:forIndex:", 12, v81);
      objc_msgSend(v80, "engagedImplicitly");
      *(float *)&v82 = v82;
      objc_msgSend(v79, "setScalarValue:forIndex:", 13, v82);
      objc_msgSend(v80, "rejectedExplicitly");
      *(float *)&v83 = v83;
      objc_msgSend(v79, "setScalarValue:forIndex:", 14, v83);
      objc_msgSend(v80, "rejectedImplicitly");
      *(float *)&v84 = v84;
      objc_msgSend(v79, "setScalarValue:forIndex:", 15, v84);
      objc_msgSend(v80, "latestDate");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v79, "setObject:forIndex:", v85, 11);
    }
    v86 = v22;

    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "topicScoringUsesHybrid");

    v89 = v123;
    if (v88)
    {
      -[NSCache objectForKey:](v123->_modelCache, "objectForKey:", CFSTR("scoring_model"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = (void *)v124;
      if (!v90)
      {
        trialWrapper = v123->_trialWrapper;
        *(_QWORD *)&v129 = 0;
        -[PPTrialWrapper mlModelForModelName:namespaceName:error:](trialWrapper, "mlModelForModelName:namespaceName:error:", CFSTR("PPModel_TP.mlmodelc"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"), &v129);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = (id)v129;
        if (v93)
        {
          pp_topics_log_handle();
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v137 = 138412802;
            *(_QWORD *)&v137[4] = v93;
            *(_WORD *)&v137[12] = 2112;
            *(_QWORD *)&v137[14] = CFSTR("PPModel_TP.mlmodelc");
            v138 = 2112;
            v139 = CFSTR("PERSONALIZATION_PORTRAIT_TOPICS");
            _os_log_error_impl(&dword_1C392E000, v94, OS_LOG_TYPE_ERROR, "PPlocalTopciStore: error %@ in retrieving %@ model with namespace %@", v137, 0x20u);
          }

          v91 = (void *)v124;
        }

        if (!v90)
        {
          pp_topics_log_handle();
          v111 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v137 = 0;
            _os_log_error_impl(&dword_1C392E000, v111, OS_LOG_TYPE_ERROR, "PPLocalTopicStore: unable to locate ML model.", v137, 2u);
          }

          v24 = 0;
          v19 = v120;
          v18 = v121;
          v97 = (void *)v119;
          goto LABEL_49;
        }
        v89 = v123;
        -[NSCache setObject:forKey:](v123->_modelCache, "setObject:forKey:", v90, CFSTR("scoring_model"));
      }
      -[PPLocalTopicStore finalScoreFromRecordsUsingHybrid:streamingScorer:mlModel:](v89, "finalScoreFromRecordsUsingHybrid:streamingScorer:mlModel:", v20, *a9, v90);
      v96 = v95;

      v97 = (void *)v119;
    }
    else
    {
      v131 = 0u;
      v132 = 0u;
      v129 = 0u;
      v130 = 0u;
      v98 = v20;
      v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v129, v137, 16);
      if (v99)
      {
        v100 = v99;
        v101 = *(_QWORD *)v130;
        do
        {
          for (i = 0; i != v100; ++i)
          {
            if (*(_QWORD *)v130 != v101)
              objc_enumerationMutation(v98);
            -[PPStreamingTopicScorer addRecord:]((uint64_t)*a9, *(void **)(*((_QWORD *)&v129 + 1) + 8 * i));
          }
          v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v129, v137, 16);
        }
        while (v100);
      }

      if (*a9)
        v96 = -[PPStreamingTopicScorer getFinalScoreWithAggregationResultOut:finalResultOut:]((uint64_t)*a9, 0);
      else
        v96 = 0.0;
      v97 = (void *)v119;
      v91 = (void *)v124;
    }
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "scoreThresholdForTopic");
    v105 = v104;

    if (v96 <= 0.0)
      v106 = 1;
    else
      v106 = v88;
    v22 = v86;
    if (v106 == 1)
    {
      v107 = v105;
      if (v96 < v107)
      {
        pp_topics_log_handle();
        v108 = objc_claimAutoreleasedReturnValue();
        v19 = v120;
        v109 = v125;
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
        {
          v112 = v107;
          if (!v88)
            v112 = 0.0;
          *(_DWORD *)buf = 134218240;
          v134 = v96;
          v135 = 2048;
          v136 = v112;
          _os_log_debug_impl(&dword_1C392E000, v108, OS_LOG_TYPE_DEBUG, "Portrait Scoring, filtering out score of %f below threshold of %f", buf, 0x16u);
        }

        v24 = 0;
        v18 = v121;
        goto LABEL_50;
      }
    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v91, v96);
    v19 = v120;
    v18 = v121;
LABEL_49:
    v109 = v125;
LABEL_50:

    objc_autoreleasePoolPop(v97);
LABEL_51:

    v16 = v122;
    goto LABEL_52;
  }
  v24 = 0;
LABEL_52:

  return v24;
}

- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4
{
  return -[PPLocalTopicStore rankedTopicsWithQuery:error:clientProcessName:](self, "rankedTopicsWithQuery:error:clientProcessName:", a3, a4, 0);
}

- (id)rankedTopicsWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  PPEvictingMinPriorityQueue *v14;
  uint64_t v15;
  PPEvictingMinPriorityQueue *v16;
  PPEvictingMinPriorityQueue *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  PPEvictingMinPriorityQueue *v23;
  char v24;

  v8 = a5;
  v9 = a3;
  -[PPLocalTopicStore _logParametersForQuery:client:method:]((uint64_t)self, v9, v8, CFSTR("rankedTopicsWithQuery"));
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v10, "setLimit:", -1);
  v11 = objc_msgSend(v9, "scoreWithCalibration");
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topicCalibrationTrie");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [PPEvictingMinPriorityQueue alloc];
  v15 = objc_msgSend(v9, "limit");

  v16 = -[PPEvictingMinPriorityQueue initWithCapacity:](v14, "initWithCapacity:", v15);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__PPLocalTopicStore_rankedTopicsWithQuery_error_clientProcessName___block_invoke;
  v21[3] = &unk_1E7E1CFB0;
  v24 = v11;
  v22 = v13;
  v23 = v16;
  v17 = v16;
  v18 = v13;
  -[PPLocalTopicStore iterScoredTopicsWithQuery:error:clientProcessName:block:](self, "iterScoredTopicsWithQuery:error:clientProcessName:block:", v10, a4, v8, v21);

  -[PPEvictingMinPriorityQueue extractSortedMutableArray](v17, "extractSortedMutableArray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)iterScoredTopicsWithQuery:(id)a3 error:(id *)a4 clientProcessName:(id)a5 block:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  PPTopicStorage *storage;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  dispatch_semaphore_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  _QWORD *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  signed int v42;
  signed int v43;
  NSObject *v44;
  unsigned int v45;
  void *v46;
  float v47;
  signed int v48;
  id v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  id v54;
  NSObject *v55;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  BOOL v66;
  _QWORD block[4];
  id v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD v71[4];
  NSObject *v72;
  NSObject *v73;
  PPLocalTopicStore *v74;
  id v75;
  _BYTE *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD v79[5];
  id v80;
  _QWORD v81[5];
  id v82;
  _QWORD aBlock[5];
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD *v89;
  uint64_t *v90;
  uint64_t *v91;
  uint64_t v92;
  unsigned int *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  unsigned int *v97;
  uint64_t v98;
  int v99;
  _QWORD v100[5];
  id v101;
  id v102;
  uint8_t buf[4];
  id v104;
  _BYTE v105[32];
  void (*v106)(uint64_t);
  id v107;
  PPLocalTopicStore *v108;
  uint64_t v109;
  char v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v62 = a5;
  v10 = a6;
  objc_msgSend(v9, "scoringDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_opt_new();
  v14 = v13;

  objc_opt_self();
  +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_TP_Agg.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  +[PPScoreInterpreterBytecode bytecodeFromFactorName:namespaceName:](PPScoreInterpreterBytecode, "bytecodeFromFactorName:namespaceName:", CFSTR("PP2StageModel_TP_Final.plplist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  if (v65 && v63)
  {
    v16 = +[PPStreamingTopicScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingTopicScorer, v65);
    v15 = +[PPStreamingTopicScorer sourceStatsNeededForBytecode:]((uint64_t)PPStreamingTopicScorer, v63) | v16;
  }
  storage = self->_storage;
  v18 = (void *)MEMORY[0x1C3BD6630]();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E59E28, 0);
  objc_autoreleasePoolPop(v18);
  -[PPTopicStorage sourceStats:withExcludedAlgorithms:](storage, "sourceStats:withExcludedAlgorithms:", v15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy__18107;
  v100[4] = __Block_byref_object_dispose__18108;
  v101 = 0;
  v96 = 0;
  v97 = (unsigned int *)&v96;
  v98 = 0x2020000000;
  v99 = 0;
  v92 = 0;
  v93 = (unsigned int *)&v92;
  v94 = 0x2020000000;
  v95 = 0;
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPLocalTopicStore-processing", qos_class_self());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke;
  aBlock[3] = &unk_1E7E1CFD8;
  aBlock[4] = self;
  v59 = v14;
  v84 = v59;
  v64 = v9;
  v85 = v64;
  v60 = v20;
  v86 = v60;
  v89 = v100;
  v90 = &v92;
  v91 = &v96;
  v61 = v21;
  v87 = v61;
  v58 = v10;
  v88 = v58;
  v22 = _Block_copy(aBlock);
  *(_QWORD *)v105 = 0;
  *(_QWORD *)&v105[8] = v105;
  *(_QWORD *)&v105[16] = 0x3032000000;
  *(_QWORD *)&v105[24] = __Block_byref_object_copy__18107;
  v106 = __Block_byref_object_dispose__18108;
  v107 = 0;
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__18107;
  v81[4] = __Block_byref_object_dispose__18108;
  v82 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x3032000000;
  v79[3] = __Block_byref_object_copy__18107;
  v79[4] = __Block_byref_object_dispose__18108;
  v80 = 0;
  pp_topics_signpost_handle();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_generate(v23);

  pp_topics_signpost_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PPLocalTopicStore.iterScoredTopicsWithQuery.aggregation", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPLocalTopicStore-scoring", qos_class_self());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = dispatch_semaphore_create(64);
  v29 = (void *)objc_msgSend(v64, "copy");
  objc_msgSend(v29, "setOrderByIdentifier:", 1);
  objc_msgSend(v29, "setRemoveNearDuplicates:", 1);
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_186;
  v71[3] = &unk_1E7E1D028;
  v76 = v105;
  v77 = v81;
  v78 = v79;
  v30 = v28;
  v72 = v30;
  v31 = v27;
  v73 = v31;
  v32 = v22;
  v74 = self;
  v75 = v32;
  v33 = v71;
  v34 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v34, "setLimit:", -1);
  v102 = 0;
  v66 = -[PPLocalTopicStore iterTopicRecordsWithQuery:error:block:](self, "iterTopicRecordsWithQuery:error:block:", v34, &v102, v33);

  v35 = v102;
  if (v66)
  {
    v36 = 0;
  }
  else
  {
    pp_topics_log_handle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v104 = v35;
      _os_log_error_impl(&dword_1C392E000, v37, OS_LOG_TYPE_ERROR, "_unlimitedTopicRecordsWithQuery: nil result from iterTopicRecordsWithQuery: %@", buf, 0xCu);
    }

    v36 = objc_retainAutorelease(v35);
  }

  v38 = v36;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_191;
  block[3] = &unk_1E7E1D050;
  v69 = v81;
  v39 = v32;
  v68 = v39;
  v70 = v79;
  dispatch_sync(v31, block);
  pp_topics_signpost_handle();
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v41, OS_SIGNPOST_INTERVAL_END, v24, "PPLocalTopicStore.iterScoredTopicsWithQuery.aggregation", ", buf, 2u);
  }

  _Block_object_dispose(v79, 8);
  _Block_object_dispose(v81, 8);

  _Block_object_dispose(v105, 8);
  if (v66)
  {
    v42 = atomic_load(v93 + 6);
    v43 = atomic_load(v97 + 6);
    pp_topics_log_handle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = atomic_load(v93 + 6);
      +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "scoreThresholdForTopic");
      *(_DWORD *)v105 = 67109632;
      *(_DWORD *)&v105[4] = v45;
      *(_WORD *)&v105[8] = 2048;
      *(double *)&v105[10] = v47;
      *(_WORD *)&v105[18] = 2048;
      *(_QWORD *)&v105[20] = v43 + (uint64_t)v42;
      _os_log_impl(&dword_1C392E000, v44, OS_LOG_TYPE_DEFAULT, "PPLocalTopicStore: filtered %d items below threshold of %f out of %tu total.", v105, 0x1Cu);

    }
    v48 = atomic_load(v97 + 6);
    v49 = v64;
    v50 = v62;
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v48;
    *(_QWORD *)v105 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v105[8] = 3221225472;
    *(_QWORD *)&v105[16] = __74__PPLocalTopicStore__petLoggingForQuery_count_clientProcessName_hasError___block_invoke;
    *(_QWORD *)&v105[24] = &unk_1E7E1FD78;
    v53 = (void (*)(uint64_t))v50;
    v106 = v53;
    v109 = v52;
    v54 = v49;
    v110 = 0;
    v107 = v54;
    v108 = self;
    dispatch_async(v51, v105);

  }
  else
  {
    pp_default_log_handle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v105 = 138412290;
      *(_QWORD *)&v105[4] = v38;
      _os_log_error_impl(&dword_1C392E000, v55, OS_LOG_TYPE_ERROR, "Error encountered while scoring named entities: %@", v105, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v38);
  }

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v96, 8);
  _Block_object_dispose(v100, 8);

  return v66;
}

- (BOOL)iterScoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 block:(id)a6
{
  if (self)
    LOBYTE(self) = -[PPLocalTopicStore _defaultIterScoresForTopicMapping:query:error:clientProcessName:block:]((uint64_t)self, a3, a4, a5, 0, a6);
  return (char)self;
}

- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5
{
  return -[PPLocalTopicStore scoresForTopicMapping:query:error:clientProcessName:](self, "scoresForTopicMapping:query:error:clientProcessName:", a3, a4, a5, 0);
}

- (id)scoresForTopicMapping:(id)a3 query:(id)a4 error:(id *)a5 clientProcessName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  PPEvictingMinPriorityQueue *v16;
  PPEvictingMinPriorityQueue *v17;
  PPLocalTopicStore *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  id v34;
  unint64_t v35;
  void *v36;
  int v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v49;
  void *context;
  id v51;
  void *v52;
  PPLocalTopicStore *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  _QWORD v59[4];
  PPEvictingMinPriorityQueue *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[PPLocalTopicStore _logParametersForQuery:client:method:]((uint64_t)self, v10, v11, CFSTR("scoresForTopicMapping"));
  v58 = 0;
  v12 = v9;
  v13 = v10;
  v14 = v11;
  v15 = v14;
  v53 = self;
  if (self)
  {
    v16 = -[PPEvictingMinPriorityQueue initWithCapacity:]([PPEvictingMinPriorityQueue alloc], "initWithCapacity:", objc_msgSend(v13, "limit"));
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __81__PPLocalTopicStore__defaultScoresForTopicMapping_query_clientProcessName_error___block_invoke;
    v59[3] = &unk_1E7E1FAB8;
    v17 = v16;
    v60 = v17;
    v18 = self;
    v19 = v13;
    v20 = v13;
    v21 = v15;
    -[PPLocalTopicStore _defaultIterScoresForTopicMapping:query:error:clientProcessName:block:]((uint64_t)v18, v12, v20, &v58, v15, v59);
    v22 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[PPEvictingMinPriorityQueue count](v17, "count");
    v24 = (void *)objc_msgSend(v22, "initWithCapacity:", (unint64_t)v23);
    v25 = -[PPEvictingMinPriorityQueue count](v17, "count");
    if (v26 > 0.0)
    {
      do
      {
        v27 = (void *)MEMORY[0x1C3BD6630](v25);
        -[PPEvictingMinPriorityQueue popItem](v17, "popItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v28, "score");
        objc_msgSend(v29, "numberWithDouble:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "item");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setValue:forKey:", v30, v31);

        objc_autoreleasePoolPop(v27);
        v25 = -[PPEvictingMinPriorityQueue count](v17, "count");
      }
      while (v32 > 0.0);
    }

  }
  else
  {
    v19 = v13;
    v21 = v14;
    v24 = 0;
  }
  v33 = v21;

  v34 = v58;
  -[PPLocalTopicStore _petLoggingForMappedTopicQuery:mappingId:count:clientProcessName:hasError:]((uint64_t)v53, v19, v12, objc_msgSend(v24, "count"), v21, v24 == 0);
  v35 = objc_msgSend(v24, "count");
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "maxNumberMappedTopics");

  if (v35 <= v37)
  {
    -[PPLocalTopicStore _dpLoggingForMappingId:mappedTopics:]((uint64_t)v53, v12, v24);
    v39 = v24;
  }
  else
  {
    v51 = v34;
    v52 = v12;
    context = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v24, "keysSortedByValueUsingComparator:", &__block_literal_global_212);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (id)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v38;
    objc_msgSend(v38, "subarrayWithRange:", 0, (int)objc_msgSend(v40, "maxNumberMappedTopics"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v55 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v24, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v47, v46);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      }
      while (v43);
    }

    v12 = v52;
    -[PPLocalTopicStore _dpLoggingForMappingId:mappedTopics:]((uint64_t)v53, v52, v39);

    objc_autoreleasePoolPop(context);
    v34 = v51;
    v33 = v21;
  }

  return v39;
}

- (id)unmapMappedTopicIdentifier:(id)a3 mappingIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PPLocalTopicStore _topicTransformForId:]((uint64_t)self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "QIDWeightsWithMappedTopicIdentifier:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (a5 && !v11)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D70D10];
    v18 = *MEMORY[0x1E0CB2D68];
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Mapped topic ID (%@) not found in this mapping (%@)."), v8, v9);
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 3, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (BOOL)iterTopicRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
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
  PPTopicStorage *storage;
  id v25;
  void (**v26)(_QWORD);
  _BOOL4 v27;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD aBlock[5];
  id v34;
  id v35;
  id v36;
  _QWORD *v37;
  _BYTE *v38;
  _QWORD v39[3];
  char v40;
  _BYTE buf[24];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PPLocalTopicStore _logParametersForQuery:client:method:]((uint64_t)self, v8, 0, CFSTR("iterTopicRecordsWithQuery"));
  pp_topics_log_handle();
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
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v42 = v15;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "iterTopicRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  if (objc_msgSend(v8, "limit"))
  {
    v16 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v16, "setLimit:", -1);
    v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v18 = objc_msgSend(v8, "limit");
    if (v18 >= 0x40)
      v19 = 64;
    else
      v19 = v18;
    v20 = (void *)objc_msgSend(v17, "initWithCapacity:", v19);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v40 = 0;
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PPLocalTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke;
    aBlock[3] = &unk_1E7E1D148;
    v37 = v39;
    aBlock[4] = self;
    v22 = v20;
    v34 = v22;
    v36 = v9;
    v38 = buf;
    v35 = v8;
    v23 = _Block_copy(aBlock);
    storage = self->_storage;
    v29[0] = v21;
    v29[1] = 3221225472;
    v29[2] = __59__PPLocalTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke_2;
    v29[3] = &unk_1E7E1D170;
    v25 = v22;
    v30 = v25;
    v26 = v23;
    v31 = v26;
    v32 = v39;
    v27 = -[PPTopicStorage iterTopicRecordsWithQuery:error:block:](storage, "iterTopicRecordsWithQuery:error:block:", v16, a4, v29);
    if (v27)
      v26[2](v26);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    LOBYTE(v27) = 1;
  }

  return v27;
}

- (id)topicRecordsWithQuery:(id)a3 error:(id *)a4
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
  pp_topics_log_handle();
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
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "topicRecordsWithQuery called with limit %tu and date range: %@ - %@", buf, 0x20u);

  }
  v13 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __49__PPLocalTopicStore_topicRecordsWithQuery_error___block_invoke;
  v18[3] = &unk_1E7E1F568;
  v19 = v13;
  v14 = v13;
  if (-[PPLocalTopicStore iterTopicRecordsWithQuery:error:block:](self, "iterTopicRecordsWithQuery:error:block:", v6, a4, v18))
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

- (id)topicExtractionsFromText:(id)a3 error:(id *)a4
{
  return -[PPLocalTopicStore topicExtractionsFromText:clientProcessName:error:](self, "topicExtractionsFromText:clientProcessName:error:", a3, CFSTR("com.apple.proactive.PersonalizationPortrait.Internal"), a4);
}

- (id)topicExtractionsFromText:(id)a3 clientProcessName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  pp_topics_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v72 = objc_msgSend(v7, "length");
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPLocalTopicStore: topicExtractionsFromText called with text length %tu", buf, 0xCu);
  }

  +[PPTopicExtractionPlugin sharedInstance](PPTopicExtractionPlugin, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extractionsFromText:bundleId:", v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  pp_topics_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "topicRecords");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count");
    *(_DWORD *)buf = 134217984;
    v72 = v53;
    _os_log_debug_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEBUG, "PPLocalTopicStore: topicExtractionsFromText found %tu topics", buf, 0xCu);

  }
  objc_msgSend(v11, "topicRecords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v55 = v8;
    v56 = v7;
    v14 = (void *)objc_opt_new();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v54 = v11;
    objc_msgSend(v11, "topicRecords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v62;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v62 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v19);
          v21 = objc_alloc(MEMORY[0x1E0D70C38]);
          objc_msgSend(v20, "topic");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "initialScore");
          v23 = (void *)objc_msgSend(v21, "initWithItem:score:", v22);
          objc_msgSend(v14, "addObject:", v23);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v17);
    }

    if (self)
    {
      -[PPLocalTopicStore _coalesceScoredTopics:exactMatchesInSourceText:](self, v14, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_opt_new();
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v26 = v24;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v66;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v66 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * v30), "first");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v31);

            ++v30;
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v65, buf, 16);
        }
        while (v28);
      }

      v32 = v25;
      if (objc_msgSend(v32, "count"))
      {
        -[PPTopicBlocklist indicesOfBlockedTopicsInScoredTopicArray:](self->_blocklist, "indicesOfBlockedTopicsInScoredTopicArray:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "count"))
        {
          v34 = objc_msgSend(v32, "count");
          v35 = objc_msgSend(v33, "count");
          pp_topics_log_handle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v37 = objc_msgSend(v32, "count");
            *(_DWORD *)buf = 134218240;
            v72 = v37;
            v73 = 2048;
            v74 = v34 - v35;
            _os_log_impl(&dword_1C392E000, v36, OS_LOG_TYPE_INFO, "PPLocalTopicStore filtering scored topic list from %tu to %tu", buf, 0x16u);
          }

          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v32, "count"));
          objc_msgSend(v38, "removeIndexes:", v33);
          objc_msgSend(v32, "objectsAtIndexes:", v38);
          v39 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v39 = v32;
        }
        v11 = v54;

      }
      else
      {
        v32 = v32;
        v39 = v32;
        v11 = v54;
      }
    }
    else
    {
      v32 = 0;
      v39 = 0;
      v11 = v54;
    }

    pp_topics_log_handle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend(v39, "count");
      *(_DWORD *)buf = 134217984;
      v72 = v42;
      _os_log_impl(&dword_1C392E000, v41, OS_LOG_TYPE_DEFAULT, "PPLocalTopicStore: topicExtractionsFromText finished coalescing and filtering with blocklist, %tu topics remain", buf, 0xCu);
    }

    objc_msgSend(v39, "sortedArrayUsingComparator:", &__block_literal_global_229_18214);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)objc_opt_new();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v58;
      do
      {
        v48 = 0;
        do
        {
          if (*(_QWORD *)v58 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v48), "scoredTopic");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "item");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v50);

          ++v48;
        }
        while (v46 != v48);
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      }
      while (v46);
    }

    v8 = v55;
    v7 = v56;
  }
  else
  {
    v40 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v40;
}

- (BOOL)donateTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 exactMatchesInSourceText:(id)a8 error:(id *)a9
{
  _BOOL4 v11;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  int v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  NSObject *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  unsigned int v113;
  id v114;
  id v115;
  void *v116;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  uint64_t v132;
  void *v133;
  uint8_t v134[4];
  uint64_t v135;
  __int16 v136;
  uint64_t v137;
  _BYTE buf[24];
  void *v139;
  id v140;
  PPLocalTopicStore *v141;
  id v142;
  id v143;
  unint64_t v144;
  uint64_t v145;

  v11 = a6;
  v145 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a8;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalTopicStore.m"), 1185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topics"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocalTopicStore.m"), 1186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

LABEL_3:
  pp_topics_log_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v15, "count");
    objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v139 = v20;
    _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPLocalTopicStore received a donation of %tu topics from source: %@, algorithm: %@", buf, 0x20u);

  }
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "bundleIdentifierIsEnabledForDonation:", v22);

  if ((v23 & 1) == 0)
  {
    pp_topics_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v16, "bundleId");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v107;
      _os_log_debug_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEBUG, "Suppressed topic donation from disabled bundleId: %@", buf, 0xCu);

    }
    LOBYTE(v29) = 1;
    goto LABEL_71;
  }
  if (!v11)
    goto LABEL_15;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "bundleIdentifierIsEnabledForCloudKit:", v25);

  if ((v26 & 1) == 0)
  {
    pp_topics_log_handle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v16, "bundleId");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v108;
      _os_log_debug_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEBUG, "Suppressed topic cloudSync on donation from disabled bundleId: %@", buf, 0xCu);

    }
LABEL_15:
    v27 = 0;
    goto LABEL_16;
  }
  v27 = 1;
LABEL_16:
  v114 = v15;
  v115 = v17;
  v116 = v16;
  v113 = v27;
  if (a5 == 5
    && (objc_msgSend(v16, "documentId"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        v32 = *MEMORY[0x1E0D70EB0],
        v33 = objc_msgSend(v31, "hasPrefix:", *MEMORY[0x1E0D70EB0]),
        v31,
        v33))
  {
    v34 = v15;
    v35 = v16;
    v36 = v35;
    v112 = v34;
    if (self)
    {
      v120 = v35;
      v122 = (void *)objc_opt_new();
      -[PPTrialWrapper plistForFactorName:namespaceName:](self->_trialWrapper, "plistForFactorName:namespaceName:", CFSTR("PhotosTopicMap.plist"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = 0u;
      v128 = 0u;
      v129 = 0u;
      v130 = 0u;
      v38 = v34;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v127, buf, 16);
      v111 = v32;
      if (!v39)
      {
        v42 = 1;
        goto LABEL_69;
      }
      v40 = v39;
      v41 = *(_QWORD *)v128;
      v118 = *MEMORY[0x1E0D70D18];
      v119 = *MEMORY[0x1E0D70D10];
      v42 = 1;
      while (1)
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v128 != v41)
            objc_enumerationMutation(v38);
          v44 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v43);
          objc_msgSend(v44, "item");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "topicIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            objc_msgSend(v44, "item");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "topicIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v51 = objc_alloc(MEMORY[0x1E0D70C38]);
            v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70CB8]), "initWithTopicIdentifier:", v50);
            objc_msgSend(v44, "score");
            v53 = (void *)objc_msgSend(v51, "initWithItem:score:", v52);

            objc_msgSend(v122, "addObject:", v53);
LABEL_32:

            goto LABEL_33;
          }
          pp_private_log_handle();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v44, "item");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "topicIdentifier");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v134 = 138412290;
            v135 = (uint64_t)v63;
            _os_log_debug_impl(&dword_1C392E000, v54, OS_LOG_TYPE_DEBUG, "PPLocalTopicStore: got unmatched photos topic: %@", v134, 0xCu);

          }
          if (a9)
          {
            v55 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v44, "item");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "topicIdentifier");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v57, "length");
            objc_msgSend(v120, "bundleId");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (void *)objc_msgSend(v55, "initWithFormat:", CFSTR("No unmapping found for Photos topic to QID: topic.length:%tu donated from %@"), v58, v59);

            pp_topics_log_handle();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v134 = 138412290;
              v135 = (uint64_t)v50;
              _os_log_error_impl(&dword_1C392E000, v60, OS_LOG_TYPE_ERROR, "%@", v134, 0xCu);
            }

            v61 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v132 = v118;
            v133 = v50;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 0;
            *a9 = (id)objc_msgSend(v61, "initWithDomain:code:userInfo:", v119, 3, v53);
            goto LABEL_32;
          }
          v42 = 0;
LABEL_33:
          ++v43;
        }
        while (v40 != v43);
        v64 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v127, buf, 16);
        v40 = v64;
        if (!v64)
        {
LABEL_69:

          v99 = objc_alloc(MEMORY[0x1E0D70C78]);
          v36 = v120;
          objc_msgSend(v120, "bundleId");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "groupId");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "documentId");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "stringByReplacingOccurrencesOfString:withString:", v111, &stru_1E7E221D0);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "date");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = (void *)objc_msgSend(v99, "initWithBundleId:groupId:documentId:date:", v100, v101, v103, v104);

          v29 = -[PPLocalTopicStore donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:](self, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v122, v105, 5, v113, 0, a9, a7) & v42;
          goto LABEL_70;
        }
      }
    }
    LOBYTE(v29) = 0;
LABEL_70:

    v15 = v114;
    v17 = v115;
    v16 = v116;
  }
  else
  {
    v65 = self;
    -[PPLocalTopicStore _coalesceScoredTopics:exactMatchesInSourceText:](self, v15, v17);
    v66 = (id)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      v67 = (void *)objc_opt_new();
      v127 = 0u;
      v128 = 0u;
      v129 = 0u;
      v130 = 0u;
      v68 = v66;
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v127, buf, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v128;
        do
        {
          for (i = 0; i != v70; ++i)
          {
            if (*(_QWORD *)v128 != v71)
              objc_enumerationMutation(v68);
            objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * i), "first");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "addObject:", v73);

          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v127, buf, 16);
        }
        while (v70);
      }

      if (objc_msgSend(v67, "count"))
      {
        -[PPTopicBlocklist indicesOfBlockedTopicsInScoredTopicArray:](self->_blocklist, "indicesOfBlockedTopicsInScoredTopicArray:", v67);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v74, "count"))
        {
          v75 = objc_msgSend(v67, "count");
          v76 = objc_msgSend(v74, "count");
          pp_topics_log_handle();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            v78 = objc_msgSend(v67, "count");
            *(_DWORD *)v134 = 134218240;
            v135 = v78;
            v136 = 2048;
            v137 = v75 - v76;
            _os_log_impl(&dword_1C392E000, v77, OS_LOG_TYPE_INFO, "PPLocalTopicStore filtering scored topic list from %tu to %tu", v134, 0x16u);
          }

          v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v67, "count"));
          objc_msgSend(v79, "removeIndexes:", v74);
          objc_msgSend(v68, "objectsAtIndexes:", v79);
          v65 = (id)objc_claimAutoreleasedReturnValue();

          v17 = v115;
        }
        else
        {
          v65 = v68;
        }

      }
      else
      {
        v65 = v68;
      }

    }
    if (objc_msgSend(v65, "count"))
    {
      v80 = (void *)objc_opt_new();
      v81 = (void *)objc_opt_new();
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      v126 = 0u;
      v82 = v65;
      v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
      if (v83)
      {
        v84 = v83;
        v85 = *(_QWORD *)v124;
        do
        {
          for (j = 0; j != v84; ++j)
          {
            if (*(_QWORD *)v124 != v85)
              objc_enumerationMutation(v82);
            v87 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * j);
            objc_msgSend(v87, "first");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "addObject:", v88);

            objc_msgSend(v87, "second");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "addObject:", v89);

          }
          v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
        }
        while (v84);
      }

      v16 = v116;
      v29 = -[PPTopicStorage donateTopics:source:algorithm:cloudSync:decayRate:sentimentScore:exactMatchesInSourceText:error:](self->_storage, "donateTopics:source:algorithm:cloudSync:decayRate:sentimentScore:exactMatchesInSourceText:error:", v80, v116, a5, v113, v81, a9, 0.0, a7);
      v15 = v114;
      if (v29)
      {
        objc_msgSend(v116, "bundleId");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "groupId");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = v80;
        v93 = v90;
        v94 = v91;
        +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
        v95 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __70__PPLocalTopicStore__logDonationForTopics_bundleId_algorithm_groupId___block_invoke;
        v139 = &unk_1E7E1D2B0;
        v96 = v93;
        v140 = v96;
        v141 = self;
        v97 = v92;
        v142 = v97;
        v144 = a5;
        v98 = v94;
        v143 = v98;
        dispatch_async(v95, buf);

        v16 = v116;
        -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_246);
      }

      v17 = v115;
    }
    else
    {
      LOBYTE(v29) = 1;
      v16 = v116;
    }

  }
LABEL_71:

  return v29;
}

- (BOOL)flushDonationsWithError:(id *)a3
{
  _PASLock *lock;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  lock = self->_lock;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__PPLocalTopicStore_flushDonationsWithError___block_invoke;
  v5[3] = &unk_1E7E1D218;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  if (*((_BYTE *)v7 + 24))
    PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsDidChangeMeaningfully");
  _Block_object_dispose(&v6, 8);
  return 1;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  BOOL v6;
  char v8;

  v8 = 0;
  v6 = -[PPTopicStorage deleteAllTopicsWithTopicId:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsWithTopicId:atLeastOneTopicRemoved:deletedCount:error:", a3, &v8, a4, a5);
  if (v8)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  return v6;
}

- (BOOL)deleteAllTopicsWithTopicId:(id)a3 algorithm:(unint64_t)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  BOOL v7;
  char v9;

  v9 = 0;
  v7 = -[PPTopicStorage deleteAllTopicsWithTopicId:algorithm:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsWithTopicId:algorithm:atLeastOneTopicRemoved:deletedCount:error:", a3, a4, &v9, a5, a6);
  if (v9)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  return v7;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  BOOL v8;
  unint64_t v10;
  char v11;

  v11 = 0;
  v10 = 0;
  v8 = -[PPTopicStorage deleteAllTopicsFromSourcesWithBundleId:documentIds:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsFromSourcesWithBundleId:documentIds:atLeastOneTopicRemoved:deletedCount:error:", a3, a4, &v11, &v10, a6);
  if (v11)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a5)
    *a5 = v10;
  return v8;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 algorithm:(unint64_t)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  BOOL v9;
  unint64_t v11;
  char v12;

  v12 = 0;
  v11 = 0;
  v9 = -[PPTopicStorage deleteAllTopicsFromSourcesWithBundleId:documentIds:algorithm:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsFromSourcesWithBundleId:documentIds:algorithm:atLeastOneTopicRemoved:deletedCount:error:", a3, a4, a5, &v12, &v11, a7);
  if (v12)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a6)
    *a6 = v11;
  return v9;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  BOOL v9;
  unint64_t v11;
  char v12;

  v12 = 0;
  v11 = 0;
  v9 = -[PPTopicStorage deleteAllTopicsFromSourcesWithBundleId:groupId:olderThanDate:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsFromSourcesWithBundleId:groupId:olderThanDate:atLeastOneTopicRemoved:deletedCount:error:", a3, a4, a5, &v12, &v11, a7);
  if (v12)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a6)
    *a6 = v11;
  return v9;
}

- (BOOL)deleteAllTopicsFromSourcesWithBundleId:(id)a3 groupId:(id)a4 algorithm:(unint64_t)a5 olderThan:(id)a6 deletedCount:(unint64_t *)a7 error:(id *)a8
{
  BOOL v10;
  unint64_t v12;
  char v13;

  v13 = 0;
  v12 = 0;
  v10 = -[PPTopicStorage deleteAllTopicsFromSourcesWithBundleId:groupId:olderThanDate:algorithm:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsFromSourcesWithBundleId:groupId:olderThanDate:algorithm:atLeastOneTopicRemoved:deletedCount:error:", a3, a4, a6, a5, &v13, &v12, a8);
  if (v13)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a7)
    *a7 = v12;
  return v10;
}

- (BOOL)deleteAllTopicsOlderThanDate:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  BOOL v7;
  unint64_t v9;
  char v10;

  v10 = 0;
  v9 = 0;
  v7 = -[PPTopicStorage deleteAllTopicsOlderThanDate:atLeastOneTopicRemoved:deletedCount:error:](self->_storage, "deleteAllTopicsOlderThanDate:atLeastOneTopicRemoved:deletedCount:error:", a3, &v10, &v9, a5);
  if (v10)
    -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  if (a4)
    *a4 = v9;
  return v7;
}

- (BOOL)deleteAllTopicFeedbackCountsOlderThanDate:(id)a3
{
  return -[PPTopicStorage deleteAllTopicFeedbackCountRecordsOlderThanDate:](self->_storage, "deleteAllTopicFeedbackCountRecordsOlderThanDate:", a3);
}

- (BOOL)pruneOrphanedTopicFeedbackCountsWithLimit:(unint64_t)a3 rowOffset:(unint64_t)a4 deletedCount:(unint64_t *)a5 isComplete:(BOOL *)a6
{
  return -[PPTopicStorage pruneOrphanedTopicFeedbackCountRecordsWithLimit:rowOffset:deletedCount:isComplete:](self->_storage, "pruneOrphanedTopicFeedbackCountRecordsWithLimit:rowOffset:deletedCount:isComplete:", a3, a4, a5, a6);
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  PPTopicStorage *storage;
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
    pp_topics_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: exporting locally-generated topic records", buf, 2u);
    }

    v7 = (void *)objc_opt_new();
    storage = self->_storage;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __40__PPLocalTopicStore_cloudSyncWithError___block_invoke;
    v28[3] = &unk_1E7E1D240;
    v9 = v7;
    v29 = v9;
    -[PPTopicStorage exportRecordsToDKWithShouldContinueBlock:](storage, "exportRecordsToDKWithShouldContinueBlock:", v28);
    pp_topics_log_handle();
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
      pp_topics_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: importing remotely-generated topic records", buf, 2u);
      }

      v26 = 0;
      do
        -[PPTopicStorage importRemotelyGeneratedTopicDKEventsWithLimit:isComplete:shouldContinueBlock:](self->_storage, "importRemotelyGeneratedTopicDKEventsWithLimit:isComplete:shouldContinueBlock:", -[PPTopicStorage duetReadBatchSize](self->_storage, "duetReadBatchSize"), &v26, &__block_literal_global_255);
      while (!v26);
      pp_topics_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "cloudSyncWithError: processing _DKKnowledgeStore remote topic deletions", buf, 2u);
      }

      -[PPTopicStorage processNewDKEventDeletions](self->_storage, "processNewDKEventDeletions");
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
      pp_topics_log_handle();
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
    pp_topics_log_handle();
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
  BOOL v6;
  BOOL v7;
  NSObject *v8;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = -[PPTopicStorage clearWithError:deletedCount:](self->_storage, "clearWithError:deletedCount:", a3, a4);
  v7 = v6;
  if (a3 && !v6)
  {
    pp_topics_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *a3;
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "clearWithError error: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  -[PPLocalTopicStore topicInvalidationCallback]((uint64_t)self);
  return v7;
}

- (void)logDonationErrorForReason:(int64_t)a3 errorCode:(unint64_t)a4 source:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  unint64_t v14;

  v8 = a5;
  +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__PPLocalTopicStore_logDonationErrorForReason_errorCode_source___block_invoke;
  v11[3] = &unk_1E7E1D288;
  v11[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v10 = v8;
  dispatch_async(v9, v11);

}

- (void)disableSyncForBundleIds:(id)a3
{
  -[PPTopicStorage disableSyncForBundleIds:](self->_storage, "disableSyncForBundleIds:", a3);
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = objc_msgSend(v5, "isMapped");
  pp_private_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (!v9)
      goto LABEL_5;
    v13 = 138412290;
    v14 = v5;
    v10 = "Mapped Topic feedback received: %@";
  }
  else
  {
    if (!v9)
      goto LABEL_5;
    v13 = 138412290;
    v14 = v5;
    v10 = "Topic feedback received: %@";
  }
  _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v13, 0xCu);
LABEL_5:

  v11 = (void *)objc_opt_new();
  +[PPInternalFeedback fromBaseFeedback:storeType:](PPInternalFeedback, "fromBaseFeedback:storeType:", v5, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storePendingFeedback:storeType:error:", v12, 2, 0);

  if (v6)
    v6[2](v6, 1, 0);

}

- (void)registerUniversalSearchSpotlightFeedback:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  pp_private_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPTopic universal search spotlight feedback received: %@", buf, 0xCu);
  }

  +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PPLocalTopicStore_registerUniversalSearchSpotlightFeedback_completion___block_invoke;
  block[3] = &unk_1E7E1F4F0;
  v9 = v5;
  v11 = v9;
  dispatch_async(v8, block);

  if (v6)
    v6[2](v6, 1, 0);

}

- (void)processFeedback:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  BOOL v69;
  id v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  uint64_t v101;
  uint64_t m;
  void *v103;
  objc_class *v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t n;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  NSObject *v128;
  char v129;
  id v130;
  NSObject *v131;
  void *v132;
  id v133;
  id v134;
  id v135;
  void *v136;
  id v137;
  id v138;
  id v139;
  id v140;
  void *v141;
  void *v142;
  id v143;
  id v144;
  uint64_t v145;
  id v146;
  id v147;
  uint64_t v148;
  id v149;
  NSObject *oslog;
  os_log_t osloga;
  uint64_t v153;
  void *v154;
  id v155;
  id v156;
  id obj;
  id obja;
  NSObject *objb;
  id v160;
  id v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  id v165;
  id v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *context;
  NSObject *contexta;
  void *contextb;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _QWORD v181[4];
  id v182;
  id v183;
  id v184;
  id v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  id v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _QWORD v195[4];
  os_log_t v196;
  id v197;
  id v198;
  __int128 *v199;
  uint8_t buf[4];
  void *v201;
  __int16 v202;
  id v203;
  __int16 v204;
  id v205;
  id v206[5];
  __CFString *v207;
  uint8_t v208[16];
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  void (*v213)(uint64_t, void *);
  void *v214;
  id v215;
  id v216;
  id *v217;
  uint64_t v218;

  v218 = *MEMORY[0x1E0C80C00];
  v140 = a3;
  objc_msgSend(v140, "mappingId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v140;
    if (self)
    {
      v143 = v4;
      objc_msgSend(v4, "feedbackItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPLocalTopicStore _feedbackItemsByItemString:](v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v6, "allKeys");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

      v10 = (void *)objc_opt_new();
      objc_msgSend(v143, "mappingId");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v142)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "handleFailureInMethod:object:file:lineNumber:description:", sel__processMappedTopicPendingFeedback_, self, CFSTR("PPLocalTopicStore.m"), 1790, CFSTR("Mapping ID was previously checked to be nonnull. Check for memory corruption"));

      }
      v141 = (void *)objc_opt_new();
      objc_msgSend(v143, "timestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setScoringDate:", v11);

      objc_msgSend(v143, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setToDate:", v12);

      objc_msgSend(v141, "setMinimumComponentCount:", 1);
      objc_msgSend(v143, "clientBundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "setExcludingSourceBundleIds:", v14);

      v185 = 0;
      v181[0] = MEMORY[0x1E0C809B0];
      v181[1] = 3221225472;
      v181[2] = __56__PPLocalTopicStore__processMappedTopicPendingFeedback___block_invoke;
      v181[3] = &unk_1E7E1D340;
      v138 = v9;
      v182 = v138;
      v139 = v10;
      v183 = v139;
      v165 = v6;
      v184 = v165;
      v15 = -[PPLocalTopicStore iterScoresForTopicMapping:query:error:block:](self, "iterScoresForTopicMapping:query:error:block:", v142, v141, &v185, v181);
      v137 = v185;
      if (!v15)
      {
        pp_default_log_handle();
        oslog = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v212) = 138412290;
          *(_QWORD *)((char *)&v212 + 4) = v137;
          _os_log_error_impl(&dword_1C392E000, oslog, OS_LOG_TYPE_ERROR, "_processMappedTopicPendingFeedback: error from iterScoresForTopicMapping: %@", (uint8_t *)&v212, 0xCu);
        }
        goto LABEL_98;
      }
      oslog = objc_opt_new();
      v16 = (void *)objc_opt_new();
      -[PPLocalTopicStore _topicTransformForId:]((uint64_t)self, v142);
      v160 = (id)objc_claimAutoreleasedReturnValue();
      v179 = 0u;
      v180 = 0u;
      v177 = 0u;
      v178 = 0u;
      obj = v138;
      v167 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v195, 16);
      if (v167)
      {
        v162 = *(_QWORD *)v178;
        do
        {
          for (i = 0; i != v167; ++i)
          {
            if (*(_QWORD *)v178 != v162)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * i);
            context = (void *)MEMORY[0x1C3BD6630]();
            if (objc_msgSend(v18, "length") && (objc_msgSend(v160, "containsMappedTopic:", v18) & 1) != 0)
            {
              objc_msgSend(v165, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObjectsFromArray:](oslog, "addObjectsFromArray:", v19);
            }
            else
            {
              v175 = 0u;
              v176 = 0u;
              v173 = 0u;
              v174 = 0u;
              objc_msgSend(v165, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v173, &v191, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v174;
                do
                {
                  for (j = 0; j != v20; ++j)
                  {
                    if (*(_QWORD *)v174 != v21)
                      objc_enumerationMutation(v19);
                    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B60]), "initWithItemString:itemFeedbackType:", &stru_1E7E221D0, objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * j), "itemFeedbackType"));
                    objc_msgSend(v16, "addObject:", v23);

                  }
                  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v173, &v191, 16);
                }
                while (v20);
              }
            }

            objc_autoreleasePoolPop(context);
          }
          v167 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, v195, 16);
        }
        while (v167);
      }

      if (-[NSObject count](oslog, "count"))
      {
        v24 = objc_alloc(MEMORY[0x1E0D70AD0]);
        objc_msgSend(v143, "timestamp");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "clientIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "clientBundleId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v24, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", oslog, v25, v26, v27, v142);

        +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v28, 0, 4, 1);
      }
      if (objc_msgSend(v16, "count"))
      {
        v29 = objc_alloc(MEMORY[0x1E0D70AD0]);
        objc_msgSend(v143, "timestamp");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "clientIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "clientBundleId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v29, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v16, v30, v31, v32, v142);

        +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v33, 0, 3, 1);
      }
      if (!objc_msgSend(v139, "count"))
      {
LABEL_97:

LABEL_98:
        v4 = v143;
        goto LABEL_99;
      }
      v34 = objc_alloc(MEMORY[0x1E0D70AD0]);
      objc_msgSend(v143, "timestamp");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "clientIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "clientBundleId");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = (void *)objc_msgSend(v34, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v139, v35, v36, v37, v142);

      +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v136, 0, 5, 1);
      objc_msgSend(v136, "feedbackItems");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "clientBundleId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "clientIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPFeedbackUtils recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:](PPFeedbackUtils, "recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:", v143, v38, v39, v40, 0);

      objc_msgSend(v143, "timestamp");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "clientIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "clientBundleId");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v139;
      v135 = v41;
      v134 = v42;
      v133 = v43;
      v45 = v142;
      v46 = v44;
      v146 = v45;
      v47 = (void *)objc_opt_new();
      v210 = 0u;
      v211 = 0u;
      *(_OWORD *)v208 = 0u;
      v209 = 0u;
      v144 = v46;
      v148 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", v208, &v212, 16);
      if (v148)
      {
        v145 = *(_QWORD *)v209;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v209 != v145)
            {
              v49 = v48;
              objc_enumerationMutation(v144);
              v48 = v49;
            }
            v153 = v48;
            v50 = *(void **)(*(_QWORD *)&v208[8] + 8 * v48);
            v155 = (id)MEMORY[0x1C3BD6630]();
            objc_msgSend(v50, "itemString");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            v190 = 0;
            -[PPLocalTopicStore unmapMappedTopicIdentifier:mappingIdentifier:error:](self, "unmapMappedTopicIdentifier:mappingIdentifier:error:", v168, v146, &v190);
            v163 = (void *)objc_claimAutoreleasedReturnValue();
            obja = v190;
            if (v163)
            {
              v188 = 0u;
              v189 = 0u;
              v186 = 0u;
              v187 = 0u;
              contexta = v163;
              v51 = -[NSObject countByEnumeratingWithState:objects:count:](contexta, "countByEnumeratingWithState:objects:count:", &v186, v206, 16);
              if (v51)
              {
                v52 = *(_QWORD *)v187;
                do
                {
                  for (k = 0; k != v51; ++k)
                  {
                    if (*(_QWORD *)v187 != v52)
                      objc_enumerationMutation(contexta);
                    v54 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * k);
                    v55 = (void *)MEMORY[0x1C3BD6630]();
                    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Q%@"), v54);
                    objc_msgSend(v47, "objectForKeyedSubscript:", v56);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v58 = v57 == 0;

                    if (v58)
                    {
                      v59 = (void *)objc_opt_new();
                      objc_msgSend(v47, "setObject:forKeyedSubscript:", v59, v56);

                    }
                    objc_msgSend(v47, "objectForKeyedSubscript:", v56);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v50, "itemFeedbackType"));
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "addObject:", v61);

                    objc_autoreleasePoolPop(v55);
                  }
                  v51 = -[NSObject countByEnumeratingWithState:objects:count:](contexta, "countByEnumeratingWithState:objects:count:", &v186, v206, 16);
                }
                while (v51);
              }
            }
            else
            {
              pp_default_log_handle();
              contexta = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(contexta, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v201 = v168;
                v202 = 2112;
                v203 = v146;
                v204 = 2112;
                v205 = obja;
                _os_log_error_impl(&dword_1C392E000, contexta, OS_LOG_TYPE_ERROR, "Error while getting unmapped topics for mapped topic %@ under mapping %@: %@", buf, 0x20u);
              }
            }

            objc_autoreleasePoolPop(v155);
            v48 = v153 + 1;
          }
          while (v153 + 1 != v148);
          v148 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", v208, &v212, 16);
        }
        while (v148);
      }

      v62 = (void *)objc_opt_new();
      objc_msgSend(v62, "setScoringDate:", v135);
      objc_msgSend(v62, "setToDate:", v135);
      objc_msgSend(v62, "setOrderByIdentifier:", 1);
      v63 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v47, "allKeys");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)objc_msgSend(v63, "initWithArray:", v64);
      objc_msgSend(v62, "setMatchingTopicIds:", v65);

      v66 = (void *)objc_opt_new();
      v206[0] = 0;
      v206[1] = v206;
      v206[3] = __Block_byref_object_copy__18107;
      v206[4] = __Block_byref_object_dispose__18108;
      v206[2] = (id)0x3032000000;
      v207 = &stru_1E7E221D0;
      *(_QWORD *)&v186 = 0;
      *(_QWORD *)&v212 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v212 + 1) = 3221225472;
      v213 = __115__PPLocalTopicStore__mappedTopicsFilterPendingFeedbackItems_scoringDate_clientIdentifier_clientBundleId_mappingId___block_invoke;
      v214 = &unk_1E7E1D368;
      v217 = v206;
      v67 = v47;
      v215 = v67;
      v68 = v66;
      v216 = v68;
      v69 = -[PPLocalTopicStore iterTopicRecordsWithQuery:error:block:](self, "iterTopicRecordsWithQuery:error:block:", v62, &v186, &v212);
      v70 = (id)v186;
      if (v69)
      {
        if (!objc_msgSend(v68, "count"))
        {
LABEL_92:

          _Block_object_dispose(v206, 8);
          v206[0] = 0;
          v129 = -[PPLocalTopicStore _logFeedbackSessionsWithFeedback:error:](self, v136, v206);
          v130 = v206[0];
          if ((v129 & 1) == 0)
          {
            pp_topics_log_handle();
            v131 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v212) = 138412290;
              *(_QWORD *)((char *)&v212 + 4) = v130;
              _os_log_error_impl(&dword_1C392E000, v131, OS_LOG_TYPE_ERROR, "PPLocalTopicStore: error generating sessions %@", (uint8_t *)&v212, 0xCu);
            }

          }
          goto LABEL_97;
        }
        v71 = objc_msgSend(objc_alloc(MEMORY[0x1E0D70AD0]), "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v68, v135, v134, v133, v146);
        -[PPTopicStorage donateTopicFeedback:](self->_storage, "donateTopicFeedback:", v71);
        v72 = (void *)objc_opt_new();
        objc_msgSend(v72, "setClientId:", v134);
        objc_msgSend(v72, "setMappingId:", v146);
        -[PPTrialWrapper concatenatedTreatmentNames](self->_trialWrapper, "concatenatedTreatmentNames");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setActiveTreatments:", v73);

        objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "trackScalarForMessage:count:", v72, objc_msgSend(v68, "count"));

      }
      else
      {
        pp_default_log_handle();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v208 = 138412290;
          *(_QWORD *)&v208[4] = v70;
          _os_log_error_impl(&dword_1C392E000, v71, OS_LOG_TYPE_ERROR, "_processTopicPendingFeedback: error from iterTopicRecordsWithQuery: %@", v208, 0xCu);
        }
      }

      goto LABEL_92;
    }
  }
  else
  {
    v4 = v140;
    if (self)
    {
      v156 = v4;
      objc_msgSend(v4, "feedbackItems");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPLocalTopicStore _feedbackItemsByItemString:](v75);
      v76 = objc_claimAutoreleasedReturnValue();

      v77 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend((id)v76, "allKeys");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = (void *)objc_msgSend(v77, "initWithArray:", v78);

      v80 = (void *)objc_opt_new();
      v154 = (void *)objc_opt_new();
      objc_msgSend(v156, "timestamp");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "setScoringDate:", v81);

      objc_msgSend(v156, "timestamp");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "setToDate:", v82);

      objc_msgSend(v154, "setOrderByIdentifier:", 1);
      objc_msgSend(v156, "clientBundleId");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v83, 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "setExcludingSourceBundleIds:", v84);

      v85 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v156, "feedbackItems");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "_pas_proxyArrayWithMapping:", &__block_literal_global_270);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)objc_msgSend(v85, "initWithArray:", v87);
      objc_msgSend(v154, "setMatchingTopicIds:", v88);

      *(_QWORD *)&v186 = 0;
      *((_QWORD *)&v186 + 1) = &v186;
      *(_QWORD *)&v187 = 0x3032000000;
      *((_QWORD *)&v187 + 1) = __Block_byref_object_copy__18107;
      *(_QWORD *)&v188 = __Block_byref_object_dispose__18108;
      *((_QWORD *)&v188 + 1) = &stru_1E7E221D0;
      *(_QWORD *)&v177 = 0;
      v195[0] = MEMORY[0x1E0C809B0];
      v195[1] = 3221225472;
      v195[2] = __58__PPLocalTopicStore__processPortraitTopicPendingFeedback___block_invoke_2;
      v195[3] = &unk_1E7E1D318;
      v199 = &v186;
      osloga = v80;
      v196 = osloga;
      v166 = (id)v76;
      v197 = v166;
      v149 = v79;
      v198 = v149;
      LOBYTE(v76) = -[PPLocalTopicStore iterTopicRecordsWithQuery:error:block:](self, "iterTopicRecordsWithQuery:error:block:", v154, &v177, v195);
      v147 = (id)v177;
      if ((v76 & 1) != 0)
      {
        if (-[NSObject count](osloga, "count"))
        {
          v89 = objc_alloc(MEMORY[0x1E0D70AD0]);
          objc_msgSend(v156, "timestamp");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "clientIdentifier");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "clientBundleId");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "mappingId");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = (void *)objc_msgSend(v89, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", osloga, v90, v91, v92, v93);

          +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v94, 0, 2, 1);
          objc_msgSend(v94, "feedbackItems");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "clientBundleId");
          v96 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "clientIdentifier");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPFeedbackUtils recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:](PPFeedbackUtils, "recordUserEventsFromFeedback:matchingFeedbackItems:clientBundleId:clientIdentifier:domain:", v156, v95, v96, v97, 0);

          *(_QWORD *)&v173 = 0;
          LOBYTE(v96) = -[PPLocalTopicStore _logFeedbackSessionsWithFeedback:error:](self, v94, &v173);
          v98 = (id)v173;
          if ((v96 & 1) == 0)
          {
            pp_topics_log_handle();
            v99 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v212) = 138412290;
              *(_QWORD *)((char *)&v212 + 4) = v98;
              _os_log_error_impl(&dword_1C392E000, v99, OS_LOG_TYPE_ERROR, "PPLocalTopicStore: failed in session logging: %@", (uint8_t *)&v212, 0xCu);
            }

          }
          -[PPTopicStorage donateTopicFeedback:](self->_storage, "donateTopicFeedback:", v94);

        }
        objb = objc_opt_new();
        v100 = (void *)objc_opt_new();
        v193 = 0u;
        v194 = 0u;
        v191 = 0u;
        v192 = 0u;
        v161 = v149;
        v101 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v191, &v212, 16);
        if (v101)
        {
          v164 = *(_QWORD *)v192;
          do
          {
            v169 = v101;
            for (m = 0; m != v169; ++m)
            {
              if (*(_QWORD *)v192 != v164)
                objc_enumerationMutation(v161);
              v103 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * m);
              contextb = (void *)MEMORY[0x1C3BD6630]();
              v104 = (objc_class *)MEMORY[0x1E0CB38E8];
              v105 = v103;
              v106 = (void *)objc_msgSend([v104 alloc], "initWithPattern:options:error:", CFSTR("Q[0-9]{1,10}"), 0, 0);
              v107 = objc_msgSend(v106, "rangeOfFirstMatchInString:options:range:", v105, 0, 0, objc_msgSend(v105, "length"));
              v109 = v108;

              if (v107 == 0x7FFFFFFFFFFFFFFFLL && v109 == 0)
              {
                v210 = 0u;
                v211 = 0u;
                *(_OWORD *)v208 = 0u;
                v209 = 0u;
                objc_msgSend(v166, "objectForKeyedSubscript:", v105);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v208, v206, 16);
                if (v112)
                {
                  v113 = *(_QWORD *)v209;
                  do
                  {
                    for (n = 0; n != v112; ++n)
                    {
                      if (*(_QWORD *)v209 != v113)
                        objc_enumerationMutation(v111);
                      v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B60]), "initWithItemString:itemFeedbackType:", &stru_1E7E221D0, objc_msgSend(*(id *)(*(_QWORD *)&v208[8] + 8 * n), "itemFeedbackType"));
                      objc_msgSend(v100, "addObject:", v115);

                    }
                    v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v208, v206, 16);
                  }
                  while (v112);
                }
              }
              else
              {
                objc_msgSend(v166, "objectForKeyedSubscript:", v105);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addObjectsFromArray:](objb, "addObjectsFromArray:", v111);
              }

              objc_autoreleasePoolPop(contextb);
            }
            v101 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v191, &v212, 16);
          }
          while (v101);
        }

        if (-[NSObject count](objb, "count"))
        {
          v116 = objc_alloc(MEMORY[0x1E0D70AD0]);
          objc_msgSend(v156, "timestamp");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "clientIdentifier");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "clientBundleId");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "mappingId");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = (void *)objc_msgSend(v116, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", objb, v117, v118, v119, v120);

          +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v121, 0, 2, 1);
        }
        if (objc_msgSend(v100, "count"))
        {
          v122 = objc_alloc(MEMORY[0x1E0D70AD0]);
          objc_msgSend(v156, "timestamp");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "clientIdentifier");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "clientBundleId");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v156, "mappingId");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = (void *)objc_msgSend(v122, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v100, v123, v124, v125, v126);

          +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v127, 0, 0, 1);
        }

        v128 = objb;
      }
      else
      {
        pp_default_log_handle();
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v212) = 138412290;
          *(_QWORD *)((char *)&v212 + 4) = v147;
          _os_log_error_impl(&dword_1C392E000, v128, OS_LOG_TYPE_ERROR, "_processTopicPendingFeedback: error from iterTopicRecordsWithQuery: %@", (uint8_t *)&v212, 0xCu);
        }
      }

      _Block_object_dispose(&v186, 8);
      v4 = v156;
    }
  }
LABEL_99:

}

- (BOOL)computeAndCacheTopicScores:(id *)a3
{
  return -[PPLocalTopicStore computeAndCacheTopicScoresWithShouldContinueBlock:error:](self, "computeAndCacheTopicScoresWithShouldContinueBlock:error:", &__block_literal_global_285, a3);
}

- (BOOL)computeAndCacheTopicScoresWithShouldContinueBlock:(id)a3 error:(id *)a4
{
  id v6;
  atomic_flag *p_cacheUpdateEnqueued;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  NSObject *cacheUpdateQueue;
  NSObject *v12;
  BOOL v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD block[5];
  id v23;

  v6 = a3;
  p_cacheUpdateEnqueued = &self->_cacheUpdateEnqueued;
  do
    v8 = __ldaxr((unsigned __int8 *)p_cacheUpdateEnqueued);
  while (__stlxr(1u, (unsigned __int8 *)p_cacheUpdateEnqueued));
  v9 = MEMORY[0x1E0C809B0];
  if ((v8 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1C3BD6630]();
    cacheUpdateQueue = self->_cacheUpdateQueue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __77__PPLocalTopicStore_computeAndCacheTopicScoresWithShouldContinueBlock_error___block_invoke;
    block[3] = &unk_1E7E1D3B0;
    block[4] = self;
    v23 = v6;
    dispatch_sync(cacheUpdateQueue, block);

    objc_autoreleasePoolPop(v10);
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__18107;
  v20 = __Block_byref_object_dispose__18108;
  v12 = self->_cacheUpdateQueue;
  v21 = 0;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __77__PPLocalTopicStore_computeAndCacheTopicScoresWithShouldContinueBlock_error___block_invoke_289;
  v15[3] = &unk_1E7E1D3D8;
  v15[4] = self;
  v15[5] = &v16;
  dispatch_sync(v12, v15);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v13 = v17[5] == 0;
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (BOOL)clearTopicScoresCache:(id *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "removeItemAtPath:error:", self->_cachePath, a3);

  return (char)a3;
}

- (id)topicCacheSandboxExtensionToken:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "auditToken");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }

  -[NSString cStringUsingEncoding:](self->_cachePath, "cStringUsingEncoding:", 4);
  v6 = sandbox_extension_issue_file_to_process();
  if (!v6)
    return 0;
  v7 = (void *)v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v6, v10, v11);
  free(v7);
  return v8;
}

- (PPTopicStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_cacheUpdateError, 0);
  objc_storeStrong((id *)&self->_cacheUpdateQueue, 0);
  objc_storeStrong((id *)&self->_cacheAsyncUpdateQueue, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_blocklist, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_modelCache, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

void __77__PPLocalTopicStore_computeAndCacheTopicScoresWithShouldContinueBlock_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const std::__fs::filesystem::path *v24;
  const std::__fs::filesystem::path *v25;
  std::error_code *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 64));
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "setRemoveNearDuplicates:", 1);
    v3 = *(void **)(a1 + 32);
    v35 = 0;
    objc_msgSend(v3, "rankedTopicsWithQuery:error:", v2, &v35);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v35;
    v6 = v35;
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    {
LABEL_26:

      return;
    }
    if (v4)
    {
      v28 = v6;
      v29 = v2;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v13, "item");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "topicIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "score");
            objc_msgSend(v16, "numberWithDouble:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v15);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        }
        while (v10);
      }

      v6 = v28;
      v2 = v29;
    }
    else
    {
      v7 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v5);
    if (v6)
    {
      pp_topics_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v6;
        _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "Iterating over PPTopicStore failed: %@", buf, 0xCu);
      }
    }
    else
    {
      if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
      {
        v6 = 0;
LABEL_25:

        v4 = 0;
        goto LABEL_26;
      }
      v19 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(".new-%@"), v21);
      v18 = objc_claimAutoreleasedReturnValue();

      v30 = 0;
      objc_msgSend(MEMORY[0x1E0D815D0], "fileBackedDataWithPropertyList:writtenToPath:format:error:", v7, v18, 1, &v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v30;
      v6 = v30;
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v23);
      if (v22)
      {
        v24 = (const std::__fs::filesystem::path *)-[NSObject fileSystemRepresentation](objc_retainAutorelease(v18), "fileSystemRepresentation");
        v25 = (const std::__fs::filesystem::path *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "fileSystemRepresentation");
        rename(v24, v25, v26);
      }
      else
      {
        pp_topics_log_handle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v6;
          _os_log_error_impl(&dword_1C392E000, v27, OS_LOG_TYPE_ERROR, "Could not serialize and write plist: %@", buf, 0xCu);
        }

      }
    }

    goto LABEL_25;
  }
}

void __77__PPLocalTopicStore_computeAndCacheTopicScoresWithShouldContinueBlock_error___block_invoke_289(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

uint64_t __48__PPLocalTopicStore_computeAndCacheTopicScores___block_invoke()
{
  return 1;
}

- (id)_feedbackItemsByItemString:(void *)a1
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C3BD6630](v4);
        objc_msgSend(v8, "itemString", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v10);

        }
        objc_msgSend(v2, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v8);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v5 = v4;
    }
    while (v4);
  }

  return v2;
}

void __58__PPLocalTopicStore__processPortraitTopicPendingFeedback___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a2;
  objc_msgSend(v19, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clusterIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v19, "topic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clusterIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    v11 = v19;
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v19, "topic");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "topicIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v16 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v17);

      objc_msgSend(*(id *)(a1 + 48), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v18 = objc_msgSend(*(id *)(a1 + 48), "count");
      v11 = v19;
      if (!v18)
        *a3 = 1;
    }
  }
  else
  {

    v11 = v19;
  }

}

- (uint64_t)_logFeedbackSessionsWithFeedback:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  _UNKNOWN **v34;
  id v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  uint64_t v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  uint64_t v104;
  _QWORD *v105;
  void *v106;
  void *v107;
  void *v108;
  id v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id obj;
  id obja;
  id objb;
  void *v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  unsigned __int8 v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;
  void *v151;
  _BYTE v152[128];
  uint8_t v153[128];
  uint8_t buf[4];
  unint64_t v155;
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "clientBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PPFeedbackUtils shouldSample:](PPFeedbackUtils, "shouldSample:", v5);

  if (!v6)
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "PPLocalTopicStore: No feedback session logs collection performed due to sampling.", buf, 2u);
    }

    v16 = 1;
    goto LABEL_91;
  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setPredictionType:", 1);
  +[PPFeedbackUtils feedbackMetadataForBaseFeedback:](PPFeedbackUtils, "feedbackMetadataForBaseFeedback:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFeedbackMetadata:", v8);

  objc_msgSend(v4, "feedbackItems");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)objc_opt_new();
  v119 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setLimit:", 1000);
  objc_msgSend(v4, "clientBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1C3BD6630]();
    v12 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v4, "clientBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithObjects:", v13, 0);

    objc_autoreleasePoolPop(v11);
    objc_msgSend(v9, "setExcludingSourceBundleIds:", v14);

  }
  else
  {
    objc_msgSend(v9, "setExcludingSourceBundleIds:", 0);
  }

  v145 = 0;
  objc_msgSend(a1, "rankedTopicsWithQuery:error:", v9, &v145);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v145;
  v19 = v18;
  if (!v17)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v18);
    pp_topics_log_handle();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v155 = (unint64_t)v19;
      _os_log_error_impl(&dword_1C392E000, v64, OS_LOG_TYPE_ERROR, "logFeedbackSessionsWithFeedback: nil result from rankedTopicsWithQuery: %@", buf, 0xCu);
    }

    v146 = 0;
    goto LABEL_90;
  }
  v105 = a3;
  v114 = v18;
  v107 = v9;
  v117 = v7;
  v112 = v4;
  v118 = (void *)objc_opt_new();
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v106 = v17;
  obj = v17;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v153, 16);
  if (!v20)
    goto LABEL_21;
  v21 = v20;
  v22 = *(_QWORD *)v142;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v142 != v22)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
      v25 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v24, "item");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "topicIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "length"))
      {
        objc_msgSend(v24, "item");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "topicIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "characterAtIndex:", 0);

        if (v30 != 81)
          goto LABEL_19;
        objc_msgSend(v24, "item");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "topicIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "substringFromIndex:", 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v119, "numberFromString:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
          objc_msgSend(v118, "addObject:", v27);
      }

LABEL_19:
      objc_autoreleasePoolPop(v25);
    }
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v153, 16);
  }
  while (v21);
LABEL_21:

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v33 = v108;
  v115 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v137, v152, 16);
  if (v115)
  {
    v113 = *(_QWORD *)v138;
    v4 = v112;
    v7 = v117;
    v34 = &off_1E7E12000;
    v110 = v33;
LABEL_23:
    v35 = 0;
    while (1)
    {
      if (*(_QWORD *)v138 != v113)
        objc_enumerationMutation(v33);
      v36 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)v35);
      v37 = (void *)MEMORY[0x1C3BD6630]();
      v38 = objc_msgSend(v4, "isMapped");
      objc_msgSend(v36, "itemString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v38)
        break;
      v43 = objc_msgSend(v39, "length");

      if (v43 >= 2)
      {
        objc_msgSend(v36, "itemString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "characterAtIndex:", 0);
        objc_msgSend(v36, "itemString");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v46;
        if (v45 == 81)
        {
          objc_msgSend(v46, "substringFromIndex:", 1);
          v47 = objc_claimAutoreleasedReturnValue();

          v42 = (void *)v47;
        }

        objc_msgSend(v119, "numberFromString:", v42);
        v48 = objc_claimAutoreleasedReturnValue();
        if (v48)
        {
          v49 = (void *)v48;
          obja = v35;
          v116 = v37;
          v150 = v48;
          v151 = &unk_1E7E5C0E8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
          v50 = objc_claimAutoreleasedReturnValue();

          v42 = (void *)v50;
          goto LABEL_34;
        }
LABEL_46:

        v7 = v117;
      }
      objc_autoreleasePoolPop(v37);
      v35 = (char *)v35 + 1;
      if (v35 == (id)v115)
      {
        v115 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v137, v152, 16);
        if (v115)
          goto LABEL_23;
        goto LABEL_59;
      }
    }
    obja = v35;
    objc_msgSend(v4, "mappingId");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = v114;
    objc_msgSend(a1, "unmapMappedTopicIdentifier:mappingIdentifier:error:", v40, v41, &v136);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v136;

    if (!v42)
    {
      pp_topics_log_handle();
      v65 = objc_claimAutoreleasedReturnValue();
      v17 = v106;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v155 = (unint64_t)v19;
        _os_log_error_impl(&dword_1C392E000, v65, OS_LOG_TYPE_ERROR, "logFeedbackSessionsWithFeedback: nil result from unmapMappedTopicIdentifier: %@", buf, 0xCu);
      }

      v146 = 0;
      objc_autoreleasePoolPop(v37);
      v7 = v117;
      goto LABEL_89;
    }
    v116 = v37;
    v114 = v19;
LABEL_34:
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    v51 = v118;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v132, v149, 16);
    if (v52)
    {
      v53 = v52;
      v54 = 0;
      v55 = *(_QWORD *)v133;
LABEL_36:
      v56 = 0;
      while (1)
      {
        if (*(_QWORD *)v133 != v55)
          objc_enumerationMutation(v51);
        v57 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v56);
        objc_msgSend(v42, "objectForKeyedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          v59 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v57, "stringValue");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = (void *)objc_msgSend(v59, "initWithFormat:", CFSTR("Q%@"), v60);

          +[PPFeedbackUtils feedbackItemForPPFeedbackItem:](PPFeedbackUtils, "feedbackItemForPPFeedbackItem:", v36);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "objectForKeyedSubscript:", v61);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v63)
          {
            v63 = (void *)objc_opt_new();
            objc_msgSend(v123, "setObject:forKeyedSubscript:", v63, v61);
          }
          objc_msgSend(v63, "addObject:", v62);
          ++v54;

          if (v54 > 4)
            break;
        }
        if (v53 == ++v56)
        {
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v132, v149, 16);
          if (v53)
            goto LABEL_36;
          break;
        }
      }
    }

    v33 = v110;
    v4 = v112;
    v34 = &off_1E7E12000;
    v37 = v116;
    v35 = obja;
    goto LABEL_46;
  }
  v7 = v117;
  v34 = &off_1E7E12000;
LABEL_59:

  v66 = (void *)objc_opt_new();
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  v67 = v123;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v128, v148, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v129;
    do
    {
      for (j = 0; j != v69; ++j)
      {
        if (*(_QWORD *)v129 != v70)
          objc_enumerationMutation(v67);
        v72 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * j);
        objc_msgSend(v66, "addObject:", v72);
        v73 = (void *)objc_opt_new();
        LODWORD(v74) = -1.0;
        objc_msgSend(v34[242], "scoredItemWithFeaturesForFeatureDictionary:score:", v73, v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectForKeyedSubscript:", v72);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setFeedbackItems:", v76);

        objc_msgSend(v7, "addScoredItems:", v75);
      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v128, v148, 16);
    }
    while (v69);
  }

  pp_private_log_handle();
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
  {
    v104 = objc_msgSend(v67, "count");
    *(_DWORD *)buf = 134217984;
    v155 = v104;
    _os_log_debug_impl(&dword_1C392E000, v77, OS_LOG_TYPE_DEBUG, "Feedback logging: retrieved features for %lu topics: ", buf, 0xCu);
  }

  v78 = (void *)objc_opt_new();
  objc_msgSend(v78, "setLimit:", 1000);
  objc_msgSend(v112, "clientBundleId");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)MEMORY[0x1C3BD6630]();
    v81 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v112, "clientBundleId");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = (void *)objc_msgSend(v81, "initWithObjects:", v82, 0);

    objc_autoreleasePoolPop(v80);
    objc_msgSend(v78, "setExcludingSourceBundleIds:", v83);

  }
  else
  {
    objc_msgSend(v78, "setExcludingSourceBundleIds:", 0);
  }

  v111 = v66;
  objc_msgSend(v78, "setMatchingTopicIds:", v66);
  objb = v78;
  objc_msgSend(a1, "topicRecordsWithQuery:error:", v78, v105);
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v127 = 0u;
  v84 = (id)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v124, v147, 16);
  if (v85)
  {
    v86 = v85;
    v87 = 0;
    v88 = *(_QWORD *)v125;
    while (2)
    {
      for (k = 0; k != v86; ++k)
      {
        if (*(_QWORD *)v125 != v88)
          objc_enumerationMutation(v84);
        v90 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * k);
        v91 = v34[242];
        objc_msgSend(v90, "source");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "bundleId");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v91) = objc_msgSend(v91, "shouldSampleExtraction:", v93);

        if (!(_DWORD)v91)
          goto LABEL_80;
        objc_msgSend(v90, "topic");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "topicIdentifier");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "objectForKey:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (v96)
        {
          if (v87 > 0x63)
          {
            v7 = v117;
            v34 = &off_1E7E12000;
            goto LABEL_86;
          }
          v97 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", objc_msgSend(v90, "algorithm"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setAlgorithm:", v98);

          objc_msgSend(v90, "source");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "bundleId");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setSourceBundleId:", v100);

          objc_msgSend(v90, "initialScore");
          objc_msgSend(v97, "setScore:");
          v7 = v117;
          objc_msgSend(v117, "addExtractedDonations:", v97);
          ++v87;

        }
        else
        {
LABEL_80:
          v7 = v117;
        }
        v34 = &off_1E7E12000;
      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v124, v147, 16);
      if (v86)
        continue;
      break;
    }
  }
  else
  {
    v87 = 0;
  }
LABEL_86:

  pp_private_log_handle();
  v101 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v155 = v87;
    _os_log_debug_impl(&dword_1C392E000, v101, OS_LOG_TYPE_DEBUG, "Feedback logging: logged %lu topic records: ", buf, 0xCu);
  }

  objc_msgSend(v34[242], "addBoilerplateToFeedbackLog:", v7);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "logMessage:", v7);

  v146 = 1;
  v33 = v111;
  v4 = v112;
  v17 = v106;
  v19 = v114;
LABEL_89:

  v9 = v107;
LABEL_90:

  v16 = v146;
LABEL_91:

  return v16;
}

uint64_t __58__PPLocalTopicStore__processPortraitTopicPendingFeedback___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemString");
}

void __56__PPLocalTopicStore__processMappedTopicPendingFeedback___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v7);

    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v8);
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      *a4 = 1;
  }

}

- (PPTopicTransform)_topicTransformForId:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  PPTopicTransform *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E7E221D0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v4);
    v6 = *(void **)(a1 + 24);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.dat"), v5);
    objc_msgSend(v6, "filepathForFactor:namespaceName:", v7, CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    pp_topics_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_debug_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEBUG, "Loading topic transform file from: %@", buf, 0xCu);
      }

      v11 = -[PPTopicTransform initWithPath:mappingId:]([PPTopicTransform alloc], "initWithPath:mappingId:", v8, v3);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "Cannot locate asset path for transform resource: %@", buf, 0xCu);
      }

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __115__PPLocalTopicStore__mappedTopicsFilterPendingFeedbackItems_scoringDate_clientIdentifier_clientBundleId_mappingId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clusterIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "topic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clusterIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

    if ((v9 & 1) == 0)
    {
      v23 = v3;
      objc_msgSend(v3, "topic");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topicIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
      {
        v15 = v14;
        v25 = *(_QWORD *)v27;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v27 != v25)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v16);
            v18 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countForObject:", v17);

            for (; v20; --v20)
            {
              v21 = (void *)MEMORY[0x1C3BD6630]();
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B60]), "initWithItemString:itemFeedbackType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), objc_msgSend(v17, "intValue"));
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);

              objc_autoreleasePoolPop(v21);
            }
            objc_autoreleasePoolPop(v18);
            ++v16;
          }
          while (v16 != v15);
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v15);
      }

      v3 = v23;
    }
  }
  else
  {

  }
}

void __73__PPLocalTopicStore_registerUniversalSearchSpotlightFeedback_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "clientBundleId");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPFeedbackUtils recordUniversalSearchSpotlightStatsFromFeedback:clientBundleId:clientIdentifier:](PPFeedbackUtils, "recordUniversalSearchSpotlightStatsFromFeedback:clientBundleId:clientIdentifier:", v2, v4, v3);

}

void __64__PPLocalTopicStore_logDonationErrorForReason_errorCode_source___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setReason:", +[PPMetricsUtils mapTopicDonationErrorForPET2:](PPMetricsUtils, "mapTopicDonationErrorForPET2:", a1[6]));
  objc_msgSend(*(id *)(a1[4] + 24), "concatenatedTreatmentNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveTreatments:", v2);

  objc_msgSend(v4, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", a1[5]));
  objc_msgSend(v4, "setCode:", a1[7]);
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackScalarForMessage:", v4);

}

- (void)topicInvalidationCallback
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PPLocalTopicStore_topicInvalidationCallback__block_invoke;
    block[3] = &unk_1E7E1F4F0;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __46__PPLocalTopicStore_topicInvalidationCallback__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "PPLocalTopicStore invalidating topics", buf, 2u);
  }

  PPPostNotification("com.apple.proactive.PersonalizationPortrait.topicsInvalidated");
  v3 = *(void **)(a1 + 32);
  v10 = 0;
  v4 = objc_msgSend(v3, "computeAndCacheTopicScores:", &v10);
  v5 = v10;
  if ((v4 & 1) == 0)
  {
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_error_impl(&dword_1C392E000, v6, OS_LOG_TYPE_ERROR, "PPLocalTopicStore had an error while trying to refresh the cache after topic invalidation: %@", buf, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    v9 = v5;
    objc_msgSend(v7, "clearTopicScoresCache:", &v9);
    v8 = v9;

    v5 = v8;
  }

}

BOOL __40__PPLocalTopicStore_cloudSyncWithError___block_invoke(uint64_t a1)
{
  double v1;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  return v1 > -600.0;
}

uint64_t __40__PPLocalTopicStore_cloudSyncWithError___block_invoke_254()
{
  return 1;
}

void __45__PPLocalTopicStore_flushDonationsWithError___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  pp_topics_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "Flushing donations", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3[8];
  v3[8] = 0;

}

- (id)_coalesceScoredTopics:(void *)a3 exactMatchesInSourceText:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __68__PPLocalTopicStore__coalesceScoredTopics_exactMatchesInSourceText___block_invoke;
    v14 = &unk_1E7E1D8D8;
    v8 = v7;
    v15 = v8;
    v16 = v6;
    v9 = (void *)MEMORY[0x1C3BD6630](objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v11));
    objc_msgSend(v8, "allValues", v11, v12, v13, v14);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v9);

  }
  return a1;
}

void __107__PPLocalTopicStore_donateTopics_source_algorithm_cloudSync_sentimentScore_exactMatchesInSourceText_error___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 8) = 1;
}

void __70__PPLocalTopicStore__logDonationForTopics_bundleId_algorithm_groupId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setDonationSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "concatenatedTreatmentNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveTreatments:", v2);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackScalarForMessage:count:", v8, objc_msgSend(*(id *)(a1 + 48), "count"));

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDonationSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", *(_QWORD *)(a1 + 32)));
  objc_msgSend(v4, "setAlgorithm:", +[PPMetricsUtils mapTopicAlgorithmForPET2:](PPMetricsUtils, "mapTopicAlgorithmForPET2:", *(_QWORD *)(a1 + 64)));
  +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupId:", v5);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "concatenatedTreatmentNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveTreatments:", v6);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackDistributionForMessage:value:", v4, (double)(unint64_t)objc_msgSend(*(id *)(a1 + 48), "count"));

}

void __68__PPLocalTopicStore__coalesceScoredTopics_exactMatchesInSourceText___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
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
  double v18;
  double v19;
  double v20;
  long double v21;
  id v22;
  void *v23;
  void *v24;
  PPCoalescedScoredTopic *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v29 = v5;
  objc_msgSend(v5, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "BOOLValue"))
  {
    objc_msgSend(v10, "numberWithInt:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v29, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "second");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInt:", objc_msgSend(v16, "BOOLValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9)
  {
    objc_msgSend(v9, "scoredTopic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "score");
    v19 = v18;
    objc_msgSend(v29, "score");
    v21 = v19 + v20 * exp2(-(double)objc_msgSend(v9, "occurrencesInSource"));

    v22 = objc_alloc(MEMORY[0x1E0D70C38]);
    objc_msgSend(v29, "item");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithItem:score:resultPosition:resultCount:", v23, objc_msgSend(v29, "resultPosition"), objc_msgSend(v29, "resultCount"), (double)v21);

    v25 = -[PPCoalescedScoredTopic initWithScoredTopic:occurrencesInSource:]([PPCoalescedScoredTopic alloc], "initWithScoredTopic:occurrencesInSource:", v24, (unsigned __int16)(objc_msgSend(v9, "occurrencesInSource") + 1));
  }
  else
  {
    v25 = -[PPCoalescedScoredTopic initWithScoredTopic:occurrencesInSource:]([PPCoalescedScoredTopic alloc], "initWithScoredTopic:occurrencesInSource:", v29, 1);
  }
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v25, v12);
  v27 = *(void **)(a1 + 32);
  objc_msgSend(v29, "item");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

}

uint64_t __70__PPLocalTopicStore_topicExtractionsFromText_clientProcessName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0D70D00];
  v5 = a3;
  objc_msgSend(a2, "scoredTopic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "score");
  v8 = v7;
  objc_msgSend(v5, "scoredTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "score");
  v11 = objc_msgSend(v4, "reverseCompareDouble:withDouble:", v8, v10);

  return v11;
}

uint64_t __49__PPLocalTopicStore_topicRecordsWithQuery_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)_logParametersForQuery:(void *)a3 client:(void *)a4 method:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *context;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v24 = v9;
    context = (void *)MEMORY[0x1C3BD6630]();
    v25[0] = CFSTR("client");
    v10 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v26[0] = v10;
    v25[1] = CFSTR("excludedBundleIds");
    objc_msgSend(v7, "excludingSourceBundleIds", PPMetricsDispatcher);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(";"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (const __CFString *)v13;
    else
      v15 = &stru_1E7E221D0;
    v26[1] = v15;
    v25[2] = CFSTR("includedBundleIds");
    objc_msgSend(v7, "matchingSourceBundleIds");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_pas_componentsJoinedByString:", CFSTR(";"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_1E7E221D0;
    v26[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.TopicQueryReceived"), v21, 0);

    if (!v8)
    objc_autoreleasePoolPop(context);
    v9 = v24;
  }

}

void __59__PPLocalTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD6630]();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v5 = v4;
    if (v3 && objc_msgSend(v4, "count"))
    {
      objc_msgSend(*(id *)(v3 + 32), "indicesOfBlockedTopicsInRecordArray:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        v7 = objc_msgSend(v5, "count");
        v8 = objc_msgSend(v6, "count");
        pp_topics_log_handle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v24 = objc_msgSend(v5, "count");
          v25 = 2048;
          v26 = v7 - v8;
          _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "PPLocalTopicStore filtering topic record list from %tu to %tu", buf, 0x16u);
        }

        objc_msgSend(v5, "removeObjectsAtIndexes:", v6);
      }

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
LABEL_11:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        if (*(_BYTE *)(v15 + 24))
        {
          v16 = 1;
        }
        else
        {
          v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
          v16 = v17 == objc_msgSend(*(id *)(a1 + 48), "limit", (_QWORD)v18);
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        }
        *(_BYTE *)(v15 + 24) = v16;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v12)
            goto LABEL_11;
          break;
        }
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "removeAllObjects", (_QWORD)v18);
  objc_autoreleasePoolPop(v2);
}

uint64_t __59__PPLocalTopicStore_iterTopicRecordsWithQuery_error_block___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result == 64)
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

- (void)_petLoggingForMappedTopicQuery:(void *)a3 mappingId:(uint64_t)a4 count:(void *)a5 clientProcessName:(char)a6 hasError:
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v11 = a2;
  v12 = a3;
  v13 = a5;
  if (a1)
  {
    +[PPMetricsUtils loggingQueue](PPMetricsUtils, "loggingQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__PPLocalTopicStore__petLoggingForMappedTopicQuery_mappingId_count_clientProcessName_hasError___block_invoke;
    v15[3] = &unk_1E7E1D120;
    v16 = v13;
    v17 = v12;
    v20 = a4;
    v21 = a6;
    v18 = v11;
    v19 = a1;
    dispatch_async(v14, v15);

  }
}

- (void)_dpLoggingForMappingId:(void *)a3 mappedTopics:
{
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  int v33;
  __CFString *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = v5;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("news-topics")) & 1) != 0)
    {
      v8 = CFSTR("NewsTopic");
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("podcasts-topics")))
      {
        v33 = objc_msgSend(v7, "isEqualToString:", CFSTR("high-level-topics"));
        if (v33)
          v34 = CFSTR("HighLevelTopic");
        else
          v34 = 0;

        v9 = v34;
        if (!v33)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_7:
        v35 = v5;
        v10 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.PersonalizationPortrait"), v9, v12);

        objc_msgSend(v6, "allValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1E7E5C0D8, &__block_literal_global_217);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        v18 = (void *)objc_opt_new();
        objc_msgSend(v18, "nextDouble");
        v20 = v19;

        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v6, "allKeys");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v37;
          v25 = 0.0;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v37 != v24)
                objc_enumerationMutation(v21);
              v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              v28 = (void *)MEMORY[0x1C3BD6630]();
              objc_msgSend(v6, "objectForKeyedSubscript:", v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "doubleValue");
              v25 = v25 + v30;

              if (v25 / v17 >= v20)
              {
                v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", v13);
                v40 = v27;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "record:", v32);

                objc_autoreleasePoolPop(v28);
                goto LABEL_17;
              }
              objc_autoreleasePoolPop(v28);
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
            if (v23)
              continue;
            break;
          }
        }
LABEL_17:

        v5 = v35;
        goto LABEL_18;
      }
      v8 = CFSTR("PodcastTopic");
    }

    v9 = v8;
    goto LABEL_7;
  }
LABEL_19:

}

id __57__PPLocalTopicStore__dpLoggingForMappingId_mappedTopics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "doubleValue");
  v9 = v8;
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v7, "numberWithDouble:", v9 + v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);

  return v11;
}

uint64_t __73__PPLocalTopicStore_scoresForTopicMapping_query_error_clientProcessName___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __95__PPLocalTopicStore__petLoggingForMappedTopicQuery_mappingId_count_clientProcessName_hasError___block_invoke(uint64_t a1)
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
  objc_msgSend(v9, "setMappingId:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    v3 = (unint64_t)log10((double)v2);
  else
    v3 = 0;
  objc_msgSend(v9, "setResultSizeLog10:", v3);
  objc_msgSend(*(id *)(a1 + 48), "fromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeLimited:", v4 != 0);

  objc_msgSend(v9, "setLimitHit:", *(_QWORD *)(a1 + 64) > (unint64_t)objc_msgSend(*(id *)(a1 + 48), "limit"));
  objc_msgSend(*(id *)(a1 + 48), "scoringDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeSpec:", v5 != 0);

  objc_msgSend(*(id *)(a1 + 48), "excludingSourceBundleIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExclusionSpec:", objc_msgSend(v6, "count") != 0);

  objc_msgSend(v9, "setError:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "concatenatedTreatmentNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActiveTreatments:", v7);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackScalarForMessage:", v9);

}

void __81__PPLocalTopicStore__defaultScoresForTopicMapping_query_clientProcessName_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0D70C38];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  v11 = (id)objc_msgSend(v8, "initWithItem:score:", v7, v10);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

- (uint64_t)_defaultIterScoresForTopicMapping:(void *)a3 query:(_QWORD *)a4 error:(void *)a5 clientProcessName:(void *)a6 block:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  float v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void (**v55)(id, void *, void *, uint8_t *);
  void *v56;
  id v57;
  unsigned int v58;
  uint64_t v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  uint64_t *v64;
  id v65;
  uint64_t v66;
  int *v67;
  uint64_t v68;
  int v69;
  uint8_t buf[4];
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = v12;
  v57 = v13;
  v54 = (void *)a1;
  v55 = a6;
  v56 = v11;
  -[PPLocalTopicStore _topicTransformForId:](a1, v11);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v60, "outputTopicCount");
  if ((_DWORD)v15 && objc_msgSend(v12, "limit"))
  {
    v53 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v53, "setLimit:", -1);
    v66 = 0;
    v67 = (int *)&v66;
    v68 = 0x2020000000;
    v69 = 0;
    v16 = (void *)objc_opt_new();
    v17 = (void *)objc_opt_new();
    v65 = 0;
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __91__PPLocalTopicStore__defaultIterScoresForTopicMapping_query_error_clientProcessName_block___block_invoke;
    v61[3] = &unk_1E7E1D078;
    v50 = v16;
    v62 = v50;
    v51 = v17;
    v63 = v51;
    v64 = &v66;
    v58 = objc_msgSend(v54, "iterScoredTopicsWithQuery:error:clientProcessName:block:", v53, &v65, 0, v61);
    v52 = v65;
    if ((v58 & 1) != 0)
    {
      v18 = objc_retainAutorelease(v51);
      v19 = objc_msgSend(v18, "mutableBytes");
      objc_msgSend(v60, "applyFeatureSmoothing:vectorLength:", v19, v67[6]);
      v20 = objc_retainAutorelease(v18);
      v21 = objc_msgSend(v20, "mutableBytes");
      objc_msgSend(v60, "applyFeatureScaling:vectorLength:", v21, v67[6]);
      v22 = objc_retainAutorelease(v20);
      v23 = objc_msgSend(v22, "mutableBytes");
      objc_msgSend(v60, "applyFeatureNormalization:vectorLength:", v23, v67[6]);
      v24 = objc_msgSend(objc_retainAutorelease(v50), "mutableBytes");
      v25 = objc_msgSend(objc_retainAutorelease(v22), "mutableBytes");
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 4 * (int)v15);
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2 * (int)v15);
      v49 = objc_retainAutorelease(v26);
      v28 = objc_msgSend(v49, "mutableBytes");
      v48 = objc_retainAutorelease(v27);
      v29 = objc_msgSend(v48, "mutableBytes");
      if (v67[6] >= 1)
      {
        v31 = 0;
        do
        {
          LODWORD(v30) = *(_DWORD *)(v25 + 4 * v31);
          objc_msgSend(v60, "addWeightedTopicScoreToBuffer:countNonZeroComponentsInBuffer:qid:score:", v28, v29, *(unsigned int *)(v24 + 4 * v31++), v30);
        }
        while (v31 < v67[6]);
      }
      objc_msgSend(v60, "applyOutputScaling:vectorLength:", v28, v15);
      if (objc_msgSend(v14, "scoreWithBiases"))
        objc_msgSend(v60, "addBias:", v28);
      objc_msgSend(v60, "applyOutputActivation:", v28);
      v59 = 0;
      v32 = 0;
      buf[0] = 0;
      if (v15 <= 1)
        v33 = 1;
      else
        v33 = v15;
      while (1)
      {
        v34 = *(float *)(v28 + 4 * v32);
        objc_msgSend(v60, "threshold");
        if (v34 <= v35)
          goto LABEL_24;
        v36 = *(unsigned __int16 *)(v29 + 2 * v32);
        if (objc_msgSend(v14, "minimumComponentCount") > v36)
          goto LABEL_24;
        v37 = (void *)MEMORY[0x1C3BD6630]();
        if (!buf[0])
          break;
LABEL_23:
        objc_autoreleasePoolPop(v37);
        ++v59;
LABEL_24:
        if (v33 == ++v32)
        {
          -[PPLocalTopicStore _petLoggingForMappedTopicQuery:mappingId:count:clientProcessName:hasError:]((uint64_t)v54, v14, v56, v59, v57, 0);

          goto LABEL_32;
        }
      }
      v38 = v14;
      objc_msgSend(v60, "payloadForTopic:", v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultIterScoresForTopicMapping_query_error_clientProcessName_block_, v54, CFSTR("PPLocalTopicStore.m"), 732, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("topicName"));

      }
      objc_msgSend(v14, "matchingMappedTopicIds");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        objc_msgSend(v14, "matchingMappedTopicIds");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "containsObject:", v39);

        v14 = v38;
        if (((v39 != 0) & v43) == 0)
          goto LABEL_22;
      }
      else if (!v39)
      {
LABEL_22:

        goto LABEL_23;
      }
      LODWORD(v41) = *(_DWORD *)(v28 + 4 * v32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v55[2](v55, v39, v44, buf);

      v14 = v38;
      goto LABEL_22;
    }
    pp_topics_log_handle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v52;
      _os_log_impl(&dword_1C392E000, v46, OS_LOG_TYPE_DEFAULT, "Encountered an error iterating scored topics: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v52);
    -[PPLocalTopicStore _petLoggingForMappedTopicQuery:mappingId:count:clientProcessName:hasError:]((uint64_t)v54, v14, v11, 0, v57, 1);
LABEL_32:

    _Block_object_dispose(&v66, 8);
  }
  else
  {
    v58 = 1;
  }

  return v58;
}

void __91__PPLocalTopicStore__defaultIterScoresForTopicMapping_query_error_clientProcessName_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  int v7;
  double v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6 < 0xC
    && (v11 = 0,
        v10 = 0,
        objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v10, 11, 0, 1, 0, 0, v6, 0), v10 == 81))
  {
    v7 = atol((const char *)&v10 + 1);

    LODWORD(v10) = v7;
    if (v7 != -1)
    {
      objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", &v10, 4);
      objc_msgSend(v3, "score");
      *(float *)&v8 = v8;
      v9 = LODWORD(v8);
      objc_msgSend(*(id *)(a1 + 40), "appendBytes:length:", &v9, 4);
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    }
  }
  else
  {

  }
}

void __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  NSObject *v12;
  unsigned int *v13;
  unsigned int v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;

  v15 = a2;
  v5 = a3;
  if (objc_msgSend(v15, "count"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "decayRate");
    objc_msgSend(v6, "scoreTopics:scoringDate:decayRate:strictFiltering:sourceStats:decayedFeedbackCounts:streamingScorer:mlModel:", v15, v7, objc_msgSend(*(id *)(a1 + 48), "scoreWithStrictFiltering"), *(_QWORD *)(a1 + 56), v5, *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_2;
      block[3] = &unk_1E7E1D3B0;
      v12 = *(NSObject **)(a1 + 64);
      v18 = *(id *)(a1 + 72);
      v17 = v9;
      dispatch_sync(v12, block);

    }
    else
    {
      v13 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }

  }
}

void __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_186(uint64_t a1, void *a2)
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
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v3, "topic");
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
      goto LABEL_8;
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "use2StageScoreInterpreterForTPScoring"))
    {

    }
    else
    {
      +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "topicScoringUsesHybrid");

      if (!v12)
        goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", *(_QWORD *)(a1 + 32));
    v13 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_2_187;
    block[3] = &unk_1E7E1D000;
    v39 = *(id *)(a1 + 56);
    v36 = v8;
    v37 = v9;
    v38 = *(id *)(a1 + 32);
    dispatch_async(v13, block);

LABEL_8:
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v3, 0);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    objc_msgSend(v3, "topic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "clusterIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    objc_msgSend(v3, "topic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clusterIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "decayedFeedbackCountsForClusterIdentifier:");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
    }
    else
    {
      pp_default_log_handle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v3, "topic");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "topicIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v34;
        _os_log_fault_impl(&dword_1C392E000, v26, OS_LOG_TYPE_FAULT, "Topic record unexpectedly had nil cluster identifier while aggregating for scoring. %@", buf, 0xCu);

      }
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v28 = *(void **)(v27 + 40);
      *(_QWORD *)(v27 + 40) = 0;

      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lowercaseString");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v32 = *(void **)(v31 + 40);
      *(_QWORD *)(v31 + 40) = v30;

    }
    goto LABEL_15;
  }
  objc_msgSend(v7, "addObject:", v3);
LABEL_16:

}

uint64_t __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_191(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

void __74__PPLocalTopicStore__petLoggingForQuery_count_clientProcessName_hasError___block_invoke(uint64_t a1)
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
  objc_msgSend(v9, "setLimitHit:", *(_QWORD *)(a1 + 56) > (unint64_t)objc_msgSend(*(id *)(a1 + 40), "limit"));
  objc_msgSend(*(id *)(a1 + 40), "scoringDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeSpec:", v4 != 0);

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

intptr_t __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_2_187(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __77__PPLocalTopicStore_iterScoredTopicsWithQuery_error_clientProcessName_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__PPLocalTopicStore_rankedTopicsWithQuery_error_clientProcessName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    if (*(_BYTE *)(a1 + 48))
    {
      v6 = v3;
      +[PPLocalTopicStore calibrateScoredTopic:calibrationTrie:](PPLocalTopicStore, "calibrateScoredTopic:calibrationTrie:", v3, *(_QWORD *)(a1 + 32));
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v5;
    }
    v7 = v4;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
}

void __50__PPLocalTopicStore_initWithStorage_trialWrapper___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  __int16 v4[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[2], "removeAllObjects");
    pp_topics_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "PPLocalTopicStore: invaliding model cache due to Trial update.", (uint8_t *)v4, 2u);
    }

  }
}

+ (void)sortAndTruncate:(id)a3 queryLimit:(unint64_t)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_18322);
  if (objc_msgSend(v5, "count") > a4)
    objc_msgSend(v5, "removeObjectsInRange:", a4, objc_msgSend(v5, "count") - a4);

}

+ (id)calibrateScoredTopic:(id)a3 calibrationTrie:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  void *v12;
  double v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  if (a4)
  {
    v6 = a4;
    objc_msgSend(v5, "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topicIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringFromIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "payloadForString:", v9);

    if (v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0D70C38]);
      objc_msgSend(v5, "item");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "score");
      v14 = objc_msgSend(v11, "initWithItem:score:", v12, (double)(1.0 - pow(1.0 - v13, (double)v10 / 100.0)));

      v5 = (id)v14;
    }
  }
  v15 = v5;

  return v15;
}

+ (id)recordsForTopics:(id)a3 source:(id)a4 algorithm:(unint64_t)a5
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
        objc_msgSend(v15, "setTopic:", v16);

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

uint64_t __48__PPLocalTopicStore_sortAndTruncate_queryLimit___block_invoke(uint64_t a1, void *a2, void *a3)
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

@end
