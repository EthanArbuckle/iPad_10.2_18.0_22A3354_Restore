@implementation SPFederatedQueryTask

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  void *v19;
  void *v20;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("com.apple.application"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.Preferences"), CFSTR("com.apple.MobileAddressBook"), CFSTR("com.apple.shortcuts"), 0);
    v3 = (void *)sEligibleBundleSet;
    sEligibleBundleSet = v2;

    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", CFSTR("com.apple.mobilecal"), CFSTR("com.apple.Health"), CFSTR("com.apple.Music"), CFSTR("com.apple.podcasts"), CFSTR("com.apple.reminders"), CFSTR("com.apple.MobileAddressBook"), CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.mobilemail"), CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.Maps"), CFSTR("com.apple.DocumentsApp"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sSearchContinuationCompatibilityCache;
    sSearchContinuationCompatibilityCache = v4;

    v6 = (void *)sAppGenreCache;
    sAppGenreCache = (uint64_t)&unk_24F024F60;

    sDeviceClass = (int)MGGetSInt32Answer();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_overcommit();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.SpotlightFramework.workq", v8);
    v10 = (void *)__workQueue;
    __workQueue = (uint64_t)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.search.daemonQueue", v12);
    v14 = (void *)__lifeCycleQueue;
    __lifeCycleQueue = (uint64_t)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.SpotlightFramework.bgworkq", v16);
    v18 = (void *)__backgroundWorkQueue;
    __backgroundWorkQueue = (uint64_t)v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
    objc_msgSend(v19, "BOOLForKey:", CFSTR("enableDebug"));
    SPSetAppsChangedBlockClient();
    dispatch_get_global_queue(17, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    tracing_dispatch_async();

  }
}

void __34__SPFederatedQueryTask_initialize__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  dispatch_block_t v4;
  _QWORD block[5];
  uint8_t buf[16];

  SPLogForSPLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v2, OS_LOG_TYPE_DEFAULT, "Apps changed", buf, 2u);
  }

  v3 = __workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SPFederatedQueryTask_initialize__block_invoke_162;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v3, v4);

}

uint64_t __34__SPFederatedQueryTask_initialize__block_invoke_162()
{
  return objc_msgSend((id)objc_opt_class(), "invalidateCacheForSearchContinuation");
}

void __34__SPFederatedQueryTask_initialize__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BEB01F0], "sharedManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFeedbackDelegate:", v0);

}

+ (id)appGenreMap
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
  v2 = (void *)objc_msgSend((id)sAppGenreCache, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
  return v2;
}

+ (id)searchContinuationCompatibilitySet
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
  v2 = (void *)objc_msgSend((id)sSearchContinuationCompatibilityCache, "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
  return v2;
}

+ (id)queryClasses
{
  if (queryClasses_onceToken != -1)
    dispatch_once(&queryClasses_onceToken, &__block_literal_global_166);
  return (id)queryClasses_queryClasses;
}

void __36__SPFederatedQueryTask_queryClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)queryClasses_queryClasses;
  queryClasses_queryClasses = v0;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend((id)queryClasses_queryClasses, "arrayByAddingObject:", objc_opt_class(), v8, v9, v10, v11);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)queryClasses_queryClasses;
    queryClasses_queryClasses = v2;

  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend((id)queryClasses_queryClasses, "arrayByAddingObject:", objc_opt_class());
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)queryClasses_queryClasses;
    queryClasses_queryClasses = v4;

  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend((id)queryClasses_queryClasses, "arrayByAddingObject:", objc_opt_class());
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)queryClasses_queryClasses;
    queryClasses_queryClasses = v6;

  }
}

- (id)_queriesForUserQuery:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  objc_class *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  v30 = (id)objc_opt_new();
  -[SPQueryTask query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SPCalculatorQuery enableConversion:](SPCalculatorQuery, "enableConversion:", 1);
  +[SPCalculatorQuery enableCalculator:](SPCalculatorQuery, "enableCalculator:", 1);
  +[SPDictionaryQuery enableDictionary:](SPDictionaryQuery, "enableDictionary:", 1);
  v31 = v6;
  objc_msgSend(v6, "disabledBundles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.conversion"));

  if (v8)
    +[SPCalculatorQuery enableConversion:](SPCalculatorQuery, "enableConversion:", 0);
  objc_msgSend(v6, "disabledBundles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", CFSTR("com.apple.calculator"));

  if (v10)
  {
    +[SPCalculatorQuery enableConversion:](SPCalculatorQuery, "enableConversion:", 0);
    +[SPCalculatorQuery enableCalculator:](SPCalculatorQuery, "enableCalculator:", 0);
  }
  if (-[SPFederatedQueryTask isPeopleSearch](self, "isPeopleSearch")
    || -[SPFederatedQueryTask isScopedAppSearch](self, "isScopedAppSearch"))
  {
    +[SPDictionaryQuery enableDictionary:](SPDictionaryQuery, "enableDictionary:", 0);
    +[SPCalculatorQuery enableConversion:](SPCalculatorQuery, "enableConversion:", 0);
    +[SPCalculatorQuery enableCalculator:](SPCalculatorQuery, "enableCalculator:", 0);
  }
  -[SPQueryTask query](self, "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "queryContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "options");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend((id)objc_opt_class(), "queryClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    v18 = &unk_24F025028;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v20 = *(objc_class **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (!v3 || v20 != (objc_class *)objc_opt_class())
        {
          SPGetDisabledDomains();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "containsObject:", v18))
          {
            v22 = v3;
            v23 = v18;
            v24 = objc_opt_class();

            v25 = v20 == (objc_class *)v24;
            v18 = v23;
            v3 = v22;
            if (v25)
              continue;
          }
          else
          {

          }
          if (-[objc_class isQuerySupported:](v20, "isQuerySupported:", v13))
          {
            v26 = [v20 alloc];
            objc_msgSend(v31, "searchString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v26, "initWithUserQuery:queryGroupId:options:queryContext:", v27, objc_msgSend(v31, "queryIdent"), v13, v31);

            if (v28)
              objc_msgSend(v30, "addObject:", v28);

          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v16);
  }

  return v30;
}

- (id)_queriesForSearchTool
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SPCSSearchQuery *v9;
  void *v10;
  SPCSSearchQuery *v11;

  v3 = (void *)objc_opt_new();
  -[SPQueryTask query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEB0280];
  objc_msgSend(v5, "searchString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalizeSearchString:queryContext:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchString:", v8);

  v9 = [SPCSSearchQuery alloc];
  objc_msgSend(v5, "searchString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SPCSSearchQuery initWithUserQuery:queryGroupId:options:queryContext:](v9, "initWithUserQuery:queryGroupId:options:queryContext:", v10, objc_msgSend(v5, "queryIdent"), objc_msgSend(v5, "options"), v5);

  if (v11)
    objc_msgSend(v3, "addObject:", v11);

  return v3;
}

- (void)startSetup
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t externalID;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  SPLogForSPLogCategoryTelemetry();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  externalID = self->_externalID;
  if ((_DWORD)externalID && os_signpost_enabled(v3))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_2279CC000, v4, OS_SIGNPOST_INTERVAL_BEGIN, externalID, "spotlightLatency", " enableTelemetry=YES ", v10, 2u);
  }

  self->_startTime = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_startTimeIntervalSinceReferenceDate = v6;
  -[SPQueryTask query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SDTraceAdd();

  self->_genreGroupingEnabled = SPGenreGroupingEnabled();
  self->_shouldRecomputeSuggestions = 1;
}

- (void)addQueryToken:(id)a3
{
  -[NSMutableArray addObject:](self->_tokens, "addObject:", a3);
}

- (void)addSlowQueryToken:(id)a3
{
  -[NSMutableArray addObject:](self->_slowTokens, "addObject:", a3);
}

- (void)addDelayedStartQuery:(id)a3
{
  -[NSMutableArray addObject:](self->_delayedStartQueries, "addObject:", a3);
}

- (void)cancelQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *slowTokens;
  NSMutableArray *tokens;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *categoryToResultMapping;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  SDTraceAdd();
  -[SPQueryTask query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[SPFederatedQueryTask itemRanker](self, "itemRanker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[SSRankingManager cancel](self->_rankingManager, "cancel");
  v5 = (void *)-[NSMutableArray copy](self->_slowTokens, "copy");
  v6 = (void *)-[NSMutableArray copy](self->_tokens, "copy");
  slowTokens = self->_slowTokens;
  self->_slowTokens = 0;

  tokens = self->_tokens;
  self->_tokens = 0;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13++), "cancel");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v11);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18++), "cancel", (_QWORD)v20);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }

  categoryToResultMapping = self->_categoryToResultMapping;
  self->_categoryToResultMapping = 0;

  self->_sentTaggedTopHits = 0;
  -[SPFederatedQueryTask setMessage:](self, "setMessage:", 0);

}

+ (void)prepareCacheForSearchContinuation
{
  dispatch_async((dispatch_queue_t)__backgroundWorkQueue, &__block_literal_global_192);
}

void __57__SPFederatedQueryTask_prepareCacheForSearchContinuation__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  uint64_t v32;
  id obj;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if ((sCacheUpToDate & 1) != 0)
    return;
  if (!sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache)
  {
    v0 = objc_opt_new();
    v1 = (void *)sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache;
    sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache = v0;

  }
  SPCopyVisibleApps();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
  v3 = (void *)objc_msgSend((id)sAppGenreCache, "mutableCopy");
  v4 = (void *)objc_msgSend((id)sSearchContinuationCompatibilityCache, "mutableCopy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  obj = v5;
  if (!v6)
    goto LABEL_47;
  v8 = v6;
  v32 = 0;
  v9 = *(_QWORD *)v37;
  *(_QWORD *)&v7 = 138412290;
  v31 = v7;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v37 != v9)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
      if ((objc_msgSend(v4, "containsObject:", v11, v31) & 1) == 0
        && (objc_msgSend((id)sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache, "containsObject:", v11) & 1) == 0)
      {
        v12 = objc_alloc(MEMORY[0x24BDC1540]);
        v35 = 0;
        v13 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:allowPlaceholder:error:", v11, 1, &v35);
        v14 = v35;
        if (v14)
        {
          v15 = v14;
          SPLogForSPLogCategoryDefault();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v41 = v15;
            _os_log_error_impl(&dword_2279CC000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

        }
        if (v13)
        {
          v17 = objc_msgSend(v13, "supportsSpotlightQueryContinuation");
          objc_msgSend(v13, "iTunesMetadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "genre");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v17 & 1) != 0)
          {
            LODWORD(v32) = 1;
            v20 = v4;
            goto LABEL_20;
          }
        }
        else
        {
          v19 = 0;
        }
        v20 = (void *)sSRResources_block_invoke_sSearchContinuationCompatibilityNegativeCache;
LABEL_20:
        objc_msgSend(v20, "addObject:", v11);
        objc_msgSend(v3, "objectForKey:", v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21 && v19 && (objc_msgSend(v19, "isEqual:", &stru_24F01C208) & 1) == 0)
        {
          objc_msgSend(v3, "setObject:forKey:", v19, v11);
          HIDWORD(v32) = 1;
        }

      }
      objc_msgSend(v3, "objectForKey:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        v23 = objc_alloc(MEMORY[0x24BDC1540]);
        v34 = 0;
        v24 = (void *)objc_msgSend(v23, "initWithBundleIdentifier:allowPlaceholder:error:", v11, 1, &v34);
        v25 = v34;
        if (v25)
        {
          v26 = v25;
          SPLogForSPLogCategoryDefault();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v41 = v26;
            _os_log_error_impl(&dword_2279CC000, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

        }
        objc_msgSend(v24, "iTunesMetadata");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "genre");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29 && (objc_msgSend(v29, "isEqual:", &stru_24F01C208) & 1) == 0)
        {
          objc_msgSend(v3, "setObject:forKey:", v29, v11);
          HIDWORD(v32) = 1;
        }

      }
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  }
  while (v8);

  if (((v32 | HIDWORD(v32)) & 1) != 0)
  {
    if ((v32 & 0x100000000) != 0)
    {
      v5 = (id)objc_msgSend(v3, "copy");
      if ((v32 & 1) == 0)
      {
        v30 = 0;
        goto LABEL_42;
      }
LABEL_41:
      v30 = (void *)objc_msgSend(v4, "copy");
    }
    else
    {
      v5 = 0;
      v30 = 0;
      if ((v32 & 1) != 0)
        goto LABEL_41;
    }
LABEL_42:
    os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
    if (v5)
      objc_storeStrong((id *)&sAppGenreCache, v5);
    if (v30)
      objc_storeStrong((id *)&sSearchContinuationCompatibilityCache, v30);
    os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);

LABEL_47:
  }
  sCacheUpToDate = 1;

}

+ (void)invalidateCacheForSearchContinuation
{
  dispatch_async((dispatch_queue_t)__backgroundWorkQueue, &__block_literal_global_196);
}

void __60__SPFederatedQueryTask_invalidateCacheForSearchContinuation__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  SPCopyVisibleApps();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
  v1 = (void *)objc_msgSend((id)sAppGenreCache, "mutableCopy");
  os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v3)
  {
    v4 = v3;
    v22 = 0;
    v5 = *(_QWORD *)v27;
    v6 = 0x24BDC1000uLL;
    v23 = v2;
    v24 = *(_QWORD *)v27;
    do
    {
      v7 = 0;
      v25 = v4;
      do
      {
        if (*(_QWORD *)v27 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7);
        objc_msgSend(v1, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          objc_msgSend(*(id *)(v6 + 1336), "applicationProxyForIdentifier:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          SPLogForSPLogCategoryDefault();
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = 2 * (*MEMORY[0x24BE84AF8] == 0);
          if (os_log_type_enabled(v11, v12))
          {
            objc_msgSend(v10, "genre");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "subgenres");
            v14 = v1;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "genreID");
            v16 = v6;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v31 = v8;
            v32 = 2112;
            v33 = v13;
            v34 = 2112;
            v35 = v15;
            v36 = 2112;
            v37 = v17;
            _os_log_impl(&dword_2279CC000, v11, v12, "%@ genre %@, subgenre %@, id %@", buf, 0x2Au);

            v6 = v16;
            v1 = v14;
            v2 = v23;
            v5 = v24;

            v4 = v25;
          }

          objc_msgSend(v10, "genre");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18 && (objc_msgSend(v18, "isEqual:", &stru_24F01C208) & 1) == 0)
          {
            objc_msgSend(v1, "setObject:forKey:", v19, v8);
            v22 = 1;
          }

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v4);

    if ((v22 & 1) != 0)
    {
      v20 = objc_msgSend(v1, "copy");
      os_unfair_lock_lock((os_unfair_lock_t)&sCacheLock);
      v21 = (void *)sAppGenreCache;
      sAppGenreCache = v20;

      os_unfair_lock_unlock((os_unfair_lock_t)&sCacheLock);
    }
  }
  else
  {

  }
  sCacheUpToDate = 0;

}

+ (BOOL)sectionSupportsShowMoreInApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SPFederatedQueryTask searchContinuationCompatibilitySet](SPFederatedQueryTask, "searchContinuationCompatibilitySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "containsObject:", v5);
  return (char)v3;
}

- (void)setBundlesSupportingAppScoping:(id)a3
{
  NSArray *v4;
  NSArray *bundlesSupportingAppScoping;

  objc_msgSend(a3, "allObjects");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  bundlesSupportingAppScoping = self->_bundlesSupportingAppScoping;
  self->_bundlesSupportingAppScoping = v4;

}

- (BOOL)isBullseyeNonCommittedSearch
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[SPQueryTask query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "queryKind");

  return v5 == 2 || v5 == 10 && self->_previousQueryKind == 2;
}

- (BOOL)isBullseyeCommittedSearch
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[SPQueryTask query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "queryKind");

  if ((unint64_t)(v5 - 5) < 4)
    return 1;
  if (v5 == 10)
    return self->_previousQueryKind - 5 < 4;
  return 0;
}

- (void)sendTTRLogsWithSections:(id)a3
{
  SSRankingManager *rankingManager;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  rankingManager = self->_rankingManager;
  v5 = a3;
  -[SPQueryTask query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPQueryTask query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRankingManager sendTTRLogsWithSections:searchString:queryKind:isCommittedSearch:parsecCameLaterThanSRT:](rankingManager, "sendTTRLogsWithSections:searchString:queryKind:isCommittedSearch:parsecCameLaterThanSRT:", v5, v8, objc_msgSend(v10, "queryKind"), -[SPFederatedQueryTask isBullseyeCommittedSearch](self, "isBullseyeCommittedSearch"), self->_parsecCameLaterThanSRT);

  -[SSRankingManager logValues](self->_rankingManager, "logValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[SSRankingManager logValues](self->_rankingManager, "logValues");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[SPFederatedQueryTask sendLogValuesForDebuggingRanking:](self, "sendLogValuesForDebuggingRanking:", v13);

  }
}

- (void)deDuplicateMailResults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v3 = objc_alloc(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v17, "resultSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v6 = (void *)objc_opt_new();
  objc_msgSend(v17, "resultSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      objc_msgSend(v17, "resultSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "rankingItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "attributes");
        SSCompactRankingAttrsGetValue();
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          if (objc_msgSend(v5, "containsObject:", v14))
            objc_msgSend(v6, "addIndex:", i);
          else
            objc_msgSend(v5, "addObject:", v15);

        }
      }

    }
  }
  objc_msgSend(v17, "resultSet");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectsAtIndexes:", v6);

}

- (void)deDuplicateSection:(id)a3 againstSection:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v6, "resultSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  objc_msgSend(v5, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", *MEMORY[0x24BEB0358]) & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v5, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  if (v13)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v6, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v45;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v45 != v16)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * v17), "rankingItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isServerAlternativeResult");

          if ((v19 & 1) != 0)
          {

            v20 = v5;
            v5 = v6;
            goto LABEL_13;
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (v15)
          continue;
        break;
      }
    }
    goto LABEL_11;
  }
LABEL_12:
  v20 = v6;
LABEL_13:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v20, "resultSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v41;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v25), "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
          objc_msgSend(v9, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v23);
  }

  v27 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v5, "resultSet", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v29)
  {
    v30 = v29;
    v31 = 0;
    v32 = *(_QWORD *)v37;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v33), "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34 && objc_msgSend(v9, "containsObject:", v34))
          objc_msgSend(v27, "addIndex:", v31 + v33);

        ++v33;
      }
      while (v30 != v33);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      v31 += v33;
    }
    while (v30);
  }

  objc_msgSend(v5, "resultSet");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "removeObjectsAtIndexes:", v27);

}

- (id)dedupeLocalSectionsByBundleId:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v5 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "bundleIdentifier", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.parsec")) & 1) == 0)
        {
          if (objc_msgSend(v4, "containsObject:", v13))
            objc_msgSend(v5, "addIndex:", v9);
          else
            objc_msgSend(v4, "addObject:", v13);
          ++v9;
        }

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    v14 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v14, "removeObjectsAtIndexes:", v5);

    v6 = v14;
  }

  return v6;
}

- (void)serverSideDedupe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SPFederatedQueryTask *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  int v66;
  float v67;
  float v68;
  float v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  char v90;
  void *v91;
  unsigned int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  BOOL v114;
  void *v115;
  id v116;
  id *v117;
  void *v118;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  int v128;
  void *v129;
  uint64_t v130;
  void *v131;
  int v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  void *v140;
  uint64_t v141;
  void *v142;
  int v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  void *v151;
  int v152;
  void *v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;
  int v158;
  void *v159;
  int v160;
  void *v161;
  unint64_t v162;
  unint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  id v172;
  void *v173;
  void *v174;
  int v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  unint64_t v182;
  void *v183;
  uint64_t v184;
  SPFederatedQueryTask *v185;
  uint64_t v186;
  void *v187;
  id obj;
  id v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  int v218;
  unsigned int v219;
  void *v220;
  id v221;
  void *v222;
  uint64_t v223;
  int v224;
  id v225;
  void *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  id v230;
  void *v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  void *v244;
  void *v245;
  _QWORD v246[2];
  _QWORD v247[2];
  _QWORD v248[2];
  id v249;
  id v250;
  id v251;
  _QWORD v252[2];
  _QWORD v253[2];
  _QWORD v254[2];
  _QWORD v255[2];
  _BYTE v256[128];
  _QWORD v257[2];
  _BYTE v258[128];
  _BYTE v259[128];
  uint64_t v260;

  v260 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v193 = (void *)objc_opt_new();
  v199 = (void *)objc_opt_new();
  v204 = (void *)objc_opt_new();
  v211 = (void *)objc_opt_new();
  v198 = (void *)objc_opt_new();
  v7 = self;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("_"));
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = SSEnableSpotlightTopHitPersonalizedRanking();
  -[SPFederatedQueryTask dedupeLocalSectionsByBundleId:](self, "dedupeLocalSectionsByBundleId:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v222 = v5;
  v213 = v6;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", CFSTR("com.apple.spotlight.tophits")) & 1) != 0)
    {
      objc_msgSend(v10, "resultSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sectionBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = priorityIndexEligibleBundleIdentifer(v14);

      if (v15)
        v189 = v10;
      else
        v189 = 0;
      v5 = v222;
    }
    else
    {

      v189 = 0;
    }
    v6 = v213;

  }
  else
  {
    v189 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  v243 = 0u;
  obj = v9;
  v195 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v240, v259, 16);
  if (v195)
  {
    v194 = *(_QWORD *)v241;
    v190 = *MEMORY[0x24BEB03E0];
    v223 = *MEMORY[0x24BEB04F8];
    v216 = *MEMORY[0x24BEB04B8];
    v206 = *MEMORY[0x24BEB0450];
    v215 = *MEMORY[0x24BEB0370];
    v205 = *MEMORY[0x24BDC1DE8];
    v186 = *MEMORY[0x24BDC2220];
    v210 = *MEMORY[0x24BEB0458];
    v203 = *MEMORY[0x24BDC1B38];
    v209 = *MEMORY[0x24BEB0358];
    v184 = *MEMORY[0x24BEB06F0];
    v208 = *MEMORY[0x24BEB06C0];
    v214 = *MEMORY[0x24BEB04D8];
    v201 = *MEMORY[0x24BDC21A0];
    v212 = *MEMORY[0x24BEB04D0];
    v207 = *MEMORY[0x24BEB0460];
    v185 = v7;
    v217 = v8;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v241 != v194)
          objc_enumerationMutation(obj);
        v200 = v16;
        v17 = *(id *)(*((_QWORD *)&v240 + 1) + 8 * v16);
        if (-[SPFederatedQueryTask isBullseyeCommittedSearch](v7, "isBullseyeCommittedSearch"))
        {
          objc_msgSend(v17, "bundleIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

          if ((v19 & 1) != 0)
            goto LABEL_206;
        }
        v225 = objc_alloc_init(MEMORY[0x24BDD1698]);
        objc_msgSend(v17, "results");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sectionBundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v190);

        if (v23)
        {
          -[SPFederatedQueryTask deDuplicateMailResults:](v7, "deDuplicateMailResults:", v17);
          v24 = v225;
          goto LABEL_205;
        }
        v25 = v17;
        v229 = v17;
        if (v17 != v189)
        {
          objc_msgSend(v17, "resultSet");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "sectionBundleIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "resultSet");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "sectionBundleIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "isEqualToString:", v31))
          {
            v32 = -[SPFederatedQueryTask isBullseyeCommittedSearch](v7, "isBullseyeCommittedSearch");

            v25 = v229;
            if (!v32)
              -[SPFederatedQueryTask deDuplicateSection:againstSection:](v7, "deDuplicateSection:againstSection:", v229, v189);
          }
          else
          {

            v25 = v229;
          }
        }
        objc_msgSend(v25, "resultSet");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (!v34)
        {
          v41 = 0;
          v8 = v217;
          goto LABEL_204;
        }
        v35 = 0;
        v36 = 0;
        v219 = 0;
        v37 = 0;
        v8 = v217;
        do
        {
          v38 = v36;
          objc_msgSend(v25, "resultSet");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectAtIndexedSubscript:", v35);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v38);
          v41 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "resultBundleId");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v39) = objc_msgSend(v42, "isEqualToString:", v223);

          v218 = v38;
          if ((_DWORD)v39)
            v43 = v38;
          else
            v43 = v219;
          v219 = v43;
          objc_msgSend(v40, "sectionBundleIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v220 = v41;
          v231 = v40;
          if (objc_msgSend(v44, "isEqualToString:", v216))
          {

          }
          else
          {
            objc_msgSend(v40, "sectionBundleIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isEqualToString:", v206);

            if (!v46)
            {
              v230 = 0;
              v226 = 0;
              goto LABEL_90;
            }
          }
          v238 = 0u;
          v239 = 0u;
          v236 = 0u;
          v237 = 0u;
          objc_msgSend(v40, "alternativeURLs");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v236, v258, 16);
          if (!v48)
          {

            v226 = 0;
            v40 = v231;
            goto LABEL_62;
          }
          v49 = v48;
          v230 = 0;
          v226 = 0;
          v50 = *(_QWORD *)v237;
          do
          {
            v51 = 0;
            v227 = v49;
            do
            {
              if (*(_QWORD *)v237 != v50)
                objc_enumerationMutation(v47);
              objc_msgSend(*(id *)(*((_QWORD *)&v236 + 1) + 8 * v51), "absoluteString");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              strippedURL();
              v53 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "objectForKey:", v53);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "objectAtIndex:", 0);
              v55 = objc_claimAutoreleasedReturnValue();
              v56 = (id)v55;
              if (v55)
              {
                if ((void *)v55 == v231)
                  goto LABEL_57;
                v57 = v47;
                objc_msgSend(v54, "objectAtIndex:", 1);
                v58 = (id)objc_claimAutoreleasedReturnValue();
                v59 = (uint64_t)v230;
                if (v230)
                {
                  if (v230 != v56)
                  {
                    if ((int)objc_msgSend(v230, "topHit") >= 1)
                      goto LABEL_42;
                    if ((int)objc_msgSend(v56, "topHit") >= 1)
                    {
                      v60 = v230;
                      goto LABEL_53;
                    }
                    v59 = (uint64_t)v230;
                    objc_msgSend(v230, "l2score");
                    v68 = v67;
                    objc_msgSend(v56, "l2score");
                    if (v68 >= v69)
                    {
LABEL_42:
                      v60 = v56;
                      v61 = v58;
                      v62 = v225;
                      v63 = v59;
                    }
                    else
                    {
                      v60 = v230;
LABEL_53:
                      v62 = v225;
                      v61 = v226;
                      v63 = (uint64_t)v56;
                    }
                    hideResultFromSection(v60, v61, v62, v63, v25);
                  }
                }
                else
                {
                  v64 = v56;
                  v58 = v58;

                  v230 = v64;
                  if (v224)
                  {
                    objc_msgSend(v64, "resultBundleId");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = objc_msgSend(v65, "isEqualToString:", v223);

                    if (v66)
                      objc_msgSend(MEMORY[0x24BEB0320], "setTopHitCandidate:", v64);
                    v226 = v58;
                    v5 = v222;
                    v25 = v229;
                  }
                  else
                  {
                    v226 = v58;
                  }
                }
                v47 = v57;
                v49 = v227;
                goto LABEL_56;
              }
              v257[0] = v231;
              v257[1] = v25;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v257, 2);
              v58 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v58, v53);
LABEL_56:

LABEL_57:
              ++v51;
            }
            while (v49 != v51);
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v236, v258, 16);
          }
          while (v49);

          v8 = v217;
          v40 = v231;
          if (v230)
            goto LABEL_78;
LABEL_62:
          v234 = 0u;
          v235 = 0u;
          v232 = 0u;
          v233 = 0u;
          objc_msgSend(v40, "punchout");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "urls");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v232, v256, 16);
          if (!v72)
          {
            v230 = 0;
            goto LABEL_77;
          }
          v73 = v72;
          v230 = 0;
          v74 = *(_QWORD *)v233;
          while (2)
          {
            v75 = 0;
            while (2)
            {
              if (*(_QWORD *)v233 != v74)
                objc_enumerationMutation(v71);
              objc_msgSend(*(id *)(*((_QWORD *)&v232 + 1) + 8 * v75), "absoluteString");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              strippedURL();
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "objectForKey:", v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "objectAtIndex:", 0);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = v79;
              if (v79)
              {
                v25 = v229;
                if (v79 != v40)
                {
                  v81 = v230;
                  v230 = v79;
                  goto LABEL_71;
                }
              }
              else
              {
                v255[0] = v40;
                v25 = v229;
                v255[1] = v229;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v255, 2);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:forKey:", v81, v77);
LABEL_71:

                v40 = v231;
              }

              if (v73 != ++v75)
                continue;
              break;
            }
            v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v232, v256, 16);
            if (v73)
              continue;
            break;
          }
LABEL_77:

          v8 = v217;
LABEL_78:
          objc_msgSend(v40, "contentURL");
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v82)
          {
            v41 = v220;
            goto LABEL_90;
          }
          v41 = v220;
          if (v230)
            goto LABEL_90;
          objc_msgSend(v40, "contentURL");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          strippedURL();
          v84 = v40;
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "objectForKey:", v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "objectAtIndex:", 0);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v87;
          if (!v87)
          {
            v254[0] = v84;
            v254[1] = v25;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v254, 2);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v93, v85);

LABEL_87:
            v230 = 0;
            goto LABEL_89;
          }
          if (v87 == v84)
            goto LABEL_87;
          if (v224)
          {
            objc_msgSend(v87, "resultBundleId");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend(v89, "isEqualToString:", v223);

            if ((v90 & 1) != 0)
            {
              v253[0] = v231;
              v253[1] = v25;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v253, 2);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKey:", v91, v85);

              v230 = 0;
              v92 = v219;
              goto LABEL_197;
            }
          }
          v230 = v88;
LABEL_89:

          v40 = v231;
LABEL_90:
          objc_msgSend(v40, "storeIdentifier");
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          if (v94)
          {
            objc_msgSend(v40, "storeIdentifier");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v213, "objectForKeyedSubscript:", v95);
            v96 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v96, "objectAtIndex:", 0);
            v97 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "objectAtIndex:", 1);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v97)
            {
              v252[0] = v40;
              v252[1] = v25;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v252, 2);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "storeIdentifier");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v213, "setObject:forKeyedSubscript:", v99, v100);

              v25 = v229;
              goto LABEL_98;
            }
            if (v97 != v230)
            {
              if (objc_msgSend(v97, "type") == 26)
              {
                v99 = v230;
                v230 = v97;
                goto LABEL_98;
              }
              if (objc_msgSend(v40, "type") == 26)
              {
                handleHiddenResult();
                objc_msgSend(v98, "removeResults:", v97);
                v99 = v230;
                v230 = 0;
LABEL_98:

                v41 = v220;
              }
            }

          }
          objc_msgSend(v40, "sectionBundleIdentifier");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v101, "isEqualToString:", v215);

          if (!v102)
            goto LABEL_127;
          objc_msgSend(v40, "valueForAttribute:withType:", v205, objc_opt_class());
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v103;
          if (!v103
            || (unint64_t)objc_msgSend(v103, "length") < 0x24
            || (objc_msgSend(v85, "substringToIndex:", 36), (v104 = objc_claimAutoreleasedReturnValue()) == 0))
          {
LABEL_198:

            v40 = v231;
            goto LABEL_200;
          }
          v105 = (void *)v104;
          objc_msgSend(v193, "objectForKeyedSubscript:", v104);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v106;
          if (v106)
          {
            v197 = v105;
            objc_msgSend(v106, "objectAtIndexedSubscript:", 0);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v192 = v107;
            objc_msgSend(v107, "objectAtIndexedSubscript:", 1);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            v228 = v108;
            objc_msgSend(v108, "valueForAttribute:withType:", v186, objc_opt_class());
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v231, "valueForAttribute:withType:", v186, objc_opt_class());
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "earlierDate:", v187);
            v111 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v110, "earlierDate:", v187);
            v112 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v109, "earlierDate:", v110);
            v113 = (void *)objc_claimAutoreleasedReturnValue();

            v114 = v111 != v109;
            v191 = v109;
            if (v111 != v109 || v112 != v110)
            {
              if (v112 == v110)
                v114 = 1;
              if (v114)
              {
                if (v111 != v109 && v112 == v110)
                  goto LABEL_121;
                if (v111 == v109 || v112 == v110)
                {
                  v41 = v220;
                  v105 = v197;
                  v107 = v192;
                  goto LABEL_125;
                }
                if (v113 == v109)
                  goto LABEL_121;
                v115 = v231;
                v120 = v231;

                v249 = v120;
                v117 = &v249;
              }
              else
              {
                v115 = v231;
                v124 = v231;

                v250 = v124;
                v117 = &v250;
              }
LABEL_123:
              v117[1] = v220;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v193, "setObject:forKeyedSubscript:", v125, v197);

              v41 = v196;
              v122 = v115;
              v123 = v228;
              v121 = v228;
              goto LABEL_124;
            }
            if (v113 == v109)
            {
              v115 = v231;
              v116 = v231;

              v251 = v116;
              v117 = &v251;
              goto LABEL_123;
            }
LABEL_121:
            v122 = v230;
            v121 = v231;
            v123 = v108;
            v115 = v108;
            v41 = v220;
LABEL_124:
            v126 = v123;

            v230 = v115;
            v231 = v121;
            v105 = v197;
            v109 = v191;
            v107 = v192;
LABEL_125:

            v8 = v217;
            v118 = v228;
          }
          else
          {
            v248[0] = v231;
            v248[1] = v41;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v248, 2);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v193, "setObject:forKeyedSubscript:", v118, v105);
          }

          v40 = v231;
LABEL_127:
          objc_msgSend(v40, "sectionBundleIdentifier");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          v128 = objc_msgSend(v127, "isEqualToString:", v210);

          if (v128)
          {
            objc_msgSend(v40, "valueForAttribute:withType:", v203, objc_opt_class());
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            if (v129)
            {
              objc_msgSend(v199, "objectForKeyedSubscript:", v129);
              v130 = objc_claimAutoreleasedReturnValue();

              v230 = (id)v130;
              if (!v130)
              {
                objc_msgSend(v199, "setObject:forKeyedSubscript:", v40, v129);
                v230 = 0;
              }
            }

          }
          objc_msgSend(v40, "sectionBundleIdentifier");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = objc_msgSend(v131, "isEqualToString:", v209);

          v231 = v40;
          if (!v132)
          {
            v137 = v211;
            goto LABEL_146;
          }
          objc_msgSend(v40, "identifier");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v85)
          {
            v133 = v230;
LABEL_144:
            v137 = v211;
            goto LABEL_145;
          }
          objc_msgSend(v204, "objectForKeyedSubscript:", v85);
          v133 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v133)
          {
            objc_msgSend(v204, "setObject:forKeyedSubscript:", v231, v85);
            goto LABEL_144;
          }
          objc_msgSend(v133, "rankingItem");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v231, "rankingItem");
          v135 = objc_claimAutoreleasedReturnValue();
          v136 = (void *)v135;
          if (!v134
            || !v135
            || !objc_msgSend(v134, "isTopHit")
            || v134 != v136
            || objc_msgSend(v134, "isServerAlternativeResult"))
          {

            goto LABEL_144;
          }
          objc_msgSend(v25, "bundleIdentifier");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v175 = objc_msgSend(v174, "isEqualToString:", v184);

          v137 = v211;
          if (!v175)
          {
            v230 = v133;
            v25 = v229;
            goto LABEL_198;
          }
LABEL_145:

          v230 = v133;
          v25 = v229;
          v40 = v231;
LABEL_146:
          objc_msgSend(v40, "sectionBundleIdentifier");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          v139 = objc_msgSend(v138, "isEqualToString:", v208);

          if (v139)
          {
            objc_msgSend(v40, "url");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            if (v140)
            {
              objc_msgSend(v198, "objectForKeyedSubscript:", v140);
              v141 = objc_claimAutoreleasedReturnValue();

              v230 = (id)v141;
              if (!v141)
              {
                objc_msgSend(v198, "setObject:forKeyedSubscript:", v40, v140);
                v230 = 0;
              }
            }

          }
          objc_msgSend(v40, "sectionBundleIdentifier");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = objc_msgSend(v142, "isEqualToString:", v214);

          if (v143)
          {
            objc_msgSend(v40, "valueForAttribute:withType:", v201, objc_opt_class());
            v144 = (void *)objc_claimAutoreleasedReturnValue();
            if (v144)
            {
              objc_msgSend(v137, "objectForKeyedSubscript:", v144);
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              v146 = v145;
              if (v145)
              {
                objc_msgSend(v145, "objectAtIndexedSubscript:", 0);
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v147, "sectionBundleIdentifier");
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                v149 = objc_msgSend(v148, "isEqualToString:", v212);

                if (v149)
                {
                  objc_msgSend(v146, "objectAtIndexedSubscript:", 1);
                  v150 = (void *)objc_claimAutoreleasedReturnValue();
                  handleHiddenResult();
                  objc_msgSend(v150, "removeResults:", v147);

                  v230 = 0;
                }
                v5 = v222;
                v25 = v229;
              }
              else
              {
                v247[0] = v40;
                v247[1] = v25;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v247, 2);
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v137, "setObject:forKeyedSubscript:", v147, v144);
              }

            }
          }
          objc_msgSend(v40, "sectionBundleIdentifier");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v152 = objc_msgSend(v151, "isEqualToString:", v212);

          if (v152)
          {
            objc_msgSend(v40, "identifier");
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "objectForKeyedSubscript:", v153);
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            v155 = v154;
            if (v154)
            {
              objc_msgSend(v154, "objectAtIndexedSubscript:", 0);
              v156 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "sectionBundleIdentifier");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v158 = objc_msgSend(v157, "isEqualToString:", v214);

              if (v158)
              {
                v156 = v156;

                v230 = v156;
              }
              v5 = v222;
              v25 = v229;
            }
            else
            {
              v246[0] = v40;
              v246[1] = v25;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v246, 2);
              v156 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "setObject:forKeyedSubscript:", v156, v153);
            }

          }
          objc_msgSend(v40, "sectionBundleIdentifier");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = objc_msgSend(v159, "isEqualToString:", v207);

          if (v160)
          {
            objc_msgSend(v40, "identifier");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            v162 = objc_msgSend(v161, "rangeOfCharacterFromSet:", v202);
            if (v162 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v163 = v162;
              if (v162 < objc_msgSend(v161, "length"))
              {
                objc_msgSend(v161, "substringToIndex:", v163);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v161, "substringWithRange:", v163 + 1, objc_msgSend(v161, "length") + ~v163);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v164, "length") && objc_msgSend(v165, "length"))
                {
                  v221 = v41;
                  objc_msgSend(v8, "objectForKeyedSubscript:", v165);
                  v166 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v166, "objectAtIndexedSubscript:", 1);
                  v167 = v8;
                  v168 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v166, "objectAtIndexedSubscript:", 0);
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = v229;
                  if (v166)
                  {
                    if (objc_msgSend(v164, "compare:", v168) == 1)
                    {
                      v244 = v40;
                      v245 = v164;
                      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v244, 2);
                      v170 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v217, "setObject:forKeyedSubscript:", v170, v165);

                      v171 = v40;
                      v172 = v171;
                      v25 = v229;
                      v173 = v172;
                    }
                    else
                    {
                      v172 = v169;
                      v173 = v230;
                    }
                    v230 = v172;
                  }
                  else
                  {
                    v244 = v40;
                    v245 = v164;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v244, 2);
                    v173 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v167, "setObject:forKeyedSubscript:", v173, v165);
                  }

                  v8 = v217;
                  v41 = v221;
                  v40 = v231;
                }
                else
                {
                  v25 = v229;
                }

              }
            }

          }
          if (v230)
          {
            objc_msgSend(v40, "inlineCard");
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            if (v176)
              objc_msgSend(v230, "setInlineCard:", v176);
            objc_msgSend(v40, "compactCard");
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            if (v85)
              objc_msgSend(v230, "setCompactCard:", v85);
            objc_msgSend(v231, "punchout");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            if (v86)
            {
              objc_msgSend(v230, "punchout");
              v177 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v177)
                objc_msgSend(v230, "setPunchout:", v86);
            }
            objc_msgSend(v231, "completedQuery");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v231, "completedQuery");
            v178 = (void *)objc_claimAutoreleasedReturnValue();

            if (v178)
              objc_msgSend(v230, "setCompletedQuery:", v88);
            objc_msgSend(v231, "completion");
            v179 = (void *)objc_claimAutoreleasedReturnValue();

            if (v179)
            {
              objc_msgSend(v231, "completion");
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v230, "setCompletion:", v180);

            }
            handleHiddenResult();
            v92 = objc_msgSend(v41, "unsignedIntValue");
LABEL_197:
            objc_msgSend(v225, "addIndex:", v92);

            goto LABEL_198;
          }
          v230 = 0;
LABEL_200:

          v35 = (v218 + 1);
          objc_msgSend(v25, "resultSet");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          v182 = objc_msgSend(v181, "count");

          v36 = v35;
          v37 = v41;
        }
        while (v182 > v35);
LABEL_204:
        objc_msgSend(v25, "resultSet");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v225;
        objc_msgSend(v183, "removeObjectsAtIndexes:", v225);

        v7 = v185;
LABEL_205:

        v6 = v213;
LABEL_206:
        v16 = v200 + 1;
      }
      while (v200 + 1 != v195);
      v195 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v240, v259, 16);
    }
    while (v195);
  }

}

- (void)addDictionarySections:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  char v21;
  void *v22;
  int v23;
  int v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSArray *actualSentSections;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  id v46;
  NSArray *v47;
  SPFederatedQueryTask *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
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
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v48 = self;
  v5 = self->_actualSentSections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v66;
    v9 = *MEMORY[0x24BEB06F0];
    v10 = *MEMORY[0x24BEB0428];
    v46 = v4;
    v47 = v5;
    v45 = *MEMORY[0x24BEB06F0];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v66 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        if (objc_msgSend(v12, "resultsCount"))
        {
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v9);

          if (v14)
          {
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            objc_msgSend(v12, "resultSet");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v62;
              while (2)
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v62 != v18)
                    objc_enumerationMutation(v15);
                  objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * j), "sectionBundleIdentifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "isEqualToString:", v10);

                  if ((v21 & 1) != 0)
                  {
                    v24 = 1;
                    v4 = v46;
                    v5 = v47;
                    goto LABEL_22;
                  }
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
                if (v17)
                  continue;
                break;
              }
            }

            v5 = v47;
            v9 = v45;
          }
          else
          {
            objc_msgSend(v12, "bundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqualToString:", v10);

            if (v23)
            {
              v59 = 0u;
              v60 = 0u;
              v57 = 0u;
              v58 = 0u;
              objc_msgSend(v12, "resultSet");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
              if (v41)
              {
                v42 = v41;
                v43 = *(_QWORD *)v58;
                v4 = v46;
                while (2)
                {
                  for (k = 0; k != v42; ++k)
                  {
                    if (*(_QWORD *)v58 != v43)
                      objc_enumerationMutation(v15);
                    if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * k), "topHit") > 0)
                    {
                      v24 = 1;
                      goto LABEL_22;
                    }
                  }
                  v42 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v57, v71, 16);
                  if (v42)
                    continue;
                  break;
                }
                v24 = 0;
              }
              else
              {
                v24 = 0;
                v4 = v46;
              }
LABEL_22:

              goto LABEL_24;
            }
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      v24 = 0;
      v4 = v46;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v24 = 0;
  }
LABEL_24:

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v25 = (NSArray *)v4;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v54;
    v29 = *MEMORY[0x24BEB0388];
LABEL_26:
    v30 = 0;
    while (1)
    {
      if (*(_QWORD *)v54 != v28)
        objc_enumerationMutation(v25);
      v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v30);
      objc_msgSend(v31, "bundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", v29);

      if (v33)
        break;
      if (v27 == ++v30)
      {
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
        if (v27)
          goto LABEL_26;
        goto LABEL_44;
      }
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v31, "resultSet");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    if (!v35)
    {
LABEL_41:

      goto LABEL_44;
    }
    v36 = v35;
    v37 = *(_QWORD *)v50;
LABEL_35:
    v38 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v37)
        objc_enumerationMutation(v34);
      if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v38), "topHit") > 0)
        break;
      if (v36 == ++v38)
      {
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
        if (v36)
          goto LABEL_35;
        goto LABEL_41;
      }
    }

    if (!v24)
      goto LABEL_44;
    objc_msgSend(v31, "clearResults");
    actualSentSections = v25;
  }
  else
  {
LABEL_44:

    -[NSArray arrayByAddingObjectsFromArray:](v48->_actualSentSections, "arrayByAddingObjectsFromArray:", v25);
    v40 = objc_claimAutoreleasedReturnValue();
    actualSentSections = v48->_actualSentSections;
    v48->_actualSentSections = (NSArray *)v40;
  }

}

- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 unchanged:(BOOL)a8 delayedTopHit:(BOOL)a9 reason:(int)a10
{
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  char v16;
  int v17;
  id v18;
  _BOOL4 v19;
  id *p_sentSections;
  _BOOL4 v21;
  uint64_t v22;
  NSArray *actualSentSections;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  SPFederatedQueryTask *v31;
  void *v32;
  uint64_t v33;
  NSArray *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  int v42;
  char v43;
  double v44;
  id v45;
  id v46;
  void *v47;
  uint64_t i;
  void *v49;
  void *v50;
  int v51;
  id v52;
  void *v53;
  int v54;
  id v55;
  void *v56;
  int v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  int v69;
  int v70;
  void *v71;
  void *v72;
  float v73;
  double v74;
  int v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  int v88;
  BOOL v89;
  void *v90;
  int v91;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  char IsSyndicatedPhotos;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t k;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  NSObject *v122;
  os_log_type_t v123;
  void *v124;
  unsigned int v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  id v130;
  int v131;
  char v132;
  char v133;
  NSObject *v134;
  os_log_type_t v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  double v140;
  unint64_t v141;
  void *v142;
  unint64_t v143;
  id v144;
  void *v145;
  uint64_t v146;
  NSMutableDictionary *categoryToResultMapping;
  SFMutableResultSection *topHitSection;
  uint64_t v149;
  void *v150;
  void *v151;
  SFMutableResultSection *v152;
  uint64_t v153;
  SSBullseyeTopHitsManager *topHitsManager;
  id v155;
  SPFederatedQueryTask *v156;
  void *v157;
  id v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  int v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  void *v168;
  NSObject *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  int v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  char v184;
  SPFederatedQueryTask *v185;
  SSBullseyeTopHitsManager *v186;
  uint64_t v187;
  id v188;
  int v189;
  id v190;
  void *v191;
  void *v192;
  id v193;
  id v194;
  NSObject *v195;
  id v196;
  void *v197;
  uint64_t v198;
  NSString *v199;
  char v200;
  _BOOL4 v201;
  int v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  void *v215;
  int v216;
  id v217;
  void *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t m;
  void *v223;
  void *v224;
  int v225;
  id v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  int v231;
  void *v232;
  uint64_t v233;
  id v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t n;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  char v247;
  id v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  id v258;
  id v259;
  void *v260;
  NSObject *v261;
  id v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  char v269;
  void *v270;
  unint64_t v271;
  uint64_t v272;
  void *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t ii;
  void *v279;
  void *v280;
  int v281;
  void *v282;
  int v283;
  uint64_t v284;
  BOOL v285;
  NSArray *v286;
  void *v287;
  void *v288;
  void *v289;
  id v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  void *v297;
  int v298;
  void *v299;
  void *v300;
  uint64_t v301;
  id v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  uint64_t v307;
  NSString *v308;
  int v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  uint64_t v315;
  NSString *v316;
  char v317;
  id *p_isa;
  void *v319;
  void *v320;
  uint64_t v321;
  id v322;
  char v323;
  _BOOL4 v324;
  char v325;
  void *v326;
  char v327;
  void *v328;
  void *v329;
  BOOL v330;
  SPFederatedQueryTask *v331;
  void *v332;
  char v333;
  _BOOL8 v334;
  void *v335;
  void *v336;
  double blendingTime;
  uint64_t v338;
  void *v339;
  const __CFString *v340;
  NSArray *bundlesSupportingAppScoping;
  NSArray *v342;
  NSArray *stableSections;
  void *v344;
  void *v345;
  uint64_t v346;
  NSString *v347;
  char v348;
  void *v349;
  char v350;
  id v351;
  NSArray *v352;
  uint64_t v353;
  const __CFString *v354;
  NSArray *v355;
  NSArray *v356;
  BOOL v357;
  id v358;
  void *v359;
  uint64_t v360;
  void *v361;
  _BOOL4 v362;
  NSMutableDictionary *v363;
  NSObject *v364;
  _BOOL4 v365;
  uint64_t v366;
  const __CFString *v367;
  NSArray *v368;
  NSArray *v369;
  unint64_t v371;
  _BOOL4 v372;
  int v373;
  void *v374;
  _BOOL4 v375;
  _BOOL4 v376;
  _BOOL4 v377;
  uint64_t v378;
  void *v379;
  void *v380;
  uint64_t v381;
  void *v382;
  PRSRankingItemRanker *itemRanker;
  void *v384;
  uint64_t v385;
  uint64_t v386;
  _BOOL4 allowAnonymousDataCollection;
  uint64_t v388;
  id v389;
  char v390;
  id v391;
  id v392;
  id v393;
  NSArray *v394;
  void *obj;
  id obja;
  uint64_t objb;
  uint64_t objc;
  id v399;
  SPFederatedQueryTask *v400;
  id v401;
  id v402;
  id v403;
  id v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  id v408;
  uint64_t v409;
  NSArray *v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  uint64_t v414;
  void *v415;
  void *v416;
  uint64_t v417;
  uint64_t v418;
  unint64_t v419;
  unint64_t v420;
  uint64_t v421;
  char v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  id v426;
  id v427;
  void *v428;
  uint64_t v429;
  unint64_t v430;
  uint64_t v431;
  void *v432;
  uint64_t v433;
  void *v434;
  void *v435;
  void *v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  id v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  id v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  _BYTE v483[128];
  _BYTE v484[128];
  _BYTE v485[128];
  _BYTE v486[128];
  _BYTE v487[128];
  _BYTE v488[128];
  _BYTE buf[12];
  __int16 v490;
  _BYTE v491[10];
  unint64_t v492;
  _DWORD v493[6];
  _BYTE v494[128];
  _BYTE v495[128];
  _BYTE v496[128];
  _BYTE v497[128];
  _BYTE v498[128];
  uint64_t v499;

  v376 = a4;
  v377 = a7;
  v375 = a6;
  v372 = a5;
  v499 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  -[SPQueryTask query](self, "query");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "queryKind");
  v400 = self;
  -[SPFederatedQueryTask clientBundleID](self, "clientBundleID");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v16 = 1;
  }
  else if ((objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
         || (objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
         || (v17 = objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v14 == 12)
         || v17)
  {
    v16 = _os_feature_enabled_impl();
  }
  else
  {
    v16 = 0;
  }

  v18 = v11;
  v390 = v16;
  if ((v16 & 1) == 0)
    -[SPFederatedQueryTask serverSideDedupe:](v400, "serverSideDedupe:", v11);
  v19 = a9;
  v371 = objc_msgSend(v11, "count");
  if (v371)
  {
    p_sentSections = (id *)&v400->_sentSections;
    if (-[NSArray count](v400->_sentSections, "count"))
    {
      v21 = -[SPFederatedQueryTask didReceiveCoreSpotlightProgress](v400, "didReceiveCoreSpotlightProgress");
      if (a10 <= 1 && v21)
      {
        -[SSBullseyeTopHitsManager resetVisibilityCounts](v400->_topHitsManager, "resetVisibilityCounts");
        copyForResending(v400->_actualSentSections);
        v22 = objc_claimAutoreleasedReturnValue();
        actualSentSections = v400->_actualSentSections;
        v400->_actualSentSections = (NSArray *)v22;
        v18 = v11;

      }
      else if (a10 == 3)
      {
        objc_msgSend(v11, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bundleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*p_sentSections, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "bundleIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v27, "isEqual:", v29);

        if (v30)
        {
          v31 = v400;
          -[SSBullseyeTopHitsManager resetVisibilityCounts](v400->_topHitsManager, "resetVisibilityCounts");
          v32 = (void *)objc_msgSend(v11, "copy");
        }
        else
        {
          v32 = 0;
          v31 = v400;
        }
        copyForResending(v31->_actualSentSections);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v31->_actualSentSections;
        v31->_actualSentSections = (NSArray *)v33;

        v18 = v11;
        v19 = a9;
        if (v32)
          goto LABEL_31;
      }
      if ((v390 & 1) != 0 || -[SPFederatedQueryTask isBullseyeCommittedSearch](v400, "isBullseyeCommittedSearch"))
      {
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", objc_msgSend(*p_sentSections, "count"));
        v36 = v35;
        if (v19)
        {
          objc_msgSend(v35, "addObjectsFromArray:", v11);
          v37 = *p_sentSections;
        }
        else
        {
          objc_msgSend(v35, "addObjectsFromArray:", *p_sentSections);
          v37 = v11;
        }
        objc_msgSend(v36, "addObjectsFromArray:", v37);
        objc_msgSend(v36, "array");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_31;
      }
      objc_msgSend(*p_sentSections, "arrayByAddingObjectsFromArray:", v18);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = objc_msgSend(v11, "copy");
    }
    v32 = (void *)v25;
LABEL_31:
    objc_storeStrong(p_sentSections, v32);

    v24 = 1;
    goto LABEL_32;
  }
  v24 = v375 || v377 || v376 || v372;
LABEL_32:
  v373 = v24;
  -[SPQueryTask query](v400, "query");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "queryContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "queryKind");
  -[SPFederatedQueryTask clientBundleID](v400, "clientBundleID");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0)
  {

LABEL_40:
    v434 = 0;
    v435 = 0;
    v428 = 0;
    v399 = 0;
    v394 = 0;
    v44 = -1.79769313e308;
    v45 = v11;
    goto LABEL_157;
  }
  if ((objc_msgSend(v41, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
    || (objc_msgSend(v41, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
    || (v42 = objc_msgSend(v41, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v40 == 12)
    || v42)
  {
    v43 = _os_feature_enabled_impl();

    if ((v43 & 1) != 0)
      goto LABEL_40;
  }
  else
  {

  }
  v381 = SSMaxSectionsBelowSuggestions();
  v479 = 0u;
  v480 = 0u;
  v481 = 0u;
  v482 = 0u;
  v46 = v11;
  v429 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v479, v498, 16);
  v47 = 0;
  if (!v429)
  {
    v428 = 0;
    v399 = 0;
    v434 = 0;
    v44 = -1.79769313e308;
    goto LABEL_78;
  }
  v399 = 0;
  v434 = 0;
  v425 = *(_QWORD *)v480;
  v428 = 0;
  v411 = *MEMORY[0x24BEB0548];
  v417 = *MEMORY[0x24BEB05E8];
  v405 = *MEMORY[0x24BEB06B8];
  v401 = (id)*MEMORY[0x24BEB06F0];
  v44 = -1.79769313e308;
  obj = v46;
  do
  {
    for (i = 0; i != v429; ++i)
    {
      if (*(_QWORD *)v480 != v425)
        objc_enumerationMutation(obj);
      v49 = *(void **)(*((_QWORD *)&v479 + 1) + 8 * i);
      objc_msgSend(v49, "bundleIdentifier");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isEqual:", v417);

      if (v51)
      {
        v52 = v49;

        v47 = v52;
      }
      objc_msgSend(v49, "bundleIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "isEqual:", v411);

      if (v54)
      {
        v55 = v49;

        v434 = v55;
      }
      objc_msgSend(v49, "bundleIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "isEqual:", v405);

      if (v57)
      {
        v58 = v49;

        v428 = v58;
      }
      objc_msgSend(v49, "bundleIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v436 = v47;
      if (objc_msgSend(v59, "isEqualToString:", v401))
      {
        objc_msgSend(v49, "results");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "count");

        if (v61 != 1)
          goto LABEL_56;
        v59 = v399;
        v399 = v49;
      }

LABEL_56:
      v477 = 0u;
      v478 = 0u;
      v475 = 0u;
      v476 = 0u;
      objc_msgSend(v49, "results");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v475, v497, 16);
      if (v63)
      {
        v64 = v63;
        v65 = 0;
        v66 = *(_QWORD *)v476;
        do
        {
          for (j = 0; j != v64; ++j)
          {
            if (*(_QWORD *)v476 != v66)
              objc_enumerationMutation(v62);
            v68 = *(void **)(*((_QWORD *)&v475 + 1) + 8 * j);
            v69 = objc_msgSend(v68, "type");
            v70 = objc_msgSend(v68, "type");
            if (v69 != 36)
            {
              v75 = v70;
              if (objc_msgSend(v68, "type") != 2 && v75 != 37)
                continue;
            }
            objc_msgSend(v68, "rankingItem");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "L2FeatureVector");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "originalL2Score");
            v74 = v73;

            if (v44 < v74)
              v44 = v74;
            v65 = 1;
          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v475, v497, 16);
        }
        while (v64);

        if ((v65 & 1) != 0
          && (-[SPFederatedQueryTask isNLPSearch](v400, "isNLPSearch")
           || -[SPFederatedQueryTask isPeopleSearch](v400, "isPeopleSearch")))
        {
          objc_msgSend(v49, "setMaxInitiallyVisibleResults:", objc_msgSend(v49, "resultsCount"));
        }
      }
      else
      {

      }
      v47 = v436;
    }
    v46 = obj;
    v429 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v479, v498, 16);
  }
  while (v429);
LABEL_78:

  if (a10 != 4)
  {
    v76 = (void *)MEMORY[0x24BEB0310];
    -[SPQueryTask query](v400, "query");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "queryContext");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "moveShortcutsToRelatedAppSectionsForAllSections:isAsYouTypeTopHitSearch:sectionBuilderBlock:", v46, objc_msgSend(v78, "queryKind") == 2, &__block_literal_global_213);
    v79 = objc_claimAutoreleasedReturnValue();

    v46 = (id)v79;
  }
  v473 = 0u;
  v474 = 0u;
  v471 = 0u;
  v472 = 0u;
  v45 = v46;
  v80 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v471, v496, 16);
  v435 = v47;
  if (!v80)
  {
    v394 = 0;
    goto LABEL_156;
  }
  v81 = v80;
  v394 = 0;
  v82 = *(_QWORD *)v472;
  v83 = *MEMORY[0x24BEB0548];
  v84 = *MEMORY[0x24BEB05E8];
  v402 = (id)*MEMORY[0x24BDC19C0];
  v378 = *MEMORY[0x24BDC1998];
  v418 = *MEMORY[0x24BEB05E8];
  v426 = v45;
  v406 = *(_QWORD *)v472;
  v412 = *MEMORY[0x24BEB0548];
  while (2)
  {
    v85 = 0;
    while (2)
    {
      if (*(_QWORD *)v472 != v82)
        objc_enumerationMutation(v45);
      v86 = *(void **)(*((_QWORD *)&v471 + 1) + 8 * v85);
      objc_msgSend(v86, "bundleIdentifier");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "isEqual:", v83);

      if (v88)
        v89 = v47 == 0;
      else
        v89 = 1;
      if (!v89)
        goto LABEL_152;
      objc_msgSend(v86, "bundleIdentifier");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend(v90, "isEqual:", v84);

      if (v91 && v434 != 0)
        goto LABEL_152;
      v93 = objc_msgSend(v86, "resultsCount");
      if (!v93)
        goto LABEL_152;
      v94 = v93;
      if (-[SPFederatedQueryTask isScopedAppSearch](v400, "isScopedAppSearch"))
      {
        objc_msgSend(v86, "setMaxInitiallyVisibleResults:", 50);
        v430 = 50;
        goto LABEL_136;
      }
      if (!+[SPFederatedQueryTask sectionSupportsShowMoreInApp:](SPFederatedQueryTask, "sectionSupportsShowMoreInApp:", v86))
      {
        objc_msgSend(v86, "bundleIdentifier");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

        if ((IsSyndicatedPhotos & 1) != 0)
        {
          v430 = 14;
        }
        else
        {
          -[SPQueryTask query](v400, "query");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v430 = objc_msgSend(v105, "maxCount");

        }
        v47 = v435;
        goto LABEL_136;
      }
      v430 = objc_msgSend(v86, "maxInitiallyVisibleResults");
      if ((v390 & 1) != 0 || (SPHideSearchThroughSuggestions() & 1) != 0)
        goto LABEL_124;
      v469 = 0u;
      v470 = 0u;
      v467 = 0u;
      v468 = 0u;
      objc_msgSend(v86, "resultSet");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v467, v495, 16);
      if (!v96)
      {
LABEL_113:
        v83 = v412;
LABEL_123:

        goto LABEL_124;
      }
      v97 = v96;
      v98 = *(_QWORD *)v468;
      while (2)
      {
        v99 = 0;
LABEL_104:
        if (*(_QWORD *)v468 != v98)
          objc_enumerationMutation(v95);
        v100 = *(void **)(*((_QWORD *)&v467 + 1) + 8 * v99);
        if ((objc_msgSend(v100, "isFuzzyMatch") & 1) != 0)
        {
LABEL_110:
          if (v97 == ++v99)
          {
            v97 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v467, v495, 16);
            if (v97)
              continue;
            v45 = v426;
            v47 = v435;
            goto LABEL_113;
          }
          goto LABEL_104;
        }
        break;
      }
      objc_msgSend(v100, "userActivityType");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v101;
      if (v101 && !objc_msgSend(v101, "isEqualToString:", v402))
      {

        goto LABEL_110;
      }

      v106 = (uint64_t)v394;
      if (!v394)
        v106 = objc_opt_new();
      v394 = (NSArray *)v106;
      objc_msgSend(v86, "title");
      v107 = objc_claimAutoreleasedReturnValue();
      v45 = v426;
      v47 = v435;
      v83 = v412;
      if (v107)
      {
        v108 = (void *)v107;
        objc_msgSend(v86, "bundleIdentifier");
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        if (v109)
        {
          objc_msgSend(v86, "bundleIdentifier");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v394, "addObject:", v110);

          objc_msgSend(v86, "title");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v394, "addObject:", v95);
          goto LABEL_123;
        }
      }
LABEL_124:
      if (v381)
      {
        v388 = v94;
        v111 = (void *)objc_opt_new();
        v112 = (void *)objc_opt_new();
        objc_msgSend(v112, "setActivityType:", v378);
        v384 = v112;
        objc_msgSend(v111, "setUserActivityData:", v112);
        v465 = 0u;
        v466 = 0u;
        v463 = 0u;
        v464 = 0u;
        objc_msgSend(v86, "results");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v463, v494, 16);
        if (v114)
        {
          v115 = v114;
          v116 = *(_QWORD *)v464;
          do
          {
            for (k = 0; k != v115; ++k)
            {
              if (*(_QWORD *)v464 != v116)
                objc_enumerationMutation(v113);
              v118 = *(void **)(*((_QWORD *)&v463 + 1) + 8 * k);
              objc_msgSend(v118, "moreResultsPunchout");
              v119 = objc_claimAutoreleasedReturnValue();
              v120 = (void *)v119;
              if (v119)
                v121 = (void *)v119;
              else
                v121 = v111;
              objc_msgSend(v118, "setMoreResultsPunchout:", v121);

            }
            v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v463, v494, 16);
          }
          while (v115);
        }

        v45 = v426;
        v47 = v435;
        v82 = v406;
        v83 = v412;
        v94 = v388;
      }
LABEL_136:
      SPLogForSPLogCategoryQuery();
      v122 = objc_claimAutoreleasedReturnValue();
      v123 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v122, v123))
      {
        objc_msgSend(v86, "title");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend(v86, "domain");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v124;
        v490 = 2048;
        *(_QWORD *)v491 = v125;
        *(_WORD *)&v491[8] = 2048;
        v492 = v430;
        LOWORD(v493[0]) = 2048;
        *(_QWORD *)((char *)v493 + 2) = v94;
        _os_log_impl(&dword_2279CC000, v122, v123, "Sending section title:%@, domain:%ld, maxCount:%ld, resultCount:%ld", buf, 0x2Au);

        v45 = v426;
      }

      objc_msgSend(v86, "resultSet");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v126, "count") <= v430)
      {
        v84 = v418;
        goto LABEL_151;
      }
      -[SPQueryTask query](v400, "query");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "queryContext");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v128, "queryKind");
      -[SPFederatedQueryTask clientBundleID](v400, "clientBundleID");
      v130 = (id)objc_claimAutoreleasedReturnValue();
      if ((_os_feature_enabled_impl() & 1) != 0)
      {

        goto LABEL_150;
      }
      if ((objc_msgSend(v130, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
        || (objc_msgSend(v130, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
        || (v131 = objc_msgSend(v130, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v129 == 12)
        || v131)
      {
        v132 = _os_feature_enabled_impl();

        if ((v132 & 1) == 0)
          goto LABEL_149;
        v84 = v418;
        v45 = v426;
        v82 = v406;
        v83 = v412;
      }
      else
      {

LABEL_149:
        objc_msgSend(v86, "resultSet");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithOrderedSet:range:copyItems:", v126, 0, v430, 1);
        objc_msgSend(v86, "setResultSet:", v127);
LABEL_150:
        v84 = v418;
        v45 = v426;
        v82 = v406;
        v83 = v412;

LABEL_151:
      }
LABEL_152:
      if (++v85 != v81)
        continue;
      break;
    }
    v81 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v471, v496, 16);
    if (v81)
      continue;
    break;
  }
LABEL_156:

LABEL_157:
  v133 = v390;
  if (!v373)
  {
    v142 = 0;
    v136 = v435;
    goto LABEL_434;
  }
  SPLogForSPLogCategoryQuery();
  v134 = objc_claimAutoreleasedReturnValue();
  v135 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  v136 = v435;
  if (os_log_type_enabled(v134, v135))
  {
    v137 = objc_msgSend(v45, "count");
    *(_DWORD *)buf = 134219008;
    *(_QWORD *)&buf[4] = v137;
    v490 = 1024;
    *(_DWORD *)v491 = v377;
    *(_WORD *)&v491[4] = 1024;
    *(_DWORD *)&v491[6] = v376;
    LOWORD(v492) = 1024;
    *(_DWORD *)((char *)&v492 + 2) = v372;
    HIWORD(v492) = 1024;
    v493[0] = v375;
    _os_log_impl(&dword_2279CC000, v134, v135, "Sending results, sectionCount:%ld, complete:%d, reset:%d, partiallyComplete:%d, update:%d", buf, 0x24u);
  }

  if (sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__onceToken[0] != -1)
    dispatch_once(sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__onceToken, &__block_literal_global_219);
  v138 = SPMaxCountTopHits();
  SPMinTopHitThresholdForBigResult();
  v140 = v139;
  if (-[SPFederatedQueryTask isBullseyeCommittedSearch](v400, "isBullseyeCommittedSearch"))
  {
    if (v400->_isPeopleSearch)
      v141 = SPMaxSectionsBeforeShowMoreWithScopedSearch();
    else
      v141 = SPMaxSectionsBeforeShowMore();
  }
  else
  {
    v141 = SSMaxSectionsBelowSuggestions();
  }
  if (v371 >= v141)
    v143 = v141;
  else
    v143 = v371;
  if (!v400->_topHitsManager)
  {
    v144 = objc_alloc(MEMORY[0x24BEB02A0]);
    -[SPQueryTask query](v400, "query");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v145, "queryID");
    categoryToResultMapping = v400->_categoryToResultMapping;
    topHitSection = v400->_topHitSection;
    -[SPQueryTask query](v400, "query");
    v419 = v143;
    v149 = v138;
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "queryContext");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = topHitSection;
    v136 = v435;
    v153 = objc_msgSend(v144, "initWithQueryId:categoryToResultMapping:currentTopHitSection:queryContext:ranker:", v146, categoryToResultMapping, v152, v151, v400->_itemRanker);
    topHitsManager = v400->_topHitsManager;
    v400->_topHitsManager = (SSBullseyeTopHitsManager *)v153;

    v138 = v149;
    v143 = v419;

    v133 = v390;
  }
  v427 = v45;
  if ((v133 & 1) != 0)
  {
LABEL_174:
    v155 = v45;
    goto LABEL_175;
  }
  v156 = v400;
  if (v371)
  {
    -[SPQueryTask query](v400, "query");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v170, "queryContext");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "searchEntities");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    if (v172)
    {
      -[SPQueryTask query](v400, "query");
      v413 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v413, "queryContext");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "searchEntities");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v174, "count"))
      {
        -[SPQueryTask query](v400, "query");
        v407 = v138;
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "queryContext");
        v420 = v143;
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "searchEntities");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "lastObject");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v179 = objc_msgSend(v178, "isScopedSearch") ^ 1;

        v45 = v427;
        v143 = v420;

        v138 = v407;
      }
      else
      {
        v179 = 1;
      }

      v136 = v435;
    }
    else
    {
      v179 = 1;
    }

    if (v375 || !v179)
      goto LABEL_174;
    -[NSArray firstObject](v400->_actualSentSections, "firstObject");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = v181;
    if (v181)
    {
      objc_msgSend(v181, "bundleIdentifier");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = objc_msgSend(v183, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

      if ((v184 & 1) == 0)
      {

        v182 = 0;
      }
      v185 = v400;
      v45 = v427;
    }
    else
    {
      v185 = v400;
    }
    v186 = v185->_topHitsManager;
    v187 = -[SPFederatedQueryTask isBullseyeCommittedSearch](v185, "isBullseyeCommittedSearch")
        || -[SPFederatedQueryTask isEntitySearch](v185, "isEntitySearch");
    v462 = v182;
    -[SSBullseyeTopHitsManager tagOrFilterHiddenSectionsForClient:isCommittedSearch:maxVisibleSections:maxTopHitsCount:minThresholdForBigResult:topHitSection:](v186, "tagOrFilterHiddenSectionsForClient:isCommittedSearch:maxVisibleSections:maxTopHitsCount:minThresholdForBigResult:topHitSection:", v45, v187, v143, v138, &v462, v140);
    v155 = (id)objc_claimAutoreleasedReturnValue();
    v188 = v462;

    if (v188 && objc_msgSend(v188, "resultsCount"))
      v400->_sentTaggedTopHits = 1;

LABEL_175:
    v156 = v400;
  }
  else
  {
    v155 = 0;
  }
  -[SPQueryTask query](v156, "query");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "queryIdent");
  v158 = v155;
  v159 = v158;
  if (v158)
    v160 = v158;
  else
    v160 = (void *)MEMORY[0x24BDBD1A8];
  if (a10 != 4)
  {
    v180 = v160;
    goto LABEL_221;
  }
  if (!objc_msgSend(v160, "count"))
  {
    v180 = 0;
    goto LABEL_221;
  }
  objc_msgSend(v160, "objectAtIndex:", 0);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "bundleIdentifier");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = objc_msgSend(v162, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

  if (!v163)
  {
LABEL_220:

    v180 = 0;
    v136 = v435;
    goto LABEL_221;
  }
  objc_msgSend(v161, "resultSet");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "objectAtIndexedSubscript:", 0);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v165, "sectionBundleIdentifier");
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v166 || !priorityIndexEligibleBundleIdentifer(v166))
  {
LABEL_219:

    goto LABEL_220;
  }
  if (!SSIsCounterFactual())
  {
    v189 = SSPriorityIndexFastPathEnabled();
    v190 = objc_alloc(MEMORY[0x24BDD1880]);
    if (v189)
    {
      v191 = (void *)objc_msgSend(v190, "initWithUUIDString:", *MEMORY[0x24BEB07E8]);
      SSDefaultsLogForTrigger();

      goto LABEL_214;
    }
    v192 = (void *)objc_msgSend(v190, "initWithUUIDString:", *MEMORY[0x24BEB07E0]);
    SSDefaultsLogForTrigger();

    SPLogForSPLogCategoryDefault();
    v169 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
LABEL_217:
      _os_log_impl(&dword_2279CC000, v169, OS_LOG_TYPE_DEFAULT, "Withholding priority index fast path because it's disabled", buf, 2u);
    }
LABEL_218:

    goto LABEL_219;
  }
  v167 = objc_alloc(MEMORY[0x24BDD1880]);
  v168 = (void *)objc_msgSend(v167, "initWithUUIDString:", *MEMORY[0x24BEB07E8]);
  SSDefaultsLogForTrigger();

  if (!SSPriorityIndexFastPathEnabled())
  {
    SPLogForSPLogCategoryDefault();
    v169 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      goto LABEL_217;
    }
    goto LABEL_218;
  }
LABEL_214:
  *(_QWORD *)buf = v161;
  v136 = v435;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", buf, 1);
  v180 = (id)objc_claimAutoreleasedReturnValue();

LABEL_221:
  if (!v180)
  {
    SPLogForSPLogCategoryDefault();
    v195 = objc_claimAutoreleasedReturnValue();
    v45 = v427;
    if (os_log_type_enabled(v195, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v195, OS_LOG_TYPE_DEFAULT, "Withholding early priority index results", buf, 2u);
    }

    -[SSBullseyeTopHitsManager resetVisibilityCounts](v400->_topHitsManager, "resetVisibilityCounts");
    v142 = 0;
    goto LABEL_434;
  }
  v403 = v180;
  v193 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a10 == 4)
  {
LABEL_223:
    v389 = 0;
    v194 = 0;
    goto LABEL_355;
  }
  -[SPQueryTask query](v400, "query");
  v196 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v196, "queryContext");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v198 = objc_msgSend(v197, "queryKind");
  v199 = v400->_clientBundleID;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {

    v389 = 0;
    v194 = 0;
    goto LABEL_354;
  }
  if (-[NSString hasPrefix:](v199, "hasPrefix:", CFSTR("com.apple.omniSearch"))
    || -[NSString hasPrefix:](v199, "hasPrefix:", CFSTR("com.apple.intelligenceflow"))
    || (v201 = -[NSString hasPrefix:](v199, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v198 == 12)
    || v201)
  {
    v200 = _os_feature_enabled_impl();

    if ((v200 & 1) != 0)
      goto LABEL_223;
  }
  else
  {

  }
  v202 = objc_msgSend(MEMORY[0x24BEB02D8], "isEnabled");
  if (a10 != 2 && v202 && -[SPFederatedQueryTask isBullseyeNonCommittedSearch](v400, "isBullseyeNonCommittedSearch"))
  {
    v203 = (void *)MEMORY[0x24BEB02D8];
    -[SPQueryTask query](v400, "query");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v204, "queryContext");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRankingManager rankingConfiguration](v400->_rankingManager, "rankingConfiguration");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v203, "setQueryIntentForQueryContext:sections:rankingInfo:", v205, v403, v206);

    v207 = (void *)MEMORY[0x24BEB02D8];
    -[SPQueryTask query](v400, "query");
    v208 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v208, "queryContext");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "applySectionPolicyForQueryContext:sections:", v209, v403);
    v210 = objc_claimAutoreleasedReturnValue();

    v403 = (id)v210;
  }
  v211 = v435;
  if (!v428)
  {
    v389 = 0;
    v194 = 0;
    goto LABEL_277;
  }
  v460 = 0u;
  v461 = 0u;
  v458 = 0u;
  v459 = 0u;
  obja = v403;
  v421 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v458, v488, 16);
  if (!v421)
  {
    v389 = 0;
    v194 = 0;
    goto LABEL_276;
  }
  v389 = 0;
  v194 = 0;
  v212 = *(_QWORD *)v459;
  v414 = *MEMORY[0x24BEB06F0];
  v391 = (id)*MEMORY[0x24BEB0720];
  v385 = *(_QWORD *)v459;
  while (2)
  {
    v213 = 0;
    while (2)
    {
      if (*(_QWORD *)v459 != v212)
        objc_enumerationMutation(obja);
      v214 = *(void **)(*((_QWORD *)&v458 + 1) + 8 * v213);
      objc_msgSend(v214, "bundleIdentifier");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = objc_msgSend(v215, "isEqual:", v414);

      if (v216)
      {
        v431 = v213;
        v217 = v214;

        v456 = 0u;
        v457 = 0u;
        v454 = 0u;
        v455 = 0u;
        objc_msgSend(v217, "results");
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v454, v487, 16);
        if (v219)
        {
          v220 = v219;
          v408 = v217;
          v221 = *(_QWORD *)v455;
          while (1)
          {
            for (m = 0; m != v220; ++m)
            {
              if (*(_QWORD *)v455 != v221)
                objc_enumerationMutation(v218);
              v223 = *(void **)(*((_QWORD *)&v454 + 1) + 8 * m);
              if (!v194)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v454 + 1) + 8 * m), "contactIdentifier");
                v227 = (void *)objc_claimAutoreleasedReturnValue();
                if (v227)
                {

LABEL_259:
                  objc_msgSend(v223, "contactIdentifier");
                  v229 = (void *)objc_claimAutoreleasedReturnValue();
                  v226 = v229;
                  if (v229)
                  {
                    v226 = v229;
                    v194 = v226;
                  }
                  else
                  {
                    objc_msgSend(v223, "personIdentifier");
                    v194 = (id)objc_claimAutoreleasedReturnValue();

                  }
LABEL_262:

                  continue;
                }
                objc_msgSend(v223, "personIdentifier");
                v228 = (void *)objc_claimAutoreleasedReturnValue();

                if (v228)
                  goto LABEL_259;
              }
              objc_msgSend(v223, "sectionBundleIdentifier");
              v224 = (void *)objc_claimAutoreleasedReturnValue();
              v225 = objc_msgSend(v224, "isEqualToString:", CFSTR("com.apple.application"));

              if (v225 && !objc_msgSend(v193, "count"))
              {
                objc_msgSend(v223, "resultBundleId");
                v226 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v193, "addObject:", v226);
                goto LABEL_262;
              }
            }
            v220 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v454, v487, 16);
            if (!v220)
            {
              v399 = v408;
              v212 = v385;
              goto LABEL_270;
            }
          }
        }
        v399 = v217;
LABEL_270:

        v211 = v435;
        v213 = v431;
      }
      else
      {
        objc_msgSend(v214, "bundleIdentifier");
        v230 = (void *)objc_claimAutoreleasedReturnValue();
        v231 = objc_msgSend(v230, "isEqual:", v391);

        if (v231)
        {
          v431 = v213;
          v218 = v389;
          v389 = v214;
          goto LABEL_270;
        }
        v211 = v435;
      }
      if (++v213 != v421)
        continue;
      break;
    }
    v421 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v458, v488, 16);
    if (v421)
      continue;
    break;
  }
LABEL_276:

LABEL_277:
  objc_msgSend(v211, "resultSet");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = objc_msgSend(v232, "count");

  if (!v233)
    goto LABEL_343;
  v234 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v432 = (void *)objc_opt_new();
  v382 = (void *)objc_opt_new();
  objc_msgSend(v211, "results");
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  v236 = (void *)objc_msgSend(v235, "copy");

  objc_msgSend(v434, "results");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = (void *)objc_msgSend(v237, "copy");

  v452 = 0u;
  v453 = 0u;
  v450 = 0u;
  v451 = 0u;
  v392 = v238;
  v239 = objc_msgSend(v392, "countByEnumeratingWithState:objects:count:", &v450, v486, 16);
  if (v239)
  {
    v240 = v239;
    v422 = 0;
    v241 = *(_QWORD *)v451;
    do
    {
      for (n = 0; n != v240; ++n)
      {
        if (*(_QWORD *)v451 != v241)
          objc_enumerationMutation(v392);
        v243 = *(void **)(*((_QWORD *)&v450 + 1) + 8 * n);
        objc_msgSend(v243, "contactIdentifier");
        v244 = (void *)objc_claimAutoreleasedReturnValue();

        if (v244)
        {
          objc_msgSend(v243, "contactIdentifier");
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v432, "setObject:forKey:", v243, v245);

          if ((v422 & 1) != 0
            || (objc_msgSend(v243, "contactIdentifier"),
                v246 = (void *)objc_claimAutoreleasedReturnValue(),
                v247 = objc_msgSend(v246, "isEqualToString:", v194),
                v246,
                (v247 & 1) == 0))
          {
            objc_msgSend(v234, "addObject:", v243);
          }
          else
          {
            v422 = 1;
          }
        }
      }
      v240 = objc_msgSend(v392, "countByEnumeratingWithState:objects:count:", &v450, v486, 16);
    }
    while (v240);
  }
  else
  {
    v422 = 0;
  }

  if (sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__onceTokenContact != -1)
    dispatch_once(&sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__onceTokenContact, &__block_literal_global_222);
  v415 = v234;
  v448 = 0u;
  v449 = 0u;
  v446 = 0u;
  v447 = 0u;
  v248 = v236;
  v249 = objc_msgSend(v248, "countByEnumeratingWithState:objects:count:", &v446, v485, 16);
  if (!v249)
  {
    v251 = 0;
    goto LABEL_317;
  }
  v250 = v249;
  v251 = 0;
  v252 = *(_QWORD *)v447;
  while (2)
  {
    v253 = 0;
    while (2)
    {
      if (*(_QWORD *)v447 != v252)
        objc_enumerationMutation(v248);
      v254 = *(void **)(*((_QWORD *)&v446 + 1) + 8 * v253);
      objc_msgSend(v254, "personIdentifier");
      v255 = (void *)objc_claimAutoreleasedReturnValue();

      if (v255)
      {
        v256 = (void *)sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__store;
        objc_msgSend(v254, "personIdentifier");
        v257 = (void *)objc_claimAutoreleasedReturnValue();
        v445 = v251;
        v258 = (id)objc_msgSend(v256, "unifiedContactWithIdentifier:keysToFetch:error:", v257, sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__contactKeysToFetch, &v445);
        v259 = v445;
        v260 = v251;
        v251 = v259;

        if (v251)
        {
          if (objc_msgSend(v251, "code") != 200)
          {
            SPLogForSPLogCategoryDefault();
            v261 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v251, "localizedDescription");
              v262 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v262;
              _os_log_impl(&dword_2279CC000, v261, OS_LOG_TYPE_DEFAULT, "*warn* CNContactStore fetch error: %@", buf, 0xCu);

            }
            goto LABEL_312;
          }
        }
        else
        {
          objc_msgSend(v254, "personIdentifier");
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v432, "objectForKey:", v263);
          v264 = (void *)objc_claimAutoreleasedReturnValue();

          if (v264)
          {
            v251 = 0;
          }
          else
          {
            objc_msgSend(v254, "personIdentifier");
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v432, "setObject:forKey:", v254, v265);

            objc_msgSend(v254, "title");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v266, "text");
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            SSNormalizedQueryString();
            v261 = objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v382, "containsObject:", v261) & 1) == 0)
            {
              objc_msgSend(v382, "addObject:", v261);
              if ((v422 & 1) == 0)
              {
                objc_msgSend(v254, "personIdentifier");
                v268 = (void *)objc_claimAutoreleasedReturnValue();
                v269 = objc_msgSend(v268, "isEqualToString:", v194);

                if ((v269 & 1) != 0)
                {
                  v251 = 0;
                  v422 = 1;
                  goto LABEL_312;
                }
              }
              objc_msgSend(v415, "addObject:", v254);
            }
            v251 = 0;
LABEL_312:

          }
        }
      }
      if (v250 != ++v253)
        continue;
      break;
    }
    v250 = objc_msgSend(v248, "countByEnumeratingWithState:objects:count:", &v446, v485, 16);
    if (v250)
      continue;
    break;
  }
LABEL_317:
  v374 = v251;
  v379 = v248;

  v270 = v415;
  v271 = objc_msgSend(v415, "count");
  if (v271 >= SPMaxVisibleResultsCountPerSection())
    v272 = SPMaxVisibleResultsCountPerSection();
  else
    v272 = objc_msgSend(v415, "count");
  v409 = v272;
  v273 = v432;
  v443 = 0u;
  v444 = 0u;
  v441 = 0u;
  v442 = 0u;
  v403 = v403;
  v274 = objc_msgSend(v403, "countByEnumeratingWithState:objects:count:", &v441, v484, 16);
  if (v274)
  {
    v275 = v274;
    objb = 0;
    v276 = *(_QWORD *)v442;
    v277 = *MEMORY[0x24BEB0548];
    v386 = *MEMORY[0x24BEB05E8];
    v423 = -1;
    do
    {
      for (ii = 0; ii != v275; ++ii)
      {
        if (*(_QWORD *)v442 != v276)
          objc_enumerationMutation(v403);
        v279 = *(void **)(*((_QWORD *)&v441 + 1) + 8 * ii);
        objc_msgSend(v279, "bundleIdentifier");
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        v281 = objc_msgSend(v280, "isEqual:", v277);

        if (v281)
        {
          objc_msgSend(v279, "setMaxInitiallyVisibleResults:", v409);
          objc_msgSend(v279, "setResults:", v415);
        }
        else
        {
          objc_msgSend(v279, "bundleIdentifier");
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          v283 = objc_msgSend(v282, "isEqual:", v386);

          v284 = v423;
          if (v283)
          {
            v284 = objb + ii;
            v285 = v434 == 0;
          }
          else
          {
            v285 = 0;
          }
          if (v285)
          {
            objc_msgSend(v279, "setBundleIdentifier:", v277);
            objc_msgSend(v279, "setMaxInitiallyVisibleResults:", v409);
            objc_msgSend(v279, "setResults:", v415);
            v286 = v394;
            if (!v394)
              v286 = (NSArray *)objc_opt_new();
            objc_msgSend(v279, "bundleIdentifier");
            v287 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v286, "addObject:", v287);

            objc_msgSend(v279, "title");
            v288 = (void *)objc_claimAutoreleasedReturnValue();
            v394 = v286;
            -[NSArray addObject:](v286, "addObject:", v288);

          }
          else
          {
            v423 = v284;
          }
        }
      }
      objb += v275;
      v275 = objc_msgSend(v403, "countByEnumeratingWithState:objects:count:", &v441, v484, 16);
    }
    while (v275);

    if (v423 < 0)
    {
      v270 = v415;
      v273 = v432;
    }
    else
    {
      v273 = v432;
      v270 = v415;
      if (v434)
      {
        v289 = (void *)objc_msgSend(v403, "mutableCopy");
        objc_msgSend(v289, "removeObjectAtIndex:", v423);
        v290 = v289;

        goto LABEL_341;
      }
    }
  }
  else
  {
    v290 = v403;
LABEL_341:
    v403 = v290;

  }
LABEL_343:
  if (v428)
  {
    v439 = 0u;
    v440 = 0u;
    v437 = 0u;
    v438 = 0u;
    v196 = v403;
    v291 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v437, v483, 16);
    if (v291)
    {
      v292 = v291;
      v293 = *(_QWORD *)v438;
      v294 = *MEMORY[0x24BEB06B8];
      v424 = *MEMORY[0x24BEB06B8];
      do
      {
        v295 = 0;
        v433 = v292;
        do
        {
          if (*(_QWORD *)v438 != v293)
            objc_enumerationMutation(v196);
          v296 = *(void **)(*((_QWORD *)&v437 + 1) + 8 * v295);
          objc_msgSend(v296, "bundleIdentifier");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          v298 = objc_msgSend(v297, "isEqual:", v294);

          if (v298)
          {
            -[SPQueryTask query](v400, "query");
            v299 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v299, "queryContext");
            v300 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v300, "searchString");
            v301 = v293;
            v302 = v196;
            v303 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPFederatedQueryTask suggestionsWithSearchString:sections:topHitSection:highestLocalScore:](v400, "suggestionsWithSearchString:sections:topHitSection:highestLocalScore:", v303, v302, v399, v44);
            v304 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v296, "setResults:", v304);

            v292 = v433;
            v196 = v302;
            v293 = v301;
            v294 = v424;

          }
          ++v295;
        }
        while (v292 != v295);
        v292 = objc_msgSend(v196, "countByEnumeratingWithState:objects:count:", &v437, v483, 16);
      }
      while (v292);
    }
    v403 = v196;
LABEL_354:

  }
LABEL_355:
  -[SPQueryTask query](v400, "query");
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v305, "queryContext");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  v307 = objc_msgSend(v306, "queryKind");
  v308 = v400->_clientBundleID;
  if (_os_feature_enabled_impl())
  {

    goto LABEL_360;
  }
  if (-[NSString hasPrefix:](v308, "hasPrefix:", CFSTR("com.apple.omniSearch"))
    || -[NSString hasPrefix:](v308, "hasPrefix:", CFSTR("com.apple.intelligenceflow"))
    || (v324 = -[NSString hasPrefix:](v308, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v307 == 12)
    || v324)
  {
    v309 = _os_feature_enabled_impl();

    if (v309)
    {
LABEL_360:
      v310 = (void *)MEMORY[0x24BEB02F0];
      -[SPQueryTask query](v400, "query");
      v305 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v305, "queryContext");
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      v311 = v310;
      v308 = (NSString *)v403;
      objc_msgSend(v311, "processSearchToolFinalResults:queryContext:", v403, v306);
      v403 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_361;
    }
  }
  else
  {
LABEL_361:

  }
  objc_msgSend(MEMORY[0x24BEB0320], "postProcessSectionsBasedOnTopHitSection:withTopHitSection:", v403, v399);
  v312 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB0320], "finalizeTopHitsInSections:withTopHitSection:", v312, v399);
  objc_msgSend(MEMORY[0x24BEB02F0], "fillRankingPosition:", v312);
  if (a10 != 2)
  {
LABEL_368:
    p_isa = (id *)&v400->super.super.isa;
    objc_storeStrong((id *)&v400->_actualSentSections, v312);
    goto LABEL_369;
  }
  -[SPQueryTask query](v400, "query");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v313, "queryContext");
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  v315 = objc_msgSend(v314, "queryKind");
  v316 = v400->_clientBundleID;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {

    goto LABEL_368;
  }
  if (-[NSString hasPrefix:](v316, "hasPrefix:", CFSTR("com.apple.omniSearch"))
    || -[NSString hasPrefix:](v316, "hasPrefix:", CFSTR("com.apple.intelligenceflow"))
    || (v365 = -[NSString hasPrefix:](v316, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v315 == 12)
    || v365)
  {
    v317 = _os_feature_enabled_impl();

    if ((v317 & 1) == 0)
      goto LABEL_438;
    goto LABEL_368;
  }

LABEL_438:
  p_isa = (id *)&v400->super.super.isa;
  -[SPFederatedQueryTask addDictionarySections:](v400, "addDictionarySections:", v312);
LABEL_369:
  objc_msgSend(p_isa, "query");
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v319, "queryContext");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v321 = objc_msgSend(v320, "queryKind");
  v322 = p_isa[56];
  if ((_os_feature_enabled_impl() & 1) != 0)
    goto LABEL_381;
  if ((objc_msgSend(v322, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
    || (objc_msgSend(v322, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
    || (v325 = objc_msgSend(v322, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v321 == 12)
    || (v325 & 1) != 0)
  {
    v323 = _os_feature_enabled_impl();

    if ((v323 & 1) == 0)
      goto LABEL_380;
  }
  else
  {

LABEL_380:
    objc_msgSend(MEMORY[0x24BE84930], "sharedInstance");
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    v410 = v400->_actualSentSections;
    -[SPQueryTask query](v400, "query");
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v320, "queryContext");
    v322 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v322, "searchString");
    v404 = (id)objc_claimAutoreleasedReturnValue();
    -[SPQueryTask query](v400, "query");
    v416 = (void *)objc_claimAutoreleasedReturnValue();
    objc = objc_msgSend(v416, "queryIdent");
    allowAnonymousDataCollection = v400->_allowAnonymousDataCollection;
    itemRanker = v400->_itemRanker;
    -[SSRankingManager rankingConfiguration](v400->_rankingManager, "rankingConfiguration");
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPQueryTask query](v400, "query");
    v393 = (id)objc_claimAutoreleasedReturnValue();
    v327 = objc_msgSend(v393, "internalDebug");
    -[SPQueryTask query](v400, "query");
    v380 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v380, "queryContext");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v328, "keyboardPrimaryLanguage");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v366) = v327;
    objc_msgSend(v319, "willSendSections:forQuery:queryIdentifier:allowAnonymousDataCollection:withRankerUsed:withRankingConfiguration:internalDebug:keyboardPrimaryLanguage:clientID:", v410, v404, objc, allowAnonymousDataCollection, itemRanker, v326, v366, v329, v400->_clientBundleID);

LABEL_381:
  }
  if (-[SPFederatedQueryTask isInternalDevice](v400, "isInternalDevice") && v377)
    -[SPFederatedQueryTask sendTTRLogsWithSections:](v400, "sendTTRLogsWithSections:", v400->_actualSentSections);
  if (objc_msgSend(v312, "count"))
  {
    v330 = 0;
    goto LABEL_389;
  }
  v331 = v400;
  if (v400->_sendStableSections)
  {
    v330 = -[NSArray count](v400->_stableSections, "count") != 0;
LABEL_389:
    v331 = v400;
    -[SPQueryTask query](v400, "query");
    v332 = (void *)objc_claimAutoreleasedReturnValue();
    v333 = objc_msgSend(v332, "cancelled");

    if ((v333 & 1) == 0)
    {
      v334 = a10 == 4;
      v335 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84970]), "initWithSections:stableSections:", v312, v400->_stableSections);
      -[SPQueryTask query](v400, "query");
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      blendingTime = v400->_blendingTime;
      -[SPFederatedQueryTask geoUserSessionEntityString](v400, "geoUserSessionEntityString");
      v338 = objc_claimAutoreleasedReturnValue();
      v339 = (void *)v338;
      v340 = &stru_24F01C208;
      if (v338)
        v340 = (const __CFString *)v338;
      bundlesSupportingAppScoping = v400->_bundlesSupportingAppScoping;
      if (!bundlesSupportingAppScoping)
        bundlesSupportingAppScoping = (NSArray *)MEMORY[0x24BDBD1A8];
      v342 = v394;
      if (!v394)
        v342 = (NSArray *)MEMORY[0x24BDBD1A8];
      v368 = bundlesSupportingAppScoping;
      v369 = v342;
      v367 = v340;
      BYTE3(v366) = v330;
      BYTE2(v366) = a8;
      BYTE1(v366) = a9;
      goto LABEL_397;
    }
  }
  else
  {
    -[SPQueryTask query](v400, "query");
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    v350 = objc_msgSend(v349, "cancelled");

    if ((v350 & 1) == 0)
    {
      v334 = a10 == 4;
      v351 = objc_alloc(MEMORY[0x24BE84970]);
      v352 = (NSArray *)MEMORY[0x24BDBD1A8];
      v335 = (void *)objc_msgSend(v351, "initWithSections:", MEMORY[0x24BDBD1A8]);
      -[SPQueryTask query](v400, "query");
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      blendingTime = v400->_blendingTime;
      -[SPFederatedQueryTask geoUserSessionEntityString](v400, "geoUserSessionEntityString");
      v353 = objc_claimAutoreleasedReturnValue();
      v339 = (void *)v353;
      v354 = &stru_24F01C208;
      if (v353)
        v354 = (const __CFString *)v353;
      v355 = v400->_bundlesSupportingAppScoping;
      if (!v355)
        v355 = v352;
      v356 = v394;
      if (!v394)
        v356 = v352;
      v368 = v355;
      v369 = v356;
      v367 = v354;
      BYTE3(v366) = 0;
      BYTE2(v366) = a8;
      BYTE1(v366) = 0;
LABEL_397:
      LOBYTE(v366) = v377;
      -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:](v331, "searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v336, v335, v376, v372, v334, v375, blendingTime, v366, v367, v368, v369);

      v331 = v400;
    }
  }
  stableSections = v331->_stableSections;
  v331->_stableSections = 0;

  -[SPQueryTask query](v331, "query");
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v344, "queryContext");
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  v346 = objc_msgSend(v345, "queryKind");
  v347 = v331->_clientBundleID;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
LABEL_416:

    goto LABEL_417;
  }
  if (-[NSString hasPrefix:](v347, "hasPrefix:", CFSTR("com.apple.omniSearch"))
    || -[NSString hasPrefix:](v347, "hasPrefix:", CFSTR("com.apple.intelligenceflow"))
    || (v357 = -[NSString hasPrefix:](v347, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v346 == 12)
    || v357)
  {
    v348 = _os_feature_enabled_impl();

    v136 = v435;
    if ((v348 & 1) == 0)
      goto LABEL_414;
  }
  else
  {

LABEL_414:
    v358 = objc_alloc(MEMORY[0x24BE84DB8]);
    -[SPQueryTask query](v400, "query");
    v359 = (void *)objc_claimAutoreleasedReturnValue();
    v344 = (void *)objc_msgSend(v358, "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.backend.query.end"), 0, objc_msgSend(v359, "queryIdent"));

    if (!v375)
    {
      objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPQueryTask query](v400, "query");
      v347 = (NSString *)objc_claimAutoreleasedReturnValue();
      v360 = -[NSString queryIdent](v347, "queryIdent");
      -[SPXPCConnection bundleID](v400->_connection, "bundleID");
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v345, "sendFeedbackType:feedback:queryId:clientID:", 21, v344, v360, v361);

      goto LABEL_416;
    }
LABEL_417:
    v136 = v435;

  }
  if (-[NSMutableArray count](v400->_slowTokens, "count"))
  {
    v362 = 0;
    v45 = v427;
  }
  else
  {
    v45 = v427;
    if (-[NSMutableArray count](v400->_tokens, "count") || -[NSMutableArray count](v400->_delayedStartTokens, "count"))
    {
      v362 = 0;
    }
    else if (-[NSMutableArray count](v400->_delayedStartQueries, "count"))
    {
      v362 = 0;
    }
    else
    {
      v362 = v377;
    }
  }
  if (v376)
  {
    -[SPFederatedQueryTask externalID](v400, "externalID");
    kdebug_trace();
  }
  if (v377)
  {
    -[SPFederatedQueryTask externalID](v400, "externalID");
    kdebug_trace();
  }
  if (v362)
  {
    v363 = v400->_categoryToResultMapping;
    v400->_categoryToResultMapping = 0;

    -[SPFederatedQueryTask setServer_features:](v400, "setServer_features:", 0);
    -[SPFederatedQueryTask setTokens:](v400, "setTokens:", 0);
    -[SPFederatedQueryTask setSlowTokens:](v400, "setSlowTokens:", 0);
  }
  if (a10 == 4)
  {
    SPLogForSPLogCategoryDefault();
    v364 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v364, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v364, OS_LOG_TYPE_DEFAULT, "Sending early priority index results", buf, 2u);
    }

    v400->_sentPriority = 1;
  }

  v142 = v389;
LABEL_434:

}

id __107__SPFederatedQueryTask_sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDomain:", 1);
  objc_msgSend(v3, "setBundleIdentifier:", v2);
  objc_msgSend(v3, "setMaxInitiallyVisibleResults:", SPMaxVisibleResultsCountPerSection());
  objc_msgSend(MEMORY[0x24BE84938], "displayNameForBundleIdentifer:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setTitle:", v4);
  return v3;
}

void __107__SPFederatedQueryTask_sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason___block_invoke_2()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  v1 = (void *)sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__store;
  sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__store = (uint64_t)v0;

  v4[0] = *MEMORY[0x24BDBA2E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__contactKeysToFetch;
  sendResults_reset_partiallyComplete_update_complete_unchanged_delayedTopHit_reason__contactKeysToFetch = v2;

}

- (void)sendResults:(id)a3 reset:(BOOL)a4 partiallyComplete:(BOOL)a5 update:(BOOL)a6 complete:(BOOL)a7 delayedTopHit:(BOOL)a8 reason:(int)a9
{
  uint64_t v9;

  HIDWORD(v9) = a9;
  LOBYTE(v9) = a8;
  -[SPFederatedQueryTask sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:](self, "sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:", a3, a4, a5, a6, a7, 0, v9);
}

- (void)sendError:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[SPQueryTask query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cancelled");

  if ((v5 & 1) == 0)
    -[SPFederatedQueryTask searchQueryEncounteredError:](self, "searchQueryEncounteredError:", v6);

}

- (void)sendQueryCompleted
{
  NSObject *v3;
  _BYTE *v4;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  qos_class_t v8;
  NSObject *v9;
  os_log_type_t v10;
  unsigned int externalID;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSMutableDictionary *categoryToResultMapping;
  int v16;
  qos_class_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (_BYTE *)MEMORY[0x24BE84AF8];
  v5 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v3, v5))
  {
    v16 = 67109120;
    v17 = qos_class_self();
    _os_log_impl(&dword_2279CC000, v3, v5, "QOS sendQueryCompleted 1: %d", (uint8_t *)&v16, 8u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  SDTraceAdd();
  SPLogForSPLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = 2 * (*v4 == 0);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = qos_class_self();
    v16 = 67109120;
    v17 = v8;
    _os_log_impl(&dword_2279CC000, v6, v7, "QOS sendQueryCompleted 2: %d", (uint8_t *)&v16, 8u);
  }

  SPLogForSPLogCategoryQuery();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = 2 * (*v4 == 0);
  if (os_log_type_enabled(v9, v10))
  {
    externalID = self->_externalID;
    v16 = 67109120;
    v17 = externalID;
    _os_log_impl(&dword_2279CC000, v9, v10, "Completed query %d", (uint8_t *)&v16, 8u);
  }

  SPLogForSPLogCategoryTelemetry();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = self->_externalID;
  if ((_DWORD)v14 && os_signpost_enabled(v12))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_2279CC000, v13, OS_SIGNPOST_INTERVAL_END, v14, "spotlightLatency", " enableTelemetry=YES ", (uint8_t *)&v16, 2u);
  }

  categoryToResultMapping = self->_categoryToResultMapping;
  self->_categoryToResultMapping = 0;

  -[SPFederatedQueryTask setTokens:](self, "setTokens:", 0);
  -[SPFederatedQueryTask setSlowTokens:](self, "setSlowTokens:", 0);
  -[SPFederatedQueryTask setDelayedStartTokens:](self, "setDelayedStartTokens:", 0);
  -[SPFederatedQueryTask setDelayedStartQueries:](self, "setDelayedStartQueries:", 0);
  self->_parsecCameLaterThanSRT = 0;
  self->_parsecEntityCameEarly = 0;
  self->_receivedLateParsecResults = 0;
  self->_shouldRecomputeSuggestions = 1;
  self->_sentTaggedTopHits = 0;
}

- (void)sendQueryReset
{
  NSObject *v3;
  os_log_type_t v4;
  unsigned int externalID;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[SPFederatedQueryTask externalID](self, "externalID");
  kdebug_trace();
  SPLogForSPLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    externalID = self->_externalID;
    *(_DWORD *)buf = 67109120;
    v9 = externalID;
    _os_log_impl(&dword_2279CC000, v3, v4, "Reset query %d", buf, 8u);
  }

  -[SPQueryTask query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:](self, "searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v6, 0, 1, 0, 0, 0, 0.0, v7, &stru_24F01C208, 0, 0);

}

- (id)orderedCategories:(id)a3
{
  id v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v4;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_categoryToResultMapping, "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v7, "domain"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPQueryTask query](self, "query");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "queryContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "searchDomains");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "indexOfObject:", v8);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v13, v6);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v19);
  }

  objc_msgSend(v18, "keysSortedByValueWithOptions:usingComparator:", 1, &__block_literal_global_233);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __42__SPFederatedQueryTask_orderedCategories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "integerValue");
  if (v6 <= objc_msgSend(v5, "integerValue"))
  {
    v8 = objc_msgSend(v4, "integerValue");
    if (v8 >= objc_msgSend(v5, "integerValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)sendResultsForKeys:(id)a3 toSendSections:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[SPFederatedQueryTask orderedCategories:](self, "orderedCategories:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[NSMutableDictionary objectForKey:](self->_categoryToResultMapping, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)prepareAndSend:(id)a3 force:(BOOL)a4 moreComing:(BOOL)a5 reason:(int)a6
{
  _BOOL4 v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  _BOOL8 v17;
  _BOOL8 didForceSend;
  SPFederatedQueryTask *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _BYTE *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  NSMutableArray *bottomPlacedSections;
  NSMutableArray *v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  NSMutableArray *slowTokens;
  NSMutableArray *tokens;
  os_log_type_t v41;
  NSMutableArray *v42;
  const char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint32_t v46;
  void *v47;
  char v48;
  uint64_t v49;
  int v50;
  uint8_t buf[4];
  NSMutableArray *v52;
  __int16 v53;
  NSMutableArray *v54;
  uint64_t v55;

  v8 = a4;
  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (v8)
    self->_didForceSend = 1;
  if (!a5)
  {
    v50 = a6;
    v22 = -[NSMutableArray count](self->_slowTokens, "count");
    v23 = -[NSMutableArray count](self->_delayedStartTokens, "count");
    v24 = -[NSMutableArray count](self->_delayedStartQueries, "count");
    v25 = -[NSMutableArray count](self->_tokens, "count");
    if (v23 + v24)
      v26 = 0;
    else
      v26 = (v22 | v25) == 0;
    v27 = v26;
    if (v25)
      v28 = 0;
    else
      v28 = v27 ^ 1;
    SPLogForSPLogCategoryQuery();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (_BYTE *)MEMORY[0x24BE84AF8];
    v31 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v29, v31))
    {
      v32 = v27;
      v33 = v28;
      bottomPlacedSections = self->_bottomPlacedSections;
      -[NSMutableDictionary allKeys](self->_categoryToResultMapping, "allKeys");
      v35 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = bottomPlacedSections;
      v28 = v33;
      v27 = v32;
      v30 = (_BYTE *)MEMORY[0x24BE84AF8];
      v53 = 2112;
      v54 = v35;
      _os_log_impl(&dword_2279CC000, v29, v31, "#query send bottomRankedCategories %@ from %@", buf, 0x16u);

    }
    SPLogForSPLogCategoryQuery();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = 2 * (*v30 == 0);
    v38 = os_log_type_enabled(v36, v37);
    if (v22)
    {
      if (v38)
      {
        slowTokens = self->_slowTokens;
        tokens = self->_tokens;
        *(_DWORD *)buf = 138412546;
        v52 = slowTokens;
        v53 = 2112;
        v54 = tokens;
        _os_log_impl(&dword_2279CC000, v36, v37, "#query still waiting for %@ and %@", buf, 0x16u);
      }

      SPLogForSPLogCategoryQuery();
      v36 = objc_claimAutoreleasedReturnValue();
      v41 = 2 * (*v30 == 0);
      if (!os_log_type_enabled(v36, v41))
        goto LABEL_37;
      v42 = self->_bottomPlacedSections;
      *(_DWORD *)buf = 138412290;
      v52 = v42;
      v43 = "#query _bottomRankedCategories %@";
      v44 = v36;
      v45 = v41;
      v46 = 12;
    }
    else
    {
      if (!v38)
      {
LABEL_37:

        didForceSend = self->_didForceSend;
        LODWORD(v49) = v50;
        v19 = self;
        v20 = v10;
        v17 = v28;
        v21 = v27;
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      v43 = "#query No waiting stores";
      v44 = v36;
      v45 = v37;
      v46 = 2;
    }
    _os_log_impl(&dword_2279CC000, v44, v45, v43, buf, v46);
    goto LABEL_37;
  }
  if (a6 == 5)
  {
    v11 = -[NSMutableArray count](self->_slowTokens, "count");
    v12 = -[NSMutableArray count](self->_delayedStartTokens, "count");
    v13 = -[NSMutableArray count](self->_delayedStartQueries, "count");
    v14 = -[NSMutableArray count](self->_tokens, "count");
    if (v12 + v13)
      v15 = 0;
    else
      v15 = (v14 | v11) == 0;
    v17 = !v15 && v14 == 0;
    didForceSend = self->_didForceSend;
    LODWORD(v49) = 5;
    v19 = self;
    v20 = v10;
    v21 = 1;
    goto LABEL_38;
  }
  -[SPQueryTask query](self, "query");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "infinitePatience");

  if ((v48 & 1) == 0 && objc_msgSend(v10, "count"))
  {
    v17 = a6 == 4;
    didForceSend = self->_didForceSend;
    LODWORD(v49) = a6;
    v19 = self;
    v20 = v10;
    v21 = 0;
LABEL_38:
    -[SPFederatedQueryTask sendResults:reset:partiallyComplete:update:complete:delayedTopHit:reason:](v19, "sendResults:reset:partiallyComplete:update:complete:delayedTopHit:reason:", v20, didForceSend, v17, 0, v21, 0, v49);
  }

}

- (void)sendFinishedDomainsZKW:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  NSMutableOrderedSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[NSMutableArray count](self->_tokens, "count");
  v6 = v5 != 0;
  if (!v5 && !v3)
    v6 = -[NSMutableArray count](self->_slowTokens, "count") != 0;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_sectionOrderByInsertion;
  v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "resultsCount", (_QWORD)v14))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[NSMutableOrderedSet removeAllObjects](self->_sectionOrderByInsertion, "removeAllObjects");
  -[SPFederatedQueryTask prepareAndSend:force:moreComing:reason:](self, "prepareAndSend:force:moreComing:reason:", v7, v3, v6, 0);

}

- (BOOL)isPeopleSearch
{
  return self->_isPeopleSearch;
}

- (BOOL)isNLPSearch
{
  return self->_isNLPSearch;
}

- (BOOL)isEntitySearch
{
  return self->_isEntitySearch;
}

- (BOOL)isScopedAppSearch
{
  return self->_isScopedAppSearch;
}

- (BOOL)isPhotosSearch
{
  return self->_isPhotosSearch;
}

- (void)logPerfToAnalytics:(int)a3
{
  const char *v3;

  if (a3 > 4)
    v3 = "unknown";
  else
    v3 = off_24F01B470[a3];
  query_analytics_log_complete(self, v3, self->_startTime);
}

- (void)addMatchInfo:(_MDPlistContainer *)a3
{
  NSMutableArray *matchInfo;
  NSMutableArray *v5;
  NSMutableArray *v6;
  SPFederatedQueryTask *obj;

  obj = self;
  objc_sync_enter(obj);
  matchInfo = obj->_matchInfo;
  if (!matchInfo)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = obj->_matchInfo;
    obj->_matchInfo = v5;

    matchInfo = obj->_matchInfo;
  }
  -[NSMutableArray addObject:](matchInfo, "addObject:", a3);
  objc_sync_exit(obj);

}

- (__CFArray)copyMatchInfo
{
  SPFederatedQueryTask *v2;
  __CFArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (__CFArray *)-[NSMutableArray copy](v2->_matchInfo, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (void)sendFinishedDomains:(BOOL)a3 reason:(int)a4
{
  uint64_t v4;
  unsigned int v5;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  NSMutableDictionary *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  void *v48;
  void *v49;
  NSMutableDictionary *v50;
  os_log_type_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  int v57;
  uint64_t k;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  BOOL v68;
  NSMutableArray *bottomPlacedSections;
  uint64_t v70;
  NSMutableArray *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  uint64_t v76;
  id v77;
  char v78;
  void *v79;
  id v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  uint64_t v85;
  BOOL v86;
  BOOL v87;
  BOOL isPeopleSearch;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  void *v97;
  void (*v98)(void);
  uint64_t v99;
  uint64_t v100;
  void *v101;
  NSObject *v102;
  NSObject *v103;
  os_log_type_t v104;
  SSRankingManager *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t m;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  int v121;
  void *v122;
  NSMutableArray *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t n;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  int v132;
  void *v133;
  uint64_t v134;
  void *v135;
  SSRankingManager *v136;
  SFMutableResultSection *topHitSection;
  _BOOL8 v138;
  void *v139;
  uint64_t v140;
  void *v141;
  NSObject *v142;
  os_log_type_t v143;
  void *v144;
  char v145;
  char v146;
  int v147;
  void *v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  uint64_t ii;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  int v160;
  void *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  int v172;
  id v173;
  uint64_t v174;
  __uint64_t v175;
  unsigned int v176;
  uint64_t v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  id v183;
  void *v184;
  id v185;
  id v186;
  unsigned int v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  id obj;
  SPFederatedQueryTask *v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  void *v197;
  uint64_t v198;
  SSRankingManager *rankingManager;
  void *v200;
  uint64_t v201;
  unsigned int v202;
  NSMutableDictionary *v203;
  void *v204;
  uint64_t v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _QWORD v210[5];
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _QWORD v223[4];
  id v224;
  id v225;
  SPFederatedQueryTask *v226;
  _QWORD v227[4];
  id v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  uint8_t v244[128];
  uint8_t buf[4];
  uint64_t v246;
  _BYTE v247[128];
  _BYTE v248[128];
  _BYTE v249[128];
  uint64_t v250;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v250 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v7, v8, "sendFinishedDomains", buf, 2u);
  }

  v9 = -[NSMutableArray count](self->_slowTokens, "count");
  v10 = -[NSMutableArray count](self->_tokens, "count");
  v178 = v5;
  v11 = (v9 > 0) & ~v5;
  if (v10 > 0)
    v11 = 1;
  if ((_DWORD)v4 == 4)
    v11 = 1;
  v187 = v11;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v237 = 0u;
  v238 = 0u;
  v239 = 0u;
  v240 = 0u;
  -[NSMutableDictionary allValues](self->_categoryToResultMapping, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v237, v249, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v238;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v238 != v16)
          objc_enumerationMutation(v13);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v237 + 1) + 8 * i), "resultsCount"))
        {
          v18 = 1;
          goto LABEL_17;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v237, v249, 16);
      if (v15)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_17:

  -[SPQueryTask query](self, "query");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "queryContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "searchEntities");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = self;
  if (v21)
  {
    v202 = v18;
    -[SPQueryTask query](self, "query");
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "queryContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "searchEntities");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      -[SPQueryTask query](self, "query");
      v183 = v12;
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "queryContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "searchEntities");
      v179 = v4;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isScopedSearch");

      v28 = v27;
      v4 = v179;

      self = v192;
      v12 = v183;
    }
    else
    {
      v28 = 0;
    }

    v18 = v202;
  }
  else
  {
    v28 = 0;
  }

  v29 = (void *)objc_opt_new();
  -[SSRankingManager setLogValues:](self->_rankingManager, "setLogValues:", v29);

  -[SPQueryTask query](self, "query");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "cancelled");

  if ((v31 & 1) != 0)
    goto LABEL_221;
  -[SPQueryTask query](self, "query");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "queryContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "queryKind");

  v176 = v28;
  if ((_DWORD)v4 != 4 && -[NSArray count](self->_actualSentSections, "count") && !objc_msgSend(v12, "count"))
  {
    -[NSArray objectAtIndex:](self->_actualSentSections, "objectAtIndex:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bundleIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

    if (v37)
    {
      objc_msgSend(v12, "addObject:", v35);

      goto LABEL_31;
    }

  }
  -[SPFederatedQueryTask addTopHitSectionIfNecessaryToSectionsForSending:updatedSections:isScopedSearch:](self, "addTopHitSectionIfNecessaryToSectionsForSending:updatedSections:isScopedSearch:", v12, v18, v28);
LABEL_31:
  -[SPQueryTask query](self, "query");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "queryContext");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "searchString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFederatedQueryTask addSuggestionsToSectionsForSending:searchString:updatedSections:queryKind:](self, "addSuggestionsToSectionsForSending:searchString:updatedSections:queryKind:", v12, v40, v18 | v187 ^ 1, v34);

  if (((v187 ^ 1) & 1) == 0
    && v4 >= 2
    && (_DWORD)v4 != 3
    && ((_DWORD)v4 != 4 || !self->_didReceiveCoreSpotlightProgress)
    && self->_didSendResults
    || !self->_categoryToResultMapping)
  {
    SPLogForSPLogCategoryDefault();
    v50 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v51 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(&v50->super.super, v51))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, &v50->super.super, v51, "Skipped ranking; already sent", buf, 2u);
    }
    goto LABEL_175;
  }
  self->_didSendResults = 1;
  v177 = v34;
  v180 = v4;
  v184 = v12;
  v175 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if ((_DWORD)v4 == 4)
  {
    v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v233 = 0u;
    v234 = 0u;
    v235 = 0u;
    v236 = 0u;
    -[NSMutableDictionary allKeys](self->_categoryToResultMapping, "allKeys");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v233, v248, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v234;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v234 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v233 + 1) + 8 * j);
          -[NSMutableDictionary objectForKey:](self->_categoryToResultMapping, "objectForKey:", v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "bundleIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (priorityIndexEligibleBundleIdentifer(v49))
            -[NSMutableDictionary setObject:forKey:](v41, "setObject:forKey:", v48, v47);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v233, v248, 16);
      }
      while (v44);
    }

    v34 = v177;
    v50 = v41;
    v4 = 4;
  }
  else
  {
    v50 = self->_categoryToResultMapping;
  }
  v231 = 0u;
  v232 = 0u;
  v229 = 0u;
  v230 = 0u;
  -[NSMutableDictionary allKeys](v50, "allKeys");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v229, v247, 16);
  v203 = v50;
  if (!v53)
  {

    goto LABEL_91;
  }
  v54 = v53;
  obj = v52;
  LOBYTE(v55) = 0;
  LOBYTE(v56) = 0;
  v57 = 0;
  v194 = *MEMORY[0x24BEB04A0];
  v198 = *(_QWORD *)v230;
  v190 = *MEMORY[0x24BEB0438];
  v188 = *MEMORY[0x24BEB0410];
  v189 = *MEMORY[0x24BEB0498];
  do
  {
    for (k = 0; k != v54; ++k)
    {
      if (*(_QWORD *)v230 != v198)
        objc_enumerationMutation(obj);
      v59 = *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * k);
      -[NSMutableDictionary objectForKey:](v50, "objectForKey:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "bundleIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "isEqualToString:", v194);

      if ((v56 & 1) != 0)
      {
        v56 = 1;
        if ((v57 & 1) != 0)
          goto LABEL_59;
      }
      else
      {
        if (!v60)
        {
          v56 = 0;
          if ((v55 & 1) == 0)
            goto LABEL_69;
          goto LABEL_67;
        }
        objc_msgSend(v60, "bundleIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v63, "isEqualToString:", v190);

        if ((v57 & 1) != 0)
        {
LABEL_59:
          v57 = 1;
          if ((v55 & 1) == 0)
            goto LABEL_69;
          goto LABEL_67;
        }
      }
      if (v60)
      {
        objc_msgSend(v60, "bundleIdentifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v64, "isEqualToString:", v188);

        if ((v55 & 1) == 0)
          goto LABEL_69;
      }
      else
      {
        v57 = 0;
        if ((v55 & 1) == 0)
        {
LABEL_69:
          if (v60)
          {
            objc_msgSend(v60, "bundleIdentifier");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v65, "isEqualToString:", v189);

          }
          else
          {
            v55 = 0;
          }
          goto LABEL_72;
        }
      }
LABEL_67:
      v55 = 1;
LABEL_72:
      objc_msgSend(v60, "results");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v66, "count"))
        v67 = v62;
      else
        v67 = 1;

      v68 = v67 == 1;
      v50 = v203;
      if (v68)
      {
        if (v62)
        {
          bottomPlacedSections = v192->_bottomPlacedSections;
          if (!bottomPlacedSections)
          {
            v70 = objc_opt_new();
            v71 = v192->_bottomPlacedSections;
            v192->_bottomPlacedSections = (NSMutableArray *)v70;

            bottomPlacedSections = v192->_bottomPlacedSections;
          }
          if ((-[NSMutableArray containsObject:](bottomPlacedSections, "containsObject:", v60) & 1) == 0)
            -[NSMutableArray addObject:](v192->_bottomPlacedSections, "addObject:", v60);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v203, "setObject:forKeyedSubscript:", 0, v59);
      }

    }
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v229, v247, 16);
  }
  while (v54);

  v4 = v180;
  v34 = v177;
  if (((v56 | v57) & v55) == 1)
  {
    if (v56)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v203, "setObject:forKeyedSubscript:", 0, v190);
    if ((v57 & 1) != 0)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v203, "setObject:forKeyedSubscript:", 0, v188);
  }
LABEL_91:
  -[SPQueryTask query](v192, "query");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "cancelled");

  if (v73)
  {

    v12 = v184;
    goto LABEL_221;
  }
  -[SPFederatedQueryTask externalID](v192, "externalID");
  kdebug_trace();
  -[SPQueryTask query](v192, "query");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "queryContext");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "queryKind");
  -[SPFederatedQueryTask clientBundleID](v192, "clientBundleID");
  v77 = (id)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0)
  {

    goto LABEL_98;
  }
  if ((objc_msgSend(v77, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
    || (objc_msgSend(v77, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
    || (v82 = objc_msgSend(v77, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v76 == 12)
    || v82)
  {
    v78 = _os_feature_enabled_impl();

    if ((v78 & 1) == 0)
      goto LABEL_102;
LABEL_98:
    v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableDictionary count](v50, "count"));
    v227[0] = MEMORY[0x24BDAC760];
    v227[1] = 3221225472;
    v227[2] = __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke;
    v227[3] = &unk_24F01B130;
    v80 = v79;
    v228 = v80;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v50, "enumerateKeysAndObjectsUsingBlock:", v227);
    v81 = v228;
  }
  else
  {

LABEL_102:
    rankingManager = v192->_rankingManager;
    -[SPFederatedQueryTask itemRanker](v192, "itemRanker");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPFederatedQueryTask preferredBundleIDs](v192, "preferredBundleIDs");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPQueryTask query](v192, "query");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v195 = objc_msgSend(v84, "queryIdent");
    v85 = -[SPFederatedQueryTask isCJK](v192, "isCJK");
    v86 = -[SPFederatedQueryTask isBullseyeNonCommittedSearch](v192, "isBullseyeNonCommittedSearch");
    v87 = -[SPFederatedQueryTask isBullseyeCommittedSearch](v192, "isBullseyeCommittedSearch");
    isPeopleSearch = v192->_isPeopleSearch;
    -[SPQueryTask query](v192, "query");
    v89 = v4;
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "queryContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v174) = isPeopleSearch;
    BYTE1(v174) = v87;
    LOBYTE(v174) = v86;
    v34 = v177;
    v92 = v85;
    v50 = v203;
    -[SSRankingManager rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:](rankingManager, "rankSectionsUsingBundleIDToSectionMapping:withRanker:preferredBundleIds:isScopedSearch:queryId:isCJK:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:isPeopleSearch:queryContext:", v203, v81, v83, v176, v195, v92, v174, v91);
    v80 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v89;
  }
  v12 = v184;

  if ((v192->_parsecCameLaterThanSRT || v192->_parsecEntityCameEarly)
    && ((unint64_t)(v34 - 5) < 4 || v34 == 1 || v34 == 4 || v192->_parsecEntityCameEarly))
  {
    v93 = (void *)-[NSArray copy](v192->_sentSections, "copy");
    v94 = objc_msgSend(v93, "count");
    v223[0] = MEMORY[0x24BDAC760];
    v223[1] = 3221225472;
    v223[2] = __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke_242;
    v223[3] = &unk_24F01B158;
    v95 = v93;
    v224 = v95;
    v80 = v80;
    v225 = v80;
    v226 = v192;
    v96 = MEMORY[0x22E2A214C](v223);
    v97 = (void *)v96;
    if (v94)
    {
      if ((unint64_t)(sDeviceClass - 1) <= 1)
      {
        v98 = *(void (**)(void))(v96 + 16);
        goto LABEL_114;
      }
      if (sDeviceClass == 3)
      {
        v98 = *(void (**)(void))(v96 + 16);
LABEL_114:
        v98();
        v99 = objc_claimAutoreleasedReturnValue();

        v80 = (id)v99;
      }
      else
      {
        v192->_sendStableSections = 1;
      }
    }

  }
  if (!v192->_sendStableSections
    || !v192->_sentTaggedTopHits
    || v192->_sentPriority
    || v192->_receivedLateParsecResults
    || v192->_shouldRecomputeSuggestions)
  {
    if (v192->_sentPriority)
    {
      SPLogForSPLogCategoryDefault();
      v102 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2279CC000, v102, OS_LOG_TYPE_DEFAULT, "Sending additional results after priority index results", buf, 2u);
      }

    }
    v192->_sentPriority = 0;
    if (objc_msgSend(v80, "count"))
    {
      SPLogForSPLogCategoryQuery();
      v103 = objc_claimAutoreleasedReturnValue();
      v104 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v103, v104))
      {
        *(_DWORD *)buf = 138412290;
        v246 = (uint64_t)v80;
        _os_log_impl(&dword_2279CC000, v103, v104, "rankedSections: %@", buf, 0xCu);
      }

      if (v192->_genreGroupingEnabled)
      {
        v105 = v192->_rankingManager;
        +[SPFederatedQueryTask appGenreMap](SPFederatedQueryTask, "appGenreMap");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSRankingManager groupSectionsByCategory:genreMap:topSections:](v105, "groupSectionsByCategory:genreMap:topSections:", v80, v106, v184);
        v107 = (void *)objc_claimAutoreleasedReturnValue();

        SPLogForSPLogCategoryQuery();
        v108 = objc_claimAutoreleasedReturnValue();
        v109 = 2 * (*MEMORY[0x24BE84AF8] == 0);
        if (os_log_type_enabled(v108, v109))
        {
          *(_DWORD *)buf = 138412290;
          v246 = (uint64_t)v107;
          _os_log_impl(&dword_2279CC000, v108, v109, "rankedSections: %@", buf, 0xCu);
        }

      }
      else
      {
        v107 = v80;
      }
      v221 = 0u;
      v222 = 0u;
      v219 = 0u;
      v220 = 0u;
      v80 = v107;
      v110 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v219, v244, 16);
      if (v110)
      {
        v111 = v110;
        v112 = *(_QWORD *)v220;
        v113 = *MEMORY[0x24BEB04A0];
        do
        {
          for (m = 0; m != v111; ++m)
          {
            if (*(_QWORD *)v220 != v112)
              objc_enumerationMutation(v80);
            v115 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * m);
            objc_msgSend(v115, "results");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            v117 = objc_msgSend(v116, "count");

            if (v117)
            {
              objc_msgSend(v115, "results");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "objectAtIndex:", 0);
              v119 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v119, "placement") == 2
                || (objc_msgSend(v115, "bundleIdentifier"),
                    v120 = (void *)objc_claimAutoreleasedReturnValue(),
                    v121 = objc_msgSend(v120, "isEqualToString:", v113),
                    v120,
                    v121))
              {
                -[NSMutableArray addObject:](v192->_bottomPlacedSections, "addObject:", v115);
              }

              v50 = v203;
            }
          }
          v111 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v219, v244, 16);
        }
        while (v111);
      }

      if (-[NSMutableArray count](v192->_bottomPlacedSections, "count"))
      {
        v122 = (void *)objc_msgSend(v80, "mutableCopy");
        v215 = 0u;
        v216 = 0u;
        v217 = 0u;
        v218 = 0u;
        v123 = v192->_bottomPlacedSections;
        v124 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v215, v243, 16);
        v4 = v180;
        v34 = v177;
        if (v124)
        {
          v125 = v124;
          v126 = *(_QWORD *)v216;
          do
          {
            for (n = 0; n != v125; ++n)
            {
              if (*(_QWORD *)v216 != v126)
                objc_enumerationMutation(v123);
              objc_msgSend(v122, "removeObject:", *(_QWORD *)(*((_QWORD *)&v215 + 1) + 8 * n));
            }
            v125 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v215, v243, 16);
          }
          while (v125);
        }

        v128 = objc_msgSend(v122, "copy");
        v80 = (id)v128;
        v12 = v184;
      }
      else
      {
        v4 = v180;
        v12 = v184;
        v34 = v177;
      }
    }
    objc_msgSend(v12, "addObjectsFromArray:", v80);
    -[SPFederatedQueryTask externalID](v192, "externalID");
    kdebug_trace();
    -[NSMutableDictionary objectForKey:](v50, "objectForKey:", *MEMORY[0x24BEB0388]);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v129;
    if (v129)
    {
      objc_msgSend(v129, "resultSet");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "firstObject");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = objc_msgSend(v131, "topHit");

      if (!v132)
      {
        objc_msgSend(v12, "removeObject:", v101);
        objc_msgSend(v12, "addObject:", v101);
      }

    }
    if (objc_msgSend(v12, "count"))
    {
      v196 = v101;
      if (-[NSArray count](v192->_corrections, "count"))
      {
        if (v192->_previousQueryKind == 10)
        {
          v133 = 0;
        }
        else
        {
          -[NSArray firstObject](v192->_corrections, "firstObject");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "suggestion");
          v133 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v133 = 0;
      }
      v136 = v192->_rankingManager;
      topHitSection = v192->_topHitSection;
      v138 = v192->_isPeopleSearch;
      -[SPFederatedQueryTask itemRanker](v192, "itemRanker");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v139, "queryTermLength");
      -[SPFederatedQueryTask itemRanker](v192, "itemRanker");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRankingManager applyTopSectionPolicy:withTopHitSection:isPeopleSearch:queryKind:correction:queryLength:ranker:](v136, "applyTopSectionPolicy:withTopHitSection:isPeopleSearch:queryKind:correction:queryLength:ranker:", v184, topHitSection, v138, v177, v133, v140, v141);
      v100 = objc_claimAutoreleasedReturnValue();

      SPLogForSPLogCategoryQuery();
      v142 = objc_claimAutoreleasedReturnValue();
      v143 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v142, v143))
      {
        *(_DWORD *)buf = 138412290;
        v246 = v100;
        _os_log_impl(&dword_2279CC000, v142, v143, "[query] toSendSections: %@", buf, 0xCu);
      }

      v34 = v177;
      v50 = v203;
      v134 = v175;
      v101 = v196;
    }
    else
    {
      v100 = (uint64_t)v12;
LABEL_167:
      v134 = v175;
    }

    v12 = (id)v100;
  }
  else
  {
    if ((_DWORD)v4 == 3)
    {
      v100 = -[NSArray mutableCopy](v192->_sentSections, "mutableCopy");
      v101 = v184;
      goto LABEL_167;
    }
    v134 = v175;
  }
  query_analytics_log_timing(v192, "finished", "ranking", v134);
  -[SPFederatedQueryTask logPerfToAnalytics:](v192, "logPerfToAnalytics:", v4);

  self = v192;
LABEL_175:

  -[SPQueryTask query](self, "query");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = objc_msgSend(v144, "cancelled");

  if ((v145 & 1) != 0)
    goto LABEL_221;
  v146 = v187 ^ 1;
  if ((unint64_t)(v34 - 4) > 4)
    v146 = 1;
  if ((v146 & 1) == 0
    && objc_msgSend(v12, "count") == 1
    && objc_msgSend(v12, "containsObject:", self->_topHitSection))
  {
    self->_didSendTopHits = 0;
    goto LABEL_221;
  }
  if (self->_enforcePreferredBundleIDs
    || (v147 = SSPreferLocalResultsOnLocalEngagment(), (unint64_t)(v34 - 5) <= 3) && v147)
  {
    -[SPFederatedQueryTask preferredBundleIDs](self, "preferredBundleIDs");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "count");

    if (v149)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v211 = 0u;
      v212 = 0u;
      v213 = 0u;
      v214 = 0u;
      v185 = v12;
      v150 = v12;
      v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v211, v242, 16);
      v181 = v4;
      if (v151)
      {
        v152 = v151;
        v153 = 0;
        v154 = *(_QWORD *)v212;
        do
        {
          for (ii = 0; ii != v152; ++ii)
          {
            if (*(_QWORD *)v212 != v154)
              objc_enumerationMutation(v150);
            v156 = *(void **)(*((_QWORD *)&v211 + 1) + 8 * ii);
            if (objc_msgSend(v156, "isEqual:", self->_topHitSection))
            {
              v157 = v156;

              v153 = v157;
            }
            else
            {
              -[SPFederatedQueryTask preferredBundleIDs](self, "preferredBundleIDs");
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v156, "bundleIdentifier");
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              v160 = objc_msgSend(v158, "containsObject:", v159);

              if (v160)
                v161 = v204;
              else
                v161 = v200;
              objc_msgSend(v161, "addObject:", v156);
              self = v192;
            }
          }
          v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v211, v242, 16);
        }
        while (v152);
      }
      else
      {
        v153 = 0;
      }

      objc_msgSend(v150, "removeAllObjects");
      v4 = v181;
      if (v153)
        objc_msgSend(v150, "addObject:", v153);
      v210[0] = MEMORY[0x24BDAC760];
      v210[1] = 3221225472;
      v210[2] = __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke_246;
      v210[3] = &unk_24F01B180;
      v210[4] = self;
      objc_msgSend(v204, "sortUsingComparator:", v210);
      objc_msgSend(v150, "addObjectsFromArray:", v204);
      objc_msgSend(v150, "addObjectsFromArray:", v200);

      v12 = v185;
    }
  }
  if (!self->_isEntitySearch)
    goto LABEL_220;
  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  v162 = v12;
  v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v206, v241, 16);
  if (!v163)
  {
LABEL_219:

    goto LABEL_220;
  }
  v164 = v163;
  v186 = v12;
  v182 = v4;
  v165 = 0;
  v166 = *(_QWORD *)v207;
  while (2)
  {
    v167 = 0;
    v201 = v165;
    v205 = v165 + v164;
LABEL_208:
    if (*(_QWORD *)v207 != v166)
      objc_enumerationMutation(v162);
    v168 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * v167);
    objc_msgSend(v168, "bundleIdentifier");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v169, "hasPrefix:", CFSTR("com.apple.parsec")) & 1) == 0)
    {

LABEL_214:
      if (v164 == ++v167)
      {
        v164 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v206, v241, 16);
        v165 = v205;
        if (v164)
          continue;
        v4 = v182;
        v12 = v186;
        goto LABEL_219;
      }
      goto LABEL_208;
    }
    break;
  }
  objc_msgSend(v168, "resultSet");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "firstObject");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = objc_msgSend(v171, "placement");

  if (v172 != 1)
    goto LABEL_214;
  v173 = v168;

  v4 = v182;
  v12 = v186;
  if (v173)
  {
    objc_msgSend(v162, "removeObjectAtIndex:", v201 + v167);
    objc_msgSend(v162, "insertObject:atIndex:", v173, 0);
    v162 = v173;
    goto LABEL_219;
  }
LABEL_220:
  -[SPFederatedQueryTask prepareAndSend:force:moreComing:reason:](v192, "prepareAndSend:force:moreComing:reason:", v12, v178, v187, v4);
LABEL_221:

}

void __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  SPLogForSPLogCategoryDefault();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2279CC000, v1, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] by-pass L3", v2, 2u);
  }

}

id __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke_242(uint64_t a1, unint64_t a2)
{
  void *v4;
  unint64_t v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v5 = objc_msgSend(v4, "count");
  if (*(_QWORD *)(a1 + 32))
    v6 = v5 > a2;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(v4, "removeObjectsInRange:", a2, v5 - a2);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v12, (_QWORD)v16) & 1) == 0)
            objc_msgSend(v4, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 274) = 0;
  }
  objc_msgSend(v4, "array", (_QWORD)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  return v14;
}

uint64_t __51__SPFederatedQueryTask_sendFinishedDomains_reason___block_invoke_246(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "preferredBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "indexOfObject:", v9);
  objc_msgSend(*(id *)(a1 + 32), "preferredBundleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v11, "indexOfObject:", v12);
  if (v10 >= v13)
    v14 = 0;
  else
    v14 = -1;
  if (v10 > v13)
    return 1;
  else
    return v14;
}

- (BOOL)topHitsReadyToSend:(id)a3
{
  return objc_msgSend(a3, "resultsCount") != 0;
}

- (id)detailTextFromBundleIDs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!SSEnableLocalDetailText())
  {
    v27 = 0;
    goto LABEL_20;
  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v29 = v3;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v6)
    goto LABEL_18;
  v7 = v6;
  v8 = *(_QWORD *)v32;
  v9 = *MEMORY[0x24BE849A8];
  v10 = *MEMORY[0x24BE849A0];
  v11 = 0x24BE84000uLL;
  v12 = CFSTR("DOMAIN_APPLICATION");
  do
  {
    v13 = 0;
    v30 = v7;
    do
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(v5);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
      if (objc_msgSend(v14, "isEqualToString:", v9, v29))
      {
        v15 = *(void **)(v11 + 2360);
        v16 = v12;
        goto LABEL_11;
      }
      if (objc_msgSend(v14, "isEqualToString:", v10))
      {
        v15 = *(void **)(v11 + 2360);
        v16 = CFSTR("DOMAIN_APP_CLIPS");
LABEL_11:
        objc_msgSend(v15, "localizedSearchStringWithIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_13;
LABEL_12:
        objc_msgSend(v4, "addObject:", v17);
        goto LABEL_13;
      }
      v18 = v9;
      v19 = v8;
      v20 = v10;
      v21 = v4;
      v22 = v5;
      v23 = v11;
      v24 = v12;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v14, 1, 0);
      objc_msgSend(v25, "localizedName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v24;
      v11 = v23;
      v5 = v22;
      v4 = v21;
      v10 = v20;
      v8 = v19;
      v9 = v18;
      v7 = v30;
      if (v17)
        goto LABEL_12;
LABEL_13:

      ++v13;
    }
    while (v7 != v13);
    v26 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    v7 = v26;
  }
  while (v26);
LABEL_18:

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v29;
LABEL_20:

  return v27;
}

- (id)contactSuggestionsWithSearchString:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v27;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v30 = *MEMORY[0x24BEB0548];
  -[NSMutableDictionary objectForKey:](self->_categoryToResultMapping, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v27 = v3;
    objc_msgSend(v3, "results");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (!v5)
      goto LABEL_20;
    v6 = v5;
    v7 = *(_QWORD *)v32;
    v8 = (_BYTE *)MEMORY[0x24BE84AF8];
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        SPLogForSPLogCategoryDefault();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = 2 * (*v8 == 0);
        if (os_log_type_enabled(v11, v12))
        {
          objc_msgSend(v10, "title");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v14;
          _os_log_impl(&dword_2279CC000, v11, v12, "Check result %@", buf, 0xCu);

        }
        objc_msgSend(v10, "contactIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(v10, "personIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {

LABEL_12:
            goto LABEL_13;
          }
          objc_msgSend(v10, "resultBundleId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqual:", v30);

          if (v19)
          {
            objc_msgSend(v10, "lastUsedDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timeIntervalSinceNow");
            if (v20 <= -40996800.0)
              goto LABEL_12;
            v21 = objc_msgSend(v10, "hasTextContentMatch");

            if (v21)
            {
              v22 = (void *)MEMORY[0x24BEB0318];
              -[SPQueryTask query](self, "query");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "queryContext");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "buildResultWithResult:queryContext:", v10, v24);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "addObject:", v16);
              goto LABEL_12;
            }
          }
        }
LABEL_13:
        ++v9;
      }
      while (v6 != v9);
      v25 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      v6 = v25;
      if (!v25)
      {
LABEL_20:

        v3 = v27;
        break;
      }
    }
  }

  return v29;
}

- (BOOL)forceAboveFoldResultsWithQuery:(id)a3 topHitSection:(id)a4 sections:(id)a5
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  BOOL v20;
  id v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a5;
  if (_os_feature_enabled_impl() && (unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v5;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      v10 = *MEMORY[0x24BEB0358];
      v11 = *MEMORY[0x24BEB0350];
      v23 = *MEMORY[0x24BEB04C8];
      v12 = 1;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          if ((v12 & 1) == 0)
          {
            v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v14, "bundleIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqualToString:", v10))
            {

LABEL_19:
              v20 = 1;
              goto LABEL_20;
            }
            objc_msgSend(v14, "bundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v11);

            if ((v17 & 1) != 0)
              goto LABEL_19;
            if (a4)
            {
              objc_msgSend(v14, "bundleIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqualToString:", v23);

              if (!v19)
                goto LABEL_19;
            }
          }
          v12 = 0;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v12 = 0;
        v20 = 0;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v20 = 0;
    }
LABEL_20:

    v5 = v22;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)suggestionsWithSearchString:(id)a3 sections:(id)a4 topHitSection:(id)a5 highestLocalScore:(double)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  SPFederatedQueryTask *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  SPFederatedQueryTask *v57;
  void *v58;
  void *v59;
  NSArray *serverSuggestionResults;
  NSArray *v61;
  NSArray *localSuggestionResults;
  NSArray *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t m;
  id v80;
  void *v82;
  void *v83;
  void *v84;
  NSArray *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  NSArray *v90;
  void *v92;
  id v93;
  void *v94;
  id v95;
  id obj;
  id obja;
  uint64_t v98;
  void *v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _QWORD v118[5];
  _QWORD v119[5];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v95 = a3;
  v89 = a4;
  v9 = a5;
  v93 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v100 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v94 = v9;
  objc_msgSend(v9, "results");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
  if (!v12)
  {
    v14 = 0;
    goto LABEL_19;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v114;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v114 != v15)
        objc_enumerationMutation(v11);
      v17 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
      objc_msgSend(v17, "entityIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v17, "entityIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v19);

      }
      objc_msgSend(v17, "contactIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {

      }
      else
      {
        objc_msgSend(v17, "personIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_12;
      }
      objc_msgSend(v17, "title");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "text");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      SSNormalizedQueryString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v100, "addObject:", v24);
LABEL_12:
      objc_msgSend(v17, "rankingItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        objc_msgSend(v17, "rankingItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = ((unint64_t)objc_msgSend(v26, "bundleIDType") >> 8) & 1;

      }
      else
      {
        LOBYTE(v27) = 0;
      }

      v14 |= v27;
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v113, v122, 16);
  }
  while (v13);
LABEL_19:

  if (_os_feature_enabled_impl())
  {
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    obj = v89;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
    if (v28)
    {
      v29 = v28;
      v98 = *(_QWORD *)v110;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v110 != v98)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v108 = 0u;
          objc_msgSend(v31, "results");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v106;
            do
            {
              for (k = 0; k != v34; ++k)
              {
                if (*(_QWORD *)v106 != v35)
                  objc_enumerationMutation(v32);
                v37 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
                objc_msgSend(v37, "entityIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (v38)
                {
                  objc_msgSend(v37, "entityIdentifier");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "addObject:", v39);

                }
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v105, v120, 16);
            }
            while (v34);
          }

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v121, 16);
      }
      while (v29);
    }

  }
  v40 = self;
  -[SPFederatedQueryTask contactSuggestionsWithSearchString:](self, "contactSuggestionsWithSearchString:", v95);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSRankingManager rankingConfiguration](self->_rankingManager, "rankingConfiguration");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "localResultQualityThreshold");
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v42;
  v44 = &unk_24F025118;
  if (v42)
    v44 = (void *)v42;
  v45 = v44;

  -[SPQueryTask query](self, "query");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "queryContext");
  obja = (id)objc_claimAutoreleasedReturnValue();

  if (SSCreateAsTypedSuggestion())
  {
    v47 = objc_alloc(MEMORY[0x24BE84F98]);
    v48 = (void *)objc_msgSend(v47, "initWithIdentifier:suggestion:query:score:type:", *MEMORY[0x24BEB0738], v95, v95, 6, 1.0);
    v49 = (void *)MEMORY[0x24BEB0318];
    -[SPQueryTask query](self, "query");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "queryContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "buildResultWithSuggestion:queryContext:", v48, v51);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = self;
  }
  else
  {
    v84 = 0;
  }
  v52 = objc_alloc(MEMORY[0x24BE84F98]);
  v53 = (void *)objc_msgSend(v52, "initWithIdentifier:suggestion:query:score:type:", *MEMORY[0x24BEB0740], v95, v95, 14, 1.0);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_DETAIL_WEB"), &stru_24F01C208, CFSTR("SpotlightServices"));
  v55 = objc_claimAutoreleasedReturnValue();

  v87 = (void *)v55;
  objc_msgSend(v53, "setDetailText:", v55);
  v56 = (void *)MEMORY[0x24BEB0318];
  -[SPQueryTask query](v40, "query");
  v57 = v40;
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "queryContext");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v53;
  objc_msgSend(v56, "buildResultWithSuggestion:queryContext:", v53, v59);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  serverSuggestionResults = v57->_serverSuggestionResults;
  if (!serverSuggestionResults)
    serverSuggestionResults = (NSArray *)MEMORY[0x24BDBD1A8];
  v61 = (NSArray *)MEMORY[0x24BDBD1A8];
  v90 = serverSuggestionResults;
  localSuggestionResults = v57->_localSuggestionResults;
  if (!localSuggestionResults)
    localSuggestionResults = v61;
  v63 = localSuggestionResults;
  objc_msgSend(MEMORY[0x24BEB0298], "sharedSuggestionsManager");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v45;
  v118[0] = CFSTR("qualityThreshold");
  v118[1] = CFSTR("prefersLocalUserTypedSuggestion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SPFederatedQueryTask prefersLocalUserTypedSuggestion](v57, "prefersLocalUserTypedSuggestion"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v83;
  v118[2] = CFSTR("suggestionsAreBlended");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v57->_suggestionsAreBlended);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v119[2] = v64;
  v118[3] = CFSTR("localFilteringScore");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v119[3] = v65;
  v118[4] = CFSTR("ForceAboveFoldResults");
  v86 = v45;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SPFederatedQueryTask forceAboveFoldResultsWithQuery:topHitSection:sections:](v57, "forceAboveFoldResultsWithQuery:topHitSection:sections:", v95, v94, v89));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v119[4] = v66;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, v118, 5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v63;
  objc_msgSend(v82, "orderedSuggestionsWithQueryContext:filters:entityFilters:contactFilters:userSuggestion:userWebSuggestion:shortcutSuggestionResults:actionSuggestionResults:contactSuggestionResults:serverSuggestionResults:localSuggestionResults:options:", obja, v93, v10, v100, v84, v92, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], v99, v90, v63, v67);
  v68 = objc_claimAutoreleasedReturnValue();

  v69 = (void *)v68;
  v70 = v89;
  if ((v14 & 1) != 0
    && (unint64_t)objc_msgSend(v69, "count") >= 3
    && (unint64_t)objc_msgSend(v89, "count") >= 3)
  {
    objc_msgSend(v89, "objectAtIndexedSubscript:", 2);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "bundleIdentifier");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "isEqualToString:", *MEMORY[0x24BEB0358]);

    if (v73)
    {
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      objc_msgSend(v89, "objectAtIndexedSubscript:", 2);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "results");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
      if (v76)
      {
        v77 = v76;
        v78 = *(_QWORD *)v102;
        while (2)
        {
          for (m = 0; m != v77; ++m)
          {
            if (*(_QWORD *)v102 != v78)
              objc_enumerationMutation(v75);
            if ((objc_msgSend(MEMORY[0x24BEB0320], "passLikelihoodForTopHitCandidate:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * m)) & 1) != 0)
            {
              objc_msgSend(v69, "subarrayWithRange:", 0, 2);
              v80 = (id)objc_claimAutoreleasedReturnValue();

              v70 = v89;
              goto LABEL_60;
            }
          }
          v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
          if (v77)
            continue;
          break;
        }
      }

      v70 = v89;
    }
  }
  v80 = v69;
LABEL_60:

  return v80;
}

- (void)addSuggestionsToSectionsForSending:(id)a3 searchString:(id)a4 updatedSections:(BOOL)a5 queryKind:(unint64_t)a6
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SFMutableResultSection *v17;
  SFMutableResultSection *suggestionsSection;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (a6 - 1 <= 1)
  {
    v8 = (objc_class *)MEMORY[0x24BE84F98];
    v9 = a4;
    v10 = a3;
    v11 = [v8 alloc];
    v12 = (void *)objc_msgSend(v11, "initWithIdentifier:suggestion:query:score:type:", *MEMORY[0x24BEB0738], v9, v9, 6, 1.0);

    v13 = (void *)MEMORY[0x24BEB0318];
    -[SPQueryTask query](self, "query");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queryContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "buildResultWithSuggestion:queryContext:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (SFMutableResultSection *)objc_opt_new();
    suggestionsSection = self->_suggestionsSection;
    self->_suggestionsSection = v17;

    -[SFMutableResultSection setBundleIdentifier:](self->_suggestionsSection, "setBundleIdentifier:", *MEMORY[0x24BEB06B8]);
    v20[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMutableResultSection setResults:](self->_suggestionsSection, "setResults:", v19);

    objc_msgSend(v10, "addObject:", self->_suggestionsSection);
  }
}

- (void)addTopHitSectionIfNecessaryToSectionsForSending:(id)a3 updatedSections:(BOOL)a4 isScopedSearch:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  int v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  SSRankingManager *rankingManager;
  double Current;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  SPFederatedQueryTask *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  SPFederatedQueryTask *v44;
  BOOL v45;
  SSRankingManager *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  SFMutableResultSection *topHitSection;
  uint64_t v60;
  SFMutableResultSection *v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  _BOOL4 v68;
  SSRankingManager *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  SPFederatedQueryTask *v75;
  id obj;
  id obja;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  uint64_t v84;
  uint64_t v85;

  v6 = a4;
  v85 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!a5)
  {
    v9 = SSEnableSpotlightTopHitPersonalizedRanking();
    v75 = self;
    if (!v6 || self->_didSendTopHits || -[SFMutableResultSection resultsCount](self->_topHitSection, "resultsCount"))
    {
      if (self->_didSendResults)
      {
        SPLogForSPLogCategoryDefault();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x24BE84B00] ^ 1;
        if (os_log_type_enabled(v10, v11))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2279CC000, v10, v11, "Skipping current top hits nomination due to previous dispatch.", buf, 2u);
        }

        self = v75;
        if (v9)
        {
          v72 = v8;
          v12 = objc_alloc(MEMORY[0x24BEB0248]);
          -[SPQueryTask query](v75, "query");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "queryContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (void *)objc_msgSend(v12, "initWithQueryContext:", v14);

          v80 = 0u;
          v81 = 0u;
          v78 = 0u;
          v79 = 0u;
          -[NSMutableDictionary allValues](v75->_categoryToResultMapping, "allValues");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
          if (!v15)
            goto LABEL_21;
          v16 = v15;
          v17 = *(_QWORD *)v79;
          while (1)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v79 != v17)
                objc_enumerationMutation(obj);
              v19 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
              if (objc_msgSend(v19, "resultsCount"))
              {
                objc_msgSend(v19, "resultSet");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "rankingItem");
                v22 = objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  v23 = (void *)v22;
                  objc_msgSend(v19, "resultSet");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "rankingItem");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "likelihood");
                  v28 = v27;

                  if (v28 >= 2.22044605e-16)
                    continue;
                  rankingManager = v75->_rankingManager;
                  Current = CFAbsoluteTimeGetCurrent();
                  -[SPQueryTask query](v75, "query");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v20, "queryIdent");
                  -[SPFederatedQueryTask itemRanker](v75, "itemRanker");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SSRankingManager calculateLikelihoodAndPriorForSection:currentTime:shortcutResult:queryId:ranker:nominateLocalTopHit:qu:](rankingManager, "calculateLikelihoodAndPriorForSection:currentTime:shortcutResult:queryId:ranker:nominateLocalTopHit:qu:", v19, 0, v31, v21, 0, v74, Current);
                }

              }
            }
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
            if (!v16)
            {
LABEL_21:

              v8 = v72;
              self = v75;
              goto LABEL_22;
            }
          }
        }
      }
    }
    else
    {
      v73 = v8;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = self;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("DOMAIN_TOPHIT"), &stru_24F01C208, CFSTR("Search"));
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (sDeviceClass == 3)
        v40 = 6;
      else
        v40 = 4;
      if (v9)
      {
        v41 = objc_alloc(MEMORY[0x24BEB0248]);
        -[SPQueryTask query](v38, "query");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "queryContext");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        obja = (id)objc_msgSend(v41, "initWithQueryContext:", v43);

        v69 = v38->_rankingManager;
        -[NSMutableDictionary allValues](v38->_categoryToResultMapping, "allValues");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPFederatedQueryTask itemRanker](v38, "itemRanker");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = -[SPFederatedQueryTask isBullseyeNonCommittedSearch](v38, "isBullseyeNonCommittedSearch");
        v67 = -[SPFederatedQueryTask isBullseyeCommittedSearch](v38, "isBullseyeCommittedSearch");
        v44 = v38;
        v45 = v38->_parsecEnabled || v38->_parsecSettingEnabled;
        -[SPQueryTask query](v44, "query");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "queryIdent");
        -[SPQueryTask query](v44, "query");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "queryContext");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "queryKind");
        -[SPFederatedQueryTask clientBundleID](v75, "clientBundleID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v56;
        self = v75;
        BYTE1(v65) = v45;
        LOBYTE(v65) = v67;
        -[SSRankingManager nominateLocalTopHitsFromSections:withItemRanker:sectionHeader:maxInitiallyVisibleResults:shortcutResult:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:parsecEnabled:maxNumAppsInTopHitSection:queryId:queryKind:clientBundleID:qu:](v69, "nominateLocalTopHitsFromSections:withItemRanker:sectionHeader:maxInitiallyVisibleResults:shortcutResult:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:parsecEnabled:maxNumAppsInTopHitSection:queryId:queryKind:clientBundleID:qu:", v71, v70, v74, 1, 0, v68, v65, v40, v53, v66, v57, obja);
        v58 = objc_claimAutoreleasedReturnValue();
        topHitSection = v75->_topHitSection;
        v75->_topHitSection = (SFMutableResultSection *)v58;

        v8 = v73;
      }
      else
      {
        v46 = v38->_rankingManager;
        -[NSMutableDictionary allValues](v38->_categoryToResultMapping, "allValues");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPFederatedQueryTask itemRanker](v38, "itemRanker");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = -[SPFederatedQueryTask isBullseyeNonCommittedSearch](v38, "isBullseyeNonCommittedSearch");
        v50 = -[SPFederatedQueryTask isBullseyeCommittedSearch](v38, "isBullseyeCommittedSearch");
        v51 = v38->_parsecEnabled || v38->_parsecSettingEnabled;
        LOBYTE(v65) = v51;
        -[SSRankingManager makeTopHitSectionUsingSections:withItemRanker:sectionHeader:shortcutResult:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:parsecEnabled:maxNumAppsInTopHitSection:](v46, "makeTopHitSectionUsingSections:withItemRanker:sectionHeader:shortcutResult:isBullseyeNonCommittedSearch:isBullseyeCommittedSearch:parsecEnabled:maxNumAppsInTopHitSection:", v47, v48, v74, 0, v49, v50, v65, v40);
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v38->_topHitSection;
        v38->_topHitSection = (SFMutableResultSection *)v60;

        SPLogForSPLogCategoryDefault();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = 2 * (*MEMORY[0x24BE84AF8] == 0);
        if (os_log_type_enabled(v62, v63))
        {
          v64 = -[SFMutableResultSection resultsCount](v75->_topHitSection, "resultsCount");
          *(_DWORD *)buf = 134217984;
          v84 = v64;
          _os_log_impl(&dword_2279CC000, v62, v63, "Top hit section count: %lu  Allow multiple apps: YES", buf, 0xCu);
        }

        v8 = v73;
        self = v75;
      }
LABEL_22:

    }
    -[SFMutableResultSection results](self->_topHitSection, "results");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "count"))
    {
      v33 = 0;
      do
      {
        objc_msgSend(v32, "objectAtIndex:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "rankingItem");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setBundleIDType:", objc_msgSend(v35, "bundleIDType") | 0x8000);

        ++v33;
      }
      while (v33 < objc_msgSend(v32, "count"));
    }
    v36 = -[SPFederatedQueryTask topHitsReadyToSend:](v75, "topHitsReadyToSend:", v75->_topHitSection);
    -[SPQueryTask query](v75, "query");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "internalDebug");

    if (v36)
    {
      objc_msgSend(v8, "insertObject:atIndex:", v75->_topHitSection, 0);
      v75->_didSendTopHits = 1;
    }

  }
}

- (void)sendFinishedDomains:(int)a3
{
  -[SPFederatedQueryTask sendFinishedDomains:reason:](self, "sendFinishedDomains:reason:", 0, *(_QWORD *)&a3);
}

- (void)setTimeout:(double)a3
{
  self->_storeStartTime = CFAbsoluteTimeGetCurrent();
  self->_timeOut = a3;
}

- (void)storeWillComplete:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  double v7;
  double timeOut;
  NSObject *timer;
  dispatch_time_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SPLogForSPLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v5, v6))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_2279CC000, v5, v6, "storeWillComplete %@", (uint8_t *)&v11, 0xCu);
  }

  self->_timeOut = self->_timeOut * 1.5;
  if (self->_timer)
  {
    if (!-[NSMutableArray count](self->_tokens, "count"))
    {
      v7 = CFAbsoluteTimeGetCurrent() - self->_storeStartTime;
      timeOut = self->_timeOut;
      if (v7 < timeOut * 1.5)
      {
        timer = self->_timer;
        v10 = dispatch_time(0, (uint64_t)((timeOut - v7) * 1000000000.0));
        dispatch_source_set_timer(timer, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
    }
  }

}

- (BOOL)storeSearchProgress:(id)a3 withSections:(id)a4 suggestionResults:(id)a5
{
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  SSRankingManager *rankingManager;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  NSMutableDictionary *categoryToResultMapping;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  NSMutableDictionary *v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id obj;
  _OWORD v48[4];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v42 = a4;
  v41 = a5;
  v43 = v8;
  if (v8)
  {
    SPLogForSPLogCategoryQuery();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE84B00] ^ 1;
    if (os_log_type_enabled(v9, v10))
    {
      -[SPQueryTask query](self, "query");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "queryContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "searchString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v56 = v13;
      v57 = 2112;
      v58 = v43;
      v59 = 2048;
      v60 = objc_msgSend(v42, "count");
      _os_log_impl(&dword_2279CC000, v9, v10, "storeSearchProgress, query:\"%@\", token:%@, sectionCount:%ld", buf, 0x20u);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self->_didReceiveCoreSpotlightProgress = 1;
      objc_storeStrong((id *)&self->_localSuggestionResults, a5);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      rankingManager = self->_rankingManager;
      v15 = v43;
      objc_msgSend(v15, "rankingInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSRankingManager updateWithNewRankingInfo:](rankingManager, "updateWithNewRankingInfo:", v16);

    }
    v40 = self->_categoryToResultMapping;
    objc_sync_enter(v40);
    v17 = (void *)MEMORY[0x24BEB02F0];
    -[SPQueryTask query](self, "query");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "queryContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "searchString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logSections:prefix:query:", v42, CFSTR("L1 progress"), v20);

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v42;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v50;
      v46 = *MEMORY[0x24BEB05E8];
      v44 = *MEMORY[0x24BEB0698];
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (objc_msgSend(v24, "resultsCount"))
          {
            memset(v48, 0, sizeof(v48));
            objc_msgSend(v24, "results");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", v48, v53, 16))
            {
              v26 = (void *)**((_QWORD **)&v48[0] + 1);
              objc_msgSend(**((id **)&v48[0] + 1), "personIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                objc_msgSend(v26, "resultBundleId");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v28, "isEqual:", v46))
                {

                  goto LABEL_19;
                }
                objc_msgSend(v26, "resultBundleId");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "isEqual:", v44);

                if (v30)
LABEL_19:
                  objc_msgSend(v24, "setBundleIdentifier:", v46);
              }
            }

            categoryToResultMapping = self->_categoryToResultMapping;
            objc_msgSend(v24, "bundleIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](categoryToResultMapping, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              -[SPFederatedQueryTask deDuplicateSection:againstSection:](self, "deDuplicateSection:againstSection:", v24, v33);
              objc_msgSend(v24, "results");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addResultsFromArray:", v34);

              objc_msgSend(v24, "bundleIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v34) = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.application"));

              if ((_DWORD)v34)
                objc_msgSend(v33, "sortRange:options:usingComparator:", 0, objc_msgSend(v33, "resultsCount"), 16, &__block_literal_global_283);
            }
            else
            {
              v36 = self->_categoryToResultMapping;
              objc_msgSend(v24, "bundleIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              if (!v37)
              {
                objc_msgSend(v24, "title");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v45;
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v24, v38);
              if (!v37)

              -[NSMutableOrderedSet addObject:](self->_sectionOrderByInsertion, "addObject:", v24);
            }

            continue;
          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      }
      while (v21);
    }

    objc_sync_exit(v40);
    -[SPFederatedQueryTask sendFinishedDomains:](self, "sendFinishedDomains:", 4);
  }

  return 0;
}

uint64_t __75__SPFederatedQueryTask_storeSearchProgress_withSections_suggestionResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !v6)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isServerAlternativeResult") & 1) != 0
    || (objc_msgSend(v6, "isServerAlternativeResult") & 1) == 0)
  {
    if (objc_msgSend(v5, "isServerAlternativeResult")
      && !objc_msgSend(v6, "isServerAlternativeResult"))
    {
      v7 = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v7 = -1;
LABEL_9:

  return v7;
}

- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4 suggestionResults:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSString *v14;
  NSString *fbq;
  NSString *v16;
  NSString *web_fbq;
  NSDictionary *v18;
  NSDictionary *server_features;
  NSArray *v20;
  NSArray *serverSuggestionResults;
  SSRankingManager *rankingManager;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  _BOOL4 v43;
  SSRankingManager *v44;
  double Current;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  NSMutableDictionary *categoryToResultMapping;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  NSMutableDictionary *v59;
  void *v60;
  void *v61;
  SPFederatedQueryTask *v62;
  NSObject *v63;
  os_log_type_t v64;
  NSObject *v65;
  os_log_type_t v66;
  NSMutableArray *tokens;
  NSMutableArray *slowTokens;
  uint64_t v69;
  NSMutableArray *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  uint64_t v75;
  NSMutableArray *delayedStartTokens;
  void *v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t m;
  void *v87;
  char v88;
  uint64_t v89;
  _BOOL8 v90;
  NSObject *timer;
  OS_dispatch_source *v92;
  uint64_t v93;
  BOOL v94;
  int v95;
  void *v96;
  uint64_t v97;
  NSArray *stableSections;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t n;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  BOOL v110;
  uint64_t v111;
  NSMutableArray *bottomPlacedSections;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  char v120;
  double v121;
  double storeStartTime;
  BOOL v123;
  NSObject *v124;
  double v125;
  os_log_type_t v126;
  _BOOL4 v127;
  NSMutableArray *v128;
  uint64_t v129;
  uint64_t v130;
  OS_dispatch_source *v131;
  double v132;
  NSObject *v133;
  uint64_t v134;
  uint64_t v135;
  void (**v136)(id, _QWORD);
  double v137;
  NSObject *v138;
  os_log_type_t v139;
  double timeOut;
  BOOL v141;
  char v142;
  NSObject *v143;
  os_log_type_t v144;
  NSObject *v145;
  dispatch_source_t v146;
  OS_dispatch_source *v147;
  NSObject *v148;
  dispatch_time_t v149;
  void *v150;
  NSObject *v151;
  NSObject *v152;
  os_log_type_t v153;
  NSObject *v154;
  OS_dispatch_source *v155;
  NSObject *v157;
  OS_dispatch_source *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  NSMutableDictionary *v162;
  int isKindOfClass;
  id v164;
  void *v165;
  void *v166;
  __int128 v167;
  uint64_t v168;
  void *v169;
  int v170;
  _BOOL4 v171;
  uint64_t v172;
  int v173;
  void *v174;
  id obj;
  uint64_t v176;
  _QWORD handler[4];
  id v179;
  char v180;
  uint8_t v181[8];
  _QWORD v182[4];
  id v183;
  __int128 v184;
  __int128 v185;
  uint64_t v186;
  id location;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _OWORD v204[4];
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  _BYTE buf[32];
  uint64_t v210;
  double v211;
  _BYTE v212[128];
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  _BYTE v217[128];
  uint64_t v218;

  v218 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  obj = a4;
  v164 = a5;
  v165 = v7;
  if (!v7)
    goto LABEL_163;
  SPLogForSPLogCategoryQuery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[SPQueryTask query](self, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "queryContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CSRedactString();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v165;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = objc_msgSend(obj, "count");
    _os_log_impl(&dword_2279CC000, v8, OS_LOG_TYPE_DEFAULT, "storeCompletedSearch, query:\"%@\", query:%@, sectionCount:%ld", buf, 0x20u);

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v13 = v165;
    objc_msgSend(v13, "fbq");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    fbq = self->_fbq;
    self->_fbq = v14;

    objc_msgSend(v13, "web_fbq");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    web_fbq = self->_web_fbq;
    self->_web_fbq = v16;

    objc_msgSend(v13, "server_features");
    v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    server_features = self->_server_features;
    self->_server_features = v18;

    self->_suggestionsAreBlended = objc_msgSend(v13, "suggestionsAreBlended");
    objc_msgSend(v13, "querySuggestionResults");
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    serverSuggestionResults = self->_serverSuggestionResults;
    self->_serverSuggestionResults = v20;

    rankingManager = self->_rankingManager;
    objc_msgSend(v13, "rankingInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSRankingManager updateWithNewRankingInfo:](rankingManager, "updateWithNewRankingInfo:", v23);

  }
  else
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_storeStrong((id *)&self->_localSuggestionResults, a5);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend((id)objc_opt_class(), "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  SDTraceAdd();

  v162 = self->_categoryToResultMapping;
  objc_sync_enter(v162);
  v25 = (void *)MEMORY[0x24BEB02F0];
  -[SPQueryTask query](self, "query");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "queryContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "searchString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "logSections:prefix:query:", obj, CFSTR("L1 complete"), v28);

  v29 = SSEnableSpotlightTopHitPersonalizedRanking();
  v173 = v29;
  if (v29)
  {
    v30 = objc_alloc(MEMORY[0x24BEB0248]);
    -[SPQueryTask query](self, "query");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "queryContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = (void *)objc_msgSend(v30, "initWithQueryContext:", v32);

    v29 = v173;
  }
  else
  {
    v166 = 0;
  }
  v207 = 0u;
  v208 = 0u;
  v205 = 0u;
  v206 = 0u;
  obj = obj;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v217, 16);
  if (v33)
  {
    v176 = *(_QWORD *)v206;
    v172 = *MEMORY[0x24BEB05E8];
    v168 = *MEMORY[0x24BEB0698];
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v206 != v176)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * i);
        if (objc_msgSend(v35, "resultsCount"))
        {
          if (v29)
          {
            objc_msgSend(v35, "resultSet");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "rankingItem");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v38)
              goto LABEL_22;
            objc_msgSend(v35, "resultSet");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "rankingItem");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "likelihood");
            v43 = v42 < 2.22044605e-16;

            if (v43)
            {
              v44 = self->_rankingManager;
              Current = CFAbsoluteTimeGetCurrent();
              -[SPQueryTask query](self, "query");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v36, "queryIdent");
              -[SPFederatedQueryTask itemRanker](self, "itemRanker");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[SSRankingManager calculateLikelihoodAndPriorForSection:currentTime:shortcutResult:queryId:ranker:nominateLocalTopHit:qu:](v44, "calculateLikelihoodAndPriorForSection:currentTime:shortcutResult:queryId:ranker:nominateLocalTopHit:qu:", v35, 0, v46, v37, 0, v166, Current);
LABEL_22:

            }
          }
          memset(v204, 0, sizeof(v204));
          objc_msgSend(v35, "results");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", v204, v216, 16))
          {
            v48 = (void *)**((_QWORD **)&v204[0] + 1);
            objc_msgSend(**((id **)&v204[0] + 1), "personIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
            {
              objc_msgSend(v48, "resultBundleId");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v50, "isEqual:", v172))
              {

                goto LABEL_28;
              }
              objc_msgSend(v48, "resultBundleId");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "isEqual:", v168);

              if (v52)
LABEL_28:
                objc_msgSend(v35, "setBundleIdentifier:", v172);
            }
          }

          categoryToResultMapping = self->_categoryToResultMapping;
          objc_msgSend(v35, "bundleIdentifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](categoryToResultMapping, "objectForKeyedSubscript:", v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          if (v55)
          {
            -[SPFederatedQueryTask deDuplicateSection:againstSection:](self, "deDuplicateSection:againstSection:", v35, v55);
            objc_msgSend(v35, "results");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "addResultsFromArray:", v56);

            objc_msgSend(v35, "bundleIdentifier");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("com.apple.application"));

            if ((v58 & (isKindOfClass ^ 1)) != 0)
              objc_msgSend(v55, "sortRange:options:usingComparator:", 0, objc_msgSend(v55, "resultsCount"), 16, &__block_literal_global_288);
          }
          else
          {
            v59 = self->_categoryToResultMapping;
            objc_msgSend(v35, "bundleIdentifier");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v60;
            if (!v60)
            {
              objc_msgSend(v35, "title");
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = v169;
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v35, v61);
            if (!v60)

            -[NSMutableOrderedSet addObject:](self->_sectionOrderByInsertion, "addObject:", v35);
          }

          v29 = v173;
          continue;
        }
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v205, v217, 16);
    }
    while (v33);
  }

  objc_sync_exit(v162);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "searchDomain"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = -[NSMutableArray containsObject:](self->_delayedStartTokens, "containsObject:", v174);
  v62 = self;
  objc_sync_enter(v62);
  v62->_shouldRecomputeSuggestions = 1;
  SPLogForSPLogCategoryQuery();
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v63, v64))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v174;
    _os_log_impl(&dword_2279CC000, v63, v64, "Completed search for query %@", buf, 0xCu);
  }

  -[NSMutableArray removeObject:](v62->_tokens, "removeObject:", v174);
  -[NSMutableArray removeObject:](v62->_slowTokens, "removeObject:", v174);
  -[NSMutableArray removeObject:](self->_delayedStartTokens, "removeObject:", v174);
  -[NSMutableArray addObject:](v62->_finishedTokens, "addObject:", v174);
  SPLogForSPLogCategoryQuery();
  v65 = objc_claimAutoreleasedReturnValue();
  v66 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v65, v66))
  {
    tokens = v62->_tokens;
    slowTokens = v62->_slowTokens;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = tokens;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = slowTokens;
    _os_log_impl(&dword_2279CC000, v65, v66, "Remaining stores %@ %@", buf, 0x16u);
  }

  *((_QWORD *)&v167 + 1) = -[NSMutableArray count](v62->_slowTokens, "count");
  v161 = -[NSMutableArray count](self->_delayedStartTokens, "count");
  v160 = -[NSMutableArray count](v62->_delayedStartQueries, "count");
  v69 = -[NSMutableArray count](v62->_tokens, "count");
  *(_QWORD *)&v167 = v69;
  if (__PAIR128__(*((unint64_t *)&v167 + 1), v69) == 0
    && -[NSMutableArray count](v62->_delayedStartQueries, "count"))
  {
    v202 = 0u;
    v203 = 0u;
    v200 = 0u;
    v201 = 0u;
    v70 = v62->_delayedStartQueries;
    v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v200, v215, 16);
    if (v71)
    {
      v72 = *(_QWORD *)v201;
      do
      {
        for (j = 0; j != v71; ++j)
        {
          if (*(_QWORD *)v201 != v72)
            objc_enumerationMutation(v70);
          v74 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * j);
          objc_msgSend(v74, "setDelegate:", v62);
          objc_msgSend(v74, "start");
          v75 = objc_msgSend((id)objc_opt_class(), "searchDomain");
          if (objc_msgSend(v74, "isStarted"))
          {
            delayedStartTokens = self->_delayedStartTokens;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](delayedStartTokens, "addObject:", v77);

          }
        }
        v71 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v200, v215, 16);
      }
      while (v71);
    }

    -[NSMutableArray removeAllObjects](v62->_delayedStartQueries, "removeAllObjects");
  }
  if (-[NSMutableArray count](v62->_slowTokens, "count"))
    v171 = 0;
  else
    v171 = -[NSMutableArray count](v62->_tokens, "count") == 0;
  if (v170)
  {
    v198 = 0u;
    v199 = 0u;
    v196 = 0u;
    v197 = 0u;
    obj = obj;
    v78 = 0;
    v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v196, v214, 16);
    if (v79)
    {
      v80 = *(_QWORD *)v197;
      do
      {
        for (k = 0; k != v79; ++k)
        {
          if (*(_QWORD *)v197 != v80)
            objc_enumerationMutation(obj);
          v82 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * k);
          v192 = 0u;
          v193 = 0u;
          v194 = 0u;
          v195 = 0u;
          objc_msgSend(v82, "results");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v192, v213, 16);
          if (v84)
          {
            v85 = *(_QWORD *)v193;
            while (2)
            {
              for (m = 0; m != v84; ++m)
              {
                if (*(_QWORD *)v193 != v85)
                  objc_enumerationMutation(v83);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v192 + 1) + 8 * m), "topHit") == 2)
                {
                  v78 = 1;
                  goto LABEL_75;
                }
              }
              v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v192, v213, 16);
              if (v84)
                continue;
              break;
            }
          }
LABEL_75:

        }
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v196, v214, 16);
      }
      while (v79);
    }

    v62->_shouldRecomputeSuggestions = 0;
    -[SPQueryTask query](v62, "query");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "cancelled");

    if ((v88 & 1) == 0)
    {
      if (-[NSMutableArray count](v62->_bottomPlacedSections, "count"))
      {
        objc_msgSend(obj, "arrayByAddingObjectsFromArray:", v62->_bottomPlacedSections);
        v89 = objc_claimAutoreleasedReturnValue();

        obj = (id)v89;
      }
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(obj, "count");
      if (v161 + v160)
        v94 = 0;
      else
        v94 = v167 == 0;
      v95 = v94;
      HIDWORD(v159) = 2;
      LOBYTE(v159) = v78 & 1;
      -[SPFederatedQueryTask sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:](v62, "sendResults:reset:partiallyComplete:update:complete:unchanged:delayedTopHit:reason:", obj, 0, 0, v95 ^ 1u, v159);
    }
    goto LABEL_119;
  }
  v90 = !v62->_didForceSend && v171;
  if (v90)
  {
    if (v62->_parsecEntityCameEarly)
    {
      timer = v62->_timer;
      if (timer)
      {
        dispatch_source_cancel(timer);
        dispatch_source_set_event_handler((dispatch_source_t)v62->_timer, 0);
        v92 = v62->_timer;
        v62->_timer = 0;

      }
      v93 = 0;
      goto LABEL_90;
    }
    if (!v62->_parsecCameLaterThanSRT)
    {
      v157 = v62->_timer;
      if (v157)
      {
        dispatch_source_cancel(v157);
        dispatch_source_set_event_handler((dispatch_source_t)v62->_timer, 0);
        v158 = v62->_timer;
        v62->_timer = 0;

      }
      -[SPFederatedQueryTask sendFinishedDomains:](v62, "sendFinishedDomains:", 0);
      goto LABEL_119;
    }
LABEL_104:
    v96 = (void *)MEMORY[0x22E2A1F9C]();
    v62->_didSendResults = 0;
    v62->_sendStableSections = 1;
    -[NSArray arrayByAddingObjectsFromArray:](v62->_actualSentSections, "arrayByAddingObjectsFromArray:", obj);
    v97 = objc_claimAutoreleasedReturnValue();
    stableSections = v62->_stableSections;
    v62->_stableSections = (NSArray *)v97;

    v99 = (void *)objc_opt_new();
    v190 = 0u;
    v191 = 0u;
    v188 = 0u;
    v189 = 0u;
    obj = obj;
    v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, v212, 16);
    if (v100)
    {
      v101 = *(_QWORD *)v189;
      do
      {
        for (n = 0; n != v100; ++n)
        {
          if (*(_QWORD *)v189 != v101)
            objc_enumerationMutation(obj);
          v103 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * n);
          if (v103)
          {
            objc_msgSend(v103, "results");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "addObjectsFromArray:", v104);

          }
        }
        v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v188, v212, 16);
      }
      while (v100);
    }

    if (objc_msgSend(v99, "count"))
    {
      v62->_receivedLateParsecResults = 1;
      v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84F70]), "initWithResults:", v99);
      objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPQueryTask query](v62, "query");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(v107, "queryIdent");
      -[SPXPCConnection bundleID](v62->_connection, "bundleID");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "sendFeedbackType:feedback:queryId:clientID:", 14, v105, v108, v109);

    }
    if (SSDisplayLateServerSuggestions())
      v110 = -[NSArray count](v62->_serverSuggestionResults, "count") != 0;
    else
      v110 = 0;
    v62->_shouldRecomputeSuggestions = v110;
    -[SPFederatedQueryTask sendFinishedDomains:](v62, "sendFinishedDomains:", 3);

    objc_autoreleasePoolPop(v96);
    goto LABEL_119;
  }
  if (v62->_parsecCameLaterThanSRT)
    goto LABEL_104;
  if (!v62->_isEntitySearch
    || (isKindOfClass & 1) == 0
    || !-[NSMutableArray count](v62->_tokens, "count")
    || -[NSMutableArray count](v62->_slowTokens, "count"))
  {
    goto LABEL_119;
  }
  v62->_parsecEntityCameEarly = 1;
  v93 = 5;
LABEL_90:
  -[SPFederatedQueryTask sendFinishedDomains:reason:](v62, "sendFinishedDomains:reason:", v90, v93);
LABEL_119:
  if (v171)
  {
    v111 = -[NSMutableArray count](self->_delayedStartTokens, "count");
    if (!(v111 + -[NSMutableArray count](v62->_delayedStartQueries, "count")) && !v62->_sentCompleted)
    {
      -[SPFederatedQueryTask sendQueryCompleted](v62, "sendQueryCompleted");
      bottomPlacedSections = v62->_bottomPlacedSections;
      v62->_bottomPlacedSections = 0;

      v62->_sentCompleted = 1;
    }
  }
  objc_sync_exit(v62);

  if (!-[NSMutableArray count](v62->_slowTokens, "count") && !-[NSMutableArray count](v62->_tokens, "count"))
  {
    v113 = objc_alloc(MEMORY[0x24BE84DB8]);
    -[SPQueryTask query](v62, "query");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = (void *)objc_msgSend(v113, "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.backend.stores.end"), 0, objc_msgSend(v114, "queryIdent"));

    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPQueryTask query](v62, "query");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v117, "queryIdent");
    -[SPXPCConnection bundleID](v62->_connection, "bundleID");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "sendFeedbackType:feedback:queryId:clientID:", 21, v115, v118, v119);

  }
  if (!-[NSMutableArray count](v62->_slowTokens, "count") || -[NSMutableArray count](v62->_tokens, "count"))
    goto LABEL_131;
  v120 = v170;
  if (v62->_timer)
    v120 = 1;
  if ((v120 & 1) != 0)
  {
LABEL_131:
    v121 = CFAbsoluteTimeGetCurrent();
    storeStartTime = v62->_storeStartTime;
    v123 = -[NSMutableArray count](v62->_tokens, "count") == 0;
    SPLogForSPLogCategoryDefault();
    v124 = objc_claimAutoreleasedReturnValue();
    v125 = v121 - storeStartTime;
    v126 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    v127 = os_log_type_enabled(v124, v126);
    if (v123)
    {
      if (v127)
      {
        v129 = -[NSMutableArray count](v62->_slowTokens, "count");
        v130 = -[NSMutableArray count](v62->_tokens, "count");
        v131 = v62->_timer;
        *(_DWORD *)buf = 134219008;
        *(_QWORD *)&buf[4] = v129;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v130;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v131;
        LOWORD(v210) = 1024;
        *(_DWORD *)((char *)&v210 + 2) = v170;
        HIWORD(v210) = 2048;
        v211 = v125;
        _os_log_impl(&dword_2279CC000, v124, v126, "Not waiting on parsec st:%ld t:%ld ti:%p d:%d (%f)", buf, 0x30u);
      }
    }
    else if (v127)
    {
      v128 = v62->_tokens;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v128;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v125;
      _os_log_impl(&dword_2279CC000, v124, v126, "Not waiting on parsec t:%@ (%f)", buf, 0x16u);
    }

  }
  else
  {
    v132 = CFAbsoluteTimeGetCurrent();
    SPLogForSPLogCategoryDefault();
    v133 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v133, OS_LOG_TYPE_DEFAULT, "No more fast data stores, waiting for parsec", buf, 2u);
    }

    location = 0;
    objc_initWeak(&location, v62);
    v134 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    *(_OWORD *)buf = *(_OWORD *)v134;
    *(_OWORD *)&buf[16] = *(_OWORD *)(v134 + 16);
    v210 = *(_QWORD *)(v134 + 32);
    v135 = MEMORY[0x24BDAC760];
    v182[0] = MEMORY[0x24BDAC760];
    v182[1] = 3221225472;
    v182[2] = __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_292;
    v182[3] = &unk_24F01B228;
    v184 = *(_OWORD *)buf;
    v185 = *(_OWORD *)&buf[16];
    v186 = v210;
    objc_copyWeak(&v183, &location);
    v136 = (void (**)(id, _QWORD))MEMORY[0x22E2A214C](v182);
    v137 = v132 - v62->_storeStartTime;
    if (v137 >= v62->_timeOut)
    {
      SPLogForSPLogCategoryDefault();
      v152 = objc_claimAutoreleasedReturnValue();
      v153 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v152, v153))
      {
        *(_WORD *)v181 = 0;
        _os_log_impl(&dword_2279CC000, v152, v153, "No more fast data stores, send", v181, 2u);
      }

      v154 = v62->_timer;
      if (v154)
      {
        dispatch_source_cancel(v154);
        dispatch_source_set_event_handler((dispatch_source_t)v62->_timer, 0);
        v155 = v62->_timer;
        v62->_timer = 0;

      }
      v136[2](v136, 0);
      v62->_parsecCameLaterThanSRT = 1;
      v62->_shouldRecomputeSuggestions = 1;
    }
    else
    {
      SPLogForSPLogCategoryDefault();
      v138 = objc_claimAutoreleasedReturnValue();
      v139 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (os_log_type_enabled(v138, v139))
      {
        *(_WORD *)v181 = 0;
        _os_log_impl(&dword_2279CC000, v138, v139, "No more fast data stores, within parsec timeout", v181, 2u);
      }

      timeOut = (double)SSPriorityIndexDelayMilliseconds() / 1000.0;
      v141 = v137 < timeOut && !v62->_sentPriority;
      v142 = !v141;
      if (!v141)
      {
        if (!v62->_sentPriority)
        {
          SPLogForSPLogCategoryDefault();
          v143 = objc_claimAutoreleasedReturnValue();
          v144 = 2 * (*MEMORY[0x24BE84AF8] == 0);
          if (os_log_type_enabled(v143, v144))
          {
            *(_WORD *)v181 = 0;
            _os_log_impl(&dword_2279CC000, v143, v144, "Send for CoreSpotlight priority path", v181, 2u);
          }

          v136[2](v136, 1);
        }
        timeOut = v62->_timeOut;
      }
      -[SPQueryTask queryProcessor](v62, "queryProcessor");
      v145 = objc_claimAutoreleasedReturnValue();
      v146 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v145);
      v147 = v62->_timer;
      v62->_timer = (OS_dispatch_source *)v146;

      v148 = v62->_timer;
      v149 = dispatch_time(0, (unint64_t)((timeOut - v137) * 1000000000.0));
      dispatch_source_set_timer(v148, v149, 0xFFFFFFFFFFFFFFFFLL, 0);
      v150 = (void *)objc_msgSend(v136, "copy");

      v151 = v62->_timer;
      handler[0] = v135;
      handler[1] = 3221225472;
      handler[2] = __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_306;
      handler[3] = &unk_24F01B250;
      v136 = v150;
      v179 = v136;
      v180 = v142;
      dispatch_source_set_event_handler(v151, handler);
      dispatch_resume((dispatch_object_t)v62->_timer);

    }
    objc_destroyWeak(&v183);
    objc_destroyWeak(&location);
  }

LABEL_163:
  return 0;
}

uint64_t __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "rankingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rankingItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || !v6)
  {
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isServerAlternativeResult") & 1) != 0
    || (objc_msgSend(v6, "isServerAlternativeResult") & 1) == 0)
  {
    if (objc_msgSend(v5, "isServerAlternativeResult")
      && !objc_msgSend(v6, "isServerAlternativeResult"))
    {
      v7 = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v7 = -1;
LABEL_9:

  return v7;
}

void __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_292(uint64_t a1, char a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  char *WeakRetained;
  void *v9;
  char v10;
  __int128 v11;
  uint64_t v12;
  uint64_t spanid;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  dispatch_source_t *v17;
  NSObject *v18;
  double v19;
  NSObject *v20;
  const char *v21;
  char v22;
  NSObject *v23;
  void *v24;
  char v25;
  id *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  NSObject *v35;
  dispatch_time_t v36;
  char *v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v4 = *(_OWORD *)(v3 + 16);
  v48 = *(_OWORD *)v3;
  v49 = v4;
  v50 = *(_QWORD *)(v3 + 32);
  v6 = *(_QWORD *)(v5 + 72);
  v7 = *(_OWORD *)(v5 + 56);
  *(_OWORD *)v3 = *(_OWORD *)(v5 + 40);
  *(_OWORD *)(v3 + 16) = v7;
  v38 = v3;
  *(_QWORD *)(v3 + 32) = v6;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(v5 + 32));
  if (WeakRetained)
  {
    v37 = WeakRetained;
    objc_msgSend(WeakRetained, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cancelled");

    WeakRetained = v37;
    if ((v10 & 1) == 0)
    {
      v11 = *(_OWORD *)(v38 + 16);
      v45 = *(_OWORD *)v38;
      v46 = v11;
      v47 = *(_QWORD *)(v38 + 32);
      v12 = *(_QWORD *)v38;
      spanid = si_tracing_calc_next_spanid();
      v14 = *(_QWORD *)(v38 + 8);
      *(_QWORD *)v38 = v12;
      *(_QWORD *)(v38 + 8) = spanid;
      *(_QWORD *)(v38 + 16) = v14;
      *(_BYTE *)(v38 + 28) = 102;
      *(_QWORD *)(v38 + 32) = "sendResultsBlock";
      si_tracing_log_span_begin();
      SPLogForSPLogCategoryQuery();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x24BE84B00] ^ 1;
      if (os_log_type_enabled(v15, v16))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2279CC000, v15, v16, "Show local results while waiting for slow queries", buf, 2u);
      }

      if ((a2 & 1) == 0)
      {
        AnalyticsSendEventLazy();
        v17 = (dispatch_source_t *)(v37 + 232);
        if (!*((_QWORD *)v37 + 29))
        {
          v22 = 0;
          goto LABEL_22;
        }
        goto LABEL_20;
      }
      v17 = (dispatch_source_t *)(v37 + 232);
      if (!*((_QWORD *)v37 + 29))
      {
        v22 = 1;
        goto LABEL_22;
      }
      SPLogForSPLogCategoryDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2279CC000, v18, OS_LOG_TYPE_DEFAULT, "Timer fired for CoreSpotlight priority path", buf, 2u);
      }

      v19 = CFAbsoluteTimeGetCurrent() - *((double *)v37 + 27);
      if (v19 >= *((double *)v37 + 28))
      {
        SPLogForSPLogCategoryDefault();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:

LABEL_20:
          dispatch_source_cancel(*v17);
          dispatch_source_set_event_handler(*v17, 0);
          v22 = 0;
          v23 = *v17;
          *v17 = 0;
LABEL_21:

LABEL_22:
          objc_msgSend(v37, "query");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "cancelled");

          if ((v25 & 1) == 0)
          {
            if ((v22 & 1) == 0 && !objc_msgSend(*((id *)v37 + 60), "count"))
            {
              objc_msgSend(v37, "sendFinishedDomains:reason:", 1, 1);
              v37[278] = 1;
              v37[283] = 1;
              goto LABEL_27;
            }
            objc_msgSend(v37, "sendFinishedDomains:", 4);
          }
          if ((v22 & 1) != 0)
          {
LABEL_37:
            si_tracing_log_span_end();
            v33 = v46;
            *(_OWORD *)v38 = v45;
            *(_OWORD *)(v38 + 16) = v33;
            *(_QWORD *)(v38 + 32) = v47;
            WeakRetained = v37;
            goto LABEL_38;
          }
LABEL_27:
          v26 = v37;
          objc_sync_enter(v26);
          if (objc_msgSend(v26[63], "count"))
          {
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            obj = v26[63];
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
            if (v27)
            {
              v28 = *(_QWORD *)v41;
              do
              {
                for (i = 0; i != v27; ++i)
                {
                  if (*(_QWORD *)v41 != v28)
                    objc_enumerationMutation(obj);
                  v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                  objc_msgSend(v30, "start");
                  v31 = v26[62];
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "searchDomain"));
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "addObject:", v32);

                  objc_msgSend(v26[63], "removeObject:", v30);
                }
                v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
              }
              while (v27);
            }

          }
          objc_sync_exit(v26);

          goto LABEL_37;
        }
        *(_WORD *)buf = 0;
        v21 = "Don't reset timer for CoreParsec; past deadline";
      }
      else
      {
        if (!objc_msgSend(*((id *)v37 + 60), "count"))
        {
          v35 = *v17;
          v36 = dispatch_time(0, (uint64_t)((*((double *)v37 + 28) - v19) * 1000000000.0));
          dispatch_source_set_timer(v35, v36, 0xFFFFFFFFFFFFFFFFLL, 0);
          SPLogForSPLogCategoryDefault();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2279CC000, v23, OS_LOG_TYPE_DEFAULT, "Reset timer for CoreParsec", buf, 2u);
          }
          v22 = 1;
          goto LABEL_21;
        }
        SPLogForSPLogCategoryDefault();
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        *(_WORD *)buf = 0;
        v21 = "Don't reset timer for CoreParsec; other waiting stores exist";
      }
      _os_log_impl(&dword_2279CC000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
      goto LABEL_19;
    }
  }
LABEL_38:

  v34 = v49;
  *(_OWORD *)v38 = v48;
  *(_OWORD *)(v38 + 16) = v34;
  *(_QWORD *)(v38 + 32) = v50;
}

void *__76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_296()
{
  return &unk_24F024F88;
}

uint64_t __76__SPFederatedQueryTask_storeCompletedSearch_withSections_suggestionResults___block_invoke_306(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)storeCompletedSearch:(id)a3 withSections:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  -[SPQueryTask query](self, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cancelled");

  v10 = (v9 & 1) == 0
     && -[SPFederatedQueryTask storeCompletedSearch:withSections:suggestionResults:](self, "storeCompletedSearch:withSections:suggestionResults:", v6, v7, 0);

  return v10;
}

+ (BOOL)isCJK
{
  if (isCJK_onceToken != -1)
    dispatch_once(&isCJK_onceToken, &__block_literal_global_307);
  return isCJK_sIsCJK;
}

void __29__SPFederatedQueryTask_isCJK__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("ja")) & 1) != 0
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("zh")) & 1) != 0
    || objc_msgSend(v2, "hasPrefix:", CFSTR("ko")))
  {
    isCJK_sIsCJK = 1;
  }

}

- (id)correctedQueryWithCorrection:(id)a3
{
  objc_class *v4;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SPFederatedQueryTask *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;

  v4 = (objc_class *)MEMORY[0x24BEB0280];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSearchString:", v5);

  -[SPQueryTask query](self, "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWhyQuery:", 18);
  objc_msgSend(v6, "setQueryKind:", 10);
  -[SPQueryTask query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryIdent:", objc_msgSend(v9, "queryIdent"));

  objc_msgSend(v8, "keyboardLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardLanguage:", v10);

  objc_msgSend(v8, "keyboardPrimaryLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardPrimaryLanguage:", v11);

  objc_msgSend(v8, "scaleFactor");
  objc_msgSend(v6, "setScaleFactor:");
  objc_msgSend(v8, "searchDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchDomains:", v12);

  objc_msgSend(v8, "disabledDomains");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisabledDomains:", v13);

  -[SPQueryTask query](self, "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "disabledApps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisabledApps:", v15);

  -[SPQueryTask query](self, "query");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "disabledBundles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisabledBundles:", v17);

  objc_msgSend(v8, "markedTextArray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMarkedTextArray:", v18);

  -[SPQueryTask query](self, "query");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPromoteLocalResults:", objc_msgSend(v19, "promoteLocalResults"));

  -[SPQueryTask query](self, "query");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPromoteParsecResults:", objc_msgSend(v20, "promoteParsecResults"));

  -[SPQueryTask query](self, "query");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNoTokenize:", objc_msgSend(v21, "noTokenize"));

  objc_msgSend(v6, "setDeviceAuthenticationState:", objc_msgSend(v8, "deviceAuthenticationState"));
  objc_msgSend(v8, "queryUnderstandingOutput");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryUnderstandingOutput:", v22);

  -[SPFederatedQueryTask clientBundleID](self, "clientBundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClientBundleID:", v23);

  v24 = -[SPFederatedQueryTask initWithQueryContext:externalID:]([SPFederatedQueryTask alloc], "initWithQueryContext:externalID:", v6, -[SPFederatedQueryTask externalID](self, "externalID"));
  -[SPQueryTask query](self, "query");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "queryContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFederatedQueryTask setPreviousQueryKind:](v24, "setPreviousQueryKind:", objc_msgSend(v26, "queryKind"));

  -[SPQueryTask query](self, "query");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "infinitePatience");
  -[SPQueryTask query](v24, "query");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setInfinitePatience:", v28);

  -[SPQueryTask query](self, "query");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "noTokenize");
  -[SPQueryTask query](v24, "query");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setNoTokenize:", v31);

  -[SPQueryTask query](self, "query");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "promoteParsecResults");
  -[SPQueryTask query](v24, "query");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setPromoteParsecResults:", v34);

  -[SPQueryTask query](self, "query");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "promoteLocalResults");
  -[SPQueryTask query](v24, "query");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setPromoteLocalResults:", v37);

  -[SPQueryTask query](self, "query");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "contentFilters");
  -[SPQueryTask query](v24, "query");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setContentFilters:", v40);

  -[SPQueryTask query](self, "query");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "maxCount");
  -[SPQueryTask query](v24, "query");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setMaxCount:", v43);

  -[SPFederatedQueryTask message](self, "message");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFederatedQueryTask setMessage:](v24, "setMessage:", v45);

  -[SPQueryTask query](self, "query");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isWideScreen");
  -[SPQueryTask query](v24, "query");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setIsWideScreen:", v47);

  -[SPQueryTask query](self, "query");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "internalDebug");
  -[SPQueryTask query](v24, "query");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setInternalDebug:", v50);

  -[SPFederatedQueryTask setIsRewrite:](v24, "setIsRewrite:", 1);
  return v24;
}

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  -[SPFederatedQueryTask message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsReply");

  if (v4)
  {
    -[SPFederatedQueryTask message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendReply:", MEMORY[0x24BDBD1B8]);

  }
  -[SPQueryTask query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cancelled");

  if (v7)
    query_analytics_log_complete(self, "cancel", self->_startTime);
  v8.receiver = self;
  v8.super_class = (Class)SPFederatedQueryTask;
  -[SPFederatedQueryTask dealloc](&v8, sel_dealloc);
}

- (id)waitForQueryCorrections
{
  NSObject *correctionsSem;
  dispatch_time_t v4;

  correctionsSem = self->_correctionsSem;
  v4 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(correctionsSem, v4);
  return self->_corrections;
}

- (void)addQueryCorrections:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_corrections, a3);
  v5 = a3;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_correctionsSem);

}

- (BOOL)parsecAvailable
{
  BOOL result;

  if (!self->_parsecEnabled)
    return 0;
  result = -[SPParsecQuery available](self->_parsecQuery, "available");
  self->_parsecEnabled = result;
  return result;
}

- (void)_processResponse:(id)a3 toQuery:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "kind") == 2 || objc_msgSend(v9, "kind") == 3)
  {
    objc_msgSend(v9, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localSuggestionResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPFederatedQueryTask storeSearchProgress:withSections:suggestionResults:](self, "storeSearchProgress:withSections:suggestionResults:", v6, v7, v8);
  }
  else
  {
    objc_msgSend(v9, "sections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localSuggestionResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPFederatedQueryTask storeCompletedSearch:withSections:suggestionResults:](self, "storeCompletedSearch:withSections:suggestionResults:", v6, v7, v8);
  }

}

- (void)queryTask:(id)a3 gotResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  dispatch_block_t v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SPQueryTask queryProcessor](self, "queryProcessor");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SPFederatedQueryTask_queryTask_gotResponse___block_invoke;
  block[3] = &unk_24F01B298;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
  dispatch_async(v8, v11);

}

uint64_t __46__SPFederatedQueryTask_queryTask_gotResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processResponse:toQuery:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)addAndStartQuery
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  NSUInteger v22;
  NSString *lastQuery;
  __CFString *v24;
  NSString *v25;
  NSString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  NSString *v33;
  char v34;
  char v35;
  int v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  int v43;
  int *v44;
  id v45;
  void *v46;
  char v47;
  NSObject *v48;
  os_log_type_t v49;
  double v50;
  const char *v51;
  NSObject *v52;
  os_log_type_t v53;
  NSArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  os_log_type_t v67;
  qos_class_t v68;
  void *v69;
  id v70;
  dispatch_block_t v71;
  __int128 v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  _QWORD block[5];
  id v78;
  id v79;
  id v80[2];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  id (*v91)(uint64_t);
  void *v92;
  NSUInteger v93;
  uint64_t v94;
  uint64_t v95;
  id (*v96)(uint64_t);
  void *v97;
  id v98;
  __CFString *v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE buf[12];
  __int16 v106;
  void *v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v3 = ((uint64_t (*)(_QWORD, SEL))*MEMORY[0x24BE66888])(MEMORY[0x24BE66888], a2);
  v4 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v5 + 160) = *(_OWORD *)v3;
  *(_OWORD *)(v5 + 176) = v4;
  v102 = *(_QWORD *)(v3 + 32);
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "-[SPFederatedQueryTask addAndStartQuery]";
  si_tracing_log_span_begin();
  if ((sPrepareCacheForSearchContinuationStarted & 1) == 0)
  {
    sPrepareCacheForSearchContinuationStarted = 1;
    objc_msgSend((id)objc_opt_class(), "prepareCacheForSearchContinuation");
  }
  -[SPFederatedQueryTask startSetup](self, "startSetup");
  -[SPQueryTask query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "queryContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = v10;
  objc_msgSend(v10, "searchEntities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v10, "searchEntities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentSearchString");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "searchString");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }

  SPLogForSPLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v14, v15))
  {
    objc_msgSend(v10, "searchDomains");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v75;
    v106 = 2112;
    v107 = v16;
    _os_log_impl(&dword_2279CC000, v14, v15, "#query Starting query for %@ on domains %@", buf, 0x16u);

  }
  SPLogForSPLogCategoryDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v17, v18))
  {
    objc_msgSend(v10, "searchDomains");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v75;
    v106 = 2112;
    v107 = v19;
    _os_log_impl(&dword_2279CC000, v17, v18, "#query Starting query '%@' on domains:%@", buf, 0x16u);

  }
  if (-[NSString isEqual:](self->_clientBundleID, "isEqual:", *MEMORY[0x24BE84AC0]))
  {
    if (objc_msgSend(v75, "length"))
    {
      if (-[NSString length](self->_lastQuery, "length")
        && ((objc_msgSend(v75, "hasPrefix:", self->_lastQuery) & 1) != 0
         || -[NSString hasPrefix:](self->_lastQuery, "hasPrefix:", v75)))
      {
        v20 = objc_msgSend(v75, "length");
        v21 = -[NSString length](self->_lastQuery, "length");
        v22 = v20 - v21;
        if ((uint64_t)(v20 - v21) < 0)
          v22 = v21 - v20;
        v89 = MEMORY[0x24BDAC760];
        v90 = 3221225472;
        v91 = __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_2;
        v92 = &__block_descriptor_40_e19___NSDictionary_8__0l;
        v93 = v22;
        AnalyticsSendEventLazy();
      }
      else
      {
        lastQuery = self->_lastQuery;
        if (lastQuery)
        {
          -[NSString commonPrefixWithString:options:](lastQuery, "commonPrefixWithString:options:", v75, 2);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = &stru_24F01C208;
        }
        v94 = MEMORY[0x24BDAC760];
        v95 = 3221225472;
        v96 = __40__SPFederatedQueryTask_addAndStartQuery__block_invoke;
        v97 = &unk_24F01B2C0;
        v98 = v75;
        v99 = v24;
        AnalyticsSendEventLazy();

      }
    }
    v25 = (NSString *)objc_msgSend(v75, "copy");
    v26 = self->_lastQuery;
    self->_lastQuery = v25;

  }
  v74 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  objc_msgSend(v10, "searchDomains");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "arrayByAddingObject:", &unk_24F025058);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "arrayByAddingObject:", &unk_24F025070);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v10, "deviceAuthenticationState");
  if (objc_msgSend(v75, "length")
    || (objc_msgSend(v10, "searchEntities"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(v30, "count") == 0,
        v30,
        !v31))
  {
    v32 = objc_msgSend(v76, "queryKind");
    v33 = self->_clientBundleID;
    if (_os_feature_enabled_impl())
    {

LABEL_34:
      -[SPFederatedQueryTask _queriesForSearchTool](self, "_queriesForSearchTool");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v38 = v37;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
      if (!v39)
        goto LABEL_52;
      v40 = *(_QWORD *)v86;
      while (1)
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v86 != v40)
            objc_enumerationMutation(v38);
          v42 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          objc_msgSend(v42, "setDelegate:", self);
          v43 = objc_msgSend((id)objc_opt_class(), "searchDomain");
          if (!v29 && v43 == 6)
          {
            -[SPFederatedQueryTask addDelayedStartQuery:](self, "addDelayedStartQuery:", v42);
            continue;
          }
          if (v43 == 1)
          {
            v44 = &OBJC_IVAR___SPFederatedQueryTask__csQuery;
          }
          else
          {
            if (v43 != 2)
              continue;
            v44 = &OBJC_IVAR___SPFederatedQueryTask__parsecQuery;
          }
          objc_storeStrong((id *)((char *)&self->super.super.isa + *v44), v42);
        }
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
        if (!v39)
        {
LABEL_52:

          objc_msgSend(v38, "removeObjectsInArray:", self->_delayedStartQueries);
          -[SPFederatedQueryTask setQueries:](self, "setQueries:", v38);

          goto LABEL_53;
        }
      }
    }
    if (-[NSString hasPrefix:](v33, "hasPrefix:", CFSTR("com.apple.omniSearch"))
      || -[NSString hasPrefix:](v33, "hasPrefix:", CFSTR("com.apple.intelligenceflow"))
      || ((v34 = -[NSString hasPrefix:](v33, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v32 == 12)
        ? (v35 = 1)
        : (v35 = v34),
          (v35 & 1) != 0))
    {
      v36 = _os_feature_enabled_impl();

      if (v36)
        goto LABEL_34;
    }
    else
    {

    }
    -[SPFederatedQueryTask _queriesForUserQuery:](self, "_queriesForUserQuery:", v29 != 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
LABEL_53:
  if (-[NSArray count](self->_queries, "count"))
  {
    v45 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[SPQueryTask query](self, "query");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "infinitePatience");

    if ((v47 & 1) != 0)
    {
      SPLogForSPLogCategoryDefault();
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      v50 = 0.0;
      if (!os_log_type_enabled(v48, v49))
      {
LABEL_80:

        self->_parsecEnabled = +[SPParsecQuery isParsecEnabled](SPParsecQuery, "isParsecEnabled");
        -[SPQueryTask query](self, "query");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCSSearchQuery setMaxCount:](self->_csQuery, "setMaxCount:", objc_msgSend(v62, "maxCount"));

        -[SPQueryTask query](self, "query");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCSSearchQuery setContentFilters:](self->_csQuery, "setContentFilters:", objc_msgSend(v63, "contentFilters"));

        -[SPFederatedQueryTask itemRanker](self, "itemRanker");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCSSearchQuery setItemRanker:](self->_csQuery, "setItemRanker:", v64);

        -[SPCSSearchQuery setPreviousQueryKind:](self->_csQuery, "setPreviousQueryKind:", self->_previousQueryKind);
        -[SPCSSearchQuery setIsCJK:](self->_csQuery, "setIsCJK:", self->_isCJK);
        -[SPCSSearchQuery setIsPeopleSearch:](self->_csQuery, "setIsPeopleSearch:", self->_isPeopleSearch);
        -[SPCSSearchQuery setIsPhotosSearch:](self->_csQuery, "setIsPhotosSearch:", self->_isPhotosSearch);
        -[SPCSSearchQuery setParsecAvailable:](self->_csQuery, "setParsecAvailable:", -[SPFederatedQueryTask parsecAvailable](self, "parsecAvailable"));
        -[SPQueryTask query](self, "query");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "currentTime");
        -[SPCSSearchQuery setCurrentTime:](self->_csQuery, "setCurrentTime:");

        SPLogForSPLogCategoryDefault();
        v66 = objc_claimAutoreleasedReturnValue();
        v67 = 2 * (*MEMORY[0x24BE84AF8] == 0);
        if (os_log_type_enabled(v66, v67))
        {
          v68 = qos_class_self();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v68;
          _os_log_impl(&dword_2279CC000, v66, v67, "QOS addAndStartQuery: %d", buf, 8u);
        }

        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        -[SPQueryTask queryProcessor](self, "queryProcessor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_325;
        block[3] = &unk_24F01B330;
        objc_copyWeak(v80, (id *)buf);
        block[4] = self;
        v80[1] = *(id *)&v50;
        v70 = v45;
        v78 = v70;
        v79 = v75;
        v71 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
        tracing_dispatch_async();

        objc_destroyWeak(v80);
        objc_destroyWeak((id *)buf);

        goto LABEL_83;
      }
      *(_WORD *)buf = 0;
      v51 = "Query with infinite patience";
    }
    else
    {
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v54 = self->_queries;
      v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
      if (v55)
      {
        v56 = *(_QWORD *)v82;
        v50 = 0.0;
        do
        {
          for (j = 0; j != v55; ++j)
          {
            if (*(_QWORD *)v82 != v56)
              objc_enumerationMutation(v54);
            v58 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v58, "timeOut:", objc_msgSend((id)objc_opt_class(), "searchDomain") == 7);
              v60 = v59;
              if (v59 > 0.0)
              {
                objc_msgSend(v45, "addObject:", v58);
                if (v60 >= v50)
                  v61 = v50;
                else
                  v61 = v60;
                if (v50 <= 0.0)
                  v50 = v60;
                else
                  v50 = v61;
              }
            }
          }
          v55 = -[NSArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
        }
        while (v55);
      }
      else
      {
        v50 = 0.0;
      }

      SPLogForSPLogCategoryDefault();
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = 2 * (*MEMORY[0x24BE84AF8] == 0);
      if (!os_log_type_enabled(v48, v49))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      v51 = "Query with timeout";
    }
    _os_log_impl(&dword_2279CC000, v48, v49, v51, buf, 2u);
    goto LABEL_80;
  }
  SPLogForSPLogCategoryQuery();
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v52, v53))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v52, v53, "#query No stores for query!", buf, 2u);
  }

  -[SPFederatedQueryTask sendQueryCompleted](self, "sendQueryCompleted");
LABEL_83:

  si_tracing_log_span_end();
  v72 = v101;
  *(_OWORD *)v3 = v100;
  *(_OWORD *)(v3 + 16) = v72;
  *(_QWORD *)(v3 + 32) = v102;
}

id __40__SPFederatedQueryTask_addAndStartQuery__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("keystrokes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "length") - objc_msgSend(*(id *)(a1 + 40), "length"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("keystrokes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_325(uint64_t a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t spanid;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v15 = *(_OWORD *)v3;
  v16 = *(_OWORD *)(v3 + 16);
  v17 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v6 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v4;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v6;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "SDClient:  Starting query";
  si_tracing_log_span_begin();
  v7 = objc_alloc(MEMORY[0x24BE84DB8]);
  objc_msgSend(*(id *)(a1 + 32), "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.backend.stores.start"), 0, objc_msgSend(v8, "queryIdent"));

  objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendFeedbackType:feedback:queryId:clientID:", 21, v9, objc_msgSend(v11, "queryIdent"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));

  if (*(double *)(a1 + 64) > 0.0)
    objc_msgSend(*(id *)(a1 + 32), "setTimeout:");
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[80], "count");
    v12 = WeakRetained;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    tracing_dispatch_apply();

  }
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v15;
  *(_OWORD *)(v3 + 16) = v16;
  *(_QWORD *)(v3 + 32) = v17;

}

__n128 __40__SPFederatedQueryTask_addAndStartQuery__block_invoke_2_329(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t spanid;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __n128 result;
  __n128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v16 = *(__n128 *)v4;
  v17 = *(_OWORD *)(v4 + 16);
  v18 = *(_QWORD *)(v4 + 32);
  v5 = *(_QWORD *)v4;
  spanid = si_tracing_calc_next_spanid();
  v7 = *(_QWORD *)(v4 + 8);
  *(_QWORD *)v4 = v5;
  *(_QWORD *)(v4 + 8) = spanid;
  *(_QWORD *)(v4 + 16) = v7;
  *(_BYTE *)(v4 + 28) = 102;
  *(_QWORD *)(v4 + 32) = "SDClient:  Issuing query for store";
  si_tracing_log_span_begin();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 640), "objectAtIndex:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cancelled");

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x22E2A1F9C]();
    objc_msgSend(v8, "activate");
    objc_msgSend(v8, "start");
    if (objc_msgSend(v8, "isStarted"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "searchDomain"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
      v13 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v8);
      v14 = *(void **)(a1 + 40);
      if (v13)
        objc_msgSend(v14, "addSlowQueryToken:", v12);
      else
        objc_msgSend(v14, "addQueryToken:", v12);
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));

    }
    objc_autoreleasePoolPop(v11);
  }

  si_tracing_log_span_end();
  result = v16;
  *(__n128 *)v4 = v16;
  *(_OWORD *)(v4 + 16) = v17;
  *(_QWORD *)(v4 + 32) = v18;
  return result;
}

+ (id)contactEntityFromQueryContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "searchEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isContactEntitySearch"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)initForSession:(id)a3 withQuery:(id)a4
{
  id v6;
  id v7;
  SPFederatedQueryTask *v8;
  SPFederatedQueryTask *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *clientBundleID;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  NSMutableArray *tokens;
  uint64_t v22;
  NSMutableArray *slowTokens;
  uint64_t v24;
  NSMutableArray *delayedStartQueries;
  uint64_t v26;
  NSMutableArray *delayedStartTokens;
  uint64_t v28;
  NSMutableArray *finishedTokens;
  NSMutableDictionary *v30;
  NSMutableDictionary *categoryToResultMapping;
  uint64_t v32;
  NSMutableOrderedSet *sectionOrderByInsertion;
  void *v34;
  void *v35;
  void *v36;
  dispatch_semaphore_t v37;
  OS_dispatch_semaphore *correctionsSem;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  char v49;
  int *v50;
  char v51;
  char v52;
  BOOL *p_isNLPSearch;
  void *v54;
  void *v55;
  char v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  id v64;
  char v65;
  uint64_t v66;
  SSRankingManager *rankingManager;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  _BOOL8 isCJK;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  char isKindOfClass;
  void *v85;
  void *v86;
  uint64_t v87;
  NSArray *preferredBundleIDs;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[SPQueryTask init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[SPQueryTask setQuery:](v8, "setQuery:", v7);
    -[SPFederatedQueryTask setSession:](v9, "setSession:", v6);
    -[SPQueryTask query](v9, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPFederatedQueryTask _updateQueryContext:](v9, "_updateQueryContext:", v10);

    objc_msgSend(v7, "queryContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE84DB8]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.backend.query.start"), 0, objc_msgSend(v11, "queryIdent"));
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE84DB8]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.backend.suggestions.start"), 0, objc_msgSend(v11, "queryIdent"));
    v14 = objc_msgSend(v11, "queryIdent");
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    clientBundleID = v9->_clientBundleID;
    v9->_clientBundleID = (NSString *)v16;

    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)v12;
    objc_msgSend(v18, "sendFeedbackType:feedback:queryId:clientID:", 21, v12, v14, v9->_clientBundleID);
    v91 = v18;
    v92 = (void *)v13;
    v90 = v14;
    objc_msgSend(v18, "sendFeedbackType:feedback:queryId:clientID:", 21, v13, v14, v9->_clientBundleID);
    do
      v19 = __ldaxr(&__queryTokenGen);
    while (__stlxr(v19 + 1, &__queryTokenGen));
    v9->_externalID = v19;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
    tokens = v9->_tokens;
    v9->_tokens = (NSMutableArray *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
    slowTokens = v9->_slowTokens;
    v9->_slowTokens = (NSMutableArray *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
    delayedStartQueries = v9->_delayedStartQueries;
    v9->_delayedStartQueries = (NSMutableArray *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
    delayedStartTokens = v9->_delayedStartTokens;
    v9->_delayedStartTokens = (NSMutableArray *)v26;

    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 8);
    finishedTokens = v9->_finishedTokens;
    v9->_finishedTokens = (NSMutableArray *)v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    categoryToResultMapping = v9->_categoryToResultMapping;
    v9->_categoryToResultMapping = v30;

    v32 = objc_opt_new();
    sectionOrderByInsertion = v9->_sectionOrderByInsertion;
    v9->_sectionOrderByInsertion = (NSMutableOrderedSet *)v32;

    v94 = v7;
    objc_msgSend(v7, "queryContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "disabledDomains");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_parsecSettingEnabled = objc_msgSend(v35, "containsObject:", &unk_24F025028) ^ 1;

    +[SPParsecQuery parsecEnabled:](SPParsecQuery, "parsecEnabled:", v9->_parsecSettingEnabled);
    v36 = (void *)objc_opt_new();
    -[SPFederatedQueryTask setCategoryEngagements:](v9, "setCategoryEngagements:", v36);

    v9->_isRewrite = 0;
    v9->_isNLPSearch = 0;
    v37 = dispatch_semaphore_create(0);
    correctionsSem = v9->_correctionsSem;
    v9->_correctionsSem = (OS_dispatch_semaphore *)v37;

    objc_msgSend(v11, "searchString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchEntities");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "count");

    v97 = v11;
    v95 = v6;
    if (v41)
    {
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      objc_msgSend(v11, "searchEntities");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
      if (!v43)
        goto LABEL_22;
      v44 = v43;
      v45 = *(_QWORD *)v99;
      while (1)
      {
        v46 = 0;
        v47 = v39;
        do
        {
          if (*(_QWORD *)v99 != v45)
            objc_enumerationMutation(v42);
          v48 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v46);
          v49 = objc_msgSend(v48, "isAppEntitySearch");
          v50 = &OBJC_IVAR___SPFederatedQueryTask__isScopedAppSearch;
          if ((v49 & 1) != 0
            || (v51 = objc_msgSend(v48, "isContactEntitySearch"),
                v50 = &OBJC_IVAR___SPFederatedQueryTask__isPeopleSearch,
                (v51 & 1) != 0)
            || (v52 = objc_msgSend(v48, "isPhotosEntitySearch"),
                v50 = &OBJC_IVAR___SPFederatedQueryTask__isPhotosSearch,
                (v52 & 1) != 0))
          {
            p_isNLPSearch = (BOOL *)v9 + *v50;
LABEL_14:
            *p_isNLPSearch = 1;
            goto LABEL_15;
          }
          v56 = objc_msgSend(v48, "isNLPEntitySearch");
          p_isNLPSearch = &v9->_isNLPSearch;
          if ((v56 & 1) != 0)
            goto LABEL_14;
LABEL_15:
          if (objc_msgSend(v48, "isCommandEntitySearch"))
          {
            v9->_isEntitySearch = 1;
            -[SPQueryTask query](v9, "query");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setInfinitePatience:", 1);

          }
          objc_msgSend(v97, "searchString");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "updateSearchString:", v55);

          objc_msgSend(v48, "currentSearchString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          ++v46;
          v47 = v39;
        }
        while (v44 != v46);
        v57 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
        v44 = v57;
        if (!v57)
        {
LABEL_22:

          v11 = v97;
          break;
        }
      }
    }
    objc_msgSend(v11, "keyboardPrimaryLanguage");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "lowercaseString");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v59, "hasPrefix:", CFSTR("en"))
      || (v62 = objc_msgSend(v61, "hasPrefix:", CFSTR("en")), v63 = v61, v62))
    {
      v63 = v59;
    }
    v64 = v63;
    v96 = v61;
    if (+[SPFederatedQueryTask isCJK](SPFederatedQueryTask, "isCJK")
      || (objc_msgSend(v59, "hasPrefix:", CFSTR("ja")) & 1) != 0
      || (objc_msgSend(v59, "hasPrefix:", CFSTR("zh")) & 1) != 0)
    {
      v65 = 1;
    }
    else
    {
      v65 = objc_msgSend(v59, "hasPrefix:", CFSTR("ko"));
    }
    v9->_isCJK = v65;
    objc_msgSend(MEMORY[0x24BEB02F0], "prepareTopHitsParametersForLanguage:", v64);
    v66 = objc_msgSend(objc_alloc(MEMORY[0x24BEB02F0]), "initWithQuery:", v39);
    rankingManager = v9->_rankingManager;
    v9->_rankingManager = (SSRankingManager *)v66;

    v68 = (void *)CFPreferencesCopyAppValue(CFSTR("SearchRankingUseCreationDateL2"), CFSTR("com.apple.searchd"));
    v69 = (void *)CFPreferencesCopyAppValue(CFSTR("SearchRankingL2YWeight"), CFSTR("com.apple.searchd"));
    if (v9->_isPeopleSearch)
    {
      -[SPFederatedQueryTask itemRanker](v9, "itemRanker");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setIsPeopleSearch:", 1);

    }
    v71 = objc_alloc(MEMORY[0x24BEB0238]);
    isCJK = v9->_isCJK;
    objc_msgSend(v68, "doubleValue");
    v74 = v73;
    objc_msgSend(v69, "doubleValue");
    v76 = v75;
    -[SPQueryTask query](v9, "query");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "currentTime");
    v79 = (void *)objc_msgSend(v71, "initWithSearchString:queryID:language:isCJK:experimentalWeight1:experimentalWeight2:currentTime:", v39, v90, v64, isCJK, v74, v76, v78);
    -[SPFederatedQueryTask setItemRanker:](v9, "setItemRanker:", v79);

    -[SPFederatedQueryTask setIsInternalDevice:](v9, "setIsInternalDevice:", os_variant_has_internal_diagnostics());
    v9->_parsecCameLaterThanSRT = 0;
    v9->_parsecEntityCameEarly = 0;
    v9->_shouldRecomputeSuggestions = 1;
    objc_msgSend(v97, "searchEntities");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "count");

    if (v81)
    {
      objc_msgSend(v97, "searchEntities");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "firstObject");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v97, "searchEntities");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "firstObject");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "preferredBundleIDs");
        v87 = objc_claimAutoreleasedReturnValue();
        preferredBundleIDs = v9->_preferredBundleIDs;
        v9->_preferredBundleIDs = (NSArray *)v87;

        v9->_enforcePreferredBundleIDs = 1;
      }
    }

    v7 = v94;
    v6 = v95;
  }

  return v9;
}

- (void)updateResultsWithContactHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  -[SPQueryTask previousQueryContext](self, "previousQueryContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contactEntityFromQueryContext:", v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPQueryTask query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "contactEntityFromQueryContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (updateResultsWithContactHeader_onceToken != -1)
    dispatch_once(&updateResultsWithContactHeader_onceToken, &__block_literal_global_345);
  if (updateResultsWithContactHeader_isPeopleViewService
    || v6 && (!v3 || (objc_msgSend(v6, "hasSameContactAsContactEntity:", v3) & 1) == 0))
  {
    v7 = objc_alloc(MEMORY[0x24BE84970]);
    v8 = (void *)objc_msgSend(v7, "initWithSections:", MEMORY[0x24BDBD1A8]);
    -[SPQueryTask query](self, "query");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:](self, "searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v9, v8, 1, 1, 0, 0, 0.0, v10, 0, 0, 0);

  }
}

void __54__SPFederatedQueryTask_updateResultsWithContactHeader__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  updateResultsWithContactHeader_isPeopleViewService = objc_msgSend(v0, "isEqualToString:", CFSTR("PeopleViewService"));

}

- (void)_updateQueryContext:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v3 = a3;
  v4 = objc_msgSend(v3, "queryIdent");
  objc_msgSend(v3, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryIdent:", v4);

  v6 = objc_msgSend(v3, "promoteLocalResults");
  objc_msgSend(v3, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPromoteLocalResults:", v6);

  v8 = objc_msgSend(v3, "promoteParsecResults");
  objc_msgSend(v3, "queryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPromoteParsecResults:", v8);

  objc_msgSend(v3, "disabledBundles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDisabledBundles:", v10);

  objc_msgSend(v3, "disabledApps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDisabledApps:", v12);

  v14 = objc_msgSend(v3, "internalValidation");
  objc_msgSend(v3, "queryContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInternalValidation:", v14);

  objc_msgSend(v3, "currentTime");
  v17 = v16;
  objc_msgSend(v3, "queryContext");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setCurrentTime:", v17);
}

- (void)start
{
  __assert_rtn("-[SPFederatedQueryTask start]", "SPFederatedQueryTask.m", 3866, "self.started == NO");
}

void __29__SPFederatedQueryTask_start__block_invoke(uint64_t a1)
{
  unsigned int *WeakRetained;
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "started"))
    __29__SPFederatedQueryTask_start__block_invoke_cold_1();
  SPLogForSPLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_2279CC000, v3, v4, "Started search on %@", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 32), "setMutableSections:", v8);

  v9 = objc_alloc(MEMORY[0x24BE84DB8]);
  objc_msgSend(*(id *)(a1 + 32), "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.searchd.frontend.query.start"), 0, objc_msgSend(v10, "queryIdent"));

  objc_msgSend(*(id *)(a1 + 32), "activate");
  objc_msgSend(*(id *)(a1 + 32), "addAndStartQuery");
  objc_msgSend(*(id *)(a1 + 32), "updateResultsWithContactHeader");
  if (WeakRetained)
  {
    SPLogForSPLogCategoryTelemetry();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = WeakRetained[48];
    if ((_DWORD)v14 && os_signpost_enabled(v12))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_2279CC000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "queryUI", " enableTelemetry=YES ", (uint8_t *)&v15, 2u);
    }

    kdebug_trace();
  }

}

- (void)activate
{
  NSObject *v2;
  os_log_type_t v3;
  uint8_t v4[16];

  if (self->_active)
  {
    SPLogForSPLogCategoryDefault();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BE84B00] ^ 1;
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2279CC000, v2, v3, "already active, ignoring", v4, 2u);
    }

  }
  else
  {
    self->_active = 1;
    objc_msgSend(MEMORY[0x24BEB0238], "preheat");
  }
}

- (void)clear
{
  NSObject *v3;
  dispatch_block_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[SPQueryTask queryProcessor](self, "queryProcessor");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__SPFederatedQueryTask_clear__block_invoke;
  v5[3] = &unk_24F01B3A0;
  objc_copyWeak(&v6, &location);
  v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v5);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __29__SPFederatedQueryTask_clear__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = WeakRetained[80];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "activate", (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    objc_msgSend(MEMORY[0x24BEB0238], "preheat");
  }

}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDC2430], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logWithBundleID:indexOperation:itemCount:reason:", CFSTR("com.apple.SpotlightUI"), 4, 1, CFSTR("UserInput"));

  -[SPQueryTask query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SPFederatedQueryTask queries](self, "queries", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "cancel");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[SPFederatedQueryTask activate](self, "activate");
}

+ (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  sPrepareCacheForSearchContinuationStarted = 1;
  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SPFederatedQueryTask_activate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

  MEMORY[0x22E2A1BA0]();
  +[SPCSSearchQuery activate](SPCSSearchQuery, "activate");
  +[SPDictionaryQuery activate](SPDictionaryQuery, "activate");
}

uint64_t __32__SPFederatedQueryTask_activate__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAllParametersForClient:", CFSTR("Spotlight"));

  if (!sSRResources)
  {
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "resourcesForClient:options:", CFSTR("Spotlight"), &unk_24F024FB0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sSRResources;
    sSRResources = v2;

    SSDefaultsSetResources();
  }
  objc_msgSend(MEMORY[0x24BEB02F0], "reloadRankingParametersFromTrial");
  objc_msgSend(MEMORY[0x24BEB0238], "preheat");
  objc_msgSend(MEMORY[0x24BEB0210], "sharedModelManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activate");

  return objc_msgSend((id)objc_opt_class(), "prepareCacheForSearchContinuation");
}

+ (void)deactivate
{
  NSObject *v2;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_367);

  MEMORY[0x22E2A1B94]();
  +[SPCSSearchQuery deactivate](SPCSSearchQuery, "deactivate");
  +[SPDictionaryQuery deactivate](SPDictionaryQuery, "deactivate");
}

uint64_t __34__SPFederatedQueryTask_deactivate__block_invoke()
{
  void *v0;
  NSObject *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAllParametersForClient:", CFSTR("Spotlight"));

  if (!sSRResources)
  {
    SPLogForSPLogCategoryDefault();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __34__SPFederatedQueryTask_deactivate__block_invoke_cold_1(v1);

    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resourcesForClient:options:", CFSTR("Spotlight"), &unk_24F024FD8);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sSRResources;
    sSRResources = v3;

    SSDefaultsSetResources();
  }
  objc_msgSend(MEMORY[0x24BEB02F0], "reloadRankingParametersFromTrial");
  objc_msgSend(MEMORY[0x24BEB0210], "sharedModelManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deactivate");

  objc_msgSend(MEMORY[0x24BEB0210], "sharedModelManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "triggerUpdate");

  return MDPurgeTokenizers();
}

- (id)searchString
{
  void *v2;
  void *v3;
  void *v4;

  -[SPQueryTask query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)mergeSections
{
  void *v2;
  void *v3;
  SPFederatedQueryTask *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  int v117;
  void *v118;
  int v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  int v133;
  uint64_t v134;
  void *v135;
  int v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  NSObject *v144;
  os_log_type_t v145;
  _BOOL4 v146;
  os_log_type_t v147;
  const char *v148;
  NSObject *v149;
  uint32_t v150;
  void *v151;
  void *v152;
  id v153;
  uint64_t v154;
  id v155;
  id v156;
  void *v157;
  id obj;
  id v159;
  id v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  id v167;
  id v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  uint8_t buf[4];
  id v198;
  _BYTE v199[128];
  _BYTE v200[128];
  _QWORD v201[2];
  _BYTE v202[128];
  _QWORD v203[2];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  uint64_t v207;

  v4 = self;
  v207 = *MEMORY[0x24BDAC8D0];
  -[SPQueryTask queryProcessor](self, "queryProcessor");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v161 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v151 = v4;
  -[SPQueryTask mutableSections](v4, "mutableSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

  if ((v4 & 1) == 0)
  {

    v8 = 0;
  }
  v152 = v8;
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  objc_msgSend(v151, "mutableSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  obj = v11;
  v163 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v193, v206, 16);
  if (v163)
  {
    v162 = *(_QWORD *)v194;
    v171 = *MEMORY[0x24BEB04D0];
    v170 = *MEMORY[0x24BEB0358];
    v153 = v6;
    v154 = *MEMORY[0x24BEB04B8];
    do
    {
      for (i = 0; i != v163; ++i)
      {
        if (*(_QWORD *)v194 != v162)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * i);
        if (!objc_msgSend(v13, "resultsCount"))
          continue;
        objc_msgSend(v13, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = i;
        if (v14)
        {
          v15 = v13;
          objc_msgSend(v13, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uppercaseString");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v19 = 0;
            goto LABEL_14;
          }
          v15 = v13;
          objc_msgSend(v13, "bundleIdentifier");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v18 = (void *)v17;
        objc_msgSend(v161, "objectForKey:", v17);
        v19 = (id)objc_claimAutoreleasedReturnValue();

        v13 = v15;
LABEL_14:

        if ((objc_msgSend(v19, "doNotFold") & 1) != 0 || objc_msgSend(v13, "doNotFold"))
        {

LABEL_17:
          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v13, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v13, "title");
            v21 = v13;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "uppercaseString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "setObject:forKey:", v21, v23);

            i = v164;
            goto LABEL_142;
          }
          objc_msgSend(v13, "bundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          i = v164;
          if (v24)
          {
            objc_msgSend(v13, "bundleIdentifier");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v13;
            v22 = (void *)v25;
            objc_msgSend(v161, "setObject:forKey:", v26, v25);
            goto LABEL_142;
          }
          continue;
        }
        if (!v19)
          goto LABEL_17;
        v27 = v19;
        v28 = objc_msgSend(v6, "indexOfObject:", v27);
        v169 = v27;
        if (v28 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_141;
        v29 = v28;
        v30 = objc_msgSend(v13, "maxInitiallyVisibleResults");
        if (v30 <= objc_msgSend(v27, "maxInitiallyVisibleResults"))
          v31 = v27;
        else
          v31 = v13;
        objc_msgSend(v27, "setMaxInitiallyVisibleResults:", objc_msgSend(v31, "maxInitiallyVisibleResults"));
        v157 = v13;
        objc_msgSend(v13, "setMaxInitiallyVisibleResults:", objc_msgSend(v27, "maxInitiallyVisibleResults"));
        objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v29, v27);
        v172 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        objc_msgSend(v27, "resultSet");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
        v33 = v27;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "sectionBundleIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        v37 = v154;
        if (v35)
        {
          v156 = v35;
        }
        else
        {
          objc_msgSend(v33, "resultSet");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "applicationBundleIdentifier");
          v156 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v157, "resultSet");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "sectionBundleIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v42)
        {
          v155 = v42;
        }
        else
        {
          objc_msgSend(v157, "resultSet");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "applicationBundleIdentifier");
          v155 = (id)objc_claimAutoreleasedReturnValue();

        }
        if ((objc_msgSend(v156, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) != 0
          || objc_msgSend(v155, "isEqualToString:", CFSTR("com.apple.Maps")))
        {
          v46 = v157;
          if (objc_msgSend(v156, "isEqualToString:", CFSTR("com.apple.Maps")))
          {
            objc_msgSend(v169, "results");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (id)objc_msgSend(v47, "copy");

            objc_msgSend(v169, "clearResults");
            objc_msgSend(v157, "results");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v157, "results");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "addResultsFromArray:", v50);

            }
            objc_msgSend(v157, "clearResults");
            if (v48)
              objc_msgSend(v157, "addResultsFromArray:", v48);
            v51 = objc_msgSend(v157, "domain");
            objc_msgSend(v157, "setDomain:", objc_msgSend(v169, "domain"));
            objc_msgSend(v169, "setDomain:", v51);
            objc_msgSend(v157, "title");
            v52 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v169, "title");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "setTitle:", v53);

            v54 = (void *)v52;
            objc_msgSend(v169, "setTitle:", v52);
LABEL_77:

          }
          goto LABEL_78;
        }
        if (objc_msgSend(v169, "domain") != 2)
        {
          objc_msgSend(v169, "resultSet");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "applicationBundleIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v57;
          if (v57)
          {
            v48 = v57;
          }
          else
          {
            objc_msgSend(v169, "resultSet");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "sectionBundleIdentifier");
            v48 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v157, "resultSet");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "applicationBundleIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v63;
          if (v63)
          {
            v160 = v63;
          }
          else
          {
            objc_msgSend(v157, "resultSet");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "sectionBundleIdentifier");
            v160 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v157, "title");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "uppercaseString");
          v165 = (void *)objc_claimAutoreleasedReturnValue();

          v191 = 0u;
          v192 = 0u;
          v189 = 0u;
          v190 = 0u;
          objc_msgSend(v152, "resultSet");
          v167 = (id)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v189, v205, 16);
          if (!v68)
          {
            v54 = v160;
            goto LABEL_76;
          }
          v69 = v68;
          v70 = *(_QWORD *)v190;
          v159 = v48;
          v54 = v160;
          while (1)
          {
            for (j = 0; j != v69; ++j)
            {
              if (*(_QWORD *)v190 != v70)
                objc_enumerationMutation(v167);
              v72 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * j);
              objc_msgSend(v72, "title");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v73)
                goto LABEL_72;
              if (v48)
              {
                objc_msgSend(v72, "resultBundleId");
                v3 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v3, "isEqualToString:", v48) & 1) != 0)
                  goto LABEL_60;
              }
              if (v54)
              {
                objc_msgSend(v72, "resultBundleId");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v2, "isEqualToString:", v54))
                {

                  if (v48)
LABEL_60:

LABEL_71:
                  objc_msgSend(v172, "addObject:", v73);
                  goto LABEL_72;
                }
                if (!v165)
                {
                  v74 = 0;
LABEL_67:

                  goto LABEL_68;
                }
              }
              else if (!v165)
              {
                v74 = 0;
                goto LABEL_68;
              }
              v75 = v2;
              v76 = v3;
              objc_msgSend(v72, "sectionHeader");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "uppercaseString");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = objc_msgSend(v78, "isEqual:", v165);

              v3 = v76;
              v2 = v75;
              v48 = v159;
              v54 = v160;
              if (v160)
                goto LABEL_67;
LABEL_68:
              if (v48)

              if ((v74 & 1) != 0)
                goto LABEL_71;
LABEL_72:

            }
            v69 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v189, v205, 16);
            if (!v69)
            {
LABEL_76:

              v46 = v157;
              goto LABEL_77;
            }
          }
        }
        v46 = v157;
LABEL_78:
        v168 = v3;
        objc_msgSend(v46, "bundleIdentifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "isEqualToString:", *MEMORY[0x24BE84A98]);

        if (v80)
        {
          v166 = v2;
          v81 = (void *)objc_opt_new();
          v185 = 0u;
          v186 = 0u;
          v187 = 0u;
          v188 = 0u;
          objc_msgSend(v169, "resultSet");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v185, v204, 16);
          if (v83)
          {
            v84 = v83;
            v85 = *(_QWORD *)v186;
            do
            {
              for (k = 0; k != v84; ++k)
              {
                if (*(_QWORD *)v186 != v85)
                  objc_enumerationMutation(v82);
                v87 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * k);
                objc_msgSend(v87, "resultBundleId");
                v88 = objc_claimAutoreleasedReturnValue();
                if (v88)
                {
                  v89 = (void *)v88;
                  objc_msgSend(v87, "completion");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v90)
                  {
                    objc_msgSend(v87, "resultBundleId");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    v203[0] = v91;
                    objc_msgSend(v87, "completion");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    v203[1] = v92;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v203, 2);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v81, "setObject:forKeyedSubscript:", v87, v93);
                  }
                }
              }
              v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v185, v204, 16);
            }
            while (v84);
          }

          v183 = 0u;
          v184 = 0u;
          v181 = 0u;
          v182 = 0u;
          objc_msgSend(v157, "resultSet");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v181, v202, 16);
          if (v95)
          {
            v96 = v95;
            v97 = *(_QWORD *)v182;
            do
            {
              for (m = 0; m != v96; ++m)
              {
                if (*(_QWORD *)v182 != v97)
                  objc_enumerationMutation(v94);
                v99 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * m);
                objc_msgSend(v99, "resultBundleId");
                v100 = objc_claimAutoreleasedReturnValue();
                if (v100)
                {
                  v101 = (void *)v100;
                  objc_msgSend(v99, "completion");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v102)
                  {
                    objc_msgSend(v99, "resultBundleId");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    v201[0] = v103;
                    objc_msgSend(v99, "completion");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    v201[1] = v104;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v201, 2);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "objectForKeyedSubscript:", v105);
                    v106 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v106)
                      objc_msgSend(v169, "addResults:", v99);

                  }
                }
              }
              v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v181, v202, 16);
            }
            while (v96);
          }

          v37 = v154;
          v2 = v166;
        }
        v179 = 0u;
        v180 = 0u;
        v177 = 0u;
        v178 = 0u;
        objc_msgSend(v169, "resultSet");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v177, v200, 16);
        if (v108)
        {
          v109 = v108;
          v110 = *(_QWORD *)v178;
          do
          {
            v111 = 0;
            do
            {
              if (*(_QWORD *)v178 != v110)
                objc_enumerationMutation(v107);
              v112 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * v111);
              objc_msgSend(v112, "resultBundleId");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = objc_msgSend(v113, "isEqualToString:", v37);

              if (v114)
              {
                objc_msgSend(v112, "contentURL");
                v115 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v112, "resultBundleId");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                v117 = objc_msgSend(v116, "isEqualToString:", v171);

                if (v117
                  || (objc_msgSend(v112, "contentType"),
                      v118 = (void *)objc_claimAutoreleasedReturnValue(),
                      v119 = objc_msgSend(v118, "isEqualToString:", v170),
                      v118,
                      v119))
                {
                  objc_msgSend(v112, "identifier");
                  v115 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v112, "title");
                  v121 = objc_claimAutoreleasedReturnValue();
                  if (!v121)
                    goto LABEL_114;
                  v122 = (void *)v121;
                  objc_msgSend(v112, "title");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "text");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v124)
                    goto LABEL_114;
                  objc_msgSend(v112, "title");
                  v115 = objc_claimAutoreleasedReturnValue();
                }
              }
              v120 = (void *)v115;
              if (v115)
              {
                objc_msgSend(v172, "addObject:", v115);

              }
LABEL_114:
              ++v111;
            }
            while (v109 != v111);
            v125 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v177, v200, 16);
            v109 = v125;
          }
          while (v125);
        }

        v175 = 0u;
        v176 = 0u;
        v173 = 0u;
        v174 = 0u;
        objc_msgSend(v157, "resultSet");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v173, v199, 16);
        if (!v127)
          goto LABEL_140;
        v128 = v127;
        v129 = *(_QWORD *)v174;
        do
        {
          v130 = 0;
          do
          {
            if (*(_QWORD *)v174 != v129)
              objc_enumerationMutation(v126);
            v131 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * v130);
            objc_msgSend(v131, "resultBundleId");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = objc_msgSend(v132, "isEqualToString:", v37);

            if (v133)
            {
              objc_msgSend(v131, "contentURL");
              v134 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v131, "resultBundleId");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              v136 = objc_msgSend(v135, "isEqualToString:", v171);

              if (v136
                || (objc_msgSend(v131, "contentType"),
                    v137 = (void *)objc_claimAutoreleasedReturnValue(),
                    v138 = objc_msgSend(v137, "isEqualToString:", v170),
                    v137,
                    v138))
              {
                objc_msgSend(v131, "identifier");
                v134 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v131, "title");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v139)
                  goto LABEL_133;
                objc_msgSend(v131, "title");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v140, "text");
                v141 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v141)
                {
                  v139 = 0;
                  goto LABEL_133;
                }
                objc_msgSend(v131, "title");
                v134 = objc_claimAutoreleasedReturnValue();
              }
            }
            v139 = (void *)v134;
            if (v134 && (objc_msgSend(v172, "containsObject:", v134) & 1) == 0)
              objc_msgSend(v169, "addResults:", v131);
LABEL_133:

            ++v130;
          }
          while (v128 != v130);
          v142 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v173, v199, 16);
          v128 = v142;
        }
        while (v142);
LABEL_140:

        v6 = v153;
        v3 = v168;
LABEL_141:
        i = v164;
        v22 = v169;

LABEL_142:
      }
      v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v206, 16);
    }
    while (v163);
  }

  if (_os_feature_enabled_impl() && objc_msgSend(v6, "count"))
    objc_msgSend(v151, "relatedContentSectionMerging:", v6);
  v143 = objc_msgSend(v6, "count");
  objc_msgSend(v151, "setMutableSections:", v6);
  SPLogForSPLogCategoryDefault();
  v144 = objc_claimAutoreleasedReturnValue();
  v145 = *MEMORY[0x24BE84B00] ^ 1;
  v146 = os_log_type_enabled(v144, v145);
  if (v143)
  {
    if (v146)
    {
      *(_DWORD *)buf = 138412290;
      v198 = v6;
      v147 = v145;
      v148 = "Merge sections %@";
      v149 = v144;
      v150 = 12;
LABEL_153:
      _os_log_impl(&dword_2279CC000, v149, v147, v148, buf, v150);
    }
  }
  else if (v146)
  {
    *(_WORD *)buf = 0;
    v147 = v145;
    v148 = "Empty after updates";
    v149 = v144;
    v150 = 2;
    goto LABEL_153;
  }

}

- (void)relatedContentSectionMerging:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v4 = relatedContentSectionMerging__onceToken;
  v5 = a3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&relatedContentSectionMerging__onceToken, &__block_literal_global_372);
    v6 = v7;
  }
  -[SPFederatedQueryTask mergeRelatedContentFromSections:bundlesToMerge:mergedSectionId:](self, "mergeRelatedContentFromSections:bundlesToMerge:mergedSectionId:", v6, relatedContentSectionMerging__webBundles, sSectionMergingBlendedWeb);
  -[SPFederatedQueryTask mergeRelatedContentFromSections:bundlesToMerge:mergedSectionId:](self, "mergeRelatedContentFromSections:bundlesToMerge:mergedSectionId:", v7, relatedContentSectionMerging__musicBundles, sSectionMergingBlendedMusic);

}

void __53__SPFederatedQueryTask_relatedContentSectionMerging___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BEB0450];
  v12[0] = *MEMORY[0x24BEB04B8];
  v12[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)relatedContentSectionMerging__webBundles;
  relatedContentSectionMerging__webBundles = v3;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = *MEMORY[0x24BEB0498];
  v11[0] = *MEMORY[0x24BEB0400];
  v11[1] = v6;
  v7 = *MEMORY[0x24BEB0410];
  v11[2] = *MEMORY[0x24BEB0438];
  v11[3] = v7;
  v11[4] = *MEMORY[0x24BEB0420];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)relatedContentSectionMerging__musicBundles;
  relatedContentSectionMerging__musicBundles = v9;

}

- (void)mergeRelatedContentFromSections:(id)a3 bundlesToMerge:(id)a4 mergedSectionId:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v15 = objc_msgSend(v8, "containsObject:", v13);

        if (v15)
          objc_msgSend(v10, "addObject:", v12);
      }
      else
      {

      }
      ++v11;
    }
    while (v11 < objc_msgSend(v7, "count"));
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      v42 = v16;
      v43 = v9;
      logForCSLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v10;
        _os_log_impl(&dword_2279CC000, v17, OS_LOG_TYPE_DEFAULT, "[release2023SectionMerging] Merging sections %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v20 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v20, v42);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "maxInitiallyVisibleResults");
          if (!v22)
          {
            objc_msgSend(v21, "results");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            if (v24 >= 3)
              v22 = 3;
            else
              v22 = v24;
          }
          objc_msgSend(v21, "results");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v22 <= v26)
          {
            objc_msgSend(v21, "results");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "subarrayWithRange:", 0, v22);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObjectsFromArray:", v28);

          }
          objc_msgSend(v21, "results");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "count");

          if (v30 > v22)
          {
            objc_msgSend(v21, "results");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "results");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "subarrayWithRange:", v22, objc_msgSend(v32, "count") - v22);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObjectsFromArray:", v33);

          }
          objc_msgSend(v21, "clearResults");

          ++v20;
        }
        while (v20 < objc_msgSend(v10, "count"));
      }
      v16 = v42;
      objc_msgSend(v42, "addResultsFromArray:", v18, v42);
      objc_msgSend(v16, "addResultsFromArray:", v19);
      objc_msgSend(v16, "setMaxInitiallyVisibleResults:", objc_msgSend(v18, "count"));

      v9 = v43;
    }
    if (objc_msgSend(v9, "isEqualToString:", sSectionMergingBlendedWeb))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DOMAIN_TITLE_BLENDED_WEB"), &stru_24F01C208, CFSTR("SpotlightServices"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v35);

      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        v36 = (_QWORD *)MEMORY[0x24BEB04B8];
LABEL_31:
        objc_msgSend(v16, "setPreMergeBundleIdentifier:", *v36);
        goto LABEL_32;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", sSectionMergingBlendedMusic))
      {
LABEL_33:
        logForCSLogCategoryDefault();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "bundleIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v45 = v41;
          v46 = 2112;
          v47 = v9;
          _os_log_impl(&dword_2279CC000, v40, OS_LOG_TYPE_DEFAULT, "[release2023SectionMerging] Section %@ becomes %@", buf, 0x16u);

        }
        objc_msgSend(v16, "setBundleIdentifier:", v9);

        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("DOMAIN_TITLE_BLENDED_MUSIC"), &stru_24F01C208, CFSTR("SpotlightServices"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v38);

      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        v36 = (_QWORD *)MEMORY[0x24BEB0400];
        goto LABEL_31;
      }
    }
    objc_msgSend(v16, "bundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreMergeBundleIdentifier:", v39);

LABEL_32:
    objc_msgSend(v16, "setMaxInitiallyVisibleResults:", 3);
    goto LABEL_33;
  }
LABEL_36:

}

- (void)truncateSuggestionsSectionToFit:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SPQueryTask maxUISuggestions](self, "maxUISuggestions");
  objc_msgSend(v4, "resultSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDBCEE0]);
  v8 = objc_msgSend(v4, "resultsCount");
  if (v8 >= v5)
    v9 = v5;
  else
    v9 = v8;
  v10 = (void *)objc_msgSend(v7, "initWithCapacity:", v9);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v18, "type", (_QWORD)v21) == 21)
        {
          if (v14)
            v19 = v14;
          else
            v19 = v18;
          v20 = v19;

          v14 = v20;
        }
        else if (v15 < v5)
        {
          objc_msgSend(v10, "addObject:", v18);
          ++v15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);

    if (v14)
    {
      if (v15 && v15 >= v5)
        objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v15 - 1, v14);
      else
        objc_msgSend(v10, "addObject:", v14);
    }
  }
  else
  {

    v14 = 0;
  }
  objc_msgSend(v4, "setResultSet:", v10, (_QWORD)v21);

}

- (void)handleOptionsForNewSections:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  NSObject *v7;
  _BYTE *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t jj;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  char v91;
  uint64_t v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t n;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  char v108;
  uint64_t v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t ii;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  BOOL v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t kk;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  BOOL v146;
  void *v147;
  void *v148;
  BOOL v149;
  void *v150;
  void *v151;
  char v152;
  uint64_t v153;
  uint64_t v154;
  SPFederatedQueryTask *v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  id v162;
  id obj;
  id obja;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169;
  id v170;
  uint64_t v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  _QWORD block[4];
  id v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  uint8_t v225[128];
  uint8_t buf[4];
  id v227;
  __int16 v228;
  int v229;
  uint64_t v230;

  v230 = *MEMORY[0x24BDAC8D0];
  v157 = a3;
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v4, v5))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v227 = v6;
    v228 = 1024;
    v229 = objc_msgSend(v157, "count");
    _os_log_impl(&dword_2279CC000, v4, v5, "[%p] handleOptions for sections (%d)", buf, 0x12u);

  }
  SPLogForSPLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_BYTE *)MEMORY[0x24BE84B00];
  v9 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 138412290;
    v227 = v157;
    _os_log_impl(&dword_2279CC000, v7, v9, "handleOptionsForNewSections: %@", buf, 0xCu);
  }

  if (objc_msgSend(v157, "count"))
  {
    -[SPQueryTask queryProcessor](self, "queryProcessor");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    SPLogForSPLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *v8 ^ 1;
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      v227 = v157;
      _os_log_impl(&dword_2279CC000, v11, v12, "handleOptionsForNewSections: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPQueryTask query](self, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = v16;
    v17 = objc_msgSend(v16, "isServerEntitySearch");
    v213 = 0u;
    v214 = 0u;
    v215 = 0u;
    v216 = 0u;
    v155 = self;
    -[SPQueryTask mutableSections](self, "mutableSections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v213, v225, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v214;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v214 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i);
          objc_msgSend(v23, "bundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "hasPrefix:", CFSTR("com.apple.parsec."));

          if (v25)
          {
            objc_msgSend(v23, "results");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setDoNotFold:", objc_msgSend(v27, "doNotFold"));

          }
          createDedupeDicts(v23, v173, v178, v176, v177, v175, v174, v17);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v213, v225, 16);
      }
      while (v20);
    }

    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    obj = v157;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v224, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v210;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v210 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * j);
          objc_msgSend(v32, "bundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "hasPrefix:", CFSTR("com.apple.parsec."));

          if (v34)
          {
            objc_msgSend(v32, "results");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "firstObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setDoNotFold:", objc_msgSend(v36, "doNotFold"));

          }
          createDedupeDicts(v32, v173, v178, v176, v177, v175, v174, v17);
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v224, 16);
      }
      while (v29);
    }

    v37 = objc_msgSend(obj, "count");
    if (v37)
    {
      v38 = v37;
      v169 = (id)*MEMORY[0x24BEB04E0];
      v167 = *MEMORY[0x24BEB0500];
      v154 = *MEMORY[0x24BEB0358];
      v171 = *MEMORY[0x24BEB0380];
      v165 = *MEMORY[0x24BEB0448];
      v39 = *MEMORY[0x24BEB0440];
      while (1)
      {
        objc_msgSend(obj, "objectAtIndex:", --v38, v154);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bundleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "hasPrefix:", CFSTR("com.apple.parsec."));

        if (v42)
        {
          objc_msgSend(v40, "results");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "count");

          if (!v44)
            goto LABEL_78;
          v158 = v38;
          objc_msgSend(v40, "results");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v45, "copy");

          objc_msgSend(v40, "clearResults");
          v207 = 0u;
          v208 = 0u;
          v205 = 0u;
          v206 = 0u;
          v47 = v46;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v205, v223, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v206;
            do
            {
              for (k = 0; k != v49; ++k)
              {
                if (*(_QWORD *)v206 != v50)
                  objc_enumerationMutation(v47);
                v52 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * k);
                objc_msgSend(v40, "bundleIdentifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v53, "hasPrefix:", CFSTR("com.apple.parsec."));

                if (!v54)
                  goto LABEL_41;
                objc_msgSend(v52, "storeIdentifier");
                v55 = objc_claimAutoreleasedReturnValue();
                if (v55)
                {
                  v56 = (void *)v55;
                  objc_msgSend(v52, "storeIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v178, "objectForKey:", v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v58)
                    goto LABEL_40;
                }
                objc_msgSend(v52, "calendarIdentifier");
                v59 = objc_claimAutoreleasedReturnValue();
                if (!v59)
                  goto LABEL_41;
                v60 = (void *)v59;
                objc_msgSend(v52, "calendarIdentifier");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v176, "objectForKey:", v61);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (v58)
                {
LABEL_40:
                  handleHiddenResult();

                }
                else
                {
LABEL_41:
                  objc_msgSend(v40, "addResults:", v52);
                }
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v205, v223, 16);
            }
            while (v49);
          }
          v38 = v158;
          goto LABEL_77;
        }
        objc_msgSend(v40, "bundleIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("com.apple.dictionary"));

        if (v63)
        {
          objc_msgSend(v40, "results");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "count");

          if (!v65)
            goto LABEL_78;
          objc_msgSend(v40, "results");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (void *)objc_msgSend(v66, "copy");

          objc_msgSend(v40, "clearResults");
          v203 = 0u;
          v204 = 0u;
          v201 = 0u;
          v202 = 0u;
          v47 = v67;
          v68 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v201, v222, 16);
          if (v68)
          {
            v69 = v68;
            v70 = v38;
            v71 = *(_QWORD *)v202;
            do
            {
              for (m = 0; m != v69; ++m)
              {
                if (*(_QWORD *)v202 != v71)
                  objc_enumerationMutation(v47);
                v73 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * m);
                objc_msgSend(v73, "identifier");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v74
                  || (objc_msgSend(v177, "objectForKey:", v74),
                      v75 = (void *)objc_claimAutoreleasedReturnValue(),
                      v75,
                      !v75))
                {
                  objc_msgSend(v40, "addResults:", v73);
                }

              }
              v69 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v201, v222, 16);
            }
            while (v69);
            goto LABEL_76;
          }
          goto LABEL_77;
        }
        objc_msgSend(v40, "bundleIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v76, "isEqualToString:", v169))
          break;
        objc_msgSend(v40, "bundleIdentifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "isEqualToString:", v167);

        if (v78)
          goto LABEL_61;
        objc_msgSend(v40, "bundleIdentifier");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "isEqualToString:", *MEMORY[0x24BE84A98]);

        if (v97)
        {
          v159 = v38;
          v161 = objc_alloc_init(MEMORY[0x24BDD1698]);
          v193 = 0u;
          v194 = 0u;
          v195 = 0u;
          v196 = 0u;
          objc_msgSend(v40, "results");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v193, v220, 16);
          if (v99)
          {
            v100 = v99;
            v101 = 0;
            v102 = *(_QWORD *)v194;
            do
            {
              for (n = 0; n != v100; ++n)
              {
                if (*(_QWORD *)v194 != v102)
                  objc_enumerationMutation(v98);
                v104 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * n);
                objc_msgSend(v104, "identifier");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = objc_msgSend(v105, "hasPrefix:", v171);

                if (v106)
                {
                  objc_msgSend(v104, "sectionBundleIdentifier");
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  v108 = objc_msgSend(v107, "isEqualToString:", v169);

                  v109 = v39;
                  if ((v108 & 1) != 0
                    || (objc_msgSend(v104, "sectionBundleIdentifier", v39),
                        v110 = (void *)objc_claimAutoreleasedReturnValue(),
                        v111 = objc_msgSend(v110, "isEqualToString:", v167),
                        v110,
                        v109 = v165,
                        v111))
                  {
                    objc_msgSend(v175, "objectForKey:", v109);
                    v112 = objc_claimAutoreleasedReturnValue();
                    if (v112)
                    {
                      v113 = (void *)v112;
                      handleHiddenResult();
                      objc_msgSend(v161, "addIndex:", v101 + n);

                    }
                  }
                }
              }
              v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v193, v220, 16);
              v101 += n;
            }
            while (v100);
          }

          objc_msgSend(v40, "resultSet");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "removeObjectsAtIndexes:", v161);

          -[SPFederatedQueryTask truncateSuggestionsSectionToFit:](v155, "truncateSuggestionsSectionToFit:", v40);
          v38 = v159;
          goto LABEL_80;
        }
        objc_msgSend(v40, "bundleIdentifier");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "isEqualToString:", v154);

        if (v116)
        {
          objc_msgSend(v40, "results");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = objc_msgSend(v117, "count");

          if (v118)
          {
            objc_msgSend(v40, "results");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = (void *)objc_msgSend(v119, "copy");

            objc_msgSend(v40, "clearResults");
            v191 = 0u;
            v192 = 0u;
            v189 = 0u;
            v190 = 0u;
            v47 = v120;
            v121 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v189, v219, 16);
            if (v121)
            {
              v122 = v121;
              v70 = v38;
              v123 = *(_QWORD *)v190;
              do
              {
                for (ii = 0; ii != v122; ++ii)
                {
                  if (*(_QWORD *)v190 != v123)
                    objc_enumerationMutation(v47);
                  v125 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * ii);
                  objc_msgSend(v125, "applicationBundleIdentifier");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v174, "objectForKey:", v126);
                  v127 = objc_claimAutoreleasedReturnValue();
                  v128 = (void *)v127;
                  if (v126)
                    v129 = v127 == 0;
                  else
                    v129 = 1;
                  if (v129)
                    objc_msgSend(v40, "addResults:", v125);
                  else
                    handleHiddenResult();

                }
                v122 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v189, v219, 16);
              }
              while (v122);
              goto LABEL_76;
            }
LABEL_77:

          }
        }
LABEL_78:
        if (!objc_msgSend(v40, "resultsCount"))
          objc_msgSend(obj, "removeObjectAtIndex:", v38);
LABEL_80:

        if (!v38)
          goto LABEL_112;
      }

LABEL_61:
      objc_msgSend(v40, "results");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "count");

      if (!v80)
        goto LABEL_78;
      v70 = v38;
      objc_msgSend(v40, "results");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v81, "copy");

      objc_msgSend(v40, "clearResults");
      v199 = 0u;
      v200 = 0u;
      v197 = 0u;
      v198 = 0u;
      v47 = v82;
      v83 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v197, v221, 16);
      if (v83)
      {
        v84 = v83;
        v85 = *(_QWORD *)v198;
        do
        {
          for (jj = 0; jj != v84; ++jj)
          {
            if (*(_QWORD *)v198 != v85)
              objc_enumerationMutation(v47);
            v87 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * jj);
            objc_msgSend(v87, "identifier");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend(v88, "hasPrefix:", v171);

            if (v89)
            {
              objc_msgSend(v87, "sectionBundleIdentifier");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = objc_msgSend(v90, "isEqualToString:", v169);

              v92 = v39;
              if ((v91 & 1) == 0
                && (objc_msgSend(v87, "sectionBundleIdentifier", v39),
                    v93 = (void *)objc_claimAutoreleasedReturnValue(),
                    v94 = objc_msgSend(v93, "isEqualToString:", v167),
                    v93,
                    v92 = v165,
                    !v94)
                || (objc_msgSend(v175, "objectForKey:", v92), (v95 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
              {
                objc_msgSend(v40, "addResults:", v87);
                v95 = 0;
              }

            }
            else
            {
              objc_msgSend(v40, "addResults:", v87);
            }
          }
          v84 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v197, v221, 16);
        }
        while (v84);
      }
LABEL_76:
      v38 = v70;
      goto LABEL_77;
    }
LABEL_112:
    objc_msgSend(v178, "removeAllObjects");
    objc_msgSend(v173, "removeAllObjects");
    objc_msgSend(v176, "removeAllObjects");
    objc_msgSend(v177, "removeAllObjects");
    objc_msgSend(v175, "removeAllObjects");
    objc_msgSend(v174, "removeAllObjects");
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v162 = obj;
    v166 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v185, v218, 16);
    if (!v166)
      goto LABEL_146;
    obja = *(id *)v186;
    v160 = *MEMORY[0x24BE849A8];
LABEL_114:
    v130 = 0;
    while (1)
    {
      if (*(id *)v186 != obja)
        objc_enumerationMutation(v162);
      v131 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * v130);
      objc_msgSend(v131, "bundleIdentifier");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v132, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")) & 1) != 0)
        goto LABEL_120;
      objc_msgSend(v131, "bundleIdentifier");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v133, "isEqualToString:", v160))
        break;
      objc_msgSend(v131, "bundleIdentifier");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend(v151, "isEqualToString:", *MEMORY[0x24BE84A98]);

      if ((v152 & 1) != 0)
        goto LABEL_121;
LABEL_141:
      if (++v130 == v166)
      {
        v153 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v185, v218, 16);
        v166 = v153;
        if (!v153)
        {
LABEL_146:

          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __52__SPFederatedQueryTask_handleOptionsForNewSections___block_invoke;
          block[3] = &unk_24F01B428;
          v180 = v162;
          dispatch_sync(MEMORY[0x24BDAC9B8], block);

          goto LABEL_147;
        }
        goto LABEL_114;
      }
    }

LABEL_120:
LABEL_121:
    v168 = v130;
    v172 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v134 = v131;
    objc_msgSend(v131, "results");
    v170 = (id)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v181, v217, 16);
    if (v135)
    {
      v136 = v135;
      v137 = 0;
      v138 = *(_QWORD *)v182;
      do
      {
        for (kk = 0; kk != v136; ++kk)
        {
          if (*(_QWORD *)v182 != v138)
            objc_enumerationMutation(v170);
          v140 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * kk);
          updateDedupeDictsForResult(v140, v173, v178, v176, v177, v175, v174);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          v142 = v141;
          if (v141)
          {
            objc_msgSend(v141, "inlineCard");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "inlineCard");
            v144 = objc_claimAutoreleasedReturnValue();
            v145 = (void *)v144;
            if (v143)
              v146 = 1;
            else
              v146 = v144 == 0;
            if (!v146)
              objc_msgSend(v142, "setInlineCard:", v144);
            objc_msgSend(v142, "compactCard");
            v147 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v140, "compactCard");
            v148 = (void *)objc_claimAutoreleasedReturnValue();

            if (v147)
              v149 = 1;
            else
              v149 = v148 == 0;
            if (!v149)
              objc_msgSend(v142, "setCompactCard:", v148);
            handleHiddenResult();
            objc_msgSend(v172, "addIndex:", v137 + kk);

          }
        }
        v136 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v181, v217, 16);
        v137 += kk;
      }
      while (v136);
    }

    objc_msgSend(v134, "resultSet");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "removeObjectsAtIndexes:", v172);

    v130 = v168;
    goto LABEL_141;
  }
LABEL_147:

}

void __52__SPFederatedQueryTask_handleOptionsForNewSections___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v1)
  {
    v2 = v1;
    v18 = *MEMORY[0x24BE849A8];
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", --v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")) & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v3, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v18))
        break;
      objc_msgSend(v3, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE84A98]);

      if ((v17 & 1) != 0)
        goto LABEL_7;
LABEL_21:

      if (!v2)
        return;
    }

LABEL_6:
LABEL_7:
    v20 = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          if (objc_msgSend(v11, "isLocalApplicationResult"))
          {
            if (sSRResources_block_invoke_2_onceToken != -1)
              dispatch_once(&sSRResources_block_invoke_2_onceToken, &__block_literal_global_382);
            v12 = (void *)sSRResources_block_invoke_2_sbsservice;
            objc_msgSend(v11, "applicationBundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "folderPathToIconWithBundleIdentifier:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if ((unint64_t)objc_msgSend(v14, "count") >= 2)
            {
              objc_msgSend(v14, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setAuxiliaryTopText:", v15);

            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    v2 = v20;
    goto LABEL_21;
  }
}

void __52__SPFederatedQueryTask_handleOptionsForNewSections___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sSRResources_block_invoke_2_sbsservice;
  sSRResources_block_invoke_2_sbsservice = v0;

}

- (void)addSections:(id)a3 delayedTopHit:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SPFederatedQueryTask handleOptionsForNewSections:](self, "handleOptionsForNewSections:");
  if (!a4)
  {
    -[SPQueryTask mutableSections](self, "mutableSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "count"))
  {
    -[SPQueryTask mutableSections](self, "mutableSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", v7, 0);

LABEL_5:
  }
  -[SPFederatedQueryTask mergeSections](self, "mergeSections");

}

- (id)unsafeSessionEntityString
{
  void *v2;
  void *v3;

  -[SPFederatedQueryTask mutableSessionEntityString](self, "mutableSessionEntityString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)readyToUpdate
{
  return -[SPQueryTask unsafeState](self, "unsafeState") != 0;
}

- (id)displayedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SPQueryTask query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "hasMarkedText") & 1) != 0)
  {
    objc_msgSend(v4, "markedTextArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", &stru_24F01C208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SPFederatedQueryTask searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)processAppResults:(id)a3 maxAppResults:(unint64_t)a4 section:(id)a5 topHitsIndex:(unint64_t *)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

  objc_msgSend(v10, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE849A8]);

  if ((v14 & 1) != 0 || v12)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = v10;
    objc_msgSend(v10, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
LABEL_5:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v19);
        if (objc_msgSend(v20, "isLocalApplicationResult") && (objc_msgSend(v20, "isAppClip") & 1) == 0)
        {
          objc_msgSend(v20, "title");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setMaxLines:", 1);

          if (v12)
          {
            ++*a6;
            objc_msgSend(v9, "insertObject:atIndex:", v20);
          }
          else
          {
            objc_msgSend(v9, "addObject:", v20);
          }
          if (objc_msgSend(v9, "count") >= a4)
            break;
        }
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v17)
            goto LABEL_5;
          break;
        }
      }
    }

    v10 = v22;
    objc_msgSend(v22, "setMaxInitiallyVisibleResults:", a4);
  }

}

- (id)unsafeSections
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint8_t buf[16];

  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v3, v4, "unsafeSections", buf, 2u);
  }

  -[SPQueryTask mutableSections](self, "mutableSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

  if (v12)
  {
    objc_msgSend(v9, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = -[SPQueryTask maxTopHitAppResults](self, "maxTopHitAppResults");
      v26 = 0;
      -[SPFederatedQueryTask processAppResults:maxAppResults:section:topHitsIndex:](self, "processAppResults:maxAppResults:section:topHitsIndex:", 0, v15, v14, &v26);
      objc_msgSend(v14, "resultSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 > v15)
      {
        objc_msgSend(v14, "resultSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resultSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectsInRange:", v15, objc_msgSend(v19, "count") - v15);

      }
    }
  }
  v20 = (void *)MEMORY[0x24BEB0308];
  -[SPQueryTask query](self, "query");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "queryContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPFederatedQueryTask showMoreInAppInfo](self, "showMoreInAppInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "buildSectionsWithSections:queryContext:searchInAppInfo:renderState:", v9, v22, v23, -[SPQueryTask unsafeState](self, "unsafeState"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)searchQuery:(id)a3 gotResultSet:(id)a4 replace:(BOOL)a5 partiallyComplete:(BOOL)a6 priorityFastPath:(BOOL)a7 update:(BOOL)a8 complete:(BOOL)a9 delayedTopHit:(BOOL)a10 unchanged:(BOOL)a11 forceStable:(BOOL)a12 blendingDuration:(double)a13 geoEntityString:(id)a14 supportedAppScopes:(id)a15 showMoreInAppInfo:(id)a16
{
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *staleResultsTimer;
  OS_dispatch_source *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  os_log_type_t v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t externalID;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  unint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  _QWORD v92[6];
  uint8_t buf[4];
  double v94;
  uint64_t v95;

  v18 = a7;
  v19 = a6;
  v20 = a5;
  v95 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v87 = a4;
  v89 = a14;
  v24 = a15;
  v88 = a16;
  -[SPQueryTask queryProcessor](self, "queryProcessor");
  v25 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v25);

  v26 = objc_msgSend(objc_alloc(MEMORY[0x24BE84DB8]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.searchd.frontend.query.end"), 0, objc_msgSend(v23, "queryIdent"));
  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)v26;
  objc_msgSend(v27, "reportFeedback:queryId:", v26, objc_msgSend(v23, "queryIdent"));

  staleResultsTimer = self->_staleResultsTimer;
  if (staleResultsTimer)
  {
    dispatch_source_cancel(staleResultsTimer);
    v29 = self->_staleResultsTimer;
    self->_staleResultsTimer = 0;

  }
  if (v19 || a8 || v18 || a9)
  {
    v30 = 2;
    if (!v19)
      v30 = 3;
    if (v18)
      v30 = 1;
    if (a9)
      v31 = 4;
    else
      v31 = v30;
    -[SPQueryTask setUnsafeState:](self, "setUnsafeState:", v31);
  }
  v32 = objc_msgSend(v24, "count");
  v33 = v24;
  v34 = v87;
  v35 = v89;
  if (v32)
    -[SPFederatedQueryTask setSupportedAppScopes:](self, "setSupportedAppScopes:", v33);
  v86 = v33;
  if (objc_msgSend(v88, "count"))
    -[SPFederatedQueryTask setShowMoreInAppInfo:](self, "setShowMoreInAppInfo:", v88);
  if (!-[SPQueryTask forceStableResults](self, "forceStableResults") && !a12
    || (objc_msgSend(v87, "stableSections"), (v36 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v87, "resultSections");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_26;
    goto LABEL_25;
  }
  v37 = (void *)v36;
  objc_msgSend(v87, "stableSections");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
LABEL_25:
    -[SPQueryTask mutableSections](self, "mutableSections");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "removeAllObjects");

    -[SPFederatedQueryTask setMutableSessionEntityString:](self, "setMutableSessionEntityString:", 0);
  }
LABEL_26:
  if (v89)
    -[SPFederatedQueryTask setMutableSessionEntityString:](self, "setMutableSessionEntityString:", v89);
  if (objc_msgSend(v38, "count"))
  {
    if (!a11)
    {
      v40 = (void *)objc_msgSend(v38, "mutableCopy");
      -[SPFederatedQueryTask addSections:delayedTopHit:](self, "addSections:delayedTopHit:", v40, a10);

      kdebug_trace();
      if (-[SPFederatedQueryTask newQuery](self, "newQuery"))
      {
        -[SPFederatedQueryTask setNewQuery:](self, "setNewQuery:", 0);
        v41 = objc_msgSend(v23, "creationStamp");
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bundleIdentifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        sp_analytics_log_timing_with_bundle_id((uint64_t)"com.apple.searchd.query.client", "ttfr", v41, v43);

        v35 = v89;
      }
    }
  }
  -[SPFederatedQueryTask unsafeSections](self, "unsafeSections");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  SPLogForSPLogCategoryDefault();
  v45 = objc_claimAutoreleasedReturnValue();
  v46 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v45, v46))
  {
    *(_DWORD *)buf = 138412290;
    v94 = *(double *)&v44;
    _os_log_impl(&dword_2279CC000, v45, v46, "sections: %@", buf, 0xCu);
  }

  if (!a11 && -[SPFederatedQueryTask readyToUpdate](self, "readyToUpdate"))
  {
    if (!-[SPFederatedQueryTask didReceiveCompleteCallback](self, "didReceiveCompleteCallback"))
    {
      kdebug_trace();
      SPLogForSPLogCategoryTelemetry();
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v47;
      externalID = self->_externalID;
      if ((_DWORD)externalID && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2279CC000, v48, OS_SIGNPOST_INTERVAL_END, externalID, "queryUI", " enableTelemetry=YES ", buf, 2u);
      }

    }
    -[SPFederatedQueryTask session](self, "session");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x24BEB02E0];
    objc_msgSend(v23, "queryContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "queryIntent");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "finishRanking:blendingDuration:spotlightQueryIntent:", v44, objc_msgSend(v51, "spotlightQueryIntent:", v53), a13);

    -[SPFederatedQueryTask setDidReceiveCompleteCallback:](self, "setDidReceiveCompleteCallback:", 1);
    if (v20)
      v54 = "session reset";
    else
      v54 = "session complete";
    v55 = objc_msgSend(v23, "creationStamp");
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bundleIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = sp_analytics_log_timing_with_bundle_id((uint64_t)"com.apple.searchd.query.client", v54, v55, v57);

    SPLogForSPLogCategoryDefault();
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v59, v60))
    {
      *(_DWORD *)buf = 134217984;
      v94 = (double)v58 / 1000000000.0;
      _os_log_impl(&dword_2279CC000, v59, v60, "- SearchAgent time %gs", buf, 0xCu);
    }

    v34 = v87;
    v35 = v89;
  }
  objc_msgSend(v23, "queryContext");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "fetchL2Signals");

  if (v62)
  {
    v63 = (void *)MEMORY[0x24BDD1618];
    -[SPQueryTask mutableSections](self, "mutableSections");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = 0;
    objc_msgSend(v63, "archivedDataWithRootObject:requiringSecureCoding:error:", v64, 1, &v91);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v91;

    if (v66)
    {
      SPLogForSPLogCategoryDefault();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:].cold.2((uint64_t)v66, v67, v68, v69, v70, v71, v72, v73);
      v74 = 0;
    }
    else
    {
      v75 = (void *)MEMORY[0x24BDD1620];
      v76 = (void *)MEMORY[0x24BDBCF20];
      v92[0] = objc_opt_class();
      v92[1] = objc_opt_class();
      v92[2] = objc_opt_class();
      v92[3] = objc_opt_class();
      v92[4] = objc_opt_class();
      v92[5] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 6);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setWithArray:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = 0;
      objc_msgSend(v75, "unarchivedObjectOfClasses:fromData:error:", v78, v65, &v90);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v90;

      if (!v66)
      {
        v34 = v87;
        goto LABEL_57;
      }
      SPLogForSPLogCategoryDefault();
      v67 = objc_claimAutoreleasedReturnValue();
      v34 = v87;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        -[SPFederatedQueryTask searchQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:].cold.1((uint64_t)v66, v67, v79, v80, v81, v82, v83, v84);
    }

LABEL_57:
    -[SPQueryTask updateResultsThroughDelegate:state:unchanged:sections:](self, "updateResultsThroughDelegate:state:unchanged:sections:", 0, -[SPQueryTask unsafeState](self, "unsafeState"), a11, v74);

    v35 = v89;
    goto LABEL_58;
  }
  -[SPQueryTask updateResultsThroughDelegate:state:unchanged:sections:](self, "updateResultsThroughDelegate:state:unchanged:sections:", 0, -[SPQueryTask unsafeState](self, "unsafeState"), a11, v44);
LABEL_58:

}

- (void)searchQueryEncounteredError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;

  v4 = a3;
  -[SPQueryTask queryProcessor](self, "queryProcessor");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  SPLogForSPLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[SPFederatedQueryTask searchQueryEncounteredError:].cold.1((uint64_t)v4, self, v6);

}

- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *staleResultsTimer;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  uint8_t v30[8];
  _QWORD handler[4];
  id v32;
  id v33[2];
  uint8_t buf[8];

  v6 = a3;
  -[SPFederatedQueryTask session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPQueryTask query](self, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "queryKind") - 5;

  if (v10 < 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Skipped 1";
LABEL_11:
      _os_log_impl(&dword_2279CC000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Skipped 2";
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  if (a4 != 1)
  {
    -[SPQueryTask query](self, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastSections:forQuery:", v6, v13);
    goto LABEL_13;
  }
  if (!self->_staleResultsFired)
  {
    if (objc_msgSend(v6, "count") != 1)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Skipped 4";
      goto LABEL_11;
    }
    objc_msgSend(v6, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

    if (v16)
    {
      -[SPQueryTask query](self, "query");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v7, "copyStaleSectionsForQuery:", v17);

      if (objc_msgSend(v18, "count"))
      {
        v19 = (void *)objc_msgSend(v18, "mutableCopy");
        objc_msgSend(v18, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPQueryTask queryProcessor](self, "queryProcessor");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v21);
        staleResultsTimer = self->_staleResultsTimer;
        self->_staleResultsTimer = v22;

        v24 = self->_staleResultsTimer;
        v25 = dispatch_time(0, 750000000);
        dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v26 = self->_staleResultsTimer;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __56__SPFederatedQueryTask_retainAndMergeSections_forState___block_invoke;
        handler[3] = &unk_24F01B450;
        objc_copyWeak(v33, (id *)buf);
        v33[1] = (id)1;
        v27 = v6;
        v32 = v27;
        dispatch_source_set_event_handler(v26, handler);
        dispatch_activate((dispatch_object_t)self->_staleResultsTimer);
        objc_msgSend(v20, "bundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = objc_msgSend(v28, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

        v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v26)
        {
          if (v29)
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Merged - case 1!", v30, 2u);
          }
          objc_msgSend(v19, "replaceObjectAtIndex:withObject:", 0, v13);
        }
        else
        {
          if (v29)
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Merged - case 2!", v30, 2u);
          }
          objc_msgSend(v19, "insertObject:atIndex:", v13, 0);
        }

        objc_destroyWeak(v33);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Skipped 6", buf, 2u);
        }
        v19 = v6;
      }

      v6 = v19;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Skipped 5", buf, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v11 = MEMORY[0x24BDACB70];
    v12 = "Skipped 3";
    goto LABEL_11;
  }
LABEL_14:

  return v6;
}

void __56__SPFederatedQueryTask_retainAndMergeSections_forState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Clear stale results -- timeout", v4, 2u);
    }
    *((_BYTE *)WeakRetained + 208) = 1;
    dispatch_source_cancel(*((dispatch_source_t *)WeakRetained + 25));
    v3 = (void *)*((_QWORD *)WeakRetained + 25);
    *((_QWORD *)WeakRetained + 25) = 0;

    objc_msgSend(WeakRetained, "updateResultsThroughDelegate:state:unchanged:sections:", 0, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));
  }

}

- (unint64_t)queryIdent
{
  void *v2;
  unint64_t v3;

  -[SPQueryTask query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "queryIdent");

  return v3;
}

- (void)allowAnonymousDataCollection:(BOOL)a3
{
  self->_allowAnonymousDataCollection = a3;
}

- (SPClientSession)session
{
  return (SPClientSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSDictionary)searchThroughCEPData
{
  return self->_searchThroughCEPData;
}

- (void)setSearchThroughCEPData:(id)a3
{
  objc_storeStrong((id *)&self->_searchThroughCEPData, a3);
}

- (NSDictionary)server_features
{
  return self->_server_features;
}

- (void)setServer_features:(id)a3
{
  objc_storeStrong((id *)&self->_server_features, a3);
}

- (NSMutableDictionary)categoryToResultMapping
{
  return self->_categoryToResultMapping;
}

- (void)setCategoryToResultMapping:(id)a3
{
  objc_storeStrong((id *)&self->_categoryToResultMapping, a3);
}

- (NSMutableOrderedSet)sectionOrderByInsertion
{
  return self->_sectionOrderByInsertion;
}

- (void)setSectionOrderByInsertion:(id)a3
{
  objc_storeStrong((id *)&self->_sectionOrderByInsertion, a3);
}

- (SPXPCConnection)connection
{
  return self->_connection;
}

- (unsigned)externalID
{
  return self->_externalID;
}

- (SPXPCMessage)message
{
  return (SPXPCMessage *)objc_getProperty(self, a2, 384, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (NSString)web_fbq
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (NSMutableDictionary)categoryEngagements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 408, 1);
}

- (void)setCategoryEngagements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (double)blendingTime
{
  return self->_blendingTime;
}

- (void)setBlendingTime:(double)a3
{
  self->_blendingTime = a3;
}

- (BOOL)isRewrite
{
  return self->_isRewrite;
}

- (void)setIsRewrite:(BOOL)a3
{
  self->_isRewrite = a3;
}

- (BOOL)needsReRunForFuzzy
{
  return self->_needsReRunForFuzzy;
}

- (void)setNeedsReRunForFuzzy:(BOOL)a3
{
  self->_needsReRunForFuzzy = a3;
}

- (NSString)geoUserSessionEntityString
{
  return self->_geoUserSessionEntityString;
}

- (void)setGeoUserSessionEntityString:(id)a3
{
  objc_storeStrong((id *)&self->_geoUserSessionEntityString, a3);
}

- (PRSRankingItemRanker)itemRanker
{
  return self->_itemRanker;
}

- (void)setItemRanker:(id)a3
{
  objc_storeStrong((id *)&self->_itemRanker, a3);
}

- (BOOL)allowAnonymousDataCollection
{
  return self->_allowAnonymousDataCollection;
}

- (void)setAllowAnonymousDataCollection:(BOOL)a3
{
  self->_allowAnonymousDataCollection = a3;
}

- (unint64_t)previousQueryKind
{
  return self->_previousQueryKind;
}

- (void)setPreviousQueryKind:(unint64_t)a3
{
  self->_previousQueryKind = a3;
}

- (BOOL)isCJK
{
  return self->_isCJK;
}

- (void)setIsCJK:(BOOL)a3
{
  self->_isCJK = a3;
}

- (BOOL)prefersLocalUserTypedSuggestion
{
  return self->_prefersLocalUserTypedSuggestion;
}

- (void)setPrefersLocalUserTypedSuggestion:(BOOL)a3
{
  self->_prefersLocalUserTypedSuggestion = a3;
}

- (BOOL)didReceiveCoreSpotlightProgress
{
  return self->_didReceiveCoreSpotlightProgress;
}

- (void)setDidReceiveCoreSpotlightProgress:(BOOL)a3
{
  self->_didReceiveCoreSpotlightProgress = a3;
}

- (double)storeStartTime
{
  return self->_storeStartTime;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (NSString)mutableSessionEntityString
{
  return self->_mutableSessionEntityString;
}

- (void)setMutableSessionEntityString:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSessionEntityString, a3);
}

- (NSArray)showMoreInAppInfo
{
  return self->_showMoreInAppInfo;
}

- (void)setShowMoreInAppInfo:(id)a3
{
  objc_storeStrong((id *)&self->_showMoreInAppInfo, a3);
}

- (BOOL)didReceiveCompleteCallback
{
  return self->_didReceiveCompleteCallback;
}

- (void)setDidReceiveCompleteCallback:(BOOL)a3
{
  self->_didReceiveCompleteCallback = a3;
}

- (BOOL)newQuery
{
  return self->_newQuery;
}

- (void)setNewQuery:(BOOL)a3
{
  self->_newQuery = a3;
}

- (NSArray)supportedAppScopes
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setSupportedAppScopes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSMutableArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_storeStrong((id *)&self->_tokens, a3);
}

- (NSMutableArray)slowTokens
{
  return self->_slowTokens;
}

- (void)setSlowTokens:(id)a3
{
  objc_storeStrong((id *)&self->_slowTokens, a3);
}

- (NSMutableArray)delayedStartTokens
{
  return self->_delayedStartTokens;
}

- (void)setDelayedStartTokens:(id)a3
{
  objc_storeStrong((id *)&self->_delayedStartTokens, a3);
}

- (NSMutableArray)delayedStartQueries
{
  return self->_delayedStartQueries;
}

- (void)setDelayedStartQueries:(id)a3
{
  objc_storeStrong((id *)&self->_delayedStartQueries, a3);
}

- (NSMutableArray)finishedTokens
{
  return self->_finishedTokens;
}

- (void)setFinishedTokens:(id)a3
{
  objc_storeStrong((id *)&self->_finishedTokens, a3);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (double)startTimeIntervalSinceReferenceDate
{
  return self->_startTimeIntervalSinceReferenceDate;
}

- (SFMutableResultSection)topHitSection
{
  return self->_topHitSection;
}

- (SFMutableResultSection)suggestionsSection
{
  return self->_suggestionsSection;
}

- (int64_t)initiallyVisibleSectionSentCount
{
  return self->_initiallyVisibleSectionSentCount;
}

- (int64_t)initiallyHiddenSectionSentCount
{
  return self->_initiallyHiddenSectionSentCount;
}

- (NSArray)corrections
{
  return self->_corrections;
}

- (void)setCorrections:(id)a3
{
  objc_storeStrong((id *)&self->_corrections, a3);
}

- (NSArray)serverSuggestionResults
{
  return self->_serverSuggestionResults;
}

- (void)setServerSuggestionResults:(id)a3
{
  objc_storeStrong((id *)&self->_serverSuggestionResults, a3);
}

- (NSArray)localSuggestionResults
{
  return self->_localSuggestionResults;
}

- (void)setLocalSuggestionResults:(id)a3
{
  objc_storeStrong((id *)&self->_localSuggestionResults, a3);
}

- (BOOL)suggestionsAreBlended
{
  return self->_suggestionsAreBlended;
}

- (void)setSuggestionsAreBlended:(BOOL)a3
{
  self->_suggestionsAreBlended = a3;
}

- (NSArray)preferredBundleIDs
{
  return self->_preferredBundleIDs;
}

- (void)setPreferredBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_preferredBundleIDs, a3);
}

- (BOOL)enforcePreferredBundleIDs
{
  return self->_enforcePreferredBundleIDs;
}

- (void)setEnforcePreferredBundleIDs:(BOOL)a3
{
  self->_enforcePreferredBundleIDs = a3;
}

- (OS_dispatch_semaphore)correctionsSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 600, 1);
}

- (void)setCorrectionsSem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (SSRankingManager)rankingManager
{
  return self->_rankingManager;
}

- (void)setRankingManager:(id)a3
{
  objc_storeStrong((id *)&self->_rankingManager, a3);
}

- (BOOL)isInternalDevice
{
  return self->_isInternalDevice;
}

- (void)setIsInternalDevice:(BOOL)a3
{
  self->_isInternalDevice = a3;
}

- (NSNumber)experimentalWeight
{
  return self->_experimentalWeight;
}

- (void)setExperimentalWeight:(id)a3
{
  objc_storeStrong((id *)&self->_experimentalWeight, a3);
}

- (void)setIsScopedAppSearch:(BOOL)a3
{
  self->_isScopedAppSearch = a3;
}

- (void)setIsPeopleSearch:(BOOL)a3
{
  self->_isPeopleSearch = a3;
}

- (void)setIsEntitySearch:(BOOL)a3
{
  self->_isEntitySearch = a3;
}

- (void)setIsPhotosSearch:(BOOL)a3
{
  self->_isPhotosSearch = a3;
}

- (void)setIsNLPSearch:(BOOL)a3
{
  self->_isNLPSearch = a3;
}

- (BOOL)genreGroupingEnabled
{
  return self->_genreGroupingEnabled;
}

- (void)setGenreGroupingEnabled:(BOOL)a3
{
  self->_genreGroupingEnabled = a3;
}

- (OS_xpc_object)perfDictionary
{
  return self->_perfDictionary;
}

- (void)setPerfDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_perfDictionary, a3);
}

- (NSMutableArray)matchInfo
{
  return self->_matchInfo;
}

- (void)setMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_matchInfo, a3);
}

- (NSArray)queries
{
  return (NSArray *)objc_getProperty(self, a2, 640, 1);
}

- (void)setQueries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (SPParsecQuery)parsecQuery
{
  return self->_parsecQuery;
}

- (void)setParsecQuery:(id)a3
{
  objc_storeStrong((id *)&self->_parsecQuery, a3);
}

- (SPCSSearchQuery)csQuery
{
  return self->_csQuery;
}

- (void)setCsQuery:(id)a3
{
  objc_storeStrong((id *)&self->_csQuery, a3);
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csQuery, 0);
  objc_storeStrong((id *)&self->_parsecQuery, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_matchInfo, 0);
  objc_storeStrong((id *)&self->_perfDictionary, 0);
  objc_storeStrong((id *)&self->_experimentalWeight, 0);
  objc_storeStrong((id *)&self->_rankingManager, 0);
  objc_storeStrong((id *)&self->_correctionsSem, 0);
  objc_storeStrong((id *)&self->_preferredBundleIDs, 0);
  objc_storeStrong((id *)&self->_localSuggestionResults, 0);
  objc_storeStrong((id *)&self->_serverSuggestionResults, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_suggestionsSection, 0);
  objc_storeStrong((id *)&self->_topHitSection, 0);
  objc_storeStrong((id *)&self->_finishedTokens, 0);
  objc_storeStrong((id *)&self->_delayedStartQueries, 0);
  objc_storeStrong((id *)&self->_delayedStartTokens, 0);
  objc_storeStrong((id *)&self->_slowTokens, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_supportedAppScopes, 0);
  objc_storeStrong((id *)&self->_showMoreInAppInfo, 0);
  objc_storeStrong((id *)&self->_mutableSessionEntityString, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_itemRanker, 0);
  objc_storeStrong((id *)&self->_geoUserSessionEntityString, 0);
  objc_storeStrong((id *)&self->_categoryEngagements, 0);
  objc_storeStrong((id *)&self->_web_fbq, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sectionOrderByInsertion, 0);
  objc_storeStrong((id *)&self->_categoryToResultMapping, 0);
  objc_storeStrong((id *)&self->_server_features, 0);
  objc_storeStrong((id *)&self->_searchThroughCEPData, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_lastQuery, 0);
  objc_storeStrong((id *)&self->_bundlesSupportingAppScoping, 0);
  objc_storeStrong((id *)&self->_topHitsManager, 0);
  objc_storeStrong((id *)&self->_actualSentSections, 0);
  objc_storeStrong((id *)&self->_sentSections, 0);
  objc_storeStrong((id *)&self->_stableSections, 0);
  objc_storeStrong((id *)&self->_bottomPlacedSections, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_staleResultsTimer, 0);
}

void __29__SPFederatedQueryTask_start__block_invoke_cold_1()
{
  __assert_rtn("-[SPFederatedQueryTask start]_block_invoke", "SPFederatedQueryTask.m", 3880, "self.started == NO");
}

void __34__SPFederatedQueryTask_deactivate__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2279CC000, log, OS_LOG_TYPE_ERROR, "Resources object is nil at [SPProxyQuery deactivate]", v1, 2u);
}

- (void)searchQuery:(uint64_t)a3 gotResultSet:(uint64_t)a4 replace:(uint64_t)a5 partiallyComplete:(uint64_t)a6 priorityFastPath:(uint64_t)a7 update:(uint64_t)a8 complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2279CC000, a2, a3, "mutable section unarchiving error %@", a5, a6, a7, a8, 2u);
}

- (void)searchQuery:(uint64_t)a3 gotResultSet:(uint64_t)a4 replace:(uint64_t)a5 partiallyComplete:(uint64_t)a6 priorityFastPath:(uint64_t)a7 update:(uint64_t)a8 complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2279CC000, a2, a3, "mutable section archiving error %@", a5, a6, a7, a8, 2u);
}

- (void)searchQueryEncounteredError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_2279CC000, a3, OS_LOG_TYPE_ERROR, "Received search error %@ for query %@", (uint8_t *)&v6, 0x16u);

}

@end
