@implementation SPCSSearchQuery

+ (unsigned)searchDomain
{
  return 1;
}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  dispatch_group_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  _QWORD v49[4];
  uint64_t v50;
  _QWORD v51[6];
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x24BDBCF20];
    v3 = *MEMORY[0x24BEB06C8];
    v52[0] = *MEMORY[0x24BEB06C0];
    v52[1] = v3;
    v5 = *MEMORY[0x24BEB06E8];
    v53 = *MEMORY[0x24BEB06E0];
    v4 = v53;
    v54 = v5;
    v7 = *MEMORY[0x24BEB06D8];
    v55 = *MEMORY[0x24BEB06D0];
    v6 = v55;
    v56 = v7;
    v8 = *MEMORY[0x24BEB05F0];
    v57 = *MEMORY[0x24BEB0548];
    v58 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("com.apple.application"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.Preferences"), CFSTR("com.apple.MobileAddressBook"), CFSTR("com.apple.shortcuts"), 0);

    v14 = (void *)MEMORY[0x24BDBCF20];
    v51[0] = v3;
    v51[1] = v4;
    v51[2] = v5;
    v51[3] = v6;
    v51[4] = v7;
    v51[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x24BDBCF20]);
    v50 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithArray:", v19);

    v22 = objc_alloc(MEMORY[0x24BDBCF20]);
    v49[0] = v4;
    v49[1] = v5;
    v49[2] = v6;
    v49[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithArray:", v23);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Search.framework"));
    v26 = objc_claimAutoreleasedReturnValue();

    v28 = objc_alloc(MEMORY[0x24BDBCF50]);
    v29 = (void *)*MEMORY[0x24BEB04C0];
    v30 = objc_msgSend(v28, "initWithSuiteName:", *MEMORY[0x24BEB04C0]);

    objc_msgSend(v29, "UTF8String");
    v32 = objc_claimAutoreleasedReturnValue();

    v34 = objc_claimAutoreleasedReturnValue();

    v36 = dispatch_group_create();

    {
      NSHomeDirectory();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringByAppendingString:", CFSTR("/Library/Logs/CrashReporter/DiagnosticLogs/Search/Ranking"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v39, 1, 0, 0);

    }
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "loadAllParameters");

    {
      objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "resourcesForClient:options:", CFSTR("Spotlight"), &unk_24F025000);
      v43 = objc_claimAutoreleasedReturnValue();

      SSDefaultsSetResources();
    }
    dispatch_get_global_queue(17, 0);
    v46 = objc_claimAutoreleasedReturnValue();
    dispatch_group_async(v45, v46, &__block_literal_global_0);

    rankingAttributeNameArray();
    v47 = objc_claimAutoreleasedReturnValue();

  }
}

void __29__SPCSSearchQuery_initialize__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSObject *v25;
  id v26;
  _BYTE v27[24];
  _QWORD v28[7];

  v28[6] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDBACF8]);
  v1 = (void *)objc_opt_new();
  v2 = (void *)objc_msgSend(v0, "initWithConfiguration:", v1);

  v3 = *MEMORY[0x24BDBA2C8];
  v28[0] = *MEMORY[0x24BDBA2E0];
  v28[1] = v3;
  v4 = *MEMORY[0x24BDBA2C0];
  v28[2] = *MEMORY[0x24BDBA310];
  v28[3] = v4;
  v5 = *MEMORY[0x24BDBA348];
  v28[4] = *MEMORY[0x24BDBA288];
  v28[5] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v2, "_ios_meContactWithKeysToFetch:error:", v6, &v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v26;
  if (v8)
  {
    SPLogForSPLogCategoryQuery();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __29__SPCSSearchQuery_initialize__block_invoke_cold_1((uint64_t)v27, objc_msgSend(v8, "code"), v9);
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v7, "emailAddresses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __29__SPCSSearchQuery_initialize__block_invoke_2;
    v24 = &unk_24F01B4C0;
    v9 = v10;
    v25 = v9;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v21);

    objc_msgSend(v7, "identifier", v21, v22, v23, v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v7, "identifier");
      v14 = objc_claimAutoreleasedReturnValue();

      v16 = -[NSObject copy](v9, "copy");

    }

  }
    v18 = 1;
  else
    v18 = -1;
  {
    v19 = objc_claimAutoreleasedReturnValue();

  }
  if (_ZZZ29__SPCSSearchQuery_initialize_EUb_E34displayNameExactMatchMaskOnceToken != -1)
    dispatch_once(&_ZZZ29__SPCSSearchQuery_initialize_EUb_E34displayNameExactMatchMaskOnceToken, &__block_literal_global_120);

}

void __29__SPCSSearchQuery_initialize__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __29__SPCSSearchQuery_initialize__block_invoke_119()
{
  void *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  PRSRankingQueryIndexDictionary();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEB0398]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerValue");
  v2 = 1 << v1;
  if ((v1 & 0x40) != 0)
    v3 = 0;
  else
    v3 = 1 << v1;
  if ((v1 & 0x40) == 0)
    v2 = 0;
  unk_253E934A8 |= v2;

}

+ (void)activate
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectiveValueForSetting:", *MEMORY[0x24BE639E0]);
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "effectiveValueForSetting:", *MEMORY[0x24BE639F0]);
    v6 = objc_claimAutoreleasedReturnValue();

    SPBuildApplicationNames();
    SPFastHiddenAppsGetNoBuild();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(MEMORY[0x24BE84928], "applicationsExcludedFromUninstall");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minusSet:", v10);

    SPLogForSPLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_2279CC000, v11, OS_LOG_TYPE_DEFAULT, "%lu hiddenApps set during activate", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v9, "allObjects");
    v12 = objc_claimAutoreleasedReturnValue();

    if (+[SPCSSearchQuery activate]::onceToken[0] != -1)
      dispatch_once(+[SPCSSearchQuery activate]::onceToken, &__block_literal_global_123);
    if (v14 < 1)
    {
      objc_msgSend(a1, "preheat");
    }
    else
    {
      do
    }
    v16 = objc_msgSend(MEMORY[0x24BEB02E8], "copyRenderEngagementCounts");

    if (+[SPCSSearchQuery activate]::mailVipOnceToken[0] != -1)
      dispatch_once(+[SPCSSearchQuery activate]::mailVipOnceToken, &__block_literal_global_130);

  }
}

void __27__SPCSSearchQuery_activate__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  id v5;

  v0 = (void *)objc_opt_new();
  v5 = 0;
  objc_msgSend(v0, "loadDockAppListWithError:", &v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5;
  if (v1)
    objc_msgSend(MEMORY[0x24BEB0238], "setDockApps:", v1);
  if (v2)
  {
    SPLogForSPLogCategoryDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __27__SPCSSearchQuery_activate__block_invoke_cold_1((uint64_t)v2, v3, v4);

  }
  if (_os_feature_enabled_impl())

}

+ (void)deactivate
{
  _anonymous_namespace_ *v2;
  _anonymous_namespace_ *v3;
  id v4;
  id v5;

  {
    objc_msgSend(MEMORY[0x24BEB02F0], "reloadRankingParametersFromTrial");
    objc_msgSend(MEMORY[0x24BEB02F0], "getSuggestionsRankingThresholds");
    v2 = (_anonymous_namespace_ *)SISetCompletionRankingWeights();
    objc_msgSend(MEMORY[0x24BEB0238], "clearState");

  }
}

+ (id)_makeUniqueFetchAttributesWithAttributes:(id)a3 extraAttributes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v8 = objc_msgSend(v6, "count");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v8 + v7);
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v15, (_QWORD)v18) & 1) != 0
          || objc_msgSend(v6, "containsObject:", v15))
        {
          objc_msgSend(v9, "addObject:", v15);
          objc_msgSend(v10, "removeObject:", v15);
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v16);

  }
  return v9;
}

- (SPCSSearchQuery)initWithUserQuery:(id)a3 queryGroupId:(unint64_t)a4 options:(unint64_t)a5 queryContext:(id)a6
{
  SPCSSearchQuery *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *dispatchQueue;
  void *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *rankQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *feedbackQueue;
  uint64_t v18;
  PRSRankingConfiguration *rankingInfo;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SPCSSearchQuery;
  v6 = -[SPKQuery initWithUserQuery:queryGroupId:options:queryContext:](&v21, sel_initWithUserQuery_queryGroupId_options_queryContext_, a3, a4, a5, a6);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("SPCSSearchQuery", v8);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_overcommit();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("SPCSSearchQuery rankq", v12);
    rankQueue = v6->_rankQueue;
    v6->_rankQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("Feedback Queue", v15);
    feedbackQueue = v6->_feedbackQueue;
    v6->_feedbackQueue = (OS_dispatch_queue *)v16;

    v6->_csQueryLock._os_unfair_lock_opaque = 0;
    v6->_suggestionsLock._os_unfair_lock_opaque = 0;
    v6->_timeoutTimerLock._os_unfair_lock_opaque = 0;
    v18 = objc_opt_new();
    rankingInfo = v6->_rankingInfo;
    v6->_rankingInfo = (PRSRankingConfiguration *)v18;

  }
  return v6;
}

- (void)start
{
  NSObject *dispatchQueue;
  dispatch_block_t v4;
  _QWORD block[5];
  objc_super v6;

  if (!-[SPKQuery isStarted](self, "isStarted")
    && !-[SPKQuery sendEmptyResponseIfNecessary](self, "sendEmptyResponseIfNecessary"))
  {
    v6.receiver = self;
    v6.super_class = (Class)SPCSSearchQuery;
    -[SPKQuery start](&v6, sel_start);
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __24__SPCSSearchQuery_start__block_invoke;
    block[3] = &unk_24F01B548;
    block[4] = self;
    v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_async(dispatchQueue, v4);

  }
}

uint64_t __24__SPCSSearchQuery_start__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "executeQuery");
  return result;
}

- (void)cancel
{
  NSObject *timeoutTimer;
  OS_dispatch_source *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  char v14;
  char v15;
  char v16;
  void *v17;
  OS_dispatch_queue *feedbackQueue;
  NSObject *v19;
  qos_class_t v20;
  dispatch_block_t v21;
  void *v22;
  CSSearchQuery *v23;
  CSSearchQuery *csQuery;
  objc_super v25;
  _QWORD block[4];
  void *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    os_unfair_lock_lock(&self->_timeoutTimerLock);
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_source_cancel(timeoutTimer);
      v4 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    os_unfair_lock_unlock(&self->_timeoutTimerLock);
  }
  -[SPKQuery delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "queryIdent");
  objc_msgSend(v5, "clientBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("queryID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x22E2A1B88]();

  -[SPKQuery queryContext](self, "queryContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "queryKind");
  v12 = v7;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v13 = v12;
  }
  else
  {
    if ((objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
      || (objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
      || ((v14 = objc_msgSend(v12, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v11 == 12) ? (v15 = 1) : (v15 = v14),
          (v15 & 1) != 0))
    {
      v16 = _os_feature_enabled_impl();

      if ((v16 & 1) != 0)
        goto LABEL_21;
    }
    else
    {

    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84E20]), "initWithStartSearch:", self->_feedback);
    feedbackQueue = self->_feedbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __25__SPCSSearchQuery_cancel__block_invoke;
    block[3] = &unk_24F01B570;
    v27 = v17;
    v29 = v6;
    v28 = v12;
    v19 = feedbackQueue;
    v10 = v17;
    v20 = qos_class_self();
    if (v20 < 0x1A)
      v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    else
      v21 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v20, 0, block);
    v22 = v21;
    dispatch_async(v19, v21);

    v13 = v27;
  }

LABEL_21:
  os_unfair_lock_lock(&self->_csQueryLock);
  atomic_store(1u, (unsigned __int8 *)&self->_queryCanceled);
  v23 = self->_csQuery;
  csQuery = self->_csQuery;
  self->_csQuery = 0;

  os_unfair_lock_unlock(&self->_csQueryLock);
  -[CSSearchQuery cancel](v23, "cancel");
  v25.receiver = self;
  v25.super_class = (Class)SPCSSearchQuery;
  -[SPKQuery cancel](&v25, sel_cancel);

}

void __25__SPCSSearchQuery_cancel__block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendFeedbackType:feedback:queryId:clientID:", 6, a1[4], a1[6], a1[5]);

}

- (void)_sendResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  char v18;
  char v19;
  char v20;
  void *v21;
  id v22;
  void (**v23)(_QWORD, _QWORD);
  id v24;
  id v25[2];
  id location;

  v4 = a3;
  if (v4)
  {
    -[SPKQuery responseHandler](self, "responseHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "sections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
        objc_msgSend(v4, "setTopHitIsIn:", 1);
      -[SPKQuery delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "queryIdent");
      objc_msgSend(v8, "clientBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BEB02E0];
      -[SPKQuery queryContext](self, "queryContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "queryUnderstandingOutput");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "queryUnderstandingParseWithQueryUnderstanding:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[SPKQuery queryContext](self, "queryContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "queryKind");
      v17 = v10;
      if (_os_feature_enabled_impl())
      {

      }
      else
      {
        if ((objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0
          || (objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0
          || ((v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("com.apple.ondeviceeval")), v16 == 12)
            ? (v19 = 1)
            : (v19 = v18),
              (v19 & 1) != 0))
        {
          v20 = _os_feature_enabled_impl();

          if ((v20 & 1) != 0)
            goto LABEL_17;
        }
        else
        {

        }
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84E20]), "initWithStartSearch:queryUnderstandingParse:", self->_feedback, v14);
        location = 0;
        objc_initWeak(&location, self);
        objc_copyWeak(v25, &location);
        v25[1] = v9;
        v24 = v17;
        v22 = v21;
        md_tracing_dispatch_async_propagating();

        objc_destroyWeak(v25);
        objc_destroyWeak(&location);
      }
LABEL_17:
      -[SPKQuery responseHandler](self, "responseHandler");
      v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v23)[2](v23, v4);

    }
  }

}

void __33__SPCSSearchQuery__sendResponse___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendFeedbackType:feedback:queryId:clientID:", 6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

    v4 = (void *)v5[60];
    v5[60] = 0;

    WeakRetained = v5;
  }

}

- (void)dealloc
{
  CSSearchQuery *csQuery;
  NSObject *timeoutTimer;
  OS_dispatch_source *v5;
  objc_super v6;

  csQuery = self->_csQuery;
  if (csQuery)
    -[CSSearchQuery cancel](csQuery, "cancel");
  if (_os_feature_enabled_impl())
  {
    os_unfair_lock_lock(&self->_timeoutTimerLock);
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_source_cancel(timeoutTimer);
      v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    os_unfair_lock_unlock(&self->_timeoutTimerLock);
  }
  v6.receiver = self;
  v6.super_class = (Class)SPCSSearchQuery;
  -[SPCSSearchQuery dealloc](&v6, sel_dealloc);
}

- (void)collectSearchResults:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  void *v19;
  _BOOL4 v20;
  vector<std::vector<(anonymous namespace)::SPResultValueItem>, std::allocator<std::vector<(anonymous namespace)::SPResultValueItem>>> *p_resultHeaps;
  void *v22;
  char *value;
  char *end;
  void *v25;
  char *begin;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  __int128 v35;
  uint64_t *v36;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t *v40;
  _anonymous_namespace_::SPResultValueItem *v41;
  uint64_t *v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unsigned __int128 *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  __int128 v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  float v77;
  int v78;
  void *v79;
  void *v80;
  unsigned __int128 *v81;
  char *v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unsigned __int128 v86;
  unsigned __int128 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  _anonymous_namespace_::SPResultValueItem *v94;
  unsigned __int128 v95;
  unsigned __int128 v96;
  unsigned __int128 v97;
  int v98;
  int v99;
  void *v100;
  void *v101;
  void *v102;
  CFHashCode v103;
  unsigned __int128 v104;
  unsigned __int128 v105;
  unsigned __int128 v106;
  unsigned int *v107;
  unint64_t v108;
  unsigned int *v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  BOOL v116;
  BOOL v117;
  __int128 v118;
  uint64_t v119;
  unint64_t v120;
  _QWORD *v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id *v126;
  __int128 v127;
  _QWORD *v128;
  unint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id *v133;
  BOOL v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unsigned __int128 *v142;
  uint64_t v143;
  _OWORD *v144;
  id v145;
  id obj;
  int cf;
  CFTypeRef cfa;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  CSSearchableItem *v154;
  void *v155;
  unsigned __int128 v156;
  unsigned __int128 v157;
  id v158[3];
  unint64_t v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint8_t buf[16];
  _anonymous_namespace_::SPResultValueItem *v165[2];
  id v166[2];
  __int128 v167;
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v168, 16);
  if (v3)
  {
    v149 = *(_QWORD *)v161;
    v143 = *MEMORY[0x24BEB03E0];
    v141 = *MEMORY[0x24BEB03F8];
    v140 = *MEMORY[0x24BEB0478];
    v135 = *MEMORY[0x24BDC22E8];
    do
    {
      v4 = 0;
      v150 = v3;
      do
      {
        if (*(_QWORD *)v161 != v149)
          objc_enumerationMutation(obj);
        v154 = (CSSearchableItem *)*(id *)(*((_QWORD *)&v160 + 1) + 8 * v4);
        -[CSSearchableItem attributeSet](v154, "attributeSet");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleID");
        v155 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = v155;
        if (v155)
        {
          SPLogForSPLogCategoryDefault();
          v7 = objc_claimAutoreleasedReturnValue();
          v8 = 2 * (*MEMORY[0x24BE84AF8] == 0);
          if (os_log_type_enabled(v7, v8))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v155;
            _os_log_impl(&dword_2279CC000, v7, v8, "Got result for bundle %@", buf, 0xCu);
          }

          -[CSSearchableItem attributeSet](v154, "attributeSet");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "expirationDate");
          v152 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v152
            || (objc_msgSend(v152, "timeIntervalSinceReferenceDate"),
                v11 = v10,
                -[SPKQuery queryContext](self, "queryContext"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v12, "currentTime"),
                v14 = v11 < v13,
                v12,
                !v14))
          {
            -[CSSearchQuery queryContext](self->_csQuery, "queryContext");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "maxCount");

            v17 = objc_msgSend(v155, "isEqualToString:", v143);
            if (v17 && !-[SPCSSearchQuery isPeopleSearch](self, "isPeopleSearch"))
              v16 *= 5;
            cf = v17;
            v18 = 300;
            if ((unint64_t)(v16 - 301) >= 0xFFFFFFFFFFFFFED4)
              v18 = v16;
            v159 = v18;
            -[NSMutableDictionary objectForKey:](self->_foundBundleIDs, "objectForKey:", v155);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19 == 0;

            if (v20)
            {
              p_resultHeaps = &self->_resultHeaps;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", 0xAAAAAAAAAAAAAAABLL * (((char *)self->_resultHeaps.__end_ - (char *)self->_resultHeaps.__begin_) >> 3));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_foundBundleIDs, "setObject:forKeyedSubscript:", v22, v155);

              end = (char *)self->_resultHeaps.__end_;
              value = (char *)self->_resultHeaps.__end_cap_.__value_;
              if (end >= value)
              {
                begin = (char *)p_resultHeaps->__begin_;
                v27 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)p_resultHeaps->__begin_) >> 3);
                v28 = v27 + 1;
                if (v27 + 1 > 0xAAAAAAAAAAAAAAALL)
                  abort();
                v29 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
                if (2 * v29 > v28)
                  v28 = 2 * v29;
                if (v29 >= 0x555555555555555)
                  v30 = 0xAAAAAAAAAAAAAAALL;
                else
                  v30 = v28;
                if (v30)
                {
                  if (v30 > 0xAAAAAAAAAAAAAAALL)
                    std::__throw_bad_array_new_length[abi:nn180100]();
                  v31 = (char *)operator new(24 * v30);
                }
                else
                {
                  v31 = 0;
                }
                v32 = &v31[24 * v27];
                v33 = &v31[24 * v30];
                *(_QWORD *)v32 = 0;
                *((_QWORD *)v32 + 1) = 0;
                *((_QWORD *)v32 + 2) = 0;
                v25 = v32 + 24;
                if (end == begin)
                {
                  p_resultHeaps->__begin_ = v32;
                  self->_resultHeaps.__end_ = v25;
                  self->_resultHeaps.__end_cap_.__value_ = v33;
                }
                else
                {
                  do
                  {
                    v34 = v32;
                    *((_QWORD *)v32 - 2) = 0;
                    *((_QWORD *)v32 - 1) = 0;
                    v35 = *(_OWORD *)(end - 24);
                    end -= 24;
                    *(_OWORD *)(v32 - 24) = v35;
                    v32 -= 24;
                    *((_QWORD *)v34 - 1) = *((_QWORD *)end + 2);
                    *(_QWORD *)end = 0;
                    *((_QWORD *)end + 1) = 0;
                    *((_QWORD *)end + 2) = 0;
                  }
                  while (end != begin);
                  end = (char *)p_resultHeaps->__begin_;
                  v36 = (uint64_t *)self->_resultHeaps.__end_;
                  p_resultHeaps->__begin_ = v32;
                  self->_resultHeaps.__end_ = v25;
                  self->_resultHeaps.__end_cap_.__value_ = v33;
                  while (v36 != (uint64_t *)end)
                  {
                    v36 -= 3;
                  }
                }
                if (end)
                  operator delete(end);
              }
              else
              {
                *(_QWORD *)end = 0;
                *((_QWORD *)end + 1) = 0;
                v25 = end + 24;
                *((_QWORD *)end + 2) = 0;
              }
              self->_resultHeaps.__end_ = v25;
              *(_QWORD *)&v167 = 0;

              *(_QWORD *)&v167 = 0;

            }
            -[NSMutableDictionary objectForKeyedSubscript:](self->_foundBundleIDs, "objectForKeyedSubscript:", v155);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v151 = objc_msgSend(v37, "unsignedLongValue");

            v38 = (char *)self->_resultHeaps.__begin_;
            v39 = v151;
            v40 = (uint64_t *)&v38[24 * v151];
            v42 = v40 + 1;
            v41 = (_anonymous_namespace_::SPResultValueItem *)v40[1];
            v43 = *v40;
            v44 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v41 - *v40) >> 4);
            if (v44 >= v159)
            {
              v157 = 0u;
              *(_OWORD *)v158 = 0u;
              v156 = 0u;
              v50 = (unsigned __int128 *)*v42;
              v51 = *v42 - 48;
              v52 = *(_QWORD *)(*v42 - 40);
              if (__PAIR128__(v52, *(_QWORD *)v51) < v156
                || v156 >= __PAIR128__(v52, *(_QWORD *)v51)
                && ((v77 = *((float *)v50 - 5), v77 < *((float *)&v157 + 3))
                 || *((float *)&v157 + 3) >= v77
                 && ((v78 = *((_DWORD *)v50 - 6), v78 < SDWORD2(v157))
                  || SDWORD2(v157) >= v78 && *((double *)v50 - 4) < *(double *)&v157)))
              {
                v53 = *v40;
                v54 = (uint64_t)v50 - *v40;
                v55 = *v42;
                if (v54 >= 49)
                {
                  v144 = (_OWORD *)(*v42 - 48);
                  v142 = (unsigned __int128 *)*v42;
                  v56 = 0;
                  v57 = 0xAAAAAAAAAAAAAAABLL * (v54 >> 4);
                  *(_OWORD *)buf = *(_OWORD *)v53;
                  *(_OWORD *)v165 = *(_OWORD *)(v53 + 16);
                  v139 = *(_QWORD *)(v53 + 32);
                  v137 = v38;
                  v138 = *(_QWORD *)(v53 + 40);
                  *(_QWORD *)(v53 + 32) = 0;
                  *(_QWORD *)(v53 + 40) = 0;
                  v136 = v53;
                  v58 = v53;
                  do
                  {
                    v59 = v58 + 48 * v56 + 48;
                    v60 = 2 * v56;
                    v56 = (2 * v56) | 1;
                    v61 = v60 + 2;
                    {
                      v59 += 48;
                      v56 = v61;
                    }
                    v62 = *(_OWORD *)(v59 + 16);
                    *(_OWORD *)v58 = *(_OWORD *)v59;
                    *(_OWORD *)(v58 + 16) = v62;
                    v63 = *(_QWORD *)(v59 + 32);
                    *(_QWORD *)(v59 + 32) = 0;
                    v64 = *(void **)(v58 + 32);
                    *(_QWORD *)(v58 + 32) = v63;

                    v65 = *(_QWORD *)(v59 + 40);
                    *(_QWORD *)(v59 + 40) = 0;
                    v66 = *(void **)(v58 + 40);
                    *(_QWORD *)(v58 + 40) = v65;

                    v58 = v59;
                  }
                  while (v56 <= (uint64_t)((unint64_t)(v57 - 2) >> 1));
                  if ((_OWORD *)v59 == v144)
                  {
                    *v144 = *(_OWORD *)buf;
                    v144[1] = *(_OWORD *)v165;
                    v79 = *(void **)(v59 + 32);
                    *(_QWORD *)(v59 + 32) = v139;

                    v80 = *(void **)(v59 + 40);
                    *(_QWORD *)(v59 + 40) = v138;

                  }
                  else
                  {
                    v67 = v144[1];
                    *(_OWORD *)v59 = *v144;
                    *(_OWORD *)(v59 + 16) = v67;
                    v68 = *((_QWORD *)v142 - 2);
                    *((_QWORD *)v142 - 2) = 0;
                    v69 = *(void **)(v59 + 32);
                    *(_QWORD *)(v59 + 32) = v68;

                    v70 = *((_QWORD *)v142 - 1);
                    *((_QWORD *)v142 - 1) = 0;
                    v71 = *(void **)(v59 + 40);
                    *(_QWORD *)(v59 + 40) = v70;

                    *v144 = *(_OWORD *)buf;
                    v144[1] = *(_OWORD *)v165;
                    v72 = (void *)*((_QWORD *)v142 - 2);
                    *((_QWORD *)v142 - 2) = v139;

                    v73 = (void *)*((_QWORD *)v142 - 1);
                    *((_QWORD *)v142 - 1) = v138;

                  }
                  v38 = v137;
                  v55 = *v42;
                  v39 = v151;
                  v50 = v142;
                  v51 = (uint64_t)v144;
                }
                v81 = (unsigned __int128 *)*v42;
                v82 = &v38[24 * v39];
                v85 = *((_QWORD *)v82 + 2);
                v83 = (uint64_t)(v82 + 16);
                v84 = v85;
                if (*v42 >= v85)
                {
                  v89 = *v40;
                  v90 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v81 - *v40) >> 4);
                  v91 = v90 + 1;
                  if ((unint64_t)(v90 + 1) > 0x555555555555555)
                    abort();
                  v166[0] = 0;
                  *(_OWORD *)buf = 0u;
                  *(_OWORD *)v165 = 0u;
                  v92 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v84 - v89) >> 4);
                  if (2 * v92 > v91)
                    v91 = 2 * v92;
                  if (v92 >= 0x2AAAAAAAAAAAAAALL)
                    v93 = 0x555555555555555;
                  else
                    v93 = v91;
                  v94 = v165[0];
                  v95 = v157;
                  *(_OWORD *)v165[0] = v156;
                  *((_OWORD *)v94 + 1) = v95;
                  v96 = *(_OWORD *)v158;
                  *(_OWORD *)v158 = 0uLL;
                  *((_OWORD *)v94 + 2) = v96;
                  v165[0] = (_anonymous_namespace_::SPResultValueItem *)((char *)v165[0] + 48);
                  v88 = *v42;
                }
                else
                {
                  v86 = v157;
                  *v81 = v156;
                  v81[1] = v86;
                  v87 = *(_OWORD *)v158;
                  *(_OWORD *)v158 = 0uLL;
                  v81[2] = v87;
                  v88 = (uint64_t)(v81 + 3);
                }
                *v42 = v88;
                v97 = *(_OWORD *)(v51 + 16);
                v156 = *(_OWORD *)v51;
                v157 = v97;
                objc_storeStrong(v158, *((id *)v50 - 2));
                objc_storeStrong(&v158[1], *((id *)v50 - 1));
              }
              v98 = objc_msgSend(v155, "isEqualToString:", v141);
              v99 = objc_msgSend(v155, "isEqualToString:", v140);
              if (((v98 | cf) & 1) != 0)
              {
                -[CSSearchableItem attributeSet](v154, "attributeSet");
                if (v98)
                {
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "domainIdentifier");
                }
                else
                {
                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v100, "mailConversationID");
                }
                cfa = (CFTypeRef)objc_claimAutoreleasedReturnValue();
              }
              else if (v99)
              {
                -[CSSearchableItem attributeSet](v154, "attributeSet");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "photosContainerIdentifier");
                cfa = (CFTypeRef)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                -[CSSearchableItem attributeSet](v154, "attributeSet");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "attributeDictionary");
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "objectForKeyedSubscript:", v135);
                cfa = (CFTypeRef)objc_claimAutoreleasedReturnValue();

              }
              v102 = (void *)cfa;
              if (cfa)
              {
                v103 = CFHash(cfa);
                v104 = v156;
                v105 = v157;
                v106 = *(_OWORD *)v158;
                v145 = v158[1];
                *(_OWORD *)v158 = 0uLL;
                *(_OWORD *)v166 = 0u;
                v167 = 0u;
                *(_OWORD *)buf = 0u;
                *(_OWORD *)v165 = 0u;
                *(_QWORD *)&v167 = 0;
                v107 = (unsigned int *)self->_resultRankTables.__begin_;
                v108 = v107[8 * v151];
                if (!(_DWORD)v108)
                  goto LABEL_101;
                v109 = &v107[8 * v151];
                v112 = *((_QWORD *)v109 + 1);
                v111 = (uint64_t *)(v109 + 2);
                v110 = v112;
                v113 = (v103 - 1) % v108;
                v114 = v112 + (v113 << 6);
                v115 = *(_QWORD *)(v114 + 40);
                v116 = !v115 || v145 == 0;
                v117 = !v116 && v115 >= (unint64_t)v145;
                if (v117 && *(_QWORD *)(v114 + 48))
                {
LABEL_101:
                  v128 = self->_resultRecencyTables.__begin_;
                  v129 = LODWORD(v128[4 * v151]);
                  if ((_DWORD)v129)
                  {
                    v130 = (v103 - 1) % v129;
                    v131 = v128[4 * v151 + 1];
                    v132 = v131 + (v130 << 6);
                    v133 = (id *)(v132 + 40);
                    v134 = !*(_QWORD *)(v132 + 40) || v145 == 0;
                    if (v134 || *(double *)(v132 + 16) < *(double *)&v105 || !*(_QWORD *)(v131 + (v130 << 6) + 48))
                    {
                      *(_OWORD *)v132 = v104;
                      *(_OWORD *)(v132 + 16) = v105;
                      objc_storeStrong((id *)(v132 + 32), (id)v106);
                      objc_storeStrong(v133, v145);
                      *(_QWORD *)(v131 + (v130 << 6) + 48) = v103;
                    }
                  }
                }
                else
                {
                  v118 = *(_OWORD *)(v114 + 16);
                  *(_OWORD *)buf = *(_OWORD *)v114;
                  *(_OWORD *)v165 = v118;
                  objc_storeStrong(v166, *(id *)(v114 + 32));
                  objc_storeStrong(&v166[1], *(id *)(v114 + 40));
                  *(_QWORD *)&v167 = *(_QWORD *)(v110 + (v113 << 6) + 48);
                  v119 = *v111;
                  v120 = *v111 + (v113 << 6);
                  *(_OWORD *)v120 = v104;
                  *(_OWORD *)(v120 + 16) = v105;
                  objc_storeStrong((id *)(v120 + 32), (id)v106);
                  objc_storeStrong((id *)(v120 + 40), v145);
                  *(_QWORD *)(v119 + (v113 << 6) + 48) = v103;
                  if (v166[1])
                  {
                    v121 = self->_resultRecencyTables.__begin_;
                    v122 = LODWORD(v121[4 * v151]);
                    if ((_DWORD)v122)
                    {
                      v123 = ((uint64_t)v167 - 1) % v122;
                      v124 = v121[4 * v151 + 1];
                      v125 = v124 + (v123 << 6);
                      v126 = (id *)(v125 + 40);
                      if (!*(_QWORD *)(v125 + 40)
                        || *(double *)(v125 + 16) < *(double *)v165
                        || !*(_QWORD *)(v124 + (v123 << 6) + 48))
                      {
                        v127 = *(_OWORD *)v165;
                        *(_OWORD *)v125 = *(_OWORD *)buf;
                        *(_OWORD *)(v125 + 16) = v127;
                        objc_storeStrong((id *)(v125 + 32), v166[0]);
                        objc_storeStrong(v126, v166[1]);
                        *(_QWORD *)(v124 + (v123 << 6) + 48) = v167;
                      }
                    }
                  }
                }

                v102 = (void *)cfa;
              }

            }
            else
            {
              v45 = &v38[24 * v151];
              v48 = *((_QWORD *)v45 + 2);
              v46 = (uint64_t)(v45 + 16);
              v47 = v48;
              if ((unint64_t)v41 >= v48)
              {
                if (v44 + 1 > 0x555555555555555)
                  abort();
                v166[0] = 0;
                *(_OWORD *)buf = 0u;
                *(_OWORD *)v165 = 0u;
                v74 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v47 - v43) >> 4);
                v75 = 2 * v74;
                if (2 * v74 <= v44 + 1)
                  v75 = v44 + 1;
                if (v74 >= 0x2AAAAAAAAAAAAAALL)
                  v76 = 0x555555555555555;
                else
                  v76 = v75;
                v165[0] = (_anonymous_namespace_::SPResultValueItem *)((char *)v165[0] + 48);
                v49 = *v42;
              }
              else
              {
                v49 = (uint64_t)v41 + 48;
                *v42 = v49;
              }
              *v42 = v49;
            }
          }

          v6 = v155;
        }

        ++v4;
      }
      while (v4 != v150);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v168, 16);
    }
    while (v3);
  }

}

- (void)addSearchResult:(const SPResultValueItem *)a3 withFoundBundleID:(double)a4
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  void *v26;
  _BOOL4 v27;
  NSObject *v28;
  os_log_type_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  id v38;
  _anonymous_namespace_ *v39;
  NSObject *v40;
  void *v41;
  _BOOL4 v42;
  NSObject *v43;
  uint64_t isKindOfClass;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  _BOOL4 v56;
  uint64_t v57;
  NSIndexSet *resultAttrIndexSet;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  SPSearchTopHitResult *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  void *v73;
  id v74;
  id v75;
  BundleIdToResultMap *p_bundleIdToResultsMap;
  unsigned __int8 *v77;
  void *v78;
  uint64_t v79;
  id v80;
  unsigned __int8 *v81;
  void *v82;
  void *v83;
  SPSearchTopHitResult *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  NSString *v90;
  SPSearchTopHitResult *v91;
  void *v92;
  os_log_type_t v93;
  void *v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  void *v98;
  int v99;
  void *v100;
  SPSearchTopHitResult *v101;
  void *v102;
  void *v103;
  void *v104;
  unsigned __int128 v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  _QWORD v114[4];
  NSObject *v115;
  SPCSSearchQuery *v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t *v122;
  _BYTE v123[128];
  uint8_t buf[24];
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  v113 = *(id *)&a5;
  v105 = *(_OWORD *)a3;
  objc_msgSend(*((id *)a3 + 5), "attributeSet");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "attributeDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "uniqueIdentifier");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v113, "isEqualToString:", CFSTR("com.apple.spotlight.category")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC2130]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC2128]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    if (v11)
    {
      if (objc_msgSend(v11, "count"))
      {
        if (v12)
        {
          v14 = objc_msgSend(v12, "count");
          if (v14 == objc_msgSend(v11, "count"))
          {
            for (i = 0; objc_msgSend(v11, "count") > i; ++i)
            {
              objc_msgSend(v11, "objectAtIndex:", i);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[SPKQuery userQueryString](self, "userQueryString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "isEqualToString:", v17);

              if (v18)
              {
                objc_msgSend(v12, "objectAtIndex:", i);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "addObject:", v19);

              }
            }
            if (objc_msgSend(v13, "count"))
            {
              -[PRSRankingConfiguration categoryEngagements](self->_rankingInfo, "categoryEngagements");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setValue:forKey:", v13, v111);

            }
          }
        }
      }
    }

  }
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDC1B90]);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v109)
  {
    if (objc_msgSend(v113, "isEqualToString:", *MEMORY[0x24BE849A8])
      && -[NSSet containsObject:](self->_disabledAppSet, "containsObject:", v111))
    {
      SPLogForSPLogCategoryDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      v112 = v21;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v111;
        v22 = "Skipping disabled app %@";
        v23 = v21;
        v24 = OS_LOG_TYPE_DEFAULT;
        v25 = 12;
LABEL_27:
        _os_log_impl(&dword_2279CC000, v23, v24, v22, buf, v25);
        goto LABEL_105;
      }
      goto LABEL_105;
    }
    if (objc_msgSend(v113, "isEqualToString:", CFSTR("com.apple.shortcuts")))
    {
      objc_msgSend(v110, "relatedAppBundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v112 = v26;
        v27 = -[NSSet containsObject:](self->_disabledAppSet, "containsObject:");
        v26 = v112;
        if (v27)
        {
          SPLogForSPLogCategoryDefault();
          v28 = objc_claimAutoreleasedReturnValue();
          v29 = *MEMORY[0x24BE84B00] ^ 1;
          if (os_log_type_enabled(v28, v29))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v112;
            _os_log_impl(&dword_2279CC000, v28, v29, "Skipping shortcut for disabled app %@", buf, 0xCu);
          }

          goto LABEL_105;
        }
      }

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1D70]);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (void *)objc_msgSend(v113, "copy");
    v32 = objc_msgSend(v112, "length");
    v33 = *MEMORY[0x24BDC2318];
    if (v32)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC2318]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {

      }
      else if ((objc_msgSend(v113, "isEqualToString:", *MEMORY[0x24BEB05D0]) & 1) == 0)
      {
        v38 = (id)*MEMORY[0x24BEB03A8];

        v108 = v38;
        goto LABEL_37;
      }
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B18]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.DocumentManager"));

      if ((v37 & 1) != 0)
        goto LABEL_104;
    }
LABEL_37:
    if (!objc_msgSend(v108, "isEqualToString:", *MEMORY[0x24BEB04D0]))
      goto LABEL_46;
    objc_msgSend(v110, "relatedAppBundleIdentifier");
    v39 = (_anonymous_namespace_ *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v39)
      goto LABEL_41;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "containsObject:", v40) & 1) != 0)
    {
      v42 = -[NSSet containsObject:](self->_disabledAppSet, "containsObject:", v40);

      if (!v42)
      {
LABEL_41:
        if (!objc_msgSend(v109, "isEqualToString:", CFSTR("com.apple.Preferences.thirdPartyApp")))
        {
LABEL_45:

LABEL_46:
          -[SPKQuery queryContext](self, "queryContext");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "disabledBundles");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v48, "containsObject:", v113))
          {
            v49 = objc_msgSend(&unk_24F025128, "containsObject:", v113);

            if ((v49 & 1) == 0)
            {
              SPLogForSPLogCategoryDefault();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v113;
                _os_log_impl(&dword_2279CC000, v40, OS_LOG_TYPE_DEFAULT, "[ProtectedApps] item from disabled bundle %@ was found", buf, 0xCu);
              }
              goto LABEL_103;
            }
          }
          else
          {

          }
          v120 = 0u;
          v121 = 0u;
          v118 = 0u;
          v119 = 0u;
          -[NSArray objectsAtIndexes:](self->_resultAttrs, "objectsAtIndexes:", self->_resultAttrIndexSet);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0;
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v118, v123, 16);
          if (v52)
          {
            v53 = *(_QWORD *)v119;
            do
            {
              for (j = 0; j != v52; ++j)
              {
                if (*(_QWORD *)v119 != v53)
                  objc_enumerationMutation(v50);
                objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * j));
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = v55 != 0;

                v51 += v56;
              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v118, v123, 16);
            }
            while (v52);
          }

          v57 = SSCompactRankingAttrsAlloc();
          resultAttrIndexSet = self->_resultAttrIndexSet;
          v114[0] = MEMORY[0x24BDAC760];
          v114[1] = 3221225472;
          v114[2] = __53__SPCSSearchQuery_addSearchResult_withFoundBundleID___block_invoke;
          v114[3] = &unk_24F01B5C0;
          v59 = v10;
          v115 = v59;
          v116 = self;
          v117 = v57;
          -[NSIndexSet enumerateIndexesUsingBlock:](resultAttrIndexSet, "enumerateIndexesUsingBlock:", v114);
          v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0228]), "initWithAttrs:", v57);
          -[NSObject objectForKeyedSubscript:](v59, "objectForKeyedSubscript:", *MEMORY[0x24BDC2188]);
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v59, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v59, "objectForKeyedSubscript:", *MEMORY[0x24BDC2060]);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          if (v100
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && objc_msgSend(v100, "integerValue") >= 1
            && (objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB0478]) & 1) == 0)
          {
            if ((objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03F8]) & 1) != 0)
            {
              v95 = 100663296;
            }
            else if ((objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB0408]) & 1) != 0)
            {
              v95 = 167772160;
            }
            else if ((objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03A8]) & 1) != 0
                   || (objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03D8]) & 1) != 0
                   || objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03C0]))
            {
              v95 = 301989888;
            }
            else
            {
              v95 = 0x2000000;
            }
            objc_msgSend(v104, "setBundleIDType:", v95);
            v98 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0228]), "initWithAttrs:", SSCompactRankingAttrsCopy());
            objc_msgSend(v98, "setBundleIDType:", objc_msgSend(v104, "bundleIDType"));
            objc_msgSend(v98, "setSectionBundleIdentifier:", *MEMORY[0x24BEB05F0]);
            v103 = v98;
            v99 = 1;
          }
          else
          {
            v99 = 0;
            v103 = 0;
          }
          if (v106 && objc_msgSend(v106, "count") == 6)
          {
            if (objc_msgSend(v112, "length"))
              objc_msgSend(v104, "setSectionBundleIdentifier:", v102);
            -[SPCSSearchQuery itemRanker](self, "itemRanker");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setRenderEngagementFeaturesForItem:counts:isRender:bundleDict:", v104, v106, 1, self->_renderEngagementCounts);

            -[SPCSSearchQuery itemRanker](self, "itemRanker");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setRenderEngagementFeaturesForItem:counts:isRender:bundleDict:", v103, v106, 1, self->_renderEngagementCounts);

          }
          -[NSObject objectForKeyedSubscript:](v59, "objectForKeyedSubscript:", *MEMORY[0x24BDC1C28]);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v107 = v62;
          if (v62 && objc_msgSend(v62, "count") == 6)
          {
            if (objc_msgSend(v112, "length"))
              objc_msgSend(v104, "setSectionBundleIdentifier:", v102);
            -[SPCSSearchQuery itemRanker](self, "itemRanker");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "setRenderEngagementFeaturesForItem:counts:isRender:bundleDict:", v104, v62, 0, self->_renderEngagementCounts);

            -[SPCSSearchQuery itemRanker](self, "itemRanker");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setRenderEngagementFeaturesForItem:counts:isRender:bundleDict:", v103, v62, 0, self->_renderEngagementCounts);

          }
          v65 = [SPSearchTopHitResult alloc];
          objc_msgSend(*((id *)a3 + 5), "attributeSet");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = *(_QWORD *)a3;
          v68 = *((_QWORD *)a3 + 1);
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *((double *)a3 + 2));
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)a3 + 5), "protection");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = -[SPSearchTopHitResult initWithRankingItem:attributeSet:score:interestingDate:dataclass:bundleID:](v65, "initWithRankingItem:attributeSet:score:interestingDate:dataclass:bundleID:", v104, v66, v67, v68, v69, v70, v108);

          v71 = SPL1Threshold();
          if (v105 < __PAIR128__(v72, v71))
            objc_msgSend(v104, "setEligibleForDemotion:", 1);
          if (objc_msgSend(v109, "hasPrefix:", CFSTR("com.apple.siri.")))
          {
            objc_msgSend(v104, "L2FeatureVector");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "setIsSiriAction:", 1);

          }
          v74 = v108;
          memset(buf, 0, sizeof(buf));
          v75 = objc_retainAutorelease(v74);
          std::string::basic_string[abi:nn180100]<0>(buf, (char *)objc_msgSend(v75, "UTF8String"));
          p_bundleIdToResultsMap = &self->_bundleIdToResultsMap;
          if (std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::find<std::string>(&self->_bundleIdToResultsMap.map.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)buf))
          {
            v122 = buf;
            v77 = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_bundleIdToResultsMap, (uint64_t)buf, (uint64_t)&std::piecewise_construct, (__int128 **)&v122);
          }
          else
          {
            v78 = (void *)objc_opt_new();
            objc_msgSend(v78, "setDomain:", 1);
            objc_msgSend(v78, "setBundleIdentifier:", v75);
            v79 = objc_opt_new();
            v80 = v78;
            v122 = buf;
            v81 = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)p_bundleIdToResultsMap, (uint64_t)buf, (uint64_t)&std::piecewise_construct, (__int128 **)&v122);
            v82 = (void *)*((_QWORD *)v81 + 5);
            *((_QWORD *)v81 + 5) = v80;

            v83 = (void *)*((_QWORD *)v81 + 6);
            *((_QWORD *)v81 + 6) = v79;

            v122 = buf;
            v77 = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)p_bundleIdToResultsMap, (uint64_t)buf, (uint64_t)&std::piecewise_construct, (__int128 **)&v122);

          }
          if ((char)buf[23] < 0)
            operator delete(*(void **)buf);

          objc_msgSend(*((id *)v77 + 6), "addObject:", v101);
          if (v99)
          {
            v84 = [SPSearchTopHitResult alloc];
            objc_msgSend(*((id *)a3 + 5), "attributeSet");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = *(_QWORD *)a3;
            v87 = *((_QWORD *)a3 + 1);
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *((double *)a3 + 2));
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)a3 + 5), "protection");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = (NSString *)*MEMORY[0x24BEB05F0];
            v91 = -[SPSearchTopHitResult initWithRankingItem:attributeSet:score:interestingDate:dataclass:bundleID:](v84, "initWithRankingItem:attributeSet:score:interestingDate:dataclass:bundleID:", v103, v85, v86, v87, v88, v89, *MEMORY[0x24BEB05F0]);

            objc_msgSend(v103, "setEligibleForDemotion:", objc_msgSend(v104, "eligibleForDemotion"));
            if (objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03F8]))
            {
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "addObject:", v91);
            }
            else if (objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB0408]))
            {
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "addObject:", v91);
            }
            else if ((objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03A8]) & 1) != 0
                   || (objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03D8]) & 1) != 0
                   || (objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03C0]) & 1) != 0
                   || objc_msgSend(v102, "isEqualToString:", *MEMORY[0x24BEB03B8]))
            {
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "addObject:", v91);
            }
            else
            {
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "addObject:", v91);
            }

          }
          v40 = v115;
          goto LABEL_103;
        }
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDC22A0]);
        v43 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) == 0
              v45 = (void *)objc_claimAutoreleasedReturnValue(),
              v46 = objc_msgSend(v45, "containsObject:", v43),
              v45,
              (v46 & 1) != 0))
        {

          goto LABEL_45;
        }
        SPLogForSPLogCategoryDefault();
        v96 = objc_claimAutoreleasedReturnValue();
        v97 = 2 * (*MEMORY[0x24BE84AF8] == 0);
        if (os_log_type_enabled(v96, v97))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v43;
          _os_log_impl(&dword_2279CC000, v96, v97, "Skipping for uninstalled %@", buf, 0xCu);
        }

LABEL_102:
LABEL_103:

LABEL_104:
        goto LABEL_105;
      }
    }
    else
    {

    }
    SPLogForSPLogCategoryDefault();
    v43 = objc_claimAutoreleasedReturnValue();
    v93 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v43, v93))
    {
      objc_msgSend(v110, "relatedAppBundleIdentifier");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v94;
      _os_log_impl(&dword_2279CC000, v43, v93, "Skipping Settings item for app %@", buf, 0xCu);

    }
    goto LABEL_102;
  }
  SPLogForSPLogCategoryDefault();
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x24BE84B00] ^ 1;
  v112 = v30;
  if (os_log_type_enabled(v30, v31))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v111;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v113;
    v22 = "No UTI type for CoreSpotlight result, identifier:%@, bundleID:%@";
    v23 = v30;
    v24 = v31;
    v25 = 22;
    goto LABEL_27;
  }
LABEL_105:

}

void __53__SPCSSearchQuery_addSearchResult_withFoundBundleID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 408), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((a2 == 100 || a2 == 13) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SSCompactRankingAttrsInsertValue();

    }
    else
    {
      SSCompactRankingAttrsInsertValue();
    }
  }

}

- (void)constructResultsForResponse:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *begin;
  char *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t i;
  id *v18;
  __int128 v19;
  char *v20;
  char *v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t j;
  id *v26;
  __int128 v27;
  NSMutableDictionary *obj;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  void (*v32)(uint64_t, uint64_t);
  void *v33;
  SPCSSearchQuery *v34;
  uint64_t v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, uint64_t);
  void *v38;
  SPCSSearchQuery *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = self->_foundBundleIDs;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v4)
  {
    v30 = *(_QWORD *)v42;
    do
    {
      v5 = 0;
      v29 = v4;
      do
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v5);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_foundBundleIDs, "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "unsignedIntegerValue");

        v9 = (uint64_t *)((char *)self->_resultHeaps.__begin_ + 24 * v8);
        v10 = *v9;
        v11 = v9[1];
        if (v11 != *v9)
        {
          do
          {
            -[SPCSSearchQuery addSearchResult:withFoundBundleID:](self, "addSearchResult:withFoundBundleID:", v10, v6);
            v10 += 48;
          }
          while (v10 != v11);
          begin = (char *)self->_resultRankTables.__begin_;
          v36[0] = MEMORY[0x24BDAC760];
          v13 = &begin[32 * v8];
          v36[1] = 3221225472;
          v37 = __47__SPCSSearchQuery_constructResultsForResponse___block_invoke;
          v38 = &unk_24F01B5E8;
          v39 = self;
          v40 = v6;
          v14 = v36;
          v15 = *(unsigned int *)v13;
          if ((_DWORD)v15)
          {
            v16 = 0;
            for (i = 0; i < v15; ++i)
            {
              v18 = (id *)(*((_QWORD *)v13 + 1) + v16);
              if (v18[6])
              {
                v19 = *((_OWORD *)v18 + 1);
                v46 = *(_OWORD *)v18;
                v47 = v19;
                v48 = v18[4];
                v49 = v18[5];
                v50 = v18[6];
                v37((uint64_t)v14, (uint64_t)&v46);
                v15 = *(unsigned int *)v13;
              }
              v16 += 64;
            }
          }

          v4 = v29;
          v20 = (char *)self->_resultRecencyTables.__begin_;
          v31[0] = MEMORY[0x24BDAC760];
          v21 = &v20[32 * v8];
          v31[1] = 3221225472;
          v32 = __47__SPCSSearchQuery_constructResultsForResponse___block_invoke_2;
          v33 = &unk_24F01B5E8;
          v34 = self;
          v35 = v6;
          v22 = v31;
          v23 = *(unsigned int *)v21;
          if ((_DWORD)v23)
          {
            v24 = 0;
            for (j = 0; j < v23; ++j)
            {
              v26 = (id *)(*((_QWORD *)v21 + 1) + v24);
              if (v26[6])
              {
                v27 = *((_OWORD *)v26 + 1);
                v46 = *(_OWORD *)v26;
                v47 = v27;
                v48 = v26[4];
                v49 = v26[5];
                v50 = v26[6];
                v32((uint64_t)v22, (uint64_t)&v46);
                v23 = *(unsigned int *)v21;
              }
              v24 += 64;
            }
          }

        }
        ++v5;
      }
      while (v5 != v4);
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v4);
  }

}

void __47__SPCSSearchQuery_constructResultsForResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addSearchResult:withFoundBundleID:", a2, *(_QWORD *)(a1 + 40));

}

void __47__SPCSSearchQuery_constructResultsForResponse___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addSearchResult:withFoundBundleID:", a2, *(_QWORD *)(a1 + 40));

}

- (void)updateMailAttachmentResults:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  dispatch_time_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  id obj;
  id v43;
  void *v44;
  id *to;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  id v55;
  uint8_t buf[8];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (v3)
  {
    v4 = 0;
    to = *(id **)v62;
    v46 = 0;
    v5 = *MEMORY[0x24BDC2170];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(id **)v62 != to)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v7, "attributeSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "attributeDictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (!v4)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v11 = objc_claimAutoreleasedReturnValue();

            v46 = (void *)v11;
          }
          objc_msgSend(v7, "dataclass");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "dataclass");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

          }
          objc_msgSend(v46, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15
            || (v16 = objc_msgSend(v7, "score"),
                v18 = v17,
                v19 = objc_msgSend(v15, "score"),
                __PAIR128__(v20, v19) < __PAIR128__(v18, v16)))
          {
            objc_msgSend(v46, "setObject:forKeyedSubscript:", v7, v10);
            if (v15)
            {
              SPLogForSPLogCategoryDefault();
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = *MEMORY[0x24BE84B00] ^ 1;
              if (os_log_type_enabled(v21, v22))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2279CC000, v21, v22, "===^^ RANKING 4 Mail higher ranked replaced", buf, 2u);
              }

            }
            else
            {
              objc_msgSend(v13, "addObject:", v10);
            }
          }

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    }
    while (v3);

    if (!v4)
    {
      v37 = 0;
      goto LABEL_35;
    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v43 = v4;
    v23 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    if (v23)
    {
      v39 = *(_QWORD *)v58;
      v38 = *MEMORY[0x24BEB05C0];
      do
      {
        v41 = v23;
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v58 != v39)
            objc_enumerationMutation(v43);
          v25 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
          objc_msgSend(v43, "objectForKeyedSubscript:", v25, v38);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          rankingAttributeNameArray();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = dispatch_group_create();
          dispatch_group_enter(v27);
          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, self);
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = MEMORY[0x24BDAC760];
          v50[1] = 3221225472;
          v50[2] = __47__SPCSSearchQuery_updateMailAttachmentResults___block_invoke;
          v50[3] = &unk_24F01B610;
          objc_copyWeak(&v55, (id *)buf);
          v29 = v44;
          v51 = v29;
          v30 = v26;
          v52 = v30;
          v31 = v28;
          v53 = v31;
          v32 = v27;
          v54 = v32;
          v33 = (void *)MEMORY[0x22E2A214C](v50);
          objc_msgSend(MEMORY[0x24BDC2470], "defaultSearchableIndex");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "slowFetchAttributes:protectionClass:bundleID:identifiers:completionHandler:", v30, v25, v38, v29, v33);

          v35 = dispatch_time(0, 300000000);
          if (!dispatch_group_wait(v32, v35))
          {
            v47[0] = MEMORY[0x24BDAC760];
            v47[1] = 3221225472;
            v47[2] = __47__SPCSSearchQuery_updateMailAttachmentResults___block_invoke_179;
            v47[3] = &unk_24F01B638;
            v48 = v46;
            v49 = v31;
            objc_msgSend(v29, "enumerateObjectsUsingBlock:", v47);

          }
          objc_destroyWeak(&v55);

          objc_destroyWeak((id *)buf);
        }
        v23 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      }
      while (v23);
    }
    v36 = v43;
    v37 = v43;
  }
  else
  {
    v46 = 0;
    v37 = 0;
    v36 = obj;
  }

LABEL_35:
}

void __47__SPCSSearchQuery_updateMailAttachmentResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id WeakRetained;
  id v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v2 = objc_msgSend(v18, "count", WeakRetained);
    if (v2 == objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v19 = 0;
      v3 = (void *)*MEMORY[0x24BDBD430];
      while (v19 < objc_msgSend(v18, "count"))
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v5 = (void *)objc_opt_new();
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v6 = *(id *)(a1 + 40);
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v7)
          {
            v8 = 0;
            v9 = *(_QWORD *)v21;
            do
            {
              v10 = 0;
              do
              {
                if (*(_QWORD *)v21 != v9)
                  objc_enumerationMutation(v6);
                v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
                objc_msgSend(v4, "objectAtIndexedSubscript:", v8 + v10);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                if (v12 != v3)
                  objc_msgSend(v5, "setObject:forKey:", v12, v11);

                ++v10;
              }
              while (v7 != v10);
              v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
              v8 += v10;
            }
            while (v7);
          }

          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2480]), "initWithAttributes:", v5);
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);

        }
        ++v19;
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    }
    else
    {
      SPLogForSPLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_msgSend(*(id *)(a1 + 32), "count");
        *(_DWORD *)buf = 134218240;
        v26 = v15;
        v27 = 2048;
        v28 = objc_msgSend(v18, "count");
        _os_log_impl(&dword_2279CC000, v14, OS_LOG_TYPE_DEFAULT, "*warn* Could not fetch all related item attributes for mail attachments. Related items: %lu. Attributes fetched: %lu", buf, 0x16u);
      }

    }
  }

}

void __47__SPCSSearchQuery_updateMailAttachmentResults___block_invoke_179(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttributesFromDictionaryWithOutOverWriting:", v7);

  objc_msgSend(v8, "setAttributeSet:", v5);
}

- (id)prepareRankingItems:(id)a3 withResultSets:(id)a4 totalFeatureComputationTime:(double *)a5
{
  void *v7;
  void *v8;
  unint64_t v9;
  __int128 v10;
  void *v11;
  int IsSyndicatedPhotos;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  double Current;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  int v51;
  NSObject *v52;
  os_log_type_t v53;
  void *v54;
  int v55;
  int v56;
  char v57;
  os_log_type_t v58;
  void *v59;
  int v60;
  int v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  double v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  float v81;
  _BOOL4 v82;
  uint64_t v83;
  NSObject *v84;
  os_log_type_t v85;
  void *v86;
  NSObject *v88;
  os_log_type_t v89;
  void *v90;
  void *v91;
  unint64_t m;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t n;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v107;
  char v108;
  void *v109;
  void *v110;
  id v111;
  unint64_t v112;
  char v113;
  int v114;
  void *v115;
  void *v116;
  char v117;
  SPCSSearchQuery *v118;
  int v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[5];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t v139[128];
  uint8_t buf[4];
  _BYTE v141[14];
  __int16 v142;
  int v143;
  __int16 v144;
  double v145;
  __int16 v146;
  int v147;
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x24BDAC8D0];
  v111 = a3;
  v107 = a4;
  -[SPCSSearchQuery itemRanker](self, "itemRanker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPKQuery queryContext](self, "queryContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parseQUQuery:", v8);

  v115 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v111, "count"));
  v9 = 0;
  v125 = (void *)*MEMORY[0x24BDBD430];
  while (v9 < objc_msgSend(v111, "count"))
  {
    objc_msgSend(v115, "addObject:", v125);
    ++v9;
  }
  v112 = 0;
  v103 = *MEMORY[0x24BEB03F8];
  v104 = *MEMORY[0x24BEB03E0];
  *(_QWORD *)&v10 = 67109378;
  v102 = v10;
  v118 = self;
  while (v112 < objc_msgSend(v111, "count", v102))
  {
    objc_msgSend(v111, "objectAtIndexedSubscript:", v112);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "objectAtIndexedSubscript:", v112);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();
    v13 = (void *)objc_opt_new();
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v14 = v105;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v135, v149, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v136 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          objc_msgSend(v18, "rankingItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (!v20)
          {
            objc_msgSend(v18, "rankingItem");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setSectionBundleIdentifier:", v11);

            objc_msgSend(v18, "rankingItem");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v22);

          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v135, v149, 16);
      }
      while (v15);
    }

    Current = CFAbsoluteTimeGetCurrent();
    -[SPCSSearchQuery itemRanker](v118, "itemRanker");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "prepareItems:inBundle:", v13, v25);

    *a5 = CFAbsoluteTimeGetCurrent() - Current + *a5;
    if (IsSyndicatedPhotos)
    {
      v109 = (void *)objc_opt_new();
      v110 = (void *)objc_opt_new();
      v121 = objc_msgSend(v14, "count");
      -[SPCSSearchQuery itemRanker](v118, "itemRanker");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v26, "isNLSearch");

      -[SPCSSearchQuery itemRanker](v118, "itemRanker");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "queryTermCount") == 0;

      if (v28)
      {
        v113 = 0;
      }
      else
      {
        v133 = 0u;
        v134 = 0u;
        v131 = 0u;
        v132 = 0u;
        v29 = v14;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
        if (v30)
        {
          v31 = *(_QWORD *)v132;
          while (2)
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v132 != v31)
                objc_enumerationMutation(v29);
              objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * j), "rankingItem");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v33;
              if (v33)
              {
                objc_msgSend(v33, "L2FeatureVector");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "scoreForFeature:", 1929);
                v37 = v36;

                if (v37 == 1.0)
                {

                  v113 = 1;
                  goto LABEL_29;
                }
              }

            }
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
            if (v30)
              continue;
            break;
          }
        }
        v113 = 0;
LABEL_29:

      }
      if (v121)
      {
        v38 = 0;
        v123 = 0;
        v108 = 0;
        do
        {
          objc_msgSend(v14, "objectAtIndex:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "rankingItem");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (v40)
          {
            objc_msgSend(v40, "L2FeatureVector");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "scoreForFeature:", 2392);
            v44 = v43;

            objc_msgSend(v41, "L2FeatureVector");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "scoreForFeature:", 1929);
            v47 = v46;

            objc_msgSend(v41, "L2FeatureVector");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "scoreForFeature:", 2380);
            v50 = v49;

            if (v44 == 1.0)
              v51 = v119;
            else
              v51 = 0;
            if (!((v113 ^ 1) & 1 | (v47 == 1.0)) && (v51 & 1) == 0
              || (v47 == 1.0 ? (v57 = 1) : (v57 = v113),
                  (v57 & 1) == 0
               && v50 != 1.0
               && (objc_msgSend(v41, "photosExactMatch") & 1) == 0
               && ((objc_msgSend(v41, "photosMatch") | v51) & 1) == 0))
            {
              if ((*((_BYTE *)v118 + 448) & 2) != 0)
              {
                SPLogForSPLogCategoryDefault();
                v52 = objc_claimAutoreleasedReturnValue();
                v58 = *MEMORY[0x24BE84B00] ^ 1;
                if (os_log_type_enabled(v52, v58))
                {
                  objc_msgSend(v41, "identifier");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  v60 = objc_msgSend(v41, "photosExactMatch");
                  v61 = objc_msgSend(v41, "photosMatch");
                  *(_DWORD *)buf = 138413314;
                  *(_QWORD *)v141 = v59;
                  *(_WORD *)&v141[8] = 1024;
                  *(_DWORD *)&v141[10] = v60;
                  v142 = 1024;
                  v143 = v61;
                  v144 = 2048;
                  v145 = v44;
                  v146 = 1024;
                  v147 = v119;
                  _os_log_impl(&dword_2279CC000, v52, v58, "#####=== [Pommes Ranking] photo filtering ignored id:%@ exact:%d match:%d nl:%.0f isNL:%d", buf, 0x28u);

                }
              }
              else
              {
                objc_msgSend(v109, "addIndex:", v38);
                objc_msgSend(v110, "addIndex:", v123);
                SPLogForSPLogCategoryDefault();
                v52 = objc_claimAutoreleasedReturnValue();
                v53 = *MEMORY[0x24BE84B00] ^ 1;
                if (os_log_type_enabled(v52, v53))
                {
                  objc_msgSend(v41, "identifier");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = objc_msgSend(v41, "photosExactMatch");
                  v56 = objc_msgSend(v41, "photosMatch");
                  *(_DWORD *)buf = 138413314;
                  *(_QWORD *)v141 = v54;
                  *(_WORD *)&v141[8] = 1024;
                  *(_DWORD *)&v141[10] = v55;
                  v142 = 1024;
                  v143 = v56;
                  v144 = 2048;
                  v145 = v44;
                  v146 = 1024;
                  v147 = v119;
                  _os_log_impl(&dword_2279CC000, v52, v53, "#####=== photo filtered id:%@ exact:%d match:%d nl:%.0f isNL:%d", buf, 0x28u);

                }
                v108 = 1;
              }

            }
            ++v123;
          }

          ++v38;
        }
        while (v121 != v38);
        if ((v108 & 1) != 0)
        {
          objc_msgSend(v13, "removeObjectsAtIndexes:", v110);
          objc_msgSend(v14, "removeObjectsAtIndexes:", v109);
        }
      }

    }
    v62 = objc_msgSend(v116, "resultsCount");
    if (!v118->_isPeopleSearch)
      goto LABEL_90;
    v63 = v62;
    if ((objc_msgSend(v11, "isEqualToString:", v104) & 1) != 0)
    {
      if (v63 < 0xC9)
        goto LABEL_90;
    }
    else
    {
      v64 = objc_msgSend(v11, "isEqualToString:", v103);
      if (v63 > 0xC8)
        v65 = v64;
      else
        v65 = 0;
      if ((v65 & 1) == 0)
        goto LABEL_90;
    }
    v120 = (void *)objc_opt_new();
    v122 = (void *)objc_opt_new();
    objc_msgSend(v116, "resultSet");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v63);
    v67 = 0;
    v68 = v66;
    do
    {
      objc_msgSend(v124, "objectAtIndex:", v67);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "rankingItem");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
        objc_msgSend(v66, "addObject:", v70);

      ++v67;
      v66 = v68;
    }
    while (v63 != v67);
    v130[0] = MEMORY[0x24BDAC760];
    v130[1] = 3221225472;
    v130[2] = __82__SPCSSearchQuery_prepareRankingItems_withResultSets_totalFeatureComputationTime___block_invoke;
    v130[3] = &unk_24F01B660;
    v130[4] = v118;
    objc_msgSend(v68, "sortWithOptions:usingComparator:", 16, v130);
    v71 = objc_msgSend(v68, "count");
    if (v71 >= 0xC9)
    {
      for (k = 200; k != v71; ++k)
      {
        objc_msgSend(v66, "objectAtIndexedSubscript:", k);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "L2FeatureVector");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v75) = -8388608;
        objc_msgSend(v74, "setOriginalL2Score:", v75);

        v66 = v68;
      }
    }
    v76 = 0;
    v114 = 0;
    v117 = 0;
    do
    {
      while (1)
      {
        objc_msgSend(v124, "objectAtIndex:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "rankingItem");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v78;
        if (!v78)
          goto LABEL_80;
        objc_msgSend(v78, "L2FeatureVector");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "originalL2Score");
        v82 = v81 == -INFINITY;

        if (!v82)
          goto LABEL_80;
        v83 = objc_msgSend(v13, "indexOfObject:", v79);
        if (v83 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        objc_msgSend(v120, "addIndex:", v76);
        objc_msgSend(v122, "addIndex:", v83);

        ++v114;
        v117 = 1;
        if (v63 - 1 == v76++)
          goto LABEL_86;
      }
      SPLogForSPLogCategoryDefault();
      v84 = objc_claimAutoreleasedReturnValue();
      v85 = *MEMORY[0x24BE84B00] ^ 1;
      if (os_log_type_enabled(v84, v85))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2279CC000, v84, v85, "Item to remove not found in array of ranking items", buf, 2u);
      }

LABEL_80:
      ++v76;
      v86 = v68;
    }
    while (v63 != v76);
    if ((v117 & 1) == 0)
      goto LABEL_89;
LABEL_86:
    SPLogForSPLogCategoryDefault();
    v88 = objc_claimAutoreleasedReturnValue();
    v89 = *MEMORY[0x24BE84B00] ^ 1;
    if (os_log_type_enabled(v88, v89))
    {
      *(_DWORD *)buf = v102;
      *(_DWORD *)v141 = v114;
      *(_WORD *)&v141[4] = 2112;
      *(_QWORD *)&v141[6] = v11;
      _os_log_impl(&dword_2279CC000, v88, v89, "Removing %d items from %@", buf, 0x12u);
    }

    v86 = v68;
    objc_msgSend(v13, "removeObjectsAtIndexes:", v122);
    objc_msgSend(v124, "removeObjectsAtIndexes:", v120);
LABEL_89:

LABEL_90:
    if (objc_msgSend(v13, "count"))
    {
      v90 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v115, "setObject:atIndexedSubscript:", v90, v112);

    }
    objc_msgSend(v13, "removeAllObjects");

    ++v112;
  }
  v91 = (void *)objc_opt_new();
  for (m = 0; m < objc_msgSend(v115, "count"); ++m)
  {
    objc_msgSend(v115, "objectAtIndexedSubscript:", m);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93 != v125)
    {
      objc_msgSend(v115, "objectAtIndexedSubscript:", m);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "addObjectsFromArray:", v94);

    }
  }
  v95 = (void *)objc_opt_new();
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v96 = v91;
  v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
  if (v97)
  {
    v98 = 0;
    v99 = *(_QWORD *)v127;
    do
    {
      for (n = 0; n != v97; ++n)
      {
        if (*(_QWORD *)v127 != v99)
          objc_enumerationMutation(v96);
        if (*(void **)(*((_QWORD *)&v126 + 1) + 8 * n) == v125)
          objc_msgSend(v95, "addIndex:", v98 + n);
      }
      v97 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v126, v139, 16);
      v98 += n;
    }
    while (v97);
  }

  objc_msgSend(v96, "removeObjectsAtIndexes:", v95);
  return v96;
}

uint64_t __82__SPCSSearchQuery_prepareRankingItems_withResultSets_totalFeatureComputationTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;

  v5 = a3;
  objc_msgSend(a2, "interestingDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interestingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "currentTime");
  v11 = v10;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "currentTime");
  v15 = v13 - v14;
  if (v9 - v11 <= v15)
    v16 = v9 - v11 < v15;
  else
    v16 = -1;

  return v16;
}

- (void)buildFullSearchResults:(id)a3 withResultSets:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double currentTime;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  unint64_t *p_queryId;
  void *v33;
  char v34;
  id *p_userQueryString;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  char v48;
  void *v49;
  int v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  __CFString *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  char IsSyndicatedPhotos;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  unint64_t v85;
  uint64_t v86;
  id obj;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v80 = a3;
  v61 = a4;
  v66 = (void *)objc_opt_new();
  v62 = (void *)objc_opt_new();
  v85 = 0;
  v90 = *MEMORY[0x24BEB06C0];
  v83 = *MEMORY[0x24BEB06C8];
  v70 = *MEMORY[0x24BEB06E0];
  v65 = *MEMORY[0x24BEB06E8];
  v63 = *MEMORY[0x24BEB06D0];
  v59 = *MEMORY[0x24BEB06D8];
  v86 = *MEMORY[0x24BEB06F8];
  v79 = *MEMORY[0x24BEB05E8];
  v77 = *MEMORY[0x24BEB0698];
  v74 = *MEMORY[0x24BEB0358];
  v69 = *MEMORY[0x24BEB0548];
  v68 = *MEMORY[0x24BEB03C8];
  v64 = *MEMORY[0x24BEB0458];
  v78 = *MEMORY[0x24BEB05D0];
  v76 = *MEMORY[0x24BEB0408];
  v73 = *MEMORY[0x24BEB03D8];
  v72 = *MEMORY[0x24BEB03C0];
  v71 = *MEMORY[0x24BEB03B8];
  v82 = *MEMORY[0x24BEB05F0];
  while (v85 < objc_msgSend(v80, "count"))
  {
    objc_msgSend(v80, "objectAtIndexedSubscript:");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "bundleIdentifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v84, "isEqualToString:", v90) & 1) == 0
      && (objc_msgSend(v84, "isEqualToString:", v83) & 1) == 0
      && (objc_msgSend(v84, "isEqualToString:", v70) & 1) == 0
      && (objc_msgSend(v84, "isEqualToString:", v65) & 1) == 0
      && (objc_msgSend(v84, "isEqualToString:", v63) & 1) == 0
      && (objc_msgSend(v84, "isEqualToString:", v59) & 1) == 0)
    {
      objc_msgSend(v61, "objectAtIndexedSubscript:", v85);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (SSSectionIsSyndicatedPhotos())
      {
        objc_msgSend(MEMORY[0x24BEB02D0], "sharedInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "resultSet");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPKQuery userQueryString](self, "userQueryString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPCSSearchQuery currentTime](self, "currentTime");
        objc_msgSend(v6, "sortAndFilterRankedPhotosItemsFilterFromSet:maxCount:userQuery:currentTime:", v7, 20, v8);

      }
      v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v58, "count"));
      v75 = (void *)objc_opt_new();
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      obj = v58;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
      if (v9)
      {
        v88 = *(_QWORD *)v92;
        do
        {
          v89 = v9;
          for (i = 0; i != v89; ++i)
          {
            if (*(_QWORD *)v92 != v88)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
            currentTime = self->_currentTime;
            -[SPKQuery userQueryString](self, "userQueryString");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SPKQuery queryContext](self, "queryContext");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "resultWithTime:searchString:isCorrectedQuery:withQueryContext:", v13, 0, v14, currentTime);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "rankingItem");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "L2FeatureVector");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              v18 = v11 == 0;
            else
              v18 = 1;
            v19 = !v18;

            if (v19)
            {
              v96[0] = CFSTR("score");
              v20 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v16, "score");
              objc_msgSend(v20, "numberWithFloat:");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v97[0] = v21;
              v96[1] = CFSTR("raw score");
              v22 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v16, "rawScore");
              objc_msgSend(v22, "numberWithFloat:");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v97[1] = v23;
              v96[2] = CFSTR("original score");
              v24 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v16, "L2FeatureVector");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "originalL2Score");
              objc_msgSend(v24, "numberWithFloat:");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v97[2] = v26;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 3);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setLocalFeatures:", v27);

            }
            objc_msgSend(v11, "rankingItem");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "score");
            objc_msgSend(v15, "setL2score:");

            objc_msgSend(v15, "sectionBundleIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "resultBundleId");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v29, "isEqual:", v90);
            p_queryId = &self->super._queryId;
            if ((v31 & 1) != 0)
            {
LABEL_25:
              objc_msgSend((id)p_queryId[33], "addResults:", v15);
              goto LABEL_27;
            }
            if ((objc_msgSend(v29, "isEqual:", v86) & 1) == 0)
            {
              if (objc_msgSend(v29, "isEqual:", v83))
              {
                if (objc_msgSend(v30, "isEqual:", v78))
                {
                  objc_msgSend(v16, "sectionBundleIdentifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "isEqualToString:", v82);

                  p_userQueryString = (id *)&self->super._userQueryString;
                  if ((v34 & 1) == 0)
                    goto LABEL_50;
LABEL_49:
                  objc_msgSend(p_userQueryString[33], "addResults:", v15);
                  goto LABEL_50;
                }
                if (objc_msgSend(v30, "isEqual:", v76))
                {
                  objc_msgSend(v16, "sectionBundleIdentifier");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "isEqualToString:", v82);

                  p_userQueryString = (id *)&self->super._trimmedUserQueryString;
                  if ((v41 & 1) != 0)
                    goto LABEL_49;
                }
                else
                {
                  v95[0] = v73;
                  v95[1] = v72;
                  v95[2] = v71;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 3);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v45, "containsObject:", v30);

                  p_userQueryString = (id *)&self->super._ranker;
                  if (!v46)
                    goto LABEL_49;
                  objc_msgSend(v16, "sectionBundleIdentifier");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = objc_msgSend(v47, "isEqualToString:", v82);

                  p_userQueryString = (id *)&self->super._delegate;
                  if ((v48 & 1) != 0)
                    goto LABEL_49;
                }
LABEL_50:
                objc_msgSend(v16, "sectionBundleIdentifier");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = objc_msgSend(v49, "isEqualToString:", v82);

                p_queryId = &self->super._queryGroupId;
                if (v50)
                  goto LABEL_25;
                goto LABEL_27;
              }
              if ((objc_msgSend(v29, "isEqual:", v79) & 1) == 0 && !objc_msgSend(v29, "isEqual:", v77))
              {
                if ((objc_msgSend(v29, "isEqual:", v74) & 1) == 0 && objc_msgSend(v30, "isEqual:", v69))
                {
                  if (objc_msgSend(v15, "hasTextContentMatch"))
                  {
                    objc_msgSend(v15, "contactIdentifier");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    v43 = v42 == 0;

                    if (!v43)
                    {
                      objc_msgSend(v15, "contactIdentifier");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "setObject:forKey:", v15, v44);

                    }
LABEL_63:
                    objc_msgSend(v67, "addObject:", v15);
                    goto LABEL_27;
                  }
                  goto LABEL_64;
                }
                objc_msgSend(v15, "userActivityRequiredString");
                v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (!-[__CFString length](v51, "length"))
                {

                  goto LABEL_60;
                }
                objc_msgSend(v81, "bundleIdentifier");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v52, "isEqual:", v68) & 1) == 0)
                {
                  objc_msgSend(v81, "bundleIdentifier");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v53, "isEqual:", v64) & 1) == 0)
                  {
                    objc_msgSend(v81, "bundleIdentifier");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

                    if ((IsSyndicatedPhotos & 1) != 0)
                      goto LABEL_27;
LABEL_60:
                    if ((objc_msgSend(v29, "hasPrefix:", CFSTR("com.apple")) & 1) != 0
                      || !objc_msgSend(MEMORY[0x24BEB02B8], "isLowEngagementBundle:", v29)
                      || objc_msgSend(v15, "hasTextContentMatch"))
                    {
                      goto LABEL_63;
                    }
                    goto LABEL_64;
                  }
LABEL_69:

                }
LABEL_71:

                goto LABEL_72;
              }
              objc_msgSend(v15, "personIdentifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (v36)
              {
                objc_msgSend(v15, "personIdentifier");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "hasPrefix:", CFSTR("com.apple.spotlight"));

                if (v38)
                {
                  objc_msgSend(v15, "personType");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v39, "isEqual:", CFSTR("ml")) & 1) != 0)
                  {

                    goto LABEL_64;
                  }
                  v55 = objc_msgSend(v15, "hasTextContentMatch");

                  if (!v55)
                  {
LABEL_64:
                    v56 = v29;
                    if (v56)
                      v51 = v56;
                    else
                      v51 = CFSTR("empty_bundle");
                    objc_msgSend(v75, "objectForKeyedSubscript:", v51);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = v57;
                    if (v57)
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v57, "unsignedIntValue") + 1);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "setObject:forKeyedSubscript:", v53, v51);
                      goto LABEL_69;
                    }
                    objc_msgSend(v75, "setObject:forKeyedSubscript:", &unk_24F025088, v51);
                    goto LABEL_71;
                  }
                  objc_msgSend(v15, "personIdentifier");
                  v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "setObject:forKey:", v15, v51);
LABEL_72:

                }
              }
            }
LABEL_27:

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
        }
        while (v9);
      }

      objc_msgSend(v81, "setResults:", v67);
    }

    ++v85;
  }
  -[SPCSSearchQuery buildPeopleResults:withContacts:](self, "buildPeopleResults:withContacts:", v66, v62);

}

- (void)updateCoreSuggestionsSection:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  unsigned __int8 v12;
  int v13;
  id v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = a3;
  objc_msgSend(v27, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v33;
    while (2)
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v7);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v7), "relatedBundleID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v8, "isEqualToString:", v10);

          if ((v11 & 1) == 0)
          {

            goto LABEL_15;
          }
        }
        objc_msgSend(v9, "relatedBundleID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v4)
        continue;
      break;
    }

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BE84938], "displayNameForBundleIdentifer:", v5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        if ((v12 & 1) == 0
        {
          -[SPCSSearchQuery updateCoreSuggestionsSection:]::nameFormat = objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", -[SPCSSearchQuery updateCoreSuggestionsSection:]::nameFormat, v26);
        v13 = 0;
        v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_15:

    v5 = 0;
  }
  {
    -[SPCSSearchQuery updateCoreSuggestionsSection:]::name = objc_claimAutoreleasedReturnValue();
  }
  v14 = (id)-[SPCSSearchQuery updateCoreSuggestionsSection:]::name;
  v26 = 0;
  v13 = 1;
LABEL_18:
  objc_msgSend(v27, "setTitle:", v14);
  if (v13)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v27, "results");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v20, "relatedBundleID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          if (!v22)
          {
            v23 = (void *)MEMORY[0x24BE84938];
            objc_msgSend(v20, "relatedBundleID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "displayNameForBundleIdentifer:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setFootnote:", v25);

          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v17);
    }

  }
}

- (void)buildPeopleResults:(id)a3 withContacts:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id obj;
  id v58;
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
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v58 = a4;
  v55 = v5;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "keysSortedByValueUsingComparator:", &__block_literal_global_209);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v58, "keysSortedByValueUsingComparator:", &__block_literal_global_210);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v58, "count", v8));
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v55, "count"));
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v8;
    v9 = 0;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v68 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(v58, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "addObject:", v13);
          if (!v9)
            v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v13, "title");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "text");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (!v16)
          {
            objc_msgSend(v13, "title");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "text");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "lowercaseString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v19);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v10);
    }

    -[SFMutableResultSection setResults:](self->_bundleIdToResultsMap.contactResultsSection, "setResults:", v56);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v20 = v49;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v21)
    {
      v54 = *(_QWORD *)v64;
      v53 = *MEMORY[0x24BEB0698];
      v51 = v20;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v64 != v54)
            objc_enumerationMutation(v20);
          objc_msgSend(v55, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "title");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "text");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lowercaseString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "sectionBundleIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v27)
            v29 = objc_msgSend(v27, "isEqual:", v53);
          else
            v29 = 0;
          objc_msgSend(v23, "contactIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30 == 0;

          if (v31)
          {
            if ((objc_msgSend(v9, "containsObject:", v26) & 1) != 0)
              goto LABEL_35;
          }
          else if (objc_msgSend(obj, "count"))
          {
            objc_msgSend(v23, "contactIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              objc_msgSend(v23, "personIdentifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setPersonIdentifier:", v34);

              objc_msgSend(v23, "personQueryIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setPersonQueryIdentifier:", v35);

              if ((v29 & 1) != 0)
                v36 = 1;
              else
                v36 = objc_msgSend(v33, "hasTextContentMatch");
              objc_msgSend(v33, "setHasTextContentMatch:", v36);
              objc_msgSend(v23, "rankingScore");
              objc_msgSend(v33, "setRankingScore:");
              objc_msgSend(v33, "setType:", 37);
              if (objc_msgSend(v33, "hasTextContentMatch"))
              {
                v41 = (void *)MEMORY[0x24BEB0318];
                -[SPKQuery queryContext](self, "queryContext");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "buildResultWithResult:queryContext:", v33, v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                os_unfair_lock_lock(&self->_suggestionsLock);
                -[NSMutableArray addObject:](self->_suggestionResults, "addObject:", v43);
                os_unfair_lock_unlock(&self->_suggestionsLock);

                v20 = v51;
              }
            }

            goto LABEL_35;
          }
          objc_msgSend(v23, "rankingScore");
          if (v37 > 0.0)
          {
            if (v29)
            {
              v38 = (void *)MEMORY[0x24BEB0318];
              -[SPKQuery queryContext](self, "queryContext");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "buildResultWithResult:queryContext:", v23, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              os_unfair_lock_lock(&self->_suggestionsLock);
              -[NSMutableArray addObject:](self->_suggestionResults, "addObject:", v40);
              os_unfair_lock_unlock(&self->_suggestionsLock);

              v20 = v51;
            }
            objc_msgSend(v50, "addObject:", v23);
          }
LABEL_35:

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v21);
    }

    -[SFMutableResultSection setResults:](self->_bundleIdToResultsMap.peopleResultsSection, "setResults:", v50);
    goto LABEL_47;
  }
  if (objc_msgSend(v58, "count"))
  {
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v58, "count"));
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v44 = v58;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v45; ++k)
        {
          if (*(_QWORD *)v60 != v46)
            objc_enumerationMutation(v44);
          objc_msgSend(v44, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v48);

        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      }
      while (v45);
    }

    -[SFMutableResultSection setResults:](self->_bundleIdToResultsMap.contactResultsSection, "setResults:", v20);
LABEL_47:

  }
}

uint64_t __51__SPCSSearchQuery_buildPeopleResults_withContacts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "rankingScore");
  v9 = v8;
  objc_msgSend(v7, "rankingScore");
  if (v9 <= v10)
    v11 = 1;
  else
    v11 = -1;

  return v11;
}

uint64_t __51__SPCSSearchQuery_buildPeopleResults_withContacts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "rankingScore");
  v9 = v8;
  objc_msgSend(v7, "rankingScore");
  if (v9 <= v10)
    v11 = 1;
  else
    v11 = -1;

  return v11;
}

- (void)sortResultsInSection:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  id v19;
  id v20;
  id v21;
  id obj;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  objc_msgSend(MEMORY[0x24BEB0238], "sortResultsInSection:currentTime:", v21, self->_currentTime);
  objc_msgSend(v21, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x24BEB0518]);

  if (v5)
  {
    v20 = v21;
    v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v20, "resultSet");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (!v6)
    {
      v29 = 0;
      v7 = 0;
      goto LABEL_34;
    }
    v7 = 0;
    v26 = 0;
    v27 = 0;
    v24 = 0;
    v25 = 0;
    v28 = *(_QWORD *)v36;
    v29 = 0;
    while (1)
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
        v33 = -1;
        v34 = -1;
        v31 = -1;
        v32 = -1;
        v30 = -1;
        objc_msgSend(v10, "interestingDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "compatibilityTitle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v7 = v9;
LABEL_29:
          objc_msgSend(v23, "addObject:", v10);
          goto LABEL_30;
        }
        objc_msgSend(MEMORY[0x24BEB02B0], "calendar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "getEra:year:month:day:fromDate:", 0, &v34, &v33, &v32, v11);

        objc_msgSend(MEMORY[0x24BEB02B0], "calendar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "getEra:yearForWeekOfYear:weekOfYear:weekday:fromDate:", 0, 0, &v30, &v31, v11);

        objc_msgSend(v10, "domainIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)v15;
        v16 = 0;
        if (v12 && v15)
        {
          if (objc_msgSend(v9, "isEqualToString:", v15)
            && objc_msgSend(v29, "isEqualToString:", v12))
          {
            v16 = v31 == v26 || v32 == v27;
            if (v34 == v25 && v33 == v24 && (v32 == v27 - 1 || v32 == v27 + 1))
              v16 = 1;
          }
          else
          {
            v16 = 0;
          }
        }
        v19 = v12;

        v26 = v31;
        v27 = v32;
        v29 = v19;
        v24 = v33;
        v25 = v34;
        if (!v16)
          goto LABEL_29;
LABEL_30:

        ++v8;
        v9 = v7;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (!v6)
      {
LABEL_34:

        objc_msgSend(v20, "clearResults");
        objc_msgSend(v20, "addResultsFromArray:", v23);

        break;
      }
    }
  }

}

- (void)processUserActivitiesForSection:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  int IsSyndicatedPhotos;
  void *v32;
  char v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t n;
  void *v74;
  void *v75;
  BOOL v76;
  void *v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  id obj;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
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
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint8_t v117[128];
  uint8_t buf[4];
  void *v119;
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v90 = a3;
  v91 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v89 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v90, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v111 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
        objc_msgSend(v8, "externalIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          SPLogForSPLogCategoryDefault();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v119 = v8;
            _os_log_error_impl(&dword_2279CC000, v10, OS_LOG_TYPE_ERROR, "result missing identifier %@", buf, 0xCu);
          }

        }
        objc_msgSend(v8, "userActivityRequiredString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v12 = v11 == 0;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
        {
          objc_msgSend(v91, "setObject:forKey:", v8, v9);
          objc_msgSend(v8, "compatibilityTitle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v89, "addObject:", v14);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v120, 16);
    }
    while (v5);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v15 = obj;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v107;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v107 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
        objc_msgSend(v19, "relatedUniqueIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v19, "userActivityRequiredString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21 == 0;

          if (v22)
          {
            objc_msgSend(v91, "objectForKey:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23 == 0;

            if (v24)
            {
              objc_msgSend(v91, "setObject:forKey:", v19, v20);
              objc_msgSend(v19, "compatibilityTitle");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
                objc_msgSend(v89, "addObject:", v25);

            }
          }
        }

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
    }
    while (v16);
  }

  v85 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v87 = v15;
  v26 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
  if (v26)
  {
    v92 = *(_QWORD *)v103;
    do
    {
      v93 = v26;
      for (k = 0; k != v93; ++k)
      {
        if (*(_QWORD *)v103 != v92)
          objc_enumerationMutation(v87);
        v28 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * k);
        objc_msgSend(v28, "compatibilityTitle", v85);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29 && (objc_msgSend(v28, "hasDetail") & 1) == 0)
        {
          objc_msgSend(v28, "sectionBundleIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();
          if (IsSyndicatedPhotos
            && (objc_msgSend(v28, "contentType"),
                v86 = (void *)objc_claimAutoreleasedReturnValue(),
                !objc_msgSend(v86, "isEqualToString:", CFSTR("public.item"))))
          {

          }
          else
          {
            objc_msgSend(v28, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "hasPrefix:", CFSTR("synthetic-bookmark-"));

            if (IsSyndicatedPhotos)
            if ((v33 & 1) == 0)
            {
              objc_msgSend(v90, "removeResults:", v28);
              goto LABEL_68;
            }
          }
        }
        objc_msgSend(v28, "userActivityRequiredString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34 == 0;

        if (!v35)
        {
          objc_msgSend(v28, "relatedUniqueIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            objc_msgSend(v28, "fileProviderIdentifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v37 == 0;

            if (v38)
            {
              objc_msgSend(v91, "objectForKey:", v36);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v39;
              if (v39)
              {
                v41 = objc_msgSend(v39, "score");
                v43 = v42;
                v44 = objc_msgSend(v28, "score");
                objc_msgSend(v40, "setScore:", __PAIR128__(v45, v44) + __PAIR128__(v43, v41));
                objc_msgSend(v90, "removeResults:", v28);
                if ((objc_msgSend(v40, "hasAssociatedUserActivity") & 1) == 0)
                {
                  objc_msgSend(v40, "setPubliclyIndexable:", objc_msgSend(v28, "publiclyIndexable"));
                  objc_msgSend(v40, "setHasAssociatedUserActivity:", 1);
                  objc_msgSend(v28, "launchDates");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "setLaunchDates:", v46);
                  goto LABEL_65;
                }
              }
              else
              {
                objc_msgSend(v85, "objectForKey:", v36);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = v47;
                if (v47)
                {
                  v48 = objc_msgSend(v47, "score");
                  v50 = v49;
                  v51 = objc_msgSend(v28, "score");
                  v52 = v51;
                  v54 = v53;
                  if (__PAIR128__(v53, v51) >= __PAIR128__(v50, v48))
                  {
                    v57 = objc_msgSend(v28, "buddyScore");
                    objc_msgSend(v28, "setBuddyScore:", __PAIR128__(v58, v57) + __PAIR128__(v50, v48));
                    objc_msgSend(v90, "removeResults:", v46);
                    objc_msgSend(v85, "setObject:forKey:", v28, v36);
                  }
                  else
                  {
                    v55 = objc_msgSend(v46, "buddyScore");
                    objc_msgSend(v46, "setBuddyScore:", __PAIR128__(v56, v55) + __PAIR128__(v54, v52));
                    objc_msgSend(v90, "removeResults:", v28);
                  }
                }
                else
                {
                  objc_msgSend(v85, "setObject:forKey:", v28, v36);
                }
LABEL_65:

              }
            }
          }
          else if (v29)
          {
            if (objc_msgSend(v89, "containsObject:", v29) && (objc_msgSend(v28, "hasDetail") & 1) == 0)
              objc_msgSend(v90, "removeResults:", v28);
            else
              objc_msgSend(v89, "addObject:", v29);
          }

        }
LABEL_68:

      }
      v26 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v102, v116, 16);
    }
    while (v26);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  objc_msgSend(v90, "resultSet");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v99;
    do
    {
      for (m = 0; m != v60; ++m)
      {
        if (*(_QWORD *)v99 != v61)
          objc_enumerationMutation(v59);
        v63 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * m);
        v64 = objc_msgSend(v63, "score", v85);
        v66 = v65;
        v67 = objc_msgSend(v63, "buddyScore");
        objc_msgSend(v63, "setScore:", __PAIR128__(v68, v67) + __PAIR128__(v66, v64));
      }
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
    }
    while (v60);
  }

  v69 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v70 = v87;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v95;
    do
    {
      for (n = 0; n != v71; ++n)
      {
        if (*(_QWORD *)v95 != v72)
          objc_enumerationMutation(v70);
        v74 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * n);
        objc_msgSend(v74, "itemIdentifier", v85);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v75 == 0;

        if (!v76)
        {
          objc_msgSend(v74, "itemIdentifier");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "objectForKey:", v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if (v78)
          {
            v79 = objc_msgSend(v78, "score");
            v81 = v80;
            v82 = objc_msgSend(v74, "score");
            if (__PAIR128__(v83, v82) < __PAIR128__(v81, v79))
            {
              objc_msgSend(v90, "removeResults:", v74);
LABEL_88:

              continue;
            }
            objc_msgSend(v90, "removeResults:", v78);
          }
          objc_msgSend(v74, "itemIdentifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKey:", v74, v84);

          goto LABEL_88;
        }
      }
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v94, v114, 16);
    }
    while (v71);
  }

}

- (void)removeDuplicatesInSection:(id)a3
{
  uint64_t i;
  void *v4;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _BYTE *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  SPCSSearchQuery *v53;
  id v54;
  void *v55;
  id obj;
  id v57;
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
  __int128 v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  objc_msgSend(v57, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = self;
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v9)
  {
    v4 = *(void **)v67;
    v10 = (_BYTE *)MEMORY[0x24BE84AF8];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(void **)v67 != v4)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v11, "sectionBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "externalIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (objc_msgSend(v8, "containsObject:", v13))
          {
            objc_msgSend(v57, "removeResults:", v11);
            SPLogForSPLogCategoryQuery();
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = 2 * (*v10 == 0);
            if (os_log_type_enabled(v14, v15))
            {
              *(_DWORD *)buf = 138412546;
              v73 = v12;
              v74 = 2112;
              v75 = v13;
              _os_log_impl(&dword_2279CC000, v14, v15, "Remove duplicate for %@ / %@", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v8, "addObject:", v13);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v9);
  }

  objc_msgSend(v57, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BEB03F8]);

  if (!v17)
    goto LABEL_31;
  objc_msgSend(v8, "removeAllObjects");
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v54 = obj;
  v18 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  if (!v18)
    goto LABEL_30;
  v19 = 0;
  v20 = *(_QWORD *)v63;
  i = (uint64_t)CFSTR("attachmentDomain");
  do
  {
    for (j = 0; j != v18; ++j)
    {
      if (*(_QWORD *)v63 != v20)
        objc_enumerationMutation(v54);
      v22 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
      objc_msgSend(v22, "domainIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v4, "isEqualToString:", CFSTR("attachmentDomain"));
      if ((v23 | objc_msgSend(v4, "isEqualToString:", CFSTR("chatDomain"))) == 1)
      {
        objc_msgSend(v22, "accountIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          continue;
      }
      else
      {
        v19 = v4;
        if (!v4)
          continue;
      }
      v4 = v19;
      if (objc_msgSend(v8, "containsObject:", v19))
        objc_msgSend(v57, "removeResults:", v22);
      else
        objc_msgSend(v8, "addObject:", v19);
    }
    v18 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
  }
  while (v18);

LABEL_30:
LABEL_31:
  objc_msgSend(v57, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BEB0480]);

  if (!(_DWORD)v25)
    goto LABEL_47;
  objc_msgSend(v8, "removeAllObjects");
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v26 = obj;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (!v27)
    goto LABEL_46;
  v28 = *(_QWORD *)v59;
  while (2)
  {
    i = 0;
    while (2)
    {
      if (*(_QWORD *)v59 != v28)
        objc_enumerationMutation(v26);
      v25 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      objc_msgSend(v25, "stringForDedupe");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(v25, "domainIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.siri.interactions")))
        {

LABEL_41:
          objc_msgSend(v25, "stringForDedupe");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v8, "containsObject:", v32);

          if (v33)
          {
            objc_msgSend(v57, "removeResults:", v25);
          }
          else
          {
            objc_msgSend(v25, "stringForDedupe");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v34);

          }
        }
        else
        {
          objc_msgSend(v25, "domainIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.siri.upcomingmedia"));

          if (v31)
            goto LABEL_41;
        }
      }
      if (v27 != ++i)
        continue;
      break;
    }
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v27)
      continue;
    break;
  }
LABEL_46:

LABEL_47:
  if (SSEnableSpotlightTopHitPersonalizedRanking())
  {
    -[SPKQuery queryContext](v53, "queryContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "searchEntities");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");
    if (v37)
    {
      -[SPKQuery queryContext](v53, "queryContext");
      i = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)i, "searchEntities");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "isScopedSearch") & 1) != 0)
      {
        v52 = 1;
        goto LABEL_52;
      }
    }
    -[SPKQuery queryContext](v53, "queryContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v38, "isAdvancedSyntax");

    if (v37)
    {
LABEL_52:

    }
    v50 = (void *)MEMORY[0x24BEB0238];
    -[SPKQuery userQueryString](v53, "userQueryString");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPKQuery queryContext](v53, "queryContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v51, "queryIdent");
    -[SPKQuery queryContext](v53, "queryContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "searchEntities");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "count");
    -[SPKQuery queryContext](v53, "queryContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "currentTime");
    v45 = v44;
    -[SPKQuery queryContext](v53, "queryContext");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "queryKind");
    -[SPKQuery delegate](v53, "delegate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "clientBundleID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "thresholdResultsInSection:userQuery:queryID:isEntitiesSearch:currentTime:isScopedSearch:queryKind:clientBundleID:", v57, v55, v39, v42 != 0, v52, v47, v45, v49);

  }
}

- (void)processSection:(id)a3
{
  SPCSSearchQuery *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 isPeopleSearch;
  uint64_t v8;
  void *v9;
  int IsSyndicatedPhotos;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t EvaluatorWithBlock;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  char v47;
  void *v48;
  void *v49;
  char v50;
  char v51;
  char v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  int v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  id v86;
  char v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  SPCSSearchQuery *v109;
  id v110;
  uint64_t v111;
  id v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id obj;
  uint64_t v121;
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  void *v132;
  void *v133;
  void *v134;
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x24BDAC8D0];
  v122 = a3;
  -[SPKQuery userQueryString](self, "userQueryString");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  v6 = *(_QWORD *)self->_topHitThreshold;
  v5 = *(_QWORD *)&self->_topHitThreshold[8];
  v109 = v4;
  isPeopleSearch = v4->_isPeopleSearch;
  v8 = SPMaxVisibleResultsCountPerSection();
  objc_msgSend(v122, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

  v11 = 50;
  if (!IsSyndicatedPhotos)
    v11 = v8;
  v12 = IsSyndicatedPhotos ^ 1;
  if (isPeopleSearch)
    v12 = 1;
  if ((v12 & 1) == 0)
  {
    if (SSSnippetModernizationEnabled() && v109->_isPhotosSearch)
      v11 = 50;
    else
      v11 = 20;
  }
  if (isPeopleSearch)
    v11 = 50;
  if (v11 <= 0)
    v13 = 3;
  else
    v13 = v11;
  objc_msgSend(v122, "setMaxInitiallyVisibleResults:", v13);
  v14 = (void *)MEMORY[0x24BE84938];
  objc_msgSend(v122, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayNameForBundleIdentifer:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v104 = (void *)v16;
  if (v16)
    objc_msgSend(v122, "setTitle:", v16);
  objc_msgSend(v122, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.CoreSuggestions"));

  if (v18)
    -[SPCSSearchQuery updateCoreSuggestionsSection:](v109, "updateCoreSuggestionsSection:", v122);
  objc_msgSend(v122, "title");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(v122, "setTitle:", CFSTR("?"));
    objc_msgSend(v122, "setResults:", MEMORY[0x24BDBD1A8]);
  }
  objc_msgSend(v122, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqual:", CFSTR("com.apple.mobilesafari"));

  v103 = v21;
  if (v21)
  {
    EvaluatorWithBlock = _MDCreateSimpleQueryEvaluatorWithBlock();
    if (EvaluatorWithBlock)
      _MDSimpleQuerySetWidcardAttributes();
    v112 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v110 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v108 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v115 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v113 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    objc_msgSend(v122, "resultSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = EvaluatorWithBlock;
    obj = v23;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
    if (v24)
    {
      v121 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v128 != v121)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v26, "contentURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              objc_msgSend(v26, "title");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "text");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29 == 0;

              if (!v30)
              {
                v31 = (void *)MEMORY[0x24BDBCF48];
                objc_msgSend(v26, "contentURL");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "URLWithString:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v33)
                  goto LABEL_66;
                objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v33, 1);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v34;
                if (!v34)
                  goto LABEL_65;
                objc_msgSend(v34, "setQuery:", 0);
                objc_msgSend(v35, "setFragment:", 0);
                objc_msgSend(v35, "string");
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "objectForKey:");
                v119 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "title");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "text");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "objectForKey:", v37);
                v118 = (void *)objc_claimAutoreleasedReturnValue();

                if (v118)
                {
                  objc_msgSend(v118, "contentURL");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v38, "length");
                  objc_msgSend(v26, "contentURL");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v39) = v39 > objc_msgSend(v40, "length");

                  if ((v39 & 1) != 0)
                  {
                    objc_msgSend(v113, "addObject:", v118);
                    objc_msgSend(v26, "title");
                    v116 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v116, "text");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v119, "setObject:forKey:", v26, v41);
                    goto LABEL_63;
                  }
                  objc_msgSend(v113, "addObject:", v26);
LABEL_64:

LABEL_65:
LABEL_66:

                  continue;
                }
                if (!v119)
                {
                  v119 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                  objc_msgSend(v115, "setObject:forKey:", v119, v117);
                }
                objc_msgSend(v26, "title");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "text");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "setObject:forKey:", v26, v43);

                objc_msgSend(v35, "setPath:", CFSTR("/"));
                objc_msgSend(v35, "URL");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v116, "host");
                v44 = objc_claimAutoreleasedReturnValue();
                v114 = (void *)v44;
                objc_msgSend(v116, "scheme");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                if (v45)
                  v46 = v44 == 0;
                else
                  v46 = 1;
                v47 = v46;

                if ((v47 & 1) != 0)
                {
LABEL_46:
                  v41 = v114;
                }
                else
                {
                  objc_msgSend(v116, "scheme");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v111 = objc_msgSend(v48, "caseInsensitiveCompare:", CFSTR("https"));

                  v41 = v114;
                  if (objc_msgSend(v116, "isEqual:", v33))
                  {
                    objc_msgSend(v112, "addObject:", v114);
                    objc_msgSend(v110, "removeObjectForKey:", v114);
                    objc_msgSend(v108, "removeObject:", v114);
                  }
                  else if ((objc_msgSend(v112, "containsObject:", v114) & 1) == 0)
                  {
                    objc_msgSend(v110, "objectForKeyedSubscript:", v114);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v49)
                    {
                      v50 = objc_msgSend(v108, "containsObject:", v114);
                      if (v111)
                        v51 = 1;
                      else
                        v51 = v50;

                      v52 = (v107 == 0) | v51;
                      v41 = v114;
                      if ((v52 & 1) != 0)
                        goto LABEL_63;
                    }
                    else if (!v107)
                    {
                      goto LABEL_63;
                    }
                    if (_MDSimpleQueryObjectMatches())
                    {
                      objc_msgSend(v26, "title");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v53, "text");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v55 = _MDStringPrefixOfString() == -1;

                      if (v55)
                      {
                        v106 = (void *)objc_opt_new();
                        v102 = (void *)objc_opt_new();
                        v100 = (void *)objc_opt_new();
                        objc_msgSend(v100, "setBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
                        objc_msgSend(v102, "setThumbnail:", v100);
                        objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v114);
                        v56 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v102, "setTitle:", v56);

                        objc_msgSend(MEMORY[0x24BE84F38], "punchoutWithURL:", v116);
                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                        v134 = v57;
                        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v134, 1);
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v102, "setPunchoutOptions:", v58);

                        objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v114);
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        v133 = v59;
                        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v133, 1);
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v102, "setDescriptions:", v60);

                        v61 = (void *)objc_opt_new();
                        objc_msgSend(v106, "setInlineCard:", v61);

                        v132 = v102;
                        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v132, 1);
                        v62 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v106, "inlineCard");
                        v63 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v63, "setCardSections:", v62);

                        objc_msgSend(v116, "absoluteString");
                        v101 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v106, "setContentURL:");
                        objc_msgSend(v106, "setTopHit:", objc_msgSend(v26, "topHit"));
                        objc_msgSend(v106, "setForceNoTopHit:", objc_msgSend(v26, "forceNoTopHit"));
                        v64 = objc_msgSend(v26, "score");
                        objc_msgSend(v106, "setScore:", v64, v65);
                        objc_msgSend(v26, "protectionClass");
                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v106, "setProtectionClass:", v66);

                        objc_msgSend(v26, "rankingScore");
                        objc_msgSend(v106, "setRankingScore:");
                        objc_msgSend(v26, "applicationBundleIdentifier");
                        v67 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v106, "setApplicationBundleIdentifier:", v67);

                        objc_msgSend(v26, "sectionBundleIdentifier");
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v106, "setSectionBundleIdentifier:", v68);

                        objc_msgSend(v26, "resultBundleId");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v106, "setResultBundleId:", v69);

                        objc_msgSend(v106, "setType:", objc_msgSend(v26, "type"));
                        objc_msgSend(v106, "setQueryId:", objc_msgSend(v26, "queryId"));
                        objc_msgSend(v106, "setCompletedQuery:", v114);
                        objc_msgSend(v106, "setCompletion:", v114);
                        objc_msgSend(v26, "identifier");
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(CFSTR("synthetic-bookmark-"), "stringByAppendingString:", v70);
                        v71 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v106, "setIdentifier:", v71);

                        objc_msgSend(v26, "rankingItem");
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v72, "attributes");
                        v73 = SSCompactRankingAttrsCopy();

                        SSCompactRankingAttrsUpdateValue();
                        SSCompactRankingAttrsUpdateValue();
                        SSCompactRankingAttrsUpdateValue();
                        v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0228]), "initWithAttrs:", v73);
                        objc_msgSend(v106, "setRankingItem:", v74);

                        objc_msgSend(v26, "rankingItem");
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v75, "L2FeatureVector");
                        v76 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v76, "originalL2Score");
                        v78 = v77;
                        objc_msgSend(v106, "rankingItem");
                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v79, "L2FeatureVector");
                        v80 = (void *)objc_claimAutoreleasedReturnValue();
                        LODWORD(v81) = v78;
                        objc_msgSend(v80, "setOriginalL2Score:", v81);

                        objc_msgSend(v110, "setObject:forKey:", v106, v114);
                        if (!v111)
                          objc_msgSend(v108, "addObject:", v114);

                      }
                      goto LABEL_46;
                    }
                  }
                }
LABEL_63:

                goto LABEL_64;
              }
            }
          }
        }
        v23 = obj;
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v135, 16);
      }
      while (v24);
    }

    if (v107)
      _MDSimpleQueryDeallocate();
    if (objc_msgSend(v110, "count"))
    {
      objc_msgSend(v110, "allValues");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "resultSet");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "addObjectsFromArray:", v82);

    }
    objc_msgSend(v122, "resultSet");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "minusSet:", v113);

  }
  v85 = SSEnableSpotlightTopHitPersonalizedRanking();
  if (v85)
  {
    objc_msgSend(v122, "bundleIdentifier");
    v86 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v87 = 0;
  }
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  objc_msgSend(v122, "resultSet");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
  if (v89)
  {
    v90 = *(_QWORD *)v124;
    do
    {
      for (j = 0; j != v89; ++j)
      {
        if (*(_QWORD *)v124 != v90)
          objc_enumerationMutation(v88);
        v92 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * j);
        v93 = objc_msgSend(v92, "score");
        if (v93 & v6 | v94 & v5)
          v95 = v87;
        else
          v95 = 1;
        if ((v95 & 1) == 0 && objc_msgSend(v92, "topHit") != 2)
          objc_msgSend(v92, "setTopHit:", SSSetTopHitWithReasonType());
        objc_msgSend(v122, "bundleIdentifier");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setSectionBundleIdentifier:", v96);

      }
      v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
    }
    while (v89);
  }

  v97 = v122;
  if (((v85 | v103 ^ 1) & 1) == 0)
  {
    v98 = (void *)MEMORY[0x24BEB02F0];
    -[SPKQuery userQueryString](v109, "userQueryString");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "determineTopHitsForSafariSection:forQuery:", v122, v99);

    v97 = v122;
    objc_msgSend(MEMORY[0x24BEB02F0], "moveSafariTopHitsToTopOfSection:", v122);
  }
  -[SPCSSearchQuery sortResultsInSection:](v109, "sortResultsInSection:", v97);
  -[SPCSSearchQuery processUserActivitiesForSection:](v109, "processUserActivitiesForSection:", v97);
  -[SPCSSearchQuery removeDuplicatesInSection:](v109, "removeDuplicatesInSection:", v97);

}

CFTypeRef __34__SPCSSearchQuery_processSection___block_invoke(uint64_t a1, const void *a2, void *a3)
{
  id v4;
  CFTypeRef v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("_ModifiedHostName_")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("kMDItemDisplayName")))
  {
    v5 = CFRetain(a2);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)rankAndSendResultsWithResponseKind:(int)a3 withResultSections:(id)a4 withResultSets:(id)a5 withiCloudDriveSection:(id)a6 withMailResultSet:(id)a7
{
  id v11;
  unsigned __int8 v12;
  uint64_t v13;
  __uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  _BOOL4 isPhotosSearch;
  uint64_t *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  char v49;
  uint64_t m;
  void *v51;
  void *v52;
  BOOL v53;
  uint64_t n;
  id v55;
  id v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t ii;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v78;
  id v79;
  id v80;
  SPCSSearchQuery *val;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  id v90[2];
  id location;
  double v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x24BDAC8D0];
  v79 = a4;
  v78 = a5;
  v80 = a6;
  v11 = a7;
  val = self;
  v12 = atomic_load((unsigned __int8 *)&self->_queryCanceled);
  if ((v12 & 1) != 0)
    goto LABEL_68;
  v76 = v11;
  v13 = objc_msgSend(v79, "count");
  if (v13 != objc_msgSend(v78, "count"))
    __assert_rtn("-[SPCSSearchQuery rankAndSendResultsWithResponseKind:withResultSections:withResultSets:withiCloudDriveSection:withMailResultSet:]", "SPCSSearchQuery.mm", 2642, "resultSections.count == resultSets.count");
  v92 = 0.0;
  -[SPCSSearchQuery prepareRankingItems:withResultSets:totalFeatureComputationTime:](self, "prepareRankingItems:withResultSets:totalFeatureComputationTime:", v79, v78, &v92);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if (-[NSArray containsObject:](self->_resultAttrs, "containsObject:", *MEMORY[0x24BDC2078]))
  {
    v15 = 1;
  }
  else
  {
    -[CSSearchQuery queryContext](self->_csQuery, "queryContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "fetchl2Signals");

  }
  -[CSSearchQuery queryContext](self->_csQuery, "queryContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "queryID");

  -[SPCSSearchQuery itemRanker](self, "itemRanker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *((_BYTE *)self + 448);
  SPL2Threshold();
  objc_msgSend(v18, "updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:", v73, v19 & 1, 0, 0, v15);

  -[SPKQuery delegate](val, "delegate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v71, "queryIdent");
  objc_msgSend(v71, "clientBundleID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DB8]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.feature.extraction"), 0, v20);
  v75 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84DB8]), "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.spotlight.indomain.score.computation"), 0, v20);
  objc_msgSend(v75, "setNanosecondInterval:", clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v14);
  objc_msgSend(v74, "setNanosecondInterval:", (unint64_t)(v92 * 1000000000.0));
  location = 0;
  objc_initWeak(&location, val);
  objc_copyWeak(v90, &location);
  v69 = v74;
  v87 = v69;
  v90[1] = v20;
  v67 = v72;
  v88 = v67;
  v70 = v75;
  v89 = v70;
  md_tracing_dispatch_async_propagating();
  if (v76)
    -[SPCSSearchQuery updateMailAttachmentResults:](val, "updateMailAttachmentResults:", v76, v67, v69, v70);
  -[SPCSSearchQuery buildFullSearchResults:withResultSets:](val, "buildFullSearchResults:withResultSets:", v79, v78, v67);
  if (v80)
  {
    v21 = v80;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    objc_msgSend(v21, "resultSet");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v102 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
          objc_msgSend(v26, "documentIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v86, "setObject:forKeyedSubscript:", v26, v27);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
      }
      while (v23);
    }

  }
  else
  {
    v86 = 0;
  }
  if ((a3 & 0xFFFFFFFE) != 2)
  {
    isPhotosSearch = val->_isPhotosSearch;
    v84 = v79;
    if (isPhotosSearch)
    {
LABEL_23:
LABEL_38:
      v41 = (id)*v30;
      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v84, "count"));
      v96 = 0u;
      v94 = 0u;
      v95 = 0u;
      v93 = 0u;
      v43 = v84;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v93, &v101, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v94;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v94 != v45)
              objc_enumerationMutation(v43);
            v47 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
            objc_msgSend(v47, "bundleIdentifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v41, "containsObject:", v48);

            if ((v49 & 1) == 0)
              objc_msgSend(v42, "addObject:", v47);
          }
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v93, &v101, 16);
        }
        while (v44);
      }

      v28 = v42;
      goto LABEL_48;
    }
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v31 = v84;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
    if (v32)
    {
      v33 = 0;
      v34 = *(_QWORD *)v98;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v98 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * k);
          objc_msgSend(v36, "bundleIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v37, "containsObject:", v38) & 1) != 0)
          {
            objc_msgSend(v36, "results");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "count") != 0;

            v33 += v40;
          }
          else
          {

          }
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v97, v105, 16);
      }
      while (v32);

      if (v33 == 1)
        goto LABEL_23;
    }
    else
    {

    }
    goto LABEL_38;
  }
  v28 = v79;
LABEL_48:
  v83 = v28;
  v82 = objc_msgSend(v28, "count");
  if (v82)
  {
    for (m = 0; m != v82; ++m)
    {
      objc_msgSend(v83, "objectAtIndexedSubscript:", m);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "results");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "count") == 0;

      if (!v53)
        -[SPCSSearchQuery processSection:](val, "processSection:", v51);

    }
    if (v80)
    {
      for (n = 0; n != v82; ++n)
      {
        objc_msgSend(v83, "objectAtIndexedSubscript:", n);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        v56 = v80;
        v57 = v86;
        v85 = v55;
        if (v55 != v56)
        {
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          objc_msgSend(v55, "resultSet");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
          if (v59)
          {
            v60 = *(_QWORD *)v102;
            do
            {
              for (ii = 0; ii != v59; ++ii)
              {
                if (*(_QWORD *)v102 != v60)
                  objc_enumerationMutation(v58);
                objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * ii), "documentIdentifier");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "objectForKeyedSubscript:", v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                if (v63)
                {
                  objc_msgSend(v56, "removeResults:", v63);
                }

              }
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
            }
            while (v59);
          }

        }
      }
    }
  }
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0260]), "initWithQueryID:kind:sections:", -[SPKQuery queryGroupId](val, "queryGroupId"), a3, v83);
  -[SPKQuery userQueryString](val, "userQueryString");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setUserQueryString:", v65);

  os_unfair_lock_lock(&val->_suggestionsLock);
  v66 = (void *)-[NSMutableArray copy](val->_suggestionResults, "copy");
  objc_msgSend(v64, "setLocalSuggestionResults:", v66);

  os_unfair_lock_unlock(&val->_suggestionsLock);
  -[SPCSSearchQuery _sendResponse:](val, "_sendResponse:", v64);

  objc_destroyWeak(v90);
  objc_destroyWeak(&location);

  v11 = v76;
LABEL_68:

}

void __129__SPCSSearchQuery_rankAndSendResultsWithResponseKind_withResultSections_withResultSets_withiCloudDriveSection_withMailResultSet___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendFeedbackType:feedback:queryId:clientID:", 21, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));

    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendFeedbackType:feedback:queryId:clientID:", 21, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

- (void)sendResponseWithKind:(int)a3
{
  unsigned __int8 v3;
  NSMutableDictionary *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  NSObject *v18;
  NSObject *v19;
  unsigned __int8 v20;
  NSString *v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _anonymous_namespace_::BundleIdToResultMap *p_bundleIdToResultsMap;
  id *next;
  char v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  BOOL v45;
  void *v46;
  NSMutableDictionary *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  NSString *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *rankQueue;
  qos_class_t v57;
  id v58;
  id v59;
  dispatch_block_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  dispatch_block_t v68;
  void *v69;
  void *v70;
  unsigned int v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSMutableDictionary *obj;
  id obja;
  id objb;
  id objc;
  SPCSSearchQuery *val;
  _QWORD block[4];
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  unsigned int v87;
  _QWORD v88[4];
  id v89;
  id v90;
  uint8_t buf[8];
  char v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v3 = atomic_load((unsigned __int8 *)&self->_queryCanceled);
  if ((v3 & 1) != 0)
    return;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v6 = self->_foundBundleIDs;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
  val = self;
  v71 = a3;
  if (!v7)
  {
    v8 = a3 & 0xFFFFFFFE;
LABEL_23:

    -[SPCSSearchQuery constructResultsForResponse:](val, "constructResultsForResponse:", v8 == 2);
    v20 = atomic_load((unsigned __int8 *)&val->_queryCanceled);
    if ((v20 & 1) != 0)
      return;
    if (v8 != 2)
    {
      v21 = (NSString *)*MEMORY[0x24BEB05F0];
      obja = (id)objc_claimAutoreleasedReturnValue();
      v22 = (NSString *)*MEMORY[0x24BEB06E0];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "unionOrderedSet:", v23);

      objb = (id)objc_claimAutoreleasedReturnValue();
      v24 = (NSString *)*MEMORY[0x24BEB06E8];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objb, "unionOrderedSet:", v25);

      objc = (id)objc_claimAutoreleasedReturnValue();
      v26 = (NSString *)*MEMORY[0x24BEB06D0];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc, "unionOrderedSet:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "removeAllObjects");

      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "removeAllObjects");

      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeAllObjects");

    }
    p_bundleIdToResultsMap = (_anonymous_namespace_::BundleIdToResultMap *)&val->_bundleIdToResultsMap;
    obj = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", val->_bundleIdToResultsMap.map.__table_.__p2_.__value_);
    v75 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", val->_bundleIdToResultsMap.map.__table_.__p2_.__value_);
    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", val->_bundleIdToResultsMap.map.__table_.__p2_.__value_);
    next = (id *)val->_bundleIdToResultsMap.map.__table_.__p1_.__value_.__next_;
    if (!next)
    {
      v73 = 0;
      v74 = 0;
      v33 = 0;
LABEL_51:
      v47 = obj;
      if (-[NSMutableDictionary count](obj, "count", v69))
      {
        if (v8 == 2)
        {
          v95 = 0u;
          v96 = 0u;
          v93 = 0u;
          v94 = 0u;
          v48 = v70;
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
          if (v49)
          {
            v50 = *(_QWORD *)v94;
            do
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v94 != v50)
                  objc_enumerationMutation(v48);
                v52 = *(NSString **)(*((_QWORD *)&v93 + 1) + 8 * i);
                {
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "removeAllObjects");

                }
                else
                {
                  std::string::basic_string[abi:nn180100]<0>(buf, (char *)-[NSString UTF8String](objc_retainAutorelease(v52), "UTF8String"));
                  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__erase_unique<std::string>(p_bundleIdToResultsMap, (uint64_t)buf);
                  if (v92 < 0)
                    operator delete(*(void **)buf);
                }
              }
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
            }
            while (v49);
          }

          v47 = obj;
        }
        if ((v33 & 1) != 0)
        {
          v54 = (void *)-[NSMutableDictionary copy](v47, "copy");
          v55 = -[NSObject copy](v75, "copy");
          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, val);
          rankQueue = val->_rankQueue;
          v57 = qos_class_self();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __40__SPCSSearchQuery_sendResponseWithKind___block_invoke_2;
          block[3] = &unk_24F01B758;
          objc_copyWeak(&v86, (id *)buf);
          v87 = v71;
          v82 = v54;
          v83 = v55;
          v84 = v74;
          v85 = v73;
          v58 = v55;
          v59 = v54;
          v60 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v57, 0, block);
          dispatch_async(rankQueue, v60);

          objc_destroyWeak(&v86);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          v61 = objc_alloc(MEMORY[0x24BEB0260]);
          v62 = -[SPKQuery queryGroupId](val, "queryGroupId");
          v63 = (void *)objc_msgSend(v61, "initWithQueryID:kind:sections:", v62, v71, MEMORY[0x24BDBD1A8]);
          -[SPKQuery userQueryString](val, "userQueryString");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setUserQueryString:", v64);

          os_unfair_lock_lock(&val->_suggestionsLock);
          v65 = (void *)-[NSMutableArray copy](val->_suggestionResults, "copy");
          objc_msgSend(v63, "setLocalSuggestionResults:", v65);

          os_unfair_lock_unlock(&val->_suggestionsLock);
          *(_QWORD *)buf = 0;
          objc_initWeak((id *)buf, val);
          v66 = val->_rankQueue;
          LODWORD(v65) = qos_class_self();
          v88[0] = MEMORY[0x24BDAC760];
          v88[1] = 3221225472;
          v88[2] = __40__SPCSSearchQuery_sendResponseWithKind___block_invoke;
          v88[3] = &unk_24F01B730;
          objc_copyWeak(&v90, (id *)buf);
          v89 = v63;
          v67 = v63;
          v68 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)v65, 0, v88);
          dispatch_async(v66, v68);

          objc_destroyWeak(&v90);
          objc_destroyWeak((id *)buf);
        }
      }

      v19 = v75;
      goto LABEL_69;
    }
    v33 = 0;
    v73 = 0;
    v74 = 0;
    v34 = *MEMORY[0x24BEB03A8];
    v72 = *MEMORY[0x24BEB05C0];
    while (1)
    {
      v35 = next[5];
      v36 = next[6];
      objc_msgSend(v35, "bundleIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v8 != 2)
      {
        -[NSMutableDictionary addObject:](obj, "addObject:", v35);
        -[NSObject addObject:](v75, "addObject:", v36);
        goto LABEL_39;
      }
      v39 = v37;
      {
        {

LABEL_38:
          -[NSMutableDictionary addObject:](obj, "addObject:", v35, v69);
          objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithOrderedSet:", v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v75, "addObject:", v41);

          objc_msgSend(v69, "addObject:", v39);
LABEL_39:
          if (objc_msgSend(v38, "isEqualToString:", v34, v69))
          {
            -[NSMutableDictionary lastObject](obj, "lastObject");
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = v74;
            v74 = (void *)v42;
            goto LABEL_43;
          }
          if (objc_msgSend(v38, "isEqualToString:", v72))
          {
            -[NSObject lastObject](v75, "lastObject");
            v44 = objc_claimAutoreleasedReturnValue();
            v43 = v73;
            v73 = (void *)v44;
LABEL_43:

          }
          if ((v33 & 1) != 0)
          {
            v45 = 0;
          }
          else
          {
            -[NSObject lastObject](v75, "lastObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v46, "count") != 0;

          }
          v33 |= v45;
          goto LABEL_48;
        }

        if (v40)
          goto LABEL_38;
      }
      else
      {

      }
LABEL_48:

      next = (id *)*next;
      if (!next)
        goto LABEL_51;
    }
  }
  obj = v6;
  v8 = a3 & 0xFFFFFFFE;
  v9 = *(_QWORD *)v98;
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v98 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v10);
    -[NSMutableDictionary objectForKeyedSubscript:](val->_foundBundleIDs, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    if (v8 != 2 || !objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.searchd.engagement")))
      goto LABEL_17;
    SPLogForSPLogCategoryQuery();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v14, OS_LOG_TYPE_DEFAULT, "Found com.apple.searchd.engagement", buf, 2u);
    }

    v15 = (uint64_t)val->_resultHeaps.__begin_ + 24 * v13;
    v16 = *(_OWORD **)v15;
    v17 = *(_OWORD **)(v15 + 8);
    if (v16 != v17)
      break;
LABEL_14:
    SPLogForSPLogCategoryQuery();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, v18, OS_LOG_TYPE_DEFAULT, "Found no exact-match on previous engagement", buf, 2u);
    }

LABEL_17:
    if (++v10 == v7)
    {
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v97, v102, 16);
      if (!v7)
        goto LABEL_23;
      goto LABEL_4;
    }
  }
  {
    v16 += 3;
    if (v16 == v17)
      goto LABEL_14;
  }
  SPLogForSPLogCategoryQuery();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v19, OS_LOG_TYPE_DEFAULT, "Delay returning results; previous engagement of non-priority result found",
      buf,
      2u);
  }
LABEL_69:

}

void __40__SPCSSearchQuery_sendResponseWithKind___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_sendResponse:", *(_QWORD *)(a1 + 32));

}

void __40__SPCSSearchQuery_sendResponseWithKind___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "rankAndSendResultsWithResponseKind:withResultSections:withResultSets:withiCloudDriveSection:withMailResultSet:", *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)executeQuery
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2279CC000, a2, OS_LOG_TYPE_DEBUG, "[debug][personal answers][query] personalAnswersQueries = %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __31__SPCSSearchQuery_executeQuery__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 60, *(id *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BE84978], "sharedProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendFeedbackType:feedback:queryId:clientID:", 5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

void __31__SPCSSearchQuery_executeQuery__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_3;
  v6[3] = &unk_24F01B730;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "foundItems:", *(_QWORD *)(a1 + 32));

}

void __31__SPCSSearchQuery_executeQuery__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(NSObject **)(a1 + 32);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_5;
  v14[3] = &unk_24F01B7A8;
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v18);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "foundCompletion:scores:bundleIDs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __31__SPCSSearchQuery_executeQuery__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_7;
  v6[3] = &unk_24F01B730;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "foundCompletions:", *(_QWORD *)(a1 + 32));

}

void __31__SPCSSearchQuery_executeQuery__block_invoke_8(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_9;
  block[3] = &unk_24F01B7F8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_9(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "priorityGatherEnded");

}

void __31__SPCSSearchQuery_executeQuery__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__SPCSSearchQuery_executeQuery__block_invoke_11;
  v6[3] = &unk_24F01B730;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __31__SPCSSearchQuery_executeQuery__block_invoke_11(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "completed:", *(_QWORD *)(a1 + 32));

}

- (void)foundCompletion:(id)a3 scores:(id)a4 bundleIDs:(id)a5
{
  id v8;
  id v9;
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
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKey:](self->_completionSuggestions, "objectForKey:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDC24A0], "emptySuggestion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDC24A0];
    -[SPKQuery userQueryString](self, "userQueryString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v11, v13, MEMORY[0x24BDBD1A8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BDC24A0];
    -[SPKQuery userQueryString](self, "userQueryString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suggestionWithCurrentSuggestion:userQueryString:completion:attributes:scores:options:", v14, v16, v21, v9, v8, MEMORY[0x24BDBD1B8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x24BEB0318];
      -[SPKQuery queryContext](self, "queryContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "buildResultWithSpotlightSuggestion:queryContext:", v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKey:](self->_completionSuggestions, "setObject:forKey:", v20, v21);
    }

  }
}

- (void)foundCompletions:(id)a3
{
  os_unfair_lock_s *p_suggestionsLock;
  BOOL v5;
  NSMutableArray *suggestionResults;
  void *v7;

  p_suggestionsLock = &self->_suggestionsLock;
  os_unfair_lock_lock(&self->_suggestionsLock);
  v5 = (*((_BYTE *)self + 384) & 1) != 0
    || -[NSMutableDictionary count](self->_completionSuggestions, "count")
    || -[NSMutableArray count](self->_suggestionResults, "count") != 0;
  *((_BYTE *)self + 384) = *((_BYTE *)self + 384) & 0xFE | v5;
  suggestionResults = self->_suggestionResults;
  -[NSMutableDictionary allValues](self->_completionSuggestions, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](suggestionResults, "addObjectsFromArray:", v7);

  os_unfair_lock_unlock(p_suggestionsLock);
}

- (void)priorityGatherEnded
{
  __assert_rtn("-[SPCSSearchQuery priorityGatherEnded]", "SPCSSearchQuery.mm", 3338, "_dispatchQueue");
}

uint64_t __38__SPCSSearchQuery_priorityGatherEnded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendResponseWithKind:", 3);
}

- (void)completed:(id)a3
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  id v7;

  v7 = a3;
  {
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v5 = timeoutTimer;
      dispatch_source_cancel(v5);
      v6 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
  }
  -[SPCSSearchQuery sendResponseWithKind:](self, "sendResponseWithKind:", 4);

}

- (int64_t)maxCount
{
  return self->_maxCount;
}

- (void)setMaxCount:(int64_t)a3
{
  self->_maxCount = a3;
}

- (int64_t)contentFilters
{
  return self->_contentFilters;
}

- (void)setContentFilters:(int64_t)a3
{
  self->_contentFilters = a3;
}

- (PRSRankingItemRanker)itemRanker
{
  return self->_itemRanker;
}

- (void)setItemRanker:(id)a3
{
  objc_storeStrong((id *)&self->_itemRanker, a3);
}

- (BOOL)isCJK
{
  return *((_BYTE *)self + 448) & 1;
}

- (void)setIsCJK:(BOOL)a3
{
  *((_BYTE *)self + 448) = *((_BYTE *)self + 448) & 0xFE | a3;
}

- (BOOL)isPeopleSearch
{
  return self->_isPeopleSearch;
}

- (void)setIsPeopleSearch:(BOOL)a3
{
  self->_isPeopleSearch = a3;
}

- (BOOL)isPhotosSearch
{
  return self->_isPhotosSearch;
}

- (void)setIsPhotosSearch:(BOOL)a3
{
  self->_isPhotosSearch = a3;
}

- (BOOL)parsecAvailable
{
  return self->_parsecAvailable;
}

- (void)setParsecAvailable:(BOOL)a3
{
  self->_parsecAvailable = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (unint64_t)previousQueryKind
{
  return self->_previousQueryKind;
}

- (void)setPreviousQueryKind:(unint64_t)a3
{
  self->_previousQueryKind = a3;
}

- (PRSRankingConfiguration)rankingInfo
{
  return (PRSRankingConfiguration *)objc_getProperty(self, a2, 536, 1);
}

- (void)setRankingInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (void).cxx_destruct
{
  uint64_t *begin;
  uint64_t *end;
  void *v5;

  objc_storeStrong((id *)&self->_rankingInfo, 0);
  objc_storeStrong((id *)&self->_itemRanker, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_renderEngagementCounts, 0);
  objc_storeStrong((id *)&self->_disabledAppSet, 0);
  objc_storeStrong((id *)&self->_resultAttrIndexSet, 0);
  objc_storeStrong((id *)&self->_resultAttrs, 0);
  objc_storeStrong((id *)&self->_suggestionResults, 0);
  objc_storeStrong((id *)&self->_completionSuggestions, 0);

  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::~__hash_table((uint64_t)&self->_bundleIdToResultsMap);
  begin = (uint64_t *)self->_resultHeaps.__begin_;
  if (begin)
  {
    end = (uint64_t *)self->_resultHeaps.__end_;
    v5 = self->_resultHeaps.__begin_;
    if (end != begin)
    {
      do
      {
        end -= 3;
      }
      while (end != begin);
      v5 = self->_resultHeaps.__begin_;
    }
    self->_resultHeaps.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_foundBundleIDs, 0);
  objc_storeStrong((id *)&self->_csQuery, 0);
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_storeStrong((id *)&self->_rankQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (id).cxx_construct
{
  BundleIdToResultMap *p_bundleIdToResultsMap;
  uint64_t v4;
  SFMutableResultSection *syndicatedLinkSection;
  uint64_t v6;
  SFMutableResultSection *syndicatedPhotosInAppsSection;
  uint64_t v8;
  SFMutableResultSection *syndicatedPhotosInMessagesSection;
  uint64_t v10;
  SFMutableResultSection *syndicatedPhotosInNotesSection;
  uint64_t v12;
  SFMutableResultSection *syndicatedPhotosInFilesSection;
  uint64_t v14;
  SFMutableResultSection *syndicatedGeneralPhotosSection;
  uint64_t v16;
  SFMutableResultSection *contactResultsSection;
  uint64_t v18;
  SFMutableResultSection *peopleResultsSection;
  uint64_t v20;
  SFMutableResultSection *photosSection;

  self->_resultHeaps.__end_ = 0;
  self->_resultHeaps.__end_cap_.__value_ = 0;
  self->_resultHeaps.__begin_ = 0;
  self->_resultRankTables.__end_ = 0;
  self->_resultRankTables.__end_cap_.__value_ = 0;
  self->_resultRankTables.__begin_ = 0;
  self->_resultRecencyTables.__end_ = 0;
  self->_resultRecencyTables.__end_cap_.__value_ = 0;
  self->_resultRecencyTables.__begin_ = 0;
  p_bundleIdToResultsMap = &self->_bundleIdToResultsMap;
  self->_bundleIdToResultsMap.map.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_bundleIdToResultsMap.map.__table_.__p1_.__value_.__next_ = 0u;
  self->_bundleIdToResultsMap.map.__table_.__p3_.__value_ = 1.0;
  self->_bundleIdToResultsMap.photosSection = 0;
  *(_OWORD *)&self->_bundleIdToResultsMap.contactResultsSection = 0u;
  *(_OWORD *)&self->_bundleIdToResultsMap.syndicatedPhotosInFilesSection = 0u;
  *(_OWORD *)&self->_bundleIdToResultsMap.syndicatedPhotosInMessagesSection = 0u;
  *(_OWORD *)&self->_bundleIdToResultsMap.syndicatedLinkSection = 0u;
  v4 = objc_claimAutoreleasedReturnValue();
  syndicatedLinkSection = p_bundleIdToResultsMap->syndicatedLinkSection;
  p_bundleIdToResultsMap->syndicatedLinkSection = (SFMutableResultSection *)v4;

  v6 = objc_claimAutoreleasedReturnValue();
  syndicatedPhotosInAppsSection = p_bundleIdToResultsMap->syndicatedPhotosInAppsSection;
  p_bundleIdToResultsMap->syndicatedPhotosInAppsSection = (SFMutableResultSection *)v6;

  v8 = objc_claimAutoreleasedReturnValue();
  syndicatedPhotosInMessagesSection = p_bundleIdToResultsMap->syndicatedPhotosInMessagesSection;
  p_bundleIdToResultsMap->syndicatedPhotosInMessagesSection = (SFMutableResultSection *)v8;

  v10 = objc_claimAutoreleasedReturnValue();
  syndicatedPhotosInNotesSection = p_bundleIdToResultsMap->syndicatedPhotosInNotesSection;
  p_bundleIdToResultsMap->syndicatedPhotosInNotesSection = (SFMutableResultSection *)v10;

  v12 = objc_claimAutoreleasedReturnValue();
  syndicatedPhotosInFilesSection = p_bundleIdToResultsMap->syndicatedPhotosInFilesSection;
  p_bundleIdToResultsMap->syndicatedPhotosInFilesSection = (SFMutableResultSection *)v12;

  v14 = objc_claimAutoreleasedReturnValue();
  syndicatedGeneralPhotosSection = p_bundleIdToResultsMap->syndicatedGeneralPhotosSection;
  p_bundleIdToResultsMap->syndicatedGeneralPhotosSection = (SFMutableResultSection *)v14;

  v16 = objc_claimAutoreleasedReturnValue();
  contactResultsSection = p_bundleIdToResultsMap->contactResultsSection;
  p_bundleIdToResultsMap->contactResultsSection = (SFMutableResultSection *)v16;

  v18 = objc_claimAutoreleasedReturnValue();
  peopleResultsSection = p_bundleIdToResultsMap->peopleResultsSection;
  p_bundleIdToResultsMap->peopleResultsSection = (SFMutableResultSection *)v18;

  v20 = objc_claimAutoreleasedReturnValue();
  photosSection = p_bundleIdToResultsMap->photosSection;
  p_bundleIdToResultsMap->photosSection = (SFMutableResultSection *)v20;

  return self;
}

void __29__SPCSSearchQuery_initialize__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_0(&dword_2279CC000, a3, (uint64_t)a3, "got error fetching me card info: %ld", (uint8_t *)a1);
}

void __27__SPCSSearchQuery_activate__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2279CC000, a2, a3, "Error loading home screen config cache: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
